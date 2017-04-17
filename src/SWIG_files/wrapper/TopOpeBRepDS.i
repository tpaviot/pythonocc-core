/*
Copyright 2008-2017 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") TopOpeBRepDS

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i


%include TopOpeBRepDS_headers.i


%pythoncode {
def register_handle(handle, base_object):
    """
    Inserts the handle into the base object to
    prevent memory corruption in certain cases
    """
    try:
        if base_object.IsKind("Standard_Transient"):
            base_object.thisHandle = handle
            base_object.thisown = False
    except:
        pass
};

/* typedefs */
typedef TopOpeBRepDS_DataStructure * TopOpeBRepDS_PDataStructure;
/* end typedefs declaration */

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

%rename(topopebrepds) TopOpeBRepDS;
class TopOpeBRepDS {
	public:
		%feature("compactdefaultargs") SPrint;
		%feature("autodoc", "	* IN OU ON UN

	:param S:
	:type S: TopAbs_State
	:rtype: TCollection_AsciiString
") SPrint;
		static TCollection_AsciiString SPrint (const TopAbs_State S);
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "	:param S:
	:type S: TopAbs_State
	:param OS:
	:type OS: Standard_OStream &
	:rtype: Standard_OStream
") Print;
		static Standard_OStream & Print (const TopAbs_State S,Standard_OStream & OS);
		%feature("compactdefaultargs") SPrint;
		%feature("autodoc", "	* <K>

	:param K:
	:type K: TopOpeBRepDS_Kind
	:rtype: TCollection_AsciiString
") SPrint;
		static TCollection_AsciiString SPrint (const TopOpeBRepDS_Kind K);
		%feature("compactdefaultargs") SPrint;
		%feature("autodoc", "	* S1(<K>,<I>)S2

	:param K:
	:type K: TopOpeBRepDS_Kind
	:param I:
	:type I: int
	:param B: default value is ""
	:type B: TCollection_AsciiString &
	:param A: default value is ""
	:type A: TCollection_AsciiString &
	:rtype: TCollection_AsciiString
") SPrint;
		static TCollection_AsciiString SPrint (const TopOpeBRepDS_Kind K,const Standard_Integer I,const TCollection_AsciiString & B = "",const TCollection_AsciiString & A = "");
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "	:param K:
	:type K: TopOpeBRepDS_Kind
	:param S:
	:type S: Standard_OStream &
	:rtype: Standard_OStream
") Print;
		static Standard_OStream & Print (const TopOpeBRepDS_Kind K,Standard_OStream & S);
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "	:param K:
	:type K: TopOpeBRepDS_Kind
	:param I:
	:type I: int
	:param S:
	:type S: Standard_OStream &
	:param B: default value is ""
	:type B: TCollection_AsciiString &
	:param A: default value is ""
	:type A: TCollection_AsciiString &
	:rtype: Standard_OStream
") Print;
		static Standard_OStream & Print (const TopOpeBRepDS_Kind K,const Standard_Integer I,Standard_OStream & S,const TCollection_AsciiString & B = "",const TCollection_AsciiString & A = "");
		%feature("compactdefaultargs") SPrint;
		%feature("autodoc", "	:param T:
	:type T: TopAbs_ShapeEnum
	:rtype: TCollection_AsciiString
") SPrint;
		static TCollection_AsciiString SPrint (const TopAbs_ShapeEnum T);
		%feature("compactdefaultargs") SPrint;
		%feature("autodoc", "	* (<T>,<I>)

	:param T:
	:type T: TopAbs_ShapeEnum
	:param I:
	:type I: int
	:rtype: TCollection_AsciiString
") SPrint;
		static TCollection_AsciiString SPrint (const TopAbs_ShapeEnum T,const Standard_Integer I);
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "	:param T:
	:type T: TopAbs_ShapeEnum
	:param I:
	:type I: int
	:param S:
	:type S: Standard_OStream &
	:rtype: Standard_OStream
") Print;
		static Standard_OStream & Print (const TopAbs_ShapeEnum T,const Standard_Integer I,Standard_OStream & S);
		%feature("compactdefaultargs") SPrint;
		%feature("autodoc", "	:param O:
	:type O: TopAbs_Orientation
	:rtype: TCollection_AsciiString
") SPrint;
		static TCollection_AsciiString SPrint (const TopAbs_Orientation O);
		%feature("compactdefaultargs") SPrint;
		%feature("autodoc", "	:param C:
	:type C: TopOpeBRepDS_Config
	:rtype: TCollection_AsciiString
") SPrint;
		static TCollection_AsciiString SPrint (const TopOpeBRepDS_Config C);
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "	:param C:
	:type C: TopOpeBRepDS_Config
	:param S:
	:type S: Standard_OStream &
	:rtype: Standard_OStream
") Print;
		static Standard_OStream & Print (const TopOpeBRepDS_Config C,Standard_OStream & S);
		%feature("compactdefaultargs") IsGeometry;
		%feature("autodoc", "	:param K:
	:type K: TopOpeBRepDS_Kind
	:rtype: bool
") IsGeometry;
		static Standard_Boolean IsGeometry (const TopOpeBRepDS_Kind K);
		%feature("compactdefaultargs") IsTopology;
		%feature("autodoc", "	:param K:
	:type K: TopOpeBRepDS_Kind
	:rtype: bool
") IsTopology;
		static Standard_Boolean IsTopology (const TopOpeBRepDS_Kind K);
		%feature("compactdefaultargs") KindToShape;
		%feature("autodoc", "	:param K:
	:type K: TopOpeBRepDS_Kind
	:rtype: TopAbs_ShapeEnum
") KindToShape;
		static TopAbs_ShapeEnum KindToShape (const TopOpeBRepDS_Kind K);
		%feature("compactdefaultargs") ShapeToKind;
		%feature("autodoc", "	:param S:
	:type S: TopAbs_ShapeEnum
	:rtype: TopOpeBRepDS_Kind
") ShapeToKind;
		static TopOpeBRepDS_Kind ShapeToKind (const TopAbs_ShapeEnum S);
};


%extend TopOpeBRepDS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_Array1OfDataMapOfIntegerListOfInterference;
class TopOpeBRepDS_Array1OfDataMapOfIntegerListOfInterference {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_Array1OfDataMapOfIntegerListOfInterference;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TopOpeBRepDS_Array1OfDataMapOfIntegerListOfInterference;
		 TopOpeBRepDS_Array1OfDataMapOfIntegerListOfInterference (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TopOpeBRepDS_Array1OfDataMapOfIntegerListOfInterference;
		%feature("autodoc", "	:param Item:
	:type Item: TopOpeBRepDS_DataMapOfIntegerListOfInterference &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TopOpeBRepDS_Array1OfDataMapOfIntegerListOfInterference;
		 TopOpeBRepDS_Array1OfDataMapOfIntegerListOfInterference (const TopOpeBRepDS_DataMapOfIntegerListOfInterference & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: TopOpeBRepDS_DataMapOfIntegerListOfInterference &
	:rtype: None
") Init;
		void Init (const TopOpeBRepDS_DataMapOfIntegerListOfInterference & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepDS_Array1OfDataMapOfIntegerListOfInterference &
	:rtype: TopOpeBRepDS_Array1OfDataMapOfIntegerListOfInterference
") Assign;
		const TopOpeBRepDS_Array1OfDataMapOfIntegerListOfInterference & Assign (const TopOpeBRepDS_Array1OfDataMapOfIntegerListOfInterference & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepDS_Array1OfDataMapOfIntegerListOfInterference &
	:rtype: TopOpeBRepDS_Array1OfDataMapOfIntegerListOfInterference
") operator =;
		const TopOpeBRepDS_Array1OfDataMapOfIntegerListOfInterference & operator = (const TopOpeBRepDS_Array1OfDataMapOfIntegerListOfInterference & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: TopOpeBRepDS_DataMapOfIntegerListOfInterference &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const TopOpeBRepDS_DataMapOfIntegerListOfInterference & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: TopOpeBRepDS_DataMapOfIntegerListOfInterference
") Value;
		const TopOpeBRepDS_DataMapOfIntegerListOfInterference & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: TopOpeBRepDS_DataMapOfIntegerListOfInterference
") ChangeValue;
		TopOpeBRepDS_DataMapOfIntegerListOfInterference & ChangeValue (const Standard_Integer Index);
};


%extend TopOpeBRepDS_Array1OfDataMapOfIntegerListOfInterference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_Association;
class TopOpeBRepDS_Association : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_Association;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepDS_Association;
		 TopOpeBRepDS_Association ();
		%feature("compactdefaultargs") Associate;
		%feature("autodoc", "	:param I:
	:type I: Handle_TopOpeBRepDS_Interference &
	:param K:
	:type K: Handle_TopOpeBRepDS_Interference &
	:rtype: None
") Associate;
		void Associate (const Handle_TopOpeBRepDS_Interference & I,const Handle_TopOpeBRepDS_Interference & K);
		%feature("compactdefaultargs") Associate;
		%feature("autodoc", "	:param I:
	:type I: Handle_TopOpeBRepDS_Interference &
	:param LI:
	:type LI: TopOpeBRepDS_ListOfInterference &
	:rtype: None
") Associate;
		void Associate (const Handle_TopOpeBRepDS_Interference & I,const TopOpeBRepDS_ListOfInterference & LI);
		%feature("compactdefaultargs") HasAssociation;
		%feature("autodoc", "	:param I:
	:type I: Handle_TopOpeBRepDS_Interference &
	:rtype: bool
") HasAssociation;
		Standard_Boolean HasAssociation (const Handle_TopOpeBRepDS_Interference & I);
		%feature("compactdefaultargs") Associated;
		%feature("autodoc", "	:param I:
	:type I: Handle_TopOpeBRepDS_Interference &
	:rtype: TopOpeBRepDS_ListOfInterference
") Associated;
		TopOpeBRepDS_ListOfInterference & Associated (const Handle_TopOpeBRepDS_Interference & I);
		%feature("compactdefaultargs") AreAssociated;
		%feature("autodoc", "	:param I:
	:type I: Handle_TopOpeBRepDS_Interference &
	:param K:
	:type K: Handle_TopOpeBRepDS_Interference &
	:rtype: bool
") AreAssociated;
		Standard_Boolean AreAssociated (const Handle_TopOpeBRepDS_Interference & I,const Handle_TopOpeBRepDS_Interference & K);
};


%extend TopOpeBRepDS_Association {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopOpeBRepDS_Association(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopOpeBRepDS_Association::Handle_TopOpeBRepDS_Association %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TopOpeBRepDS_Association;
class Handle_TopOpeBRepDS_Association : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TopOpeBRepDS_Association();
        Handle_TopOpeBRepDS_Association(const Handle_TopOpeBRepDS_Association &aHandle);
        Handle_TopOpeBRepDS_Association(const TopOpeBRepDS_Association *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopOpeBRepDS_Association DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopOpeBRepDS_Association {
    TopOpeBRepDS_Association* _get_reference() {
    return (TopOpeBRepDS_Association*)$self->Access();
    }
};

%extend Handle_TopOpeBRepDS_Association {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopOpeBRepDS_Association {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_BuildTool;
class TopOpeBRepDS_BuildTool {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_BuildTool;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepDS_BuildTool;
		 TopOpeBRepDS_BuildTool ();
		%feature("compactdefaultargs") TopOpeBRepDS_BuildTool;
		%feature("autodoc", "	:param OutCurveType:
	:type OutCurveType: TopOpeBRepTool_OutCurveType
	:rtype: None
") TopOpeBRepDS_BuildTool;
		 TopOpeBRepDS_BuildTool (const TopOpeBRepTool_OutCurveType OutCurveType);
		%feature("compactdefaultargs") TopOpeBRepDS_BuildTool;
		%feature("autodoc", "	:param GT:
	:type GT: TopOpeBRepTool_GeomTool &
	:rtype: None
") TopOpeBRepDS_BuildTool;
		 TopOpeBRepDS_BuildTool (const TopOpeBRepTool_GeomTool & GT);
		%feature("compactdefaultargs") GetGeomTool;
		%feature("autodoc", "	:rtype: TopOpeBRepTool_GeomTool
") GetGeomTool;
		const TopOpeBRepTool_GeomTool & GetGeomTool ();
		%feature("compactdefaultargs") ChangeGeomTool;
		%feature("autodoc", "	:rtype: TopOpeBRepTool_GeomTool
") ChangeGeomTool;
		TopOpeBRepTool_GeomTool & ChangeGeomTool ();
		%feature("compactdefaultargs") MakeVertex;
		%feature("autodoc", "	:param V:
	:type V: TopoDS_Shape &
	:param P:
	:type P: TopOpeBRepDS_Point &
	:rtype: None
") MakeVertex;
		void MakeVertex (TopoDS_Shape & V,const TopOpeBRepDS_Point & P);
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Shape &
	:param C:
	:type C: TopOpeBRepDS_Curve &
	:rtype: None
") MakeEdge;
		void MakeEdge (TopoDS_Shape & E,const TopOpeBRepDS_Curve & C);
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Shape &
	:param C:
	:type C: TopOpeBRepDS_Curve &
	:param DS:
	:type DS: TopOpeBRepDS_DataStructure &
	:rtype: None
") MakeEdge;
		void MakeEdge (TopoDS_Shape & E,const TopOpeBRepDS_Curve & C,const TopOpeBRepDS_DataStructure & DS);
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Shape &
	:param C:
	:type C: Handle_Geom_Curve &
	:param Tol:
	:type Tol: float
	:rtype: None
") MakeEdge;
		void MakeEdge (TopoDS_Shape & E,const Handle_Geom_Curve & C,const Standard_Real Tol);
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Shape &
	:rtype: None
") MakeEdge;
		void MakeEdge (TopoDS_Shape & E);
		%feature("compactdefaultargs") MakeWire;
		%feature("autodoc", "	:param W:
	:type W: TopoDS_Shape &
	:rtype: None
") MakeWire;
		void MakeWire (TopoDS_Shape & W);
		%feature("compactdefaultargs") MakeFace;
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Shape &
	:param S:
	:type S: TopOpeBRepDS_Surface &
	:rtype: None
") MakeFace;
		void MakeFace (TopoDS_Shape & F,const TopOpeBRepDS_Surface & S);
		%feature("compactdefaultargs") MakeShell;
		%feature("autodoc", "	:param Sh:
	:type Sh: TopoDS_Shape &
	:rtype: None
") MakeShell;
		void MakeShell (TopoDS_Shape & Sh);
		%feature("compactdefaultargs") MakeSolid;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") MakeSolid;
		void MakeSolid (TopoDS_Shape & S);
		%feature("compactdefaultargs") CopyEdge;
		%feature("autodoc", "	* Make an edge <Eou> with the curve of the edge <Ein>

	:param Ein:
	:type Ein: TopoDS_Shape &
	:param Eou:
	:type Eou: TopoDS_Shape &
	:rtype: None
") CopyEdge;
		void CopyEdge (const TopoDS_Shape & Ein,TopoDS_Shape & Eou);
		%feature("compactdefaultargs") GetOrientedEdgeVertices;
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Edge &
	:param Vmin:
	:type Vmin: TopoDS_Vertex &
	:param Vmax:
	:type Vmax: TopoDS_Vertex &
	:param Parmin:
	:type Parmin: float &
	:param Parmax:
	:type Parmax: float &
	:rtype: None
") GetOrientedEdgeVertices;
		void GetOrientedEdgeVertices (TopoDS_Edge & E,TopoDS_Vertex & Vmin,TopoDS_Vertex & Vmax,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") UpdateEdgeCurveTol;
		%feature("autodoc", "	:param F1:
	:type F1: TopoDS_Face &
	:param F2:
	:type F2: TopoDS_Face &
	:param E:
	:type E: TopoDS_Edge &
	:param C3Dnew:
	:type C3Dnew: Handle_Geom_Curve &
	:param tol3d:
	:type tol3d: float
	:param tol2d1:
	:type tol2d1: float
	:param tol2d2:
	:type tol2d2: float
	:param newtol:
	:type newtol: float &
	:param newparmin:
	:type newparmin: float &
	:param newparmax:
	:type newparmax: float &
	:rtype: None
") UpdateEdgeCurveTol;
		void UpdateEdgeCurveTol (const TopoDS_Face & F1,const TopoDS_Face & F2,TopoDS_Edge & E,const Handle_Geom_Curve & C3Dnew,const Standard_Real tol3d,const Standard_Real tol2d1,const Standard_Real tol2d2,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") ApproxCurves;
		%feature("autodoc", "	:param C:
	:type C: TopOpeBRepDS_Curve &
	:param E:
	:type E: TopoDS_Edge &
	:param inewC:
	:type inewC: int &
	:param HDS:
	:type HDS: Handle_TopOpeBRepDS_HDataStructure &
	:rtype: None
") ApproxCurves;
		void ApproxCurves (const TopOpeBRepDS_Curve & C,TopoDS_Edge & E,Standard_Integer &OutValue,const Handle_TopOpeBRepDS_HDataStructure & HDS);
		%feature("compactdefaultargs") ComputePCurves;
		%feature("autodoc", "	:param C:
	:type C: TopOpeBRepDS_Curve &
	:param E:
	:type E: TopoDS_Edge &
	:param newC:
	:type newC: TopOpeBRepDS_Curve &
	:param CompPC1:
	:type CompPC1: bool
	:param CompPC2:
	:type CompPC2: bool
	:param CompC3D:
	:type CompC3D: bool
	:rtype: None
") ComputePCurves;
		void ComputePCurves (const TopOpeBRepDS_Curve & C,TopoDS_Edge & E,TopOpeBRepDS_Curve & newC,const Standard_Boolean CompPC1,const Standard_Boolean CompPC2,const Standard_Boolean CompC3D);
		%feature("compactdefaultargs") PutPCurves;
		%feature("autodoc", "	:param newC:
	:type newC: TopOpeBRepDS_Curve &
	:param E:
	:type E: TopoDS_Edge &
	:param CompPC1:
	:type CompPC1: bool
	:param CompPC2:
	:type CompPC2: bool
	:rtype: None
") PutPCurves;
		void PutPCurves (const TopOpeBRepDS_Curve & newC,TopoDS_Edge & E,const Standard_Boolean CompPC1,const Standard_Boolean CompPC2);
		%feature("compactdefaultargs") RecomputeCurves;
		%feature("autodoc", "	:param C:
	:type C: TopOpeBRepDS_Curve &
	:param oldE:
	:type oldE: TopoDS_Edge &
	:param E:
	:type E: TopoDS_Edge &
	:param inewC:
	:type inewC: int &
	:param HDS:
	:type HDS: Handle_TopOpeBRepDS_HDataStructure &
	:rtype: None
") RecomputeCurves;
		void RecomputeCurves (const TopOpeBRepDS_Curve & C,const TopoDS_Edge & oldE,TopoDS_Edge & E,Standard_Integer &OutValue,const Handle_TopOpeBRepDS_HDataStructure & HDS);
		%feature("compactdefaultargs") CopyFace;
		%feature("autodoc", "	* Make a face <Fou> with the surface of the face <Fin>

	:param Fin:
	:type Fin: TopoDS_Shape &
	:param Fou:
	:type Fou: TopoDS_Shape &
	:rtype: None
") CopyFace;
		void CopyFace (const TopoDS_Shape & Fin,TopoDS_Shape & Fou);
		%feature("compactdefaultargs") AddEdgeVertex;
		%feature("autodoc", "	:param Ein:
	:type Ein: TopoDS_Shape &
	:param Eou:
	:type Eou: TopoDS_Shape &
	:param V:
	:type V: TopoDS_Shape &
	:rtype: None
") AddEdgeVertex;
		void AddEdgeVertex (const TopoDS_Shape & Ein,TopoDS_Shape & Eou,const TopoDS_Shape & V);
		%feature("compactdefaultargs") AddEdgeVertex;
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Shape &
	:param V:
	:type V: TopoDS_Shape &
	:rtype: None
") AddEdgeVertex;
		void AddEdgeVertex (TopoDS_Shape & E,const TopoDS_Shape & V);
		%feature("compactdefaultargs") AddWireEdge;
		%feature("autodoc", "	:param W:
	:type W: TopoDS_Shape &
	:param E:
	:type E: TopoDS_Shape &
	:rtype: None
") AddWireEdge;
		void AddWireEdge (TopoDS_Shape & W,const TopoDS_Shape & E);
		%feature("compactdefaultargs") AddFaceWire;
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Shape &
	:param W:
	:type W: TopoDS_Shape &
	:rtype: None
") AddFaceWire;
		void AddFaceWire (TopoDS_Shape & F,const TopoDS_Shape & W);
		%feature("compactdefaultargs") AddShellFace;
		%feature("autodoc", "	:param Sh:
	:type Sh: TopoDS_Shape &
	:param F:
	:type F: TopoDS_Shape &
	:rtype: None
") AddShellFace;
		void AddShellFace (TopoDS_Shape & Sh,const TopoDS_Shape & F);
		%feature("compactdefaultargs") AddSolidShell;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param Sh:
	:type Sh: TopoDS_Shape &
	:rtype: None
") AddSolidShell;
		void AddSolidShell (TopoDS_Shape & S,const TopoDS_Shape & Sh);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	* Sets the parameter <P> for the vertex <V> on the edge <E>.

	:param E:
	:type E: TopoDS_Shape &
	:param V:
	:type V: TopoDS_Shape &
	:param P:
	:type P: float
	:rtype: None
") Parameter;
		void Parameter (const TopoDS_Shape & E,const TopoDS_Shape & V,const Standard_Real P);
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "	* Sets the range of edge <E>.

	:param E:
	:type E: TopoDS_Shape &
	:param first:
	:type first: float
	:param last:
	:type last: float
	:rtype: None
") Range;
		void Range (const TopoDS_Shape & E,const Standard_Real first,const Standard_Real last);
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "	* Sets the range of edge <Eou> from <Ein> only when <Ein> has a closed geometry.

	:param Ein:
	:type Ein: TopoDS_Shape &
	:param Eou:
	:type Eou: TopoDS_Shape &
	:rtype: None
") UpdateEdge;
		void UpdateEdge (const TopoDS_Shape & Ein,TopoDS_Shape & Eou);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	* Compute the parameter of the vertex <V>, supported by the edge <E>, on the curve <C>.

	:param C:
	:type C: TopOpeBRepDS_Curve &
	:param E:
	:type E: TopoDS_Shape &
	:param V:
	:type V: TopoDS_Shape &
	:rtype: None
") Parameter;
		void Parameter (const TopOpeBRepDS_Curve & C,TopoDS_Shape & E,TopoDS_Shape & V);
		%feature("compactdefaultargs") Curve3D;
		%feature("autodoc", "	* Sets the curve <C> for the edge <E>

	:param E:
	:type E: TopoDS_Shape &
	:param C:
	:type C: Handle_Geom_Curve &
	:param Tol:
	:type Tol: float
	:rtype: None
") Curve3D;
		void Curve3D (TopoDS_Shape & E,const Handle_Geom_Curve & C,const Standard_Real Tol);
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", "	* Sets the pcurve <C> for the edge <E> on the face <F>. If OverWrite is True the old pcurve if there is one is overwritten, else the two pcurves are set.

	:param F:
	:type F: TopoDS_Shape &
	:param E:
	:type E: TopoDS_Shape &
	:param C:
	:type C: Handle_Geom2d_Curve &
	:rtype: None
") PCurve;
		void PCurve (TopoDS_Shape & F,TopoDS_Shape & E,const Handle_Geom2d_Curve & C);
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Shape &
	:param E:
	:type E: TopoDS_Shape &
	:param CDS:
	:type CDS: TopOpeBRepDS_Curve &
	:param C:
	:type C: Handle_Geom2d_Curve &
	:rtype: None
") PCurve;
		void PCurve (TopoDS_Shape & F,TopoDS_Shape & E,const TopOpeBRepDS_Curve & CDS,const Handle_Geom2d_Curve & C);
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param O:
	:type O: TopAbs_Orientation
	:rtype: None
") Orientation;
		void Orientation (TopoDS_Shape & S,const TopAbs_Orientation O);
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation (const TopoDS_Shape & S);
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param B:
	:type B: bool
	:rtype: None
") Closed;
		void Closed (TopoDS_Shape & S,const Standard_Boolean B);
		%feature("compactdefaultargs") Approximation;
		%feature("autodoc", "	:rtype: bool
") Approximation;
		Standard_Boolean Approximation ();
		%feature("compactdefaultargs") UpdateSurface;
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Shape &
	:param SU:
	:type SU: Handle_Geom_Surface &
	:rtype: None
") UpdateSurface;
		void UpdateSurface (const TopoDS_Shape & F,const Handle_Geom_Surface & SU);
		%feature("compactdefaultargs") UpdateSurface;
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Shape &
	:param oldF:
	:type oldF: TopoDS_Shape &
	:param newF:
	:type newF: TopoDS_Shape &
	:rtype: None
") UpdateSurface;
		void UpdateSurface (const TopoDS_Shape & E,const TopoDS_Shape & oldF,const TopoDS_Shape & newF);
		%feature("compactdefaultargs") OverWrite;
		%feature("autodoc", "	:rtype: bool
") OverWrite;
		Standard_Boolean OverWrite ();
		%feature("compactdefaultargs") OverWrite;
		%feature("autodoc", "	:param O:
	:type O: bool
	:rtype: None
") OverWrite;
		void OverWrite (const Standard_Boolean O);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	:rtype: bool
") Translate;
		Standard_Boolean Translate ();
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	:param T:
	:type T: bool
	:rtype: None
") Translate;
		void Translate (const Standard_Boolean T);
};


%extend TopOpeBRepDS_BuildTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_Check;
class TopOpeBRepDS_Check : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_Check;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepDS_Check;
		 TopOpeBRepDS_Check ();
		%feature("compactdefaultargs") TopOpeBRepDS_Check;
		%feature("autodoc", "	:param HDS:
	:type HDS: Handle_TopOpeBRepDS_HDataStructure &
	:rtype: None
") TopOpeBRepDS_Check;
		 TopOpeBRepDS_Check (const Handle_TopOpeBRepDS_HDataStructure & HDS);
		%feature("compactdefaultargs") ChkIntg;
		%feature("autodoc", "	* Check integrition of DS

	:rtype: bool
") ChkIntg;
		Standard_Boolean ChkIntg ();
		%feature("compactdefaultargs") ChkIntgInterf;
		%feature("autodoc", "	* Check integrition of interferences (les supports et les geometries de LI)

	:param LI:
	:type LI: TopOpeBRepDS_ListOfInterference &
	:rtype: bool
") ChkIntgInterf;
		Standard_Boolean ChkIntgInterf (const TopOpeBRepDS_ListOfInterference & LI);
		%feature("compactdefaultargs") CheckDS;
		%feature("autodoc", "	* Verifie que le ieme element de la DS existe, et pour un K de type topologique, verifie qu'il est du bon type (VERTEX, EDGE, WIRE, FACE, SHELL ou SOLID)

	:param i:
	:type i: int
	:param K:
	:type K: TopOpeBRepDS_Kind
	:rtype: bool
") CheckDS;
		Standard_Boolean CheckDS (const Standard_Integer i,const TopOpeBRepDS_Kind K);
		%feature("compactdefaultargs") ChkIntgSamDom;
		%feature("autodoc", "	* Check integrition des champs SameDomain de la DS

	:rtype: bool
") ChkIntgSamDom;
		Standard_Boolean ChkIntgSamDom ();
		%feature("compactdefaultargs") CheckShapes;
		%feature("autodoc", "	* Verifie que les Shapes existent bien dans la DS Utile pour les Shapes SameDomain si la liste est vide, renvoie vrai

	:param LS:
	:type LS: TopTools_ListOfShape &
	:rtype: bool
") CheckShapes;
		Standard_Boolean CheckShapes (const TopTools_ListOfShape & LS);
		%feature("compactdefaultargs") OneVertexOnPnt;
		%feature("autodoc", "	* Verifie que les Vertex non SameDomain sont bien nonSameDomain, que les vertex sameDomain sont bien SameDomain, que les Points sont non confondus ni entre eux, ni avec des Vertex.

	:rtype: bool
") OneVertexOnPnt;
		Standard_Boolean OneVertexOnPnt ();
		%feature("compactdefaultargs") HDS;
		%feature("autodoc", "	:rtype: Handle_TopOpeBRepDS_HDataStructure
") HDS;
		Handle_TopOpeBRepDS_HDataStructure HDS ();
		%feature("compactdefaultargs") ChangeHDS;
		%feature("autodoc", "	:rtype: Handle_TopOpeBRepDS_HDataStructure
") ChangeHDS;
		Handle_TopOpeBRepDS_HDataStructure ChangeHDS ();

        %feature("autodoc", "1");
        %extend{
            std::string PrintIntgToString() {
            std::stringstream s;
            self->PrintIntg(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") Print;
		%feature("autodoc", "	* Prints the name of CheckStatus <stat> as a String

	:param stat:
	:type stat: TopOpeBRepDS_CheckStatus
	:param S:
	:type S: Standard_OStream &
	:rtype: Standard_OStream
") Print;
		Standard_OStream & Print (const TopOpeBRepDS_CheckStatus stat,Standard_OStream & S);
		%feature("compactdefaultargs") PrintShape;
		%feature("autodoc", "	* Prints the name of CheckStatus <stat> as a String

	:param SE:
	:type SE: TopAbs_ShapeEnum
	:param S:
	:type S: Standard_OStream &
	:rtype: Standard_OStream
") PrintShape;
		Standard_OStream & PrintShape (const TopAbs_ShapeEnum SE,Standard_OStream & S);
		%feature("compactdefaultargs") PrintShape;
		%feature("autodoc", "	* Prints the name of CheckStatus <stat> as a String

	:param index:
	:type index: int
	:param S:
	:type S: Standard_OStream &
	:rtype: Standard_OStream
") PrintShape;
		Standard_OStream & PrintShape (const Standard_Integer index,Standard_OStream & S);
};


%extend TopOpeBRepDS_Check {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopOpeBRepDS_Check(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopOpeBRepDS_Check::Handle_TopOpeBRepDS_Check %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TopOpeBRepDS_Check;
class Handle_TopOpeBRepDS_Check : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TopOpeBRepDS_Check();
        Handle_TopOpeBRepDS_Check(const Handle_TopOpeBRepDS_Check &aHandle);
        Handle_TopOpeBRepDS_Check(const TopOpeBRepDS_Check *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopOpeBRepDS_Check DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopOpeBRepDS_Check {
    TopOpeBRepDS_Check* _get_reference() {
    return (TopOpeBRepDS_Check*)$self->Access();
    }
};

%extend Handle_TopOpeBRepDS_Check {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopOpeBRepDS_Check {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_Curve;
class TopOpeBRepDS_Curve {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_Curve;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepDS_Curve;
		 TopOpeBRepDS_Curve ();
		%feature("compactdefaultargs") TopOpeBRepDS_Curve;
		%feature("autodoc", "	:param P:
	:type P: Handle_Geom_Curve &
	:param T:
	:type T: float
	:param IsWalk: default value is Standard_False
	:type IsWalk: bool
	:rtype: None
") TopOpeBRepDS_Curve;
		 TopOpeBRepDS_Curve (const Handle_Geom_Curve & P,const Standard_Real T,const Standard_Boolean IsWalk = Standard_False);
		%feature("compactdefaultargs") DefineCurve;
		%feature("autodoc", "	:param P:
	:type P: Handle_Geom_Curve &
	:param T:
	:type T: float
	:param IsWalk:
	:type IsWalk: bool
	:rtype: None
") DefineCurve;
		void DefineCurve (const Handle_Geom_Curve & P,const Standard_Real T,const Standard_Boolean IsWalk);
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "	* Update the tolerance

	:param tol:
	:type tol: float
	:rtype: None
") Tolerance;
		void Tolerance (const Standard_Real tol);
		%feature("compactdefaultargs") SetSCI;
		%feature("autodoc", "	* define the interferences face/curve.

	:param I1:
	:type I1: Handle_TopOpeBRepDS_Interference &
	:param I2:
	:type I2: Handle_TopOpeBRepDS_Interference &
	:rtype: None
") SetSCI;
		void SetSCI (const Handle_TopOpeBRepDS_Interference & I1,const Handle_TopOpeBRepDS_Interference & I2);
		%feature("compactdefaultargs") GetSCI1;
		%feature("autodoc", "	:rtype: Handle_TopOpeBRepDS_Interference
") GetSCI1;
		Handle_TopOpeBRepDS_Interference GetSCI1 ();
		%feature("compactdefaultargs") GetSCI2;
		%feature("autodoc", "	:rtype: Handle_TopOpeBRepDS_Interference
") GetSCI2;
		Handle_TopOpeBRepDS_Interference GetSCI2 ();
		%feature("compactdefaultargs") GetSCI;
		%feature("autodoc", "	:param I1:
	:type I1: Handle_TopOpeBRepDS_Interference &
	:param I2:
	:type I2: Handle_TopOpeBRepDS_Interference &
	:rtype: None
") GetSCI;
		void GetSCI (Handle_TopOpeBRepDS_Interference & I1,Handle_TopOpeBRepDS_Interference & I2);
		%feature("compactdefaultargs") SetShapes;
		%feature("autodoc", "	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:rtype: None
") SetShapes;
		void SetShapes (const TopoDS_Shape & S1,const TopoDS_Shape & S2);
		%feature("compactdefaultargs") GetShapes;
		%feature("autodoc", "	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:rtype: None
") GetShapes;
		void GetShapes (TopoDS_Shape & S1,TopoDS_Shape & S2);
		%feature("compactdefaultargs") Shape1;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Shape1;
		const TopoDS_Shape  Shape1 ();
		%feature("compactdefaultargs") ChangeShape1;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") ChangeShape1;
		TopoDS_Shape  ChangeShape1 ();
		%feature("compactdefaultargs") Shape2;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Shape2;
		const TopoDS_Shape  Shape2 ();
		%feature("compactdefaultargs") ChangeShape2;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") ChangeShape2;
		TopoDS_Shape  ChangeShape2 ();
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "	:rtype: Handle_Geom_Curve
") Curve;
		Handle_Geom_Curve Curve ();
		%feature("compactdefaultargs") SetRange;
		%feature("autodoc", "	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:rtype: None
") SetRange;
		void SetRange (const Standard_Real First,const Standard_Real Last);
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "	:param First:
	:type First: float &
	:param Last:
	:type Last: float &
	:rtype: bool
") Range;
		Standard_Boolean Range (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "	:rtype: float
") Tolerance;
		Standard_Real Tolerance ();
		%feature("compactdefaultargs") ChangeCurve;
		%feature("autodoc", "	:rtype: Handle_Geom_Curve
") ChangeCurve;
		Handle_Geom_Curve ChangeCurve ();
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "	:param C3D:
	:type C3D: Handle_Geom_Curve &
	:param Tol:
	:type Tol: float
	:rtype: None
") Curve;
		void Curve (const Handle_Geom_Curve & C3D,const Standard_Real Tol);
		%feature("compactdefaultargs") Curve1;
		%feature("autodoc", "	:rtype: Handle_Geom2d_Curve
") Curve1;
		Handle_Geom2d_Curve Curve1 ();
		%feature("compactdefaultargs") Curve1;
		%feature("autodoc", "	:param PC1:
	:type PC1: Handle_Geom2d_Curve &
	:rtype: None
") Curve1;
		void Curve1 (const Handle_Geom2d_Curve & PC1);
		%feature("compactdefaultargs") Curve2;
		%feature("autodoc", "	:rtype: Handle_Geom2d_Curve
") Curve2;
		Handle_Geom2d_Curve Curve2 ();
		%feature("compactdefaultargs") Curve2;
		%feature("autodoc", "	:param PC2:
	:type PC2: Handle_Geom2d_Curve &
	:rtype: None
") Curve2;
		void Curve2 (const Handle_Geom2d_Curve & PC2);
		%feature("compactdefaultargs") IsWalk;
		%feature("autodoc", "	:rtype: bool
") IsWalk;
		Standard_Boolean IsWalk ();
		%feature("compactdefaultargs") ChangeIsWalk;
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") ChangeIsWalk;
		void ChangeIsWalk (const Standard_Boolean B);
		%feature("compactdefaultargs") Keep;
		%feature("autodoc", "	:rtype: bool
") Keep;
		Standard_Boolean Keep ();
		%feature("compactdefaultargs") ChangeKeep;
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") ChangeKeep;
		void ChangeKeep (const Standard_Boolean B);
		%feature("compactdefaultargs") Mother;
		%feature("autodoc", "	:rtype: int
") Mother;
		Standard_Integer Mother ();
		%feature("compactdefaultargs") ChangeMother;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: None
") ChangeMother;
		void ChangeMother (const Standard_Integer I);
		%feature("compactdefaultargs") DSIndex;
		%feature("autodoc", "	:rtype: int
") DSIndex;
		Standard_Integer DSIndex ();
		%feature("compactdefaultargs") ChangeDSIndex;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: None
") ChangeDSIndex;
		void ChangeDSIndex (const Standard_Integer I);
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	:param OS:
	:type OS: Standard_OStream &
	:param index:
	:type index: int
	:param compact: default value is Standard_True
	:type compact: bool
	:rtype: Standard_OStream
") Dump;
		Standard_OStream & Dump (Standard_OStream & OS,const Standard_Integer index,const Standard_Boolean compact = Standard_True);
};


%extend TopOpeBRepDS_Curve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_CurveExplorer;
class TopOpeBRepDS_CurveExplorer {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_CurveExplorer;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepDS_CurveExplorer;
		 TopOpeBRepDS_CurveExplorer ();
		%feature("compactdefaultargs") TopOpeBRepDS_CurveExplorer;
		%feature("autodoc", "	:param DS:
	:type DS: TopOpeBRepDS_DataStructure &
	:param FindOnlyKeep: default value is Standard_True
	:type FindOnlyKeep: bool
	:rtype: None
") TopOpeBRepDS_CurveExplorer;
		 TopOpeBRepDS_CurveExplorer (const TopOpeBRepDS_DataStructure & DS,const Standard_Boolean FindOnlyKeep = Standard_True);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param DS:
	:type DS: TopOpeBRepDS_DataStructure &
	:param FindOnlyKeep: default value is Standard_True
	:type FindOnlyKeep: bool
	:rtype: None
") Init;
		void Init (const TopOpeBRepDS_DataStructure & DS,const Standard_Boolean FindOnlyKeep = Standard_True);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "	:rtype: TopOpeBRepDS_Curve
") Curve;
		const TopOpeBRepDS_Curve & Curve ();
		%feature("compactdefaultargs") IsCurve;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: bool
") IsCurve;
		Standard_Boolean IsCurve (const Standard_Integer I);
		%feature("compactdefaultargs") IsCurveKeep;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: bool
") IsCurveKeep;
		Standard_Boolean IsCurveKeep (const Standard_Integer I);
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: TopOpeBRepDS_Curve
") Curve;
		const TopOpeBRepDS_Curve & Curve (const Standard_Integer I);
		%feature("compactdefaultargs") NbCurve;
		%feature("autodoc", "	:rtype: int
") NbCurve;
		Standard_Integer NbCurve ();
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "	:rtype: int
") Index;
		Standard_Integer Index ();
};


%extend TopOpeBRepDS_CurveExplorer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_DataMapIteratorOfDataMapOfCheckStatus;
class TopOpeBRepDS_DataMapIteratorOfDataMapOfCheckStatus : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_DataMapIteratorOfDataMapOfCheckStatus;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepDS_DataMapIteratorOfDataMapOfCheckStatus;
		 TopOpeBRepDS_DataMapIteratorOfDataMapOfCheckStatus ();
		%feature("compactdefaultargs") TopOpeBRepDS_DataMapIteratorOfDataMapOfCheckStatus;
		%feature("autodoc", "	:param aMap:
	:type aMap: TopOpeBRepDS_DataMapOfCheckStatus &
	:rtype: None
") TopOpeBRepDS_DataMapIteratorOfDataMapOfCheckStatus;
		 TopOpeBRepDS_DataMapIteratorOfDataMapOfCheckStatus (const TopOpeBRepDS_DataMapOfCheckStatus & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: TopOpeBRepDS_DataMapOfCheckStatus &
	:rtype: None
") Initialize;
		void Initialize (const TopOpeBRepDS_DataMapOfCheckStatus & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: int
") Key;
		const Standard_Integer & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopOpeBRepDS_CheckStatus
") Value;
		const TopOpeBRepDS_CheckStatus & Value ();
};


%extend TopOpeBRepDS_DataMapIteratorOfDataMapOfCheckStatus {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_DataMapIteratorOfDataMapOfIntegerListOfInterference;
class TopOpeBRepDS_DataMapIteratorOfDataMapOfIntegerListOfInterference : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_DataMapIteratorOfDataMapOfIntegerListOfInterference;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepDS_DataMapIteratorOfDataMapOfIntegerListOfInterference;
		 TopOpeBRepDS_DataMapIteratorOfDataMapOfIntegerListOfInterference ();
		%feature("compactdefaultargs") TopOpeBRepDS_DataMapIteratorOfDataMapOfIntegerListOfInterference;
		%feature("autodoc", "	:param aMap:
	:type aMap: TopOpeBRepDS_DataMapOfIntegerListOfInterference &
	:rtype: None
") TopOpeBRepDS_DataMapIteratorOfDataMapOfIntegerListOfInterference;
		 TopOpeBRepDS_DataMapIteratorOfDataMapOfIntegerListOfInterference (const TopOpeBRepDS_DataMapOfIntegerListOfInterference & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: TopOpeBRepDS_DataMapOfIntegerListOfInterference &
	:rtype: None
") Initialize;
		void Initialize (const TopOpeBRepDS_DataMapOfIntegerListOfInterference & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: int
") Key;
		const Standard_Integer & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopOpeBRepDS_ListOfInterference
") Value;
		const TopOpeBRepDS_ListOfInterference & Value ();
};


%extend TopOpeBRepDS_DataMapIteratorOfDataMapOfIntegerListOfInterference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_DataMapIteratorOfDataMapOfInterferenceListOfInterference;
class TopOpeBRepDS_DataMapIteratorOfDataMapOfInterferenceListOfInterference : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_DataMapIteratorOfDataMapOfInterferenceListOfInterference;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepDS_DataMapIteratorOfDataMapOfInterferenceListOfInterference;
		 TopOpeBRepDS_DataMapIteratorOfDataMapOfInterferenceListOfInterference ();
		%feature("compactdefaultargs") TopOpeBRepDS_DataMapIteratorOfDataMapOfInterferenceListOfInterference;
		%feature("autodoc", "	:param aMap:
	:type aMap: TopOpeBRepDS_DataMapOfInterferenceListOfInterference &
	:rtype: None
") TopOpeBRepDS_DataMapIteratorOfDataMapOfInterferenceListOfInterference;
		 TopOpeBRepDS_DataMapIteratorOfDataMapOfInterferenceListOfInterference (const TopOpeBRepDS_DataMapOfInterferenceListOfInterference & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: TopOpeBRepDS_DataMapOfInterferenceListOfInterference &
	:rtype: None
") Initialize;
		void Initialize (const TopOpeBRepDS_DataMapOfInterferenceListOfInterference & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: Handle_TopOpeBRepDS_Interference
") Key;
		Handle_TopOpeBRepDS_Interference Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopOpeBRepDS_ListOfInterference
") Value;
		const TopOpeBRepDS_ListOfInterference & Value ();
};


%extend TopOpeBRepDS_DataMapIteratorOfDataMapOfInterferenceListOfInterference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_DataMapIteratorOfDataMapOfInterferenceShape;
class TopOpeBRepDS_DataMapIteratorOfDataMapOfInterferenceShape : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_DataMapIteratorOfDataMapOfInterferenceShape;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepDS_DataMapIteratorOfDataMapOfInterferenceShape;
		 TopOpeBRepDS_DataMapIteratorOfDataMapOfInterferenceShape ();
		%feature("compactdefaultargs") TopOpeBRepDS_DataMapIteratorOfDataMapOfInterferenceShape;
		%feature("autodoc", "	:param aMap:
	:type aMap: TopOpeBRepDS_DataMapOfInterferenceShape &
	:rtype: None
") TopOpeBRepDS_DataMapIteratorOfDataMapOfInterferenceShape;
		 TopOpeBRepDS_DataMapIteratorOfDataMapOfInterferenceShape (const TopOpeBRepDS_DataMapOfInterferenceShape & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: TopOpeBRepDS_DataMapOfInterferenceShape &
	:rtype: None
") Initialize;
		void Initialize (const TopOpeBRepDS_DataMapOfInterferenceShape & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: Handle_TopOpeBRepDS_Interference
") Key;
		Handle_TopOpeBRepDS_Interference Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Value;
		const TopoDS_Shape  Value ();
};


%extend TopOpeBRepDS_DataMapIteratorOfDataMapOfInterferenceShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_DataMapIteratorOfDataMapOfShapeListOfShapeOn1State;
class TopOpeBRepDS_DataMapIteratorOfDataMapOfShapeListOfShapeOn1State : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_DataMapIteratorOfDataMapOfShapeListOfShapeOn1State;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepDS_DataMapIteratorOfDataMapOfShapeListOfShapeOn1State;
		 TopOpeBRepDS_DataMapIteratorOfDataMapOfShapeListOfShapeOn1State ();
		%feature("compactdefaultargs") TopOpeBRepDS_DataMapIteratorOfDataMapOfShapeListOfShapeOn1State;
		%feature("autodoc", "	:param aMap:
	:type aMap: TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State &
	:rtype: None
") TopOpeBRepDS_DataMapIteratorOfDataMapOfShapeListOfShapeOn1State;
		 TopOpeBRepDS_DataMapIteratorOfDataMapOfShapeListOfShapeOn1State (const TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State &
	:rtype: None
") Initialize;
		void Initialize (const TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		const TopoDS_Shape  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopOpeBRepDS_ListOfShapeOn1State
") Value;
		const TopOpeBRepDS_ListOfShapeOn1State & Value ();
};


%extend TopOpeBRepDS_DataMapIteratorOfDataMapOfShapeListOfShapeOn1State {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_DataMapIteratorOfDataMapOfShapeState;
class TopOpeBRepDS_DataMapIteratorOfDataMapOfShapeState : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_DataMapIteratorOfDataMapOfShapeState;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepDS_DataMapIteratorOfDataMapOfShapeState;
		 TopOpeBRepDS_DataMapIteratorOfDataMapOfShapeState ();
		%feature("compactdefaultargs") TopOpeBRepDS_DataMapIteratorOfDataMapOfShapeState;
		%feature("autodoc", "	:param aMap:
	:type aMap: TopOpeBRepDS_DataMapOfShapeState &
	:rtype: None
") TopOpeBRepDS_DataMapIteratorOfDataMapOfShapeState;
		 TopOpeBRepDS_DataMapIteratorOfDataMapOfShapeState (const TopOpeBRepDS_DataMapOfShapeState & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: TopOpeBRepDS_DataMapOfShapeState &
	:rtype: None
") Initialize;
		void Initialize (const TopOpeBRepDS_DataMapOfShapeState & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		const TopoDS_Shape  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopAbs_State
") Value;
		const TopAbs_State & Value ();
};


%extend TopOpeBRepDS_DataMapIteratorOfDataMapOfShapeState {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_DataMapIteratorOfMapOfCurve;
class TopOpeBRepDS_DataMapIteratorOfMapOfCurve : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_DataMapIteratorOfMapOfCurve;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepDS_DataMapIteratorOfMapOfCurve;
		 TopOpeBRepDS_DataMapIteratorOfMapOfCurve ();
		%feature("compactdefaultargs") TopOpeBRepDS_DataMapIteratorOfMapOfCurve;
		%feature("autodoc", "	:param aMap:
	:type aMap: TopOpeBRepDS_MapOfCurve &
	:rtype: None
") TopOpeBRepDS_DataMapIteratorOfMapOfCurve;
		 TopOpeBRepDS_DataMapIteratorOfMapOfCurve (const TopOpeBRepDS_MapOfCurve & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: TopOpeBRepDS_MapOfCurve &
	:rtype: None
") Initialize;
		void Initialize (const TopOpeBRepDS_MapOfCurve & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: int
") Key;
		const Standard_Integer & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopOpeBRepDS_CurveData
") Value;
		const TopOpeBRepDS_CurveData & Value ();
};


%extend TopOpeBRepDS_DataMapIteratorOfMapOfCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_DataMapIteratorOfMapOfIntegerShapeData;
class TopOpeBRepDS_DataMapIteratorOfMapOfIntegerShapeData : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_DataMapIteratorOfMapOfIntegerShapeData;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepDS_DataMapIteratorOfMapOfIntegerShapeData;
		 TopOpeBRepDS_DataMapIteratorOfMapOfIntegerShapeData ();
		%feature("compactdefaultargs") TopOpeBRepDS_DataMapIteratorOfMapOfIntegerShapeData;
		%feature("autodoc", "	:param aMap:
	:type aMap: TopOpeBRepDS_MapOfIntegerShapeData &
	:rtype: None
") TopOpeBRepDS_DataMapIteratorOfMapOfIntegerShapeData;
		 TopOpeBRepDS_DataMapIteratorOfMapOfIntegerShapeData (const TopOpeBRepDS_MapOfIntegerShapeData & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: TopOpeBRepDS_MapOfIntegerShapeData &
	:rtype: None
") Initialize;
		void Initialize (const TopOpeBRepDS_MapOfIntegerShapeData & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: int
") Key;
		const Standard_Integer & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopOpeBRepDS_ShapeData
") Value;
		const TopOpeBRepDS_ShapeData & Value ();
};


%extend TopOpeBRepDS_DataMapIteratorOfMapOfIntegerShapeData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_DataMapIteratorOfMapOfPoint;
class TopOpeBRepDS_DataMapIteratorOfMapOfPoint : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_DataMapIteratorOfMapOfPoint;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepDS_DataMapIteratorOfMapOfPoint;
		 TopOpeBRepDS_DataMapIteratorOfMapOfPoint ();
		%feature("compactdefaultargs") TopOpeBRepDS_DataMapIteratorOfMapOfPoint;
		%feature("autodoc", "	:param aMap:
	:type aMap: TopOpeBRepDS_MapOfPoint &
	:rtype: None
") TopOpeBRepDS_DataMapIteratorOfMapOfPoint;
		 TopOpeBRepDS_DataMapIteratorOfMapOfPoint (const TopOpeBRepDS_MapOfPoint & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: TopOpeBRepDS_MapOfPoint &
	:rtype: None
") Initialize;
		void Initialize (const TopOpeBRepDS_MapOfPoint & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: int
") Key;
		const Standard_Integer & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopOpeBRepDS_PointData
") Value;
		const TopOpeBRepDS_PointData & Value ();
};


%extend TopOpeBRepDS_DataMapIteratorOfMapOfPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_DataMapIteratorOfMapOfSurface;
class TopOpeBRepDS_DataMapIteratorOfMapOfSurface : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_DataMapIteratorOfMapOfSurface;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepDS_DataMapIteratorOfMapOfSurface;
		 TopOpeBRepDS_DataMapIteratorOfMapOfSurface ();
		%feature("compactdefaultargs") TopOpeBRepDS_DataMapIteratorOfMapOfSurface;
		%feature("autodoc", "	:param aMap:
	:type aMap: TopOpeBRepDS_MapOfSurface &
	:rtype: None
") TopOpeBRepDS_DataMapIteratorOfMapOfSurface;
		 TopOpeBRepDS_DataMapIteratorOfMapOfSurface (const TopOpeBRepDS_MapOfSurface & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: TopOpeBRepDS_MapOfSurface &
	:rtype: None
") Initialize;
		void Initialize (const TopOpeBRepDS_MapOfSurface & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: int
") Key;
		const Standard_Integer & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopOpeBRepDS_SurfaceData
") Value;
		const TopOpeBRepDS_SurfaceData & Value ();
};


%extend TopOpeBRepDS_DataMapIteratorOfMapOfSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_DataMapIteratorOfShapeSurface;
class TopOpeBRepDS_DataMapIteratorOfShapeSurface : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_DataMapIteratorOfShapeSurface;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepDS_DataMapIteratorOfShapeSurface;
		 TopOpeBRepDS_DataMapIteratorOfShapeSurface ();
		%feature("compactdefaultargs") TopOpeBRepDS_DataMapIteratorOfShapeSurface;
		%feature("autodoc", "	:param aMap:
	:type aMap: TopOpeBRepDS_ShapeSurface &
	:rtype: None
") TopOpeBRepDS_DataMapIteratorOfShapeSurface;
		 TopOpeBRepDS_DataMapIteratorOfShapeSurface (const TopOpeBRepDS_ShapeSurface & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: TopOpeBRepDS_ShapeSurface &
	:rtype: None
") Initialize;
		void Initialize (const TopOpeBRepDS_ShapeSurface & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		const TopoDS_Shape  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Geom_Surface
") Value;
		Handle_Geom_Surface Value ();
};


%extend TopOpeBRepDS_DataMapIteratorOfShapeSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_DataMapNodeOfDataMapOfCheckStatus;
class TopOpeBRepDS_DataMapNodeOfDataMapOfCheckStatus : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_DataMapNodeOfDataMapOfCheckStatus;
		%feature("autodoc", "	:param K:
	:type K: int &
	:param I:
	:type I: TopOpeBRepDS_CheckStatus &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TopOpeBRepDS_DataMapNodeOfDataMapOfCheckStatus;
		 TopOpeBRepDS_DataMapNodeOfDataMapOfCheckStatus (const Standard_Integer & K,const TopOpeBRepDS_CheckStatus & I,const TCollection_MapNodePtr & n);

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey() {
                return (Standard_Integer) $self->Key();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey(Standard_Integer value ) {
                $self->Key()=value;
                }
            };
            		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopOpeBRepDS_CheckStatus
") Value;
		TopOpeBRepDS_CheckStatus & Value ();
};


%extend TopOpeBRepDS_DataMapNodeOfDataMapOfCheckStatus {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfCheckStatus(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfCheckStatus::Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfCheckStatus %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfCheckStatus;
class Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfCheckStatus : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfCheckStatus();
        Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfCheckStatus(const Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfCheckStatus &aHandle);
        Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfCheckStatus(const TopOpeBRepDS_DataMapNodeOfDataMapOfCheckStatus *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfCheckStatus DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfCheckStatus {
    TopOpeBRepDS_DataMapNodeOfDataMapOfCheckStatus* _get_reference() {
    return (TopOpeBRepDS_DataMapNodeOfDataMapOfCheckStatus*)$self->Access();
    }
};

%extend Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfCheckStatus {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopOpeBRepDS_DataMapNodeOfDataMapOfCheckStatus {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_DataMapNodeOfDataMapOfIntegerListOfInterference;
class TopOpeBRepDS_DataMapNodeOfDataMapOfIntegerListOfInterference : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_DataMapNodeOfDataMapOfIntegerListOfInterference;
		%feature("autodoc", "	:param K:
	:type K: int &
	:param I:
	:type I: TopOpeBRepDS_ListOfInterference &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TopOpeBRepDS_DataMapNodeOfDataMapOfIntegerListOfInterference;
		 TopOpeBRepDS_DataMapNodeOfDataMapOfIntegerListOfInterference (const Standard_Integer & K,const TopOpeBRepDS_ListOfInterference & I,const TCollection_MapNodePtr & n);

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey() {
                return (Standard_Integer) $self->Key();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey(Standard_Integer value ) {
                $self->Key()=value;
                }
            };
            		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopOpeBRepDS_ListOfInterference
") Value;
		TopOpeBRepDS_ListOfInterference & Value ();
};


%extend TopOpeBRepDS_DataMapNodeOfDataMapOfIntegerListOfInterference {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfIntegerListOfInterference(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfIntegerListOfInterference::Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfIntegerListOfInterference %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfIntegerListOfInterference;
class Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfIntegerListOfInterference : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfIntegerListOfInterference();
        Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfIntegerListOfInterference(const Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfIntegerListOfInterference &aHandle);
        Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfIntegerListOfInterference(const TopOpeBRepDS_DataMapNodeOfDataMapOfIntegerListOfInterference *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfIntegerListOfInterference DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfIntegerListOfInterference {
    TopOpeBRepDS_DataMapNodeOfDataMapOfIntegerListOfInterference* _get_reference() {
    return (TopOpeBRepDS_DataMapNodeOfDataMapOfIntegerListOfInterference*)$self->Access();
    }
};

%extend Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfIntegerListOfInterference {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopOpeBRepDS_DataMapNodeOfDataMapOfIntegerListOfInterference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceListOfInterference;
class TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceListOfInterference : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceListOfInterference;
		%feature("autodoc", "	:param K:
	:type K: Handle_TopOpeBRepDS_Interference &
	:param I:
	:type I: TopOpeBRepDS_ListOfInterference &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceListOfInterference;
		 TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceListOfInterference (const Handle_TopOpeBRepDS_Interference & K,const TopOpeBRepDS_ListOfInterference & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: Handle_TopOpeBRepDS_Interference
") Key;
		Handle_TopOpeBRepDS_Interference Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopOpeBRepDS_ListOfInterference
") Value;
		TopOpeBRepDS_ListOfInterference & Value ();
};


%extend TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceListOfInterference {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceListOfInterference(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceListOfInterference::Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceListOfInterference %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceListOfInterference;
class Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceListOfInterference : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceListOfInterference();
        Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceListOfInterference(const Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceListOfInterference &aHandle);
        Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceListOfInterference(const TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceListOfInterference *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceListOfInterference DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceListOfInterference {
    TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceListOfInterference* _get_reference() {
    return (TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceListOfInterference*)$self->Access();
    }
};

%extend Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceListOfInterference {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceListOfInterference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceShape;
class TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceShape : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceShape;
		%feature("autodoc", "	:param K:
	:type K: Handle_TopOpeBRepDS_Interference &
	:param I:
	:type I: TopoDS_Shape &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceShape;
		 TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceShape (const Handle_TopOpeBRepDS_Interference & K,const TopoDS_Shape & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: Handle_TopOpeBRepDS_Interference
") Key;
		Handle_TopOpeBRepDS_Interference Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Value;
		TopoDS_Shape  Value ();
};


%extend TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceShape {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceShape(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceShape::Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceShape %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceShape;
class Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceShape : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceShape();
        Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceShape(const Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceShape &aHandle);
        Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceShape(const TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceShape *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceShape DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceShape {
    TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceShape* _get_reference() {
    return (TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceShape*)$self->Access();
    }
};

%extend Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceShape {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_DataMapNodeOfDataMapOfShapeListOfShapeOn1State;
class TopOpeBRepDS_DataMapNodeOfDataMapOfShapeListOfShapeOn1State : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_DataMapNodeOfDataMapOfShapeListOfShapeOn1State;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: TopOpeBRepDS_ListOfShapeOn1State &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TopOpeBRepDS_DataMapNodeOfDataMapOfShapeListOfShapeOn1State;
		 TopOpeBRepDS_DataMapNodeOfDataMapOfShapeListOfShapeOn1State (const TopoDS_Shape & K,const TopOpeBRepDS_ListOfShapeOn1State & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		TopoDS_Shape  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopOpeBRepDS_ListOfShapeOn1State
") Value;
		TopOpeBRepDS_ListOfShapeOn1State & Value ();
};


%extend TopOpeBRepDS_DataMapNodeOfDataMapOfShapeListOfShapeOn1State {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfShapeListOfShapeOn1State(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfShapeListOfShapeOn1State::Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfShapeListOfShapeOn1State %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfShapeListOfShapeOn1State;
class Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfShapeListOfShapeOn1State : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfShapeListOfShapeOn1State();
        Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfShapeListOfShapeOn1State(const Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfShapeListOfShapeOn1State &aHandle);
        Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfShapeListOfShapeOn1State(const TopOpeBRepDS_DataMapNodeOfDataMapOfShapeListOfShapeOn1State *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfShapeListOfShapeOn1State DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfShapeListOfShapeOn1State {
    TopOpeBRepDS_DataMapNodeOfDataMapOfShapeListOfShapeOn1State* _get_reference() {
    return (TopOpeBRepDS_DataMapNodeOfDataMapOfShapeListOfShapeOn1State*)$self->Access();
    }
};

%extend Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfShapeListOfShapeOn1State {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopOpeBRepDS_DataMapNodeOfDataMapOfShapeListOfShapeOn1State {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_DataMapNodeOfDataMapOfShapeState;
class TopOpeBRepDS_DataMapNodeOfDataMapOfShapeState : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_DataMapNodeOfDataMapOfShapeState;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: TopAbs_State &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TopOpeBRepDS_DataMapNodeOfDataMapOfShapeState;
		 TopOpeBRepDS_DataMapNodeOfDataMapOfShapeState (const TopoDS_Shape & K,const TopAbs_State & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		TopoDS_Shape  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopAbs_State
") Value;
		TopAbs_State & Value ();
};


%extend TopOpeBRepDS_DataMapNodeOfDataMapOfShapeState {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfShapeState(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfShapeState::Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfShapeState %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfShapeState;
class Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfShapeState : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfShapeState();
        Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfShapeState(const Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfShapeState &aHandle);
        Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfShapeState(const TopOpeBRepDS_DataMapNodeOfDataMapOfShapeState *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfShapeState DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfShapeState {
    TopOpeBRepDS_DataMapNodeOfDataMapOfShapeState* _get_reference() {
    return (TopOpeBRepDS_DataMapNodeOfDataMapOfShapeState*)$self->Access();
    }
};

%extend Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfShapeState {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopOpeBRepDS_DataMapNodeOfDataMapOfShapeState {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_DataMapNodeOfMapOfCurve;
class TopOpeBRepDS_DataMapNodeOfMapOfCurve : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_DataMapNodeOfMapOfCurve;
		%feature("autodoc", "	:param K:
	:type K: int &
	:param I:
	:type I: TopOpeBRepDS_CurveData &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TopOpeBRepDS_DataMapNodeOfMapOfCurve;
		 TopOpeBRepDS_DataMapNodeOfMapOfCurve (const Standard_Integer & K,const TopOpeBRepDS_CurveData & I,const TCollection_MapNodePtr & n);

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey() {
                return (Standard_Integer) $self->Key();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey(Standard_Integer value ) {
                $self->Key()=value;
                }
            };
            		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopOpeBRepDS_CurveData
") Value;
		TopOpeBRepDS_CurveData & Value ();
};


%extend TopOpeBRepDS_DataMapNodeOfMapOfCurve {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopOpeBRepDS_DataMapNodeOfMapOfCurve(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopOpeBRepDS_DataMapNodeOfMapOfCurve::Handle_TopOpeBRepDS_DataMapNodeOfMapOfCurve %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TopOpeBRepDS_DataMapNodeOfMapOfCurve;
class Handle_TopOpeBRepDS_DataMapNodeOfMapOfCurve : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TopOpeBRepDS_DataMapNodeOfMapOfCurve();
        Handle_TopOpeBRepDS_DataMapNodeOfMapOfCurve(const Handle_TopOpeBRepDS_DataMapNodeOfMapOfCurve &aHandle);
        Handle_TopOpeBRepDS_DataMapNodeOfMapOfCurve(const TopOpeBRepDS_DataMapNodeOfMapOfCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopOpeBRepDS_DataMapNodeOfMapOfCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopOpeBRepDS_DataMapNodeOfMapOfCurve {
    TopOpeBRepDS_DataMapNodeOfMapOfCurve* _get_reference() {
    return (TopOpeBRepDS_DataMapNodeOfMapOfCurve*)$self->Access();
    }
};

%extend Handle_TopOpeBRepDS_DataMapNodeOfMapOfCurve {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopOpeBRepDS_DataMapNodeOfMapOfCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_DataMapNodeOfMapOfIntegerShapeData;
class TopOpeBRepDS_DataMapNodeOfMapOfIntegerShapeData : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_DataMapNodeOfMapOfIntegerShapeData;
		%feature("autodoc", "	:param K:
	:type K: int &
	:param I:
	:type I: TopOpeBRepDS_ShapeData &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TopOpeBRepDS_DataMapNodeOfMapOfIntegerShapeData;
		 TopOpeBRepDS_DataMapNodeOfMapOfIntegerShapeData (const Standard_Integer & K,const TopOpeBRepDS_ShapeData & I,const TCollection_MapNodePtr & n);

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey() {
                return (Standard_Integer) $self->Key();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey(Standard_Integer value ) {
                $self->Key()=value;
                }
            };
            		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopOpeBRepDS_ShapeData
") Value;
		TopOpeBRepDS_ShapeData & Value ();
};


%extend TopOpeBRepDS_DataMapNodeOfMapOfIntegerShapeData {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopOpeBRepDS_DataMapNodeOfMapOfIntegerShapeData(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopOpeBRepDS_DataMapNodeOfMapOfIntegerShapeData::Handle_TopOpeBRepDS_DataMapNodeOfMapOfIntegerShapeData %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TopOpeBRepDS_DataMapNodeOfMapOfIntegerShapeData;
class Handle_TopOpeBRepDS_DataMapNodeOfMapOfIntegerShapeData : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TopOpeBRepDS_DataMapNodeOfMapOfIntegerShapeData();
        Handle_TopOpeBRepDS_DataMapNodeOfMapOfIntegerShapeData(const Handle_TopOpeBRepDS_DataMapNodeOfMapOfIntegerShapeData &aHandle);
        Handle_TopOpeBRepDS_DataMapNodeOfMapOfIntegerShapeData(const TopOpeBRepDS_DataMapNodeOfMapOfIntegerShapeData *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopOpeBRepDS_DataMapNodeOfMapOfIntegerShapeData DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopOpeBRepDS_DataMapNodeOfMapOfIntegerShapeData {
    TopOpeBRepDS_DataMapNodeOfMapOfIntegerShapeData* _get_reference() {
    return (TopOpeBRepDS_DataMapNodeOfMapOfIntegerShapeData*)$self->Access();
    }
};

%extend Handle_TopOpeBRepDS_DataMapNodeOfMapOfIntegerShapeData {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopOpeBRepDS_DataMapNodeOfMapOfIntegerShapeData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_DataMapNodeOfMapOfPoint;
class TopOpeBRepDS_DataMapNodeOfMapOfPoint : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_DataMapNodeOfMapOfPoint;
		%feature("autodoc", "	:param K:
	:type K: int &
	:param I:
	:type I: TopOpeBRepDS_PointData &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TopOpeBRepDS_DataMapNodeOfMapOfPoint;
		 TopOpeBRepDS_DataMapNodeOfMapOfPoint (const Standard_Integer & K,const TopOpeBRepDS_PointData & I,const TCollection_MapNodePtr & n);

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey() {
                return (Standard_Integer) $self->Key();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey(Standard_Integer value ) {
                $self->Key()=value;
                }
            };
            		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopOpeBRepDS_PointData
") Value;
		TopOpeBRepDS_PointData & Value ();
};


%extend TopOpeBRepDS_DataMapNodeOfMapOfPoint {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopOpeBRepDS_DataMapNodeOfMapOfPoint(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopOpeBRepDS_DataMapNodeOfMapOfPoint::Handle_TopOpeBRepDS_DataMapNodeOfMapOfPoint %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TopOpeBRepDS_DataMapNodeOfMapOfPoint;
class Handle_TopOpeBRepDS_DataMapNodeOfMapOfPoint : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TopOpeBRepDS_DataMapNodeOfMapOfPoint();
        Handle_TopOpeBRepDS_DataMapNodeOfMapOfPoint(const Handle_TopOpeBRepDS_DataMapNodeOfMapOfPoint &aHandle);
        Handle_TopOpeBRepDS_DataMapNodeOfMapOfPoint(const TopOpeBRepDS_DataMapNodeOfMapOfPoint *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopOpeBRepDS_DataMapNodeOfMapOfPoint DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopOpeBRepDS_DataMapNodeOfMapOfPoint {
    TopOpeBRepDS_DataMapNodeOfMapOfPoint* _get_reference() {
    return (TopOpeBRepDS_DataMapNodeOfMapOfPoint*)$self->Access();
    }
};

%extend Handle_TopOpeBRepDS_DataMapNodeOfMapOfPoint {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopOpeBRepDS_DataMapNodeOfMapOfPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_DataMapNodeOfMapOfSurface;
class TopOpeBRepDS_DataMapNodeOfMapOfSurface : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_DataMapNodeOfMapOfSurface;
		%feature("autodoc", "	:param K:
	:type K: int &
	:param I:
	:type I: TopOpeBRepDS_SurfaceData &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TopOpeBRepDS_DataMapNodeOfMapOfSurface;
		 TopOpeBRepDS_DataMapNodeOfMapOfSurface (const Standard_Integer & K,const TopOpeBRepDS_SurfaceData & I,const TCollection_MapNodePtr & n);

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey() {
                return (Standard_Integer) $self->Key();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey(Standard_Integer value ) {
                $self->Key()=value;
                }
            };
            		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopOpeBRepDS_SurfaceData
") Value;
		TopOpeBRepDS_SurfaceData & Value ();
};


%extend TopOpeBRepDS_DataMapNodeOfMapOfSurface {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopOpeBRepDS_DataMapNodeOfMapOfSurface(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopOpeBRepDS_DataMapNodeOfMapOfSurface::Handle_TopOpeBRepDS_DataMapNodeOfMapOfSurface %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TopOpeBRepDS_DataMapNodeOfMapOfSurface;
class Handle_TopOpeBRepDS_DataMapNodeOfMapOfSurface : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TopOpeBRepDS_DataMapNodeOfMapOfSurface();
        Handle_TopOpeBRepDS_DataMapNodeOfMapOfSurface(const Handle_TopOpeBRepDS_DataMapNodeOfMapOfSurface &aHandle);
        Handle_TopOpeBRepDS_DataMapNodeOfMapOfSurface(const TopOpeBRepDS_DataMapNodeOfMapOfSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopOpeBRepDS_DataMapNodeOfMapOfSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopOpeBRepDS_DataMapNodeOfMapOfSurface {
    TopOpeBRepDS_DataMapNodeOfMapOfSurface* _get_reference() {
    return (TopOpeBRepDS_DataMapNodeOfMapOfSurface*)$self->Access();
    }
};

%extend Handle_TopOpeBRepDS_DataMapNodeOfMapOfSurface {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopOpeBRepDS_DataMapNodeOfMapOfSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_DataMapNodeOfShapeSurface;
class TopOpeBRepDS_DataMapNodeOfShapeSurface : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_DataMapNodeOfShapeSurface;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: Handle_Geom_Surface &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TopOpeBRepDS_DataMapNodeOfShapeSurface;
		 TopOpeBRepDS_DataMapNodeOfShapeSurface (const TopoDS_Shape & K,const Handle_Geom_Surface & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		TopoDS_Shape  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Geom_Surface
") Value;
		Handle_Geom_Surface Value ();
};


%extend TopOpeBRepDS_DataMapNodeOfShapeSurface {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopOpeBRepDS_DataMapNodeOfShapeSurface(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopOpeBRepDS_DataMapNodeOfShapeSurface::Handle_TopOpeBRepDS_DataMapNodeOfShapeSurface %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TopOpeBRepDS_DataMapNodeOfShapeSurface;
class Handle_TopOpeBRepDS_DataMapNodeOfShapeSurface : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TopOpeBRepDS_DataMapNodeOfShapeSurface();
        Handle_TopOpeBRepDS_DataMapNodeOfShapeSurface(const Handle_TopOpeBRepDS_DataMapNodeOfShapeSurface &aHandle);
        Handle_TopOpeBRepDS_DataMapNodeOfShapeSurface(const TopOpeBRepDS_DataMapNodeOfShapeSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopOpeBRepDS_DataMapNodeOfShapeSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopOpeBRepDS_DataMapNodeOfShapeSurface {
    TopOpeBRepDS_DataMapNodeOfShapeSurface* _get_reference() {
    return (TopOpeBRepDS_DataMapNodeOfShapeSurface*)$self->Access();
    }
};

%extend Handle_TopOpeBRepDS_DataMapNodeOfShapeSurface {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopOpeBRepDS_DataMapNodeOfShapeSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_DataMapOfCheckStatus;
class TopOpeBRepDS_DataMapOfCheckStatus : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_DataMapOfCheckStatus;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TopOpeBRepDS_DataMapOfCheckStatus;
		 TopOpeBRepDS_DataMapOfCheckStatus (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepDS_DataMapOfCheckStatus &
	:rtype: TopOpeBRepDS_DataMapOfCheckStatus
") Assign;
		TopOpeBRepDS_DataMapOfCheckStatus & Assign (const TopOpeBRepDS_DataMapOfCheckStatus & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepDS_DataMapOfCheckStatus &
	:rtype: TopOpeBRepDS_DataMapOfCheckStatus
") operator =;
		TopOpeBRepDS_DataMapOfCheckStatus & operator = (const TopOpeBRepDS_DataMapOfCheckStatus & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:param I:
	:type I: TopOpeBRepDS_CheckStatus &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const Standard_Integer & K,const TopOpeBRepDS_CheckStatus & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const Standard_Integer & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const Standard_Integer & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: TopOpeBRepDS_CheckStatus
") Find;
		const TopOpeBRepDS_CheckStatus & Find (const Standard_Integer & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: TopOpeBRepDS_CheckStatus
") ChangeFind;
		TopOpeBRepDS_CheckStatus & ChangeFind (const Standard_Integer & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const Standard_Integer & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const Standard_Integer & K);
};


%extend TopOpeBRepDS_DataMapOfCheckStatus {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_DataMapOfIntegerListOfInterference;
class TopOpeBRepDS_DataMapOfIntegerListOfInterference : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_DataMapOfIntegerListOfInterference;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TopOpeBRepDS_DataMapOfIntegerListOfInterference;
		 TopOpeBRepDS_DataMapOfIntegerListOfInterference (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepDS_DataMapOfIntegerListOfInterference &
	:rtype: TopOpeBRepDS_DataMapOfIntegerListOfInterference
") Assign;
		TopOpeBRepDS_DataMapOfIntegerListOfInterference & Assign (const TopOpeBRepDS_DataMapOfIntegerListOfInterference & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepDS_DataMapOfIntegerListOfInterference &
	:rtype: TopOpeBRepDS_DataMapOfIntegerListOfInterference
") operator =;
		TopOpeBRepDS_DataMapOfIntegerListOfInterference & operator = (const TopOpeBRepDS_DataMapOfIntegerListOfInterference & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:param I:
	:type I: TopOpeBRepDS_ListOfInterference &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const Standard_Integer & K,const TopOpeBRepDS_ListOfInterference & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const Standard_Integer & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const Standard_Integer & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: TopOpeBRepDS_ListOfInterference
") Find;
		const TopOpeBRepDS_ListOfInterference & Find (const Standard_Integer & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: TopOpeBRepDS_ListOfInterference
") ChangeFind;
		TopOpeBRepDS_ListOfInterference & ChangeFind (const Standard_Integer & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const Standard_Integer & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const Standard_Integer & K);
};


%extend TopOpeBRepDS_DataMapOfIntegerListOfInterference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_DataMapOfInterferenceListOfInterference;
class TopOpeBRepDS_DataMapOfInterferenceListOfInterference : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_DataMapOfInterferenceListOfInterference;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TopOpeBRepDS_DataMapOfInterferenceListOfInterference;
		 TopOpeBRepDS_DataMapOfInterferenceListOfInterference (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepDS_DataMapOfInterferenceListOfInterference &
	:rtype: TopOpeBRepDS_DataMapOfInterferenceListOfInterference
") Assign;
		TopOpeBRepDS_DataMapOfInterferenceListOfInterference & Assign (const TopOpeBRepDS_DataMapOfInterferenceListOfInterference & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepDS_DataMapOfInterferenceListOfInterference &
	:rtype: TopOpeBRepDS_DataMapOfInterferenceListOfInterference
") operator =;
		TopOpeBRepDS_DataMapOfInterferenceListOfInterference & operator = (const TopOpeBRepDS_DataMapOfInterferenceListOfInterference & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: Handle_TopOpeBRepDS_Interference &
	:param I:
	:type I: TopOpeBRepDS_ListOfInterference &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const Handle_TopOpeBRepDS_Interference & K,const TopOpeBRepDS_ListOfInterference & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: Handle_TopOpeBRepDS_Interference &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const Handle_TopOpeBRepDS_Interference & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: Handle_TopOpeBRepDS_Interference &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const Handle_TopOpeBRepDS_Interference & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: Handle_TopOpeBRepDS_Interference &
	:rtype: TopOpeBRepDS_ListOfInterference
") Find;
		const TopOpeBRepDS_ListOfInterference & Find (const Handle_TopOpeBRepDS_Interference & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: Handle_TopOpeBRepDS_Interference &
	:rtype: TopOpeBRepDS_ListOfInterference
") ChangeFind;
		TopOpeBRepDS_ListOfInterference & ChangeFind (const Handle_TopOpeBRepDS_Interference & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: Handle_TopOpeBRepDS_Interference &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const Handle_TopOpeBRepDS_Interference & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: Handle_TopOpeBRepDS_Interference &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const Handle_TopOpeBRepDS_Interference & K);
};


%extend TopOpeBRepDS_DataMapOfInterferenceListOfInterference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_DataMapOfInterferenceShape;
class TopOpeBRepDS_DataMapOfInterferenceShape : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_DataMapOfInterferenceShape;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TopOpeBRepDS_DataMapOfInterferenceShape;
		 TopOpeBRepDS_DataMapOfInterferenceShape (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepDS_DataMapOfInterferenceShape &
	:rtype: TopOpeBRepDS_DataMapOfInterferenceShape
") Assign;
		TopOpeBRepDS_DataMapOfInterferenceShape & Assign (const TopOpeBRepDS_DataMapOfInterferenceShape & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepDS_DataMapOfInterferenceShape &
	:rtype: TopOpeBRepDS_DataMapOfInterferenceShape
") operator =;
		TopOpeBRepDS_DataMapOfInterferenceShape & operator = (const TopOpeBRepDS_DataMapOfInterferenceShape & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: Handle_TopOpeBRepDS_Interference &
	:param I:
	:type I: TopoDS_Shape &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const Handle_TopOpeBRepDS_Interference & K,const TopoDS_Shape & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: Handle_TopOpeBRepDS_Interference &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const Handle_TopOpeBRepDS_Interference & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: Handle_TopOpeBRepDS_Interference &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const Handle_TopOpeBRepDS_Interference & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: Handle_TopOpeBRepDS_Interference &
	:rtype: TopoDS_Shape
") Find;
		const TopoDS_Shape  Find (const Handle_TopOpeBRepDS_Interference & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: Handle_TopOpeBRepDS_Interference &
	:rtype: TopoDS_Shape
") ChangeFind;
		TopoDS_Shape  ChangeFind (const Handle_TopOpeBRepDS_Interference & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: Handle_TopOpeBRepDS_Interference &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const Handle_TopOpeBRepDS_Interference & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: Handle_TopOpeBRepDS_Interference &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const Handle_TopOpeBRepDS_Interference & K);
};


%extend TopOpeBRepDS_DataMapOfInterferenceShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State;
class TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State;
		 TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State &
	:rtype: TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State
") Assign;
		TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State & Assign (const TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State &
	:rtype: TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State
") operator =;
		TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State & operator = (const TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: TopOpeBRepDS_ListOfShapeOn1State &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const TopOpeBRepDS_ListOfShapeOn1State & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TopOpeBRepDS_ListOfShapeOn1State
") Find;
		const TopOpeBRepDS_ListOfShapeOn1State & Find (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TopOpeBRepDS_ListOfShapeOn1State
") ChangeFind;
		TopOpeBRepDS_ListOfShapeOn1State & ChangeFind (const TopoDS_Shape & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Shape & K);
};


%extend TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_DataMapOfShapeState;
class TopOpeBRepDS_DataMapOfShapeState : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_DataMapOfShapeState;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TopOpeBRepDS_DataMapOfShapeState;
		 TopOpeBRepDS_DataMapOfShapeState (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepDS_DataMapOfShapeState &
	:rtype: TopOpeBRepDS_DataMapOfShapeState
") Assign;
		TopOpeBRepDS_DataMapOfShapeState & Assign (const TopOpeBRepDS_DataMapOfShapeState & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepDS_DataMapOfShapeState &
	:rtype: TopOpeBRepDS_DataMapOfShapeState
") operator =;
		TopOpeBRepDS_DataMapOfShapeState & operator = (const TopOpeBRepDS_DataMapOfShapeState & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: TopAbs_State &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const TopAbs_State & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TopAbs_State
") Find;
		const TopAbs_State & Find (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TopAbs_State
") ChangeFind;
		TopAbs_State & ChangeFind (const TopoDS_Shape & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Shape & K);
};


%extend TopOpeBRepDS_DataMapOfShapeState {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_DataStructure;
class TopOpeBRepDS_DataStructure {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_DataStructure;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepDS_DataStructure;
		 TopOpeBRepDS_DataStructure ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* reset the data structure

	:rtype: None
") Init;
		void Init ();
		%feature("compactdefaultargs") AddSurface;
		%feature("autodoc", "	* Insert a new surface. Returns the index.

	:param S:
	:type S: TopOpeBRepDS_Surface &
	:rtype: int
") AddSurface;
		Standard_Integer AddSurface (const TopOpeBRepDS_Surface & S);
		%feature("compactdefaultargs") RemoveSurface;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: None
") RemoveSurface;
		void RemoveSurface (const Standard_Integer I);
		%feature("compactdefaultargs") KeepSurface;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: bool
") KeepSurface;
		Standard_Boolean KeepSurface (const Standard_Integer I);
		%feature("compactdefaultargs") KeepSurface;
		%feature("autodoc", "	:param S:
	:type S: TopOpeBRepDS_Surface &
	:rtype: bool
") KeepSurface;
		Standard_Boolean KeepSurface (TopOpeBRepDS_Surface & S);
		%feature("compactdefaultargs") ChangeKeepSurface;
		%feature("autodoc", "	:param I:
	:type I: int
	:param FindKeep:
	:type FindKeep: bool
	:rtype: None
") ChangeKeepSurface;
		void ChangeKeepSurface (const Standard_Integer I,const Standard_Boolean FindKeep);
		%feature("compactdefaultargs") ChangeKeepSurface;
		%feature("autodoc", "	:param S:
	:type S: TopOpeBRepDS_Surface &
	:param FindKeep:
	:type FindKeep: bool
	:rtype: None
") ChangeKeepSurface;
		void ChangeKeepSurface (TopOpeBRepDS_Surface & S,const Standard_Boolean FindKeep);
		%feature("compactdefaultargs") AddCurve;
		%feature("autodoc", "	* Insert a new curve. Returns the index.

	:param S:
	:type S: TopOpeBRepDS_Curve &
	:rtype: int
") AddCurve;
		Standard_Integer AddCurve (const TopOpeBRepDS_Curve & S);
		%feature("compactdefaultargs") RemoveCurve;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: None
") RemoveCurve;
		void RemoveCurve (const Standard_Integer I);
		%feature("compactdefaultargs") KeepCurve;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: bool
") KeepCurve;
		Standard_Boolean KeepCurve (const Standard_Integer I);
		%feature("compactdefaultargs") KeepCurve;
		%feature("autodoc", "	:param C:
	:type C: TopOpeBRepDS_Curve &
	:rtype: bool
") KeepCurve;
		Standard_Boolean KeepCurve (const TopOpeBRepDS_Curve & C);
		%feature("compactdefaultargs") ChangeKeepCurve;
		%feature("autodoc", "	:param I:
	:type I: int
	:param FindKeep:
	:type FindKeep: bool
	:rtype: None
") ChangeKeepCurve;
		void ChangeKeepCurve (const Standard_Integer I,const Standard_Boolean FindKeep);
		%feature("compactdefaultargs") ChangeKeepCurve;
		%feature("autodoc", "	:param C:
	:type C: TopOpeBRepDS_Curve &
	:param FindKeep:
	:type FindKeep: bool
	:rtype: None
") ChangeKeepCurve;
		void ChangeKeepCurve (TopOpeBRepDS_Curve & C,const Standard_Boolean FindKeep);
		%feature("compactdefaultargs") AddPoint;
		%feature("autodoc", "	* Insert a new point. Returns the index.

	:param PDS:
	:type PDS: TopOpeBRepDS_Point &
	:rtype: int
") AddPoint;
		Standard_Integer AddPoint (const TopOpeBRepDS_Point & PDS);
		%feature("compactdefaultargs") AddPointSS;
		%feature("autodoc", "	* Insert a new point. Returns the index.

	:param PDS:
	:type PDS: TopOpeBRepDS_Point &
	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:rtype: int
") AddPointSS;
		Standard_Integer AddPointSS (const TopOpeBRepDS_Point & PDS,const TopoDS_Shape & S1,const TopoDS_Shape & S2);
		%feature("compactdefaultargs") RemovePoint;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: None
") RemovePoint;
		void RemovePoint (const Standard_Integer I);
		%feature("compactdefaultargs") KeepPoint;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: bool
") KeepPoint;
		Standard_Boolean KeepPoint (const Standard_Integer I);
		%feature("compactdefaultargs") KeepPoint;
		%feature("autodoc", "	:param P:
	:type P: TopOpeBRepDS_Point &
	:rtype: bool
") KeepPoint;
		Standard_Boolean KeepPoint (const TopOpeBRepDS_Point & P);
		%feature("compactdefaultargs") ChangeKeepPoint;
		%feature("autodoc", "	:param I:
	:type I: int
	:param FindKeep:
	:type FindKeep: bool
	:rtype: None
") ChangeKeepPoint;
		void ChangeKeepPoint (const Standard_Integer I,const Standard_Boolean FindKeep);
		%feature("compactdefaultargs") ChangeKeepPoint;
		%feature("autodoc", "	:param P:
	:type P: TopOpeBRepDS_Point &
	:param FindKeep:
	:type FindKeep: bool
	:rtype: None
") ChangeKeepPoint;
		void ChangeKeepPoint (TopOpeBRepDS_Point & P,const Standard_Boolean FindKeep);
		%feature("compactdefaultargs") AddShape;
		%feature("autodoc", "	* Insert a shape S. Returns the index.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: int
") AddShape;
		Standard_Integer AddShape (const TopoDS_Shape & S);
		%feature("compactdefaultargs") AddShape;
		%feature("autodoc", "	* Insert a shape S which ancestor is I = 1 or 2. Returns the index.

	:param S:
	:type S: TopoDS_Shape &
	:param I:
	:type I: int
	:rtype: int
") AddShape;
		Standard_Integer AddShape (const TopoDS_Shape & S,const Standard_Integer I);
		%feature("compactdefaultargs") KeepShape;
		%feature("autodoc", "	:param I:
	:type I: int
	:param FindKeep: default value is Standard_True
	:type FindKeep: bool
	:rtype: bool
") KeepShape;
		Standard_Boolean KeepShape (const Standard_Integer I,const Standard_Boolean FindKeep = Standard_True);
		%feature("compactdefaultargs") KeepShape;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param FindKeep: default value is Standard_True
	:type FindKeep: bool
	:rtype: bool
") KeepShape;
		Standard_Boolean KeepShape (const TopoDS_Shape & S,const Standard_Boolean FindKeep = Standard_True);
		%feature("compactdefaultargs") ChangeKeepShape;
		%feature("autodoc", "	:param I:
	:type I: int
	:param FindKeep:
	:type FindKeep: bool
	:rtype: None
") ChangeKeepShape;
		void ChangeKeepShape (const Standard_Integer I,const Standard_Boolean FindKeep);
		%feature("compactdefaultargs") ChangeKeepShape;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param FindKeep:
	:type FindKeep: bool
	:rtype: None
") ChangeKeepShape;
		void ChangeKeepShape (const TopoDS_Shape & S,const Standard_Boolean FindKeep);
		%feature("compactdefaultargs") InitSectionEdges;
		%feature("autodoc", "	:rtype: None
") InitSectionEdges;
		void InitSectionEdges ();
		%feature("compactdefaultargs") AddSectionEdge;
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Edge &
	:rtype: int
") AddSectionEdge;
		Standard_Integer AddSectionEdge (const TopoDS_Edge & E);
		%feature("compactdefaultargs") SurfaceInterferences;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: TopOpeBRepDS_ListOfInterference
") SurfaceInterferences;
		const TopOpeBRepDS_ListOfInterference & SurfaceInterferences (const Standard_Integer I);
		%feature("compactdefaultargs") ChangeSurfaceInterferences;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: TopOpeBRepDS_ListOfInterference
") ChangeSurfaceInterferences;
		TopOpeBRepDS_ListOfInterference & ChangeSurfaceInterferences (const Standard_Integer I);
		%feature("compactdefaultargs") CurveInterferences;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: TopOpeBRepDS_ListOfInterference
") CurveInterferences;
		const TopOpeBRepDS_ListOfInterference & CurveInterferences (const Standard_Integer I);
		%feature("compactdefaultargs") ChangeCurveInterferences;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: TopOpeBRepDS_ListOfInterference
") ChangeCurveInterferences;
		TopOpeBRepDS_ListOfInterference & ChangeCurveInterferences (const Standard_Integer I);
		%feature("compactdefaultargs") PointInterferences;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: TopOpeBRepDS_ListOfInterference
") PointInterferences;
		const TopOpeBRepDS_ListOfInterference & PointInterferences (const Standard_Integer I);
		%feature("compactdefaultargs") ChangePointInterferences;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: TopOpeBRepDS_ListOfInterference
") ChangePointInterferences;
		TopOpeBRepDS_ListOfInterference & ChangePointInterferences (const Standard_Integer I);
		%feature("compactdefaultargs") ShapeInterferences;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param FindKeep: default value is Standard_True
	:type FindKeep: bool
	:rtype: TopOpeBRepDS_ListOfInterference
") ShapeInterferences;
		const TopOpeBRepDS_ListOfInterference & ShapeInterferences (const TopoDS_Shape & S,const Standard_Boolean FindKeep = Standard_True);
		%feature("compactdefaultargs") ChangeShapeInterferences;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopOpeBRepDS_ListOfInterference
") ChangeShapeInterferences;
		TopOpeBRepDS_ListOfInterference & ChangeShapeInterferences (const TopoDS_Shape & S);
		%feature("compactdefaultargs") ShapeInterferences;
		%feature("autodoc", "	:param I:
	:type I: int
	:param FindKeep: default value is Standard_True
	:type FindKeep: bool
	:rtype: TopOpeBRepDS_ListOfInterference
") ShapeInterferences;
		const TopOpeBRepDS_ListOfInterference & ShapeInterferences (const Standard_Integer I,const Standard_Boolean FindKeep = Standard_True);
		%feature("compactdefaultargs") ChangeShapeInterferences;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: TopOpeBRepDS_ListOfInterference
") ChangeShapeInterferences;
		TopOpeBRepDS_ListOfInterference & ChangeShapeInterferences (const Standard_Integer I);
		%feature("compactdefaultargs") ShapeSameDomain;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") ShapeSameDomain;
		const TopTools_ListOfShape & ShapeSameDomain (const TopoDS_Shape & S);
		%feature("compactdefaultargs") ChangeShapeSameDomain;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") ChangeShapeSameDomain;
		TopTools_ListOfShape & ChangeShapeSameDomain (const TopoDS_Shape & S);
		%feature("compactdefaultargs") ShapeSameDomain;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: TopTools_ListOfShape
") ShapeSameDomain;
		const TopTools_ListOfShape & ShapeSameDomain (const Standard_Integer I);
		%feature("compactdefaultargs") ChangeShapeSameDomain;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: TopTools_ListOfShape
") ChangeShapeSameDomain;
		TopTools_ListOfShape & ChangeShapeSameDomain (const Standard_Integer I);
		%feature("compactdefaultargs") ChangeShapes;
		%feature("autodoc", "	:rtype: TopOpeBRepDS_MapOfShapeData
") ChangeShapes;
		TopOpeBRepDS_MapOfShapeData & ChangeShapes ();
		%feature("compactdefaultargs") AddShapeSameDomain;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param SSD:
	:type SSD: TopoDS_Shape &
	:rtype: None
") AddShapeSameDomain;
		void AddShapeSameDomain (const TopoDS_Shape & S,const TopoDS_Shape & SSD);
		%feature("compactdefaultargs") RemoveShapeSameDomain;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param SSD:
	:type SSD: TopoDS_Shape &
	:rtype: None
") RemoveShapeSameDomain;
		void RemoveShapeSameDomain (const TopoDS_Shape & S,const TopoDS_Shape & SSD);
		%feature("compactdefaultargs") SameDomainRef;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: int
") SameDomainRef;
		Standard_Integer SameDomainRef (const Standard_Integer I);
		%feature("compactdefaultargs") SameDomainRef;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: int
") SameDomainRef;
		Standard_Integer SameDomainRef (const TopoDS_Shape & S);
		%feature("compactdefaultargs") SameDomainRef;
		%feature("autodoc", "	:param I:
	:type I: int
	:param Ref:
	:type Ref: int
	:rtype: None
") SameDomainRef;
		void SameDomainRef (const Standard_Integer I,const Standard_Integer Ref);
		%feature("compactdefaultargs") SameDomainRef;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param Ref:
	:type Ref: int
	:rtype: None
") SameDomainRef;
		void SameDomainRef (const TopoDS_Shape & S,const Standard_Integer Ref);
		%feature("compactdefaultargs") SameDomainOri;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: TopOpeBRepDS_Config
") SameDomainOri;
		TopOpeBRepDS_Config SameDomainOri (const Standard_Integer I);
		%feature("compactdefaultargs") SameDomainOri;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopOpeBRepDS_Config
") SameDomainOri;
		TopOpeBRepDS_Config SameDomainOri (const TopoDS_Shape & S);
		%feature("compactdefaultargs") SameDomainOri;
		%feature("autodoc", "	:param I:
	:type I: int
	:param Ori:
	:type Ori: TopOpeBRepDS_Config
	:rtype: None
") SameDomainOri;
		void SameDomainOri (const Standard_Integer I,const TopOpeBRepDS_Config Ori);
		%feature("compactdefaultargs") SameDomainOri;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param Ori:
	:type Ori: TopOpeBRepDS_Config
	:rtype: None
") SameDomainOri;
		void SameDomainOri (const TopoDS_Shape & S,const TopOpeBRepDS_Config Ori);
		%feature("compactdefaultargs") SameDomainInd;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: int
") SameDomainInd;
		Standard_Integer SameDomainInd (const Standard_Integer I);
		%feature("compactdefaultargs") SameDomainInd;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: int
") SameDomainInd;
		Standard_Integer SameDomainInd (const TopoDS_Shape & S);
		%feature("compactdefaultargs") SameDomainInd;
		%feature("autodoc", "	:param I:
	:type I: int
	:param Ind:
	:type Ind: int
	:rtype: None
") SameDomainInd;
		void SameDomainInd (const Standard_Integer I,const Standard_Integer Ind);
		%feature("compactdefaultargs") SameDomainInd;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param Ind:
	:type Ind: int
	:rtype: None
") SameDomainInd;
		void SameDomainInd (const TopoDS_Shape & S,const Standard_Integer Ind);
		%feature("compactdefaultargs") AncestorRank;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: int
") AncestorRank;
		Standard_Integer AncestorRank (const Standard_Integer I);
		%feature("compactdefaultargs") AncestorRank;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: int
") AncestorRank;
		Standard_Integer AncestorRank (const TopoDS_Shape & S);
		%feature("compactdefaultargs") AncestorRank;
		%feature("autodoc", "	:param I:
	:type I: int
	:param Ianc:
	:type Ianc: int
	:rtype: None
") AncestorRank;
		void AncestorRank (const Standard_Integer I,const Standard_Integer Ianc);
		%feature("compactdefaultargs") AncestorRank;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param Ianc:
	:type Ianc: int
	:rtype: None
") AncestorRank;
		void AncestorRank (const TopoDS_Shape & S,const Standard_Integer Ianc);
		%feature("compactdefaultargs") AddShapeInterference;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param I:
	:type I: Handle_TopOpeBRepDS_Interference &
	:rtype: None
") AddShapeInterference;
		void AddShapeInterference (const TopoDS_Shape & S,const Handle_TopOpeBRepDS_Interference & I);
		%feature("compactdefaultargs") RemoveShapeInterference;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param I:
	:type I: Handle_TopOpeBRepDS_Interference &
	:rtype: None
") RemoveShapeInterference;
		void RemoveShapeInterference (const TopoDS_Shape & S,const Handle_TopOpeBRepDS_Interference & I);
		%feature("compactdefaultargs") FillShapesSameDomain;
		%feature("autodoc", "	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:param refFirst: default value is Standard_True
	:type refFirst: bool
	:rtype: None
") FillShapesSameDomain;
		void FillShapesSameDomain (const TopoDS_Shape & S1,const TopoDS_Shape & S2,const Standard_Boolean refFirst = Standard_True);
		%feature("compactdefaultargs") FillShapesSameDomain;
		%feature("autodoc", "	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:param c1:
	:type c1: TopOpeBRepDS_Config
	:param c2:
	:type c2: TopOpeBRepDS_Config
	:param refFirst: default value is Standard_True
	:type refFirst: bool
	:rtype: None
") FillShapesSameDomain;
		void FillShapesSameDomain (const TopoDS_Shape & S1,const TopoDS_Shape & S2,const TopOpeBRepDS_Config c1,const TopOpeBRepDS_Config c2,const Standard_Boolean refFirst = Standard_True);
		%feature("compactdefaultargs") UnfillShapesSameDomain;
		%feature("autodoc", "	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:rtype: None
") UnfillShapesSameDomain;
		void UnfillShapesSameDomain (const TopoDS_Shape & S1,const TopoDS_Shape & S2);
		%feature("compactdefaultargs") NbSurfaces;
		%feature("autodoc", "	:rtype: int
") NbSurfaces;
		Standard_Integer NbSurfaces ();
		%feature("compactdefaultargs") NbCurves;
		%feature("autodoc", "	:rtype: int
") NbCurves;
		Standard_Integer NbCurves ();
		%feature("compactdefaultargs") ChangeNbCurves;
		%feature("autodoc", "	:param N:
	:type N: int
	:rtype: None
") ChangeNbCurves;
		void ChangeNbCurves (const Standard_Integer N);
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "	:rtype: int
") NbPoints;
		Standard_Integer NbPoints ();
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", "	:rtype: int
") NbShapes;
		Standard_Integer NbShapes ();
		%feature("compactdefaultargs") NbSectionEdges;
		%feature("autodoc", "	:rtype: int
") NbSectionEdges;
		Standard_Integer NbSectionEdges ();
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "	* Returns the surface of index <I>.

	:param I:
	:type I: int
	:rtype: TopOpeBRepDS_Surface
") Surface;
		const TopOpeBRepDS_Surface & Surface (const Standard_Integer I);
		%feature("compactdefaultargs") ChangeSurface;
		%feature("autodoc", "	* Returns the surface of index <I>.

	:param I:
	:type I: int
	:rtype: TopOpeBRepDS_Surface
") ChangeSurface;
		TopOpeBRepDS_Surface & ChangeSurface (const Standard_Integer I);
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "	* Returns the Curve of index <I>.

	:param I:
	:type I: int
	:rtype: TopOpeBRepDS_Curve
") Curve;
		const TopOpeBRepDS_Curve & Curve (const Standard_Integer I);
		%feature("compactdefaultargs") ChangeCurve;
		%feature("autodoc", "	* Returns the Curve of index <I>.

	:param I:
	:type I: int
	:rtype: TopOpeBRepDS_Curve
") ChangeCurve;
		TopOpeBRepDS_Curve & ChangeCurve (const Standard_Integer I);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the point of index <I>.

	:param I:
	:type I: int
	:rtype: TopOpeBRepDS_Point
") Point;
		const TopOpeBRepDS_Point & Point (const Standard_Integer I);
		%feature("compactdefaultargs") ChangePoint;
		%feature("autodoc", "	* Returns the point of index <I>.

	:param I:
	:type I: int
	:rtype: TopOpeBRepDS_Point
") ChangePoint;
		TopOpeBRepDS_Point & ChangePoint (const Standard_Integer I);
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	* returns the shape of index I stored in the map myShapes, accessing a list of interference.

	:param I:
	:type I: int
	:param FindKeep: default value is Standard_True
	:type FindKeep: bool
	:rtype: TopoDS_Shape
") Shape;
		const TopoDS_Shape  Shape (const Standard_Integer I,const Standard_Boolean FindKeep = Standard_True);
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	* returns the index of shape <S> stored in the map myShapes, accessing a list of interference. returns 0 if <S> is not in the map.

	:param S:
	:type S: TopoDS_Shape &
	:param FindKeep: default value is Standard_True
	:type FindKeep: bool
	:rtype: int
") Shape;
		Standard_Integer Shape (const TopoDS_Shape & S,const Standard_Boolean FindKeep = Standard_True);
		%feature("compactdefaultargs") SectionEdge;
		%feature("autodoc", "	:param I:
	:type I: int
	:param FindKeep: default value is Standard_True
	:type FindKeep: bool
	:rtype: TopoDS_Edge
") SectionEdge;
		const TopoDS_Edge  SectionEdge (const Standard_Integer I,const Standard_Boolean FindKeep = Standard_True);
		%feature("compactdefaultargs") SectionEdge;
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Edge &
	:param FindKeep: default value is Standard_True
	:type FindKeep: bool
	:rtype: int
") SectionEdge;
		Standard_Integer SectionEdge (const TopoDS_Edge & E,const Standard_Boolean FindKeep = Standard_True);
		%feature("compactdefaultargs") IsSectionEdge;
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Edge &
	:param FindKeep: default value is Standard_True
	:type FindKeep: bool
	:rtype: bool
") IsSectionEdge;
		Standard_Boolean IsSectionEdge (const TopoDS_Edge & E,const Standard_Boolean FindKeep = Standard_True);
		%feature("compactdefaultargs") HasGeometry;
		%feature("autodoc", "	* Returns True if <S> has new geometries, i.e : True si : HasShape(S) True S a une liste d'interferences non vide. S = SOLID, FACE, EDGE : true/false S = SHELL, WIRE, VERTEX : false.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: bool
") HasGeometry;
		Standard_Boolean HasGeometry (const TopoDS_Shape & S);
		%feature("compactdefaultargs") HasShape;
		%feature("autodoc", "	* Returns True if <S> est dans myShapes

	:param S:
	:type S: TopoDS_Shape &
	:param FindKeep: default value is Standard_True
	:type FindKeep: bool
	:rtype: bool
") HasShape;
		Standard_Boolean HasShape (const TopoDS_Shape & S,const Standard_Boolean FindKeep = Standard_True);
		%feature("compactdefaultargs") SetNewSurface;
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Shape &
	:param S:
	:type S: Handle_Geom_Surface &
	:rtype: None
") SetNewSurface;
		void SetNewSurface (const TopoDS_Shape & F,const Handle_Geom_Surface & S);
		%feature("compactdefaultargs") HasNewSurface;
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Shape &
	:rtype: bool
") HasNewSurface;
		Standard_Boolean HasNewSurface (const TopoDS_Shape & F);
		%feature("compactdefaultargs") NewSurface;
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Shape &
	:rtype: Handle_Geom_Surface
") NewSurface;
		Handle_Geom_Surface NewSurface (const TopoDS_Shape & F);
		%feature("compactdefaultargs") Isfafa;
		%feature("autodoc", "	:param isfafa:
	:type isfafa: bool
	:rtype: None
") Isfafa;
		void Isfafa (const Standard_Boolean isfafa);
		%feature("compactdefaultargs") Isfafa;
		%feature("autodoc", "	:rtype: bool
") Isfafa;
		Standard_Boolean Isfafa ();
		%feature("compactdefaultargs") ChangeMapOfShapeWithStateObj;
		%feature("autodoc", "	:rtype: TopOpeBRepDS_IndexedDataMapOfShapeWithState
") ChangeMapOfShapeWithStateObj;
		TopOpeBRepDS_IndexedDataMapOfShapeWithState & ChangeMapOfShapeWithStateObj ();
		%feature("compactdefaultargs") ChangeMapOfShapeWithStateTool;
		%feature("autodoc", "	:rtype: TopOpeBRepDS_IndexedDataMapOfShapeWithState
") ChangeMapOfShapeWithStateTool;
		TopOpeBRepDS_IndexedDataMapOfShapeWithState & ChangeMapOfShapeWithStateTool ();
		%feature("compactdefaultargs") ChangeMapOfShapeWithState;
		%feature("autodoc", "	:param aShape:
	:type aShape: TopoDS_Shape &
	:param aFlag:
	:type aFlag: bool
	:rtype: TopOpeBRepDS_IndexedDataMapOfShapeWithState
") ChangeMapOfShapeWithState;
		TopOpeBRepDS_IndexedDataMapOfShapeWithState & ChangeMapOfShapeWithState (const TopoDS_Shape & aShape,Standard_Boolean &OutValue);
		%feature("compactdefaultargs") GetShapeWithState;
		%feature("autodoc", "	:param aShape:
	:type aShape: TopoDS_Shape &
	:rtype: TopOpeBRepDS_ShapeWithState
") GetShapeWithState;
		const TopOpeBRepDS_ShapeWithState & GetShapeWithState (const TopoDS_Shape & aShape);
		%feature("compactdefaultargs") ChangeMapOfRejectedShapesObj;
		%feature("autodoc", "	:rtype: TopTools_IndexedMapOfShape
") ChangeMapOfRejectedShapesObj;
		TopTools_IndexedMapOfShape & ChangeMapOfRejectedShapesObj ();
		%feature("compactdefaultargs") ChangeMapOfRejectedShapesTool;
		%feature("autodoc", "	:rtype: TopTools_IndexedMapOfShape
") ChangeMapOfRejectedShapesTool;
		TopTools_IndexedMapOfShape & ChangeMapOfRejectedShapesTool ();
};


%extend TopOpeBRepDS_DataStructure {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_DoubleMapIteratorOfDoubleMapOfIntegerShape;
class TopOpeBRepDS_DoubleMapIteratorOfDoubleMapOfIntegerShape : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_DoubleMapIteratorOfDoubleMapOfIntegerShape;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepDS_DoubleMapIteratorOfDoubleMapOfIntegerShape;
		 TopOpeBRepDS_DoubleMapIteratorOfDoubleMapOfIntegerShape ();
		%feature("compactdefaultargs") TopOpeBRepDS_DoubleMapIteratorOfDoubleMapOfIntegerShape;
		%feature("autodoc", "	:param aMap:
	:type aMap: TopOpeBRepDS_DoubleMapOfIntegerShape &
	:rtype: None
") TopOpeBRepDS_DoubleMapIteratorOfDoubleMapOfIntegerShape;
		 TopOpeBRepDS_DoubleMapIteratorOfDoubleMapOfIntegerShape (const TopOpeBRepDS_DoubleMapOfIntegerShape & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: TopOpeBRepDS_DoubleMapOfIntegerShape &
	:rtype: None
") Initialize;
		void Initialize (const TopOpeBRepDS_DoubleMapOfIntegerShape & aMap);
		%feature("compactdefaultargs") Key1;
		%feature("autodoc", "	:rtype: int
") Key1;
		const Standard_Integer & Key1 ();
		%feature("compactdefaultargs") Key2;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key2;
		const TopoDS_Shape  Key2 ();
};


%extend TopOpeBRepDS_DoubleMapIteratorOfDoubleMapOfIntegerShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_DoubleMapNodeOfDoubleMapOfIntegerShape;
class TopOpeBRepDS_DoubleMapNodeOfDoubleMapOfIntegerShape : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_DoubleMapNodeOfDoubleMapOfIntegerShape;
		%feature("autodoc", "	:param K1:
	:type K1: int &
	:param K2:
	:type K2: TopoDS_Shape &
	:param n1:
	:type n1: TCollection_MapNodePtr &
	:param n2:
	:type n2: TCollection_MapNodePtr &
	:rtype: None
") TopOpeBRepDS_DoubleMapNodeOfDoubleMapOfIntegerShape;
		 TopOpeBRepDS_DoubleMapNodeOfDoubleMapOfIntegerShape (const Standard_Integer & K1,const TopoDS_Shape & K2,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey1() {
                return (Standard_Integer) $self->Key1();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey1(Standard_Integer value ) {
                $self->Key1()=value;
                }
            };
            		%feature("compactdefaultargs") Key2;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key2;
		TopoDS_Shape  Key2 ();
		%feature("compactdefaultargs") Next2;
		%feature("autodoc", "	:rtype: TCollection_MapNodePtr
") Next2;
		TCollection_MapNodePtr & Next2 ();
};


%extend TopOpeBRepDS_DoubleMapNodeOfDoubleMapOfIntegerShape {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopOpeBRepDS_DoubleMapNodeOfDoubleMapOfIntegerShape(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopOpeBRepDS_DoubleMapNodeOfDoubleMapOfIntegerShape::Handle_TopOpeBRepDS_DoubleMapNodeOfDoubleMapOfIntegerShape %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TopOpeBRepDS_DoubleMapNodeOfDoubleMapOfIntegerShape;
class Handle_TopOpeBRepDS_DoubleMapNodeOfDoubleMapOfIntegerShape : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TopOpeBRepDS_DoubleMapNodeOfDoubleMapOfIntegerShape();
        Handle_TopOpeBRepDS_DoubleMapNodeOfDoubleMapOfIntegerShape(const Handle_TopOpeBRepDS_DoubleMapNodeOfDoubleMapOfIntegerShape &aHandle);
        Handle_TopOpeBRepDS_DoubleMapNodeOfDoubleMapOfIntegerShape(const TopOpeBRepDS_DoubleMapNodeOfDoubleMapOfIntegerShape *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopOpeBRepDS_DoubleMapNodeOfDoubleMapOfIntegerShape DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopOpeBRepDS_DoubleMapNodeOfDoubleMapOfIntegerShape {
    TopOpeBRepDS_DoubleMapNodeOfDoubleMapOfIntegerShape* _get_reference() {
    return (TopOpeBRepDS_DoubleMapNodeOfDoubleMapOfIntegerShape*)$self->Access();
    }
};

%extend Handle_TopOpeBRepDS_DoubleMapNodeOfDoubleMapOfIntegerShape {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopOpeBRepDS_DoubleMapNodeOfDoubleMapOfIntegerShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_DoubleMapOfIntegerShape;
class TopOpeBRepDS_DoubleMapOfIntegerShape : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_DoubleMapOfIntegerShape;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TopOpeBRepDS_DoubleMapOfIntegerShape;
		 TopOpeBRepDS_DoubleMapOfIntegerShape (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepDS_DoubleMapOfIntegerShape &
	:rtype: TopOpeBRepDS_DoubleMapOfIntegerShape
") Assign;
		TopOpeBRepDS_DoubleMapOfIntegerShape & Assign (const TopOpeBRepDS_DoubleMapOfIntegerShape & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepDS_DoubleMapOfIntegerShape &
	:rtype: TopOpeBRepDS_DoubleMapOfIntegerShape
") operator =;
		TopOpeBRepDS_DoubleMapOfIntegerShape & operator = (const TopOpeBRepDS_DoubleMapOfIntegerShape & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K1:
	:type K1: int &
	:param K2:
	:type K2: TopoDS_Shape &
	:rtype: None
") Bind;
		void Bind (const Standard_Integer & K1,const TopoDS_Shape & K2);
		%feature("compactdefaultargs") AreBound;
		%feature("autodoc", "	:param K1:
	:type K1: int &
	:param K2:
	:type K2: TopoDS_Shape &
	:rtype: bool
") AreBound;
		Standard_Boolean AreBound (const Standard_Integer & K1,const TopoDS_Shape & K2);
		%feature("compactdefaultargs") IsBound1;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") IsBound1;
		Standard_Boolean IsBound1 (const Standard_Integer & K);
		%feature("compactdefaultargs") IsBound2;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") IsBound2;
		Standard_Boolean IsBound2 (const TopoDS_Shape & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: TopoDS_Shape
") Find1;
		const TopoDS_Shape  Find1 (const Standard_Integer & K);
		%feature("compactdefaultargs") Find2;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: int
") Find2;
		const Standard_Integer & Find2 (const TopoDS_Shape & K);
		%feature("compactdefaultargs") UnBind1;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") UnBind1;
		Standard_Boolean UnBind1 (const Standard_Integer & K);
		%feature("compactdefaultargs") UnBind2;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") UnBind2;
		Standard_Boolean UnBind2 (const TopoDS_Shape & K);
};


%extend TopOpeBRepDS_DoubleMapOfIntegerShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_Dumper;
class TopOpeBRepDS_Dumper {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_Dumper;
		%feature("autodoc", "	:param HDS:
	:type HDS: Handle_TopOpeBRepDS_HDataStructure &
	:rtype: None
") TopOpeBRepDS_Dumper;
		 TopOpeBRepDS_Dumper (const Handle_TopOpeBRepDS_HDataStructure & HDS);
		%feature("compactdefaultargs") PrintType;
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom_Curve &
	:param S:
	:type S: Standard_OStream &
	:rtype: Standard_OStream
") PrintType;
		static Standard_OStream & PrintType (const Handle_Geom_Curve & C,Standard_OStream & S);
		%feature("compactdefaultargs") PrintType;
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom2d_Curve &
	:param S:
	:type S: Standard_OStream &
	:rtype: Standard_OStream
") PrintType;
		static Standard_OStream & PrintType (const Handle_Geom2d_Curve & C,Standard_OStream & S);
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	:param OS:
	:type OS: Standard_OStream &
	:param fk: default value is Standard_False
	:type fk: bool
	:param ct: default value is Standard_True
	:type ct: bool
	:rtype: Standard_OStream
") Dump;
		Standard_OStream & Dump (Standard_OStream & OS,const Standard_Boolean fk = Standard_False,const Standard_Boolean ct = Standard_True);
		%feature("compactdefaultargs") DumpGeometry;
		%feature("autodoc", "	:param OS:
	:type OS: Standard_OStream &
	:param fk: default value is Standard_False
	:type fk: bool
	:param ct: default value is Standard_True
	:type ct: bool
	:rtype: Standard_OStream
") DumpGeometry;
		Standard_OStream & DumpGeometry (Standard_OStream & OS,const Standard_Boolean fk = Standard_False,const Standard_Boolean ct = Standard_True);
		%feature("compactdefaultargs") DumpGeometry;
		%feature("autodoc", "	:param K:
	:type K: TopOpeBRepDS_Kind
	:param OS:
	:type OS: Standard_OStream &
	:param fk: default value is Standard_False
	:type fk: bool
	:param ct: default value is Standard_True
	:type ct: bool
	:rtype: Standard_OStream
") DumpGeometry;
		Standard_OStream & DumpGeometry (const TopOpeBRepDS_Kind K,Standard_OStream & OS,const Standard_Boolean fk = Standard_False,const Standard_Boolean ct = Standard_True);
		%feature("compactdefaultargs") DumpGeometry;
		%feature("autodoc", "	:param K:
	:type K: TopOpeBRepDS_Kind
	:param I:
	:type I: int
	:param OS:
	:type OS: Standard_OStream &
	:param fk: default value is Standard_False
	:type fk: bool
	:param ct: default value is Standard_True
	:type ct: bool
	:rtype: Standard_OStream
") DumpGeometry;
		Standard_OStream & DumpGeometry (const TopOpeBRepDS_Kind K,const Standard_Integer I,Standard_OStream & OS,const Standard_Boolean fk = Standard_False,const Standard_Boolean ct = Standard_True);

        %feature("autodoc", "1");
        %extend{
            std::string DumpTopologyToString() {
            std::stringstream s;
            self->DumpTopology(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") DumpTopology;
		%feature("autodoc", "	:param K:
	:type K: TopOpeBRepDS_Kind
	:param OS:
	:type OS: Standard_OStream &
	:rtype: Standard_OStream
") DumpTopology;
		Standard_OStream & DumpTopology (const TopOpeBRepDS_Kind K,Standard_OStream & OS);
		%feature("compactdefaultargs") DumpTopology;
		%feature("autodoc", "	:param T:
	:type T: TopAbs_ShapeEnum
	:param OS:
	:type OS: Standard_OStream &
	:rtype: Standard_OStream
") DumpTopology;
		Standard_OStream & DumpTopology (const TopAbs_ShapeEnum T,Standard_OStream & OS);
		%feature("compactdefaultargs") DumpTopology;
		%feature("autodoc", "	:param K:
	:type K: TopOpeBRepDS_Kind
	:param I:
	:type I: int
	:param OS:
	:type OS: Standard_OStream &
	:rtype: Standard_OStream
") DumpTopology;
		Standard_OStream & DumpTopology (const TopOpeBRepDS_Kind K,const Standard_Integer I,Standard_OStream & OS);
		%feature("compactdefaultargs") DumpTopology;
		%feature("autodoc", "	:param T:
	:type T: TopAbs_ShapeEnum
	:param I:
	:type I: int
	:param OS:
	:type OS: Standard_OStream &
	:rtype: Standard_OStream
") DumpTopology;
		Standard_OStream & DumpTopology (const TopAbs_ShapeEnum T,const Standard_Integer I,Standard_OStream & OS);
		%feature("compactdefaultargs") DumpSectionEdge;
		%feature("autodoc", "	:param K:
	:type K: TopOpeBRepDS_Kind
	:param OS:
	:type OS: Standard_OStream &
	:rtype: Standard_OStream
") DumpSectionEdge;
		Standard_OStream & DumpSectionEdge (const TopOpeBRepDS_Kind K,Standard_OStream & OS);
		%feature("compactdefaultargs") DumpSectionEdge;
		%feature("autodoc", "	:param K:
	:type K: TopOpeBRepDS_Kind
	:param I:
	:type I: int
	:param OS:
	:type OS: Standard_OStream &
	:rtype: Standard_OStream
") DumpSectionEdge;
		Standard_OStream & DumpSectionEdge (const TopOpeBRepDS_Kind K,const Standard_Integer I,Standard_OStream & OS);
		%feature("compactdefaultargs") SDumpRefOri;
		%feature("autodoc", "	:param K:
	:type K: TopOpeBRepDS_Kind
	:param I:
	:type I: int
	:rtype: TCollection_AsciiString
") SDumpRefOri;
		TCollection_AsciiString SDumpRefOri (const TopOpeBRepDS_Kind K,const Standard_Integer I);
		%feature("compactdefaultargs") SDumpRefOri;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: TCollection_AsciiString
") SDumpRefOri;
		TCollection_AsciiString SDumpRefOri (const TopoDS_Shape & S);
		%feature("compactdefaultargs") DumpRefOri;
		%feature("autodoc", "	:param K:
	:type K: TopOpeBRepDS_Kind
	:param I:
	:type I: int
	:param OS:
	:type OS: Standard_OStream &
	:rtype: Standard_OStream
") DumpRefOri;
		Standard_OStream & DumpRefOri (const TopOpeBRepDS_Kind K,const Standard_Integer I,Standard_OStream & OS);
		%feature("compactdefaultargs") DumpRefOri;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param OS:
	:type OS: Standard_OStream &
	:rtype: Standard_OStream
") DumpRefOri;
		Standard_OStream & DumpRefOri (const TopoDS_Shape & S,Standard_OStream & OS);
		%feature("compactdefaultargs") DumpLOI;
		%feature("autodoc", "	:param L:
	:type L: TopOpeBRepDS_ListOfInterference &
	:param O:
	:type O: Standard_OStream &
	:param s:
	:type s: TCollection_AsciiString &
	:rtype: Standard_OStream
") DumpLOI;
		Standard_OStream & DumpLOI (const TopOpeBRepDS_ListOfInterference & L,Standard_OStream & O,const TCollection_AsciiString & s);
		%feature("compactdefaultargs") DumpI;
		%feature("autodoc", "	:param I:
	:type I: Handle_TopOpeBRepDS_Interference &
	:param O:
	:type O: Standard_OStream &
	:param s1:
	:type s1: TCollection_AsciiString &
	:param s2:
	:type s2: TCollection_AsciiString &
	:rtype: Standard_OStream
") DumpI;
		Standard_OStream & DumpI (const Handle_TopOpeBRepDS_Interference & I,Standard_OStream & O,const TCollection_AsciiString & s1,const TCollection_AsciiString & s2);
		%feature("compactdefaultargs") SPrintShape;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: TCollection_AsciiString
") SPrintShape;
		TCollection_AsciiString SPrintShape (const Standard_Integer I);
		%feature("compactdefaultargs") SPrintShape;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: TCollection_AsciiString
") SPrintShape;
		TCollection_AsciiString SPrintShape (const TopoDS_Shape & S);
		%feature("compactdefaultargs") SPrintShapeRefOri;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param B: default value is ""
	:type B: TCollection_AsciiString &
	:rtype: TCollection_AsciiString
") SPrintShapeRefOri;
		TCollection_AsciiString SPrintShapeRefOri (const TopoDS_Shape & S,const TCollection_AsciiString & B = "");
		%feature("compactdefaultargs") SPrintShapeRefOri;
		%feature("autodoc", "	:param L:
	:type L: TopTools_ListOfShape &
	:param B: default value is ""
	:type B: TCollection_AsciiString &
	:rtype: TCollection_AsciiString
") SPrintShapeRefOri;
		TCollection_AsciiString SPrintShapeRefOri (const TopTools_ListOfShape & L,const TCollection_AsciiString & B = "");
};


%extend TopOpeBRepDS_Dumper {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_EIR;
class TopOpeBRepDS_EIR {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_EIR;
		%feature("autodoc", "	:param HDS:
	:type HDS: Handle_TopOpeBRepDS_HDataStructure &
	:rtype: None
") TopOpeBRepDS_EIR;
		 TopOpeBRepDS_EIR (const Handle_TopOpeBRepDS_HDataStructure & HDS);
		%feature("compactdefaultargs") ProcessEdgeInterferences;
		%feature("autodoc", "	:rtype: None
") ProcessEdgeInterferences;
		void ProcessEdgeInterferences ();
		%feature("compactdefaultargs") ProcessEdgeInterferences;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: None
") ProcessEdgeInterferences;
		void ProcessEdgeInterferences (const Standard_Integer I);
};


%extend TopOpeBRepDS_EIR {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_Edge3dInterferenceTool;
class TopOpeBRepDS_Edge3dInterferenceTool {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_Edge3dInterferenceTool;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepDS_Edge3dInterferenceTool;
		 TopOpeBRepDS_Edge3dInterferenceTool ();
		%feature("compactdefaultargs") InitPointVertex;
		%feature("autodoc", "	:param IsVertex:
	:type IsVertex: int
	:param VonOO:
	:type VonOO: TopoDS_Shape &
	:rtype: None
") InitPointVertex;
		void InitPointVertex (const Standard_Integer IsVertex,const TopoDS_Shape & VonOO);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param Eref:
	:type Eref: TopoDS_Shape &
	:param E:
	:type E: TopoDS_Shape &
	:param F:
	:type F: TopoDS_Shape &
	:param I:
	:type I: Handle_TopOpeBRepDS_Interference &
	:rtype: None
") Init;
		void Init (const TopoDS_Shape & Eref,const TopoDS_Shape & E,const TopoDS_Shape & F,const Handle_TopOpeBRepDS_Interference & I);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param Eref:
	:type Eref: TopoDS_Shape &
	:param E:
	:type E: TopoDS_Shape &
	:param F:
	:type F: TopoDS_Shape &
	:param I:
	:type I: Handle_TopOpeBRepDS_Interference &
	:rtype: None
") Add;
		void Add (const TopoDS_Shape & Eref,const TopoDS_Shape & E,const TopoDS_Shape & F,const Handle_TopOpeBRepDS_Interference & I);
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", "	:param I:
	:type I: Handle_TopOpeBRepDS_Interference &
	:rtype: None
") Transition;
		void Transition (const Handle_TopOpeBRepDS_Interference & I);
};


%extend TopOpeBRepDS_Edge3dInterferenceTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_EdgeInterferenceTool;
class TopOpeBRepDS_EdgeInterferenceTool {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_EdgeInterferenceTool;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepDS_EdgeInterferenceTool;
		 TopOpeBRepDS_EdgeInterferenceTool ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Shape &
	:param I:
	:type I: Handle_TopOpeBRepDS_Interference &
	:rtype: None
") Init;
		void Init (const TopoDS_Shape & E,const Handle_TopOpeBRepDS_Interference & I);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Shape &
	:param V:
	:type V: TopoDS_Shape &
	:param I:
	:type I: Handle_TopOpeBRepDS_Interference &
	:rtype: None
") Add;
		void Add (const TopoDS_Shape & E,const TopoDS_Shape & V,const Handle_TopOpeBRepDS_Interference & I);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Shape &
	:param P:
	:type P: TopOpeBRepDS_Point &
	:param I:
	:type I: Handle_TopOpeBRepDS_Interference &
	:rtype: None
") Add;
		void Add (const TopoDS_Shape & E,const TopOpeBRepDS_Point & P,const Handle_TopOpeBRepDS_Interference & I);
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", "	:param I:
	:type I: Handle_TopOpeBRepDS_Interference &
	:rtype: None
") Transition;
		void Transition (const Handle_TopOpeBRepDS_Interference & I);
};


%extend TopOpeBRepDS_EdgeInterferenceTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_Explorer;
class TopOpeBRepDS_Explorer {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_Explorer;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepDS_Explorer;
		 TopOpeBRepDS_Explorer ();
		%feature("compactdefaultargs") TopOpeBRepDS_Explorer;
		%feature("autodoc", "	:param HDS:
	:type HDS: Handle_TopOpeBRepDS_HDataStructure &
	:param T: default value is TopAbs_SHAPE
	:type T: TopAbs_ShapeEnum
	:param findkeep: default value is Standard_True
	:type findkeep: bool
	:rtype: None
") TopOpeBRepDS_Explorer;
		 TopOpeBRepDS_Explorer (const Handle_TopOpeBRepDS_HDataStructure & HDS,const TopAbs_ShapeEnum T = TopAbs_SHAPE,const Standard_Boolean findkeep = Standard_True);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param HDS:
	:type HDS: Handle_TopOpeBRepDS_HDataStructure &
	:param T: default value is TopAbs_SHAPE
	:type T: TopAbs_ShapeEnum
	:param findkeep: default value is Standard_True
	:type findkeep: bool
	:rtype: None
") Init;
		void Init (const Handle_TopOpeBRepDS_HDataStructure & HDS,const TopAbs_ShapeEnum T = TopAbs_SHAPE,const Standard_Boolean findkeep = Standard_True);
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	:rtype: TopAbs_ShapeEnum
") Type;
		TopAbs_ShapeEnum Type ();
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Current;
		const TopoDS_Shape  Current ();
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "	:rtype: int
") Index;
		Standard_Integer Index ();
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "	:rtype: TopoDS_Face
") Face;
		const TopoDS_Face  Face ();
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "	:rtype: TopoDS_Edge
") Edge;
		const TopoDS_Edge  Edge ();
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "	:rtype: TopoDS_Vertex
") Vertex;
		const TopoDS_Vertex  Vertex ();
};


%extend TopOpeBRepDS_Explorer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_FIR;
class TopOpeBRepDS_FIR {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_FIR;
		%feature("autodoc", "	:param HDS:
	:type HDS: Handle_TopOpeBRepDS_HDataStructure &
	:rtype: None
") TopOpeBRepDS_FIR;
		 TopOpeBRepDS_FIR (const Handle_TopOpeBRepDS_HDataStructure & HDS);
		%feature("compactdefaultargs") ProcessFaceInterferences;
		%feature("autodoc", "	:param M:
	:type M: TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State &
	:rtype: None
") ProcessFaceInterferences;
		void ProcessFaceInterferences (const TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State & M);
		%feature("compactdefaultargs") ProcessFaceInterferences;
		%feature("autodoc", "	:param I:
	:type I: int
	:param M:
	:type M: TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State &
	:rtype: None
") ProcessFaceInterferences;
		void ProcessFaceInterferences (const Standard_Integer I,const TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State & M);
};


%extend TopOpeBRepDS_FIR {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_FaceInterferenceTool;
class TopOpeBRepDS_FaceInterferenceTool {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_FaceInterferenceTool;
		%feature("autodoc", "	:param P:
	:type P: TopOpeBRepDS_PDataStructure &
	:rtype: None
") TopOpeBRepDS_FaceInterferenceTool;
		 TopOpeBRepDS_FaceInterferenceTool (const TopOpeBRepDS_PDataStructure & P);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Eisnew = true if E is a new edge built on edge I->Geometry() false if E is shape <=> I->Geometry()

	:param FI:
	:type FI: TopoDS_Shape &
	:param E:
	:type E: TopoDS_Shape &
	:param Eisnew:
	:type Eisnew: bool
	:param I:
	:type I: Handle_TopOpeBRepDS_Interference &
	:rtype: None
") Init;
		void Init (const TopoDS_Shape & FI,const TopoDS_Shape & E,const Standard_Boolean Eisnew,const Handle_TopOpeBRepDS_Interference & I);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Eisnew = true if E is a new edge built on edge I->Geometry() false if E is shape <=> I->Geometry()

	:param FI:
	:type FI: TopoDS_Shape &
	:param F:
	:type F: TopoDS_Shape &
	:param E:
	:type E: TopoDS_Shape &
	:param Eisnew:
	:type Eisnew: bool
	:param I:
	:type I: Handle_TopOpeBRepDS_Interference &
	:rtype: None
") Add;
		void Add (const TopoDS_Shape & FI,const TopoDS_Shape & F,const TopoDS_Shape & E,const Standard_Boolean Eisnew,const Handle_TopOpeBRepDS_Interference & I);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Shape &
	:param C:
	:type C: TopOpeBRepDS_Curve &
	:param I:
	:type I: Handle_TopOpeBRepDS_Interference &
	:rtype: None
") Add;
		void Add (const TopoDS_Shape & E,const TopOpeBRepDS_Curve & C,const Handle_TopOpeBRepDS_Interference & I);
		%feature("compactdefaultargs") SetEdgePntPar;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param par:
	:type par: float
	:rtype: None
") SetEdgePntPar;
		void SetEdgePntPar (const gp_Pnt & P,const Standard_Real par);
		%feature("compactdefaultargs") GetEdgePntPar;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param par:
	:type par: float &
	:rtype: None
") GetEdgePntPar;
		void GetEdgePntPar (gp_Pnt & P,Standard_Real &OutValue);
		%feature("compactdefaultargs") IsEdgePntParDef;
		%feature("autodoc", "	:rtype: bool
") IsEdgePntParDef;
		Standard_Boolean IsEdgePntParDef ();
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", "	:param I:
	:type I: Handle_TopOpeBRepDS_Interference &
	:rtype: None
") Transition;
		void Transition (const Handle_TopOpeBRepDS_Interference & I);
};


%extend TopOpeBRepDS_FaceInterferenceTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_Filter;
class TopOpeBRepDS_Filter {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_Filter;
		%feature("autodoc", "	:param HDS:
	:type HDS: Handle_TopOpeBRepDS_HDataStructure &
	:param pClassif: default value is 0
	:type pClassif: TopOpeBRepTool_PShapeClassifier &
	:rtype: None
") TopOpeBRepDS_Filter;
		 TopOpeBRepDS_Filter (const Handle_TopOpeBRepDS_HDataStructure & HDS,const TopOpeBRepTool_PShapeClassifier & pClassif = 0);
		%feature("compactdefaultargs") ProcessInterferences;
		%feature("autodoc", "	:rtype: None
") ProcessInterferences;
		void ProcessInterferences ();
		%feature("compactdefaultargs") ProcessFaceInterferences;
		%feature("autodoc", "	:param MEsp:
	:type MEsp: TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State &
	:rtype: None
") ProcessFaceInterferences;
		void ProcessFaceInterferences (const TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State & MEsp);
		%feature("compactdefaultargs") ProcessFaceInterferences;
		%feature("autodoc", "	:param I:
	:type I: int
	:param MEsp:
	:type MEsp: TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State &
	:rtype: None
") ProcessFaceInterferences;
		void ProcessFaceInterferences (const Standard_Integer I,const TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State & MEsp);
		%feature("compactdefaultargs") ProcessEdgeInterferences;
		%feature("autodoc", "	:rtype: None
") ProcessEdgeInterferences;
		void ProcessEdgeInterferences ();
		%feature("compactdefaultargs") ProcessEdgeInterferences;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: None
") ProcessEdgeInterferences;
		void ProcessEdgeInterferences (const Standard_Integer I);
		%feature("compactdefaultargs") ProcessCurveInterferences;
		%feature("autodoc", "	:rtype: None
") ProcessCurveInterferences;
		void ProcessCurveInterferences ();
		%feature("compactdefaultargs") ProcessCurveInterferences;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: None
") ProcessCurveInterferences;
		void ProcessCurveInterferences (const Standard_Integer I);
};


%extend TopOpeBRepDS_Filter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_GapFiller;
class TopOpeBRepDS_GapFiller {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_GapFiller;
		%feature("autodoc", "	:param HDS:
	:type HDS: Handle_TopOpeBRepDS_HDataStructure &
	:rtype: None
") TopOpeBRepDS_GapFiller;
		 TopOpeBRepDS_GapFiller (const Handle_TopOpeBRepDS_HDataStructure & HDS);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:rtype: None
") Perform;
		void Perform ();
		%feature("compactdefaultargs") FindAssociatedPoints;
		%feature("autodoc", "	* Recherche parmi l'ensemble des points d'Interference la Liste <LI> des points qui correspondent au point d'indice <Index>

	:param I:
	:type I: Handle_TopOpeBRepDS_Interference &
	:param LI:
	:type LI: TopOpeBRepDS_ListOfInterference &
	:rtype: None
") FindAssociatedPoints;
		void FindAssociatedPoints (const Handle_TopOpeBRepDS_Interference & I,TopOpeBRepDS_ListOfInterference & LI);
		%feature("compactdefaultargs") CheckConnexity;
		%feature("autodoc", "	* Enchaine les sections via les points d'Interferences deja associe; Renvoit dans <L> les points extremites des Lignes. Methodes pour construire la liste des Points qui peuvent correspondre a une Point donne.

	:param LI:
	:type LI: TopOpeBRepDS_ListOfInterference &
	:rtype: bool
") CheckConnexity;
		Standard_Boolean CheckConnexity (TopOpeBRepDS_ListOfInterference & LI);
		%feature("compactdefaultargs") AddPointsOnShape;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param LI:
	:type LI: TopOpeBRepDS_ListOfInterference &
	:rtype: None
") AddPointsOnShape;
		void AddPointsOnShape (const TopoDS_Shape & S,TopOpeBRepDS_ListOfInterference & LI);
		%feature("compactdefaultargs") AddPointsOnConnexShape;
		%feature("autodoc", "	* Methodes pour reduire la liste des Points qui peuvent correspondre a une Point donne.

	:param F:
	:type F: TopoDS_Shape &
	:param LI:
	:type LI: TopOpeBRepDS_ListOfInterference &
	:rtype: None
") AddPointsOnConnexShape;
		void AddPointsOnConnexShape (const TopoDS_Shape & F,const TopOpeBRepDS_ListOfInterference & LI);
		%feature("compactdefaultargs") FilterByFace;
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:param LI:
	:type LI: TopOpeBRepDS_ListOfInterference &
	:rtype: None
") FilterByFace;
		void FilterByFace (const TopoDS_Face & F,TopOpeBRepDS_ListOfInterference & LI);
		%feature("compactdefaultargs") FilterByEdge;
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Edge &
	:param LI:
	:type LI: TopOpeBRepDS_ListOfInterference &
	:rtype: None
") FilterByEdge;
		void FilterByEdge (const TopoDS_Edge & E,TopOpeBRepDS_ListOfInterference & LI);
		%feature("compactdefaultargs") FilterByIncidentDistance;
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:param I:
	:type I: Handle_TopOpeBRepDS_Interference &
	:param LI:
	:type LI: TopOpeBRepDS_ListOfInterference &
	:rtype: None
") FilterByIncidentDistance;
		void FilterByIncidentDistance (const TopoDS_Face & F,const Handle_TopOpeBRepDS_Interference & I,TopOpeBRepDS_ListOfInterference & LI);
		%feature("compactdefaultargs") IsOnFace;
		%feature("autodoc", "	* Return True si I a ete obtenu par une intersection avec <F>.

	:param I:
	:type I: Handle_TopOpeBRepDS_Interference &
	:param F:
	:type F: TopoDS_Face &
	:rtype: bool
") IsOnFace;
		Standard_Boolean IsOnFace (const Handle_TopOpeBRepDS_Interference & I,const TopoDS_Face & F);
		%feature("compactdefaultargs") IsOnEdge;
		%feature("autodoc", "	* Return True si I ou une de ses representaions a pour support <E>. Methodes de reconstructions des geometries des point et des courbes de section

	:param I:
	:type I: Handle_TopOpeBRepDS_Interference &
	:param E:
	:type E: TopoDS_Edge &
	:rtype: bool
") IsOnEdge;
		Standard_Boolean IsOnEdge (const Handle_TopOpeBRepDS_Interference & I,const TopoDS_Edge & E);
		%feature("compactdefaultargs") BuildNewGeometries;
		%feature("autodoc", "	:rtype: None
") BuildNewGeometries;
		void BuildNewGeometries ();
		%feature("compactdefaultargs") ReBuildGeom;
		%feature("autodoc", "	:param I1:
	:type I1: Handle_TopOpeBRepDS_Interference &
	:param Done:
	:type Done: TColStd_MapOfInteger &
	:rtype: None
") ReBuildGeom;
		void ReBuildGeom (const Handle_TopOpeBRepDS_Interference & I1,TColStd_MapOfInteger & Done);
};


%extend TopOpeBRepDS_GapFiller {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_GapTool;
class TopOpeBRepDS_GapTool : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_GapTool;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepDS_GapTool;
		 TopOpeBRepDS_GapTool ();
		%feature("compactdefaultargs") TopOpeBRepDS_GapTool;
		%feature("autodoc", "	:param HDS:
	:type HDS: Handle_TopOpeBRepDS_HDataStructure &
	:rtype: None
") TopOpeBRepDS_GapTool;
		 TopOpeBRepDS_GapTool (const Handle_TopOpeBRepDS_HDataStructure & HDS);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param HDS:
	:type HDS: Handle_TopOpeBRepDS_HDataStructure &
	:rtype: None
") Init;
		void Init (const Handle_TopOpeBRepDS_HDataStructure & HDS);
		%feature("compactdefaultargs") Interferences;
		%feature("autodoc", "	:param IndexPoint:
	:type IndexPoint: int
	:rtype: TopOpeBRepDS_ListOfInterference
") Interferences;
		const TopOpeBRepDS_ListOfInterference & Interferences (const Standard_Integer IndexPoint);
		%feature("compactdefaultargs") SameInterferences;
		%feature("autodoc", "	:param I:
	:type I: Handle_TopOpeBRepDS_Interference &
	:rtype: TopOpeBRepDS_ListOfInterference
") SameInterferences;
		const TopOpeBRepDS_ListOfInterference & SameInterferences (const Handle_TopOpeBRepDS_Interference & I);
		%feature("compactdefaultargs") ChangeSameInterferences;
		%feature("autodoc", "	:param I:
	:type I: Handle_TopOpeBRepDS_Interference &
	:rtype: TopOpeBRepDS_ListOfInterference
") ChangeSameInterferences;
		TopOpeBRepDS_ListOfInterference & ChangeSameInterferences (const Handle_TopOpeBRepDS_Interference & I);
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "	:param I:
	:type I: Handle_TopOpeBRepDS_Interference &
	:param C:
	:type C: TopOpeBRepDS_Curve &
	:rtype: bool
") Curve;
		Standard_Boolean Curve (const Handle_TopOpeBRepDS_Interference & I,TopOpeBRepDS_Curve & C);
		%feature("compactdefaultargs") EdgeSupport;
		%feature("autodoc", "	:param I:
	:type I: Handle_TopOpeBRepDS_Interference &
	:param E:
	:type E: TopoDS_Shape &
	:rtype: bool
") EdgeSupport;
		Standard_Boolean EdgeSupport (const Handle_TopOpeBRepDS_Interference & I,TopoDS_Shape & E);
		%feature("compactdefaultargs") FacesSupport;
		%feature("autodoc", "	* Return les faces qui ont genere la section origine de I

	:param I:
	:type I: Handle_TopOpeBRepDS_Interference &
	:param F1:
	:type F1: TopoDS_Shape &
	:param F2:
	:type F2: TopoDS_Shape &
	:rtype: bool
") FacesSupport;
		Standard_Boolean FacesSupport (const Handle_TopOpeBRepDS_Interference & I,TopoDS_Shape & F1,TopoDS_Shape & F2);
		%feature("compactdefaultargs") ParameterOnEdge;
		%feature("autodoc", "	:param I:
	:type I: Handle_TopOpeBRepDS_Interference &
	:param E:
	:type E: TopoDS_Shape &
	:param U:
	:type U: float &
	:rtype: bool
") ParameterOnEdge;
		Standard_Boolean ParameterOnEdge (const Handle_TopOpeBRepDS_Interference & I,const TopoDS_Shape & E,Standard_Real &OutValue);
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "	:param I:
	:type I: Handle_TopOpeBRepDS_Interference &
	:param IndexPoint:
	:type IndexPoint: int
	:rtype: None
") SetPoint;
		void SetPoint (const Handle_TopOpeBRepDS_Interference & I,const Standard_Integer IndexPoint);
		%feature("compactdefaultargs") SetParameterOnEdge;
		%feature("autodoc", "	:param I:
	:type I: Handle_TopOpeBRepDS_Interference &
	:param E:
	:type E: TopoDS_Shape &
	:param U:
	:type U: float
	:rtype: None
") SetParameterOnEdge;
		void SetParameterOnEdge (const Handle_TopOpeBRepDS_Interference & I,const TopoDS_Shape & E,const Standard_Real U);
};


%extend TopOpeBRepDS_GapTool {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopOpeBRepDS_GapTool(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopOpeBRepDS_GapTool::Handle_TopOpeBRepDS_GapTool %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TopOpeBRepDS_GapTool;
class Handle_TopOpeBRepDS_GapTool : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TopOpeBRepDS_GapTool();
        Handle_TopOpeBRepDS_GapTool(const Handle_TopOpeBRepDS_GapTool &aHandle);
        Handle_TopOpeBRepDS_GapTool(const TopOpeBRepDS_GapTool *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopOpeBRepDS_GapTool DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopOpeBRepDS_GapTool {
    TopOpeBRepDS_GapTool* _get_reference() {
    return (TopOpeBRepDS_GapTool*)$self->Access();
    }
};

%extend Handle_TopOpeBRepDS_GapTool {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopOpeBRepDS_GapTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_GeometryData;
class TopOpeBRepDS_GeometryData {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_GeometryData;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepDS_GeometryData;
		 TopOpeBRepDS_GeometryData ();
		%feature("compactdefaultargs") TopOpeBRepDS_GeometryData;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepDS_GeometryData &
	:rtype: None
") TopOpeBRepDS_GeometryData;
		 TopOpeBRepDS_GeometryData (const TopOpeBRepDS_GeometryData & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepDS_GeometryData &
	:rtype: None
") Assign;
		void Assign (const TopOpeBRepDS_GeometryData & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepDS_GeometryData &
	:rtype: None
") operator =;
		void operator = (const TopOpeBRepDS_GeometryData & Other);
		%feature("compactdefaultargs") Interferences;
		%feature("autodoc", "	:rtype: TopOpeBRepDS_ListOfInterference
") Interferences;
		const TopOpeBRepDS_ListOfInterference & Interferences ();
		%feature("compactdefaultargs") ChangeInterferences;
		%feature("autodoc", "	:rtype: TopOpeBRepDS_ListOfInterference
") ChangeInterferences;
		TopOpeBRepDS_ListOfInterference & ChangeInterferences ();
		%feature("compactdefaultargs") AddInterference;
		%feature("autodoc", "	:param I:
	:type I: Handle_TopOpeBRepDS_Interference &
	:rtype: None
") AddInterference;
		void AddInterference (const Handle_TopOpeBRepDS_Interference & I);
};


%extend TopOpeBRepDS_GeometryData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_HArray1OfDataMapOfIntegerListOfInterference;
class TopOpeBRepDS_HArray1OfDataMapOfIntegerListOfInterference : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_HArray1OfDataMapOfIntegerListOfInterference;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TopOpeBRepDS_HArray1OfDataMapOfIntegerListOfInterference;
		 TopOpeBRepDS_HArray1OfDataMapOfIntegerListOfInterference (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TopOpeBRepDS_HArray1OfDataMapOfIntegerListOfInterference;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: TopOpeBRepDS_DataMapOfIntegerListOfInterference &
	:rtype: None
") TopOpeBRepDS_HArray1OfDataMapOfIntegerListOfInterference;
		 TopOpeBRepDS_HArray1OfDataMapOfIntegerListOfInterference (const Standard_Integer Low,const Standard_Integer Up,const TopOpeBRepDS_DataMapOfIntegerListOfInterference & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: TopOpeBRepDS_DataMapOfIntegerListOfInterference &
	:rtype: None
") Init;
		void Init (const TopOpeBRepDS_DataMapOfIntegerListOfInterference & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: TopOpeBRepDS_DataMapOfIntegerListOfInterference &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const TopOpeBRepDS_DataMapOfIntegerListOfInterference & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: TopOpeBRepDS_DataMapOfIntegerListOfInterference
") Value;
		const TopOpeBRepDS_DataMapOfIntegerListOfInterference & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: TopOpeBRepDS_DataMapOfIntegerListOfInterference
") ChangeValue;
		TopOpeBRepDS_DataMapOfIntegerListOfInterference & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: TopOpeBRepDS_Array1OfDataMapOfIntegerListOfInterference
") Array1;
		const TopOpeBRepDS_Array1OfDataMapOfIntegerListOfInterference & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: TopOpeBRepDS_Array1OfDataMapOfIntegerListOfInterference
") ChangeArray1;
		TopOpeBRepDS_Array1OfDataMapOfIntegerListOfInterference & ChangeArray1 ();
};


%extend TopOpeBRepDS_HArray1OfDataMapOfIntegerListOfInterference {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopOpeBRepDS_HArray1OfDataMapOfIntegerListOfInterference(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopOpeBRepDS_HArray1OfDataMapOfIntegerListOfInterference::Handle_TopOpeBRepDS_HArray1OfDataMapOfIntegerListOfInterference %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TopOpeBRepDS_HArray1OfDataMapOfIntegerListOfInterference;
class Handle_TopOpeBRepDS_HArray1OfDataMapOfIntegerListOfInterference : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TopOpeBRepDS_HArray1OfDataMapOfIntegerListOfInterference();
        Handle_TopOpeBRepDS_HArray1OfDataMapOfIntegerListOfInterference(const Handle_TopOpeBRepDS_HArray1OfDataMapOfIntegerListOfInterference &aHandle);
        Handle_TopOpeBRepDS_HArray1OfDataMapOfIntegerListOfInterference(const TopOpeBRepDS_HArray1OfDataMapOfIntegerListOfInterference *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopOpeBRepDS_HArray1OfDataMapOfIntegerListOfInterference DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopOpeBRepDS_HArray1OfDataMapOfIntegerListOfInterference {
    TopOpeBRepDS_HArray1OfDataMapOfIntegerListOfInterference* _get_reference() {
    return (TopOpeBRepDS_HArray1OfDataMapOfIntegerListOfInterference*)$self->Access();
    }
};

%extend Handle_TopOpeBRepDS_HArray1OfDataMapOfIntegerListOfInterference {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopOpeBRepDS_HArray1OfDataMapOfIntegerListOfInterference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfShapeWithState;
class TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfShapeWithState : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfShapeWithState;
		%feature("autodoc", "	:param K1:
	:type K1: TopoDS_Shape &
	:param K2:
	:type K2: int
	:param I:
	:type I: TopOpeBRepDS_ShapeWithState &
	:param n1:
	:type n1: TCollection_MapNodePtr &
	:param n2:
	:type n2: TCollection_MapNodePtr &
	:rtype: None
") TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfShapeWithState;
		 TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfShapeWithState (const TopoDS_Shape & K1,const Standard_Integer K2,const TopOpeBRepDS_ShapeWithState & I,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("compactdefaultargs") Key1;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key1;
		TopoDS_Shape  Key1 ();

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey2() {
                return (Standard_Integer) $self->Key2();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey2(Standard_Integer value ) {
                $self->Key2()=value;
                }
            };
            		%feature("compactdefaultargs") Next2;
		%feature("autodoc", "	:rtype: TCollection_MapNodePtr
") Next2;
		TCollection_MapNodePtr & Next2 ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopOpeBRepDS_ShapeWithState
") Value;
		TopOpeBRepDS_ShapeWithState & Value ();
};


%extend TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfShapeWithState {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfShapeWithState(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfShapeWithState::Handle_TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfShapeWithState %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfShapeWithState;
class Handle_TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfShapeWithState : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfShapeWithState();
        Handle_TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfShapeWithState(const Handle_TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfShapeWithState &aHandle);
        Handle_TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfShapeWithState(const TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfShapeWithState *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfShapeWithState DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfShapeWithState {
    TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfShapeWithState* _get_reference() {
    return (TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfShapeWithState*)$self->Access();
    }
};

%extend Handle_TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfShapeWithState {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfShapeWithState {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfVertexPoint;
class TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfVertexPoint : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfVertexPoint;
		%feature("autodoc", "	:param K1:
	:type K1: TopoDS_Shape &
	:param K2:
	:type K2: int
	:param I:
	:type I: TopOpeBRepDS_Point &
	:param n1:
	:type n1: TCollection_MapNodePtr &
	:param n2:
	:type n2: TCollection_MapNodePtr &
	:rtype: None
") TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfVertexPoint;
		 TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfVertexPoint (const TopoDS_Shape & K1,const Standard_Integer K2,const TopOpeBRepDS_Point & I,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("compactdefaultargs") Key1;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key1;
		TopoDS_Shape  Key1 ();

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey2() {
                return (Standard_Integer) $self->Key2();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey2(Standard_Integer value ) {
                $self->Key2()=value;
                }
            };
            		%feature("compactdefaultargs") Next2;
		%feature("autodoc", "	:rtype: TCollection_MapNodePtr
") Next2;
		TCollection_MapNodePtr & Next2 ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopOpeBRepDS_Point
") Value;
		TopOpeBRepDS_Point & Value ();
};


%extend TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfVertexPoint {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfVertexPoint(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfVertexPoint::Handle_TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfVertexPoint %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfVertexPoint;
class Handle_TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfVertexPoint : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfVertexPoint();
        Handle_TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfVertexPoint(const Handle_TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfVertexPoint &aHandle);
        Handle_TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfVertexPoint(const TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfVertexPoint *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfVertexPoint DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfVertexPoint {
    TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfVertexPoint* _get_reference() {
    return (TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfVertexPoint*)$self->Access();
    }
};

%extend Handle_TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfVertexPoint {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfVertexPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_IndexedDataMapNodeOfMapOfShapeData;
class TopOpeBRepDS_IndexedDataMapNodeOfMapOfShapeData : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_IndexedDataMapNodeOfMapOfShapeData;
		%feature("autodoc", "	:param K1:
	:type K1: TopoDS_Shape &
	:param K2:
	:type K2: int
	:param I:
	:type I: TopOpeBRepDS_ShapeData &
	:param n1:
	:type n1: TCollection_MapNodePtr &
	:param n2:
	:type n2: TCollection_MapNodePtr &
	:rtype: None
") TopOpeBRepDS_IndexedDataMapNodeOfMapOfShapeData;
		 TopOpeBRepDS_IndexedDataMapNodeOfMapOfShapeData (const TopoDS_Shape & K1,const Standard_Integer K2,const TopOpeBRepDS_ShapeData & I,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("compactdefaultargs") Key1;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key1;
		TopoDS_Shape  Key1 ();

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey2() {
                return (Standard_Integer) $self->Key2();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey2(Standard_Integer value ) {
                $self->Key2()=value;
                }
            };
            		%feature("compactdefaultargs") Next2;
		%feature("autodoc", "	:rtype: TCollection_MapNodePtr
") Next2;
		TCollection_MapNodePtr & Next2 ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopOpeBRepDS_ShapeData
") Value;
		TopOpeBRepDS_ShapeData & Value ();
};


%extend TopOpeBRepDS_IndexedDataMapNodeOfMapOfShapeData {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopOpeBRepDS_IndexedDataMapNodeOfMapOfShapeData(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopOpeBRepDS_IndexedDataMapNodeOfMapOfShapeData::Handle_TopOpeBRepDS_IndexedDataMapNodeOfMapOfShapeData %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TopOpeBRepDS_IndexedDataMapNodeOfMapOfShapeData;
class Handle_TopOpeBRepDS_IndexedDataMapNodeOfMapOfShapeData : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TopOpeBRepDS_IndexedDataMapNodeOfMapOfShapeData();
        Handle_TopOpeBRepDS_IndexedDataMapNodeOfMapOfShapeData(const Handle_TopOpeBRepDS_IndexedDataMapNodeOfMapOfShapeData &aHandle);
        Handle_TopOpeBRepDS_IndexedDataMapNodeOfMapOfShapeData(const TopOpeBRepDS_IndexedDataMapNodeOfMapOfShapeData *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopOpeBRepDS_IndexedDataMapNodeOfMapOfShapeData DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopOpeBRepDS_IndexedDataMapNodeOfMapOfShapeData {
    TopOpeBRepDS_IndexedDataMapNodeOfMapOfShapeData* _get_reference() {
    return (TopOpeBRepDS_IndexedDataMapNodeOfMapOfShapeData*)$self->Access();
    }
};

%extend Handle_TopOpeBRepDS_IndexedDataMapNodeOfMapOfShapeData {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopOpeBRepDS_IndexedDataMapNodeOfMapOfShapeData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_IndexedDataMapOfShapeWithState;
class TopOpeBRepDS_IndexedDataMapOfShapeWithState : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_IndexedDataMapOfShapeWithState;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TopOpeBRepDS_IndexedDataMapOfShapeWithState;
		 TopOpeBRepDS_IndexedDataMapOfShapeWithState (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepDS_IndexedDataMapOfShapeWithState &
	:rtype: TopOpeBRepDS_IndexedDataMapOfShapeWithState
") Assign;
		TopOpeBRepDS_IndexedDataMapOfShapeWithState & Assign (const TopOpeBRepDS_IndexedDataMapOfShapeWithState & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepDS_IndexedDataMapOfShapeWithState &
	:rtype: TopOpeBRepDS_IndexedDataMapOfShapeWithState
") operator =;
		TopOpeBRepDS_IndexedDataMapOfShapeWithState & operator = (const TopOpeBRepDS_IndexedDataMapOfShapeWithState & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: TopOpeBRepDS_ShapeWithState &
	:rtype: int
") Add;
		Standard_Integer Add (const TopoDS_Shape & K,const TopOpeBRepDS_ShapeWithState & I);
		%feature("compactdefaultargs") Substitute;
		%feature("autodoc", "	:param I:
	:type I: int
	:param K:
	:type K: TopoDS_Shape &
	:param T:
	:type T: TopOpeBRepDS_ShapeWithState &
	:rtype: None
") Substitute;
		void Substitute (const Standard_Integer I,const TopoDS_Shape & K,const TopOpeBRepDS_ShapeWithState & T);
		%feature("compactdefaultargs") RemoveLast;
		%feature("autodoc", "	:rtype: None
") RemoveLast;
		void RemoveLast ();
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const TopoDS_Shape & K);
		%feature("compactdefaultargs") FindKey;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: TopoDS_Shape
") FindKey;
		const TopoDS_Shape  FindKey (const Standard_Integer I);
		%feature("compactdefaultargs") FindFromIndex;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: TopOpeBRepDS_ShapeWithState
") FindFromIndex;
		const TopOpeBRepDS_ShapeWithState & FindFromIndex (const Standard_Integer I);
		%feature("compactdefaultargs") ChangeFromIndex;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: TopOpeBRepDS_ShapeWithState
") ChangeFromIndex;
		TopOpeBRepDS_ShapeWithState & ChangeFromIndex (const Standard_Integer I);
		%feature("compactdefaultargs") FindIndex;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: int
") FindIndex;
		Standard_Integer FindIndex (const TopoDS_Shape & K);
		%feature("compactdefaultargs") FindFromKey;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TopOpeBRepDS_ShapeWithState
") FindFromKey;
		const TopOpeBRepDS_ShapeWithState & FindFromKey (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFromKey;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TopOpeBRepDS_ShapeWithState
") ChangeFromKey;
		TopOpeBRepDS_ShapeWithState & ChangeFromKey (const TopoDS_Shape & K);
		%feature("compactdefaultargs") FindFromKey1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") FindFromKey1;
		Standard_Address FindFromKey1 (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFromKey1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") ChangeFromKey1;
		Standard_Address ChangeFromKey1 (const TopoDS_Shape & K);
};


%extend TopOpeBRepDS_IndexedDataMapOfShapeWithState {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_IndexedDataMapOfVertexPoint;
class TopOpeBRepDS_IndexedDataMapOfVertexPoint : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_IndexedDataMapOfVertexPoint;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TopOpeBRepDS_IndexedDataMapOfVertexPoint;
		 TopOpeBRepDS_IndexedDataMapOfVertexPoint (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepDS_IndexedDataMapOfVertexPoint &
	:rtype: TopOpeBRepDS_IndexedDataMapOfVertexPoint
") Assign;
		TopOpeBRepDS_IndexedDataMapOfVertexPoint & Assign (const TopOpeBRepDS_IndexedDataMapOfVertexPoint & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepDS_IndexedDataMapOfVertexPoint &
	:rtype: TopOpeBRepDS_IndexedDataMapOfVertexPoint
") operator =;
		TopOpeBRepDS_IndexedDataMapOfVertexPoint & operator = (const TopOpeBRepDS_IndexedDataMapOfVertexPoint & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: TopOpeBRepDS_Point &
	:rtype: int
") Add;
		Standard_Integer Add (const TopoDS_Shape & K,const TopOpeBRepDS_Point & I);
		%feature("compactdefaultargs") Substitute;
		%feature("autodoc", "	:param I:
	:type I: int
	:param K:
	:type K: TopoDS_Shape &
	:param T:
	:type T: TopOpeBRepDS_Point &
	:rtype: None
") Substitute;
		void Substitute (const Standard_Integer I,const TopoDS_Shape & K,const TopOpeBRepDS_Point & T);
		%feature("compactdefaultargs") RemoveLast;
		%feature("autodoc", "	:rtype: None
") RemoveLast;
		void RemoveLast ();
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const TopoDS_Shape & K);
		%feature("compactdefaultargs") FindKey;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: TopoDS_Shape
") FindKey;
		const TopoDS_Shape  FindKey (const Standard_Integer I);
		%feature("compactdefaultargs") FindFromIndex;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: TopOpeBRepDS_Point
") FindFromIndex;
		const TopOpeBRepDS_Point & FindFromIndex (const Standard_Integer I);
		%feature("compactdefaultargs") ChangeFromIndex;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: TopOpeBRepDS_Point
") ChangeFromIndex;
		TopOpeBRepDS_Point & ChangeFromIndex (const Standard_Integer I);
		%feature("compactdefaultargs") FindIndex;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: int
") FindIndex;
		Standard_Integer FindIndex (const TopoDS_Shape & K);
		%feature("compactdefaultargs") FindFromKey;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TopOpeBRepDS_Point
") FindFromKey;
		const TopOpeBRepDS_Point & FindFromKey (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFromKey;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TopOpeBRepDS_Point
") ChangeFromKey;
		TopOpeBRepDS_Point & ChangeFromKey (const TopoDS_Shape & K);
		%feature("compactdefaultargs") FindFromKey1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") FindFromKey1;
		Standard_Address FindFromKey1 (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFromKey1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") ChangeFromKey1;
		Standard_Address ChangeFromKey1 (const TopoDS_Shape & K);
};


%extend TopOpeBRepDS_IndexedDataMapOfVertexPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_Interference;
class TopOpeBRepDS_Interference : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_Interference;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepDS_Interference;
		 TopOpeBRepDS_Interference ();
		%feature("compactdefaultargs") TopOpeBRepDS_Interference;
		%feature("autodoc", "	:param Transition:
	:type Transition: TopOpeBRepDS_Transition &
	:param SupportType:
	:type SupportType: TopOpeBRepDS_Kind
	:param Support:
	:type Support: int
	:param GeometryType:
	:type GeometryType: TopOpeBRepDS_Kind
	:param Geometry:
	:type Geometry: int
	:rtype: None
") TopOpeBRepDS_Interference;
		 TopOpeBRepDS_Interference (const TopOpeBRepDS_Transition & Transition,const TopOpeBRepDS_Kind SupportType,const Standard_Integer Support,const TopOpeBRepDS_Kind GeometryType,const Standard_Integer Geometry);
		%feature("compactdefaultargs") TopOpeBRepDS_Interference;
		%feature("autodoc", "	:param I:
	:type I: Handle_TopOpeBRepDS_Interference &
	:rtype: None
") TopOpeBRepDS_Interference;
		 TopOpeBRepDS_Interference (const Handle_TopOpeBRepDS_Interference & I);
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", "	:rtype: TopOpeBRepDS_Transition
") Transition;
		const TopOpeBRepDS_Transition & Transition ();
		%feature("compactdefaultargs") ChangeTransition;
		%feature("autodoc", "	:rtype: TopOpeBRepDS_Transition
") ChangeTransition;
		TopOpeBRepDS_Transition & ChangeTransition ();
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", "	:param T:
	:type T: TopOpeBRepDS_Transition &
	:rtype: None
") Transition;
		void Transition (const TopOpeBRepDS_Transition & T);
		%feature("compactdefaultargs") GKGSKS;
		%feature("autodoc", "	* return GeometryType + Geometry + SupportType + Support

	:param GK:
	:type GK: TopOpeBRepDS_Kind &
	:param G:
	:type G: int &
	:param SK:
	:type SK: TopOpeBRepDS_Kind &
	:param S:
	:type S: int &
	:rtype: None
") GKGSKS;
		void GKGSKS (TopOpeBRepDS_Kind & GK,Standard_Integer &OutValue,TopOpeBRepDS_Kind & SK,Standard_Integer &OutValue);
		%feature("compactdefaultargs") SupportType;
		%feature("autodoc", "	:rtype: TopOpeBRepDS_Kind
") SupportType;
		TopOpeBRepDS_Kind SupportType ();
		%feature("compactdefaultargs") Support;
		%feature("autodoc", "	:rtype: int
") Support;
		Standard_Integer Support ();
		%feature("compactdefaultargs") GeometryType;
		%feature("autodoc", "	:rtype: TopOpeBRepDS_Kind
") GeometryType;
		TopOpeBRepDS_Kind GeometryType ();
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "	:rtype: int
") Geometry;
		Standard_Integer Geometry ();
		%feature("compactdefaultargs") SetGeometry;
		%feature("autodoc", "	:param GI:
	:type GI: int
	:rtype: None
") SetGeometry;
		void SetGeometry (const Standard_Integer GI);
		%feature("compactdefaultargs") SupportType;
		%feature("autodoc", "	:param ST:
	:type ST: TopOpeBRepDS_Kind
	:rtype: None
") SupportType;
		void SupportType (const TopOpeBRepDS_Kind ST);
		%feature("compactdefaultargs") Support;
		%feature("autodoc", "	:param S:
	:type S: int
	:rtype: None
") Support;
		void Support (const Standard_Integer S);
		%feature("compactdefaultargs") GeometryType;
		%feature("autodoc", "	:param GT:
	:type GT: TopOpeBRepDS_Kind
	:rtype: None
") GeometryType;
		void GeometryType (const TopOpeBRepDS_Kind GT);
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "	:param G:
	:type G: int
	:rtype: None
") Geometry;
		void Geometry (const Standard_Integer G);
		%feature("compactdefaultargs") HasSameSupport;
		%feature("autodoc", "	:param Other:
	:type Other: Handle_TopOpeBRepDS_Interference &
	:rtype: bool
") HasSameSupport;
		Standard_Boolean HasSameSupport (const Handle_TopOpeBRepDS_Interference & Other);
		%feature("compactdefaultargs") HasSameGeometry;
		%feature("autodoc", "	:param Other:
	:type Other: Handle_TopOpeBRepDS_Interference &
	:rtype: bool
") HasSameGeometry;
		Standard_Boolean HasSameGeometry (const Handle_TopOpeBRepDS_Interference & Other);

        %feature("autodoc", "1");
        %extend{
            std::string DumpGToString() {
            std::stringstream s;
            self->DumpG(s);
            return s.str();}
        };
        
        %feature("autodoc", "1");
        %extend{
            std::string DumpSToString() {
            std::stringstream s;
            self->DumpS(s);
            return s.str();}
        };
        
        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	:param OS:
	:type OS: Standard_OStream &
	:param s1:
	:type s1: TCollection_AsciiString &
	:param s2:
	:type s2: TCollection_AsciiString &
	:rtype: Standard_OStream
") Dump;
		Standard_OStream & Dump (Standard_OStream & OS,const TCollection_AsciiString & s1,const TCollection_AsciiString & s2);
};


%extend TopOpeBRepDS_Interference {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopOpeBRepDS_Interference(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopOpeBRepDS_Interference::Handle_TopOpeBRepDS_Interference %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TopOpeBRepDS_Interference;
class Handle_TopOpeBRepDS_Interference : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TopOpeBRepDS_Interference();
        Handle_TopOpeBRepDS_Interference(const Handle_TopOpeBRepDS_Interference &aHandle);
        Handle_TopOpeBRepDS_Interference(const TopOpeBRepDS_Interference *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopOpeBRepDS_Interference DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopOpeBRepDS_Interference {
    TopOpeBRepDS_Interference* _get_reference() {
    return (TopOpeBRepDS_Interference*)$self->Access();
    }
};

%extend Handle_TopOpeBRepDS_Interference {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopOpeBRepDS_Interference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_InterferenceIterator;
class TopOpeBRepDS_InterferenceIterator {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_InterferenceIterator;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepDS_InterferenceIterator;
		 TopOpeBRepDS_InterferenceIterator ();
		%feature("compactdefaultargs") TopOpeBRepDS_InterferenceIterator;
		%feature("autodoc", "	* Creates an iterator on the Interference of list <L>.

	:param L:
	:type L: TopOpeBRepDS_ListOfInterference &
	:rtype: None
") TopOpeBRepDS_InterferenceIterator;
		 TopOpeBRepDS_InterferenceIterator (const TopOpeBRepDS_ListOfInterference & L);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* re-initialize interference iteration process on the list of interference <L>. Conditions are not modified.

	:param L:
	:type L: TopOpeBRepDS_ListOfInterference &
	:rtype: None
") Init;
		void Init (const TopOpeBRepDS_ListOfInterference & L);
		%feature("compactdefaultargs") GeometryKind;
		%feature("autodoc", "	* define a condition on interference iteration process. Interference must match the Geometry Kind <ST>

	:param GK:
	:type GK: TopOpeBRepDS_Kind
	:rtype: None
") GeometryKind;
		void GeometryKind (const TopOpeBRepDS_Kind GK);
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "	* define a condition on interference iteration process. Interference must match the Geometry <G>

	:param G:
	:type G: int
	:rtype: None
") Geometry;
		void Geometry (const Standard_Integer G);
		%feature("compactdefaultargs") SupportKind;
		%feature("autodoc", "	* define a condition on interference iteration process. Interference must match the Support Kind <ST>

	:param ST:
	:type ST: TopOpeBRepDS_Kind
	:rtype: None
") SupportKind;
		void SupportKind (const TopOpeBRepDS_Kind ST);
		%feature("compactdefaultargs") Support;
		%feature("autodoc", "	* define a condition on interference iteration process. Interference must match the Support <S>

	:param S:
	:type S: int
	:rtype: None
") Support;
		void Support (const Standard_Integer S);
		%feature("compactdefaultargs") Match;
		%feature("autodoc", "	* reach for an interference matching the conditions (if defined).

	:rtype: None
") Match;
		void Match ();
		%feature("compactdefaultargs") MatchInterference;
		%feature("autodoc", "	* Returns True if the Interference <I> matches the conditions (if defined). If no conditions defined, returns True.

	:param I:
	:type I: Handle_TopOpeBRepDS_Interference &
	:rtype: bool
") MatchInterference;
		virtual Standard_Boolean MatchInterference (const Handle_TopOpeBRepDS_Interference & I);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	* Returns True if there is a current Interference in the iteration.

	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	* Move to the next Interference.

	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the current Interference, matching the conditions (if defined).

	:rtype: Handle_TopOpeBRepDS_Interference
") Value;
		Handle_TopOpeBRepDS_Interference Value ();
		%feature("compactdefaultargs") ChangeIterator;
		%feature("autodoc", "	:rtype: TopOpeBRepDS_ListIteratorOfListOfInterference
") ChangeIterator;
		TopOpeBRepDS_ListIteratorOfListOfInterference & ChangeIterator ();
};


%extend TopOpeBRepDS_InterferenceIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class TopOpeBRepDS_InterferenceTool {
	public:
		%feature("compactdefaultargs") MakeEdgeInterference;
		%feature("autodoc", "	:param T:
	:type T: TopOpeBRepDS_Transition &
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
	:rtype: Handle_TopOpeBRepDS_Interference
") MakeEdgeInterference;
		static Handle_TopOpeBRepDS_Interference MakeEdgeInterference (const TopOpeBRepDS_Transition & T,const TopOpeBRepDS_Kind SK,const Standard_Integer SI,const TopOpeBRepDS_Kind GK,const Standard_Integer GI,const Standard_Real P);
		%feature("compactdefaultargs") MakeCurveInterference;
		%feature("autodoc", "	:param T:
	:type T: TopOpeBRepDS_Transition &
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
	:rtype: Handle_TopOpeBRepDS_Interference
") MakeCurveInterference;
		static Handle_TopOpeBRepDS_Interference MakeCurveInterference (const TopOpeBRepDS_Transition & T,const TopOpeBRepDS_Kind SK,const Standard_Integer SI,const TopOpeBRepDS_Kind GK,const Standard_Integer GI,const Standard_Real P);
		%feature("compactdefaultargs") DuplicateCurvePointInterference;
		%feature("autodoc", "	* duplicate I in a new interference with Complement() transition.

	:param I:
	:type I: Handle_TopOpeBRepDS_Interference &
	:rtype: Handle_TopOpeBRepDS_Interference
") DuplicateCurvePointInterference;
		static Handle_TopOpeBRepDS_Interference DuplicateCurvePointInterference (const Handle_TopOpeBRepDS_Interference & I);
		%feature("compactdefaultargs") MakeFaceCurveInterference;
		%feature("autodoc", "	:param Transition:
	:type Transition: TopOpeBRepDS_Transition &
	:param FaceI:
	:type FaceI: int
	:param CurveI:
	:type CurveI: int
	:param PC:
	:type PC: Handle_Geom2d_Curve &
	:rtype: Handle_TopOpeBRepDS_Interference
") MakeFaceCurveInterference;
		static Handle_TopOpeBRepDS_Interference MakeFaceCurveInterference (const TopOpeBRepDS_Transition & Transition,const Standard_Integer FaceI,const Standard_Integer CurveI,const Handle_Geom2d_Curve & PC);
		%feature("compactdefaultargs") MakeSolidSurfaceInterference;
		%feature("autodoc", "	:param Transition:
	:type Transition: TopOpeBRepDS_Transition &
	:param SolidI:
	:type SolidI: int
	:param SurfaceI:
	:type SurfaceI: int
	:rtype: Handle_TopOpeBRepDS_Interference
") MakeSolidSurfaceInterference;
		static Handle_TopOpeBRepDS_Interference MakeSolidSurfaceInterference (const TopOpeBRepDS_Transition & Transition,const Standard_Integer SolidI,const Standard_Integer SurfaceI);
		%feature("compactdefaultargs") MakeEdgeVertexInterference;
		%feature("autodoc", "	:param Transition:
	:type Transition: TopOpeBRepDS_Transition &
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
	:rtype: Handle_TopOpeBRepDS_Interference
") MakeEdgeVertexInterference;
		static Handle_TopOpeBRepDS_Interference MakeEdgeVertexInterference (const TopOpeBRepDS_Transition & Transition,const Standard_Integer EdgeI,const Standard_Integer VertexI,const Standard_Boolean VertexIsBound,const TopOpeBRepDS_Config Config,const Standard_Real param);
		%feature("compactdefaultargs") MakeFaceEdgeInterference;
		%feature("autodoc", "	:param Transition:
	:type Transition: TopOpeBRepDS_Transition &
	:param FaceI:
	:type FaceI: int
	:param EdgeI:
	:type EdgeI: int
	:param EdgeIsBound:
	:type EdgeIsBound: bool
	:param Config:
	:type Config: TopOpeBRepDS_Config
	:rtype: Handle_TopOpeBRepDS_Interference
") MakeFaceEdgeInterference;
		static Handle_TopOpeBRepDS_Interference MakeFaceEdgeInterference (const TopOpeBRepDS_Transition & Transition,const Standard_Integer FaceI,const Standard_Integer EdgeI,const Standard_Boolean EdgeIsBound,const TopOpeBRepDS_Config Config);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	:param CPI:
	:type CPI: Handle_TopOpeBRepDS_Interference &
	:rtype: float
") Parameter;
		static Standard_Real Parameter (const Handle_TopOpeBRepDS_Interference & CPI);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	:param CPI:
	:type CPI: Handle_TopOpeBRepDS_Interference &
	:param Par:
	:type Par: float
	:rtype: void
") Parameter;
		static void Parameter (const Handle_TopOpeBRepDS_Interference & CPI,const Standard_Real Par);
};


%extend TopOpeBRepDS_InterferenceTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_ListIteratorOfListOfInterference;
class TopOpeBRepDS_ListIteratorOfListOfInterference {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_ListIteratorOfListOfInterference;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepDS_ListIteratorOfListOfInterference;
		 TopOpeBRepDS_ListIteratorOfListOfInterference ();
		%feature("compactdefaultargs") TopOpeBRepDS_ListIteratorOfListOfInterference;
		%feature("autodoc", "	:param L:
	:type L: TopOpeBRepDS_ListOfInterference &
	:rtype: None
") TopOpeBRepDS_ListIteratorOfListOfInterference;
		 TopOpeBRepDS_ListIteratorOfListOfInterference (const TopOpeBRepDS_ListOfInterference & L);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param L:
	:type L: TopOpeBRepDS_ListOfInterference &
	:rtype: None
") Initialize;
		void Initialize (const TopOpeBRepDS_ListOfInterference & L);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_TopOpeBRepDS_Interference
") Value;
		Handle_TopOpeBRepDS_Interference Value ();
};


%extend TopOpeBRepDS_ListIteratorOfListOfInterference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_ListNodeOfListOfInterference;
class TopOpeBRepDS_ListNodeOfListOfInterference : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_ListNodeOfListOfInterference;
		%feature("autodoc", "	:param I:
	:type I: Handle_TopOpeBRepDS_Interference &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TopOpeBRepDS_ListNodeOfListOfInterference;
		 TopOpeBRepDS_ListNodeOfListOfInterference (const Handle_TopOpeBRepDS_Interference & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_TopOpeBRepDS_Interference
") Value;
		Handle_TopOpeBRepDS_Interference Value ();
};


%extend TopOpeBRepDS_ListNodeOfListOfInterference {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopOpeBRepDS_ListNodeOfListOfInterference(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopOpeBRepDS_ListNodeOfListOfInterference::Handle_TopOpeBRepDS_ListNodeOfListOfInterference %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TopOpeBRepDS_ListNodeOfListOfInterference;
class Handle_TopOpeBRepDS_ListNodeOfListOfInterference : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TopOpeBRepDS_ListNodeOfListOfInterference();
        Handle_TopOpeBRepDS_ListNodeOfListOfInterference(const Handle_TopOpeBRepDS_ListNodeOfListOfInterference &aHandle);
        Handle_TopOpeBRepDS_ListNodeOfListOfInterference(const TopOpeBRepDS_ListNodeOfListOfInterference *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopOpeBRepDS_ListNodeOfListOfInterference DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopOpeBRepDS_ListNodeOfListOfInterference {
    TopOpeBRepDS_ListNodeOfListOfInterference* _get_reference() {
    return (TopOpeBRepDS_ListNodeOfListOfInterference*)$self->Access();
    }
};

%extend Handle_TopOpeBRepDS_ListNodeOfListOfInterference {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopOpeBRepDS_ListNodeOfListOfInterference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_ListOfInterference;
class TopOpeBRepDS_ListOfInterference {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_ListOfInterference;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepDS_ListOfInterference;
		 TopOpeBRepDS_ListOfInterference ();
		%feature("compactdefaultargs") TopOpeBRepDS_ListOfInterference;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepDS_ListOfInterference &
	:rtype: None
") TopOpeBRepDS_ListOfInterference;
		 TopOpeBRepDS_ListOfInterference (const TopOpeBRepDS_ListOfInterference & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepDS_ListOfInterference &
	:rtype: None
") Assign;
		void Assign (const TopOpeBRepDS_ListOfInterference & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepDS_ListOfInterference &
	:rtype: None
") operator =;
		void operator = (const TopOpeBRepDS_ListOfInterference & Other);
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: Handle_TopOpeBRepDS_Interference &
	:rtype: None
") Prepend;
		void Prepend (const Handle_TopOpeBRepDS_Interference & I);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: Handle_TopOpeBRepDS_Interference &
	:param theIt:
	:type theIt: TopOpeBRepDS_ListIteratorOfListOfInterference &
	:rtype: None
") Prepend;
		void Prepend (const Handle_TopOpeBRepDS_Interference & I,TopOpeBRepDS_ListIteratorOfListOfInterference & theIt);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepDS_ListOfInterference &
	:rtype: None
") Prepend;
		void Prepend (TopOpeBRepDS_ListOfInterference & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: Handle_TopOpeBRepDS_Interference &
	:rtype: None
") Append;
		void Append (const Handle_TopOpeBRepDS_Interference & I);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: Handle_TopOpeBRepDS_Interference &
	:param theIt:
	:type theIt: TopOpeBRepDS_ListIteratorOfListOfInterference &
	:rtype: None
") Append;
		void Append (const Handle_TopOpeBRepDS_Interference & I,TopOpeBRepDS_ListIteratorOfListOfInterference & theIt);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepDS_ListOfInterference &
	:rtype: None
") Append;
		void Append (TopOpeBRepDS_ListOfInterference & Other);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_TopOpeBRepDS_Interference
") First;
		Handle_TopOpeBRepDS_Interference First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_TopOpeBRepDS_Interference
") Last;
		Handle_TopOpeBRepDS_Interference Last ();
		%feature("compactdefaultargs") RemoveFirst;
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param It:
	:type It: TopOpeBRepDS_ListIteratorOfListOfInterference &
	:rtype: None
") Remove;
		void Remove (TopOpeBRepDS_ListIteratorOfListOfInterference & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param I:
	:type I: Handle_TopOpeBRepDS_Interference &
	:param It:
	:type It: TopOpeBRepDS_ListIteratorOfListOfInterference &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Handle_TopOpeBRepDS_Interference & I,TopOpeBRepDS_ListIteratorOfListOfInterference & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepDS_ListOfInterference &
	:param It:
	:type It: TopOpeBRepDS_ListIteratorOfListOfInterference &
	:rtype: None
") InsertBefore;
		void InsertBefore (TopOpeBRepDS_ListOfInterference & Other,TopOpeBRepDS_ListIteratorOfListOfInterference & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param I:
	:type I: Handle_TopOpeBRepDS_Interference &
	:param It:
	:type It: TopOpeBRepDS_ListIteratorOfListOfInterference &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Handle_TopOpeBRepDS_Interference & I,TopOpeBRepDS_ListIteratorOfListOfInterference & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepDS_ListOfInterference &
	:param It:
	:type It: TopOpeBRepDS_ListIteratorOfListOfInterference &
	:rtype: None
") InsertAfter;
		void InsertAfter (TopOpeBRepDS_ListOfInterference & Other,TopOpeBRepDS_ListIteratorOfListOfInterference & It);
};


%extend TopOpeBRepDS_ListOfInterference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_ListOfShapeOn1State;
class TopOpeBRepDS_ListOfShapeOn1State {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_ListOfShapeOn1State;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepDS_ListOfShapeOn1State;
		 TopOpeBRepDS_ListOfShapeOn1State ();
		%feature("compactdefaultargs") ListOnState;
		%feature("autodoc", "	:rtype: TopTools_ListOfShape
") ListOnState;
		const TopTools_ListOfShape & ListOnState ();
		%feature("compactdefaultargs") ChangeListOnState;
		%feature("autodoc", "	:rtype: TopTools_ListOfShape
") ChangeListOnState;
		TopTools_ListOfShape & ChangeListOnState ();
		%feature("compactdefaultargs") IsSplit;
		%feature("autodoc", "	:rtype: bool
") IsSplit;
		Standard_Boolean IsSplit ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param B: default value is Standard_True
	:type B: bool
	:rtype: None
") Split;
		void Split (const Standard_Boolean B = Standard_True);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
};


%extend TopOpeBRepDS_ListOfShapeOn1State {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_MapOfCurve;
class TopOpeBRepDS_MapOfCurve : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_MapOfCurve;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TopOpeBRepDS_MapOfCurve;
		 TopOpeBRepDS_MapOfCurve (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepDS_MapOfCurve &
	:rtype: TopOpeBRepDS_MapOfCurve
") Assign;
		TopOpeBRepDS_MapOfCurve & Assign (const TopOpeBRepDS_MapOfCurve & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepDS_MapOfCurve &
	:rtype: TopOpeBRepDS_MapOfCurve
") operator =;
		TopOpeBRepDS_MapOfCurve & operator = (const TopOpeBRepDS_MapOfCurve & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:param I:
	:type I: TopOpeBRepDS_CurveData &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const Standard_Integer & K,const TopOpeBRepDS_CurveData & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const Standard_Integer & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const Standard_Integer & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: TopOpeBRepDS_CurveData
") Find;
		const TopOpeBRepDS_CurveData & Find (const Standard_Integer & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: TopOpeBRepDS_CurveData
") ChangeFind;
		TopOpeBRepDS_CurveData & ChangeFind (const Standard_Integer & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const Standard_Integer & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const Standard_Integer & K);
};


%extend TopOpeBRepDS_MapOfCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_MapOfIntegerShapeData;
class TopOpeBRepDS_MapOfIntegerShapeData : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_MapOfIntegerShapeData;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TopOpeBRepDS_MapOfIntegerShapeData;
		 TopOpeBRepDS_MapOfIntegerShapeData (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepDS_MapOfIntegerShapeData &
	:rtype: TopOpeBRepDS_MapOfIntegerShapeData
") Assign;
		TopOpeBRepDS_MapOfIntegerShapeData & Assign (const TopOpeBRepDS_MapOfIntegerShapeData & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepDS_MapOfIntegerShapeData &
	:rtype: TopOpeBRepDS_MapOfIntegerShapeData
") operator =;
		TopOpeBRepDS_MapOfIntegerShapeData & operator = (const TopOpeBRepDS_MapOfIntegerShapeData & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:param I:
	:type I: TopOpeBRepDS_ShapeData &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const Standard_Integer & K,const TopOpeBRepDS_ShapeData & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const Standard_Integer & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const Standard_Integer & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: TopOpeBRepDS_ShapeData
") Find;
		const TopOpeBRepDS_ShapeData & Find (const Standard_Integer & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: TopOpeBRepDS_ShapeData
") ChangeFind;
		TopOpeBRepDS_ShapeData & ChangeFind (const Standard_Integer & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const Standard_Integer & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const Standard_Integer & K);
};


%extend TopOpeBRepDS_MapOfIntegerShapeData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_MapOfPoint;
class TopOpeBRepDS_MapOfPoint : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_MapOfPoint;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TopOpeBRepDS_MapOfPoint;
		 TopOpeBRepDS_MapOfPoint (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepDS_MapOfPoint &
	:rtype: TopOpeBRepDS_MapOfPoint
") Assign;
		TopOpeBRepDS_MapOfPoint & Assign (const TopOpeBRepDS_MapOfPoint & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepDS_MapOfPoint &
	:rtype: TopOpeBRepDS_MapOfPoint
") operator =;
		TopOpeBRepDS_MapOfPoint & operator = (const TopOpeBRepDS_MapOfPoint & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:param I:
	:type I: TopOpeBRepDS_PointData &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const Standard_Integer & K,const TopOpeBRepDS_PointData & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const Standard_Integer & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const Standard_Integer & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: TopOpeBRepDS_PointData
") Find;
		const TopOpeBRepDS_PointData & Find (const Standard_Integer & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: TopOpeBRepDS_PointData
") ChangeFind;
		TopOpeBRepDS_PointData & ChangeFind (const Standard_Integer & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const Standard_Integer & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const Standard_Integer & K);
};


%extend TopOpeBRepDS_MapOfPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_MapOfShapeData;
class TopOpeBRepDS_MapOfShapeData : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_MapOfShapeData;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TopOpeBRepDS_MapOfShapeData;
		 TopOpeBRepDS_MapOfShapeData (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepDS_MapOfShapeData &
	:rtype: TopOpeBRepDS_MapOfShapeData
") Assign;
		TopOpeBRepDS_MapOfShapeData & Assign (const TopOpeBRepDS_MapOfShapeData & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepDS_MapOfShapeData &
	:rtype: TopOpeBRepDS_MapOfShapeData
") operator =;
		TopOpeBRepDS_MapOfShapeData & operator = (const TopOpeBRepDS_MapOfShapeData & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: TopOpeBRepDS_ShapeData &
	:rtype: int
") Add;
		Standard_Integer Add (const TopoDS_Shape & K,const TopOpeBRepDS_ShapeData & I);
		%feature("compactdefaultargs") Substitute;
		%feature("autodoc", "	:param I:
	:type I: int
	:param K:
	:type K: TopoDS_Shape &
	:param T:
	:type T: TopOpeBRepDS_ShapeData &
	:rtype: None
") Substitute;
		void Substitute (const Standard_Integer I,const TopoDS_Shape & K,const TopOpeBRepDS_ShapeData & T);
		%feature("compactdefaultargs") RemoveLast;
		%feature("autodoc", "	:rtype: None
") RemoveLast;
		void RemoveLast ();
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const TopoDS_Shape & K);
		%feature("compactdefaultargs") FindKey;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: TopoDS_Shape
") FindKey;
		const TopoDS_Shape  FindKey (const Standard_Integer I);
		%feature("compactdefaultargs") FindFromIndex;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: TopOpeBRepDS_ShapeData
") FindFromIndex;
		const TopOpeBRepDS_ShapeData & FindFromIndex (const Standard_Integer I);
		%feature("compactdefaultargs") ChangeFromIndex;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: TopOpeBRepDS_ShapeData
") ChangeFromIndex;
		TopOpeBRepDS_ShapeData & ChangeFromIndex (const Standard_Integer I);
		%feature("compactdefaultargs") FindIndex;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: int
") FindIndex;
		Standard_Integer FindIndex (const TopoDS_Shape & K);
		%feature("compactdefaultargs") FindFromKey;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TopOpeBRepDS_ShapeData
") FindFromKey;
		const TopOpeBRepDS_ShapeData & FindFromKey (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFromKey;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TopOpeBRepDS_ShapeData
") ChangeFromKey;
		TopOpeBRepDS_ShapeData & ChangeFromKey (const TopoDS_Shape & K);
		%feature("compactdefaultargs") FindFromKey1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") FindFromKey1;
		Standard_Address FindFromKey1 (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFromKey1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") ChangeFromKey1;
		Standard_Address ChangeFromKey1 (const TopoDS_Shape & K);
};


%extend TopOpeBRepDS_MapOfShapeData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_MapOfSurface;
class TopOpeBRepDS_MapOfSurface : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_MapOfSurface;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TopOpeBRepDS_MapOfSurface;
		 TopOpeBRepDS_MapOfSurface (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepDS_MapOfSurface &
	:rtype: TopOpeBRepDS_MapOfSurface
") Assign;
		TopOpeBRepDS_MapOfSurface & Assign (const TopOpeBRepDS_MapOfSurface & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepDS_MapOfSurface &
	:rtype: TopOpeBRepDS_MapOfSurface
") operator =;
		TopOpeBRepDS_MapOfSurface & operator = (const TopOpeBRepDS_MapOfSurface & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:param I:
	:type I: TopOpeBRepDS_SurfaceData &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const Standard_Integer & K,const TopOpeBRepDS_SurfaceData & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const Standard_Integer & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const Standard_Integer & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: TopOpeBRepDS_SurfaceData
") Find;
		const TopOpeBRepDS_SurfaceData & Find (const Standard_Integer & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: TopOpeBRepDS_SurfaceData
") ChangeFind;
		TopOpeBRepDS_SurfaceData & ChangeFind (const Standard_Integer & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const Standard_Integer & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const Standard_Integer & K);
};


%extend TopOpeBRepDS_MapOfSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_Marker;
class TopOpeBRepDS_Marker : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_Marker;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepDS_Marker;
		 TopOpeBRepDS_Marker ();
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "	:rtype: None
") Reset;
		void Reset ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param i:
	:type i: int
	:param b:
	:type b: bool
	:rtype: None
") Set;
		void Set (const Standard_Integer i,const Standard_Boolean b);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param b:
	:type b: bool
	:param n:
	:type n: int
	:param a:
	:type a: Standard_Address
	:rtype: None
") Set;
		void Set (const Standard_Boolean b,const Standard_Integer n,const Standard_Address a);
		%feature("compactdefaultargs") GetI;
		%feature("autodoc", "	:param i:
	:type i: int
	:rtype: bool
") GetI;
		Standard_Boolean GetI (const Standard_Integer i);
		%feature("compactdefaultargs") Allocate;
		%feature("autodoc", "	:param n:
	:type n: int
	:rtype: None
") Allocate;
		void Allocate (const Standard_Integer n);
};


%extend TopOpeBRepDS_Marker {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopOpeBRepDS_Marker(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopOpeBRepDS_Marker::Handle_TopOpeBRepDS_Marker %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TopOpeBRepDS_Marker;
class Handle_TopOpeBRepDS_Marker : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TopOpeBRepDS_Marker();
        Handle_TopOpeBRepDS_Marker(const Handle_TopOpeBRepDS_Marker &aHandle);
        Handle_TopOpeBRepDS_Marker(const TopOpeBRepDS_Marker *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopOpeBRepDS_Marker DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopOpeBRepDS_Marker {
    TopOpeBRepDS_Marker* _get_reference() {
    return (TopOpeBRepDS_Marker*)$self->Access();
    }
};

%extend Handle_TopOpeBRepDS_Marker {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopOpeBRepDS_Marker {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_Point;
class TopOpeBRepDS_Point {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_Point;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepDS_Point;
		 TopOpeBRepDS_Point ();
		%feature("compactdefaultargs") TopOpeBRepDS_Point;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param T:
	:type T: float
	:rtype: None
") TopOpeBRepDS_Point;
		 TopOpeBRepDS_Point (const gp_Pnt & P,const Standard_Real T);
		%feature("compactdefaultargs") TopOpeBRepDS_Point;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") TopOpeBRepDS_Point;
		 TopOpeBRepDS_Point (const TopoDS_Shape & S);
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	:param other:
	:type other: TopOpeBRepDS_Point &
	:rtype: bool
") IsEqual;
		Standard_Boolean IsEqual (const TopOpeBRepDS_Point & other);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	:rtype: gp_Pnt
") Point;
		const gp_Pnt  Point ();
		%feature("compactdefaultargs") ChangePoint;
		%feature("autodoc", "	:rtype: gp_Pnt
") ChangePoint;
		gp_Pnt  ChangePoint ();
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "	:rtype: float
") Tolerance;
		Standard_Real Tolerance ();
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "	:param Tol:
	:type Tol: float
	:rtype: None
") Tolerance;
		void Tolerance (const Standard_Real Tol);
		%feature("compactdefaultargs") Keep;
		%feature("autodoc", "	:rtype: bool
") Keep;
		Standard_Boolean Keep ();
		%feature("compactdefaultargs") ChangeKeep;
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") ChangeKeep;
		void ChangeKeep (const Standard_Boolean B);
};


%extend TopOpeBRepDS_Point {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_PointExplorer;
class TopOpeBRepDS_PointExplorer {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_PointExplorer;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepDS_PointExplorer;
		 TopOpeBRepDS_PointExplorer ();
		%feature("compactdefaultargs") TopOpeBRepDS_PointExplorer;
		%feature("autodoc", "	:param DS:
	:type DS: TopOpeBRepDS_DataStructure &
	:param FindOnlyKeep: default value is Standard_True
	:type FindOnlyKeep: bool
	:rtype: None
") TopOpeBRepDS_PointExplorer;
		 TopOpeBRepDS_PointExplorer (const TopOpeBRepDS_DataStructure & DS,const Standard_Boolean FindOnlyKeep = Standard_True);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param DS:
	:type DS: TopOpeBRepDS_DataStructure &
	:param FindOnlyKeep: default value is Standard_True
	:type FindOnlyKeep: bool
	:rtype: None
") Init;
		void Init (const TopOpeBRepDS_DataStructure & DS,const Standard_Boolean FindOnlyKeep = Standard_True);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	:rtype: TopOpeBRepDS_Point
") Point;
		const TopOpeBRepDS_Point & Point ();
		%feature("compactdefaultargs") IsPoint;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: bool
") IsPoint;
		Standard_Boolean IsPoint (const Standard_Integer I);
		%feature("compactdefaultargs") IsPointKeep;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: bool
") IsPointKeep;
		Standard_Boolean IsPointKeep (const Standard_Integer I);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: TopOpeBRepDS_Point
") Point;
		const TopOpeBRepDS_Point & Point (const Standard_Integer I);
		%feature("compactdefaultargs") NbPoint;
		%feature("autodoc", "	:rtype: int
") NbPoint;
		Standard_Integer NbPoint ();
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "	:rtype: int
") Index;
		Standard_Integer Index ();
};


%extend TopOpeBRepDS_PointExplorer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_Reducer;
class TopOpeBRepDS_Reducer {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_Reducer;
		%feature("autodoc", "	:param HDS:
	:type HDS: Handle_TopOpeBRepDS_HDataStructure &
	:rtype: None
") TopOpeBRepDS_Reducer;
		 TopOpeBRepDS_Reducer (const Handle_TopOpeBRepDS_HDataStructure & HDS);
		%feature("compactdefaultargs") ProcessFaceInterferences;
		%feature("autodoc", "	:param M:
	:type M: TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State &
	:rtype: None
") ProcessFaceInterferences;
		void ProcessFaceInterferences (const TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State & M);
		%feature("compactdefaultargs") ProcessEdgeInterferences;
		%feature("autodoc", "	:rtype: None
") ProcessEdgeInterferences;
		void ProcessEdgeInterferences ();
};


%extend TopOpeBRepDS_Reducer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_ShapeData;
class TopOpeBRepDS_ShapeData {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_ShapeData;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepDS_ShapeData;
		 TopOpeBRepDS_ShapeData ();
		%feature("compactdefaultargs") Interferences;
		%feature("autodoc", "	:rtype: TopOpeBRepDS_ListOfInterference
") Interferences;
		const TopOpeBRepDS_ListOfInterference & Interferences ();
		%feature("compactdefaultargs") ChangeInterferences;
		%feature("autodoc", "	:rtype: TopOpeBRepDS_ListOfInterference
") ChangeInterferences;
		TopOpeBRepDS_ListOfInterference & ChangeInterferences ();
		%feature("compactdefaultargs") Keep;
		%feature("autodoc", "	:rtype: bool
") Keep;
		Standard_Boolean Keep ();
		%feature("compactdefaultargs") ChangeKeep;
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") ChangeKeep;
		void ChangeKeep (const Standard_Boolean B);
};


%extend TopOpeBRepDS_ShapeData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_ShapeSurface;
class TopOpeBRepDS_ShapeSurface : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_ShapeSurface;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TopOpeBRepDS_ShapeSurface;
		 TopOpeBRepDS_ShapeSurface (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepDS_ShapeSurface &
	:rtype: TopOpeBRepDS_ShapeSurface
") Assign;
		TopOpeBRepDS_ShapeSurface & Assign (const TopOpeBRepDS_ShapeSurface & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepDS_ShapeSurface &
	:rtype: TopOpeBRepDS_ShapeSurface
") operator =;
		TopOpeBRepDS_ShapeSurface & operator = (const TopOpeBRepDS_ShapeSurface & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: Handle_Geom_Surface &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const Handle_Geom_Surface & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Handle_Geom_Surface
") Find;
		Handle_Geom_Surface Find (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Handle_Geom_Surface
") ChangeFind;
		Handle_Geom_Surface ChangeFind (const TopoDS_Shape & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Shape & K);
};


%extend TopOpeBRepDS_ShapeSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_ShapeWithState;
class TopOpeBRepDS_ShapeWithState {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_ShapeWithState;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepDS_ShapeWithState;
		 TopOpeBRepDS_ShapeWithState ();
		%feature("compactdefaultargs") Part;
		%feature("autodoc", "	:param aState:
	:type aState: TopAbs_State
	:rtype: TopTools_ListOfShape
") Part;
		const TopTools_ListOfShape & Part (const TopAbs_State aState);
		%feature("compactdefaultargs") AddPart;
		%feature("autodoc", "	:param aShape:
	:type aShape: TopoDS_Shape &
	:param aState:
	:type aState: TopAbs_State
	:rtype: None
") AddPart;
		void AddPart (const TopoDS_Shape & aShape,const TopAbs_State aState);
		%feature("compactdefaultargs") AddParts;
		%feature("autodoc", "	:param aListOfShape:
	:type aListOfShape: TopTools_ListOfShape &
	:param aState:
	:type aState: TopAbs_State
	:rtype: None
") AddParts;
		void AddParts (const TopTools_ListOfShape & aListOfShape,const TopAbs_State aState);
		%feature("compactdefaultargs") SetState;
		%feature("autodoc", "	:param aState:
	:type aState: TopAbs_State
	:rtype: None
") SetState;
		void SetState (const TopAbs_State aState);
		%feature("compactdefaultargs") State;
		%feature("autodoc", "	:rtype: TopAbs_State
") State;
		TopAbs_State State ();
		%feature("compactdefaultargs") SetIsSplitted;
		%feature("autodoc", "	:param anIsSplitted:
	:type anIsSplitted: bool
	:rtype: None
") SetIsSplitted;
		void SetIsSplitted (const Standard_Boolean anIsSplitted);
		%feature("compactdefaultargs") IsSplitted;
		%feature("autodoc", "	:rtype: bool
") IsSplitted;
		Standard_Boolean IsSplitted ();
};


%extend TopOpeBRepDS_ShapeWithState {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_Surface;
class TopOpeBRepDS_Surface {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_Surface;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepDS_Surface;
		 TopOpeBRepDS_Surface ();
		%feature("compactdefaultargs") TopOpeBRepDS_Surface;
		%feature("autodoc", "	:param P:
	:type P: Handle_Geom_Surface &
	:param T:
	:type T: float
	:rtype: None
") TopOpeBRepDS_Surface;
		 TopOpeBRepDS_Surface (const Handle_Geom_Surface & P,const Standard_Real T);
		%feature("compactdefaultargs") TopOpeBRepDS_Surface;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepDS_Surface &
	:rtype: None
") TopOpeBRepDS_Surface;
		 TopOpeBRepDS_Surface (const TopOpeBRepDS_Surface & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepDS_Surface &
	:rtype: None
") Assign;
		void Assign (const TopOpeBRepDS_Surface & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepDS_Surface &
	:rtype: None
") operator =;
		void operator = (const TopOpeBRepDS_Surface & Other);
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "	:rtype: Handle_Geom_Surface
") Surface;
		Handle_Geom_Surface Surface ();
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "	:rtype: float
") Tolerance;
		Standard_Real Tolerance ();
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "	* Update the tolerance

	:param tol:
	:type tol: float
	:rtype: None
") Tolerance;
		void Tolerance (const Standard_Real tol);
		%feature("compactdefaultargs") Keep;
		%feature("autodoc", "	:rtype: bool
") Keep;
		Standard_Boolean Keep ();
		%feature("compactdefaultargs") ChangeKeep;
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") ChangeKeep;
		void ChangeKeep (const Standard_Boolean B);
};


%extend TopOpeBRepDS_Surface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_SurfaceExplorer;
class TopOpeBRepDS_SurfaceExplorer {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_SurfaceExplorer;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepDS_SurfaceExplorer;
		 TopOpeBRepDS_SurfaceExplorer ();
		%feature("compactdefaultargs") TopOpeBRepDS_SurfaceExplorer;
		%feature("autodoc", "	:param DS:
	:type DS: TopOpeBRepDS_DataStructure &
	:param FindOnlyKeep: default value is Standard_True
	:type FindOnlyKeep: bool
	:rtype: None
") TopOpeBRepDS_SurfaceExplorer;
		 TopOpeBRepDS_SurfaceExplorer (const TopOpeBRepDS_DataStructure & DS,const Standard_Boolean FindOnlyKeep = Standard_True);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param DS:
	:type DS: TopOpeBRepDS_DataStructure &
	:param FindOnlyKeep: default value is Standard_True
	:type FindOnlyKeep: bool
	:rtype: None
") Init;
		void Init (const TopOpeBRepDS_DataStructure & DS,const Standard_Boolean FindOnlyKeep = Standard_True);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "	:rtype: TopOpeBRepDS_Surface
") Surface;
		const TopOpeBRepDS_Surface & Surface ();
		%feature("compactdefaultargs") IsSurface;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: bool
") IsSurface;
		Standard_Boolean IsSurface (const Standard_Integer I);
		%feature("compactdefaultargs") IsSurfaceKeep;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: bool
") IsSurfaceKeep;
		Standard_Boolean IsSurfaceKeep (const Standard_Integer I);
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: TopOpeBRepDS_Surface
") Surface;
		const TopOpeBRepDS_Surface & Surface (const Standard_Integer I);
		%feature("compactdefaultargs") NbSurface;
		%feature("autodoc", "	:rtype: int
") NbSurface;
		Standard_Integer NbSurface ();
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "	:rtype: int
") Index;
		Standard_Integer Index ();
};


%extend TopOpeBRepDS_SurfaceExplorer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_TKI;
class TopOpeBRepDS_TKI {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_TKI;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepDS_TKI;
		 TopOpeBRepDS_TKI ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") FillOnGeometry;
		%feature("autodoc", "	:param L:
	:type L: TopOpeBRepDS_ListOfInterference &
	:rtype: None
") FillOnGeometry;
		void FillOnGeometry (const TopOpeBRepDS_ListOfInterference & L);
		%feature("compactdefaultargs") FillOnSupport;
		%feature("autodoc", "	:param L:
	:type L: TopOpeBRepDS_ListOfInterference &
	:rtype: None
") FillOnSupport;
		void FillOnSupport (const TopOpeBRepDS_ListOfInterference & L);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: TopOpeBRepDS_Kind
	:param G:
	:type G: int
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const TopOpeBRepDS_Kind K,const Standard_Integer G);
		%feature("compactdefaultargs") Interferences;
		%feature("autodoc", "	:param K:
	:type K: TopOpeBRepDS_Kind
	:param G:
	:type G: int
	:rtype: TopOpeBRepDS_ListOfInterference
") Interferences;
		const TopOpeBRepDS_ListOfInterference & Interferences (const TopOpeBRepDS_Kind K,const Standard_Integer G);
		%feature("compactdefaultargs") ChangeInterferences;
		%feature("autodoc", "	:param K:
	:type K: TopOpeBRepDS_Kind
	:param G:
	:type G: int
	:rtype: TopOpeBRepDS_ListOfInterference
") ChangeInterferences;
		TopOpeBRepDS_ListOfInterference & ChangeInterferences (const TopOpeBRepDS_Kind K,const Standard_Integer G);
		%feature("compactdefaultargs") HasInterferences;
		%feature("autodoc", "	:param K:
	:type K: TopOpeBRepDS_Kind
	:param G:
	:type G: int
	:rtype: bool
") HasInterferences;
		Standard_Boolean HasInterferences (const TopOpeBRepDS_Kind K,const Standard_Integer G);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param K:
	:type K: TopOpeBRepDS_Kind
	:param G:
	:type G: int
	:rtype: None
") Add;
		void Add (const TopOpeBRepDS_Kind K,const Standard_Integer G);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param K:
	:type K: TopOpeBRepDS_Kind
	:param G:
	:type G: int
	:param HI:
	:type HI: Handle_TopOpeBRepDS_Interference &
	:rtype: None
") Add;
		void Add (const TopOpeBRepDS_Kind K,const Standard_Integer G,const Handle_TopOpeBRepDS_Interference & HI);
		%feature("compactdefaultargs") DumpTKI;
		%feature("autodoc", "	:param s1: default value is ""
	:type s1: TCollection_AsciiString &
	:param s2: default value is ""
	:type s2: TCollection_AsciiString &
	:rtype: None
") DumpTKI;
		void DumpTKI (const TCollection_AsciiString & s1 = "",const TCollection_AsciiString & s2 = "");
		%feature("compactdefaultargs") DumpTKI;
		%feature("autodoc", "	:param K:
	:type K: TopOpeBRepDS_Kind
	:param s1: default value is ""
	:type s1: TCollection_AsciiString &
	:param s2: default value is ""
	:type s2: TCollection_AsciiString &
	:rtype: None
") DumpTKI;
		void DumpTKI (const TopOpeBRepDS_Kind K,const TCollection_AsciiString & s1 = "",const TCollection_AsciiString & s2 = "");
		%feature("compactdefaultargs") DumpTKI;
		%feature("autodoc", "	:param K:
	:type K: TopOpeBRepDS_Kind
	:param G:
	:type G: int
	:param s1: default value is ""
	:type s1: TCollection_AsciiString &
	:param s2: default value is ""
	:type s2: TCollection_AsciiString &
	:rtype: None
") DumpTKI;
		void DumpTKI (const TopOpeBRepDS_Kind K,const Standard_Integer G,const TCollection_AsciiString & s1 = "",const TCollection_AsciiString & s2 = "");
		%feature("compactdefaultargs") DumpTKI;
		%feature("autodoc", "	:param K:
	:type K: TopOpeBRepDS_Kind
	:param G:
	:type G: int
	:param L:
	:type L: TopOpeBRepDS_ListOfInterference &
	:param s1: default value is ""
	:type s1: TCollection_AsciiString &
	:param s2: default value is ""
	:type s2: TCollection_AsciiString &
	:rtype: None
") DumpTKI;
		void DumpTKI (const TopOpeBRepDS_Kind K,const Standard_Integer G,const TopOpeBRepDS_ListOfInterference & L,const TCollection_AsciiString & s1 = "",const TCollection_AsciiString & s2 = "");
		%feature("compactdefaultargs") DumpTKIIterator;
		%feature("autodoc", "	:param s1: default value is ""
	:type s1: TCollection_AsciiString &
	:param s2: default value is ""
	:type s2: TCollection_AsciiString &
	:rtype: None
") DumpTKIIterator;
		void DumpTKIIterator (const TCollection_AsciiString & s1 = "",const TCollection_AsciiString & s2 = "");
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:rtype: None
") Init;
		void Init ();
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param K:
	:type K: TopOpeBRepDS_Kind &
	:param G:
	:type G: int &
	:rtype: TopOpeBRepDS_ListOfInterference
") Value;
		const TopOpeBRepDS_ListOfInterference & Value (TopOpeBRepDS_Kind & K,Standard_Integer &OutValue);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param K:
	:type K: TopOpeBRepDS_Kind &
	:param G:
	:type G: int &
	:rtype: TopOpeBRepDS_ListOfInterference
") ChangeValue;
		TopOpeBRepDS_ListOfInterference & ChangeValue (TopOpeBRepDS_Kind & K,Standard_Integer &OutValue);
};


%extend TopOpeBRepDS_TKI {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class TopOpeBRepDS_TOOL {
	public:
		%feature("compactdefaultargs") EShareG;
		%feature("autodoc", "	:param HDS:
	:type HDS: Handle_TopOpeBRepDS_HDataStructure &
	:param E:
	:type E: TopoDS_Edge &
	:param lEsd:
	:type lEsd: TopTools_ListOfShape &
	:rtype: int
") EShareG;
		static Standard_Integer EShareG (const Handle_TopOpeBRepDS_HDataStructure & HDS,const TopoDS_Edge & E,TopTools_ListOfShape & lEsd);
		%feature("compactdefaultargs") ShareG;
		%feature("autodoc", "	:param HDS:
	:type HDS: Handle_TopOpeBRepDS_HDataStructure &
	:param is1:
	:type is1: int
	:param is2:
	:type is2: int
	:rtype: bool
") ShareG;
		static Standard_Boolean ShareG (const Handle_TopOpeBRepDS_HDataStructure & HDS,const Standard_Integer is1,const Standard_Integer is2);
		%feature("compactdefaultargs") GetEsd;
		%feature("autodoc", "	:param HDS:
	:type HDS: Handle_TopOpeBRepDS_HDataStructure &
	:param S:
	:type S: TopoDS_Shape &
	:param ie:
	:type ie: int
	:param iesd:
	:type iesd: int &
	:rtype: bool
") GetEsd;
		static Standard_Boolean GetEsd (const Handle_TopOpeBRepDS_HDataStructure & HDS,const TopoDS_Shape & S,const Standard_Integer ie,Standard_Integer &OutValue);
		%feature("compactdefaultargs") ShareSplitON;
		%feature("autodoc", "	:param HDS:
	:type HDS: Handle_TopOpeBRepDS_HDataStructure &
	:param MspON:
	:type MspON: TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State &
	:param i1:
	:type i1: int
	:param i2:
	:type i2: int
	:param spON:
	:type spON: TopoDS_Shape &
	:rtype: bool
") ShareSplitON;
		static Standard_Boolean ShareSplitON (const Handle_TopOpeBRepDS_HDataStructure & HDS,const TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State & MspON,const Standard_Integer i1,const Standard_Integer i2,TopoDS_Shape & spON);
		%feature("compactdefaultargs") GetConfig;
		%feature("autodoc", "	:param HDS:
	:type HDS: Handle_TopOpeBRepDS_HDataStructure &
	:param MEspON:
	:type MEspON: TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State &
	:param ie:
	:type ie: int
	:param iesd:
	:type iesd: int
	:param conf:
	:type conf: int &
	:rtype: bool
") GetConfig;
		static Standard_Boolean GetConfig (const Handle_TopOpeBRepDS_HDataStructure & HDS,const TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State & MEspON,const Standard_Integer ie,const Standard_Integer iesd,Standard_Integer &OutValue);
};


%extend TopOpeBRepDS_TOOL {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_Transition;
class TopOpeBRepDS_Transition {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_Transition;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepDS_Transition;
		 TopOpeBRepDS_Transition ();
		%feature("compactdefaultargs") TopOpeBRepDS_Transition;
		%feature("autodoc", "	:param StateBefore:
	:type StateBefore: TopAbs_State
	:param StateAfter:
	:type StateAfter: TopAbs_State
	:param ShapeBefore: default value is TopAbs_FACE
	:type ShapeBefore: TopAbs_ShapeEnum
	:param ShapeAfter: default value is TopAbs_FACE
	:type ShapeAfter: TopAbs_ShapeEnum
	:rtype: None
") TopOpeBRepDS_Transition;
		 TopOpeBRepDS_Transition (const TopAbs_State StateBefore,const TopAbs_State StateAfter,const TopAbs_ShapeEnum ShapeBefore = TopAbs_FACE,const TopAbs_ShapeEnum ShapeAfter = TopAbs_FACE);
		%feature("compactdefaultargs") TopOpeBRepDS_Transition;
		%feature("autodoc", "	:param O:
	:type O: TopAbs_Orientation
	:rtype: None
") TopOpeBRepDS_Transition;
		 TopOpeBRepDS_Transition (const TopAbs_Orientation O);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param StateBefore:
	:type StateBefore: TopAbs_State
	:param StateAfter:
	:type StateAfter: TopAbs_State
	:param ShapeBefore: default value is TopAbs_FACE
	:type ShapeBefore: TopAbs_ShapeEnum
	:param ShapeAfter: default value is TopAbs_FACE
	:type ShapeAfter: TopAbs_ShapeEnum
	:rtype: None
") Set;
		void Set (const TopAbs_State StateBefore,const TopAbs_State StateAfter,const TopAbs_ShapeEnum ShapeBefore = TopAbs_FACE,const TopAbs_ShapeEnum ShapeAfter = TopAbs_FACE);
		%feature("compactdefaultargs") StateBefore;
		%feature("autodoc", "	:param S:
	:type S: TopAbs_State
	:rtype: None
") StateBefore;
		void StateBefore (const TopAbs_State S);
		%feature("compactdefaultargs") StateAfter;
		%feature("autodoc", "	:param S:
	:type S: TopAbs_State
	:rtype: None
") StateAfter;
		void StateAfter (const TopAbs_State S);
		%feature("compactdefaultargs") ShapeBefore;
		%feature("autodoc", "	:param SE:
	:type SE: TopAbs_ShapeEnum
	:rtype: None
") ShapeBefore;
		void ShapeBefore (const TopAbs_ShapeEnum SE);
		%feature("compactdefaultargs") ShapeAfter;
		%feature("autodoc", "	:param SE:
	:type SE: TopAbs_ShapeEnum
	:rtype: None
") ShapeAfter;
		void ShapeAfter (const TopAbs_ShapeEnum SE);
		%feature("compactdefaultargs") Before;
		%feature("autodoc", "	:param S:
	:type S: TopAbs_State
	:param ShapeBefore: default value is TopAbs_FACE
	:type ShapeBefore: TopAbs_ShapeEnum
	:rtype: None
") Before;
		void Before (const TopAbs_State S,const TopAbs_ShapeEnum ShapeBefore = TopAbs_FACE);
		%feature("compactdefaultargs") After;
		%feature("autodoc", "	:param S:
	:type S: TopAbs_State
	:param ShapeAfter: default value is TopAbs_FACE
	:type ShapeAfter: TopAbs_ShapeEnum
	:rtype: None
") After;
		void After (const TopAbs_State S,const TopAbs_ShapeEnum ShapeAfter = TopAbs_FACE);
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: None
") Index;
		void Index (const Standard_Integer I);
		%feature("compactdefaultargs") IndexBefore;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: None
") IndexBefore;
		void IndexBefore (const Standard_Integer I);
		%feature("compactdefaultargs") IndexAfter;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: None
") IndexAfter;
		void IndexAfter (const Standard_Integer I);
		%feature("compactdefaultargs") Before;
		%feature("autodoc", "	:rtype: TopAbs_State
") Before;
		TopAbs_State Before ();
		%feature("compactdefaultargs") ONBefore;
		%feature("autodoc", "	:rtype: TopAbs_ShapeEnum
") ONBefore;
		TopAbs_ShapeEnum ONBefore ();
		%feature("compactdefaultargs") After;
		%feature("autodoc", "	:rtype: TopAbs_State
") After;
		TopAbs_State After ();
		%feature("compactdefaultargs") ONAfter;
		%feature("autodoc", "	:rtype: TopAbs_ShapeEnum
") ONAfter;
		TopAbs_ShapeEnum ONAfter ();
		%feature("compactdefaultargs") ShapeBefore;
		%feature("autodoc", "	:rtype: TopAbs_ShapeEnum
") ShapeBefore;
		TopAbs_ShapeEnum ShapeBefore ();
		%feature("compactdefaultargs") ShapeAfter;
		%feature("autodoc", "	:rtype: TopAbs_ShapeEnum
") ShapeAfter;
		TopAbs_ShapeEnum ShapeAfter ();
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "	:rtype: int
") Index;
		Standard_Integer Index ();
		%feature("compactdefaultargs") IndexBefore;
		%feature("autodoc", "	:rtype: int
") IndexBefore;
		Standard_Integer IndexBefore ();
		%feature("compactdefaultargs") IndexAfter;
		%feature("autodoc", "	:rtype: int
") IndexAfter;
		Standard_Integer IndexAfter ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* set the transition corresponding to orientation <O> //! O Before After //! FORWARD OUT IN REVERSED IN OUT INTERNAL IN IN EXTERNAL OUT OUT

	:param O:
	:type O: TopAbs_Orientation
	:rtype: None
") Set;
		void Set (const TopAbs_Orientation O);
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "	* returns the orientation corresponding to state <S> //! Before and After not equal TopAbs_ON : -------------------------------------- Before After Computed orientation //! S not S REVERSED (we leave state S) not S S FORWARD (we enter state S) S S INTERNAL (we stay in state S) not S not S EXTERNAL (we stay outside state S)

	:param S:
	:type S: TopAbs_State
	:param T: default value is TopAbs_FACE
	:type T: TopAbs_ShapeEnum
	:rtype: TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation (const TopAbs_State S,const TopAbs_ShapeEnum T = TopAbs_FACE);
		%feature("compactdefaultargs") Complement;
		%feature("autodoc", "	:rtype: TopOpeBRepDS_Transition
") Complement;
		TopOpeBRepDS_Transition Complement ();
		%feature("compactdefaultargs") IsUnknown;
		%feature("autodoc", "	* returns True if both states are UNKNOWN

	:rtype: bool
") IsUnknown;
		Standard_Boolean IsUnknown ();

        %feature("autodoc", "1");
        %extend{
            std::string DumpAToString() {
            std::stringstream s;
            self->DumpA(s);
            return s.str();}
        };
        
        %feature("autodoc", "1");
        %extend{
            std::string DumpBToString() {
            std::stringstream s;
            self->DumpB(s);
            return s.str();}
        };
        
        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend TopOpeBRepDS_Transition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_CurveData;
class TopOpeBRepDS_CurveData : public TopOpeBRepDS_GeometryData {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_CurveData;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepDS_CurveData;
		 TopOpeBRepDS_CurveData ();
		%feature("compactdefaultargs") TopOpeBRepDS_CurveData;
		%feature("autodoc", "	:param C:
	:type C: TopOpeBRepDS_Curve &
	:rtype: None
") TopOpeBRepDS_CurveData;
		 TopOpeBRepDS_CurveData (const TopOpeBRepDS_Curve & C);
};


%extend TopOpeBRepDS_CurveData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_CurveIterator;
class TopOpeBRepDS_CurveIterator : public TopOpeBRepDS_InterferenceIterator {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_CurveIterator;
		%feature("autodoc", "	* Creates an iterator on the curves on surface described by the interferences in <L>.

	:param L:
	:type L: TopOpeBRepDS_ListOfInterference &
	:rtype: None
") TopOpeBRepDS_CurveIterator;
		 TopOpeBRepDS_CurveIterator (const TopOpeBRepDS_ListOfInterference & L);
		%feature("compactdefaultargs") MatchInterference;
		%feature("autodoc", "	* Returns True if the Interference <I> has a GeometryType() TopOpeBRepDS_CURVE returns False else.

	:param I:
	:type I: Handle_TopOpeBRepDS_Interference &
	:rtype: bool
") MatchInterference;
		virtual Standard_Boolean MatchInterference (const Handle_TopOpeBRepDS_Interference & I);
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "	* Index of the curve in the data structure.

	:rtype: int
") Current;
		Standard_Integer Current ();
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "	:param S:
	:type S: TopAbs_State
	:rtype: TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation (const TopAbs_State S);
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", "	:rtype: Handle_Geom2d_Curve
") PCurve;
		Handle_Geom2d_Curve PCurve ();
};


%extend TopOpeBRepDS_CurveIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_CurvePointInterference;
class TopOpeBRepDS_CurvePointInterference : public TopOpeBRepDS_Interference {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_CurvePointInterference;
		%feature("autodoc", "	:param T:
	:type T: TopOpeBRepDS_Transition &
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
	:rtype: None
") TopOpeBRepDS_CurvePointInterference;
		 TopOpeBRepDS_CurvePointInterference (const TopOpeBRepDS_Transition & T,const TopOpeBRepDS_Kind ST,const Standard_Integer S,const TopOpeBRepDS_Kind GT,const Standard_Integer G,const Standard_Real P);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	:rtype: float
") Parameter;
		Standard_Real Parameter ();
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	:param P:
	:type P: float
	:rtype: None
") Parameter;
		void Parameter (const Standard_Real P);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend TopOpeBRepDS_CurvePointInterference {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopOpeBRepDS_CurvePointInterference(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopOpeBRepDS_CurvePointInterference::Handle_TopOpeBRepDS_CurvePointInterference %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TopOpeBRepDS_CurvePointInterference;
class Handle_TopOpeBRepDS_CurvePointInterference : public Handle_TopOpeBRepDS_Interference {

    public:
        // constructors
        Handle_TopOpeBRepDS_CurvePointInterference();
        Handle_TopOpeBRepDS_CurvePointInterference(const Handle_TopOpeBRepDS_CurvePointInterference &aHandle);
        Handle_TopOpeBRepDS_CurvePointInterference(const TopOpeBRepDS_CurvePointInterference *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopOpeBRepDS_CurvePointInterference DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopOpeBRepDS_CurvePointInterference {
    TopOpeBRepDS_CurvePointInterference* _get_reference() {
    return (TopOpeBRepDS_CurvePointInterference*)$self->Access();
    }
};

%extend Handle_TopOpeBRepDS_CurvePointInterference {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopOpeBRepDS_CurvePointInterference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_PointData;
class TopOpeBRepDS_PointData : public TopOpeBRepDS_GeometryData {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_PointData;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepDS_PointData;
		 TopOpeBRepDS_PointData ();
		%feature("compactdefaultargs") TopOpeBRepDS_PointData;
		%feature("autodoc", "	:param P:
	:type P: TopOpeBRepDS_Point &
	:rtype: None
") TopOpeBRepDS_PointData;
		 TopOpeBRepDS_PointData (const TopOpeBRepDS_Point & P);
		%feature("compactdefaultargs") TopOpeBRepDS_PointData;
		%feature("autodoc", "	:param P:
	:type P: TopOpeBRepDS_Point &
	:param I1:
	:type I1: int
	:param I2:
	:type I2: int
	:rtype: None
") TopOpeBRepDS_PointData;
		 TopOpeBRepDS_PointData (const TopOpeBRepDS_Point & P,const Standard_Integer I1,const Standard_Integer I2);
		%feature("compactdefaultargs") SetShapes;
		%feature("autodoc", "	:param I1:
	:type I1: int
	:param I2:
	:type I2: int
	:rtype: None
") SetShapes;
		void SetShapes (const Standard_Integer I1,const Standard_Integer I2);
		%feature("compactdefaultargs") GetShapes;
		%feature("autodoc", "	:param I1:
	:type I1: int &
	:param I2:
	:type I2: int &
	:rtype: None
") GetShapes;
		void GetShapes (Standard_Integer &OutValue,Standard_Integer &OutValue);
};


%extend TopOpeBRepDS_PointData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_PointIterator;
class TopOpeBRepDS_PointIterator : public TopOpeBRepDS_InterferenceIterator {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_PointIterator;
		%feature("autodoc", "	* Creates an iterator on the points on curves described by the interferences in <L>.

	:param L:
	:type L: TopOpeBRepDS_ListOfInterference &
	:rtype: None
") TopOpeBRepDS_PointIterator;
		 TopOpeBRepDS_PointIterator (const TopOpeBRepDS_ListOfInterference & L);
		%feature("compactdefaultargs") MatchInterference;
		%feature("autodoc", "	* Returns True if the Interference <I> has a GeometryType() TopOpeBRepDS_POINT or TopOpeBRepDS_VERTEX returns False else.

	:param I:
	:type I: Handle_TopOpeBRepDS_Interference &
	:rtype: bool
") MatchInterference;
		virtual Standard_Boolean MatchInterference (const Handle_TopOpeBRepDS_Interference & I);
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "	* Index of the point in the data structure.

	:rtype: int
") Current;
		Standard_Integer Current ();
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "	:param S:
	:type S: TopAbs_State
	:rtype: TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation (const TopAbs_State S);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	:rtype: float
") Parameter;
		Standard_Real Parameter ();
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "	:rtype: bool
") IsVertex;
		Standard_Boolean IsVertex ();
		%feature("compactdefaultargs") IsPoint;
		%feature("autodoc", "	:rtype: bool
") IsPoint;
		Standard_Boolean IsPoint ();
		%feature("compactdefaultargs") DiffOriented;
		%feature("autodoc", "	:rtype: bool
") DiffOriented;
		Standard_Boolean DiffOriented ();
		%feature("compactdefaultargs") SameOriented;
		%feature("autodoc", "	:rtype: bool
") SameOriented;
		Standard_Boolean SameOriented ();
		%feature("compactdefaultargs") Support;
		%feature("autodoc", "	:rtype: int
") Support;
		Standard_Integer Support ();
};


%extend TopOpeBRepDS_PointIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_ShapeShapeInterference;
class TopOpeBRepDS_ShapeShapeInterference : public TopOpeBRepDS_Interference {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_ShapeShapeInterference;
		%feature("autodoc", "	* a shape interfers on shape <G> with shape <S>. examples : create a ShapeShapeInterference describing : vertex V of edge E1 found on edge E2 : ST,S,GT,G = TopOpeBRepDS_EDGE,E2,TopOpeBRepDS_VERTEX,V //! create a ShapeShapeInterference describing vertex V of edge E found on face F : ST,S,GT,G = TopOpeBRepDS_FACE,F,TopOpeBRepDS_VERTEX,V //! <GBound> indicates if shape <G> is a bound of shape <S>. //! <SCC> : UNSH_GEOMETRY : <S> and <Ancestor> have any types, <S> and <Ancestor> don't share the same geometry SAME_ORIENTED : <S> and <Ancestor> have identical types, <S> and <Ancestor> orientations are IDENTICAL. DIFF_ORIENTED : <S> and <Ancestor> have identical types, <S> and <Ancestor> orientations are DIFFERENT.

	:param T:
	:type T: TopOpeBRepDS_Transition &
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
	:rtype: None
") TopOpeBRepDS_ShapeShapeInterference;
		 TopOpeBRepDS_ShapeShapeInterference (const TopOpeBRepDS_Transition & T,const TopOpeBRepDS_Kind ST,const Standard_Integer S,const TopOpeBRepDS_Kind GT,const Standard_Integer G,const Standard_Boolean GBound,const TopOpeBRepDS_Config C);
		%feature("compactdefaultargs") Config;
		%feature("autodoc", "	:rtype: TopOpeBRepDS_Config
") Config;
		TopOpeBRepDS_Config Config ();
		%feature("compactdefaultargs") GBound;
		%feature("autodoc", "	:rtype: bool
") GBound;
		Standard_Boolean GBound ();
		%feature("compactdefaultargs") SetGBound;
		%feature("autodoc", "	:param b:
	:type b: bool
	:rtype: None
") SetGBound;
		void SetGBound (const Standard_Boolean b);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend TopOpeBRepDS_ShapeShapeInterference {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopOpeBRepDS_ShapeShapeInterference(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopOpeBRepDS_ShapeShapeInterference::Handle_TopOpeBRepDS_ShapeShapeInterference %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TopOpeBRepDS_ShapeShapeInterference;
class Handle_TopOpeBRepDS_ShapeShapeInterference : public Handle_TopOpeBRepDS_Interference {

    public:
        // constructors
        Handle_TopOpeBRepDS_ShapeShapeInterference();
        Handle_TopOpeBRepDS_ShapeShapeInterference(const Handle_TopOpeBRepDS_ShapeShapeInterference &aHandle);
        Handle_TopOpeBRepDS_ShapeShapeInterference(const TopOpeBRepDS_ShapeShapeInterference *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopOpeBRepDS_ShapeShapeInterference DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopOpeBRepDS_ShapeShapeInterference {
    TopOpeBRepDS_ShapeShapeInterference* _get_reference() {
    return (TopOpeBRepDS_ShapeShapeInterference*)$self->Access();
    }
};

%extend Handle_TopOpeBRepDS_ShapeShapeInterference {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopOpeBRepDS_ShapeShapeInterference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_SolidSurfaceInterference;
class TopOpeBRepDS_SolidSurfaceInterference : public TopOpeBRepDS_Interference {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_SolidSurfaceInterference;
		%feature("autodoc", "	:param Transition:
	:type Transition: TopOpeBRepDS_Transition &
	:param SupportType:
	:type SupportType: TopOpeBRepDS_Kind
	:param Support:
	:type Support: int
	:param GeometryType:
	:type GeometryType: TopOpeBRepDS_Kind
	:param Geometry:
	:type Geometry: int
	:rtype: None
") TopOpeBRepDS_SolidSurfaceInterference;
		 TopOpeBRepDS_SolidSurfaceInterference (const TopOpeBRepDS_Transition & Transition,const TopOpeBRepDS_Kind SupportType,const Standard_Integer Support,const TopOpeBRepDS_Kind GeometryType,const Standard_Integer Geometry);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend TopOpeBRepDS_SolidSurfaceInterference {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopOpeBRepDS_SolidSurfaceInterference(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopOpeBRepDS_SolidSurfaceInterference::Handle_TopOpeBRepDS_SolidSurfaceInterference %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TopOpeBRepDS_SolidSurfaceInterference;
class Handle_TopOpeBRepDS_SolidSurfaceInterference : public Handle_TopOpeBRepDS_Interference {

    public:
        // constructors
        Handle_TopOpeBRepDS_SolidSurfaceInterference();
        Handle_TopOpeBRepDS_SolidSurfaceInterference(const Handle_TopOpeBRepDS_SolidSurfaceInterference &aHandle);
        Handle_TopOpeBRepDS_SolidSurfaceInterference(const TopOpeBRepDS_SolidSurfaceInterference *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopOpeBRepDS_SolidSurfaceInterference DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopOpeBRepDS_SolidSurfaceInterference {
    TopOpeBRepDS_SolidSurfaceInterference* _get_reference() {
    return (TopOpeBRepDS_SolidSurfaceInterference*)$self->Access();
    }
};

%extend Handle_TopOpeBRepDS_SolidSurfaceInterference {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopOpeBRepDS_SolidSurfaceInterference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_SurfaceCurveInterference;
class TopOpeBRepDS_SurfaceCurveInterference : public TopOpeBRepDS_Interference {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_SurfaceCurveInterference;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepDS_SurfaceCurveInterference;
		 TopOpeBRepDS_SurfaceCurveInterference ();
		%feature("compactdefaultargs") TopOpeBRepDS_SurfaceCurveInterference;
		%feature("autodoc", "	:param Transition:
	:type Transition: TopOpeBRepDS_Transition &
	:param SupportType:
	:type SupportType: TopOpeBRepDS_Kind
	:param Support:
	:type Support: int
	:param GeometryType:
	:type GeometryType: TopOpeBRepDS_Kind
	:param Geometry:
	:type Geometry: int
	:param PC:
	:type PC: Handle_Geom2d_Curve &
	:rtype: None
") TopOpeBRepDS_SurfaceCurveInterference;
		 TopOpeBRepDS_SurfaceCurveInterference (const TopOpeBRepDS_Transition & Transition,const TopOpeBRepDS_Kind SupportType,const Standard_Integer Support,const TopOpeBRepDS_Kind GeometryType,const Standard_Integer Geometry,const Handle_Geom2d_Curve & PC);
		%feature("compactdefaultargs") TopOpeBRepDS_SurfaceCurveInterference;
		%feature("autodoc", "	:param I:
	:type I: Handle_TopOpeBRepDS_Interference &
	:rtype: None
") TopOpeBRepDS_SurfaceCurveInterference;
		 TopOpeBRepDS_SurfaceCurveInterference (const Handle_TopOpeBRepDS_Interference & I);
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", "	:rtype: Handle_Geom2d_Curve
") PCurve;
		Handle_Geom2d_Curve PCurve ();
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", "	:param PC:
	:type PC: Handle_Geom2d_Curve &
	:rtype: None
") PCurve;
		void PCurve (const Handle_Geom2d_Curve & PC);
		%feature("compactdefaultargs") DumpPCurve;
		%feature("autodoc", "	:param OS:
	:type OS: Standard_OStream &
	:param compact: default value is Standard_True
	:type compact: bool
	:rtype: Standard_OStream
") DumpPCurve;
		Standard_OStream & DumpPCurve (Standard_OStream & OS,const Standard_Boolean compact = Standard_True);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend TopOpeBRepDS_SurfaceCurveInterference {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopOpeBRepDS_SurfaceCurveInterference(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopOpeBRepDS_SurfaceCurveInterference::Handle_TopOpeBRepDS_SurfaceCurveInterference %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TopOpeBRepDS_SurfaceCurveInterference;
class Handle_TopOpeBRepDS_SurfaceCurveInterference : public Handle_TopOpeBRepDS_Interference {

    public:
        // constructors
        Handle_TopOpeBRepDS_SurfaceCurveInterference();
        Handle_TopOpeBRepDS_SurfaceCurveInterference(const Handle_TopOpeBRepDS_SurfaceCurveInterference &aHandle);
        Handle_TopOpeBRepDS_SurfaceCurveInterference(const TopOpeBRepDS_SurfaceCurveInterference *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopOpeBRepDS_SurfaceCurveInterference DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopOpeBRepDS_SurfaceCurveInterference {
    TopOpeBRepDS_SurfaceCurveInterference* _get_reference() {
    return (TopOpeBRepDS_SurfaceCurveInterference*)$self->Access();
    }
};

%extend Handle_TopOpeBRepDS_SurfaceCurveInterference {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopOpeBRepDS_SurfaceCurveInterference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_SurfaceData;
class TopOpeBRepDS_SurfaceData : public TopOpeBRepDS_GeometryData {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_SurfaceData;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepDS_SurfaceData;
		 TopOpeBRepDS_SurfaceData ();
		%feature("compactdefaultargs") TopOpeBRepDS_SurfaceData;
		%feature("autodoc", "	:param S:
	:type S: TopOpeBRepDS_Surface &
	:rtype: None
") TopOpeBRepDS_SurfaceData;
		 TopOpeBRepDS_SurfaceData (const TopOpeBRepDS_Surface & S);
};


%extend TopOpeBRepDS_SurfaceData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_SurfaceIterator;
class TopOpeBRepDS_SurfaceIterator : public TopOpeBRepDS_InterferenceIterator {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_SurfaceIterator;
		%feature("autodoc", "	* Creates an iterator on the Surfaces on solid described by the interferences in <L>.

	:param L:
	:type L: TopOpeBRepDS_ListOfInterference &
	:rtype: None
") TopOpeBRepDS_SurfaceIterator;
		 TopOpeBRepDS_SurfaceIterator (const TopOpeBRepDS_ListOfInterference & L);
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "	* Index of the surface in the data structure.

	:rtype: int
") Current;
		Standard_Integer Current ();
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "	:param S:
	:type S: TopAbs_State
	:rtype: TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation (const TopAbs_State S);
};


%extend TopOpeBRepDS_SurfaceIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_EdgeVertexInterference;
class TopOpeBRepDS_EdgeVertexInterference : public TopOpeBRepDS_ShapeShapeInterference {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_EdgeVertexInterference;
		%feature("autodoc", "	* Create an interference of VERTEX <G> on a crossed EDGE E. //! if support type <ST> == EDGE : <S> is edge E FACE : <S> is the face with bound E. <T> is the transition along the edge, crossing the crossed edge. E is the crossed edge. <GIsBound> indicates if <G> is a bound of the edge. <P> is the parameter of <G> on the edge. //! interference is stored in the list of interfs of the edge.

	:param T:
	:type T: TopOpeBRepDS_Transition &
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
	:rtype: None
") TopOpeBRepDS_EdgeVertexInterference;
		 TopOpeBRepDS_EdgeVertexInterference (const TopOpeBRepDS_Transition & T,const TopOpeBRepDS_Kind ST,const Standard_Integer S,const Standard_Integer G,const Standard_Boolean GIsBound,const TopOpeBRepDS_Config C,const Standard_Real P);
		%feature("compactdefaultargs") TopOpeBRepDS_EdgeVertexInterference;
		%feature("autodoc", "	* Create an interference of VERTEX <G> on crossed EDGE <S>. //! <T> is the transition along the edge, crossing the crossed edge. <S> is the crossed edge. <GIsBound> indicates if <G> is a bound of the edge. <C> indicates the geometric configuration between the edge and the crossed edge. <P> is the parameter of <G> on the edge. //! interference is stored in the list of interfs of the edge.

	:param T:
	:type T: TopOpeBRepDS_Transition &
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
	:rtype: None
") TopOpeBRepDS_EdgeVertexInterference;
		 TopOpeBRepDS_EdgeVertexInterference (const TopOpeBRepDS_Transition & T,const Standard_Integer S,const Standard_Integer G,const Standard_Boolean GIsBound,const TopOpeBRepDS_Config C,const Standard_Real P);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	:rtype: float
") Parameter;
		Standard_Real Parameter ();
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	:param P:
	:type P: float
	:rtype: None
") Parameter;
		void Parameter (const Standard_Real P);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend TopOpeBRepDS_EdgeVertexInterference {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopOpeBRepDS_EdgeVertexInterference(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopOpeBRepDS_EdgeVertexInterference::Handle_TopOpeBRepDS_EdgeVertexInterference %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TopOpeBRepDS_EdgeVertexInterference;
class Handle_TopOpeBRepDS_EdgeVertexInterference : public Handle_TopOpeBRepDS_ShapeShapeInterference {

    public:
        // constructors
        Handle_TopOpeBRepDS_EdgeVertexInterference();
        Handle_TopOpeBRepDS_EdgeVertexInterference(const Handle_TopOpeBRepDS_EdgeVertexInterference &aHandle);
        Handle_TopOpeBRepDS_EdgeVertexInterference(const TopOpeBRepDS_EdgeVertexInterference *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopOpeBRepDS_EdgeVertexInterference DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopOpeBRepDS_EdgeVertexInterference {
    TopOpeBRepDS_EdgeVertexInterference* _get_reference() {
    return (TopOpeBRepDS_EdgeVertexInterference*)$self->Access();
    }
};

%extend Handle_TopOpeBRepDS_EdgeVertexInterference {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopOpeBRepDS_EdgeVertexInterference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepDS_FaceEdgeInterference;
class TopOpeBRepDS_FaceEdgeInterference : public TopOpeBRepDS_ShapeShapeInterference {
	public:
		%feature("compactdefaultargs") TopOpeBRepDS_FaceEdgeInterference;
		%feature("autodoc", "	* Create an interference of EDGE <G> on FACE <S>.

	:param T:
	:type T: TopOpeBRepDS_Transition &
	:param S:
	:type S: int
	:param G:
	:type G: int
	:param GIsBound:
	:type GIsBound: bool
	:param C:
	:type C: TopOpeBRepDS_Config
	:rtype: None
") TopOpeBRepDS_FaceEdgeInterference;
		 TopOpeBRepDS_FaceEdgeInterference (const TopOpeBRepDS_Transition & T,const Standard_Integer S,const Standard_Integer G,const Standard_Boolean GIsBound,const TopOpeBRepDS_Config C);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend TopOpeBRepDS_FaceEdgeInterference {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopOpeBRepDS_FaceEdgeInterference(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopOpeBRepDS_FaceEdgeInterference::Handle_TopOpeBRepDS_FaceEdgeInterference %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TopOpeBRepDS_FaceEdgeInterference;
class Handle_TopOpeBRepDS_FaceEdgeInterference : public Handle_TopOpeBRepDS_ShapeShapeInterference {

    public:
        // constructors
        Handle_TopOpeBRepDS_FaceEdgeInterference();
        Handle_TopOpeBRepDS_FaceEdgeInterference(const Handle_TopOpeBRepDS_FaceEdgeInterference &aHandle);
        Handle_TopOpeBRepDS_FaceEdgeInterference(const TopOpeBRepDS_FaceEdgeInterference *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopOpeBRepDS_FaceEdgeInterference DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopOpeBRepDS_FaceEdgeInterference {
    TopOpeBRepDS_FaceEdgeInterference* _get_reference() {
    return (TopOpeBRepDS_FaceEdgeInterference*)$self->Access();
    }
};

%extend Handle_TopOpeBRepDS_FaceEdgeInterference {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopOpeBRepDS_FaceEdgeInterference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
