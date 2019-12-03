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
#include<TopoDS_module.hxx>
#include<TopOpeBRepTool_module.hxx>
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
%import TopoDS.i
%import TopOpeBRepTool.i
%import Geom2d.i
%import TopTools.i
%import gp.i
%import TColStd.i
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
%template(TopOpeBRepDS_IndexedDataMapOfVertexPoint) NCollection_IndexedDataMap <TopoDS_Shape , TopOpeBRepDS_Point , TopTools_ShapeMapHasher>;
%template(TopOpeBRepDS_MapOfSurface) NCollection_DataMap <Standard_Integer , TopOpeBRepDS_SurfaceData , TColStd_MapIntegerHasher>;
%template(TopOpeBRepDS_MapOfShapeData) NCollection_IndexedDataMap <TopoDS_Shape , TopOpeBRepDS_ShapeData , TopTools_ShapeMapHasher>;
%template(TopOpeBRepDS_DataMapOfIntegerListOfInterference) NCollection_DataMap <Standard_Integer , TopOpeBRepDS_ListOfInterference , TColStd_MapIntegerHasher>;
%template(TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State) NCollection_DataMap <TopoDS_Shape , TopOpeBRepDS_ListOfShapeOn1State , TopTools_ShapeMapHasher>;
%template(TopOpeBRepDS_DataMapOfCheckStatus) NCollection_DataMap <Standard_Integer , TopOpeBRepDS_CheckStatus , TColStd_MapIntegerHasher>;
%template(TopOpeBRepDS_DataMapOfShapeState) NCollection_DataMap <TopoDS_Shape , TopAbs_State , TopTools_ShapeMapHasher>;
%template(TopOpeBRepDS_IndexedDataMapOfShapeWithState) NCollection_IndexedDataMap <TopoDS_Shape , TopOpeBRepDS_ShapeWithState , TopTools_ShapeMapHasher>;
%template(TopOpeBRepDS_DataMapOfInterferenceListOfInterference) NCollection_DataMap <opencascade::handle <TopOpeBRepDS_Interference>, TopOpeBRepDS_ListOfInterference , TColStd_MapTransientHasher>;
%template(TopOpeBRepDS_ListOfInterference) NCollection_List <opencascade::handle <TopOpeBRepDS_Interference>>;
%template(TopOpeBRepDS_ListIteratorOfListOfInterference) NCollection_TListIterator<opencascade::handle<TopOpeBRepDS_Interference>>;
%template(TopOpeBRepDS_ShapeSurface) NCollection_DataMap <TopoDS_Shape , opencascade::handle <Geom_Surface>, TopTools_ShapeMapHasher>;
%template(TopOpeBRepDS_DataMapOfInterferenceShape) NCollection_DataMap <opencascade::handle <TopOpeBRepDS_Interference>, TopoDS_Shape , TColStd_MapTransientHasher>;
%template(TopOpeBRepDS_Array1OfDataMapOfIntegerListOfInterference) NCollection_Array1 <TopOpeBRepDS_DataMapOfIntegerListOfInterference>;

%extend NCollection_Array1 <TopOpeBRepDS_DataMapOfIntegerListOfInterference> {
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
%template(TopOpeBRepDS_MapOfIntegerShapeData) NCollection_DataMap <Standard_Integer , TopOpeBRepDS_ShapeData , TColStd_MapIntegerHasher>;
%template(TopOpeBRepDS_MapOfPoint) NCollection_DataMap <Standard_Integer , TopOpeBRepDS_PointData , TColStd_MapIntegerHasher>;
%template(TopOpeBRepDS_MapOfCurve) NCollection_DataMap <Standard_Integer , TopOpeBRepDS_CurveData , TColStd_MapIntegerHasher>;
%template(TopOpeBRepDS_DoubleMapOfIntegerShape) NCollection_DoubleMap <Standard_Integer , TopoDS_Shape , TColStd_MapIntegerHasher , TopTools_ShapeMapHasher>;
/* end templates declaration */

/* typedefs */
typedef NCollection_IndexedDataMap <TopoDS_Shape , TopOpeBRepDS_Point , TopTools_ShapeMapHasher> TopOpeBRepDS_IndexedDataMapOfVertexPoint;
typedef NCollection_DataMap <Standard_Integer , TopOpeBRepDS_SurfaceData , TColStd_MapIntegerHasher> TopOpeBRepDS_MapOfSurface;
typedef NCollection_DataMap <Standard_Integer , TopOpeBRepDS_SurfaceData , TColStd_MapIntegerHasher>::Iterator TopOpeBRepDS_DataMapIteratorOfMapOfSurface;
typedef NCollection_IndexedDataMap <TopoDS_Shape , TopOpeBRepDS_ShapeData , TopTools_ShapeMapHasher> TopOpeBRepDS_MapOfShapeData;
typedef NCollection_DataMap <Standard_Integer , TopOpeBRepDS_ListOfInterference , TColStd_MapIntegerHasher> TopOpeBRepDS_DataMapOfIntegerListOfInterference;
typedef NCollection_DataMap <Standard_Integer , TopOpeBRepDS_ListOfInterference , TColStd_MapIntegerHasher>::Iterator TopOpeBRepDS_DataMapIteratorOfDataMapOfIntegerListOfInterference;
typedef NCollection_DataMap <TopoDS_Shape , TopOpeBRepDS_ListOfShapeOn1State , TopTools_ShapeMapHasher> TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State;
typedef NCollection_DataMap <TopoDS_Shape , TopOpeBRepDS_ListOfShapeOn1State , TopTools_ShapeMapHasher>::Iterator TopOpeBRepDS_DataMapIteratorOfDataMapOfShapeListOfShapeOn1State;
typedef NCollection_DataMap <Standard_Integer , TopOpeBRepDS_CheckStatus , TColStd_MapIntegerHasher> TopOpeBRepDS_DataMapOfCheckStatus;
typedef NCollection_DataMap <Standard_Integer , TopOpeBRepDS_CheckStatus , TColStd_MapIntegerHasher>::Iterator TopOpeBRepDS_DataMapIteratorOfDataMapOfCheckStatus;
typedef NCollection_DataMap <TopoDS_Shape , TopAbs_State , TopTools_ShapeMapHasher> TopOpeBRepDS_DataMapOfShapeState;
typedef NCollection_DataMap <TopoDS_Shape , TopAbs_State , TopTools_ShapeMapHasher>::Iterator TopOpeBRepDS_DataMapIteratorOfDataMapOfShapeState;
typedef NCollection_IndexedDataMap <TopoDS_Shape , TopOpeBRepDS_ShapeWithState , TopTools_ShapeMapHasher> TopOpeBRepDS_IndexedDataMapOfShapeWithState;
typedef NCollection_DataMap <opencascade::handle <TopOpeBRepDS_Interference>, TopOpeBRepDS_ListOfInterference , TColStd_MapTransientHasher> TopOpeBRepDS_DataMapOfInterferenceListOfInterference;
typedef NCollection_DataMap <opencascade::handle <TopOpeBRepDS_Interference>, TopOpeBRepDS_ListOfInterference , TColStd_MapTransientHasher>::Iterator TopOpeBRepDS_DataMapIteratorOfDataMapOfInterferenceListOfInterference;
typedef NCollection_List <opencascade::handle <TopOpeBRepDS_Interference>> TopOpeBRepDS_ListOfInterference;
typedef NCollection_List <opencascade::handle <TopOpeBRepDS_Interference>>::Iterator TopOpeBRepDS_ListIteratorOfListOfInterference;
typedef NCollection_DataMap <TopoDS_Shape , opencascade::handle <Geom_Surface>, TopTools_ShapeMapHasher> TopOpeBRepDS_ShapeSurface;
typedef NCollection_DataMap <TopoDS_Shape , opencascade::handle <Geom_Surface>, TopTools_ShapeMapHasher>::Iterator TopOpeBRepDS_DataMapIteratorOfShapeSurface;
typedef NCollection_DataMap <opencascade::handle <TopOpeBRepDS_Interference>, TopoDS_Shape , TColStd_MapTransientHasher> TopOpeBRepDS_DataMapOfInterferenceShape;
typedef NCollection_DataMap <opencascade::handle <TopOpeBRepDS_Interference>, TopoDS_Shape , TColStd_MapTransientHasher>::Iterator TopOpeBRepDS_DataMapIteratorOfDataMapOfInterferenceShape;
typedef NCollection_Array1 <TopOpeBRepDS_DataMapOfIntegerListOfInterference> TopOpeBRepDS_Array1OfDataMapOfIntegerListOfInterference;
typedef NCollection_DataMap <Standard_Integer , TopOpeBRepDS_ShapeData , TColStd_MapIntegerHasher> TopOpeBRepDS_MapOfIntegerShapeData;
typedef NCollection_DataMap <Standard_Integer , TopOpeBRepDS_ShapeData , TColStd_MapIntegerHasher>::Iterator TopOpeBRepDS_DataMapIteratorOfMapOfIntegerShapeData;
typedef NCollection_DataMap <Standard_Integer , TopOpeBRepDS_PointData , TColStd_MapIntegerHasher> TopOpeBRepDS_MapOfPoint;
typedef NCollection_DataMap <Standard_Integer , TopOpeBRepDS_PointData , TColStd_MapIntegerHasher>::Iterator TopOpeBRepDS_DataMapIteratorOfMapOfPoint;
typedef NCollection_DataMap <Standard_Integer , TopOpeBRepDS_CurveData , TColStd_MapIntegerHasher> TopOpeBRepDS_MapOfCurve;
typedef NCollection_DataMap <Standard_Integer , TopOpeBRepDS_CurveData , TColStd_MapIntegerHasher>::Iterator TopOpeBRepDS_DataMapIteratorOfMapOfCurve;
typedef TopOpeBRepDS_DataStructure * TopOpeBRepDS_PDataStructure;
typedef NCollection_DoubleMap <Standard_Integer , TopoDS_Shape , TColStd_MapIntegerHasher , TopTools_ShapeMapHasher> TopOpeBRepDS_DoubleMapOfIntegerShape;
typedef NCollection_DoubleMap <Standard_Integer , TopoDS_Shape , TColStd_MapIntegerHasher , TopTools_ShapeMapHasher>::Iterator TopOpeBRepDS_DoubleMapIteratorOfDoubleMapOfIntegerShape;
/* end typedefs declaration */

/*********************
* class TopOpeBRepDS *
*********************/
%rename(topopebrepds) TopOpeBRepDS;
class TopOpeBRepDS {
	public:
		/****************** IsGeometry ******************/
		%feature("compactdefaultargs") IsGeometry;
		%feature("autodoc", ":param K:
	:type K: TopOpeBRepDS_Kind
	:rtype: bool") IsGeometry;
		static Standard_Boolean IsGeometry (const TopOpeBRepDS_Kind K);

		/****************** IsTopology ******************/
		%feature("compactdefaultargs") IsTopology;
		%feature("autodoc", ":param K:
	:type K: TopOpeBRepDS_Kind
	:rtype: bool") IsTopology;
		static Standard_Boolean IsTopology (const TopOpeBRepDS_Kind K);

		/****************** KindToShape ******************/
		%feature("compactdefaultargs") KindToShape;
		%feature("autodoc", ":param K:
	:type K: TopOpeBRepDS_Kind
	:rtype: TopAbs_ShapeEnum") KindToShape;
		static TopAbs_ShapeEnum KindToShape (const TopOpeBRepDS_Kind K);

		/****************** Print ******************/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", ":param S:
	:type S: TopAbs_State
	:param OS:
	:type OS: Standard_OStream
	:rtype: Standard_OStream") Print;
		static Standard_OStream & Print (const TopAbs_State S,Standard_OStream & OS);

		/****************** Print ******************/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", ":param K:
	:type K: TopOpeBRepDS_Kind
	:param S:
	:type S: Standard_OStream
	:rtype: Standard_OStream") Print;
		static Standard_OStream & Print (const TopOpeBRepDS_Kind K,Standard_OStream & S);

		/****************** Print ******************/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", ":param K:
	:type K: TopOpeBRepDS_Kind
	:param I:
	:type I: int
	:param S:
	:type S: Standard_OStream
	:param B: default value is ""
	:type B: TCollection_AsciiString
	:param A: default value is ""
	:type A: TCollection_AsciiString
	:rtype: Standard_OStream") Print;
		static Standard_OStream & Print (const TopOpeBRepDS_Kind K,const Standard_Integer I,Standard_OStream & S,const TCollection_AsciiString & B = "",const TCollection_AsciiString & A = "");

		/****************** Print ******************/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", ":param T:
	:type T: TopAbs_ShapeEnum
	:param I:
	:type I: int
	:param S:
	:type S: Standard_OStream
	:rtype: Standard_OStream") Print;
		static Standard_OStream & Print (const TopAbs_ShapeEnum T,const Standard_Integer I,Standard_OStream & S);

		/****************** Print ******************/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", ":param C:
	:type C: TopOpeBRepDS_Config
	:param S:
	:type S: Standard_OStream
	:rtype: Standard_OStream") Print;
		static Standard_OStream & Print (const TopOpeBRepDS_Config C,Standard_OStream & S);

		/****************** SPrint ******************/
		%feature("compactdefaultargs") SPrint;
		%feature("autodoc", "* IN OU ON UN
	:param S:
	:type S: TopAbs_State
	:rtype: TCollection_AsciiString") SPrint;
		static TCollection_AsciiString SPrint (const TopAbs_State S);

		/****************** SPrint ******************/
		%feature("compactdefaultargs") SPrint;
		%feature("autodoc", "* <K>
	:param K:
	:type K: TopOpeBRepDS_Kind
	:rtype: TCollection_AsciiString") SPrint;
		static TCollection_AsciiString SPrint (const TopOpeBRepDS_Kind K);

		/****************** SPrint ******************/
		%feature("compactdefaultargs") SPrint;
		%feature("autodoc", "* S1(<K>,<I>)S2
	:param K:
	:type K: TopOpeBRepDS_Kind
	:param I:
	:type I: int
	:param B: default value is ""
	:type B: TCollection_AsciiString
	:param A: default value is ""
	:type A: TCollection_AsciiString
	:rtype: TCollection_AsciiString") SPrint;
		static TCollection_AsciiString SPrint (const TopOpeBRepDS_Kind K,const Standard_Integer I,const TCollection_AsciiString & B = "",const TCollection_AsciiString & A = "");

		/****************** SPrint ******************/
		%feature("compactdefaultargs") SPrint;
		%feature("autodoc", ":param T:
	:type T: TopAbs_ShapeEnum
	:rtype: TCollection_AsciiString") SPrint;
		static TCollection_AsciiString SPrint (const TopAbs_ShapeEnum T);

		/****************** SPrint ******************/
		%feature("compactdefaultargs") SPrint;
		%feature("autodoc", "* (<T>,<I>)
	:param T:
	:type T: TopAbs_ShapeEnum
	:param I:
	:type I: int
	:rtype: TCollection_AsciiString") SPrint;
		static TCollection_AsciiString SPrint (const TopAbs_ShapeEnum T,const Standard_Integer I);

		/****************** SPrint ******************/
		%feature("compactdefaultargs") SPrint;
		%feature("autodoc", ":param O:
	:type O: TopAbs_Orientation
	:rtype: TCollection_AsciiString") SPrint;
		static TCollection_AsciiString SPrint (const TopAbs_Orientation O);

		/****************** SPrint ******************/
		%feature("compactdefaultargs") SPrint;
		%feature("autodoc", ":param C:
	:type C: TopOpeBRepDS_Config
	:rtype: TCollection_AsciiString") SPrint;
		static TCollection_AsciiString SPrint (const TopOpeBRepDS_Config C);

		/****************** ShapeToKind ******************/
		%feature("compactdefaultargs") ShapeToKind;
		%feature("autodoc", ":param S:
	:type S: TopAbs_ShapeEnum
	:rtype: TopOpeBRepDS_Kind") ShapeToKind;
		static TopOpeBRepDS_Kind ShapeToKind (const TopAbs_ShapeEnum S);

};


%extend TopOpeBRepDS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class TopOpeBRepDS_Association *
*********************************/
%nodefaultctor TopOpeBRepDS_Association;
class TopOpeBRepDS_Association : public Standard_Transient {
	public:
		/****************** AreAssociated ******************/
		%feature("compactdefaultargs") AreAssociated;
		%feature("autodoc", ":param I:
	:type I: TopOpeBRepDS_Interference
	:param K:
	:type K: TopOpeBRepDS_Interference
	:rtype: bool") AreAssociated;
		Standard_Boolean AreAssociated (const opencascade::handle<TopOpeBRepDS_Interference> & I,const opencascade::handle<TopOpeBRepDS_Interference> & K);

		/****************** Associate ******************/
		%feature("compactdefaultargs") Associate;
		%feature("autodoc", ":param I:
	:type I: TopOpeBRepDS_Interference
	:param K:
	:type K: TopOpeBRepDS_Interference
	:rtype: None") Associate;
		void Associate (const opencascade::handle<TopOpeBRepDS_Interference> & I,const opencascade::handle<TopOpeBRepDS_Interference> & K);

		/****************** Associate ******************/
		%feature("compactdefaultargs") Associate;
		%feature("autodoc", ":param I:
	:type I: TopOpeBRepDS_Interference
	:param LI:
	:type LI: TopOpeBRepDS_ListOfInterference
	:rtype: None") Associate;
		void Associate (const opencascade::handle<TopOpeBRepDS_Interference> & I,const TopOpeBRepDS_ListOfInterference & LI);

		/****************** Associated ******************/
		%feature("compactdefaultargs") Associated;
		%feature("autodoc", ":param I:
	:type I: TopOpeBRepDS_Interference
	:rtype: TopOpeBRepDS_ListOfInterference") Associated;
		TopOpeBRepDS_ListOfInterference & Associated (const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** HasAssociation ******************/
		%feature("compactdefaultargs") HasAssociation;
		%feature("autodoc", ":param I:
	:type I: TopOpeBRepDS_Interference
	:rtype: bool") HasAssociation;
		Standard_Boolean HasAssociation (const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** TopOpeBRepDS_Association ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_Association;
		%feature("autodoc", ":rtype: None") TopOpeBRepDS_Association;
		 TopOpeBRepDS_Association ();

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
%nodefaultctor TopOpeBRepDS_BuildTool;
class TopOpeBRepDS_BuildTool {
	public:
		/****************** AddEdgeVertex ******************/
		%feature("compactdefaultargs") AddEdgeVertex;
		%feature("autodoc", ":param Ein:
	:type Ein: TopoDS_Shape
	:param Eou:
	:type Eou: TopoDS_Shape
	:param V:
	:type V: TopoDS_Shape
	:rtype: None") AddEdgeVertex;
		void AddEdgeVertex (const TopoDS_Shape & Ein,TopoDS_Shape & Eou,const TopoDS_Shape & V);

		/****************** AddEdgeVertex ******************/
		%feature("compactdefaultargs") AddEdgeVertex;
		%feature("autodoc", ":param E:
	:type E: TopoDS_Shape
	:param V:
	:type V: TopoDS_Shape
	:rtype: None") AddEdgeVertex;
		void AddEdgeVertex (TopoDS_Shape & E,const TopoDS_Shape & V);

		/****************** AddFaceWire ******************/
		%feature("compactdefaultargs") AddFaceWire;
		%feature("autodoc", ":param F:
	:type F: TopoDS_Shape
	:param W:
	:type W: TopoDS_Shape
	:rtype: None") AddFaceWire;
		void AddFaceWire (TopoDS_Shape & F,const TopoDS_Shape & W);

		/****************** AddShellFace ******************/
		%feature("compactdefaultargs") AddShellFace;
		%feature("autodoc", ":param Sh:
	:type Sh: TopoDS_Shape
	:param F:
	:type F: TopoDS_Shape
	:rtype: None") AddShellFace;
		void AddShellFace (TopoDS_Shape & Sh,const TopoDS_Shape & F);

		/****************** AddSolidShell ******************/
		%feature("compactdefaultargs") AddSolidShell;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param Sh:
	:type Sh: TopoDS_Shape
	:rtype: None") AddSolidShell;
		void AddSolidShell (TopoDS_Shape & S,const TopoDS_Shape & Sh);

		/****************** AddWireEdge ******************/
		%feature("compactdefaultargs") AddWireEdge;
		%feature("autodoc", ":param W:
	:type W: TopoDS_Shape
	:param E:
	:type E: TopoDS_Shape
	:rtype: None") AddWireEdge;
		void AddWireEdge (TopoDS_Shape & W,const TopoDS_Shape & E);

		/****************** ApproxCurves ******************/
		%feature("compactdefaultargs") ApproxCurves;
		%feature("autodoc", ":param C:
	:type C: TopOpeBRepDS_Curve
	:param E:
	:type E: TopoDS_Edge
	:param inewC:
	:type inewC: int
	:param HDS:
	:type HDS: TopOpeBRepDS_HDataStructure
	:rtype: None") ApproxCurves;
		void ApproxCurves (const TopOpeBRepDS_Curve & C,TopoDS_Edge & E,Standard_Integer &OutValue,const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

		/****************** Approximation ******************/
		%feature("compactdefaultargs") Approximation;
		%feature("autodoc", ":rtype: bool") Approximation;
		Standard_Boolean Approximation ();

		/****************** ChangeGeomTool ******************/
		%feature("compactdefaultargs") ChangeGeomTool;
		%feature("autodoc", ":rtype: TopOpeBRepTool_GeomTool") ChangeGeomTool;
		TopOpeBRepTool_GeomTool & ChangeGeomTool ();

		/****************** Closed ******************/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param B:
	:type B: bool
	:rtype: None") Closed;
		void Closed (TopoDS_Shape & S,const Standard_Boolean B);

		/****************** ComputePCurves ******************/
		%feature("compactdefaultargs") ComputePCurves;
		%feature("autodoc", ":param C:
	:type C: TopOpeBRepDS_Curve
	:param E:
	:type E: TopoDS_Edge
	:param newC:
	:type newC: TopOpeBRepDS_Curve
	:param CompPC1:
	:type CompPC1: bool
	:param CompPC2:
	:type CompPC2: bool
	:param CompC3D:
	:type CompC3D: bool
	:rtype: None") ComputePCurves;
		void ComputePCurves (const TopOpeBRepDS_Curve & C,TopoDS_Edge & E,TopOpeBRepDS_Curve & newC,const Standard_Boolean CompPC1,const Standard_Boolean CompPC2,const Standard_Boolean CompC3D);

		/****************** CopyEdge ******************/
		%feature("compactdefaultargs") CopyEdge;
		%feature("autodoc", "* Make an edge <Eou> with the curve of the edge <Ein>
	:param Ein:
	:type Ein: TopoDS_Shape
	:param Eou:
	:type Eou: TopoDS_Shape
	:rtype: None") CopyEdge;
		void CopyEdge (const TopoDS_Shape & Ein,TopoDS_Shape & Eou);

		/****************** CopyFace ******************/
		%feature("compactdefaultargs") CopyFace;
		%feature("autodoc", "* Make a face <Fou> with the surface of the face <Fin>
	:param Fin:
	:type Fin: TopoDS_Shape
	:param Fou:
	:type Fou: TopoDS_Shape
	:rtype: None") CopyFace;
		void CopyFace (const TopoDS_Shape & Fin,TopoDS_Shape & Fou);

		/****************** Curve3D ******************/
		%feature("compactdefaultargs") Curve3D;
		%feature("autodoc", "* Sets the curve <C> for the edge <E>
	:param E:
	:type E: TopoDS_Shape
	:param C:
	:type C: Geom_Curve
	:param Tol:
	:type Tol: float
	:rtype: None") Curve3D;
		void Curve3D (TopoDS_Shape & E,const opencascade::handle<Geom_Curve> & C,const Standard_Real Tol);

		/****************** GetGeomTool ******************/
		%feature("compactdefaultargs") GetGeomTool;
		%feature("autodoc", ":rtype: TopOpeBRepTool_GeomTool") GetGeomTool;
		const TopOpeBRepTool_GeomTool & GetGeomTool ();

		/****************** GetOrientedEdgeVertices ******************/
		%feature("compactdefaultargs") GetOrientedEdgeVertices;
		%feature("autodoc", ":param E:
	:type E: TopoDS_Edge
	:param Vmin:
	:type Vmin: TopoDS_Vertex
	:param Vmax:
	:type Vmax: TopoDS_Vertex
	:param Parmin:
	:type Parmin: float
	:param Parmax:
	:type Parmax: float
	:rtype: None") GetOrientedEdgeVertices;
		void GetOrientedEdgeVertices (TopoDS_Edge & E,TopoDS_Vertex & Vmin,TopoDS_Vertex & Vmax,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** MakeEdge ******************/
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", ":param E:
	:type E: TopoDS_Shape
	:param C:
	:type C: TopOpeBRepDS_Curve
	:rtype: None") MakeEdge;
		void MakeEdge (TopoDS_Shape & E,const TopOpeBRepDS_Curve & C);

		/****************** MakeEdge ******************/
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", ":param E:
	:type E: TopoDS_Shape
	:param C:
	:type C: TopOpeBRepDS_Curve
	:param DS:
	:type DS: TopOpeBRepDS_DataStructure
	:rtype: None") MakeEdge;
		void MakeEdge (TopoDS_Shape & E,const TopOpeBRepDS_Curve & C,const TopOpeBRepDS_DataStructure & DS);

		/****************** MakeEdge ******************/
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", ":param E:
	:type E: TopoDS_Shape
	:param C:
	:type C: Geom_Curve
	:param Tol:
	:type Tol: float
	:rtype: None") MakeEdge;
		void MakeEdge (TopoDS_Shape & E,const opencascade::handle<Geom_Curve> & C,const Standard_Real Tol);

		/****************** MakeEdge ******************/
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", ":param E:
	:type E: TopoDS_Shape
	:rtype: None") MakeEdge;
		void MakeEdge (TopoDS_Shape & E);

		/****************** MakeFace ******************/
		%feature("compactdefaultargs") MakeFace;
		%feature("autodoc", ":param F:
	:type F: TopoDS_Shape
	:param S:
	:type S: TopOpeBRepDS_Surface
	:rtype: None") MakeFace;
		void MakeFace (TopoDS_Shape & F,const TopOpeBRepDS_Surface & S);

		/****************** MakeShell ******************/
		%feature("compactdefaultargs") MakeShell;
		%feature("autodoc", ":param Sh:
	:type Sh: TopoDS_Shape
	:rtype: None") MakeShell;
		void MakeShell (TopoDS_Shape & Sh);

		/****************** MakeSolid ******************/
		%feature("compactdefaultargs") MakeSolid;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: None") MakeSolid;
		void MakeSolid (TopoDS_Shape & S);

		/****************** MakeVertex ******************/
		%feature("compactdefaultargs") MakeVertex;
		%feature("autodoc", ":param V:
	:type V: TopoDS_Shape
	:param P:
	:type P: TopOpeBRepDS_Point
	:rtype: None") MakeVertex;
		void MakeVertex (TopoDS_Shape & V,const TopOpeBRepDS_Point & P);

		/****************** MakeWire ******************/
		%feature("compactdefaultargs") MakeWire;
		%feature("autodoc", ":param W:
	:type W: TopoDS_Shape
	:rtype: None") MakeWire;
		void MakeWire (TopoDS_Shape & W);

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param O:
	:type O: TopAbs_Orientation
	:rtype: None") Orientation;
		void Orientation (TopoDS_Shape & S,const TopAbs_Orientation O);

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: TopAbs_Orientation") Orientation;
		TopAbs_Orientation Orientation (const TopoDS_Shape & S);

		/****************** OverWrite ******************/
		%feature("compactdefaultargs") OverWrite;
		%feature("autodoc", ":rtype: bool") OverWrite;
		Standard_Boolean OverWrite ();

		/****************** OverWrite ******************/
		%feature("compactdefaultargs") OverWrite;
		%feature("autodoc", ":param O:
	:type O: bool
	:rtype: None") OverWrite;
		void OverWrite (const Standard_Boolean O);

		/****************** PCurve ******************/
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", "* Sets the pcurve <C> for the edge <E> on the face <F>. If OverWrite is True the old pcurve if there is one is overwritten, else the two pcurves are set.
	:param F:
	:type F: TopoDS_Shape
	:param E:
	:type E: TopoDS_Shape
	:param C:
	:type C: Geom2d_Curve
	:rtype: None") PCurve;
		void PCurve (TopoDS_Shape & F,TopoDS_Shape & E,const opencascade::handle<Geom2d_Curve> & C);

		/****************** PCurve ******************/
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", ":param F:
	:type F: TopoDS_Shape
	:param E:
	:type E: TopoDS_Shape
	:param CDS:
	:type CDS: TopOpeBRepDS_Curve
	:param C:
	:type C: Geom2d_Curve
	:rtype: None") PCurve;
		void PCurve (TopoDS_Shape & F,TopoDS_Shape & E,const TopOpeBRepDS_Curve & CDS,const opencascade::handle<Geom2d_Curve> & C);

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "* Sets the parameter <P> for the vertex <V> on the edge <E>.
	:param E:
	:type E: TopoDS_Shape
	:param V:
	:type V: TopoDS_Shape
	:param P:
	:type P: float
	:rtype: None") Parameter;
		void Parameter (const TopoDS_Shape & E,const TopoDS_Shape & V,const Standard_Real P);

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "* Compute the parameter of the vertex <V>, supported by the edge <E>, on the curve <C>.
	:param C:
	:type C: TopOpeBRepDS_Curve
	:param E:
	:type E: TopoDS_Shape
	:param V:
	:type V: TopoDS_Shape
	:rtype: None") Parameter;
		void Parameter (const TopOpeBRepDS_Curve & C,TopoDS_Shape & E,TopoDS_Shape & V);

		/****************** PutPCurves ******************/
		%feature("compactdefaultargs") PutPCurves;
		%feature("autodoc", ":param newC:
	:type newC: TopOpeBRepDS_Curve
	:param E:
	:type E: TopoDS_Edge
	:param CompPC1:
	:type CompPC1: bool
	:param CompPC2:
	:type CompPC2: bool
	:rtype: None") PutPCurves;
		void PutPCurves (const TopOpeBRepDS_Curve & newC,TopoDS_Edge & E,const Standard_Boolean CompPC1,const Standard_Boolean CompPC2);

		/****************** Range ******************/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "* Sets the range of edge <E>.
	:param E:
	:type E: TopoDS_Shape
	:param first:
	:type first: float
	:param last:
	:type last: float
	:rtype: None") Range;
		void Range (const TopoDS_Shape & E,const Standard_Real first,const Standard_Real last);

		/****************** RecomputeCurves ******************/
		%feature("compactdefaultargs") RecomputeCurves;
		%feature("autodoc", ":param C:
	:type C: TopOpeBRepDS_Curve
	:param oldE:
	:type oldE: TopoDS_Edge
	:param E:
	:type E: TopoDS_Edge
	:param inewC:
	:type inewC: int
	:param HDS:
	:type HDS: TopOpeBRepDS_HDataStructure
	:rtype: None") RecomputeCurves;
		void RecomputeCurves (const TopOpeBRepDS_Curve & C,const TopoDS_Edge & oldE,TopoDS_Edge & E,Standard_Integer &OutValue,const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

		/****************** TopOpeBRepDS_BuildTool ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_BuildTool;
		%feature("autodoc", ":rtype: None") TopOpeBRepDS_BuildTool;
		 TopOpeBRepDS_BuildTool ();

		/****************** TopOpeBRepDS_BuildTool ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_BuildTool;
		%feature("autodoc", ":param OutCurveType:
	:type OutCurveType: TopOpeBRepTool_OutCurveType
	:rtype: None") TopOpeBRepDS_BuildTool;
		 TopOpeBRepDS_BuildTool (const TopOpeBRepTool_OutCurveType OutCurveType);

		/****************** TopOpeBRepDS_BuildTool ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_BuildTool;
		%feature("autodoc", ":param GT:
	:type GT: TopOpeBRepTool_GeomTool
	:rtype: None") TopOpeBRepDS_BuildTool;
		 TopOpeBRepDS_BuildTool (const TopOpeBRepTool_GeomTool & GT);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", ":rtype: bool") Translate;
		Standard_Boolean Translate ();

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", ":param T:
	:type T: bool
	:rtype: None") Translate;
		void Translate (const Standard_Boolean T);

		/****************** UpdateEdge ******************/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "* Sets the range of edge <Eou> from <Ein> only when <Ein> has a closed geometry.
	:param Ein:
	:type Ein: TopoDS_Shape
	:param Eou:
	:type Eou: TopoDS_Shape
	:rtype: None") UpdateEdge;
		void UpdateEdge (const TopoDS_Shape & Ein,TopoDS_Shape & Eou);

		/****************** UpdateEdgeCurveTol ******************/
		%feature("compactdefaultargs") UpdateEdgeCurveTol;
		%feature("autodoc", ":param F1:
	:type F1: TopoDS_Face
	:param F2:
	:type F2: TopoDS_Face
	:param E:
	:type E: TopoDS_Edge
	:param C3Dnew:
	:type C3Dnew: Geom_Curve
	:param tol3d:
	:type tol3d: float
	:param tol2d1:
	:type tol2d1: float
	:param tol2d2:
	:type tol2d2: float
	:param newtol:
	:type newtol: float
	:param newparmin:
	:type newparmin: float
	:param newparmax:
	:type newparmax: float
	:rtype: None") UpdateEdgeCurveTol;
		void UpdateEdgeCurveTol (const TopoDS_Face & F1,const TopoDS_Face & F2,TopoDS_Edge & E,const opencascade::handle<Geom_Curve> & C3Dnew,const Standard_Real tol3d,const Standard_Real tol2d1,const Standard_Real tol2d2,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** UpdateSurface ******************/
		%feature("compactdefaultargs") UpdateSurface;
		%feature("autodoc", ":param F:
	:type F: TopoDS_Shape
	:param SU:
	:type SU: Geom_Surface
	:rtype: None") UpdateSurface;
		void UpdateSurface (const TopoDS_Shape & F,const opencascade::handle<Geom_Surface> & SU);

		/****************** UpdateSurface ******************/
		%feature("compactdefaultargs") UpdateSurface;
		%feature("autodoc", ":param E:
	:type E: TopoDS_Shape
	:param oldF:
	:type oldF: TopoDS_Shape
	:param newF:
	:type newF: TopoDS_Shape
	:rtype: None") UpdateSurface;
		void UpdateSurface (const TopoDS_Shape & E,const TopoDS_Shape & oldF,const TopoDS_Shape & newF);

};


%extend TopOpeBRepDS_BuildTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class TopOpeBRepDS_Check *
***************************/
%nodefaultctor TopOpeBRepDS_Check;
class TopOpeBRepDS_Check : public Standard_Transient {
	public:
		/****************** ChangeHDS ******************/
		%feature("compactdefaultargs") ChangeHDS;
		%feature("autodoc", ":rtype: opencascade::handle<TopOpeBRepDS_HDataStructure>") ChangeHDS;
		opencascade::handle<TopOpeBRepDS_HDataStructure> & ChangeHDS ();

		/****************** CheckDS ******************/
		%feature("compactdefaultargs") CheckDS;
		%feature("autodoc", "* Verifie que le ieme element de la DS existe, et pour un K de type topologique, verifie qu'il est du bon type (VERTEX, EDGE, WIRE, FACE, SHELL ou SOLID)
	:param i:
	:type i: int
	:param K:
	:type K: TopOpeBRepDS_Kind
	:rtype: bool") CheckDS;
		Standard_Boolean CheckDS (const Standard_Integer i,const TopOpeBRepDS_Kind K);

		/****************** CheckShapes ******************/
		%feature("compactdefaultargs") CheckShapes;
		%feature("autodoc", "* Verifie que les Shapes existent bien dans la DS Utile pour les Shapes SameDomain si la liste est vide, renvoie vrai
	:param LS:
	:type LS: TopTools_ListOfShape
	:rtype: bool") CheckShapes;
		Standard_Boolean CheckShapes (const TopTools_ListOfShape & LS);

		/****************** ChkIntg ******************/
		%feature("compactdefaultargs") ChkIntg;
		%feature("autodoc", "* Check integrition of DS
	:rtype: bool") ChkIntg;
		Standard_Boolean ChkIntg ();

		/****************** ChkIntgInterf ******************/
		%feature("compactdefaultargs") ChkIntgInterf;
		%feature("autodoc", "* Check integrition of interferences (les supports et les geometries de LI)
	:param LI:
	:type LI: TopOpeBRepDS_ListOfInterference
	:rtype: bool") ChkIntgInterf;
		Standard_Boolean ChkIntgInterf (const TopOpeBRepDS_ListOfInterference & LI);

		/****************** ChkIntgSamDom ******************/
		%feature("compactdefaultargs") ChkIntgSamDom;
		%feature("autodoc", "* Check integrition des champs SameDomain de la DS
	:rtype: bool") ChkIntgSamDom;
		Standard_Boolean ChkIntgSamDom ();

		/****************** HDS ******************/
		%feature("compactdefaultargs") HDS;
		%feature("autodoc", ":rtype: opencascade::handle<TopOpeBRepDS_HDataStructure>") HDS;
		const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS ();

		/****************** OneVertexOnPnt ******************/
		%feature("compactdefaultargs") OneVertexOnPnt;
		%feature("autodoc", "* Verifie que les Vertex non SameDomain sont bien nonSameDomain, que les vertex sameDomain sont bien SameDomain, que les Points sont non confondus ni entre eux, ni avec des Vertex.
	:rtype: bool") OneVertexOnPnt;
		Standard_Boolean OneVertexOnPnt ();

		/****************** Print ******************/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "* Prints the name of CheckStatus <stat> as a String
	:param stat:
	:type stat: TopOpeBRepDS_CheckStatus
	:param S:
	:type S: Standard_OStream
	:rtype: Standard_OStream") Print;
		Standard_OStream & Print (const TopOpeBRepDS_CheckStatus stat,Standard_OStream & S);


        %feature("autodoc", "1");
        %extend{
            std::string PrintIntgToString() {
            std::stringstream s;
            self->PrintIntg(s);
            return s.str();}
        };
        		/****************** PrintShape ******************/
		%feature("compactdefaultargs") PrintShape;
		%feature("autodoc", "* Prints the name of CheckStatus <stat> as a String
	:param SE:
	:type SE: TopAbs_ShapeEnum
	:param S:
	:type S: Standard_OStream
	:rtype: Standard_OStream") PrintShape;
		Standard_OStream & PrintShape (const TopAbs_ShapeEnum SE,Standard_OStream & S);

		/****************** PrintShape ******************/
		%feature("compactdefaultargs") PrintShape;
		%feature("autodoc", "* Prints the name of CheckStatus <stat> as a String
	:param index:
	:type index: int
	:param S:
	:type S: Standard_OStream
	:rtype: Standard_OStream") PrintShape;
		Standard_OStream & PrintShape (const Standard_Integer index,Standard_OStream & S);

		/****************** TopOpeBRepDS_Check ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_Check;
		%feature("autodoc", ":rtype: None") TopOpeBRepDS_Check;
		 TopOpeBRepDS_Check ();

		/****************** TopOpeBRepDS_Check ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_Check;
		%feature("autodoc", ":param HDS:
	:type HDS: TopOpeBRepDS_HDataStructure
	:rtype: None") TopOpeBRepDS_Check;
		 TopOpeBRepDS_Check (const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

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
%nodefaultctor TopOpeBRepDS_Curve;
class TopOpeBRepDS_Curve {
	public:
		/****************** ChangeCurve ******************/
		%feature("compactdefaultargs") ChangeCurve;
		%feature("autodoc", ":rtype: opencascade::handle<Geom_Curve>") ChangeCurve;
		opencascade::handle<Geom_Curve> & ChangeCurve ();

		/****************** ChangeDSIndex ******************/
		%feature("compactdefaultargs") ChangeDSIndex;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: None") ChangeDSIndex;
		void ChangeDSIndex (const Standard_Integer I);

		/****************** ChangeIsWalk ******************/
		%feature("compactdefaultargs") ChangeIsWalk;
		%feature("autodoc", ":param B:
	:type B: bool
	:rtype: None") ChangeIsWalk;
		void ChangeIsWalk (const Standard_Boolean B);

		/****************** ChangeKeep ******************/
		%feature("compactdefaultargs") ChangeKeep;
		%feature("autodoc", ":param B:
	:type B: bool
	:rtype: None") ChangeKeep;
		void ChangeKeep (const Standard_Boolean B);

		/****************** ChangeMother ******************/
		%feature("compactdefaultargs") ChangeMother;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: None") ChangeMother;
		void ChangeMother (const Standard_Integer I);

		/****************** ChangeShape1 ******************/
		%feature("compactdefaultargs") ChangeShape1;
		%feature("autodoc", ":rtype: TopoDS_Shape") ChangeShape1;
		TopoDS_Shape  ChangeShape1 ();

		/****************** ChangeShape2 ******************/
		%feature("compactdefaultargs") ChangeShape2;
		%feature("autodoc", ":rtype: TopoDS_Shape") ChangeShape2;
		TopoDS_Shape  ChangeShape2 ();

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", ":rtype: opencascade::handle<Geom_Curve>") Curve;
		const opencascade::handle<Geom_Curve> & Curve ();

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", ":param C3D:
	:type C3D: Geom_Curve
	:param Tol:
	:type Tol: float
	:rtype: None") Curve;
		void Curve (const opencascade::handle<Geom_Curve> & C3D,const Standard_Real Tol);

		/****************** Curve1 ******************/
		%feature("compactdefaultargs") Curve1;
		%feature("autodoc", ":rtype: opencascade::handle<Geom2d_Curve>") Curve1;
		const opencascade::handle<Geom2d_Curve> & Curve1 ();

		/****************** Curve1 ******************/
		%feature("compactdefaultargs") Curve1;
		%feature("autodoc", ":param PC1:
	:type PC1: Geom2d_Curve
	:rtype: None") Curve1;
		void Curve1 (const opencascade::handle<Geom2d_Curve> & PC1);

		/****************** Curve2 ******************/
		%feature("compactdefaultargs") Curve2;
		%feature("autodoc", ":rtype: opencascade::handle<Geom2d_Curve>") Curve2;
		const opencascade::handle<Geom2d_Curve> & Curve2 ();

		/****************** Curve2 ******************/
		%feature("compactdefaultargs") Curve2;
		%feature("autodoc", ":param PC2:
	:type PC2: Geom2d_Curve
	:rtype: None") Curve2;
		void Curve2 (const opencascade::handle<Geom2d_Curve> & PC2);

		/****************** DSIndex ******************/
		%feature("compactdefaultargs") DSIndex;
		%feature("autodoc", ":rtype: int") DSIndex;
		Standard_Integer DSIndex ();

		/****************** DefineCurve ******************/
		%feature("compactdefaultargs") DefineCurve;
		%feature("autodoc", ":param P:
	:type P: Geom_Curve
	:param T:
	:type T: float
	:param IsWalk:
	:type IsWalk: bool
	:rtype: None") DefineCurve;
		void DefineCurve (const opencascade::handle<Geom_Curve> & P,const Standard_Real T,const Standard_Boolean IsWalk);

		/****************** GetSCI ******************/
		%feature("compactdefaultargs") GetSCI;
		%feature("autodoc", ":param I1:
	:type I1: TopOpeBRepDS_Interference
	:param I2:
	:type I2: TopOpeBRepDS_Interference
	:rtype: None") GetSCI;
		void GetSCI (opencascade::handle<TopOpeBRepDS_Interference> & I1,opencascade::handle<TopOpeBRepDS_Interference> & I2);

		/****************** GetSCI1 ******************/
		%feature("compactdefaultargs") GetSCI1;
		%feature("autodoc", ":rtype: opencascade::handle<TopOpeBRepDS_Interference>") GetSCI1;
		const opencascade::handle<TopOpeBRepDS_Interference> & GetSCI1 ();

		/****************** GetSCI2 ******************/
		%feature("compactdefaultargs") GetSCI2;
		%feature("autodoc", ":rtype: opencascade::handle<TopOpeBRepDS_Interference>") GetSCI2;
		const opencascade::handle<TopOpeBRepDS_Interference> & GetSCI2 ();

		/****************** GetShapes ******************/
		%feature("compactdefaultargs") GetShapes;
		%feature("autodoc", ":param S1:
	:type S1: TopoDS_Shape
	:param S2:
	:type S2: TopoDS_Shape
	:rtype: None") GetShapes;
		void GetShapes (TopoDS_Shape & S1,TopoDS_Shape & S2);

		/****************** IsWalk ******************/
		%feature("compactdefaultargs") IsWalk;
		%feature("autodoc", ":rtype: bool") IsWalk;
		Standard_Boolean IsWalk ();

		/****************** Keep ******************/
		%feature("compactdefaultargs") Keep;
		%feature("autodoc", ":rtype: bool") Keep;
		Standard_Boolean Keep ();

		/****************** Mother ******************/
		%feature("compactdefaultargs") Mother;
		%feature("autodoc", ":rtype: int") Mother;
		Standard_Integer Mother ();

		/****************** Range ******************/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", ":param First:
	:type First: float
	:param Last:
	:type Last: float
	:rtype: bool") Range;
		Standard_Boolean Range (Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** SetRange ******************/
		%feature("compactdefaultargs") SetRange;
		%feature("autodoc", ":param First:
	:type First: float
	:param Last:
	:type Last: float
	:rtype: None") SetRange;
		void SetRange (const Standard_Real First,const Standard_Real Last);

		/****************** SetSCI ******************/
		%feature("compactdefaultargs") SetSCI;
		%feature("autodoc", "* define the interferences face/curve.
	:param I1:
	:type I1: TopOpeBRepDS_Interference
	:param I2:
	:type I2: TopOpeBRepDS_Interference
	:rtype: None") SetSCI;
		void SetSCI (const opencascade::handle<TopOpeBRepDS_Interference> & I1,const opencascade::handle<TopOpeBRepDS_Interference> & I2);

		/****************** SetShapes ******************/
		%feature("compactdefaultargs") SetShapes;
		%feature("autodoc", ":param S1:
	:type S1: TopoDS_Shape
	:param S2:
	:type S2: TopoDS_Shape
	:rtype: None") SetShapes;
		void SetShapes (const TopoDS_Shape & S1,const TopoDS_Shape & S2);

		/****************** Shape1 ******************/
		%feature("compactdefaultargs") Shape1;
		%feature("autodoc", ":rtype: TopoDS_Shape") Shape1;
		const TopoDS_Shape  Shape1 ();

		/****************** Shape2 ******************/
		%feature("compactdefaultargs") Shape2;
		%feature("autodoc", ":rtype: TopoDS_Shape") Shape2;
		const TopoDS_Shape  Shape2 ();

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "* Update the tolerance
	:param tol:
	:type tol: float
	:rtype: None") Tolerance;
		void Tolerance (const Standard_Real tol);

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", ":rtype: float") Tolerance;
		Standard_Real Tolerance ();

		/****************** TopOpeBRepDS_Curve ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_Curve;
		%feature("autodoc", ":rtype: None") TopOpeBRepDS_Curve;
		 TopOpeBRepDS_Curve ();

		/****************** TopOpeBRepDS_Curve ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_Curve;
		%feature("autodoc", ":param P:
	:type P: Geom_Curve
	:param T:
	:type T: float
	:param IsWalk: default value is Standard_False
	:type IsWalk: bool
	:rtype: None") TopOpeBRepDS_Curve;
		 TopOpeBRepDS_Curve (const opencascade::handle<Geom_Curve> & P,const Standard_Real T,const Standard_Boolean IsWalk = Standard_False);

};


%extend TopOpeBRepDS_Curve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class TopOpeBRepDS_CurveExplorer *
***********************************/
%nodefaultctor TopOpeBRepDS_CurveExplorer;
class TopOpeBRepDS_CurveExplorer {
	public:
		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", ":rtype: TopOpeBRepDS_Curve") Curve;
		const TopOpeBRepDS_Curve & Curve ();

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: TopOpeBRepDS_Curve") Curve;
		const TopOpeBRepDS_Curve & Curve (const Standard_Integer I);

		/****************** Index ******************/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", ":rtype: int") Index;
		Standard_Integer Index ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param DS:
	:type DS: TopOpeBRepDS_DataStructure
	:param FindOnlyKeep: default value is Standard_True
	:type FindOnlyKeep: bool
	:rtype: None") Init;
		void Init (const TopOpeBRepDS_DataStructure & DS,const Standard_Boolean FindOnlyKeep = Standard_True);

		/****************** IsCurve ******************/
		%feature("compactdefaultargs") IsCurve;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: bool") IsCurve;
		Standard_Boolean IsCurve (const Standard_Integer I);

		/****************** IsCurveKeep ******************/
		%feature("compactdefaultargs") IsCurveKeep;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: bool") IsCurveKeep;
		Standard_Boolean IsCurveKeep (const Standard_Integer I);

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", ":rtype: bool") More;
		Standard_Boolean More ();

		/****************** NbCurve ******************/
		%feature("compactdefaultargs") NbCurve;
		%feature("autodoc", ":rtype: int") NbCurve;
		Standard_Integer NbCurve ();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", ":rtype: None") Next;
		void Next ();

		/****************** TopOpeBRepDS_CurveExplorer ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_CurveExplorer;
		%feature("autodoc", ":rtype: None") TopOpeBRepDS_CurveExplorer;
		 TopOpeBRepDS_CurveExplorer ();

		/****************** TopOpeBRepDS_CurveExplorer ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_CurveExplorer;
		%feature("autodoc", ":param DS:
	:type DS: TopOpeBRepDS_DataStructure
	:param FindOnlyKeep: default value is Standard_True
	:type FindOnlyKeep: bool
	:rtype: None") TopOpeBRepDS_CurveExplorer;
		 TopOpeBRepDS_CurveExplorer (const TopOpeBRepDS_DataStructure & DS,const Standard_Boolean FindOnlyKeep = Standard_True);

};


%extend TopOpeBRepDS_CurveExplorer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class TopOpeBRepDS_DataStructure *
***********************************/
%nodefaultctor TopOpeBRepDS_DataStructure;
class TopOpeBRepDS_DataStructure {
	public:
		/****************** AddCurve ******************/
		%feature("compactdefaultargs") AddCurve;
		%feature("autodoc", "* Insert a new curve. Returns the index.
	:param S:
	:type S: TopOpeBRepDS_Curve
	:rtype: int") AddCurve;
		Standard_Integer AddCurve (const TopOpeBRepDS_Curve & S);

		/****************** AddPoint ******************/
		%feature("compactdefaultargs") AddPoint;
		%feature("autodoc", "* Insert a new point. Returns the index.
	:param PDS:
	:type PDS: TopOpeBRepDS_Point
	:rtype: int") AddPoint;
		Standard_Integer AddPoint (const TopOpeBRepDS_Point & PDS);

		/****************** AddPointSS ******************/
		%feature("compactdefaultargs") AddPointSS;
		%feature("autodoc", "* Insert a new point. Returns the index.
	:param PDS:
	:type PDS: TopOpeBRepDS_Point
	:param S1:
	:type S1: TopoDS_Shape
	:param S2:
	:type S2: TopoDS_Shape
	:rtype: int") AddPointSS;
		Standard_Integer AddPointSS (const TopOpeBRepDS_Point & PDS,const TopoDS_Shape & S1,const TopoDS_Shape & S2);

		/****************** AddSectionEdge ******************/
		%feature("compactdefaultargs") AddSectionEdge;
		%feature("autodoc", ":param E:
	:type E: TopoDS_Edge
	:rtype: int") AddSectionEdge;
		Standard_Integer AddSectionEdge (const TopoDS_Edge & E);

		/****************** AddShape ******************/
		%feature("compactdefaultargs") AddShape;
		%feature("autodoc", "* Insert a shape S. Returns the index.
	:param S:
	:type S: TopoDS_Shape
	:rtype: int") AddShape;
		Standard_Integer AddShape (const TopoDS_Shape & S);

		/****************** AddShape ******************/
		%feature("compactdefaultargs") AddShape;
		%feature("autodoc", "* Insert a shape S which ancestor is I = 1 or 2. Returns the index.
	:param S:
	:type S: TopoDS_Shape
	:param I:
	:type I: int
	:rtype: int") AddShape;
		Standard_Integer AddShape (const TopoDS_Shape & S,const Standard_Integer I);

		/****************** AddShapeInterference ******************/
		%feature("compactdefaultargs") AddShapeInterference;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param I:
	:type I: TopOpeBRepDS_Interference
	:rtype: None") AddShapeInterference;
		void AddShapeInterference (const TopoDS_Shape & S,const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** AddShapeSameDomain ******************/
		%feature("compactdefaultargs") AddShapeSameDomain;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param SSD:
	:type SSD: TopoDS_Shape
	:rtype: None") AddShapeSameDomain;
		void AddShapeSameDomain (const TopoDS_Shape & S,const TopoDS_Shape & SSD);

		/****************** AddSurface ******************/
		%feature("compactdefaultargs") AddSurface;
		%feature("autodoc", "* Insert a new surface. Returns the index.
	:param S:
	:type S: TopOpeBRepDS_Surface
	:rtype: int") AddSurface;
		Standard_Integer AddSurface (const TopOpeBRepDS_Surface & S);

		/****************** AncestorRank ******************/
		%feature("compactdefaultargs") AncestorRank;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: int") AncestorRank;
		Standard_Integer AncestorRank (const Standard_Integer I);

		/****************** AncestorRank ******************/
		%feature("compactdefaultargs") AncestorRank;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: int") AncestorRank;
		Standard_Integer AncestorRank (const TopoDS_Shape & S);

		/****************** AncestorRank ******************/
		%feature("compactdefaultargs") AncestorRank;
		%feature("autodoc", ":param I:
	:type I: int
	:param Ianc:
	:type Ianc: int
	:rtype: None") AncestorRank;
		void AncestorRank (const Standard_Integer I,const Standard_Integer Ianc);

		/****************** AncestorRank ******************/
		%feature("compactdefaultargs") AncestorRank;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param Ianc:
	:type Ianc: int
	:rtype: None") AncestorRank;
		void AncestorRank (const TopoDS_Shape & S,const Standard_Integer Ianc);

		/****************** ChangeCurve ******************/
		%feature("compactdefaultargs") ChangeCurve;
		%feature("autodoc", "* Returns the Curve of index <I>.
	:param I:
	:type I: int
	:rtype: TopOpeBRepDS_Curve") ChangeCurve;
		TopOpeBRepDS_Curve & ChangeCurve (const Standard_Integer I);

		/****************** ChangeCurveInterferences ******************/
		%feature("compactdefaultargs") ChangeCurveInterferences;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: TopOpeBRepDS_ListOfInterference") ChangeCurveInterferences;
		TopOpeBRepDS_ListOfInterference & ChangeCurveInterferences (const Standard_Integer I);

		/****************** ChangeKeepCurve ******************/
		%feature("compactdefaultargs") ChangeKeepCurve;
		%feature("autodoc", ":param I:
	:type I: int
	:param FindKeep:
	:type FindKeep: bool
	:rtype: None") ChangeKeepCurve;
		void ChangeKeepCurve (const Standard_Integer I,const Standard_Boolean FindKeep);

		/****************** ChangeKeepCurve ******************/
		%feature("compactdefaultargs") ChangeKeepCurve;
		%feature("autodoc", ":param C:
	:type C: TopOpeBRepDS_Curve
	:param FindKeep:
	:type FindKeep: bool
	:rtype: None") ChangeKeepCurve;
		void ChangeKeepCurve (TopOpeBRepDS_Curve & C,const Standard_Boolean FindKeep);

		/****************** ChangeKeepPoint ******************/
		%feature("compactdefaultargs") ChangeKeepPoint;
		%feature("autodoc", ":param I:
	:type I: int
	:param FindKeep:
	:type FindKeep: bool
	:rtype: None") ChangeKeepPoint;
		void ChangeKeepPoint (const Standard_Integer I,const Standard_Boolean FindKeep);

		/****************** ChangeKeepPoint ******************/
		%feature("compactdefaultargs") ChangeKeepPoint;
		%feature("autodoc", ":param P:
	:type P: TopOpeBRepDS_Point
	:param FindKeep:
	:type FindKeep: bool
	:rtype: None") ChangeKeepPoint;
		void ChangeKeepPoint (TopOpeBRepDS_Point & P,const Standard_Boolean FindKeep);

		/****************** ChangeKeepShape ******************/
		%feature("compactdefaultargs") ChangeKeepShape;
		%feature("autodoc", ":param I:
	:type I: int
	:param FindKeep:
	:type FindKeep: bool
	:rtype: None") ChangeKeepShape;
		void ChangeKeepShape (const Standard_Integer I,const Standard_Boolean FindKeep);

		/****************** ChangeKeepShape ******************/
		%feature("compactdefaultargs") ChangeKeepShape;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param FindKeep:
	:type FindKeep: bool
	:rtype: None") ChangeKeepShape;
		void ChangeKeepShape (const TopoDS_Shape & S,const Standard_Boolean FindKeep);

		/****************** ChangeKeepSurface ******************/
		%feature("compactdefaultargs") ChangeKeepSurface;
		%feature("autodoc", ":param I:
	:type I: int
	:param FindKeep:
	:type FindKeep: bool
	:rtype: None") ChangeKeepSurface;
		void ChangeKeepSurface (const Standard_Integer I,const Standard_Boolean FindKeep);

		/****************** ChangeKeepSurface ******************/
		%feature("compactdefaultargs") ChangeKeepSurface;
		%feature("autodoc", ":param S:
	:type S: TopOpeBRepDS_Surface
	:param FindKeep:
	:type FindKeep: bool
	:rtype: None") ChangeKeepSurface;
		void ChangeKeepSurface (TopOpeBRepDS_Surface & S,const Standard_Boolean FindKeep);

		/****************** ChangeMapOfRejectedShapesObj ******************/
		%feature("compactdefaultargs") ChangeMapOfRejectedShapesObj;
		%feature("autodoc", ":rtype: TopTools_IndexedMapOfShape") ChangeMapOfRejectedShapesObj;
		TopTools_IndexedMapOfShape & ChangeMapOfRejectedShapesObj ();

		/****************** ChangeMapOfRejectedShapesTool ******************/
		%feature("compactdefaultargs") ChangeMapOfRejectedShapesTool;
		%feature("autodoc", ":rtype: TopTools_IndexedMapOfShape") ChangeMapOfRejectedShapesTool;
		TopTools_IndexedMapOfShape & ChangeMapOfRejectedShapesTool ();

		/****************** ChangeMapOfShapeWithState ******************/
		%feature("compactdefaultargs") ChangeMapOfShapeWithState;
		%feature("autodoc", ":param aShape:
	:type aShape: TopoDS_Shape
	:param aFlag:
	:type aFlag: bool
	:rtype: TopOpeBRepDS_IndexedDataMapOfShapeWithState") ChangeMapOfShapeWithState;
		TopOpeBRepDS_IndexedDataMapOfShapeWithState & ChangeMapOfShapeWithState (const TopoDS_Shape & aShape,Standard_Boolean &OutValue);

		/****************** ChangeMapOfShapeWithStateObj ******************/
		%feature("compactdefaultargs") ChangeMapOfShapeWithStateObj;
		%feature("autodoc", ":rtype: TopOpeBRepDS_IndexedDataMapOfShapeWithState") ChangeMapOfShapeWithStateObj;
		TopOpeBRepDS_IndexedDataMapOfShapeWithState & ChangeMapOfShapeWithStateObj ();

		/****************** ChangeMapOfShapeWithStateTool ******************/
		%feature("compactdefaultargs") ChangeMapOfShapeWithStateTool;
		%feature("autodoc", ":rtype: TopOpeBRepDS_IndexedDataMapOfShapeWithState") ChangeMapOfShapeWithStateTool;
		TopOpeBRepDS_IndexedDataMapOfShapeWithState & ChangeMapOfShapeWithStateTool ();

		/****************** ChangeNbCurves ******************/
		%feature("compactdefaultargs") ChangeNbCurves;
		%feature("autodoc", ":param N:
	:type N: int
	:rtype: None") ChangeNbCurves;
		void ChangeNbCurves (const Standard_Integer N);

		/****************** ChangePoint ******************/
		%feature("compactdefaultargs") ChangePoint;
		%feature("autodoc", "* Returns the point of index <I>.
	:param I:
	:type I: int
	:rtype: TopOpeBRepDS_Point") ChangePoint;
		TopOpeBRepDS_Point & ChangePoint (const Standard_Integer I);

		/****************** ChangePointInterferences ******************/
		%feature("compactdefaultargs") ChangePointInterferences;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: TopOpeBRepDS_ListOfInterference") ChangePointInterferences;
		TopOpeBRepDS_ListOfInterference & ChangePointInterferences (const Standard_Integer I);

		/****************** ChangeShapeInterferences ******************/
		%feature("compactdefaultargs") ChangeShapeInterferences;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: TopOpeBRepDS_ListOfInterference") ChangeShapeInterferences;
		TopOpeBRepDS_ListOfInterference & ChangeShapeInterferences (const TopoDS_Shape & S);

		/****************** ChangeShapeInterferences ******************/
		%feature("compactdefaultargs") ChangeShapeInterferences;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: TopOpeBRepDS_ListOfInterference") ChangeShapeInterferences;
		TopOpeBRepDS_ListOfInterference & ChangeShapeInterferences (const Standard_Integer I);

		/****************** ChangeShapeSameDomain ******************/
		%feature("compactdefaultargs") ChangeShapeSameDomain;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: TopTools_ListOfShape") ChangeShapeSameDomain;
		TopTools_ListOfShape & ChangeShapeSameDomain (const TopoDS_Shape & S);

		/****************** ChangeShapeSameDomain ******************/
		%feature("compactdefaultargs") ChangeShapeSameDomain;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: TopTools_ListOfShape") ChangeShapeSameDomain;
		TopTools_ListOfShape & ChangeShapeSameDomain (const Standard_Integer I);

		/****************** ChangeShapes ******************/
		%feature("compactdefaultargs") ChangeShapes;
		%feature("autodoc", ":rtype: TopOpeBRepDS_MapOfShapeData") ChangeShapes;
		TopOpeBRepDS_MapOfShapeData & ChangeShapes ();

		/****************** ChangeSurface ******************/
		%feature("compactdefaultargs") ChangeSurface;
		%feature("autodoc", "* Returns the surface of index <I>.
	:param I:
	:type I: int
	:rtype: TopOpeBRepDS_Surface") ChangeSurface;
		TopOpeBRepDS_Surface & ChangeSurface (const Standard_Integer I);

		/****************** ChangeSurfaceInterferences ******************/
		%feature("compactdefaultargs") ChangeSurfaceInterferences;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: TopOpeBRepDS_ListOfInterference") ChangeSurfaceInterferences;
		TopOpeBRepDS_ListOfInterference & ChangeSurfaceInterferences (const Standard_Integer I);

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "* Returns the Curve of index <I>.
	:param I:
	:type I: int
	:rtype: TopOpeBRepDS_Curve") Curve;
		const TopOpeBRepDS_Curve & Curve (const Standard_Integer I);

		/****************** CurveInterferences ******************/
		%feature("compactdefaultargs") CurveInterferences;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: TopOpeBRepDS_ListOfInterference") CurveInterferences;
		const TopOpeBRepDS_ListOfInterference & CurveInterferences (const Standard_Integer I);

		/****************** FillShapesSameDomain ******************/
		%feature("compactdefaultargs") FillShapesSameDomain;
		%feature("autodoc", ":param S1:
	:type S1: TopoDS_Shape
	:param S2:
	:type S2: TopoDS_Shape
	:param refFirst: default value is Standard_True
	:type refFirst: bool
	:rtype: None") FillShapesSameDomain;
		void FillShapesSameDomain (const TopoDS_Shape & S1,const TopoDS_Shape & S2,const Standard_Boolean refFirst = Standard_True);

		/****************** FillShapesSameDomain ******************/
		%feature("compactdefaultargs") FillShapesSameDomain;
		%feature("autodoc", ":param S1:
	:type S1: TopoDS_Shape
	:param S2:
	:type S2: TopoDS_Shape
	:param c1:
	:type c1: TopOpeBRepDS_Config
	:param c2:
	:type c2: TopOpeBRepDS_Config
	:param refFirst: default value is Standard_True
	:type refFirst: bool
	:rtype: None") FillShapesSameDomain;
		void FillShapesSameDomain (const TopoDS_Shape & S1,const TopoDS_Shape & S2,const TopOpeBRepDS_Config c1,const TopOpeBRepDS_Config c2,const Standard_Boolean refFirst = Standard_True);

		/****************** GetShapeWithState ******************/
		%feature("compactdefaultargs") GetShapeWithState;
		%feature("autodoc", ":param aShape:
	:type aShape: TopoDS_Shape
	:rtype: TopOpeBRepDS_ShapeWithState") GetShapeWithState;
		const TopOpeBRepDS_ShapeWithState & GetShapeWithState (const TopoDS_Shape & aShape);

		/****************** HasGeometry ******************/
		%feature("compactdefaultargs") HasGeometry;
		%feature("autodoc", "* Returns True if <S> has new geometries, i.e : True si : HasShape(S) True S a une liste d'interferences non vide. S = SOLID, FACE, EDGE : true/false S = SHELL, WIRE, VERTEX : false.
	:param S:
	:type S: TopoDS_Shape
	:rtype: bool") HasGeometry;
		Standard_Boolean HasGeometry (const TopoDS_Shape & S);

		/****************** HasNewSurface ******************/
		%feature("compactdefaultargs") HasNewSurface;
		%feature("autodoc", ":param F:
	:type F: TopoDS_Shape
	:rtype: bool") HasNewSurface;
		Standard_Boolean HasNewSurface (const TopoDS_Shape & F);

		/****************** HasShape ******************/
		%feature("compactdefaultargs") HasShape;
		%feature("autodoc", "* Returns True if <S> est dans myShapes
	:param S:
	:type S: TopoDS_Shape
	:param FindKeep: default value is Standard_True
	:type FindKeep: bool
	:rtype: bool") HasShape;
		Standard_Boolean HasShape (const TopoDS_Shape & S,const Standard_Boolean FindKeep = Standard_True);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* reset the data structure
	:rtype: None") Init;
		void Init ();

		/****************** InitSectionEdges ******************/
		%feature("compactdefaultargs") InitSectionEdges;
		%feature("autodoc", ":rtype: None") InitSectionEdges;
		void InitSectionEdges ();

		/****************** IsSectionEdge ******************/
		%feature("compactdefaultargs") IsSectionEdge;
		%feature("autodoc", ":param E:
	:type E: TopoDS_Edge
	:param FindKeep: default value is Standard_True
	:type FindKeep: bool
	:rtype: bool") IsSectionEdge;
		Standard_Boolean IsSectionEdge (const TopoDS_Edge & E,const Standard_Boolean FindKeep = Standard_True);

		/****************** Isfafa ******************/
		%feature("compactdefaultargs") Isfafa;
		%feature("autodoc", ":param isfafa:
	:type isfafa: bool
	:rtype: None") Isfafa;
		void Isfafa (const Standard_Boolean isfafa);

		/****************** Isfafa ******************/
		%feature("compactdefaultargs") Isfafa;
		%feature("autodoc", ":rtype: bool") Isfafa;
		Standard_Boolean Isfafa ();

		/****************** KeepCurve ******************/
		%feature("compactdefaultargs") KeepCurve;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: bool") KeepCurve;
		Standard_Boolean KeepCurve (const Standard_Integer I);

		/****************** KeepCurve ******************/
		%feature("compactdefaultargs") KeepCurve;
		%feature("autodoc", ":param C:
	:type C: TopOpeBRepDS_Curve
	:rtype: bool") KeepCurve;
		Standard_Boolean KeepCurve (const TopOpeBRepDS_Curve & C);

		/****************** KeepPoint ******************/
		%feature("compactdefaultargs") KeepPoint;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: bool") KeepPoint;
		Standard_Boolean KeepPoint (const Standard_Integer I);

		/****************** KeepPoint ******************/
		%feature("compactdefaultargs") KeepPoint;
		%feature("autodoc", ":param P:
	:type P: TopOpeBRepDS_Point
	:rtype: bool") KeepPoint;
		Standard_Boolean KeepPoint (const TopOpeBRepDS_Point & P);

		/****************** KeepShape ******************/
		%feature("compactdefaultargs") KeepShape;
		%feature("autodoc", ":param I:
	:type I: int
	:param FindKeep: default value is Standard_True
	:type FindKeep: bool
	:rtype: bool") KeepShape;
		Standard_Boolean KeepShape (const Standard_Integer I,const Standard_Boolean FindKeep = Standard_True);

		/****************** KeepShape ******************/
		%feature("compactdefaultargs") KeepShape;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param FindKeep: default value is Standard_True
	:type FindKeep: bool
	:rtype: bool") KeepShape;
		Standard_Boolean KeepShape (const TopoDS_Shape & S,const Standard_Boolean FindKeep = Standard_True);

		/****************** KeepSurface ******************/
		%feature("compactdefaultargs") KeepSurface;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: bool") KeepSurface;
		Standard_Boolean KeepSurface (const Standard_Integer I);

		/****************** KeepSurface ******************/
		%feature("compactdefaultargs") KeepSurface;
		%feature("autodoc", ":param S:
	:type S: TopOpeBRepDS_Surface
	:rtype: bool") KeepSurface;
		Standard_Boolean KeepSurface (TopOpeBRepDS_Surface & S);

		/****************** NbCurves ******************/
		%feature("compactdefaultargs") NbCurves;
		%feature("autodoc", ":rtype: int") NbCurves;
		Standard_Integer NbCurves ();

		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", ":rtype: int") NbPoints;
		Standard_Integer NbPoints ();

		/****************** NbSectionEdges ******************/
		%feature("compactdefaultargs") NbSectionEdges;
		%feature("autodoc", ":rtype: int") NbSectionEdges;
		Standard_Integer NbSectionEdges ();

		/****************** NbShapes ******************/
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", ":rtype: int") NbShapes;
		Standard_Integer NbShapes ();

		/****************** NbSurfaces ******************/
		%feature("compactdefaultargs") NbSurfaces;
		%feature("autodoc", ":rtype: int") NbSurfaces;
		Standard_Integer NbSurfaces ();

		/****************** NewSurface ******************/
		%feature("compactdefaultargs") NewSurface;
		%feature("autodoc", ":param F:
	:type F: TopoDS_Shape
	:rtype: opencascade::handle<Geom_Surface>") NewSurface;
		const opencascade::handle<Geom_Surface> & NewSurface (const TopoDS_Shape & F);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "* Returns the point of index <I>.
	:param I:
	:type I: int
	:rtype: TopOpeBRepDS_Point") Point;
		const TopOpeBRepDS_Point & Point (const Standard_Integer I);

		/****************** PointInterferences ******************/
		%feature("compactdefaultargs") PointInterferences;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: TopOpeBRepDS_ListOfInterference") PointInterferences;
		const TopOpeBRepDS_ListOfInterference & PointInterferences (const Standard_Integer I);

		/****************** RemoveCurve ******************/
		%feature("compactdefaultargs") RemoveCurve;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: None") RemoveCurve;
		void RemoveCurve (const Standard_Integer I);

		/****************** RemovePoint ******************/
		%feature("compactdefaultargs") RemovePoint;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: None") RemovePoint;
		void RemovePoint (const Standard_Integer I);

		/****************** RemoveShapeInterference ******************/
		%feature("compactdefaultargs") RemoveShapeInterference;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param I:
	:type I: TopOpeBRepDS_Interference
	:rtype: None") RemoveShapeInterference;
		void RemoveShapeInterference (const TopoDS_Shape & S,const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** RemoveShapeSameDomain ******************/
		%feature("compactdefaultargs") RemoveShapeSameDomain;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param SSD:
	:type SSD: TopoDS_Shape
	:rtype: None") RemoveShapeSameDomain;
		void RemoveShapeSameDomain (const TopoDS_Shape & S,const TopoDS_Shape & SSD);

		/****************** RemoveSurface ******************/
		%feature("compactdefaultargs") RemoveSurface;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: None") RemoveSurface;
		void RemoveSurface (const Standard_Integer I);

		/****************** SameDomainInd ******************/
		%feature("compactdefaultargs") SameDomainInd;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: int") SameDomainInd;
		Standard_Integer SameDomainInd (const Standard_Integer I);

		/****************** SameDomainInd ******************/
		%feature("compactdefaultargs") SameDomainInd;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: int") SameDomainInd;
		Standard_Integer SameDomainInd (const TopoDS_Shape & S);

		/****************** SameDomainInd ******************/
		%feature("compactdefaultargs") SameDomainInd;
		%feature("autodoc", ":param I:
	:type I: int
	:param Ind:
	:type Ind: int
	:rtype: None") SameDomainInd;
		void SameDomainInd (const Standard_Integer I,const Standard_Integer Ind);

		/****************** SameDomainInd ******************/
		%feature("compactdefaultargs") SameDomainInd;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param Ind:
	:type Ind: int
	:rtype: None") SameDomainInd;
		void SameDomainInd (const TopoDS_Shape & S,const Standard_Integer Ind);

		/****************** SameDomainOri ******************/
		%feature("compactdefaultargs") SameDomainOri;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: TopOpeBRepDS_Config") SameDomainOri;
		TopOpeBRepDS_Config SameDomainOri (const Standard_Integer I);

		/****************** SameDomainOri ******************/
		%feature("compactdefaultargs") SameDomainOri;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: TopOpeBRepDS_Config") SameDomainOri;
		TopOpeBRepDS_Config SameDomainOri (const TopoDS_Shape & S);

		/****************** SameDomainOri ******************/
		%feature("compactdefaultargs") SameDomainOri;
		%feature("autodoc", ":param I:
	:type I: int
	:param Ori:
	:type Ori: TopOpeBRepDS_Config
	:rtype: None") SameDomainOri;
		void SameDomainOri (const Standard_Integer I,const TopOpeBRepDS_Config Ori);

		/****************** SameDomainOri ******************/
		%feature("compactdefaultargs") SameDomainOri;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param Ori:
	:type Ori: TopOpeBRepDS_Config
	:rtype: None") SameDomainOri;
		void SameDomainOri (const TopoDS_Shape & S,const TopOpeBRepDS_Config Ori);

		/****************** SameDomainRef ******************/
		%feature("compactdefaultargs") SameDomainRef;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: int") SameDomainRef;
		Standard_Integer SameDomainRef (const Standard_Integer I);

		/****************** SameDomainRef ******************/
		%feature("compactdefaultargs") SameDomainRef;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: int") SameDomainRef;
		Standard_Integer SameDomainRef (const TopoDS_Shape & S);

		/****************** SameDomainRef ******************/
		%feature("compactdefaultargs") SameDomainRef;
		%feature("autodoc", ":param I:
	:type I: int
	:param Ref:
	:type Ref: int
	:rtype: None") SameDomainRef;
		void SameDomainRef (const Standard_Integer I,const Standard_Integer Ref);

		/****************** SameDomainRef ******************/
		%feature("compactdefaultargs") SameDomainRef;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param Ref:
	:type Ref: int
	:rtype: None") SameDomainRef;
		void SameDomainRef (const TopoDS_Shape & S,const Standard_Integer Ref);

		/****************** SectionEdge ******************/
		%feature("compactdefaultargs") SectionEdge;
		%feature("autodoc", ":param I:
	:type I: int
	:param FindKeep: default value is Standard_True
	:type FindKeep: bool
	:rtype: TopoDS_Edge") SectionEdge;
		const TopoDS_Edge  SectionEdge (const Standard_Integer I,const Standard_Boolean FindKeep = Standard_True);

		/****************** SectionEdge ******************/
		%feature("compactdefaultargs") SectionEdge;
		%feature("autodoc", ":param E:
	:type E: TopoDS_Edge
	:param FindKeep: default value is Standard_True
	:type FindKeep: bool
	:rtype: int") SectionEdge;
		Standard_Integer SectionEdge (const TopoDS_Edge & E,const Standard_Boolean FindKeep = Standard_True);

		/****************** SetNewSurface ******************/
		%feature("compactdefaultargs") SetNewSurface;
		%feature("autodoc", ":param F:
	:type F: TopoDS_Shape
	:param S:
	:type S: Geom_Surface
	:rtype: None") SetNewSurface;
		void SetNewSurface (const TopoDS_Shape & F,const opencascade::handle<Geom_Surface> & S);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "* returns the shape of index I stored in the map myShapes, accessing a list of interference.
	:param I:
	:type I: int
	:param FindKeep: default value is Standard_True
	:type FindKeep: bool
	:rtype: TopoDS_Shape") Shape;
		const TopoDS_Shape  Shape (const Standard_Integer I,const Standard_Boolean FindKeep = Standard_True);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "* returns the index of shape <S> stored in the map myShapes, accessing a list of interference. returns 0 if <S> is not in the map.
	:param S:
	:type S: TopoDS_Shape
	:param FindKeep: default value is Standard_True
	:type FindKeep: bool
	:rtype: int") Shape;
		Standard_Integer Shape (const TopoDS_Shape & S,const Standard_Boolean FindKeep = Standard_True);

		/****************** ShapeInterferences ******************/
		%feature("compactdefaultargs") ShapeInterferences;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param FindKeep: default value is Standard_True
	:type FindKeep: bool
	:rtype: TopOpeBRepDS_ListOfInterference") ShapeInterferences;
		const TopOpeBRepDS_ListOfInterference & ShapeInterferences (const TopoDS_Shape & S,const Standard_Boolean FindKeep = Standard_True);

		/****************** ShapeInterferences ******************/
		%feature("compactdefaultargs") ShapeInterferences;
		%feature("autodoc", ":param I:
	:type I: int
	:param FindKeep: default value is Standard_True
	:type FindKeep: bool
	:rtype: TopOpeBRepDS_ListOfInterference") ShapeInterferences;
		const TopOpeBRepDS_ListOfInterference & ShapeInterferences (const Standard_Integer I,const Standard_Boolean FindKeep = Standard_True);

		/****************** ShapeSameDomain ******************/
		%feature("compactdefaultargs") ShapeSameDomain;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: TopTools_ListOfShape") ShapeSameDomain;
		const TopTools_ListOfShape & ShapeSameDomain (const TopoDS_Shape & S);

		/****************** ShapeSameDomain ******************/
		%feature("compactdefaultargs") ShapeSameDomain;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: TopTools_ListOfShape") ShapeSameDomain;
		const TopTools_ListOfShape & ShapeSameDomain (const Standard_Integer I);

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "* Returns the surface of index <I>.
	:param I:
	:type I: int
	:rtype: TopOpeBRepDS_Surface") Surface;
		const TopOpeBRepDS_Surface & Surface (const Standard_Integer I);

		/****************** SurfaceInterferences ******************/
		%feature("compactdefaultargs") SurfaceInterferences;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: TopOpeBRepDS_ListOfInterference") SurfaceInterferences;
		const TopOpeBRepDS_ListOfInterference & SurfaceInterferences (const Standard_Integer I);

		/****************** TopOpeBRepDS_DataStructure ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_DataStructure;
		%feature("autodoc", ":rtype: None") TopOpeBRepDS_DataStructure;
		 TopOpeBRepDS_DataStructure ();

		/****************** UnfillShapesSameDomain ******************/
		%feature("compactdefaultargs") UnfillShapesSameDomain;
		%feature("autodoc", ":param S1:
	:type S1: TopoDS_Shape
	:param S2:
	:type S2: TopoDS_Shape
	:rtype: None") UnfillShapesSameDomain;
		void UnfillShapesSameDomain (const TopoDS_Shape & S1,const TopoDS_Shape & S2);

};


%extend TopOpeBRepDS_DataStructure {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class TopOpeBRepDS_Dumper *
****************************/
%nodefaultctor TopOpeBRepDS_Dumper;
class TopOpeBRepDS_Dumper {
	public:
		/****************** SDumpRefOri ******************/
		%feature("compactdefaultargs") SDumpRefOri;
		%feature("autodoc", ":param K:
	:type K: TopOpeBRepDS_Kind
	:param I:
	:type I: int
	:rtype: TCollection_AsciiString") SDumpRefOri;
		TCollection_AsciiString SDumpRefOri (const TopOpeBRepDS_Kind K,const Standard_Integer I);

		/****************** SDumpRefOri ******************/
		%feature("compactdefaultargs") SDumpRefOri;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: TCollection_AsciiString") SDumpRefOri;
		TCollection_AsciiString SDumpRefOri (const TopoDS_Shape & S);

		/****************** SPrintShape ******************/
		%feature("compactdefaultargs") SPrintShape;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: TCollection_AsciiString") SPrintShape;
		TCollection_AsciiString SPrintShape (const Standard_Integer I);

		/****************** SPrintShape ******************/
		%feature("compactdefaultargs") SPrintShape;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: TCollection_AsciiString") SPrintShape;
		TCollection_AsciiString SPrintShape (const TopoDS_Shape & S);

		/****************** SPrintShapeRefOri ******************/
		%feature("compactdefaultargs") SPrintShapeRefOri;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param B: default value is ""
	:type B: TCollection_AsciiString
	:rtype: TCollection_AsciiString") SPrintShapeRefOri;
		TCollection_AsciiString SPrintShapeRefOri (const TopoDS_Shape & S,const TCollection_AsciiString & B = "");

		/****************** SPrintShapeRefOri ******************/
		%feature("compactdefaultargs") SPrintShapeRefOri;
		%feature("autodoc", ":param L:
	:type L: TopTools_ListOfShape
	:param B: default value is ""
	:type B: TCollection_AsciiString
	:rtype: TCollection_AsciiString") SPrintShapeRefOri;
		TCollection_AsciiString SPrintShapeRefOri (const TopTools_ListOfShape & L,const TCollection_AsciiString & B = "");

		/****************** TopOpeBRepDS_Dumper ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_Dumper;
		%feature("autodoc", ":param HDS:
	:type HDS: TopOpeBRepDS_HDataStructure
	:rtype: None") TopOpeBRepDS_Dumper;
		 TopOpeBRepDS_Dumper (const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

};


%extend TopOpeBRepDS_Dumper {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class TopOpeBRepDS_EIR *
*************************/
%nodefaultctor TopOpeBRepDS_EIR;
class TopOpeBRepDS_EIR {
	public:
		/****************** ProcessEdgeInterferences ******************/
		%feature("compactdefaultargs") ProcessEdgeInterferences;
		%feature("autodoc", ":rtype: None") ProcessEdgeInterferences;
		void ProcessEdgeInterferences ();

		/****************** ProcessEdgeInterferences ******************/
		%feature("compactdefaultargs") ProcessEdgeInterferences;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: None") ProcessEdgeInterferences;
		void ProcessEdgeInterferences (const Standard_Integer I);

		/****************** TopOpeBRepDS_EIR ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_EIR;
		%feature("autodoc", ":param HDS:
	:type HDS: TopOpeBRepDS_HDataStructure
	:rtype: None") TopOpeBRepDS_EIR;
		 TopOpeBRepDS_EIR (const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

};


%extend TopOpeBRepDS_EIR {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class TopOpeBRepDS_Edge3dInterferenceTool *
********************************************/
%nodefaultctor TopOpeBRepDS_Edge3dInterferenceTool;
class TopOpeBRepDS_Edge3dInterferenceTool {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", ":param Eref:
	:type Eref: TopoDS_Shape
	:param E:
	:type E: TopoDS_Shape
	:param F:
	:type F: TopoDS_Shape
	:param I:
	:type I: TopOpeBRepDS_Interference
	:rtype: None") Add;
		void Add (const TopoDS_Shape & Eref,const TopoDS_Shape & E,const TopoDS_Shape & F,const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param Eref:
	:type Eref: TopoDS_Shape
	:param E:
	:type E: TopoDS_Shape
	:param F:
	:type F: TopoDS_Shape
	:param I:
	:type I: TopOpeBRepDS_Interference
	:rtype: None") Init;
		void Init (const TopoDS_Shape & Eref,const TopoDS_Shape & E,const TopoDS_Shape & F,const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** InitPointVertex ******************/
		%feature("compactdefaultargs") InitPointVertex;
		%feature("autodoc", ":param IsVertex:
	:type IsVertex: int
	:param VonOO:
	:type VonOO: TopoDS_Shape
	:rtype: None") InitPointVertex;
		void InitPointVertex (const Standard_Integer IsVertex,const TopoDS_Shape & VonOO);

		/****************** TopOpeBRepDS_Edge3dInterferenceTool ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_Edge3dInterferenceTool;
		%feature("autodoc", ":rtype: None") TopOpeBRepDS_Edge3dInterferenceTool;
		 TopOpeBRepDS_Edge3dInterferenceTool ();

		/****************** Transition ******************/
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", ":param I:
	:type I: TopOpeBRepDS_Interference
	:rtype: None") Transition;
		void Transition (const opencascade::handle<TopOpeBRepDS_Interference> & I);

};


%extend TopOpeBRepDS_Edge3dInterferenceTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class TopOpeBRepDS_EdgeInterferenceTool *
******************************************/
%nodefaultctor TopOpeBRepDS_EdgeInterferenceTool;
class TopOpeBRepDS_EdgeInterferenceTool {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", ":param E:
	:type E: TopoDS_Shape
	:param V:
	:type V: TopoDS_Shape
	:param I:
	:type I: TopOpeBRepDS_Interference
	:rtype: None") Add;
		void Add (const TopoDS_Shape & E,const TopoDS_Shape & V,const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", ":param E:
	:type E: TopoDS_Shape
	:param P:
	:type P: TopOpeBRepDS_Point
	:param I:
	:type I: TopOpeBRepDS_Interference
	:rtype: None") Add;
		void Add (const TopoDS_Shape & E,const TopOpeBRepDS_Point & P,const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param E:
	:type E: TopoDS_Shape
	:param I:
	:type I: TopOpeBRepDS_Interference
	:rtype: None") Init;
		void Init (const TopoDS_Shape & E,const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** TopOpeBRepDS_EdgeInterferenceTool ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_EdgeInterferenceTool;
		%feature("autodoc", ":rtype: None") TopOpeBRepDS_EdgeInterferenceTool;
		 TopOpeBRepDS_EdgeInterferenceTool ();

		/****************** Transition ******************/
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", ":param I:
	:type I: TopOpeBRepDS_Interference
	:rtype: None") Transition;
		void Transition (const opencascade::handle<TopOpeBRepDS_Interference> & I);

};


%extend TopOpeBRepDS_EdgeInterferenceTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class TopOpeBRepDS_Explorer *
******************************/
%nodefaultctor TopOpeBRepDS_Explorer;
class TopOpeBRepDS_Explorer {
	public:
		/****************** Current ******************/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", ":rtype: TopoDS_Shape") Current;
		const TopoDS_Shape  Current ();

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", ":rtype: TopoDS_Edge") Edge;
		const TopoDS_Edge  Edge ();

		/****************** Face ******************/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", ":rtype: TopoDS_Face") Face;
		const TopoDS_Face  Face ();

		/****************** Index ******************/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", ":rtype: int") Index;
		Standard_Integer Index ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param HDS:
	:type HDS: TopOpeBRepDS_HDataStructure
	:param T: default value is TopAbs_SHAPE
	:type T: TopAbs_ShapeEnum
	:param findkeep: default value is Standard_True
	:type findkeep: bool
	:rtype: None") Init;
		void Init (const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS,const TopAbs_ShapeEnum T = TopAbs_SHAPE,const Standard_Boolean findkeep = Standard_True);

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", ":rtype: bool") More;
		Standard_Boolean More ();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", ":rtype: None") Next;
		void Next ();

		/****************** TopOpeBRepDS_Explorer ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_Explorer;
		%feature("autodoc", ":rtype: None") TopOpeBRepDS_Explorer;
		 TopOpeBRepDS_Explorer ();

		/****************** TopOpeBRepDS_Explorer ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_Explorer;
		%feature("autodoc", ":param HDS:
	:type HDS: TopOpeBRepDS_HDataStructure
	:param T: default value is TopAbs_SHAPE
	:type T: TopAbs_ShapeEnum
	:param findkeep: default value is Standard_True
	:type findkeep: bool
	:rtype: None") TopOpeBRepDS_Explorer;
		 TopOpeBRepDS_Explorer (const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS,const TopAbs_ShapeEnum T = TopAbs_SHAPE,const Standard_Boolean findkeep = Standard_True);

		/****************** Type ******************/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", ":rtype: TopAbs_ShapeEnum") Type;
		TopAbs_ShapeEnum Type ();

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", ":rtype: TopoDS_Vertex") Vertex;
		const TopoDS_Vertex  Vertex ();

};


%extend TopOpeBRepDS_Explorer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class TopOpeBRepDS_FIR *
*************************/
%nodefaultctor TopOpeBRepDS_FIR;
class TopOpeBRepDS_FIR {
	public:
		/****************** ProcessFaceInterferences ******************/
		%feature("compactdefaultargs") ProcessFaceInterferences;
		%feature("autodoc", ":param M:
	:type M: TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State
	:rtype: None") ProcessFaceInterferences;
		void ProcessFaceInterferences (const TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State & M);

		/****************** ProcessFaceInterferences ******************/
		%feature("compactdefaultargs") ProcessFaceInterferences;
		%feature("autodoc", ":param I:
	:type I: int
	:param M:
	:type M: TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State
	:rtype: None") ProcessFaceInterferences;
		void ProcessFaceInterferences (const Standard_Integer I,const TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State & M);

		/****************** TopOpeBRepDS_FIR ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_FIR;
		%feature("autodoc", ":param HDS:
	:type HDS: TopOpeBRepDS_HDataStructure
	:rtype: None") TopOpeBRepDS_FIR;
		 TopOpeBRepDS_FIR (const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

};


%extend TopOpeBRepDS_FIR {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class TopOpeBRepDS_FaceInterferenceTool *
******************************************/
%nodefaultctor TopOpeBRepDS_FaceInterferenceTool;
class TopOpeBRepDS_FaceInterferenceTool {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Eisnew = true if E is a new edge built on edge I->Geometry() false if E is shape <=> I->Geometry()
	:param FI:
	:type FI: TopoDS_Shape
	:param F:
	:type F: TopoDS_Shape
	:param E:
	:type E: TopoDS_Shape
	:param Eisnew:
	:type Eisnew: bool
	:param I:
	:type I: TopOpeBRepDS_Interference
	:rtype: None") Add;
		void Add (const TopoDS_Shape & FI,const TopoDS_Shape & F,const TopoDS_Shape & E,const Standard_Boolean Eisnew,const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", ":param E:
	:type E: TopoDS_Shape
	:param C:
	:type C: TopOpeBRepDS_Curve
	:param I:
	:type I: TopOpeBRepDS_Interference
	:rtype: None") Add;
		void Add (const TopoDS_Shape & E,const TopOpeBRepDS_Curve & C,const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** GetEdgePntPar ******************/
		%feature("compactdefaultargs") GetEdgePntPar;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt
	:param par:
	:type par: float
	:rtype: None") GetEdgePntPar;
		void GetEdgePntPar (gp_Pnt & P,Standard_Real &OutValue);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Eisnew = true if E is a new edge built on edge I->Geometry() false if E is shape <=> I->Geometry()
	:param FI:
	:type FI: TopoDS_Shape
	:param E:
	:type E: TopoDS_Shape
	:param Eisnew:
	:type Eisnew: bool
	:param I:
	:type I: TopOpeBRepDS_Interference
	:rtype: None") Init;
		void Init (const TopoDS_Shape & FI,const TopoDS_Shape & E,const Standard_Boolean Eisnew,const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** IsEdgePntParDef ******************/
		%feature("compactdefaultargs") IsEdgePntParDef;
		%feature("autodoc", ":rtype: bool") IsEdgePntParDef;
		Standard_Boolean IsEdgePntParDef ();

		/****************** SetEdgePntPar ******************/
		%feature("compactdefaultargs") SetEdgePntPar;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt
	:param par:
	:type par: float
	:rtype: None") SetEdgePntPar;
		void SetEdgePntPar (const gp_Pnt & P,const Standard_Real par);

		/****************** TopOpeBRepDS_FaceInterferenceTool ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_FaceInterferenceTool;
		%feature("autodoc", ":param P:
	:type P: TopOpeBRepDS_PDataStructure
	:rtype: None") TopOpeBRepDS_FaceInterferenceTool;
		 TopOpeBRepDS_FaceInterferenceTool (const TopOpeBRepDS_PDataStructure & P);

		/****************** Transition ******************/
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", ":param I:
	:type I: TopOpeBRepDS_Interference
	:rtype: None") Transition;
		void Transition (const opencascade::handle<TopOpeBRepDS_Interference> & I);

};


%extend TopOpeBRepDS_FaceInterferenceTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class TopOpeBRepDS_Filter *
****************************/
%nodefaultctor TopOpeBRepDS_Filter;
class TopOpeBRepDS_Filter {
	public:
		/****************** ProcessCurveInterferences ******************/
		%feature("compactdefaultargs") ProcessCurveInterferences;
		%feature("autodoc", ":rtype: None") ProcessCurveInterferences;
		void ProcessCurveInterferences ();

		/****************** ProcessCurveInterferences ******************/
		%feature("compactdefaultargs") ProcessCurveInterferences;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: None") ProcessCurveInterferences;
		void ProcessCurveInterferences (const Standard_Integer I);

		/****************** ProcessEdgeInterferences ******************/
		%feature("compactdefaultargs") ProcessEdgeInterferences;
		%feature("autodoc", ":rtype: None") ProcessEdgeInterferences;
		void ProcessEdgeInterferences ();

		/****************** ProcessEdgeInterferences ******************/
		%feature("compactdefaultargs") ProcessEdgeInterferences;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: None") ProcessEdgeInterferences;
		void ProcessEdgeInterferences (const Standard_Integer I);

		/****************** ProcessFaceInterferences ******************/
		%feature("compactdefaultargs") ProcessFaceInterferences;
		%feature("autodoc", ":param MEsp:
	:type MEsp: TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State
	:rtype: None") ProcessFaceInterferences;
		void ProcessFaceInterferences (const TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State & MEsp);

		/****************** ProcessFaceInterferences ******************/
		%feature("compactdefaultargs") ProcessFaceInterferences;
		%feature("autodoc", ":param I:
	:type I: int
	:param MEsp:
	:type MEsp: TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State
	:rtype: None") ProcessFaceInterferences;
		void ProcessFaceInterferences (const Standard_Integer I,const TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State & MEsp);

		/****************** ProcessInterferences ******************/
		%feature("compactdefaultargs") ProcessInterferences;
		%feature("autodoc", ":rtype: None") ProcessInterferences;
		void ProcessInterferences ();

		/****************** TopOpeBRepDS_Filter ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_Filter;
		%feature("autodoc", ":param HDS:
	:type HDS: TopOpeBRepDS_HDataStructure
	:param pClassif: default value is 0
	:type pClassif: TopOpeBRepTool_PShapeClassifier
	:rtype: None") TopOpeBRepDS_Filter;
		 TopOpeBRepDS_Filter (const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS,const TopOpeBRepTool_PShapeClassifier & pClassif = 0);

};


%extend TopOpeBRepDS_Filter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class TopOpeBRepDS_GapFiller *
*******************************/
%nodefaultctor TopOpeBRepDS_GapFiller;
class TopOpeBRepDS_GapFiller {
	public:
		/****************** AddPointsOnConnexShape ******************/
		%feature("compactdefaultargs") AddPointsOnConnexShape;
		%feature("autodoc", "* Methodes pour reduire la liste des Points qui peuvent correspondre a une Point donne.
	:param F:
	:type F: TopoDS_Shape
	:param LI:
	:type LI: TopOpeBRepDS_ListOfInterference
	:rtype: None") AddPointsOnConnexShape;
		void AddPointsOnConnexShape (const TopoDS_Shape & F,const TopOpeBRepDS_ListOfInterference & LI);

		/****************** AddPointsOnShape ******************/
		%feature("compactdefaultargs") AddPointsOnShape;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param LI:
	:type LI: TopOpeBRepDS_ListOfInterference
	:rtype: None") AddPointsOnShape;
		void AddPointsOnShape (const TopoDS_Shape & S,TopOpeBRepDS_ListOfInterference & LI);

		/****************** BuildNewGeometries ******************/
		%feature("compactdefaultargs") BuildNewGeometries;
		%feature("autodoc", ":rtype: None") BuildNewGeometries;
		void BuildNewGeometries ();

		/****************** CheckConnexity ******************/
		%feature("compactdefaultargs") CheckConnexity;
		%feature("autodoc", "* Enchaine les sections via les points d'Interferences deja associe; Renvoit dans <L> les points extremites des Lignes. Methodes pour construire la liste des Points qui peuvent correspondre a une Point donne.
	:param LI:
	:type LI: TopOpeBRepDS_ListOfInterference
	:rtype: bool") CheckConnexity;
		Standard_Boolean CheckConnexity (TopOpeBRepDS_ListOfInterference & LI);

		/****************** FilterByEdge ******************/
		%feature("compactdefaultargs") FilterByEdge;
		%feature("autodoc", ":param E:
	:type E: TopoDS_Edge
	:param LI:
	:type LI: TopOpeBRepDS_ListOfInterference
	:rtype: None") FilterByEdge;
		void FilterByEdge (const TopoDS_Edge & E,TopOpeBRepDS_ListOfInterference & LI);

		/****************** FilterByFace ******************/
		%feature("compactdefaultargs") FilterByFace;
		%feature("autodoc", ":param F:
	:type F: TopoDS_Face
	:param LI:
	:type LI: TopOpeBRepDS_ListOfInterference
	:rtype: None") FilterByFace;
		void FilterByFace (const TopoDS_Face & F,TopOpeBRepDS_ListOfInterference & LI);

		/****************** FilterByIncidentDistance ******************/
		%feature("compactdefaultargs") FilterByIncidentDistance;
		%feature("autodoc", ":param F:
	:type F: TopoDS_Face
	:param I:
	:type I: TopOpeBRepDS_Interference
	:param LI:
	:type LI: TopOpeBRepDS_ListOfInterference
	:rtype: None") FilterByIncidentDistance;
		void FilterByIncidentDistance (const TopoDS_Face & F,const opencascade::handle<TopOpeBRepDS_Interference> & I,TopOpeBRepDS_ListOfInterference & LI);

		/****************** FindAssociatedPoints ******************/
		%feature("compactdefaultargs") FindAssociatedPoints;
		%feature("autodoc", "* Recherche parmi l'ensemble des points d'Interference la Liste <LI> des points qui correspondent au point d'indice <Index>
	:param I:
	:type I: TopOpeBRepDS_Interference
	:param LI:
	:type LI: TopOpeBRepDS_ListOfInterference
	:rtype: None") FindAssociatedPoints;
		void FindAssociatedPoints (const opencascade::handle<TopOpeBRepDS_Interference> & I,TopOpeBRepDS_ListOfInterference & LI);

		/****************** IsOnEdge ******************/
		%feature("compactdefaultargs") IsOnEdge;
		%feature("autodoc", "* Return True si I ou une de ses representaions a pour support <E>. Methodes de reconstructions des geometries des point et des courbes de section
	:param I:
	:type I: TopOpeBRepDS_Interference
	:param E:
	:type E: TopoDS_Edge
	:rtype: bool") IsOnEdge;
		Standard_Boolean IsOnEdge (const opencascade::handle<TopOpeBRepDS_Interference> & I,const TopoDS_Edge & E);

		/****************** IsOnFace ******************/
		%feature("compactdefaultargs") IsOnFace;
		%feature("autodoc", "* Return True si I a ete obtenu par une intersection avec <F>.
	:param I:
	:type I: TopOpeBRepDS_Interference
	:param F:
	:type F: TopoDS_Face
	:rtype: bool") IsOnFace;
		Standard_Boolean IsOnFace (const opencascade::handle<TopOpeBRepDS_Interference> & I,const TopoDS_Face & F);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":rtype: None") Perform;
		void Perform ();

		/****************** ReBuildGeom ******************/
		%feature("compactdefaultargs") ReBuildGeom;
		%feature("autodoc", ":param I1:
	:type I1: TopOpeBRepDS_Interference
	:param Done:
	:type Done: TColStd_MapOfInteger
	:rtype: None") ReBuildGeom;
		void ReBuildGeom (const opencascade::handle<TopOpeBRepDS_Interference> & I1,TColStd_MapOfInteger & Done);

		/****************** TopOpeBRepDS_GapFiller ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_GapFiller;
		%feature("autodoc", ":param HDS:
	:type HDS: TopOpeBRepDS_HDataStructure
	:rtype: None") TopOpeBRepDS_GapFiller;
		 TopOpeBRepDS_GapFiller (const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

};


%extend TopOpeBRepDS_GapFiller {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class TopOpeBRepDS_GapTool *
*****************************/
%nodefaultctor TopOpeBRepDS_GapTool;
class TopOpeBRepDS_GapTool : public Standard_Transient {
	public:
		/****************** ChangeSameInterferences ******************/
		%feature("compactdefaultargs") ChangeSameInterferences;
		%feature("autodoc", ":param I:
	:type I: TopOpeBRepDS_Interference
	:rtype: TopOpeBRepDS_ListOfInterference") ChangeSameInterferences;
		TopOpeBRepDS_ListOfInterference & ChangeSameInterferences (const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", ":param I:
	:type I: TopOpeBRepDS_Interference
	:param C:
	:type C: TopOpeBRepDS_Curve
	:rtype: bool") Curve;
		Standard_Boolean Curve (const opencascade::handle<TopOpeBRepDS_Interference> & I,TopOpeBRepDS_Curve & C);

		/****************** EdgeSupport ******************/
		%feature("compactdefaultargs") EdgeSupport;
		%feature("autodoc", ":param I:
	:type I: TopOpeBRepDS_Interference
	:param E:
	:type E: TopoDS_Shape
	:rtype: bool") EdgeSupport;
		Standard_Boolean EdgeSupport (const opencascade::handle<TopOpeBRepDS_Interference> & I,TopoDS_Shape & E);

		/****************** FacesSupport ******************/
		%feature("compactdefaultargs") FacesSupport;
		%feature("autodoc", "* Return les faces qui ont genere la section origine de I
	:param I:
	:type I: TopOpeBRepDS_Interference
	:param F1:
	:type F1: TopoDS_Shape
	:param F2:
	:type F2: TopoDS_Shape
	:rtype: bool") FacesSupport;
		Standard_Boolean FacesSupport (const opencascade::handle<TopOpeBRepDS_Interference> & I,TopoDS_Shape & F1,TopoDS_Shape & F2);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param HDS:
	:type HDS: TopOpeBRepDS_HDataStructure
	:rtype: None") Init;
		void Init (const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

		/****************** Interferences ******************/
		%feature("compactdefaultargs") Interferences;
		%feature("autodoc", ":param IndexPoint:
	:type IndexPoint: int
	:rtype: TopOpeBRepDS_ListOfInterference") Interferences;
		const TopOpeBRepDS_ListOfInterference & Interferences (const Standard_Integer IndexPoint);

		/****************** ParameterOnEdge ******************/
		%feature("compactdefaultargs") ParameterOnEdge;
		%feature("autodoc", ":param I:
	:type I: TopOpeBRepDS_Interference
	:param E:
	:type E: TopoDS_Shape
	:param U:
	:type U: float
	:rtype: bool") ParameterOnEdge;
		Standard_Boolean ParameterOnEdge (const opencascade::handle<TopOpeBRepDS_Interference> & I,const TopoDS_Shape & E,Standard_Real &OutValue);

		/****************** SameInterferences ******************/
		%feature("compactdefaultargs") SameInterferences;
		%feature("autodoc", ":param I:
	:type I: TopOpeBRepDS_Interference
	:rtype: TopOpeBRepDS_ListOfInterference") SameInterferences;
		const TopOpeBRepDS_ListOfInterference & SameInterferences (const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** SetParameterOnEdge ******************/
		%feature("compactdefaultargs") SetParameterOnEdge;
		%feature("autodoc", ":param I:
	:type I: TopOpeBRepDS_Interference
	:param E:
	:type E: TopoDS_Shape
	:param U:
	:type U: float
	:rtype: None") SetParameterOnEdge;
		void SetParameterOnEdge (const opencascade::handle<TopOpeBRepDS_Interference> & I,const TopoDS_Shape & E,const Standard_Real U);

		/****************** SetPoint ******************/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", ":param I:
	:type I: TopOpeBRepDS_Interference
	:param IndexPoint:
	:type IndexPoint: int
	:rtype: None") SetPoint;
		void SetPoint (const opencascade::handle<TopOpeBRepDS_Interference> & I,const Standard_Integer IndexPoint);

		/****************** TopOpeBRepDS_GapTool ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_GapTool;
		%feature("autodoc", ":rtype: None") TopOpeBRepDS_GapTool;
		 TopOpeBRepDS_GapTool ();

		/****************** TopOpeBRepDS_GapTool ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_GapTool;
		%feature("autodoc", ":param HDS:
	:type HDS: TopOpeBRepDS_HDataStructure
	:rtype: None") TopOpeBRepDS_GapTool;
		 TopOpeBRepDS_GapTool (const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

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
%nodefaultctor TopOpeBRepDS_GeometryData;
class TopOpeBRepDS_GeometryData {
	public:
		/****************** AddInterference ******************/
		%feature("compactdefaultargs") AddInterference;
		%feature("autodoc", ":param I:
	:type I: TopOpeBRepDS_Interference
	:rtype: None") AddInterference;
		void AddInterference (const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** Assign ******************/
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", ":param Other:
	:type Other: TopOpeBRepDS_GeometryData
	:rtype: None") Assign;
		void Assign (const TopOpeBRepDS_GeometryData & Other);

		/****************** ChangeInterferences ******************/
		%feature("compactdefaultargs") ChangeInterferences;
		%feature("autodoc", ":rtype: TopOpeBRepDS_ListOfInterference") ChangeInterferences;
		TopOpeBRepDS_ListOfInterference & ChangeInterferences ();

		/****************** Interferences ******************/
		%feature("compactdefaultargs") Interferences;
		%feature("autodoc", ":rtype: TopOpeBRepDS_ListOfInterference") Interferences;
		const TopOpeBRepDS_ListOfInterference & Interferences ();

		/****************** TopOpeBRepDS_GeometryData ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_GeometryData;
		%feature("autodoc", ":rtype: None") TopOpeBRepDS_GeometryData;
		 TopOpeBRepDS_GeometryData ();

		/****************** TopOpeBRepDS_GeometryData ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_GeometryData;
		%feature("autodoc", ":param Other:
	:type Other: TopOpeBRepDS_GeometryData
	:rtype: None") TopOpeBRepDS_GeometryData;
		 TopOpeBRepDS_GeometryData (const TopOpeBRepDS_GeometryData & Other);

		/****************** operator = ******************/
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", ":param Other:
	:type Other: TopOpeBRepDS_GeometryData
	:rtype: None") operator =;
		void operator = (const TopOpeBRepDS_GeometryData & Other);

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
%nodefaultctor TopOpeBRepDS_Interference;
class TopOpeBRepDS_Interference : public Standard_Transient {
	public:
		/****************** ChangeTransition ******************/
		%feature("compactdefaultargs") ChangeTransition;
		%feature("autodoc", ":rtype: TopOpeBRepDS_Transition") ChangeTransition;
		TopOpeBRepDS_Transition & ChangeTransition ();

		/****************** GKGSKS ******************/
		%feature("compactdefaultargs") GKGSKS;
		%feature("autodoc", "* return GeometryType + Geometry + SupportType + Support
	:param GK:
	:type GK: TopOpeBRepDS_Kind
	:param G:
	:type G: int
	:param SK:
	:type SK: TopOpeBRepDS_Kind
	:param S:
	:type S: int
	:rtype: None") GKGSKS;
		void GKGSKS (TopOpeBRepDS_Kind & GK,Standard_Integer &OutValue,TopOpeBRepDS_Kind & SK,Standard_Integer &OutValue);

		/****************** Geometry ******************/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", ":rtype: int") Geometry;
		Standard_Integer Geometry ();

		/****************** Geometry ******************/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", ":param G:
	:type G: int
	:rtype: None") Geometry;
		void Geometry (const Standard_Integer G);

		/****************** GeometryType ******************/
		%feature("compactdefaultargs") GeometryType;
		%feature("autodoc", ":rtype: TopOpeBRepDS_Kind") GeometryType;
		TopOpeBRepDS_Kind GeometryType ();

		/****************** GeometryType ******************/
		%feature("compactdefaultargs") GeometryType;
		%feature("autodoc", ":param GT:
	:type GT: TopOpeBRepDS_Kind
	:rtype: None") GeometryType;
		void GeometryType (const TopOpeBRepDS_Kind GT);

		/****************** HasSameGeometry ******************/
		%feature("compactdefaultargs") HasSameGeometry;
		%feature("autodoc", ":param Other:
	:type Other: TopOpeBRepDS_Interference
	:rtype: bool") HasSameGeometry;
		Standard_Boolean HasSameGeometry (const opencascade::handle<TopOpeBRepDS_Interference> & Other);

		/****************** HasSameSupport ******************/
		%feature("compactdefaultargs") HasSameSupport;
		%feature("autodoc", ":param Other:
	:type Other: TopOpeBRepDS_Interference
	:rtype: bool") HasSameSupport;
		Standard_Boolean HasSameSupport (const opencascade::handle<TopOpeBRepDS_Interference> & Other);

		/****************** SetGeometry ******************/
		%feature("compactdefaultargs") SetGeometry;
		%feature("autodoc", ":param GI:
	:type GI: int
	:rtype: None") SetGeometry;
		void SetGeometry (const Standard_Integer GI);

		/****************** Support ******************/
		%feature("compactdefaultargs") Support;
		%feature("autodoc", ":rtype: int") Support;
		Standard_Integer Support ();

		/****************** Support ******************/
		%feature("compactdefaultargs") Support;
		%feature("autodoc", ":param S:
	:type S: int
	:rtype: None") Support;
		void Support (const Standard_Integer S);

		/****************** SupportType ******************/
		%feature("compactdefaultargs") SupportType;
		%feature("autodoc", ":rtype: TopOpeBRepDS_Kind") SupportType;
		TopOpeBRepDS_Kind SupportType ();

		/****************** SupportType ******************/
		%feature("compactdefaultargs") SupportType;
		%feature("autodoc", ":param ST:
	:type ST: TopOpeBRepDS_Kind
	:rtype: None") SupportType;
		void SupportType (const TopOpeBRepDS_Kind ST);

		/****************** TopOpeBRepDS_Interference ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_Interference;
		%feature("autodoc", ":rtype: None") TopOpeBRepDS_Interference;
		 TopOpeBRepDS_Interference ();

		/****************** TopOpeBRepDS_Interference ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_Interference;
		%feature("autodoc", ":param Transition:
	:type Transition: TopOpeBRepDS_Transition
	:param SupportType:
	:type SupportType: TopOpeBRepDS_Kind
	:param Support:
	:type Support: int
	:param GeometryType:
	:type GeometryType: TopOpeBRepDS_Kind
	:param Geometry:
	:type Geometry: int
	:rtype: None") TopOpeBRepDS_Interference;
		 TopOpeBRepDS_Interference (const TopOpeBRepDS_Transition & Transition,const TopOpeBRepDS_Kind SupportType,const Standard_Integer Support,const TopOpeBRepDS_Kind GeometryType,const Standard_Integer Geometry);

		/****************** TopOpeBRepDS_Interference ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_Interference;
		%feature("autodoc", ":param I:
	:type I: TopOpeBRepDS_Interference
	:rtype: None") TopOpeBRepDS_Interference;
		 TopOpeBRepDS_Interference (const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** Transition ******************/
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", ":rtype: TopOpeBRepDS_Transition") Transition;
		const TopOpeBRepDS_Transition & Transition ();

		/****************** Transition ******************/
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", ":param T:
	:type T: TopOpeBRepDS_Transition
	:rtype: None") Transition;
		void Transition (const TopOpeBRepDS_Transition & T);

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
%nodefaultctor TopOpeBRepDS_InterferenceIterator;
class TopOpeBRepDS_InterferenceIterator {
	public:
		/****************** ChangeIterator ******************/
		%feature("compactdefaultargs") ChangeIterator;
		%feature("autodoc", ":rtype: TopOpeBRepDS_ListIteratorOfListOfInterference") ChangeIterator;
		TopOpeBRepDS_ListIteratorOfListOfInterference & ChangeIterator ();

		/****************** Geometry ******************/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "* define a condition on interference iteration process. Interference must match the Geometry <G>
	:param G:
	:type G: int
	:rtype: None") Geometry;
		void Geometry (const Standard_Integer G);

		/****************** GeometryKind ******************/
		%feature("compactdefaultargs") GeometryKind;
		%feature("autodoc", "* define a condition on interference iteration process. Interference must match the Geometry Kind <ST>
	:param GK:
	:type GK: TopOpeBRepDS_Kind
	:rtype: None") GeometryKind;
		void GeometryKind (const TopOpeBRepDS_Kind GK);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* re-initialize interference iteration process on the list of interference <L>. Conditions are not modified.
	:param L:
	:type L: TopOpeBRepDS_ListOfInterference
	:rtype: None") Init;
		void Init (const TopOpeBRepDS_ListOfInterference & L);

		/****************** Match ******************/
		%feature("compactdefaultargs") Match;
		%feature("autodoc", "* reach for an interference matching the conditions (if defined).
	:rtype: None") Match;
		void Match ();

		/****************** MatchInterference ******************/
		%feature("compactdefaultargs") MatchInterference;
		%feature("autodoc", "* Returns True if the Interference <I> matches the conditions (if defined). If no conditions defined, returns True.
	:param I:
	:type I: TopOpeBRepDS_Interference
	:rtype: bool") MatchInterference;
		virtual Standard_Boolean MatchInterference (const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "* Returns True if there is a current Interference in the iteration.
	:rtype: bool") More;
		Standard_Boolean More ();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "* Move to the next Interference.
	:rtype: None") Next;
		void Next ();

		/****************** Support ******************/
		%feature("compactdefaultargs") Support;
		%feature("autodoc", "* define a condition on interference iteration process. Interference must match the Support <S>
	:param S:
	:type S: int
	:rtype: None") Support;
		void Support (const Standard_Integer S);

		/****************** SupportKind ******************/
		%feature("compactdefaultargs") SupportKind;
		%feature("autodoc", "* define a condition on interference iteration process. Interference must match the Support Kind <ST>
	:param ST:
	:type ST: TopOpeBRepDS_Kind
	:rtype: None") SupportKind;
		void SupportKind (const TopOpeBRepDS_Kind ST);

		/****************** TopOpeBRepDS_InterferenceIterator ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_InterferenceIterator;
		%feature("autodoc", ":rtype: None") TopOpeBRepDS_InterferenceIterator;
		 TopOpeBRepDS_InterferenceIterator ();

		/****************** TopOpeBRepDS_InterferenceIterator ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_InterferenceIterator;
		%feature("autodoc", "* Creates an iterator on the Interference of list <L>.
	:param L:
	:type L: TopOpeBRepDS_ListOfInterference
	:rtype: None") TopOpeBRepDS_InterferenceIterator;
		 TopOpeBRepDS_InterferenceIterator (const TopOpeBRepDS_ListOfInterference & L);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the current Interference, matching the conditions (if defined).
	:rtype: opencascade::handle<TopOpeBRepDS_Interference>") Value;
		const opencascade::handle<TopOpeBRepDS_Interference> & Value ();

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
		%feature("autodoc", "* duplicate I in a new interference with Complement() transition.
	:param I:
	:type I: TopOpeBRepDS_Interference
	:rtype: opencascade::handle<TopOpeBRepDS_Interference>") DuplicateCurvePointInterference;
		static opencascade::handle<TopOpeBRepDS_Interference> DuplicateCurvePointInterference (const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** MakeCurveInterference ******************/
		%feature("compactdefaultargs") MakeCurveInterference;
		%feature("autodoc", ":param T:
	:type T: TopOpeBRepDS_Transition
	:param SK:
	:type SK: TopOpeBRepDS_Kind
	:param SI:
	:type SI: int
	:param GK:
	:type GK: TopOpeBRepDS_Kind
	:param GI:
	:type GI: int
	:param P:
	:type P: float
	:rtype: opencascade::handle<TopOpeBRepDS_Interference>") MakeCurveInterference;
		static opencascade::handle<TopOpeBRepDS_Interference> MakeCurveInterference (const TopOpeBRepDS_Transition & T,const TopOpeBRepDS_Kind SK,const Standard_Integer SI,const TopOpeBRepDS_Kind GK,const Standard_Integer GI,const Standard_Real P);

		/****************** MakeEdgeInterference ******************/
		%feature("compactdefaultargs") MakeEdgeInterference;
		%feature("autodoc", ":param T:
	:type T: TopOpeBRepDS_Transition
	:param SK:
	:type SK: TopOpeBRepDS_Kind
	:param SI:
	:type SI: int
	:param GK:
	:type GK: TopOpeBRepDS_Kind
	:param GI:
	:type GI: int
	:param P:
	:type P: float
	:rtype: opencascade::handle<TopOpeBRepDS_Interference>") MakeEdgeInterference;
		static opencascade::handle<TopOpeBRepDS_Interference> MakeEdgeInterference (const TopOpeBRepDS_Transition & T,const TopOpeBRepDS_Kind SK,const Standard_Integer SI,const TopOpeBRepDS_Kind GK,const Standard_Integer GI,const Standard_Real P);

		/****************** MakeEdgeVertexInterference ******************/
		%feature("compactdefaultargs") MakeEdgeVertexInterference;
		%feature("autodoc", ":param Transition:
	:type Transition: TopOpeBRepDS_Transition
	:param EdgeI:
	:type EdgeI: int
	:param VertexI:
	:type VertexI: int
	:param VertexIsBound:
	:type VertexIsBound: bool
	:param Config:
	:type Config: TopOpeBRepDS_Config
	:param param:
	:type param: float
	:rtype: opencascade::handle<TopOpeBRepDS_Interference>") MakeEdgeVertexInterference;
		static opencascade::handle<TopOpeBRepDS_Interference> MakeEdgeVertexInterference (const TopOpeBRepDS_Transition & Transition,const Standard_Integer EdgeI,const Standard_Integer VertexI,const Standard_Boolean VertexIsBound,const TopOpeBRepDS_Config Config,const Standard_Real param);

		/****************** MakeFaceCurveInterference ******************/
		%feature("compactdefaultargs") MakeFaceCurveInterference;
		%feature("autodoc", ":param Transition:
	:type Transition: TopOpeBRepDS_Transition
	:param FaceI:
	:type FaceI: int
	:param CurveI:
	:type CurveI: int
	:param PC:
	:type PC: Geom2d_Curve
	:rtype: opencascade::handle<TopOpeBRepDS_Interference>") MakeFaceCurveInterference;
		static opencascade::handle<TopOpeBRepDS_Interference> MakeFaceCurveInterference (const TopOpeBRepDS_Transition & Transition,const Standard_Integer FaceI,const Standard_Integer CurveI,const opencascade::handle<Geom2d_Curve> & PC);

		/****************** MakeFaceEdgeInterference ******************/
		%feature("compactdefaultargs") MakeFaceEdgeInterference;
		%feature("autodoc", ":param Transition:
	:type Transition: TopOpeBRepDS_Transition
	:param FaceI:
	:type FaceI: int
	:param EdgeI:
	:type EdgeI: int
	:param EdgeIsBound:
	:type EdgeIsBound: bool
	:param Config:
	:type Config: TopOpeBRepDS_Config
	:rtype: opencascade::handle<TopOpeBRepDS_Interference>") MakeFaceEdgeInterference;
		static opencascade::handle<TopOpeBRepDS_Interference> MakeFaceEdgeInterference (const TopOpeBRepDS_Transition & Transition,const Standard_Integer FaceI,const Standard_Integer EdgeI,const Standard_Boolean EdgeIsBound,const TopOpeBRepDS_Config Config);

		/****************** MakeSolidSurfaceInterference ******************/
		%feature("compactdefaultargs") MakeSolidSurfaceInterference;
		%feature("autodoc", ":param Transition:
	:type Transition: TopOpeBRepDS_Transition
	:param SolidI:
	:type SolidI: int
	:param SurfaceI:
	:type SurfaceI: int
	:rtype: opencascade::handle<TopOpeBRepDS_Interference>") MakeSolidSurfaceInterference;
		static opencascade::handle<TopOpeBRepDS_Interference> MakeSolidSurfaceInterference (const TopOpeBRepDS_Transition & Transition,const Standard_Integer SolidI,const Standard_Integer SurfaceI);

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", ":param CPI:
	:type CPI: TopOpeBRepDS_Interference
	:rtype: float") Parameter;
		static Standard_Real Parameter (const opencascade::handle<TopOpeBRepDS_Interference> & CPI);

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", ":param CPI:
	:type CPI: TopOpeBRepDS_Interference
	:param Par:
	:type Par: float
	:rtype: void") Parameter;
		static void Parameter (const opencascade::handle<TopOpeBRepDS_Interference> & CPI,const Standard_Real Par);

};


%extend TopOpeBRepDS_InterferenceTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class TopOpeBRepDS_ListOfShapeOn1State *
*****************************************/
%nodefaultctor TopOpeBRepDS_ListOfShapeOn1State;
class TopOpeBRepDS_ListOfShapeOn1State {
	public:
		/****************** ChangeListOnState ******************/
		%feature("compactdefaultargs") ChangeListOnState;
		%feature("autodoc", ":rtype: TopTools_ListOfShape") ChangeListOnState;
		TopTools_ListOfShape & ChangeListOnState ();

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", ":rtype: None") Clear;
		void Clear ();

		/****************** IsSplit ******************/
		%feature("compactdefaultargs") IsSplit;
		%feature("autodoc", ":rtype: bool") IsSplit;
		Standard_Boolean IsSplit ();

		/****************** ListOnState ******************/
		%feature("compactdefaultargs") ListOnState;
		%feature("autodoc", ":rtype: TopTools_ListOfShape") ListOnState;
		const TopTools_ListOfShape & ListOnState ();

		/****************** Split ******************/
		%feature("compactdefaultargs") Split;
		%feature("autodoc", ":param B: default value is Standard_True
	:type B: bool
	:rtype: None") Split;
		void Split (const Standard_Boolean B = Standard_True);

		/****************** TopOpeBRepDS_ListOfShapeOn1State ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_ListOfShapeOn1State;
		%feature("autodoc", ":rtype: None") TopOpeBRepDS_ListOfShapeOn1State;
		 TopOpeBRepDS_ListOfShapeOn1State ();

};


%extend TopOpeBRepDS_ListOfShapeOn1State {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class TopOpeBRepDS_Marker *
****************************/
%nodefaultctor TopOpeBRepDS_Marker;
class TopOpeBRepDS_Marker : public Standard_Transient {
	public:
		/****************** Allocate ******************/
		%feature("compactdefaultargs") Allocate;
		%feature("autodoc", ":param n:
	:type n: int
	:rtype: None") Allocate;
		void Allocate (const Standard_Integer n);

		/****************** GetI ******************/
		%feature("compactdefaultargs") GetI;
		%feature("autodoc", ":param i:
	:type i: int
	:rtype: bool") GetI;
		Standard_Boolean GetI (const Standard_Integer i);

		/****************** Reset ******************/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", ":rtype: None") Reset;
		void Reset ();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", ":param i:
	:type i: int
	:param b:
	:type b: bool
	:rtype: None") Set;
		void Set (const Standard_Integer i,const Standard_Boolean b);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", ":param b:
	:type b: bool
	:param n:
	:type n: int
	:param a:
	:type a: Standard_Address
	:rtype: None") Set;
		void Set (const Standard_Boolean b,const Standard_Integer n,const Standard_Address a);

		/****************** TopOpeBRepDS_Marker ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_Marker;
		%feature("autodoc", ":rtype: None") TopOpeBRepDS_Marker;
		 TopOpeBRepDS_Marker ();

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
%nodefaultctor TopOpeBRepDS_Point;
class TopOpeBRepDS_Point {
	public:
		/****************** ChangeKeep ******************/
		%feature("compactdefaultargs") ChangeKeep;
		%feature("autodoc", ":param B:
	:type B: bool
	:rtype: None") ChangeKeep;
		void ChangeKeep (const Standard_Boolean B);

		/****************** ChangePoint ******************/
		%feature("compactdefaultargs") ChangePoint;
		%feature("autodoc", ":rtype: gp_Pnt") ChangePoint;
		gp_Pnt  ChangePoint ();

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", ":param other:
	:type other: TopOpeBRepDS_Point
	:rtype: bool") IsEqual;
		Standard_Boolean IsEqual (const TopOpeBRepDS_Point & other);

		/****************** Keep ******************/
		%feature("compactdefaultargs") Keep;
		%feature("autodoc", ":rtype: bool") Keep;
		Standard_Boolean Keep ();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", ":rtype: gp_Pnt") Point;
		const gp_Pnt  Point ();

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", ":rtype: float") Tolerance;
		Standard_Real Tolerance ();

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", ":param Tol:
	:type Tol: float
	:rtype: None") Tolerance;
		void Tolerance (const Standard_Real Tol);

		/****************** TopOpeBRepDS_Point ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_Point;
		%feature("autodoc", ":rtype: None") TopOpeBRepDS_Point;
		 TopOpeBRepDS_Point ();

		/****************** TopOpeBRepDS_Point ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_Point;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt
	:param T:
	:type T: float
	:rtype: None") TopOpeBRepDS_Point;
		 TopOpeBRepDS_Point (const gp_Pnt & P,const Standard_Real T);

		/****************** TopOpeBRepDS_Point ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_Point;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: None") TopOpeBRepDS_Point;
		 TopOpeBRepDS_Point (const TopoDS_Shape & S);

};


%extend TopOpeBRepDS_Point {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class TopOpeBRepDS_PointExplorer *
***********************************/
%nodefaultctor TopOpeBRepDS_PointExplorer;
class TopOpeBRepDS_PointExplorer {
	public:
		/****************** Index ******************/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", ":rtype: int") Index;
		Standard_Integer Index ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param DS:
	:type DS: TopOpeBRepDS_DataStructure
	:param FindOnlyKeep: default value is Standard_True
	:type FindOnlyKeep: bool
	:rtype: None") Init;
		void Init (const TopOpeBRepDS_DataStructure & DS,const Standard_Boolean FindOnlyKeep = Standard_True);

		/****************** IsPoint ******************/
		%feature("compactdefaultargs") IsPoint;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: bool") IsPoint;
		Standard_Boolean IsPoint (const Standard_Integer I);

		/****************** IsPointKeep ******************/
		%feature("compactdefaultargs") IsPointKeep;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: bool") IsPointKeep;
		Standard_Boolean IsPointKeep (const Standard_Integer I);

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", ":rtype: bool") More;
		Standard_Boolean More ();

		/****************** NbPoint ******************/
		%feature("compactdefaultargs") NbPoint;
		%feature("autodoc", ":rtype: int") NbPoint;
		Standard_Integer NbPoint ();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", ":rtype: None") Next;
		void Next ();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", ":rtype: TopOpeBRepDS_Point") Point;
		const TopOpeBRepDS_Point & Point ();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: TopOpeBRepDS_Point") Point;
		const TopOpeBRepDS_Point & Point (const Standard_Integer I);

		/****************** TopOpeBRepDS_PointExplorer ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_PointExplorer;
		%feature("autodoc", ":rtype: None") TopOpeBRepDS_PointExplorer;
		 TopOpeBRepDS_PointExplorer ();

		/****************** TopOpeBRepDS_PointExplorer ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_PointExplorer;
		%feature("autodoc", ":param DS:
	:type DS: TopOpeBRepDS_DataStructure
	:param FindOnlyKeep: default value is Standard_True
	:type FindOnlyKeep: bool
	:rtype: None") TopOpeBRepDS_PointExplorer;
		 TopOpeBRepDS_PointExplorer (const TopOpeBRepDS_DataStructure & DS,const Standard_Boolean FindOnlyKeep = Standard_True);

};


%extend TopOpeBRepDS_PointExplorer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class TopOpeBRepDS_Reducer *
*****************************/
%nodefaultctor TopOpeBRepDS_Reducer;
class TopOpeBRepDS_Reducer {
	public:
		/****************** ProcessEdgeInterferences ******************/
		%feature("compactdefaultargs") ProcessEdgeInterferences;
		%feature("autodoc", ":rtype: None") ProcessEdgeInterferences;
		void ProcessEdgeInterferences ();

		/****************** ProcessFaceInterferences ******************/
		%feature("compactdefaultargs") ProcessFaceInterferences;
		%feature("autodoc", ":param M:
	:type M: TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State
	:rtype: None") ProcessFaceInterferences;
		void ProcessFaceInterferences (const TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State & M);

		/****************** TopOpeBRepDS_Reducer ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_Reducer;
		%feature("autodoc", ":param HDS:
	:type HDS: TopOpeBRepDS_HDataStructure
	:rtype: None") TopOpeBRepDS_Reducer;
		 TopOpeBRepDS_Reducer (const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

};


%extend TopOpeBRepDS_Reducer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class TopOpeBRepDS_ShapeData *
*******************************/
%nodefaultctor TopOpeBRepDS_ShapeData;
class TopOpeBRepDS_ShapeData {
	public:
		/****************** ChangeInterferences ******************/
		%feature("compactdefaultargs") ChangeInterferences;
		%feature("autodoc", ":rtype: TopOpeBRepDS_ListOfInterference") ChangeInterferences;
		TopOpeBRepDS_ListOfInterference & ChangeInterferences ();

		/****************** ChangeKeep ******************/
		%feature("compactdefaultargs") ChangeKeep;
		%feature("autodoc", ":param B:
	:type B: bool
	:rtype: None") ChangeKeep;
		void ChangeKeep (const Standard_Boolean B);

		/****************** Interferences ******************/
		%feature("compactdefaultargs") Interferences;
		%feature("autodoc", ":rtype: TopOpeBRepDS_ListOfInterference") Interferences;
		const TopOpeBRepDS_ListOfInterference & Interferences ();

		/****************** Keep ******************/
		%feature("compactdefaultargs") Keep;
		%feature("autodoc", ":rtype: bool") Keep;
		Standard_Boolean Keep ();

		/****************** TopOpeBRepDS_ShapeData ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_ShapeData;
		%feature("autodoc", ":rtype: None") TopOpeBRepDS_ShapeData;
		 TopOpeBRepDS_ShapeData ();

};


%extend TopOpeBRepDS_ShapeData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class TopOpeBRepDS_ShapeWithState *
************************************/
%nodefaultctor TopOpeBRepDS_ShapeWithState;
class TopOpeBRepDS_ShapeWithState {
	public:
		/****************** AddPart ******************/
		%feature("compactdefaultargs") AddPart;
		%feature("autodoc", ":param aShape:
	:type aShape: TopoDS_Shape
	:param aState:
	:type aState: TopAbs_State
	:rtype: None") AddPart;
		void AddPart (const TopoDS_Shape & aShape,const TopAbs_State aState);

		/****************** AddParts ******************/
		%feature("compactdefaultargs") AddParts;
		%feature("autodoc", ":param aListOfShape:
	:type aListOfShape: TopTools_ListOfShape
	:param aState:
	:type aState: TopAbs_State
	:rtype: None") AddParts;
		void AddParts (const TopTools_ListOfShape & aListOfShape,const TopAbs_State aState);

		/****************** IsSplitted ******************/
		%feature("compactdefaultargs") IsSplitted;
		%feature("autodoc", ":rtype: bool") IsSplitted;
		Standard_Boolean IsSplitted ();

		/****************** Part ******************/
		%feature("compactdefaultargs") Part;
		%feature("autodoc", ":param aState:
	:type aState: TopAbs_State
	:rtype: TopTools_ListOfShape") Part;
		const TopTools_ListOfShape & Part (const TopAbs_State aState);

		/****************** SetIsSplitted ******************/
		%feature("compactdefaultargs") SetIsSplitted;
		%feature("autodoc", ":param anIsSplitted:
	:type anIsSplitted: bool
	:rtype: None") SetIsSplitted;
		void SetIsSplitted (const Standard_Boolean anIsSplitted);

		/****************** SetState ******************/
		%feature("compactdefaultargs") SetState;
		%feature("autodoc", ":param aState:
	:type aState: TopAbs_State
	:rtype: None") SetState;
		void SetState (const TopAbs_State aState);

		/****************** State ******************/
		%feature("compactdefaultargs") State;
		%feature("autodoc", ":rtype: TopAbs_State") State;
		TopAbs_State State ();

		/****************** TopOpeBRepDS_ShapeWithState ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_ShapeWithState;
		%feature("autodoc", ":rtype: None") TopOpeBRepDS_ShapeWithState;
		 TopOpeBRepDS_ShapeWithState ();

};


%extend TopOpeBRepDS_ShapeWithState {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class TopOpeBRepDS_Surface *
*****************************/
%nodefaultctor TopOpeBRepDS_Surface;
class TopOpeBRepDS_Surface {
	public:
		/****************** Assign ******************/
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", ":param Other:
	:type Other: TopOpeBRepDS_Surface
	:rtype: None") Assign;
		void Assign (const TopOpeBRepDS_Surface & Other);

		/****************** ChangeKeep ******************/
		%feature("compactdefaultargs") ChangeKeep;
		%feature("autodoc", ":param theToKeep:
	:type theToKeep: bool
	:rtype: None") ChangeKeep;
		void ChangeKeep (Standard_Boolean theToKeep);

		/****************** Keep ******************/
		%feature("compactdefaultargs") Keep;
		%feature("autodoc", ":rtype: bool") Keep;
		Standard_Boolean Keep ();

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", ":rtype: opencascade::handle<Geom_Surface>") Surface;
		const opencascade::handle<Geom_Surface> & Surface ();

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", ":rtype: float") Tolerance;
		Standard_Real Tolerance ();

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "* Update the tolerance
	:param theTol:
	:type theTol: float
	:rtype: None") Tolerance;
		void Tolerance (Standard_Real theTol);

		/****************** TopOpeBRepDS_Surface ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_Surface;
		%feature("autodoc", ":rtype: None") TopOpeBRepDS_Surface;
		 TopOpeBRepDS_Surface ();

		/****************** TopOpeBRepDS_Surface ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_Surface;
		%feature("autodoc", ":param P:
	:type P: Geom_Surface
	:param T:
	:type T: float
	:rtype: None") TopOpeBRepDS_Surface;
		 TopOpeBRepDS_Surface (const opencascade::handle<Geom_Surface> & P,const Standard_Real T);

		/****************** TopOpeBRepDS_Surface ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_Surface;
		%feature("autodoc", ":param Other:
	:type Other: TopOpeBRepDS_Surface
	:rtype: None") TopOpeBRepDS_Surface;
		 TopOpeBRepDS_Surface (const TopOpeBRepDS_Surface & Other);

		/****************** operator = ******************/
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", ":param Other:
	:type Other: TopOpeBRepDS_Surface
	:rtype: None") operator =;
		void operator = (const TopOpeBRepDS_Surface & Other);

};


%extend TopOpeBRepDS_Surface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class TopOpeBRepDS_SurfaceExplorer *
*************************************/
%nodefaultctor TopOpeBRepDS_SurfaceExplorer;
class TopOpeBRepDS_SurfaceExplorer {
	public:
		/****************** Index ******************/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", ":rtype: int") Index;
		Standard_Integer Index ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param DS:
	:type DS: TopOpeBRepDS_DataStructure
	:param FindOnlyKeep: default value is Standard_True
	:type FindOnlyKeep: bool
	:rtype: None") Init;
		void Init (const TopOpeBRepDS_DataStructure & DS,const Standard_Boolean FindOnlyKeep = Standard_True);

		/****************** IsSurface ******************/
		%feature("compactdefaultargs") IsSurface;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: bool") IsSurface;
		Standard_Boolean IsSurface (const Standard_Integer I);

		/****************** IsSurfaceKeep ******************/
		%feature("compactdefaultargs") IsSurfaceKeep;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: bool") IsSurfaceKeep;
		Standard_Boolean IsSurfaceKeep (const Standard_Integer I);

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", ":rtype: bool") More;
		Standard_Boolean More ();

		/****************** NbSurface ******************/
		%feature("compactdefaultargs") NbSurface;
		%feature("autodoc", ":rtype: int") NbSurface;
		Standard_Integer NbSurface ();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", ":rtype: None") Next;
		void Next ();

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", ":rtype: TopOpeBRepDS_Surface") Surface;
		const TopOpeBRepDS_Surface & Surface ();

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: TopOpeBRepDS_Surface") Surface;
		const TopOpeBRepDS_Surface & Surface (const Standard_Integer I);

		/****************** TopOpeBRepDS_SurfaceExplorer ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_SurfaceExplorer;
		%feature("autodoc", ":rtype: None") TopOpeBRepDS_SurfaceExplorer;
		 TopOpeBRepDS_SurfaceExplorer ();

		/****************** TopOpeBRepDS_SurfaceExplorer ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_SurfaceExplorer;
		%feature("autodoc", ":param DS:
	:type DS: TopOpeBRepDS_DataStructure
	:param FindOnlyKeep: default value is Standard_True
	:type FindOnlyKeep: bool
	:rtype: None") TopOpeBRepDS_SurfaceExplorer;
		 TopOpeBRepDS_SurfaceExplorer (const TopOpeBRepDS_DataStructure & DS,const Standard_Boolean FindOnlyKeep = Standard_True);

};


%extend TopOpeBRepDS_SurfaceExplorer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class TopOpeBRepDS_TKI *
*************************/
%nodefaultctor TopOpeBRepDS_TKI;
class TopOpeBRepDS_TKI {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", ":param K:
	:type K: TopOpeBRepDS_Kind
	:param G:
	:type G: int
	:rtype: None") Add;
		void Add (const TopOpeBRepDS_Kind K,const Standard_Integer G);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", ":param K:
	:type K: TopOpeBRepDS_Kind
	:param G:
	:type G: int
	:param HI:
	:type HI: TopOpeBRepDS_Interference
	:rtype: None") Add;
		void Add (const TopOpeBRepDS_Kind K,const Standard_Integer G,const opencascade::handle<TopOpeBRepDS_Interference> & HI);

		/****************** ChangeInterferences ******************/
		%feature("compactdefaultargs") ChangeInterferences;
		%feature("autodoc", ":param K:
	:type K: TopOpeBRepDS_Kind
	:param G:
	:type G: int
	:rtype: TopOpeBRepDS_ListOfInterference") ChangeInterferences;
		TopOpeBRepDS_ListOfInterference & ChangeInterferences (const TopOpeBRepDS_Kind K,const Standard_Integer G);

		/****************** ChangeValue ******************/
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", ":param K:
	:type K: TopOpeBRepDS_Kind
	:param G:
	:type G: int
	:rtype: TopOpeBRepDS_ListOfInterference") ChangeValue;
		TopOpeBRepDS_ListOfInterference & ChangeValue (TopOpeBRepDS_Kind & K,Standard_Integer &OutValue);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", ":rtype: None") Clear;
		void Clear ();

		/****************** DumpTKIIterator ******************/
		%feature("compactdefaultargs") DumpTKIIterator;
		%feature("autodoc", ":param s1: default value is ""
	:type s1: TCollection_AsciiString
	:param s2: default value is ""
	:type s2: TCollection_AsciiString
	:rtype: None") DumpTKIIterator;
		void DumpTKIIterator (const TCollection_AsciiString & s1 = "",const TCollection_AsciiString & s2 = "");

		/****************** FillOnGeometry ******************/
		%feature("compactdefaultargs") FillOnGeometry;
		%feature("autodoc", ":param L:
	:type L: TopOpeBRepDS_ListOfInterference
	:rtype: None") FillOnGeometry;
		void FillOnGeometry (const TopOpeBRepDS_ListOfInterference & L);

		/****************** FillOnSupport ******************/
		%feature("compactdefaultargs") FillOnSupport;
		%feature("autodoc", ":param L:
	:type L: TopOpeBRepDS_ListOfInterference
	:rtype: None") FillOnSupport;
		void FillOnSupport (const TopOpeBRepDS_ListOfInterference & L);

		/****************** HasInterferences ******************/
		%feature("compactdefaultargs") HasInterferences;
		%feature("autodoc", ":param K:
	:type K: TopOpeBRepDS_Kind
	:param G:
	:type G: int
	:rtype: bool") HasInterferences;
		Standard_Boolean HasInterferences (const TopOpeBRepDS_Kind K,const Standard_Integer G);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":rtype: None") Init;
		void Init ();

		/****************** Interferences ******************/
		%feature("compactdefaultargs") Interferences;
		%feature("autodoc", ":param K:
	:type K: TopOpeBRepDS_Kind
	:param G:
	:type G: int
	:rtype: TopOpeBRepDS_ListOfInterference") Interferences;
		const TopOpeBRepDS_ListOfInterference & Interferences (const TopOpeBRepDS_Kind K,const Standard_Integer G);

		/****************** IsBound ******************/
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", ":param K:
	:type K: TopOpeBRepDS_Kind
	:param G:
	:type G: int
	:rtype: bool") IsBound;
		Standard_Boolean IsBound (const TopOpeBRepDS_Kind K,const Standard_Integer G);

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", ":rtype: bool") More;
		Standard_Boolean More ();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", ":rtype: None") Next;
		void Next ();

		/****************** TopOpeBRepDS_TKI ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_TKI;
		%feature("autodoc", ":rtype: None") TopOpeBRepDS_TKI;
		 TopOpeBRepDS_TKI ();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":param K:
	:type K: TopOpeBRepDS_Kind
	:param G:
	:type G: int
	:rtype: TopOpeBRepDS_ListOfInterference") Value;
		const TopOpeBRepDS_ListOfInterference & Value (TopOpeBRepDS_Kind & K,Standard_Integer &OutValue);

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
		%feature("autodoc", ":param HDS:
	:type HDS: TopOpeBRepDS_HDataStructure
	:param E:
	:type E: TopoDS_Edge
	:param lEsd:
	:type lEsd: TopTools_ListOfShape
	:rtype: int") EShareG;
		static Standard_Integer EShareG (const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS,const TopoDS_Edge & E,TopTools_ListOfShape & lEsd);

		/****************** GetConfig ******************/
		%feature("compactdefaultargs") GetConfig;
		%feature("autodoc", ":param HDS:
	:type HDS: TopOpeBRepDS_HDataStructure
	:param MEspON:
	:type MEspON: TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State
	:param ie:
	:type ie: int
	:param iesd:
	:type iesd: int
	:param conf:
	:type conf: int
	:rtype: bool") GetConfig;
		static Standard_Boolean GetConfig (const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS,const TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State & MEspON,const Standard_Integer ie,const Standard_Integer iesd,Standard_Integer &OutValue);

		/****************** GetEsd ******************/
		%feature("compactdefaultargs") GetEsd;
		%feature("autodoc", ":param HDS:
	:type HDS: TopOpeBRepDS_HDataStructure
	:param S:
	:type S: TopoDS_Shape
	:param ie:
	:type ie: int
	:param iesd:
	:type iesd: int
	:rtype: bool") GetEsd;
		static Standard_Boolean GetEsd (const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS,const TopoDS_Shape & S,const Standard_Integer ie,Standard_Integer &OutValue);

		/****************** ShareG ******************/
		%feature("compactdefaultargs") ShareG;
		%feature("autodoc", ":param HDS:
	:type HDS: TopOpeBRepDS_HDataStructure
	:param is1:
	:type is1: int
	:param is2:
	:type is2: int
	:rtype: bool") ShareG;
		static Standard_Boolean ShareG (const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS,const Standard_Integer is1,const Standard_Integer is2);

		/****************** ShareSplitON ******************/
		%feature("compactdefaultargs") ShareSplitON;
		%feature("autodoc", ":param HDS:
	:type HDS: TopOpeBRepDS_HDataStructure
	:param MspON:
	:type MspON: TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State
	:param i1:
	:type i1: int
	:param i2:
	:type i2: int
	:param spON:
	:type spON: TopoDS_Shape
	:rtype: bool") ShareSplitON;
		static Standard_Boolean ShareSplitON (const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS,const TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State & MspON,const Standard_Integer i1,const Standard_Integer i2,TopoDS_Shape & spON);

};


%extend TopOpeBRepDS_TOOL {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class TopOpeBRepDS_Transition *
********************************/
%nodefaultctor TopOpeBRepDS_Transition;
class TopOpeBRepDS_Transition {
	public:
		/****************** After ******************/
		%feature("compactdefaultargs") After;
		%feature("autodoc", ":param S:
	:type S: TopAbs_State
	:param ShapeAfter: default value is TopAbs_FACE
	:type ShapeAfter: TopAbs_ShapeEnum
	:rtype: None") After;
		void After (const TopAbs_State S,const TopAbs_ShapeEnum ShapeAfter = TopAbs_FACE);

		/****************** After ******************/
		%feature("compactdefaultargs") After;
		%feature("autodoc", ":rtype: TopAbs_State") After;
		TopAbs_State After ();

		/****************** Before ******************/
		%feature("compactdefaultargs") Before;
		%feature("autodoc", ":param S:
	:type S: TopAbs_State
	:param ShapeBefore: default value is TopAbs_FACE
	:type ShapeBefore: TopAbs_ShapeEnum
	:rtype: None") Before;
		void Before (const TopAbs_State S,const TopAbs_ShapeEnum ShapeBefore = TopAbs_FACE);

		/****************** Before ******************/
		%feature("compactdefaultargs") Before;
		%feature("autodoc", ":rtype: TopAbs_State") Before;
		TopAbs_State Before ();

		/****************** Complement ******************/
		%feature("compactdefaultargs") Complement;
		%feature("autodoc", ":rtype: TopOpeBRepDS_Transition") Complement;
		TopOpeBRepDS_Transition Complement ();

		/****************** Index ******************/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: None") Index;
		void Index (const Standard_Integer I);

		/****************** Index ******************/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", ":rtype: int") Index;
		Standard_Integer Index ();

		/****************** IndexAfter ******************/
		%feature("compactdefaultargs") IndexAfter;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: None") IndexAfter;
		void IndexAfter (const Standard_Integer I);

		/****************** IndexAfter ******************/
		%feature("compactdefaultargs") IndexAfter;
		%feature("autodoc", ":rtype: int") IndexAfter;
		Standard_Integer IndexAfter ();

		/****************** IndexBefore ******************/
		%feature("compactdefaultargs") IndexBefore;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: None") IndexBefore;
		void IndexBefore (const Standard_Integer I);

		/****************** IndexBefore ******************/
		%feature("compactdefaultargs") IndexBefore;
		%feature("autodoc", ":rtype: int") IndexBefore;
		Standard_Integer IndexBefore ();

		/****************** IsUnknown ******************/
		%feature("compactdefaultargs") IsUnknown;
		%feature("autodoc", "* returns True if both states are UNKNOWN
	:rtype: bool") IsUnknown;
		Standard_Boolean IsUnknown ();

		/****************** ONAfter ******************/
		%feature("compactdefaultargs") ONAfter;
		%feature("autodoc", ":rtype: TopAbs_ShapeEnum") ONAfter;
		TopAbs_ShapeEnum ONAfter ();

		/****************** ONBefore ******************/
		%feature("compactdefaultargs") ONBefore;
		%feature("autodoc", ":rtype: TopAbs_ShapeEnum") ONBefore;
		TopAbs_ShapeEnum ONBefore ();

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "* returns the orientation corresponding to state <S> //! Before and After not equal TopAbs_ON : -------------------------------------- Before After Computed orientation //! S not S REVERSED (we leave state S) not S S FORWARD (we enter state S) S S INTERNAL (we stay in state S) not S not S EXTERNAL (we stay outside state S)
	:param S:
	:type S: TopAbs_State
	:param T: default value is TopAbs_FACE
	:type T: TopAbs_ShapeEnum
	:rtype: TopAbs_Orientation") Orientation;
		TopAbs_Orientation Orientation (const TopAbs_State S,const TopAbs_ShapeEnum T = TopAbs_FACE);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", ":param StateBefore:
	:type StateBefore: TopAbs_State
	:param StateAfter:
	:type StateAfter: TopAbs_State
	:param ShapeBefore: default value is TopAbs_FACE
	:type ShapeBefore: TopAbs_ShapeEnum
	:param ShapeAfter: default value is TopAbs_FACE
	:type ShapeAfter: TopAbs_ShapeEnum
	:rtype: None") Set;
		void Set (const TopAbs_State StateBefore,const TopAbs_State StateAfter,const TopAbs_ShapeEnum ShapeBefore = TopAbs_FACE,const TopAbs_ShapeEnum ShapeAfter = TopAbs_FACE);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* set the transition corresponding to orientation <O> //! O Before After //! FORWARD OUT IN REVERSED IN OUT INTERNAL IN IN EXTERNAL OUT OUT
	:param O:
	:type O: TopAbs_Orientation
	:rtype: None") Set;
		void Set (const TopAbs_Orientation O);

		/****************** ShapeAfter ******************/
		%feature("compactdefaultargs") ShapeAfter;
		%feature("autodoc", ":param SE:
	:type SE: TopAbs_ShapeEnum
	:rtype: None") ShapeAfter;
		void ShapeAfter (const TopAbs_ShapeEnum SE);

		/****************** ShapeAfter ******************/
		%feature("compactdefaultargs") ShapeAfter;
		%feature("autodoc", ":rtype: TopAbs_ShapeEnum") ShapeAfter;
		TopAbs_ShapeEnum ShapeAfter ();

		/****************** ShapeBefore ******************/
		%feature("compactdefaultargs") ShapeBefore;
		%feature("autodoc", ":param SE:
	:type SE: TopAbs_ShapeEnum
	:rtype: None") ShapeBefore;
		void ShapeBefore (const TopAbs_ShapeEnum SE);

		/****************** ShapeBefore ******************/
		%feature("compactdefaultargs") ShapeBefore;
		%feature("autodoc", ":rtype: TopAbs_ShapeEnum") ShapeBefore;
		TopAbs_ShapeEnum ShapeBefore ();

		/****************** StateAfter ******************/
		%feature("compactdefaultargs") StateAfter;
		%feature("autodoc", ":param S:
	:type S: TopAbs_State
	:rtype: None") StateAfter;
		void StateAfter (const TopAbs_State S);

		/****************** StateBefore ******************/
		%feature("compactdefaultargs") StateBefore;
		%feature("autodoc", ":param S:
	:type S: TopAbs_State
	:rtype: None") StateBefore;
		void StateBefore (const TopAbs_State S);

		/****************** TopOpeBRepDS_Transition ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_Transition;
		%feature("autodoc", ":rtype: None") TopOpeBRepDS_Transition;
		 TopOpeBRepDS_Transition ();

		/****************** TopOpeBRepDS_Transition ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_Transition;
		%feature("autodoc", ":param StateBefore:
	:type StateBefore: TopAbs_State
	:param StateAfter:
	:type StateAfter: TopAbs_State
	:param ShapeBefore: default value is TopAbs_FACE
	:type ShapeBefore: TopAbs_ShapeEnum
	:param ShapeAfter: default value is TopAbs_FACE
	:type ShapeAfter: TopAbs_ShapeEnum
	:rtype: None") TopOpeBRepDS_Transition;
		 TopOpeBRepDS_Transition (const TopAbs_State StateBefore,const TopAbs_State StateAfter,const TopAbs_ShapeEnum ShapeBefore = TopAbs_FACE,const TopAbs_ShapeEnum ShapeAfter = TopAbs_FACE);

		/****************** TopOpeBRepDS_Transition ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_Transition;
		%feature("autodoc", ":param O:
	:type O: TopAbs_Orientation
	:rtype: None") TopOpeBRepDS_Transition;
		 TopOpeBRepDS_Transition (const TopAbs_Orientation O);

};


%extend TopOpeBRepDS_Transition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class TopOpeBRepDS_CurveData *
*******************************/
%nodefaultctor TopOpeBRepDS_CurveData;
class TopOpeBRepDS_CurveData : public TopOpeBRepDS_GeometryData {
	public:
		/****************** TopOpeBRepDS_CurveData ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_CurveData;
		%feature("autodoc", ":rtype: None") TopOpeBRepDS_CurveData;
		 TopOpeBRepDS_CurveData ();

		/****************** TopOpeBRepDS_CurveData ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_CurveData;
		%feature("autodoc", ":param C:
	:type C: TopOpeBRepDS_Curve
	:rtype: None") TopOpeBRepDS_CurveData;
		 TopOpeBRepDS_CurveData (const TopOpeBRepDS_Curve & C);

};


%extend TopOpeBRepDS_CurveData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class TopOpeBRepDS_CurveIterator *
***********************************/
%nodefaultctor TopOpeBRepDS_CurveIterator;
class TopOpeBRepDS_CurveIterator : public TopOpeBRepDS_InterferenceIterator {
	public:
		/****************** Current ******************/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "* Index of the curve in the data structure.
	:rtype: int") Current;
		Standard_Integer Current ();

		/****************** MatchInterference ******************/
		%feature("compactdefaultargs") MatchInterference;
		%feature("autodoc", "* Returns True if the Interference <I> has a GeometryType() TopOpeBRepDS_CURVE returns False else.
	:param I:
	:type I: TopOpeBRepDS_Interference
	:rtype: bool") MatchInterference;
		virtual Standard_Boolean MatchInterference (const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", ":param S:
	:type S: TopAbs_State
	:rtype: TopAbs_Orientation") Orientation;
		TopAbs_Orientation Orientation (const TopAbs_State S);

		/****************** PCurve ******************/
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", ":rtype: opencascade::handle<Geom2d_Curve>") PCurve;
		const opencascade::handle<Geom2d_Curve> & PCurve ();

		/****************** TopOpeBRepDS_CurveIterator ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_CurveIterator;
		%feature("autodoc", "* Creates an iterator on the curves on surface described by the interferences in <L>.
	:param L:
	:type L: TopOpeBRepDS_ListOfInterference
	:rtype: None") TopOpeBRepDS_CurveIterator;
		 TopOpeBRepDS_CurveIterator (const TopOpeBRepDS_ListOfInterference & L);

};


%extend TopOpeBRepDS_CurveIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class TopOpeBRepDS_CurvePointInterference *
********************************************/
%nodefaultctor TopOpeBRepDS_CurvePointInterference;
class TopOpeBRepDS_CurvePointInterference : public TopOpeBRepDS_Interference {
	public:
		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", ":rtype: float") Parameter;
		Standard_Real Parameter ();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", ":param P:
	:type P: float
	:rtype: None") Parameter;
		void Parameter (const Standard_Real P);

		/****************** TopOpeBRepDS_CurvePointInterference ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_CurvePointInterference;
		%feature("autodoc", ":param T:
	:type T: TopOpeBRepDS_Transition
	:param ST:
	:type ST: TopOpeBRepDS_Kind
	:param S:
	:type S: int
	:param GT:
	:type GT: TopOpeBRepDS_Kind
	:param G:
	:type G: int
	:param P:
	:type P: float
	:rtype: None") TopOpeBRepDS_CurvePointInterference;
		 TopOpeBRepDS_CurvePointInterference (const TopOpeBRepDS_Transition & T,const TopOpeBRepDS_Kind ST,const Standard_Integer S,const TopOpeBRepDS_Kind GT,const Standard_Integer G,const Standard_Real P);

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
%nodefaultctor TopOpeBRepDS_PointData;
class TopOpeBRepDS_PointData : public TopOpeBRepDS_GeometryData {
	public:
		/****************** GetShapes ******************/
		%feature("compactdefaultargs") GetShapes;
		%feature("autodoc", ":param I1:
	:type I1: int
	:param I2:
	:type I2: int
	:rtype: None") GetShapes;
		void GetShapes (Standard_Integer &OutValue,Standard_Integer &OutValue);

		/****************** SetShapes ******************/
		%feature("compactdefaultargs") SetShapes;
		%feature("autodoc", ":param I1:
	:type I1: int
	:param I2:
	:type I2: int
	:rtype: None") SetShapes;
		void SetShapes (const Standard_Integer I1,const Standard_Integer I2);

		/****************** TopOpeBRepDS_PointData ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_PointData;
		%feature("autodoc", ":rtype: None") TopOpeBRepDS_PointData;
		 TopOpeBRepDS_PointData ();

		/****************** TopOpeBRepDS_PointData ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_PointData;
		%feature("autodoc", ":param P:
	:type P: TopOpeBRepDS_Point
	:rtype: None") TopOpeBRepDS_PointData;
		 TopOpeBRepDS_PointData (const TopOpeBRepDS_Point & P);

		/****************** TopOpeBRepDS_PointData ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_PointData;
		%feature("autodoc", ":param P:
	:type P: TopOpeBRepDS_Point
	:param I1:
	:type I1: int
	:param I2:
	:type I2: int
	:rtype: None") TopOpeBRepDS_PointData;
		 TopOpeBRepDS_PointData (const TopOpeBRepDS_Point & P,const Standard_Integer I1,const Standard_Integer I2);

};


%extend TopOpeBRepDS_PointData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class TopOpeBRepDS_PointIterator *
***********************************/
%nodefaultctor TopOpeBRepDS_PointIterator;
class TopOpeBRepDS_PointIterator : public TopOpeBRepDS_InterferenceIterator {
	public:
		/****************** Current ******************/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "* Index of the point in the data structure.
	:rtype: int") Current;
		Standard_Integer Current ();

		/****************** DiffOriented ******************/
		%feature("compactdefaultargs") DiffOriented;
		%feature("autodoc", ":rtype: bool") DiffOriented;
		Standard_Boolean DiffOriented ();

		/****************** IsPoint ******************/
		%feature("compactdefaultargs") IsPoint;
		%feature("autodoc", ":rtype: bool") IsPoint;
		Standard_Boolean IsPoint ();

		/****************** IsVertex ******************/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", ":rtype: bool") IsVertex;
		Standard_Boolean IsVertex ();

		/****************** MatchInterference ******************/
		%feature("compactdefaultargs") MatchInterference;
		%feature("autodoc", "* Returns True if the Interference <I> has a GeometryType() TopOpeBRepDS_POINT or TopOpeBRepDS_VERTEX returns False else.
	:param I:
	:type I: TopOpeBRepDS_Interference
	:rtype: bool") MatchInterference;
		virtual Standard_Boolean MatchInterference (const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", ":param S:
	:type S: TopAbs_State
	:rtype: TopAbs_Orientation") Orientation;
		TopAbs_Orientation Orientation (const TopAbs_State S);

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", ":rtype: float") Parameter;
		Standard_Real Parameter ();

		/****************** SameOriented ******************/
		%feature("compactdefaultargs") SameOriented;
		%feature("autodoc", ":rtype: bool") SameOriented;
		Standard_Boolean SameOriented ();

		/****************** Support ******************/
		%feature("compactdefaultargs") Support;
		%feature("autodoc", ":rtype: int") Support;
		Standard_Integer Support ();

		/****************** TopOpeBRepDS_PointIterator ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_PointIterator;
		%feature("autodoc", "* Creates an iterator on the points on curves described by the interferences in <L>.
	:param L:
	:type L: TopOpeBRepDS_ListOfInterference
	:rtype: None") TopOpeBRepDS_PointIterator;
		 TopOpeBRepDS_PointIterator (const TopOpeBRepDS_ListOfInterference & L);

};


%extend TopOpeBRepDS_PointIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class TopOpeBRepDS_ShapeShapeInterference *
********************************************/
%nodefaultctor TopOpeBRepDS_ShapeShapeInterference;
class TopOpeBRepDS_ShapeShapeInterference : public TopOpeBRepDS_Interference {
	public:
		/****************** Config ******************/
		%feature("compactdefaultargs") Config;
		%feature("autodoc", ":rtype: TopOpeBRepDS_Config") Config;
		TopOpeBRepDS_Config Config ();

		/****************** GBound ******************/
		%feature("compactdefaultargs") GBound;
		%feature("autodoc", ":rtype: bool") GBound;
		Standard_Boolean GBound ();

		/****************** SetGBound ******************/
		%feature("compactdefaultargs") SetGBound;
		%feature("autodoc", ":param b:
	:type b: bool
	:rtype: None") SetGBound;
		void SetGBound (const Standard_Boolean b);

		/****************** TopOpeBRepDS_ShapeShapeInterference ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_ShapeShapeInterference;
		%feature("autodoc", "* a shape interfers on shape <G> with shape <S>. examples : create a ShapeShapeInterference describing : vertex V of edge E1 found on edge E2 : ST,S,GT,G = TopOpeBRepDS_EDGE,E2,TopOpeBRepDS_VERTEX,V //! create a ShapeShapeInterference describing vertex V of edge E found on face F : ST,S,GT,G = TopOpeBRepDS_FACE,F,TopOpeBRepDS_VERTEX,V //! <GBound> indicates if shape <G> is a bound of shape <S>. //! <SCC> : UNSH_GEOMETRY : <S> and <Ancestor> have any types, <S> and <Ancestor> don't share the same geometry SAME_ORIENTED : <S> and <Ancestor> have identical types, <S> and <Ancestor> orientations are IDENTICAL. DIFF_ORIENTED : <S> and <Ancestor> have identical types, <S> and <Ancestor> orientations are DIFFERENT.
	:param T:
	:type T: TopOpeBRepDS_Transition
	:param ST:
	:type ST: TopOpeBRepDS_Kind
	:param S:
	:type S: int
	:param GT:
	:type GT: TopOpeBRepDS_Kind
	:param G:
	:type G: int
	:param GBound:
	:type GBound: bool
	:param C:
	:type C: TopOpeBRepDS_Config
	:rtype: None") TopOpeBRepDS_ShapeShapeInterference;
		 TopOpeBRepDS_ShapeShapeInterference (const TopOpeBRepDS_Transition & T,const TopOpeBRepDS_Kind ST,const Standard_Integer S,const TopOpeBRepDS_Kind GT,const Standard_Integer G,const Standard_Boolean GBound,const TopOpeBRepDS_Config C);

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
%nodefaultctor TopOpeBRepDS_SolidSurfaceInterference;
class TopOpeBRepDS_SolidSurfaceInterference : public TopOpeBRepDS_Interference {
	public:
		/****************** TopOpeBRepDS_SolidSurfaceInterference ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_SolidSurfaceInterference;
		%feature("autodoc", ":param Transition:
	:type Transition: TopOpeBRepDS_Transition
	:param SupportType:
	:type SupportType: TopOpeBRepDS_Kind
	:param Support:
	:type Support: int
	:param GeometryType:
	:type GeometryType: TopOpeBRepDS_Kind
	:param Geometry:
	:type Geometry: int
	:rtype: None") TopOpeBRepDS_SolidSurfaceInterference;
		 TopOpeBRepDS_SolidSurfaceInterference (const TopOpeBRepDS_Transition & Transition,const TopOpeBRepDS_Kind SupportType,const Standard_Integer Support,const TopOpeBRepDS_Kind GeometryType,const Standard_Integer Geometry);

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
%nodefaultctor TopOpeBRepDS_SurfaceCurveInterference;
class TopOpeBRepDS_SurfaceCurveInterference : public TopOpeBRepDS_Interference {
	public:
		/****************** PCurve ******************/
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", ":rtype: opencascade::handle<Geom2d_Curve>") PCurve;
		const opencascade::handle<Geom2d_Curve> & PCurve ();

		/****************** PCurve ******************/
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", ":param PC:
	:type PC: Geom2d_Curve
	:rtype: None") PCurve;
		void PCurve (const opencascade::handle<Geom2d_Curve> & PC);

		/****************** TopOpeBRepDS_SurfaceCurveInterference ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_SurfaceCurveInterference;
		%feature("autodoc", ":rtype: None") TopOpeBRepDS_SurfaceCurveInterference;
		 TopOpeBRepDS_SurfaceCurveInterference ();

		/****************** TopOpeBRepDS_SurfaceCurveInterference ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_SurfaceCurveInterference;
		%feature("autodoc", ":param Transition:
	:type Transition: TopOpeBRepDS_Transition
	:param SupportType:
	:type SupportType: TopOpeBRepDS_Kind
	:param Support:
	:type Support: int
	:param GeometryType:
	:type GeometryType: TopOpeBRepDS_Kind
	:param Geometry:
	:type Geometry: int
	:param PC:
	:type PC: Geom2d_Curve
	:rtype: None") TopOpeBRepDS_SurfaceCurveInterference;
		 TopOpeBRepDS_SurfaceCurveInterference (const TopOpeBRepDS_Transition & Transition,const TopOpeBRepDS_Kind SupportType,const Standard_Integer Support,const TopOpeBRepDS_Kind GeometryType,const Standard_Integer Geometry,const opencascade::handle<Geom2d_Curve> & PC);

		/****************** TopOpeBRepDS_SurfaceCurveInterference ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_SurfaceCurveInterference;
		%feature("autodoc", ":param I:
	:type I: TopOpeBRepDS_Interference
	:rtype: None") TopOpeBRepDS_SurfaceCurveInterference;
		 TopOpeBRepDS_SurfaceCurveInterference (const opencascade::handle<TopOpeBRepDS_Interference> & I);

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
%nodefaultctor TopOpeBRepDS_SurfaceData;
class TopOpeBRepDS_SurfaceData : public TopOpeBRepDS_GeometryData {
	public:
		/****************** TopOpeBRepDS_SurfaceData ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_SurfaceData;
		%feature("autodoc", ":rtype: None") TopOpeBRepDS_SurfaceData;
		 TopOpeBRepDS_SurfaceData ();

		/****************** TopOpeBRepDS_SurfaceData ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_SurfaceData;
		%feature("autodoc", ":param S:
	:type S: TopOpeBRepDS_Surface
	:rtype: None") TopOpeBRepDS_SurfaceData;
		 TopOpeBRepDS_SurfaceData (const TopOpeBRepDS_Surface & S);

};


%extend TopOpeBRepDS_SurfaceData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class TopOpeBRepDS_SurfaceIterator *
*************************************/
%nodefaultctor TopOpeBRepDS_SurfaceIterator;
class TopOpeBRepDS_SurfaceIterator : public TopOpeBRepDS_InterferenceIterator {
	public:
		/****************** Current ******************/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "* Index of the surface in the data structure.
	:rtype: int") Current;
		Standard_Integer Current ();

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", ":param S:
	:type S: TopAbs_State
	:rtype: TopAbs_Orientation") Orientation;
		TopAbs_Orientation Orientation (const TopAbs_State S);

		/****************** TopOpeBRepDS_SurfaceIterator ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_SurfaceIterator;
		%feature("autodoc", "* Creates an iterator on the Surfaces on solid described by the interferences in <L>.
	:param L:
	:type L: TopOpeBRepDS_ListOfInterference
	:rtype: None") TopOpeBRepDS_SurfaceIterator;
		 TopOpeBRepDS_SurfaceIterator (const TopOpeBRepDS_ListOfInterference & L);

};


%extend TopOpeBRepDS_SurfaceIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class TopOpeBRepDS_EdgeVertexInterference *
********************************************/
%nodefaultctor TopOpeBRepDS_EdgeVertexInterference;
class TopOpeBRepDS_EdgeVertexInterference : public TopOpeBRepDS_ShapeShapeInterference {
	public:
		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", ":rtype: float") Parameter;
		Standard_Real Parameter ();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", ":param P:
	:type P: float
	:rtype: None") Parameter;
		void Parameter (const Standard_Real P);

		/****************** TopOpeBRepDS_EdgeVertexInterference ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_EdgeVertexInterference;
		%feature("autodoc", "* Create an interference of VERTEX <G> on a crossed EDGE E. //! if support type <ST> == EDGE : <S> is edge E FACE : <S> is the face with bound E. <T> is the transition along the edge, crossing the crossed edge. E is the crossed edge. <GIsBound> indicates if <G> is a bound of the edge. <P> is the parameter of <G> on the edge. //! interference is stored in the list of interfs of the edge.
	:param T:
	:type T: TopOpeBRepDS_Transition
	:param ST:
	:type ST: TopOpeBRepDS_Kind
	:param S:
	:type S: int
	:param G:
	:type G: int
	:param GIsBound:
	:type GIsBound: bool
	:param C:
	:type C: TopOpeBRepDS_Config
	:param P:
	:type P: float
	:rtype: None") TopOpeBRepDS_EdgeVertexInterference;
		 TopOpeBRepDS_EdgeVertexInterference (const TopOpeBRepDS_Transition & T,const TopOpeBRepDS_Kind ST,const Standard_Integer S,const Standard_Integer G,const Standard_Boolean GIsBound,const TopOpeBRepDS_Config C,const Standard_Real P);

		/****************** TopOpeBRepDS_EdgeVertexInterference ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_EdgeVertexInterference;
		%feature("autodoc", "* Create an interference of VERTEX <G> on crossed EDGE <S>. //! <T> is the transition along the edge, crossing the crossed edge. <S> is the crossed edge. <GIsBound> indicates if <G> is a bound of the edge. <C> indicates the geometric configuration between the edge and the crossed edge. <P> is the parameter of <G> on the edge. //! interference is stored in the list of interfs of the edge.
	:param T:
	:type T: TopOpeBRepDS_Transition
	:param S:
	:type S: int
	:param G:
	:type G: int
	:param GIsBound:
	:type GIsBound: bool
	:param C:
	:type C: TopOpeBRepDS_Config
	:param P:
	:type P: float
	:rtype: None") TopOpeBRepDS_EdgeVertexInterference;
		 TopOpeBRepDS_EdgeVertexInterference (const TopOpeBRepDS_Transition & T,const Standard_Integer S,const Standard_Integer G,const Standard_Boolean GIsBound,const TopOpeBRepDS_Config C,const Standard_Real P);

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
%nodefaultctor TopOpeBRepDS_FaceEdgeInterference;
class TopOpeBRepDS_FaceEdgeInterference : public TopOpeBRepDS_ShapeShapeInterference {
	public:
		/****************** TopOpeBRepDS_FaceEdgeInterference ******************/
		%feature("compactdefaultargs") TopOpeBRepDS_FaceEdgeInterference;
		%feature("autodoc", "* Create an interference of EDGE <G> on FACE <S>.
	:param T:
	:type T: TopOpeBRepDS_Transition
	:param S:
	:type S: int
	:param G:
	:type G: int
	:param GIsBound:
	:type GIsBound: bool
	:param C:
	:type C: TopOpeBRepDS_Config
	:rtype: None") TopOpeBRepDS_FaceEdgeInterference;
		 TopOpeBRepDS_FaceEdgeInterference (const TopOpeBRepDS_Transition & T,const Standard_Integer S,const Standard_Integer G,const Standard_Boolean GIsBound,const TopOpeBRepDS_Config C);

};


%make_alias(TopOpeBRepDS_FaceEdgeInterference)

%extend TopOpeBRepDS_FaceEdgeInterference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

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
