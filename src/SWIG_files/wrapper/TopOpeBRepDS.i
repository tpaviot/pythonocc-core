/*
Copyright 2008-2014 Thomas Paviot (tpaviot@gmail.com)


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
%include ../common/StandardDefines.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i

%include TopOpeBRepDS_headers.i

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
%nodefaultctor TopOpeBRepDS;
class TopOpeBRepDS {
	public:
		%feature("autodoc", "Args:
	S(TopAbs_State)

Returns:
	static TCollection_AsciiString

IN OU ON UN") SPrint;
		static TCollection_AsciiString SPrint (const TopAbs_State S);
		%feature("autodoc", "Args:
	S(TopAbs_State)
	OS(Standard_OStream)

Returns:
	static Standard_OStream

No detailed docstring for this function.") Print;
		static Standard_OStream & Print (const TopAbs_State S,Standard_OStream & OS);
		%feature("autodoc", "Args:
	K(TopOpeBRepDS_Kind)

Returns:
	static TCollection_AsciiString

<K>") SPrint;
		static TCollection_AsciiString SPrint (const TopOpeBRepDS_Kind K);
		%feature("autodoc", "Args:
	K(TopOpeBRepDS_Kind)
	I(Standard_Integer)
	B(TCollection_AsciiString)=
	A(TCollection_AsciiString)=

Returns:
	static TCollection_AsciiString

S1(<K>,<I>)S2") SPrint;
		static TCollection_AsciiString SPrint (const TopOpeBRepDS_Kind K,const Standard_Integer I,const TCollection_AsciiString & B = "",const TCollection_AsciiString & A = "");
		%feature("autodoc", "Args:
	K(TopOpeBRepDS_Kind)
	S(Standard_OStream)

Returns:
	static Standard_OStream

No detailed docstring for this function.") Print;
		static Standard_OStream & Print (const TopOpeBRepDS_Kind K,Standard_OStream & S);
		%feature("autodoc", "Args:
	K(TopOpeBRepDS_Kind)
	I(Standard_Integer)
	S(Standard_OStream)
	B(TCollection_AsciiString)=
	A(TCollection_AsciiString)=

Returns:
	static Standard_OStream

No detailed docstring for this function.") Print;
		static Standard_OStream & Print (const TopOpeBRepDS_Kind K,const Standard_Integer I,Standard_OStream & S,const TCollection_AsciiString & B = "",const TCollection_AsciiString & A = "");
		%feature("autodoc", "Args:
	T(TopAbs_ShapeEnum)

Returns:
	static TCollection_AsciiString

No detailed docstring for this function.") SPrint;
		static TCollection_AsciiString SPrint (const TopAbs_ShapeEnum T);
		%feature("autodoc", "Args:
	T(TopAbs_ShapeEnum)
	I(Standard_Integer)

Returns:
	static TCollection_AsciiString

(<T>,<I>)") SPrint;
		static TCollection_AsciiString SPrint (const TopAbs_ShapeEnum T,const Standard_Integer I);
		%feature("autodoc", "Args:
	T(TopAbs_ShapeEnum)
	I(Standard_Integer)
	S(Standard_OStream)

Returns:
	static Standard_OStream

No detailed docstring for this function.") Print;
		static Standard_OStream & Print (const TopAbs_ShapeEnum T,const Standard_Integer I,Standard_OStream & S);
		%feature("autodoc", "Args:
	O(TopAbs_Orientation)

Returns:
	static TCollection_AsciiString

No detailed docstring for this function.") SPrint;
		static TCollection_AsciiString SPrint (const TopAbs_Orientation O);
		%feature("autodoc", "Args:
	C(TopOpeBRepDS_Config)

Returns:
	static TCollection_AsciiString

No detailed docstring for this function.") SPrint;
		static TCollection_AsciiString SPrint (const TopOpeBRepDS_Config C);
		%feature("autodoc", "Args:
	C(TopOpeBRepDS_Config)
	S(Standard_OStream)

Returns:
	static Standard_OStream

No detailed docstring for this function.") Print;
		static Standard_OStream & Print (const TopOpeBRepDS_Config C,Standard_OStream & S);
		%feature("autodoc", "Args:
	K(TopOpeBRepDS_Kind)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsGeometry;
		static Standard_Boolean IsGeometry (const TopOpeBRepDS_Kind K);
		%feature("autodoc", "Args:
	K(TopOpeBRepDS_Kind)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsTopology;
		static Standard_Boolean IsTopology (const TopOpeBRepDS_Kind K);
		%feature("autodoc", "Args:
	K(TopOpeBRepDS_Kind)

Returns:
	static TopAbs_ShapeEnum

No detailed docstring for this function.") KindToShape;
		static TopAbs_ShapeEnum KindToShape (const TopOpeBRepDS_Kind K);
		%feature("autodoc", "Args:
	S(TopAbs_ShapeEnum)

Returns:
	static TopOpeBRepDS_Kind

No detailed docstring for this function.") ShapeToKind;
		static TopOpeBRepDS_Kind ShapeToKind (const TopAbs_ShapeEnum S);
};


%feature("shadow") TopOpeBRepDS::~TopOpeBRepDS %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_Array1OfDataMapOfIntegerListOfInterference;
class TopOpeBRepDS_Array1OfDataMapOfIntegerListOfInterference {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_Array1OfDataMapOfIntegerListOfInterference;
		 TopOpeBRepDS_Array1OfDataMapOfIntegerListOfInterference (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(TopOpeBRepDS_DataMapOfIntegerListOfInterference)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_Array1OfDataMapOfIntegerListOfInterference;
		 TopOpeBRepDS_Array1OfDataMapOfIntegerListOfInterference (const TopOpeBRepDS_DataMapOfIntegerListOfInterference & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(TopOpeBRepDS_DataMapOfIntegerListOfInterference)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const TopOpeBRepDS_DataMapOfIntegerListOfInterference & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "Args:
	Other(TopOpeBRepDS_Array1OfDataMapOfIntegerListOfInterference)

Returns:
	TopOpeBRepDS_Array1OfDataMapOfIntegerListOfInterference

No detailed docstring for this function.") Assign;
		const TopOpeBRepDS_Array1OfDataMapOfIntegerListOfInterference & Assign (const TopOpeBRepDS_Array1OfDataMapOfIntegerListOfInterference & Other);
		%feature("autodoc", "Args:
	Other(TopOpeBRepDS_Array1OfDataMapOfIntegerListOfInterference)

Returns:
	TopOpeBRepDS_Array1OfDataMapOfIntegerListOfInterference

No detailed docstring for this function.") operator=;
		const TopOpeBRepDS_Array1OfDataMapOfIntegerListOfInterference & operator = (const TopOpeBRepDS_Array1OfDataMapOfIntegerListOfInterference & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(TopOpeBRepDS_DataMapOfIntegerListOfInterference)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const TopOpeBRepDS_DataMapOfIntegerListOfInterference & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TopOpeBRepDS_DataMapOfIntegerListOfInterference

No detailed docstring for this function.") Value;
		const TopOpeBRepDS_DataMapOfIntegerListOfInterference & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TopOpeBRepDS_DataMapOfIntegerListOfInterference

No detailed docstring for this function.") ChangeValue;
		TopOpeBRepDS_DataMapOfIntegerListOfInterference & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") TopOpeBRepDS_Array1OfDataMapOfIntegerListOfInterference::~TopOpeBRepDS_Array1OfDataMapOfIntegerListOfInterference %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_Array1OfDataMapOfIntegerListOfInterference {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_Association;
class TopOpeBRepDS_Association : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_Association;
		 TopOpeBRepDS_Association ();
		%feature("autodoc", "Args:
	I(Handle_TopOpeBRepDS_Interference)
	K(Handle_TopOpeBRepDS_Interference)

Returns:
	None

No detailed docstring for this function.") Associate;
		void Associate (const Handle_TopOpeBRepDS_Interference & I,const Handle_TopOpeBRepDS_Interference & K);
		%feature("autodoc", "Args:
	I(Handle_TopOpeBRepDS_Interference)
	LI(TopOpeBRepDS_ListOfInterference)

Returns:
	None

No detailed docstring for this function.") Associate;
		void Associate (const Handle_TopOpeBRepDS_Interference & I,const TopOpeBRepDS_ListOfInterference & LI);
		%feature("autodoc", "Args:
	I(Handle_TopOpeBRepDS_Interference)

Returns:
	Standard_Boolean

No detailed docstring for this function.") HasAssociation;
		Standard_Boolean HasAssociation (const Handle_TopOpeBRepDS_Interference & I);
		%feature("autodoc", "Args:
	I(Handle_TopOpeBRepDS_Interference)

Returns:
	TopOpeBRepDS_ListOfInterference

No detailed docstring for this function.") Associated;
		TopOpeBRepDS_ListOfInterference & Associated (const Handle_TopOpeBRepDS_Interference & I);
		%feature("autodoc", "Args:
	I(Handle_TopOpeBRepDS_Interference)
	K(Handle_TopOpeBRepDS_Interference)

Returns:
	Standard_Boolean

No detailed docstring for this function.") AreAssociated;
		Standard_Boolean AreAssociated (const Handle_TopOpeBRepDS_Interference & I,const Handle_TopOpeBRepDS_Interference & K);
};


%feature("shadow") TopOpeBRepDS_Association::~TopOpeBRepDS_Association %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_Association {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopOpeBRepDS_Association {
	Handle_TopOpeBRepDS_Association GetHandle() {
	return *(Handle_TopOpeBRepDS_Association*) &$self;
	}
};

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
    TopOpeBRepDS_Association* GetObject() {
    return (TopOpeBRepDS_Association*)$self->Access();
    }
};
%feature("shadow") Handle_TopOpeBRepDS_Association::~Handle_TopOpeBRepDS_Association %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopOpeBRepDS_Association {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopOpeBRepDS_BuildTool;
class TopOpeBRepDS_BuildTool {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_BuildTool;
		 TopOpeBRepDS_BuildTool ();
		%feature("autodoc", "Args:
	OutCurveType(TopOpeBRepTool_OutCurveType)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_BuildTool;
		 TopOpeBRepDS_BuildTool (const TopOpeBRepTool_OutCurveType OutCurveType);
		%feature("autodoc", "Args:
	GT(TopOpeBRepTool_GeomTool)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_BuildTool;
		 TopOpeBRepDS_BuildTool (const TopOpeBRepTool_GeomTool & GT);
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepTool_GeomTool

No detailed docstring for this function.") GetGeomTool;
		const TopOpeBRepTool_GeomTool & GetGeomTool ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepTool_GeomTool

No detailed docstring for this function.") ChangeGeomTool;
		TopOpeBRepTool_GeomTool & ChangeGeomTool ();
		%feature("autodoc", "Args:
	V(TopoDS_Shape)
	P(TopOpeBRepDS_Point)

Returns:
	None

No detailed docstring for this function.") MakeVertex;
		void MakeVertex (TopoDS_Shape & V,const TopOpeBRepDS_Point & P);
		%feature("autodoc", "Args:
	E(TopoDS_Shape)
	C(TopOpeBRepDS_Curve)

Returns:
	None

No detailed docstring for this function.") MakeEdge;
		void MakeEdge (TopoDS_Shape & E,const TopOpeBRepDS_Curve & C);
		%feature("autodoc", "Args:
	E(TopoDS_Shape)
	C(TopOpeBRepDS_Curve)
	DS(TopOpeBRepDS_DataStructure)

Returns:
	None

No detailed docstring for this function.") MakeEdge;
		void MakeEdge (TopoDS_Shape & E,const TopOpeBRepDS_Curve & C,const TopOpeBRepDS_DataStructure & DS);
		%feature("autodoc", "Args:
	E(TopoDS_Shape)
	C(Handle_Geom_Curve)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") MakeEdge;
		void MakeEdge (TopoDS_Shape & E,const Handle_Geom_Curve & C,const Standard_Real Tol);
		%feature("autodoc", "Args:
	E(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") MakeEdge;
		void MakeEdge (TopoDS_Shape & E);
		%feature("autodoc", "Args:
	W(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") MakeWire;
		void MakeWire (TopoDS_Shape & W);
		%feature("autodoc", "Args:
	F(TopoDS_Shape)
	S(TopOpeBRepDS_Surface)

Returns:
	None

No detailed docstring for this function.") MakeFace;
		void MakeFace (TopoDS_Shape & F,const TopOpeBRepDS_Surface & S);
		%feature("autodoc", "Args:
	Sh(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") MakeShell;
		void MakeShell (TopoDS_Shape & Sh);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") MakeSolid;
		void MakeSolid (TopoDS_Shape & S);
		%feature("autodoc", "Args:
	Ein(TopoDS_Shape)
	Eou(TopoDS_Shape)

Returns:
	None

Make an edge <Eou> with the curve of the edge <Ein>") CopyEdge;
		void CopyEdge (const TopoDS_Shape & Ein,TopoDS_Shape & Eou);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	Vmin(TopoDS_Vertex)
	Vmax(TopoDS_Vertex)
	Parmin(Standard_Real)
	Parmax(Standard_Real)

Returns:
	None

No detailed docstring for this function.") GetOrientedEdgeVertices;
		void GetOrientedEdgeVertices (TopoDS_Edge & E,TopoDS_Vertex & Vmin,TopoDS_Vertex & Vmax,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	F1(TopoDS_Face)
	F2(TopoDS_Face)
	E(TopoDS_Edge)
	C3Dnew(Handle_Geom_Curve)
	tol3d(Standard_Real)
	tol2d1(Standard_Real)
	tol2d2(Standard_Real)
	newtol(Standard_Real)
	newparmin(Standard_Real)
	newparmax(Standard_Real)

Returns:
	None

No detailed docstring for this function.") UpdateEdgeCurveTol;
		void UpdateEdgeCurveTol (const TopoDS_Face & F1,const TopoDS_Face & F2,TopoDS_Edge & E,const Handle_Geom_Curve & C3Dnew,const Standard_Real tol3d,const Standard_Real tol2d1,const Standard_Real tol2d2,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	C(TopOpeBRepDS_Curve)
	E(TopoDS_Edge)
	inewC(Standard_Integer)
	HDS(Handle_TopOpeBRepDS_HDataStructure)

Returns:
	None

No detailed docstring for this function.") ApproxCurves;
		void ApproxCurves (const TopOpeBRepDS_Curve & C,TopoDS_Edge & E,Standard_Integer &OutValue,const Handle_TopOpeBRepDS_HDataStructure & HDS);
		%feature("autodoc", "Args:
	C(TopOpeBRepDS_Curve)
	E(TopoDS_Edge)
	newC(TopOpeBRepDS_Curve)
	CompPC1(Standard_Boolean)
	CompPC2(Standard_Boolean)
	CompC3D(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") ComputePCurves;
		void ComputePCurves (const TopOpeBRepDS_Curve & C,TopoDS_Edge & E,TopOpeBRepDS_Curve & newC,const Standard_Boolean CompPC1,const Standard_Boolean CompPC2,const Standard_Boolean CompC3D);
		%feature("autodoc", "Args:
	newC(TopOpeBRepDS_Curve)
	E(TopoDS_Edge)
	CompPC1(Standard_Boolean)
	CompPC2(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") PutPCurves;
		void PutPCurves (const TopOpeBRepDS_Curve & newC,TopoDS_Edge & E,const Standard_Boolean CompPC1,const Standard_Boolean CompPC2);
		%feature("autodoc", "Args:
	C(TopOpeBRepDS_Curve)
	oldE(TopoDS_Edge)
	E(TopoDS_Edge)
	inewC(Standard_Integer)
	HDS(Handle_TopOpeBRepDS_HDataStructure)

Returns:
	None

No detailed docstring for this function.") RecomputeCurves;
		void RecomputeCurves (const TopOpeBRepDS_Curve & C,const TopoDS_Edge & oldE,TopoDS_Edge & E,Standard_Integer &OutValue,const Handle_TopOpeBRepDS_HDataStructure & HDS);
		%feature("autodoc", "Args:
	Fin(TopoDS_Shape)
	Fou(TopoDS_Shape)

Returns:
	None

Make a face <Fou> with the surface of the face <Fin>") CopyFace;
		void CopyFace (const TopoDS_Shape & Fin,TopoDS_Shape & Fou);
		%feature("autodoc", "Args:
	Ein(TopoDS_Shape)
	Eou(TopoDS_Shape)
	V(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") AddEdgeVertex;
		void AddEdgeVertex (const TopoDS_Shape & Ein,TopoDS_Shape & Eou,const TopoDS_Shape & V);
		%feature("autodoc", "Args:
	E(TopoDS_Shape)
	V(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") AddEdgeVertex;
		void AddEdgeVertex (TopoDS_Shape & E,const TopoDS_Shape & V);
		%feature("autodoc", "Args:
	W(TopoDS_Shape)
	E(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") AddWireEdge;
		void AddWireEdge (TopoDS_Shape & W,const TopoDS_Shape & E);
		%feature("autodoc", "Args:
	F(TopoDS_Shape)
	W(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") AddFaceWire;
		void AddFaceWire (TopoDS_Shape & F,const TopoDS_Shape & W);
		%feature("autodoc", "Args:
	Sh(TopoDS_Shape)
	F(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") AddShellFace;
		void AddShellFace (TopoDS_Shape & Sh,const TopoDS_Shape & F);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	Sh(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") AddSolidShell;
		void AddSolidShell (TopoDS_Shape & S,const TopoDS_Shape & Sh);
		%feature("autodoc", "Args:
	E(TopoDS_Shape)
	V(TopoDS_Shape)
	P(Standard_Real)

Returns:
	None

Sets the parameter <P>  for  the vertex <V> on the  
         edge <E>.") Parameter;
		void Parameter (const TopoDS_Shape & E,const TopoDS_Shape & V,const Standard_Real P);
		%feature("autodoc", "Args:
	E(TopoDS_Shape)
	first(Standard_Real)
	last(Standard_Real)

Returns:
	None

Sets the range of edge <E>.") Range;
		void Range (const TopoDS_Shape & E,const Standard_Real first,const Standard_Real last);
		%feature("autodoc", "Args:
	Ein(TopoDS_Shape)
	Eou(TopoDS_Shape)

Returns:
	None

Sets the range of edge <Eou> from <Ein>  
         only when <Ein> has a closed geometry.") UpdateEdge;
		void UpdateEdge (const TopoDS_Shape & Ein,TopoDS_Shape & Eou);
		%feature("autodoc", "Args:
	C(TopOpeBRepDS_Curve)
	E(TopoDS_Shape)
	V(TopoDS_Shape)

Returns:
	None

Compute the parameter of  the vertex <V>, supported  
         by   the edge <E>, on the curve  <C>.") Parameter;
		void Parameter (const TopOpeBRepDS_Curve & C,TopoDS_Shape & E,TopoDS_Shape & V);
		%feature("autodoc", "Args:
	E(TopoDS_Shape)
	C(Handle_Geom_Curve)
	Tol(Standard_Real)

Returns:
	None

Sets the  curve <C> for the edge  <E>") Curve3D;
		void Curve3D (TopoDS_Shape & E,const Handle_Geom_Curve & C,const Standard_Real Tol);
		%feature("autodoc", "Args:
	F(TopoDS_Shape)
	E(TopoDS_Shape)
	C(Handle_Geom2d_Curve)

Returns:
	None

Sets  the pcurve <C> for  the edge <E> on the face  
         <F>.  If OverWrite is True the old pcurve if there  
         is one  is overwritten, else the  two  pcurves are  
         set.") PCurve;
		void PCurve (TopoDS_Shape & F,TopoDS_Shape & E,const Handle_Geom2d_Curve & C);
		%feature("autodoc", "Args:
	F(TopoDS_Shape)
	E(TopoDS_Shape)
	CDS(TopOpeBRepDS_Curve)
	C(Handle_Geom2d_Curve)

Returns:
	None

No detailed docstring for this function.") PCurve;
		void PCurve (TopoDS_Shape & F,TopoDS_Shape & E,const TopOpeBRepDS_Curve & CDS,const Handle_Geom2d_Curve & C);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	O(TopAbs_Orientation)

Returns:
	None

No detailed docstring for this function.") Orientation;
		void Orientation (TopoDS_Shape & S,const TopAbs_Orientation O);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	TopAbs_Orientation

No detailed docstring for this function.") Orientation;
		TopAbs_Orientation Orientation (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") Closed;
		void Closed (TopoDS_Shape & S,const Standard_Boolean B);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") Approximation;
		Standard_Boolean Approximation ();
		%feature("autodoc", "Args:
	F(TopoDS_Shape)
	SU(Handle_Geom_Surface)

Returns:
	None

No detailed docstring for this function.") UpdateSurface;
		void UpdateSurface (const TopoDS_Shape & F,const Handle_Geom_Surface & SU);
		%feature("autodoc", "Args:
	E(TopoDS_Shape)
	oldF(TopoDS_Shape)
	newF(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") UpdateSurface;
		void UpdateSurface (const TopoDS_Shape & E,const TopoDS_Shape & oldF,const TopoDS_Shape & newF);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") OverWrite;
		Standard_Boolean OverWrite ();
		%feature("autodoc", "Args:
	O(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") OverWrite;
		void OverWrite (const Standard_Boolean O);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") Translate;
		Standard_Boolean Translate ();
		%feature("autodoc", "Args:
	T(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") Translate;
		void Translate (const Standard_Boolean T);
};


%feature("shadow") TopOpeBRepDS_BuildTool::~TopOpeBRepDS_BuildTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_BuildTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_Check;
class TopOpeBRepDS_Check : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_Check;
		 TopOpeBRepDS_Check ();
		%feature("autodoc", "Args:
	HDS(Handle_TopOpeBRepDS_HDataStructure)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_Check;
		 TopOpeBRepDS_Check (const Handle_TopOpeBRepDS_HDataStructure & HDS);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Check integrition of DS") ChkIntg;
		Standard_Boolean ChkIntg ();
		%feature("autodoc", "Args:
	LI(TopOpeBRepDS_ListOfInterference)

Returns:
	Standard_Boolean

Check integrition of interferences  
         (les supports et les geometries de LI)") ChkIntgInterf;
		Standard_Boolean ChkIntgInterf (const TopOpeBRepDS_ListOfInterference & LI);
		%feature("autodoc", "Args:
	i(Standard_Integer)
	K(TopOpeBRepDS_Kind)

Returns:
	Standard_Boolean

Verifie que le ieme element de la DS existe, et  
         pour un K de type topologique, verifie qu'il est du  
         bon type (VERTEX, EDGE, WIRE, FACE, SHELL ou SOLID)") CheckDS;
		Standard_Boolean CheckDS (const Standard_Integer i,const TopOpeBRepDS_Kind K);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Check integrition des champs SameDomain de la DS") ChkIntgSamDom;
		Standard_Boolean ChkIntgSamDom ();
		%feature("autodoc", "Args:
	LS(TopTools_ListOfShape)

Returns:
	Standard_Boolean

Verifie que les Shapes existent bien dans la DS  
         Utile pour les Shapes SameDomain  
         si la liste est vide, renvoie vrai") CheckShapes;
		Standard_Boolean CheckShapes (const TopTools_ListOfShape & LS);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Verifie que les Vertex   non   SameDomain sont bien  
          nonSameDomain, que  les  vertex sameDomain sont  bien  
         SameDomain,  que    les  Points sont  non    confondus  
          ni entre eux, ni avec des Vertex.") OneVertexOnPnt;
		Standard_Boolean OneVertexOnPnt ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopOpeBRepDS_HDataStructure

No detailed docstring for this function.") HDS;
		const Handle_TopOpeBRepDS_HDataStructure & HDS ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopOpeBRepDS_HDataStructure

No detailed docstring for this function.") ChangeHDS;
		Handle_TopOpeBRepDS_HDataStructure & ChangeHDS ();
		%feature("autodoc", "Args:
	S(Standard_OStream)

Returns:
	Standard_OStream

No detailed docstring for this function.") PrintIntg;
		Standard_OStream & PrintIntg (Standard_OStream & S);
		%feature("autodoc", "Args:
	stat(TopOpeBRepDS_CheckStatus)
	S(Standard_OStream)

Returns:
	Standard_OStream

Prints the name  of CheckStatus  <stat>  as  a String") Print;
		Standard_OStream & Print (const TopOpeBRepDS_CheckStatus stat,Standard_OStream & S);
		%feature("autodoc", "Args:
	SE(TopAbs_ShapeEnum)
	S(Standard_OStream)

Returns:
	Standard_OStream

Prints the name  of CheckStatus  <stat>  as  a String") PrintShape;
		Standard_OStream & PrintShape (const TopAbs_ShapeEnum SE,Standard_OStream & S);
		%feature("autodoc", "Args:
	index(Standard_Integer)
	S(Standard_OStream)

Returns:
	Standard_OStream

Prints the name  of CheckStatus  <stat>  as  a String") PrintShape;
		Standard_OStream & PrintShape (const Standard_Integer index,Standard_OStream & S);
};


%feature("shadow") TopOpeBRepDS_Check::~TopOpeBRepDS_Check %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_Check {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopOpeBRepDS_Check {
	Handle_TopOpeBRepDS_Check GetHandle() {
	return *(Handle_TopOpeBRepDS_Check*) &$self;
	}
};

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
    TopOpeBRepDS_Check* GetObject() {
    return (TopOpeBRepDS_Check*)$self->Access();
    }
};
%feature("shadow") Handle_TopOpeBRepDS_Check::~Handle_TopOpeBRepDS_Check %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopOpeBRepDS_Check {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopOpeBRepDS_Curve;
class TopOpeBRepDS_Curve {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_Curve;
		 TopOpeBRepDS_Curve ();
		%feature("autodoc", "Args:
	P(Handle_Geom_Curve)
	T(Standard_Real)
	IsWalk(Standard_Boolean)=Standard_False

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_Curve;
		 TopOpeBRepDS_Curve (const Handle_Geom_Curve & P,const Standard_Real T,const Standard_Boolean IsWalk = Standard_False);
		%feature("autodoc", "Args:
	P(Handle_Geom_Curve)
	T(Standard_Real)
	IsWalk(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") DefineCurve;
		void DefineCurve (const Handle_Geom_Curve & P,const Standard_Real T,const Standard_Boolean IsWalk);
		%feature("autodoc", "Args:
	tol(Standard_Real)

Returns:
	None

Update the tolerance") Tolerance;
		void Tolerance (const Standard_Real tol);
		%feature("autodoc", "Args:
	I1(Handle_TopOpeBRepDS_Interference)
	I2(Handle_TopOpeBRepDS_Interference)

Returns:
	None

define the interferences face/curve.") SetSCI;
		void SetSCI (const Handle_TopOpeBRepDS_Interference & I1,const Handle_TopOpeBRepDS_Interference & I2);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopOpeBRepDS_Interference

No detailed docstring for this function.") GetSCI1;
		const Handle_TopOpeBRepDS_Interference & GetSCI1 ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopOpeBRepDS_Interference

No detailed docstring for this function.") GetSCI2;
		const Handle_TopOpeBRepDS_Interference & GetSCI2 ();
		%feature("autodoc", "Args:
	I1(Handle_TopOpeBRepDS_Interference)
	I2(Handle_TopOpeBRepDS_Interference)

Returns:
	None

No detailed docstring for this function.") GetSCI;
		void GetSCI (Handle_TopOpeBRepDS_Interference & I1,Handle_TopOpeBRepDS_Interference & I2);
		%feature("autodoc", "Args:
	S1(TopoDS_Shape)
	S2(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") SetShapes;
		void SetShapes (const TopoDS_Shape & S1,const TopoDS_Shape & S2);
		%feature("autodoc", "Args:
	S1(TopoDS_Shape)
	S2(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") GetShapes;
		void GetShapes (TopoDS_Shape & S1,TopoDS_Shape & S2);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Shape1;
		const TopoDS_Shape & Shape1 ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") ChangeShape1;
		TopoDS_Shape & ChangeShape1 ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Shape2;
		const TopoDS_Shape & Shape2 ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") ChangeShape2;
		TopoDS_Shape & ChangeShape2 ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Curve

No detailed docstring for this function.") Curve;
		const Handle_Geom_Curve & Curve ();
		%feature("autodoc", "Args:
	First(Standard_Real)
	Last(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetRange;
		void SetRange (const Standard_Real First,const Standard_Real Last);
		%feature("autodoc", "Args:
	First(Standard_Real)
	Last(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Range;
		Standard_Boolean Range (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Tolerance;
		Standard_Real Tolerance ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Curve

No detailed docstring for this function.") ChangeCurve;
		Handle_Geom_Curve & ChangeCurve ();
		%feature("autodoc", "Args:
	C3D(Handle_Geom_Curve)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Curve;
		void Curve (const Handle_Geom_Curve & C3D,const Standard_Real Tol);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_Curve

No detailed docstring for this function.") Curve1;
		const Handle_Geom2d_Curve & Curve1 ();
		%feature("autodoc", "Args:
	PC1(Handle_Geom2d_Curve)

Returns:
	None

No detailed docstring for this function.") Curve1;
		void Curve1 (const Handle_Geom2d_Curve & PC1);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_Curve

No detailed docstring for this function.") Curve2;
		const Handle_Geom2d_Curve & Curve2 ();
		%feature("autodoc", "Args:
	PC2(Handle_Geom2d_Curve)

Returns:
	None

No detailed docstring for this function.") Curve2;
		void Curve2 (const Handle_Geom2d_Curve & PC2);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsWalk;
		Standard_Boolean IsWalk ();
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") ChangeIsWalk;
		void ChangeIsWalk (const Standard_Boolean B);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") Keep;
		Standard_Boolean Keep ();
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") ChangeKeep;
		void ChangeKeep (const Standard_Boolean B);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Mother;
		Standard_Integer Mother ();
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ChangeMother;
		void ChangeMother (const Standard_Integer I);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") DSIndex;
		Standard_Integer DSIndex ();
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ChangeDSIndex;
		void ChangeDSIndex (const Standard_Integer I);
		%feature("autodoc", "Args:
	OS(Standard_OStream)
	index(Standard_Integer)
	compact(Standard_Boolean)=Standard_True

Returns:
	Standard_OStream

No detailed docstring for this function.") Dump;
		Standard_OStream & Dump (Standard_OStream & OS,const Standard_Integer index,const Standard_Boolean compact = Standard_True);
};


%feature("shadow") TopOpeBRepDS_Curve::~TopOpeBRepDS_Curve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_Curve {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_CurveExplorer;
class TopOpeBRepDS_CurveExplorer {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_CurveExplorer;
		 TopOpeBRepDS_CurveExplorer ();
		%feature("autodoc", "Args:
	DS(TopOpeBRepDS_DataStructure)
	FindOnlyKeep(Standard_Boolean)=Standard_True

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_CurveExplorer;
		 TopOpeBRepDS_CurveExplorer (const TopOpeBRepDS_DataStructure & DS,const Standard_Boolean FindOnlyKeep = Standard_True);
		%feature("autodoc", "Args:
	DS(TopOpeBRepDS_DataStructure)
	FindOnlyKeep(Standard_Boolean)=Standard_True

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const TopOpeBRepDS_DataStructure & DS,const Standard_Boolean FindOnlyKeep = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepDS_Curve

No detailed docstring for this function.") Curve;
		const TopOpeBRepDS_Curve & Curve ();
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsCurve;
		Standard_Boolean IsCurve (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsCurveKeep;
		Standard_Boolean IsCurveKeep (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopOpeBRepDS_Curve

No detailed docstring for this function.") Curve;
		const TopOpeBRepDS_Curve & Curve (const Standard_Integer I);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbCurve;
		Standard_Integer NbCurve ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Index;
		Standard_Integer Index ();
};


%feature("shadow") TopOpeBRepDS_CurveExplorer::~TopOpeBRepDS_CurveExplorer %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_CurveExplorer {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_DataMapIteratorOfDataMapOfCheckStatus;
class TopOpeBRepDS_DataMapIteratorOfDataMapOfCheckStatus : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_DataMapIteratorOfDataMapOfCheckStatus;
		 TopOpeBRepDS_DataMapIteratorOfDataMapOfCheckStatus ();
		%feature("autodoc", "Args:
	aMap(TopOpeBRepDS_DataMapOfCheckStatus)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_DataMapIteratorOfDataMapOfCheckStatus;
		 TopOpeBRepDS_DataMapIteratorOfDataMapOfCheckStatus (const TopOpeBRepDS_DataMapOfCheckStatus & aMap);
		%feature("autodoc", "Args:
	aMap(TopOpeBRepDS_DataMapOfCheckStatus)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TopOpeBRepDS_DataMapOfCheckStatus & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Key;
		const Standard_Integer & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepDS_CheckStatus

No detailed docstring for this function.") Value;
		const TopOpeBRepDS_CheckStatus & Value ();
};


%feature("shadow") TopOpeBRepDS_DataMapIteratorOfDataMapOfCheckStatus::~TopOpeBRepDS_DataMapIteratorOfDataMapOfCheckStatus %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_DataMapIteratorOfDataMapOfCheckStatus {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_DataMapIteratorOfDataMapOfIntegerListOfInterference;
class TopOpeBRepDS_DataMapIteratorOfDataMapOfIntegerListOfInterference : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_DataMapIteratorOfDataMapOfIntegerListOfInterference;
		 TopOpeBRepDS_DataMapIteratorOfDataMapOfIntegerListOfInterference ();
		%feature("autodoc", "Args:
	aMap(TopOpeBRepDS_DataMapOfIntegerListOfInterference)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_DataMapIteratorOfDataMapOfIntegerListOfInterference;
		 TopOpeBRepDS_DataMapIteratorOfDataMapOfIntegerListOfInterference (const TopOpeBRepDS_DataMapOfIntegerListOfInterference & aMap);
		%feature("autodoc", "Args:
	aMap(TopOpeBRepDS_DataMapOfIntegerListOfInterference)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TopOpeBRepDS_DataMapOfIntegerListOfInterference & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Key;
		const Standard_Integer & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepDS_ListOfInterference

No detailed docstring for this function.") Value;
		const TopOpeBRepDS_ListOfInterference & Value ();
};


%feature("shadow") TopOpeBRepDS_DataMapIteratorOfDataMapOfIntegerListOfInterference::~TopOpeBRepDS_DataMapIteratorOfDataMapOfIntegerListOfInterference %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_DataMapIteratorOfDataMapOfIntegerListOfInterference {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_DataMapIteratorOfDataMapOfInterferenceListOfInterference;
class TopOpeBRepDS_DataMapIteratorOfDataMapOfInterferenceListOfInterference : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_DataMapIteratorOfDataMapOfInterferenceListOfInterference;
		 TopOpeBRepDS_DataMapIteratorOfDataMapOfInterferenceListOfInterference ();
		%feature("autodoc", "Args:
	aMap(TopOpeBRepDS_DataMapOfInterferenceListOfInterference)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_DataMapIteratorOfDataMapOfInterferenceListOfInterference;
		 TopOpeBRepDS_DataMapIteratorOfDataMapOfInterferenceListOfInterference (const TopOpeBRepDS_DataMapOfInterferenceListOfInterference & aMap);
		%feature("autodoc", "Args:
	aMap(TopOpeBRepDS_DataMapOfInterferenceListOfInterference)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TopOpeBRepDS_DataMapOfInterferenceListOfInterference & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopOpeBRepDS_Interference

No detailed docstring for this function.") Key;
		const Handle_TopOpeBRepDS_Interference & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepDS_ListOfInterference

No detailed docstring for this function.") Value;
		const TopOpeBRepDS_ListOfInterference & Value ();
};


%feature("shadow") TopOpeBRepDS_DataMapIteratorOfDataMapOfInterferenceListOfInterference::~TopOpeBRepDS_DataMapIteratorOfDataMapOfInterferenceListOfInterference %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_DataMapIteratorOfDataMapOfInterferenceListOfInterference {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_DataMapIteratorOfDataMapOfInterferenceShape;
class TopOpeBRepDS_DataMapIteratorOfDataMapOfInterferenceShape : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_DataMapIteratorOfDataMapOfInterferenceShape;
		 TopOpeBRepDS_DataMapIteratorOfDataMapOfInterferenceShape ();
		%feature("autodoc", "Args:
	aMap(TopOpeBRepDS_DataMapOfInterferenceShape)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_DataMapIteratorOfDataMapOfInterferenceShape;
		 TopOpeBRepDS_DataMapIteratorOfDataMapOfInterferenceShape (const TopOpeBRepDS_DataMapOfInterferenceShape & aMap);
		%feature("autodoc", "Args:
	aMap(TopOpeBRepDS_DataMapOfInterferenceShape)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TopOpeBRepDS_DataMapOfInterferenceShape & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopOpeBRepDS_Interference

No detailed docstring for this function.") Key;
		const Handle_TopOpeBRepDS_Interference & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Value;
		const TopoDS_Shape & Value ();
};


%feature("shadow") TopOpeBRepDS_DataMapIteratorOfDataMapOfInterferenceShape::~TopOpeBRepDS_DataMapIteratorOfDataMapOfInterferenceShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_DataMapIteratorOfDataMapOfInterferenceShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_DataMapIteratorOfDataMapOfShapeListOfShapeOn1State;
class TopOpeBRepDS_DataMapIteratorOfDataMapOfShapeListOfShapeOn1State : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_DataMapIteratorOfDataMapOfShapeListOfShapeOn1State;
		 TopOpeBRepDS_DataMapIteratorOfDataMapOfShapeListOfShapeOn1State ();
		%feature("autodoc", "Args:
	aMap(TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_DataMapIteratorOfDataMapOfShapeListOfShapeOn1State;
		 TopOpeBRepDS_DataMapIteratorOfDataMapOfShapeListOfShapeOn1State (const TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State & aMap);
		%feature("autodoc", "Args:
	aMap(TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		const TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepDS_ListOfShapeOn1State

No detailed docstring for this function.") Value;
		const TopOpeBRepDS_ListOfShapeOn1State & Value ();
};


%feature("shadow") TopOpeBRepDS_DataMapIteratorOfDataMapOfShapeListOfShapeOn1State::~TopOpeBRepDS_DataMapIteratorOfDataMapOfShapeListOfShapeOn1State %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_DataMapIteratorOfDataMapOfShapeListOfShapeOn1State {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_DataMapIteratorOfDataMapOfShapeState;
class TopOpeBRepDS_DataMapIteratorOfDataMapOfShapeState : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_DataMapIteratorOfDataMapOfShapeState;
		 TopOpeBRepDS_DataMapIteratorOfDataMapOfShapeState ();
		%feature("autodoc", "Args:
	aMap(TopOpeBRepDS_DataMapOfShapeState)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_DataMapIteratorOfDataMapOfShapeState;
		 TopOpeBRepDS_DataMapIteratorOfDataMapOfShapeState (const TopOpeBRepDS_DataMapOfShapeState & aMap);
		%feature("autodoc", "Args:
	aMap(TopOpeBRepDS_DataMapOfShapeState)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TopOpeBRepDS_DataMapOfShapeState & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		const TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_State

No detailed docstring for this function.") Value;
		const TopAbs_State & Value ();
};


%feature("shadow") TopOpeBRepDS_DataMapIteratorOfDataMapOfShapeState::~TopOpeBRepDS_DataMapIteratorOfDataMapOfShapeState %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_DataMapIteratorOfDataMapOfShapeState {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_DataMapIteratorOfMapOfCurve;
class TopOpeBRepDS_DataMapIteratorOfMapOfCurve : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_DataMapIteratorOfMapOfCurve;
		 TopOpeBRepDS_DataMapIteratorOfMapOfCurve ();
		%feature("autodoc", "Args:
	aMap(TopOpeBRepDS_MapOfCurve)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_DataMapIteratorOfMapOfCurve;
		 TopOpeBRepDS_DataMapIteratorOfMapOfCurve (const TopOpeBRepDS_MapOfCurve & aMap);
		%feature("autodoc", "Args:
	aMap(TopOpeBRepDS_MapOfCurve)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TopOpeBRepDS_MapOfCurve & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Key;
		const Standard_Integer & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepDS_CurveData

No detailed docstring for this function.") Value;
		const TopOpeBRepDS_CurveData & Value ();
};


%feature("shadow") TopOpeBRepDS_DataMapIteratorOfMapOfCurve::~TopOpeBRepDS_DataMapIteratorOfMapOfCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_DataMapIteratorOfMapOfCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_DataMapIteratorOfMapOfIntegerShapeData;
class TopOpeBRepDS_DataMapIteratorOfMapOfIntegerShapeData : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_DataMapIteratorOfMapOfIntegerShapeData;
		 TopOpeBRepDS_DataMapIteratorOfMapOfIntegerShapeData ();
		%feature("autodoc", "Args:
	aMap(TopOpeBRepDS_MapOfIntegerShapeData)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_DataMapIteratorOfMapOfIntegerShapeData;
		 TopOpeBRepDS_DataMapIteratorOfMapOfIntegerShapeData (const TopOpeBRepDS_MapOfIntegerShapeData & aMap);
		%feature("autodoc", "Args:
	aMap(TopOpeBRepDS_MapOfIntegerShapeData)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TopOpeBRepDS_MapOfIntegerShapeData & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Key;
		const Standard_Integer & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepDS_ShapeData

No detailed docstring for this function.") Value;
		const TopOpeBRepDS_ShapeData & Value ();
};


%feature("shadow") TopOpeBRepDS_DataMapIteratorOfMapOfIntegerShapeData::~TopOpeBRepDS_DataMapIteratorOfMapOfIntegerShapeData %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_DataMapIteratorOfMapOfIntegerShapeData {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_DataMapIteratorOfMapOfPoint;
class TopOpeBRepDS_DataMapIteratorOfMapOfPoint : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_DataMapIteratorOfMapOfPoint;
		 TopOpeBRepDS_DataMapIteratorOfMapOfPoint ();
		%feature("autodoc", "Args:
	aMap(TopOpeBRepDS_MapOfPoint)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_DataMapIteratorOfMapOfPoint;
		 TopOpeBRepDS_DataMapIteratorOfMapOfPoint (const TopOpeBRepDS_MapOfPoint & aMap);
		%feature("autodoc", "Args:
	aMap(TopOpeBRepDS_MapOfPoint)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TopOpeBRepDS_MapOfPoint & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Key;
		const Standard_Integer & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepDS_PointData

No detailed docstring for this function.") Value;
		const TopOpeBRepDS_PointData & Value ();
};


%feature("shadow") TopOpeBRepDS_DataMapIteratorOfMapOfPoint::~TopOpeBRepDS_DataMapIteratorOfMapOfPoint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_DataMapIteratorOfMapOfPoint {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_DataMapIteratorOfMapOfSurface;
class TopOpeBRepDS_DataMapIteratorOfMapOfSurface : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_DataMapIteratorOfMapOfSurface;
		 TopOpeBRepDS_DataMapIteratorOfMapOfSurface ();
		%feature("autodoc", "Args:
	aMap(TopOpeBRepDS_MapOfSurface)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_DataMapIteratorOfMapOfSurface;
		 TopOpeBRepDS_DataMapIteratorOfMapOfSurface (const TopOpeBRepDS_MapOfSurface & aMap);
		%feature("autodoc", "Args:
	aMap(TopOpeBRepDS_MapOfSurface)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TopOpeBRepDS_MapOfSurface & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Key;
		const Standard_Integer & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepDS_SurfaceData

No detailed docstring for this function.") Value;
		const TopOpeBRepDS_SurfaceData & Value ();
};


%feature("shadow") TopOpeBRepDS_DataMapIteratorOfMapOfSurface::~TopOpeBRepDS_DataMapIteratorOfMapOfSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_DataMapIteratorOfMapOfSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_DataMapIteratorOfShapeSurface;
class TopOpeBRepDS_DataMapIteratorOfShapeSurface : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_DataMapIteratorOfShapeSurface;
		 TopOpeBRepDS_DataMapIteratorOfShapeSurface ();
		%feature("autodoc", "Args:
	aMap(TopOpeBRepDS_ShapeSurface)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_DataMapIteratorOfShapeSurface;
		 TopOpeBRepDS_DataMapIteratorOfShapeSurface (const TopOpeBRepDS_ShapeSurface & aMap);
		%feature("autodoc", "Args:
	aMap(TopOpeBRepDS_ShapeSurface)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TopOpeBRepDS_ShapeSurface & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		const TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Surface

No detailed docstring for this function.") Value;
		const Handle_Geom_Surface & Value ();
};


%feature("shadow") TopOpeBRepDS_DataMapIteratorOfShapeSurface::~TopOpeBRepDS_DataMapIteratorOfShapeSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_DataMapIteratorOfShapeSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_DataMapNodeOfDataMapOfCheckStatus;
class TopOpeBRepDS_DataMapNodeOfDataMapOfCheckStatus : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(Standard_Integer)
	I(TopOpeBRepDS_CheckStatus)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_DataMapNodeOfDataMapOfCheckStatus;
		 TopOpeBRepDS_DataMapNodeOfDataMapOfCheckStatus (Standard_Integer &OutValue,const TopOpeBRepDS_CheckStatus & I,const TCollection_MapNodePtr & n);

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
            		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepDS_CheckStatus

No detailed docstring for this function.") Value;
		TopOpeBRepDS_CheckStatus & Value ();
};


%feature("shadow") TopOpeBRepDS_DataMapNodeOfDataMapOfCheckStatus::~TopOpeBRepDS_DataMapNodeOfDataMapOfCheckStatus %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_DataMapNodeOfDataMapOfCheckStatus {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopOpeBRepDS_DataMapNodeOfDataMapOfCheckStatus {
	Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfCheckStatus GetHandle() {
	return *(Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfCheckStatus*) &$self;
	}
};

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
    TopOpeBRepDS_DataMapNodeOfDataMapOfCheckStatus* GetObject() {
    return (TopOpeBRepDS_DataMapNodeOfDataMapOfCheckStatus*)$self->Access();
    }
};
%feature("shadow") Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfCheckStatus::~Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfCheckStatus %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfCheckStatus {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopOpeBRepDS_DataMapNodeOfDataMapOfIntegerListOfInterference;
class TopOpeBRepDS_DataMapNodeOfDataMapOfIntegerListOfInterference : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(Standard_Integer)
	I(TopOpeBRepDS_ListOfInterference)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_DataMapNodeOfDataMapOfIntegerListOfInterference;
		 TopOpeBRepDS_DataMapNodeOfDataMapOfIntegerListOfInterference (Standard_Integer &OutValue,const TopOpeBRepDS_ListOfInterference & I,const TCollection_MapNodePtr & n);

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
            		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepDS_ListOfInterference

No detailed docstring for this function.") Value;
		TopOpeBRepDS_ListOfInterference & Value ();
};


%feature("shadow") TopOpeBRepDS_DataMapNodeOfDataMapOfIntegerListOfInterference::~TopOpeBRepDS_DataMapNodeOfDataMapOfIntegerListOfInterference %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_DataMapNodeOfDataMapOfIntegerListOfInterference {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopOpeBRepDS_DataMapNodeOfDataMapOfIntegerListOfInterference {
	Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfIntegerListOfInterference GetHandle() {
	return *(Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfIntegerListOfInterference*) &$self;
	}
};

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
    TopOpeBRepDS_DataMapNodeOfDataMapOfIntegerListOfInterference* GetObject() {
    return (TopOpeBRepDS_DataMapNodeOfDataMapOfIntegerListOfInterference*)$self->Access();
    }
};
%feature("shadow") Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfIntegerListOfInterference::~Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfIntegerListOfInterference %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfIntegerListOfInterference {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceListOfInterference;
class TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceListOfInterference : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(Handle_TopOpeBRepDS_Interference)
	I(TopOpeBRepDS_ListOfInterference)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceListOfInterference;
		 TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceListOfInterference (const Handle_TopOpeBRepDS_Interference & K,const TopOpeBRepDS_ListOfInterference & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopOpeBRepDS_Interference

No detailed docstring for this function.") Key;
		Handle_TopOpeBRepDS_Interference & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepDS_ListOfInterference

No detailed docstring for this function.") Value;
		TopOpeBRepDS_ListOfInterference & Value ();
};


%feature("shadow") TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceListOfInterference::~TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceListOfInterference %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceListOfInterference {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceListOfInterference {
	Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceListOfInterference GetHandle() {
	return *(Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceListOfInterference*) &$self;
	}
};

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
    TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceListOfInterference* GetObject() {
    return (TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceListOfInterference*)$self->Access();
    }
};
%feature("shadow") Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceListOfInterference::~Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceListOfInterference %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceListOfInterference {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceShape;
class TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceShape : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(Handle_TopOpeBRepDS_Interference)
	I(TopoDS_Shape)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceShape;
		 TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceShape (const Handle_TopOpeBRepDS_Interference & K,const TopoDS_Shape & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopOpeBRepDS_Interference

No detailed docstring for this function.") Key;
		Handle_TopOpeBRepDS_Interference & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Value;
		TopoDS_Shape & Value ();
};


%feature("shadow") TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceShape::~TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceShape {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceShape {
	Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceShape GetHandle() {
	return *(Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceShape*) &$self;
	}
};

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
    TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceShape* GetObject() {
    return (TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceShape*)$self->Access();
    }
};
%feature("shadow") Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceShape::~Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceShape %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfInterferenceShape {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopOpeBRepDS_DataMapNodeOfDataMapOfShapeListOfShapeOn1State;
class TopOpeBRepDS_DataMapNodeOfDataMapOfShapeListOfShapeOn1State : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(TopOpeBRepDS_ListOfShapeOn1State)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_DataMapNodeOfDataMapOfShapeListOfShapeOn1State;
		 TopOpeBRepDS_DataMapNodeOfDataMapOfShapeListOfShapeOn1State (const TopoDS_Shape & K,const TopOpeBRepDS_ListOfShapeOn1State & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepDS_ListOfShapeOn1State

No detailed docstring for this function.") Value;
		TopOpeBRepDS_ListOfShapeOn1State & Value ();
};


%feature("shadow") TopOpeBRepDS_DataMapNodeOfDataMapOfShapeListOfShapeOn1State::~TopOpeBRepDS_DataMapNodeOfDataMapOfShapeListOfShapeOn1State %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_DataMapNodeOfDataMapOfShapeListOfShapeOn1State {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopOpeBRepDS_DataMapNodeOfDataMapOfShapeListOfShapeOn1State {
	Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfShapeListOfShapeOn1State GetHandle() {
	return *(Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfShapeListOfShapeOn1State*) &$self;
	}
};

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
    TopOpeBRepDS_DataMapNodeOfDataMapOfShapeListOfShapeOn1State* GetObject() {
    return (TopOpeBRepDS_DataMapNodeOfDataMapOfShapeListOfShapeOn1State*)$self->Access();
    }
};
%feature("shadow") Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfShapeListOfShapeOn1State::~Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfShapeListOfShapeOn1State %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfShapeListOfShapeOn1State {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopOpeBRepDS_DataMapNodeOfDataMapOfShapeState;
class TopOpeBRepDS_DataMapNodeOfDataMapOfShapeState : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(TopAbs_State)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_DataMapNodeOfDataMapOfShapeState;
		 TopOpeBRepDS_DataMapNodeOfDataMapOfShapeState (const TopoDS_Shape & K,const TopAbs_State & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_State

No detailed docstring for this function.") Value;
		TopAbs_State & Value ();
};


%feature("shadow") TopOpeBRepDS_DataMapNodeOfDataMapOfShapeState::~TopOpeBRepDS_DataMapNodeOfDataMapOfShapeState %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_DataMapNodeOfDataMapOfShapeState {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopOpeBRepDS_DataMapNodeOfDataMapOfShapeState {
	Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfShapeState GetHandle() {
	return *(Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfShapeState*) &$self;
	}
};

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
    TopOpeBRepDS_DataMapNodeOfDataMapOfShapeState* GetObject() {
    return (TopOpeBRepDS_DataMapNodeOfDataMapOfShapeState*)$self->Access();
    }
};
%feature("shadow") Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfShapeState::~Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfShapeState %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopOpeBRepDS_DataMapNodeOfDataMapOfShapeState {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopOpeBRepDS_DataMapNodeOfMapOfCurve;
class TopOpeBRepDS_DataMapNodeOfMapOfCurve : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(Standard_Integer)
	I(TopOpeBRepDS_CurveData)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_DataMapNodeOfMapOfCurve;
		 TopOpeBRepDS_DataMapNodeOfMapOfCurve (Standard_Integer &OutValue,const TopOpeBRepDS_CurveData & I,const TCollection_MapNodePtr & n);

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
            		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepDS_CurveData

No detailed docstring for this function.") Value;
		TopOpeBRepDS_CurveData & Value ();
};


%feature("shadow") TopOpeBRepDS_DataMapNodeOfMapOfCurve::~TopOpeBRepDS_DataMapNodeOfMapOfCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_DataMapNodeOfMapOfCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopOpeBRepDS_DataMapNodeOfMapOfCurve {
	Handle_TopOpeBRepDS_DataMapNodeOfMapOfCurve GetHandle() {
	return *(Handle_TopOpeBRepDS_DataMapNodeOfMapOfCurve*) &$self;
	}
};

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
    TopOpeBRepDS_DataMapNodeOfMapOfCurve* GetObject() {
    return (TopOpeBRepDS_DataMapNodeOfMapOfCurve*)$self->Access();
    }
};
%feature("shadow") Handle_TopOpeBRepDS_DataMapNodeOfMapOfCurve::~Handle_TopOpeBRepDS_DataMapNodeOfMapOfCurve %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopOpeBRepDS_DataMapNodeOfMapOfCurve {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopOpeBRepDS_DataMapNodeOfMapOfIntegerShapeData;
class TopOpeBRepDS_DataMapNodeOfMapOfIntegerShapeData : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(Standard_Integer)
	I(TopOpeBRepDS_ShapeData)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_DataMapNodeOfMapOfIntegerShapeData;
		 TopOpeBRepDS_DataMapNodeOfMapOfIntegerShapeData (Standard_Integer &OutValue,const TopOpeBRepDS_ShapeData & I,const TCollection_MapNodePtr & n);

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
            		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepDS_ShapeData

No detailed docstring for this function.") Value;
		TopOpeBRepDS_ShapeData & Value ();
};


%feature("shadow") TopOpeBRepDS_DataMapNodeOfMapOfIntegerShapeData::~TopOpeBRepDS_DataMapNodeOfMapOfIntegerShapeData %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_DataMapNodeOfMapOfIntegerShapeData {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopOpeBRepDS_DataMapNodeOfMapOfIntegerShapeData {
	Handle_TopOpeBRepDS_DataMapNodeOfMapOfIntegerShapeData GetHandle() {
	return *(Handle_TopOpeBRepDS_DataMapNodeOfMapOfIntegerShapeData*) &$self;
	}
};

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
    TopOpeBRepDS_DataMapNodeOfMapOfIntegerShapeData* GetObject() {
    return (TopOpeBRepDS_DataMapNodeOfMapOfIntegerShapeData*)$self->Access();
    }
};
%feature("shadow") Handle_TopOpeBRepDS_DataMapNodeOfMapOfIntegerShapeData::~Handle_TopOpeBRepDS_DataMapNodeOfMapOfIntegerShapeData %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopOpeBRepDS_DataMapNodeOfMapOfIntegerShapeData {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopOpeBRepDS_DataMapNodeOfMapOfPoint;
class TopOpeBRepDS_DataMapNodeOfMapOfPoint : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(Standard_Integer)
	I(TopOpeBRepDS_PointData)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_DataMapNodeOfMapOfPoint;
		 TopOpeBRepDS_DataMapNodeOfMapOfPoint (Standard_Integer &OutValue,const TopOpeBRepDS_PointData & I,const TCollection_MapNodePtr & n);

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
            		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepDS_PointData

No detailed docstring for this function.") Value;
		TopOpeBRepDS_PointData & Value ();
};


%feature("shadow") TopOpeBRepDS_DataMapNodeOfMapOfPoint::~TopOpeBRepDS_DataMapNodeOfMapOfPoint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_DataMapNodeOfMapOfPoint {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopOpeBRepDS_DataMapNodeOfMapOfPoint {
	Handle_TopOpeBRepDS_DataMapNodeOfMapOfPoint GetHandle() {
	return *(Handle_TopOpeBRepDS_DataMapNodeOfMapOfPoint*) &$self;
	}
};

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
    TopOpeBRepDS_DataMapNodeOfMapOfPoint* GetObject() {
    return (TopOpeBRepDS_DataMapNodeOfMapOfPoint*)$self->Access();
    }
};
%feature("shadow") Handle_TopOpeBRepDS_DataMapNodeOfMapOfPoint::~Handle_TopOpeBRepDS_DataMapNodeOfMapOfPoint %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopOpeBRepDS_DataMapNodeOfMapOfPoint {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopOpeBRepDS_DataMapNodeOfMapOfSurface;
class TopOpeBRepDS_DataMapNodeOfMapOfSurface : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(Standard_Integer)
	I(TopOpeBRepDS_SurfaceData)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_DataMapNodeOfMapOfSurface;
		 TopOpeBRepDS_DataMapNodeOfMapOfSurface (Standard_Integer &OutValue,const TopOpeBRepDS_SurfaceData & I,const TCollection_MapNodePtr & n);

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
            		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepDS_SurfaceData

No detailed docstring for this function.") Value;
		TopOpeBRepDS_SurfaceData & Value ();
};


%feature("shadow") TopOpeBRepDS_DataMapNodeOfMapOfSurface::~TopOpeBRepDS_DataMapNodeOfMapOfSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_DataMapNodeOfMapOfSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopOpeBRepDS_DataMapNodeOfMapOfSurface {
	Handle_TopOpeBRepDS_DataMapNodeOfMapOfSurface GetHandle() {
	return *(Handle_TopOpeBRepDS_DataMapNodeOfMapOfSurface*) &$self;
	}
};

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
    TopOpeBRepDS_DataMapNodeOfMapOfSurface* GetObject() {
    return (TopOpeBRepDS_DataMapNodeOfMapOfSurface*)$self->Access();
    }
};
%feature("shadow") Handle_TopOpeBRepDS_DataMapNodeOfMapOfSurface::~Handle_TopOpeBRepDS_DataMapNodeOfMapOfSurface %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopOpeBRepDS_DataMapNodeOfMapOfSurface {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopOpeBRepDS_DataMapNodeOfShapeSurface;
class TopOpeBRepDS_DataMapNodeOfShapeSurface : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(Handle_Geom_Surface)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_DataMapNodeOfShapeSurface;
		 TopOpeBRepDS_DataMapNodeOfShapeSurface (const TopoDS_Shape & K,const Handle_Geom_Surface & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Surface

No detailed docstring for this function.") Value;
		Handle_Geom_Surface & Value ();
};


%feature("shadow") TopOpeBRepDS_DataMapNodeOfShapeSurface::~TopOpeBRepDS_DataMapNodeOfShapeSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_DataMapNodeOfShapeSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopOpeBRepDS_DataMapNodeOfShapeSurface {
	Handle_TopOpeBRepDS_DataMapNodeOfShapeSurface GetHandle() {
	return *(Handle_TopOpeBRepDS_DataMapNodeOfShapeSurface*) &$self;
	}
};

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
    TopOpeBRepDS_DataMapNodeOfShapeSurface* GetObject() {
    return (TopOpeBRepDS_DataMapNodeOfShapeSurface*)$self->Access();
    }
};
%feature("shadow") Handle_TopOpeBRepDS_DataMapNodeOfShapeSurface::~Handle_TopOpeBRepDS_DataMapNodeOfShapeSurface %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopOpeBRepDS_DataMapNodeOfShapeSurface {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopOpeBRepDS_DataMapOfCheckStatus;
class TopOpeBRepDS_DataMapOfCheckStatus : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_DataMapOfCheckStatus;
		 TopOpeBRepDS_DataMapOfCheckStatus (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(TopOpeBRepDS_DataMapOfCheckStatus)

Returns:
	TopOpeBRepDS_DataMapOfCheckStatus

No detailed docstring for this function.") Assign;
		TopOpeBRepDS_DataMapOfCheckStatus & Assign (const TopOpeBRepDS_DataMapOfCheckStatus & Other);
		%feature("autodoc", "Args:
	Other(TopOpeBRepDS_DataMapOfCheckStatus)

Returns:
	TopOpeBRepDS_DataMapOfCheckStatus

No detailed docstring for this function.") operator=;
		TopOpeBRepDS_DataMapOfCheckStatus & operator = (const TopOpeBRepDS_DataMapOfCheckStatus & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(Standard_Integer)
	I(TopOpeBRepDS_CheckStatus)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (Standard_Integer &OutValue,const TopOpeBRepDS_CheckStatus & I);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	TopOpeBRepDS_CheckStatus

No detailed docstring for this function.") Find;
		const TopOpeBRepDS_CheckStatus & Find (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	TopOpeBRepDS_CheckStatus

No detailed docstring for this function.") ChangeFind;
		TopOpeBRepDS_CheckStatus & ChangeFind (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
		Standard_Address ChangeFind1 (Standard_Integer &OutValue);
};


%feature("shadow") TopOpeBRepDS_DataMapOfCheckStatus::~TopOpeBRepDS_DataMapOfCheckStatus %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_DataMapOfCheckStatus {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_DataMapOfIntegerListOfInterference;
class TopOpeBRepDS_DataMapOfIntegerListOfInterference : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_DataMapOfIntegerListOfInterference;
		 TopOpeBRepDS_DataMapOfIntegerListOfInterference (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(TopOpeBRepDS_DataMapOfIntegerListOfInterference)

Returns:
	TopOpeBRepDS_DataMapOfIntegerListOfInterference

No detailed docstring for this function.") Assign;
		TopOpeBRepDS_DataMapOfIntegerListOfInterference & Assign (const TopOpeBRepDS_DataMapOfIntegerListOfInterference & Other);
		%feature("autodoc", "Args:
	Other(TopOpeBRepDS_DataMapOfIntegerListOfInterference)

Returns:
	TopOpeBRepDS_DataMapOfIntegerListOfInterference

No detailed docstring for this function.") operator=;
		TopOpeBRepDS_DataMapOfIntegerListOfInterference & operator = (const TopOpeBRepDS_DataMapOfIntegerListOfInterference & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(Standard_Integer)
	I(TopOpeBRepDS_ListOfInterference)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (Standard_Integer &OutValue,const TopOpeBRepDS_ListOfInterference & I);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	TopOpeBRepDS_ListOfInterference

No detailed docstring for this function.") Find;
		const TopOpeBRepDS_ListOfInterference & Find (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	TopOpeBRepDS_ListOfInterference

No detailed docstring for this function.") ChangeFind;
		TopOpeBRepDS_ListOfInterference & ChangeFind (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
		Standard_Address ChangeFind1 (Standard_Integer &OutValue);
};


%feature("shadow") TopOpeBRepDS_DataMapOfIntegerListOfInterference::~TopOpeBRepDS_DataMapOfIntegerListOfInterference %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_DataMapOfIntegerListOfInterference {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_DataMapOfInterferenceListOfInterference;
class TopOpeBRepDS_DataMapOfInterferenceListOfInterference : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_DataMapOfInterferenceListOfInterference;
		 TopOpeBRepDS_DataMapOfInterferenceListOfInterference (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(TopOpeBRepDS_DataMapOfInterferenceListOfInterference)

Returns:
	TopOpeBRepDS_DataMapOfInterferenceListOfInterference

No detailed docstring for this function.") Assign;
		TopOpeBRepDS_DataMapOfInterferenceListOfInterference & Assign (const TopOpeBRepDS_DataMapOfInterferenceListOfInterference & Other);
		%feature("autodoc", "Args:
	Other(TopOpeBRepDS_DataMapOfInterferenceListOfInterference)

Returns:
	TopOpeBRepDS_DataMapOfInterferenceListOfInterference

No detailed docstring for this function.") operator=;
		TopOpeBRepDS_DataMapOfInterferenceListOfInterference & operator = (const TopOpeBRepDS_DataMapOfInterferenceListOfInterference & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(Handle_TopOpeBRepDS_Interference)
	I(TopOpeBRepDS_ListOfInterference)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const Handle_TopOpeBRepDS_Interference & K,const TopOpeBRepDS_ListOfInterference & I);
		%feature("autodoc", "Args:
	K(Handle_TopOpeBRepDS_Interference)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (const Handle_TopOpeBRepDS_Interference & K);
		%feature("autodoc", "Args:
	K(Handle_TopOpeBRepDS_Interference)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (const Handle_TopOpeBRepDS_Interference & K);
		%feature("autodoc", "Args:
	K(Handle_TopOpeBRepDS_Interference)

Returns:
	TopOpeBRepDS_ListOfInterference

No detailed docstring for this function.") Find;
		const TopOpeBRepDS_ListOfInterference & Find (const Handle_TopOpeBRepDS_Interference & K);
		%feature("autodoc", "Args:
	K(Handle_TopOpeBRepDS_Interference)

Returns:
	TopOpeBRepDS_ListOfInterference

No detailed docstring for this function.") ChangeFind;
		TopOpeBRepDS_ListOfInterference & ChangeFind (const Handle_TopOpeBRepDS_Interference & K);
		%feature("autodoc", "Args:
	K(Handle_TopOpeBRepDS_Interference)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (const Handle_TopOpeBRepDS_Interference & K);
		%feature("autodoc", "Args:
	K(Handle_TopOpeBRepDS_Interference)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
		Standard_Address ChangeFind1 (const Handle_TopOpeBRepDS_Interference & K);
};


%feature("shadow") TopOpeBRepDS_DataMapOfInterferenceListOfInterference::~TopOpeBRepDS_DataMapOfInterferenceListOfInterference %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_DataMapOfInterferenceListOfInterference {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_DataMapOfInterferenceShape;
class TopOpeBRepDS_DataMapOfInterferenceShape : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_DataMapOfInterferenceShape;
		 TopOpeBRepDS_DataMapOfInterferenceShape (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(TopOpeBRepDS_DataMapOfInterferenceShape)

Returns:
	TopOpeBRepDS_DataMapOfInterferenceShape

No detailed docstring for this function.") Assign;
		TopOpeBRepDS_DataMapOfInterferenceShape & Assign (const TopOpeBRepDS_DataMapOfInterferenceShape & Other);
		%feature("autodoc", "Args:
	Other(TopOpeBRepDS_DataMapOfInterferenceShape)

Returns:
	TopOpeBRepDS_DataMapOfInterferenceShape

No detailed docstring for this function.") operator=;
		TopOpeBRepDS_DataMapOfInterferenceShape & operator = (const TopOpeBRepDS_DataMapOfInterferenceShape & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(Handle_TopOpeBRepDS_Interference)
	I(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const Handle_TopOpeBRepDS_Interference & K,const TopoDS_Shape & I);
		%feature("autodoc", "Args:
	K(Handle_TopOpeBRepDS_Interference)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (const Handle_TopOpeBRepDS_Interference & K);
		%feature("autodoc", "Args:
	K(Handle_TopOpeBRepDS_Interference)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (const Handle_TopOpeBRepDS_Interference & K);
		%feature("autodoc", "Args:
	K(Handle_TopOpeBRepDS_Interference)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") Find;
		const TopoDS_Shape & Find (const Handle_TopOpeBRepDS_Interference & K);
		%feature("autodoc", "Args:
	K(Handle_TopOpeBRepDS_Interference)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") ChangeFind;
		TopoDS_Shape & ChangeFind (const Handle_TopOpeBRepDS_Interference & K);
		%feature("autodoc", "Args:
	K(Handle_TopOpeBRepDS_Interference)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (const Handle_TopOpeBRepDS_Interference & K);
		%feature("autodoc", "Args:
	K(Handle_TopOpeBRepDS_Interference)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
		Standard_Address ChangeFind1 (const Handle_TopOpeBRepDS_Interference & K);
};


%feature("shadow") TopOpeBRepDS_DataMapOfInterferenceShape::~TopOpeBRepDS_DataMapOfInterferenceShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_DataMapOfInterferenceShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State;
class TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State;
		 TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State)

Returns:
	TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State

No detailed docstring for this function.") Assign;
		TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State & Assign (const TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State & Other);
		%feature("autodoc", "Args:
	Other(TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State)

Returns:
	TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State

No detailed docstring for this function.") operator=;
		TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State & operator = (const TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(TopOpeBRepDS_ListOfShapeOn1State)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const TopOpeBRepDS_ListOfShapeOn1State & I);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	TopOpeBRepDS_ListOfShapeOn1State

No detailed docstring for this function.") Find;
		const TopOpeBRepDS_ListOfShapeOn1State & Find (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	TopOpeBRepDS_ListOfShapeOn1State

No detailed docstring for this function.") ChangeFind;
		TopOpeBRepDS_ListOfShapeOn1State & ChangeFind (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Shape & K);
};


%feature("shadow") TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State::~TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_DataMapOfShapeState;
class TopOpeBRepDS_DataMapOfShapeState : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_DataMapOfShapeState;
		 TopOpeBRepDS_DataMapOfShapeState (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(TopOpeBRepDS_DataMapOfShapeState)

Returns:
	TopOpeBRepDS_DataMapOfShapeState

No detailed docstring for this function.") Assign;
		TopOpeBRepDS_DataMapOfShapeState & Assign (const TopOpeBRepDS_DataMapOfShapeState & Other);
		%feature("autodoc", "Args:
	Other(TopOpeBRepDS_DataMapOfShapeState)

Returns:
	TopOpeBRepDS_DataMapOfShapeState

No detailed docstring for this function.") operator=;
		TopOpeBRepDS_DataMapOfShapeState & operator = (const TopOpeBRepDS_DataMapOfShapeState & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(TopAbs_State)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const TopAbs_State & I);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	TopAbs_State

No detailed docstring for this function.") Find;
		const TopAbs_State & Find (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	TopAbs_State

No detailed docstring for this function.") ChangeFind;
		TopAbs_State & ChangeFind (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Shape & K);
};


%feature("shadow") TopOpeBRepDS_DataMapOfShapeState::~TopOpeBRepDS_DataMapOfShapeState %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_DataMapOfShapeState {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_DataStructure;
class TopOpeBRepDS_DataStructure {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_DataStructure;
		 TopOpeBRepDS_DataStructure ();
		%feature("autodoc", "Args:
	None
Returns:
	None

reset the data structure") Init;
		void Init ();
		%feature("autodoc", "Args:
	S(TopOpeBRepDS_Surface)

Returns:
	Standard_Integer

Insert a new surface. Returns the index.") AddSurface;
		Standard_Integer AddSurface (const TopOpeBRepDS_Surface & S);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") RemoveSurface;
		void RemoveSurface (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") KeepSurface;
		Standard_Boolean KeepSurface (const Standard_Integer I);
		%feature("autodoc", "Args:
	S(TopOpeBRepDS_Surface)

Returns:
	Standard_Boolean

No detailed docstring for this function.") KeepSurface;
		Standard_Boolean KeepSurface (TopOpeBRepDS_Surface & S);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	FindKeep(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") ChangeKeepSurface;
		void ChangeKeepSurface (const Standard_Integer I,const Standard_Boolean FindKeep);
		%feature("autodoc", "Args:
	S(TopOpeBRepDS_Surface)
	FindKeep(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") ChangeKeepSurface;
		void ChangeKeepSurface (TopOpeBRepDS_Surface & S,const Standard_Boolean FindKeep);
		%feature("autodoc", "Args:
	S(TopOpeBRepDS_Curve)

Returns:
	Standard_Integer

Insert a new curve. Returns the index.") AddCurve;
		Standard_Integer AddCurve (const TopOpeBRepDS_Curve & S);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") RemoveCurve;
		void RemoveCurve (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") KeepCurve;
		Standard_Boolean KeepCurve (const Standard_Integer I);
		%feature("autodoc", "Args:
	C(TopOpeBRepDS_Curve)

Returns:
	Standard_Boolean

No detailed docstring for this function.") KeepCurve;
		Standard_Boolean KeepCurve (const TopOpeBRepDS_Curve & C);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	FindKeep(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") ChangeKeepCurve;
		void ChangeKeepCurve (const Standard_Integer I,const Standard_Boolean FindKeep);
		%feature("autodoc", "Args:
	C(TopOpeBRepDS_Curve)
	FindKeep(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") ChangeKeepCurve;
		void ChangeKeepCurve (TopOpeBRepDS_Curve & C,const Standard_Boolean FindKeep);
		%feature("autodoc", "Args:
	PDS(TopOpeBRepDS_Point)

Returns:
	Standard_Integer

Insert a new point. Returns the index.") AddPoint;
		Standard_Integer AddPoint (const TopOpeBRepDS_Point & PDS);
		%feature("autodoc", "Args:
	PDS(TopOpeBRepDS_Point)
	S1(TopoDS_Shape)
	S2(TopoDS_Shape)

Returns:
	Standard_Integer

Insert a new point. Returns the index.") AddPointSS;
		Standard_Integer AddPointSS (const TopOpeBRepDS_Point & PDS,const TopoDS_Shape & S1,const TopoDS_Shape & S2);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") RemovePoint;
		void RemovePoint (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") KeepPoint;
		Standard_Boolean KeepPoint (const Standard_Integer I);
		%feature("autodoc", "Args:
	P(TopOpeBRepDS_Point)

Returns:
	Standard_Boolean

No detailed docstring for this function.") KeepPoint;
		Standard_Boolean KeepPoint (const TopOpeBRepDS_Point & P);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	FindKeep(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") ChangeKeepPoint;
		void ChangeKeepPoint (const Standard_Integer I,const Standard_Boolean FindKeep);
		%feature("autodoc", "Args:
	P(TopOpeBRepDS_Point)
	FindKeep(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") ChangeKeepPoint;
		void ChangeKeepPoint (TopOpeBRepDS_Point & P,const Standard_Boolean FindKeep);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	Standard_Integer

Insert a shape S. Returns the index.") AddShape;
		Standard_Integer AddShape (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	I(Standard_Integer)

Returns:
	Standard_Integer

Insert a shape S which ancestor is I = 1 or 2. Returns the index.") AddShape;
		Standard_Integer AddShape (const TopoDS_Shape & S,const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	FindKeep(Standard_Boolean)=Standard_True

Returns:
	Standard_Boolean

No detailed docstring for this function.") KeepShape;
		Standard_Boolean KeepShape (const Standard_Integer I,const Standard_Boolean FindKeep = Standard_True);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	FindKeep(Standard_Boolean)=Standard_True

Returns:
	Standard_Boolean

No detailed docstring for this function.") KeepShape;
		Standard_Boolean KeepShape (const TopoDS_Shape & S,const Standard_Boolean FindKeep = Standard_True);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	FindKeep(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") ChangeKeepShape;
		void ChangeKeepShape (const Standard_Integer I,const Standard_Boolean FindKeep);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	FindKeep(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") ChangeKeepShape;
		void ChangeKeepShape (const TopoDS_Shape & S,const Standard_Boolean FindKeep);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") InitSectionEdges;
		void InitSectionEdges ();
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	Standard_Integer

No detailed docstring for this function.") AddSectionEdge;
		Standard_Integer AddSectionEdge (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopOpeBRepDS_ListOfInterference

No detailed docstring for this function.") SurfaceInterferences;
		const TopOpeBRepDS_ListOfInterference & SurfaceInterferences (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopOpeBRepDS_ListOfInterference

No detailed docstring for this function.") ChangeSurfaceInterferences;
		TopOpeBRepDS_ListOfInterference & ChangeSurfaceInterferences (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopOpeBRepDS_ListOfInterference

No detailed docstring for this function.") CurveInterferences;
		const TopOpeBRepDS_ListOfInterference & CurveInterferences (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopOpeBRepDS_ListOfInterference

No detailed docstring for this function.") ChangeCurveInterferences;
		TopOpeBRepDS_ListOfInterference & ChangeCurveInterferences (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopOpeBRepDS_ListOfInterference

No detailed docstring for this function.") PointInterferences;
		const TopOpeBRepDS_ListOfInterference & PointInterferences (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopOpeBRepDS_ListOfInterference

No detailed docstring for this function.") ChangePointInterferences;
		TopOpeBRepDS_ListOfInterference & ChangePointInterferences (const Standard_Integer I);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	FindKeep(Standard_Boolean)=Standard_True

Returns:
	TopOpeBRepDS_ListOfInterference

No detailed docstring for this function.") ShapeInterferences;
		const TopOpeBRepDS_ListOfInterference & ShapeInterferences (const TopoDS_Shape & S,const Standard_Boolean FindKeep = Standard_True);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	TopOpeBRepDS_ListOfInterference

No detailed docstring for this function.") ChangeShapeInterferences;
		TopOpeBRepDS_ListOfInterference & ChangeShapeInterferences (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	FindKeep(Standard_Boolean)=Standard_True

Returns:
	TopOpeBRepDS_ListOfInterference

No detailed docstring for this function.") ShapeInterferences;
		const TopOpeBRepDS_ListOfInterference & ShapeInterferences (const Standard_Integer I,const Standard_Boolean FindKeep = Standard_True);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopOpeBRepDS_ListOfInterference

No detailed docstring for this function.") ChangeShapeInterferences;
		TopOpeBRepDS_ListOfInterference & ChangeShapeInterferences (const Standard_Integer I);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") ShapeSameDomain;
		const TopTools_ListOfShape & ShapeSameDomain (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") ChangeShapeSameDomain;
		TopTools_ListOfShape & ChangeShapeSameDomain (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") ShapeSameDomain;
		const TopTools_ListOfShape & ShapeSameDomain (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") ChangeShapeSameDomain;
		TopTools_ListOfShape & ChangeShapeSameDomain (const Standard_Integer I);
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepDS_MapOfShapeData

No detailed docstring for this function.") ChangeShapes;
		TopOpeBRepDS_MapOfShapeData & ChangeShapes ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	SSD(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") AddShapeSameDomain;
		void AddShapeSameDomain (const TopoDS_Shape & S,const TopoDS_Shape & SSD);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	SSD(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") RemoveShapeSameDomain;
		void RemoveShapeSameDomain (const TopoDS_Shape & S,const TopoDS_Shape & SSD);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") SameDomainRef;
		Standard_Integer SameDomainRef (const Standard_Integer I);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	Standard_Integer

No detailed docstring for this function.") SameDomainRef;
		Standard_Integer SameDomainRef (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	Ref(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SameDomainRef;
		void SameDomainRef (const Standard_Integer I,const Standard_Integer Ref);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	Ref(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SameDomainRef;
		void SameDomainRef (const TopoDS_Shape & S,const Standard_Integer Ref);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopOpeBRepDS_Config

No detailed docstring for this function.") SameDomainOri;
		TopOpeBRepDS_Config SameDomainOri (const Standard_Integer I);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	TopOpeBRepDS_Config

No detailed docstring for this function.") SameDomainOri;
		TopOpeBRepDS_Config SameDomainOri (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	Ori(TopOpeBRepDS_Config)

Returns:
	None

No detailed docstring for this function.") SameDomainOri;
		void SameDomainOri (const Standard_Integer I,const TopOpeBRepDS_Config Ori);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	Ori(TopOpeBRepDS_Config)

Returns:
	None

No detailed docstring for this function.") SameDomainOri;
		void SameDomainOri (const TopoDS_Shape & S,const TopOpeBRepDS_Config Ori);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") SameDomainInd;
		Standard_Integer SameDomainInd (const Standard_Integer I);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	Standard_Integer

No detailed docstring for this function.") SameDomainInd;
		Standard_Integer SameDomainInd (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	Ind(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SameDomainInd;
		void SameDomainInd (const Standard_Integer I,const Standard_Integer Ind);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	Ind(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SameDomainInd;
		void SameDomainInd (const TopoDS_Shape & S,const Standard_Integer Ind);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") AncestorRank;
		Standard_Integer AncestorRank (const Standard_Integer I);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	Standard_Integer

No detailed docstring for this function.") AncestorRank;
		Standard_Integer AncestorRank (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	Ianc(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") AncestorRank;
		void AncestorRank (const Standard_Integer I,const Standard_Integer Ianc);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	Ianc(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") AncestorRank;
		void AncestorRank (const TopoDS_Shape & S,const Standard_Integer Ianc);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	I(Handle_TopOpeBRepDS_Interference)

Returns:
	None

No detailed docstring for this function.") AddShapeInterference;
		void AddShapeInterference (const TopoDS_Shape & S,const Handle_TopOpeBRepDS_Interference & I);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	I(Handle_TopOpeBRepDS_Interference)

Returns:
	None

No detailed docstring for this function.") RemoveShapeInterference;
		void RemoveShapeInterference (const TopoDS_Shape & S,const Handle_TopOpeBRepDS_Interference & I);
		%feature("autodoc", "Args:
	S1(TopoDS_Shape)
	S2(TopoDS_Shape)
	refFirst(Standard_Boolean)=Standard_True

Returns:
	None

No detailed docstring for this function.") FillShapesSameDomain;
		void FillShapesSameDomain (const TopoDS_Shape & S1,const TopoDS_Shape & S2,const Standard_Boolean refFirst = Standard_True);
		%feature("autodoc", "Args:
	S1(TopoDS_Shape)
	S2(TopoDS_Shape)
	c1(TopOpeBRepDS_Config)
	c2(TopOpeBRepDS_Config)
	refFirst(Standard_Boolean)=Standard_True

Returns:
	None

No detailed docstring for this function.") FillShapesSameDomain;
		void FillShapesSameDomain (const TopoDS_Shape & S1,const TopoDS_Shape & S2,const TopOpeBRepDS_Config c1,const TopOpeBRepDS_Config c2,const Standard_Boolean refFirst = Standard_True);
		%feature("autodoc", "Args:
	S1(TopoDS_Shape)
	S2(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") UnfillShapesSameDomain;
		void UnfillShapesSameDomain (const TopoDS_Shape & S1,const TopoDS_Shape & S2);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbSurfaces;
		Standard_Integer NbSurfaces ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbCurves;
		Standard_Integer NbCurves ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ChangeNbCurves;
		void ChangeNbCurves (const Standard_Integer N);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbPoints;
		Standard_Integer NbPoints ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbShapes;
		Standard_Integer NbShapes ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbSectionEdges;
		Standard_Integer NbSectionEdges ();
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopOpeBRepDS_Surface

Returns the surface of index <I>.") Surface;
		const TopOpeBRepDS_Surface & Surface (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopOpeBRepDS_Surface

Returns the surface of index <I>.") ChangeSurface;
		TopOpeBRepDS_Surface & ChangeSurface (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopOpeBRepDS_Curve

Returns the Curve of index <I>.") Curve;
		const TopOpeBRepDS_Curve & Curve (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopOpeBRepDS_Curve

Returns the Curve of index <I>.") ChangeCurve;
		TopOpeBRepDS_Curve & ChangeCurve (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopOpeBRepDS_Point

Returns the point of index <I>.") Point;
		const TopOpeBRepDS_Point & Point (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopOpeBRepDS_Point

Returns the point of index <I>.") ChangePoint;
		TopOpeBRepDS_Point & ChangePoint (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	FindKeep(Standard_Boolean)=Standard_True

Returns:
	TopoDS_Shape

returns the shape of index I stored in  
         the map myShapes, accessing a list of interference.") Shape;
		const TopoDS_Shape & Shape (const Standard_Integer I,const Standard_Boolean FindKeep = Standard_True);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	FindKeep(Standard_Boolean)=Standard_True

Returns:
	Standard_Integer

returns the index of shape <S> stored in  
         the map myShapes, accessing a list of interference.  
         returns 0 if <S> is not in the map.") Shape;
		Standard_Integer Shape (const TopoDS_Shape & S,const Standard_Boolean FindKeep = Standard_True);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	FindKeep(Standard_Boolean)=Standard_True

Returns:
	TopoDS_Edge

No detailed docstring for this function.") SectionEdge;
		const TopoDS_Edge & SectionEdge (const Standard_Integer I,const Standard_Boolean FindKeep = Standard_True);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	FindKeep(Standard_Boolean)=Standard_True

Returns:
	Standard_Integer

No detailed docstring for this function.") SectionEdge;
		Standard_Integer SectionEdge (const TopoDS_Edge & E,const Standard_Boolean FindKeep = Standard_True);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	FindKeep(Standard_Boolean)=Standard_True

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsSectionEdge;
		Standard_Boolean IsSectionEdge (const TopoDS_Edge & E,const Standard_Boolean FindKeep = Standard_True);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	Standard_Boolean

Returns True if <S> has new geometries, i.e :  
True si :  
    HasShape(S) True  
    S a une liste d'interferences non vide.  
S = SOLID, FACE, EDGE : true/false  
S = SHELL, WIRE, VERTEX : false.") HasGeometry;
		Standard_Boolean HasGeometry (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	FindKeep(Standard_Boolean)=Standard_True

Returns:
	Standard_Boolean

Returns True if <S> est dans myShapes") HasShape;
		Standard_Boolean HasShape (const TopoDS_Shape & S,const Standard_Boolean FindKeep = Standard_True);
		%feature("autodoc", "Args:
	F(TopoDS_Shape)
	S(Handle_Geom_Surface)

Returns:
	None

No detailed docstring for this function.") SetNewSurface;
		void SetNewSurface (const TopoDS_Shape & F,const Handle_Geom_Surface & S);
		%feature("autodoc", "Args:
	F(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") HasNewSurface;
		Standard_Boolean HasNewSurface (const TopoDS_Shape & F);
		%feature("autodoc", "Args:
	F(TopoDS_Shape)

Returns:
	Handle_Geom_Surface

No detailed docstring for this function.") NewSurface;
		const Handle_Geom_Surface & NewSurface (const TopoDS_Shape & F);
		%feature("autodoc", "Args:
	isfafa(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") Isfafa;
		void Isfafa (const Standard_Boolean isfafa);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") Isfafa;
		Standard_Boolean Isfafa ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepDS_IndexedDataMapOfShapeWithState

No detailed docstring for this function.") ChangeMapOfShapeWithStateObj;
		TopOpeBRepDS_IndexedDataMapOfShapeWithState & ChangeMapOfShapeWithStateObj ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepDS_IndexedDataMapOfShapeWithState

No detailed docstring for this function.") ChangeMapOfShapeWithStateTool;
		TopOpeBRepDS_IndexedDataMapOfShapeWithState & ChangeMapOfShapeWithStateTool ();
		%feature("autodoc", "Args:
	aShape(TopoDS_Shape)
	aFlag(Standard_Boolean)

Returns:
	TopOpeBRepDS_IndexedDataMapOfShapeWithState

No detailed docstring for this function.") ChangeMapOfShapeWithState;
		TopOpeBRepDS_IndexedDataMapOfShapeWithState & ChangeMapOfShapeWithState (const TopoDS_Shape & aShape,Standard_Boolean & aFlag);
		%feature("autodoc", "Args:
	aShape(TopoDS_Shape)

Returns:
	TopOpeBRepDS_ShapeWithState

No detailed docstring for this function.") GetShapeWithState;
		const TopOpeBRepDS_ShapeWithState & GetShapeWithState (const TopoDS_Shape & aShape);
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_IndexedMapOfShape

No detailed docstring for this function.") ChangeMapOfRejectedShapesObj;
		TopTools_IndexedMapOfShape & ChangeMapOfRejectedShapesObj ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_IndexedMapOfShape

No detailed docstring for this function.") ChangeMapOfRejectedShapesTool;
		TopTools_IndexedMapOfShape & ChangeMapOfRejectedShapesTool ();
};


%feature("shadow") TopOpeBRepDS_DataStructure::~TopOpeBRepDS_DataStructure %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_DataStructure {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_DoubleMapIteratorOfDoubleMapOfIntegerShape;
class TopOpeBRepDS_DoubleMapIteratorOfDoubleMapOfIntegerShape : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_DoubleMapIteratorOfDoubleMapOfIntegerShape;
		 TopOpeBRepDS_DoubleMapIteratorOfDoubleMapOfIntegerShape ();
		%feature("autodoc", "Args:
	aMap(TopOpeBRepDS_DoubleMapOfIntegerShape)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_DoubleMapIteratorOfDoubleMapOfIntegerShape;
		 TopOpeBRepDS_DoubleMapIteratorOfDoubleMapOfIntegerShape (const TopOpeBRepDS_DoubleMapOfIntegerShape & aMap);
		%feature("autodoc", "Args:
	aMap(TopOpeBRepDS_DoubleMapOfIntegerShape)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TopOpeBRepDS_DoubleMapOfIntegerShape & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Key1;
		const Standard_Integer & Key1 ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key2;
		const TopoDS_Shape & Key2 ();
};


%feature("shadow") TopOpeBRepDS_DoubleMapIteratorOfDoubleMapOfIntegerShape::~TopOpeBRepDS_DoubleMapIteratorOfDoubleMapOfIntegerShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_DoubleMapIteratorOfDoubleMapOfIntegerShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_DoubleMapNodeOfDoubleMapOfIntegerShape;
class TopOpeBRepDS_DoubleMapNodeOfDoubleMapOfIntegerShape : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K1(Standard_Integer)
	K2(TopoDS_Shape)
	n1(TCollection_MapNodePtr)
	n2(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_DoubleMapNodeOfDoubleMapOfIntegerShape;
		 TopOpeBRepDS_DoubleMapNodeOfDoubleMapOfIntegerShape (Standard_Integer &OutValue,const TopoDS_Shape & K2,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);

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
            		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key2;
		TopoDS_Shape & Key2 ();
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_MapNodePtr

No detailed docstring for this function.") Next2;
		TCollection_MapNodePtr & Next2 ();
};


%feature("shadow") TopOpeBRepDS_DoubleMapNodeOfDoubleMapOfIntegerShape::~TopOpeBRepDS_DoubleMapNodeOfDoubleMapOfIntegerShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_DoubleMapNodeOfDoubleMapOfIntegerShape {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopOpeBRepDS_DoubleMapNodeOfDoubleMapOfIntegerShape {
	Handle_TopOpeBRepDS_DoubleMapNodeOfDoubleMapOfIntegerShape GetHandle() {
	return *(Handle_TopOpeBRepDS_DoubleMapNodeOfDoubleMapOfIntegerShape*) &$self;
	}
};

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
    TopOpeBRepDS_DoubleMapNodeOfDoubleMapOfIntegerShape* GetObject() {
    return (TopOpeBRepDS_DoubleMapNodeOfDoubleMapOfIntegerShape*)$self->Access();
    }
};
%feature("shadow") Handle_TopOpeBRepDS_DoubleMapNodeOfDoubleMapOfIntegerShape::~Handle_TopOpeBRepDS_DoubleMapNodeOfDoubleMapOfIntegerShape %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopOpeBRepDS_DoubleMapNodeOfDoubleMapOfIntegerShape {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopOpeBRepDS_DoubleMapOfIntegerShape;
class TopOpeBRepDS_DoubleMapOfIntegerShape : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_DoubleMapOfIntegerShape;
		 TopOpeBRepDS_DoubleMapOfIntegerShape (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(TopOpeBRepDS_DoubleMapOfIntegerShape)

Returns:
	TopOpeBRepDS_DoubleMapOfIntegerShape

No detailed docstring for this function.") Assign;
		TopOpeBRepDS_DoubleMapOfIntegerShape & Assign (const TopOpeBRepDS_DoubleMapOfIntegerShape & Other);
		%feature("autodoc", "Args:
	Other(TopOpeBRepDS_DoubleMapOfIntegerShape)

Returns:
	TopOpeBRepDS_DoubleMapOfIntegerShape

No detailed docstring for this function.") operator=;
		TopOpeBRepDS_DoubleMapOfIntegerShape & operator = (const TopOpeBRepDS_DoubleMapOfIntegerShape & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K1(Standard_Integer)
	K2(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") Bind;
		void Bind (Standard_Integer &OutValue,const TopoDS_Shape & K2);
		%feature("autodoc", "Args:
	K1(Standard_Integer)
	K2(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") AreBound;
		Standard_Boolean AreBound (Standard_Integer &OutValue,const TopoDS_Shape & K2);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound1;
		Standard_Boolean IsBound1 (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound2;
		Standard_Boolean IsBound2 (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") Find1;
		const TopoDS_Shape & Find1 (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Integer

No detailed docstring for this function.") Find2;
		const Standard_Integer & Find2 (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind1;
		Standard_Boolean UnBind1 (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind2;
		Standard_Boolean UnBind2 (const TopoDS_Shape & K);
};


%feature("shadow") TopOpeBRepDS_DoubleMapOfIntegerShape::~TopOpeBRepDS_DoubleMapOfIntegerShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_DoubleMapOfIntegerShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_Dumper;
class TopOpeBRepDS_Dumper {
	public:
		%feature("autodoc", "Args:
	HDS(Handle_TopOpeBRepDS_HDataStructure)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_Dumper;
		 TopOpeBRepDS_Dumper (const Handle_TopOpeBRepDS_HDataStructure & HDS);
		%feature("autodoc", "Args:
	C(Handle_Geom_Curve)
	S(Standard_OStream)

Returns:
	static Standard_OStream

No detailed docstring for this function.") PrintType;
		static Standard_OStream & PrintType (const Handle_Geom_Curve & C,Standard_OStream & S);
		%feature("autodoc", "Args:
	C(Handle_Geom2d_Curve)
	S(Standard_OStream)

Returns:
	static Standard_OStream

No detailed docstring for this function.") PrintType;
		static Standard_OStream & PrintType (const Handle_Geom2d_Curve & C,Standard_OStream & S);
		%feature("autodoc", "Args:
	OS(Standard_OStream)
	fk(Standard_Boolean)=Standard_False
	ct(Standard_Boolean)=Standard_True

Returns:
	Standard_OStream

No detailed docstring for this function.") Dump;
		Standard_OStream & Dump (Standard_OStream & OS,const Standard_Boolean fk = Standard_False,const Standard_Boolean ct = Standard_True);
		%feature("autodoc", "Args:
	OS(Standard_OStream)
	fk(Standard_Boolean)=Standard_False
	ct(Standard_Boolean)=Standard_True

Returns:
	Standard_OStream

No detailed docstring for this function.") DumpGeometry;
		Standard_OStream & DumpGeometry (Standard_OStream & OS,const Standard_Boolean fk = Standard_False,const Standard_Boolean ct = Standard_True);
		%feature("autodoc", "Args:
	K(TopOpeBRepDS_Kind)
	OS(Standard_OStream)
	fk(Standard_Boolean)=Standard_False
	ct(Standard_Boolean)=Standard_True

Returns:
	Standard_OStream

No detailed docstring for this function.") DumpGeometry;
		Standard_OStream & DumpGeometry (const TopOpeBRepDS_Kind K,Standard_OStream & OS,const Standard_Boolean fk = Standard_False,const Standard_Boolean ct = Standard_True);
		%feature("autodoc", "Args:
	K(TopOpeBRepDS_Kind)
	I(Standard_Integer)
	OS(Standard_OStream)
	fk(Standard_Boolean)=Standard_False
	ct(Standard_Boolean)=Standard_True

Returns:
	Standard_OStream

No detailed docstring for this function.") DumpGeometry;
		Standard_OStream & DumpGeometry (const TopOpeBRepDS_Kind K,const Standard_Integer I,Standard_OStream & OS,const Standard_Boolean fk = Standard_False,const Standard_Boolean ct = Standard_True);
		%feature("autodoc", "Args:
	OS(Standard_OStream)

Returns:
	Standard_OStream

No detailed docstring for this function.") DumpTopology;
		Standard_OStream & DumpTopology (Standard_OStream & OS);
		%feature("autodoc", "Args:
	K(TopOpeBRepDS_Kind)
	OS(Standard_OStream)

Returns:
	Standard_OStream

No detailed docstring for this function.") DumpTopology;
		Standard_OStream & DumpTopology (const TopOpeBRepDS_Kind K,Standard_OStream & OS);
		%feature("autodoc", "Args:
	T(TopAbs_ShapeEnum)
	OS(Standard_OStream)

Returns:
	Standard_OStream

No detailed docstring for this function.") DumpTopology;
		Standard_OStream & DumpTopology (const TopAbs_ShapeEnum T,Standard_OStream & OS);
		%feature("autodoc", "Args:
	K(TopOpeBRepDS_Kind)
	I(Standard_Integer)
	OS(Standard_OStream)

Returns:
	Standard_OStream

No detailed docstring for this function.") DumpTopology;
		Standard_OStream & DumpTopology (const TopOpeBRepDS_Kind K,const Standard_Integer I,Standard_OStream & OS);
		%feature("autodoc", "Args:
	T(TopAbs_ShapeEnum)
	I(Standard_Integer)
	OS(Standard_OStream)

Returns:
	Standard_OStream

No detailed docstring for this function.") DumpTopology;
		Standard_OStream & DumpTopology (const TopAbs_ShapeEnum T,const Standard_Integer I,Standard_OStream & OS);
		%feature("autodoc", "Args:
	K(TopOpeBRepDS_Kind)
	OS(Standard_OStream)

Returns:
	Standard_OStream

No detailed docstring for this function.") DumpSectionEdge;
		Standard_OStream & DumpSectionEdge (const TopOpeBRepDS_Kind K,Standard_OStream & OS);
		%feature("autodoc", "Args:
	K(TopOpeBRepDS_Kind)
	I(Standard_Integer)
	OS(Standard_OStream)

Returns:
	Standard_OStream

No detailed docstring for this function.") DumpSectionEdge;
		Standard_OStream & DumpSectionEdge (const TopOpeBRepDS_Kind K,const Standard_Integer I,Standard_OStream & OS);
		%feature("autodoc", "Args:
	K(TopOpeBRepDS_Kind)
	I(Standard_Integer)

Returns:
	TCollection_AsciiString

No detailed docstring for this function.") SDumpRefOri;
		TCollection_AsciiString SDumpRefOri (const TopOpeBRepDS_Kind K,const Standard_Integer I);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	TCollection_AsciiString

No detailed docstring for this function.") SDumpRefOri;
		TCollection_AsciiString SDumpRefOri (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	K(TopOpeBRepDS_Kind)
	I(Standard_Integer)
	OS(Standard_OStream)

Returns:
	Standard_OStream

No detailed docstring for this function.") DumpRefOri;
		Standard_OStream & DumpRefOri (const TopOpeBRepDS_Kind K,const Standard_Integer I,Standard_OStream & OS);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	OS(Standard_OStream)

Returns:
	Standard_OStream

No detailed docstring for this function.") DumpRefOri;
		Standard_OStream & DumpRefOri (const TopoDS_Shape & S,Standard_OStream & OS);
		%feature("autodoc", "Args:
	L(TopOpeBRepDS_ListOfInterference)
	O(Standard_OStream)
	s(TCollection_AsciiString)

Returns:
	Standard_OStream

No detailed docstring for this function.") DumpLOI;
		Standard_OStream & DumpLOI (const TopOpeBRepDS_ListOfInterference & L,Standard_OStream & O,const TCollection_AsciiString & s);
		%feature("autodoc", "Args:
	I(Handle_TopOpeBRepDS_Interference)
	O(Standard_OStream)
	s1(TCollection_AsciiString)
	s2(TCollection_AsciiString)

Returns:
	Standard_OStream

No detailed docstring for this function.") DumpI;
		Standard_OStream & DumpI (const Handle_TopOpeBRepDS_Interference & I,Standard_OStream & O,const TCollection_AsciiString & s1,const TCollection_AsciiString & s2);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TCollection_AsciiString

No detailed docstring for this function.") SPrintShape;
		TCollection_AsciiString SPrintShape (const Standard_Integer I);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	TCollection_AsciiString

No detailed docstring for this function.") SPrintShape;
		TCollection_AsciiString SPrintShape (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	B(TCollection_AsciiString)=

Returns:
	TCollection_AsciiString

No detailed docstring for this function.") SPrintShapeRefOri;
		TCollection_AsciiString SPrintShapeRefOri (const TopoDS_Shape & S,const TCollection_AsciiString & B = "");
		%feature("autodoc", "Args:
	L(TopTools_ListOfShape)
	B(TCollection_AsciiString)=

Returns:
	TCollection_AsciiString

No detailed docstring for this function.") SPrintShapeRefOri;
		TCollection_AsciiString SPrintShapeRefOri (const TopTools_ListOfShape & L,const TCollection_AsciiString & B = "");
};


%feature("shadow") TopOpeBRepDS_Dumper::~TopOpeBRepDS_Dumper %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_Dumper {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_EIR;
class TopOpeBRepDS_EIR {
	public:
		%feature("autodoc", "Args:
	HDS(Handle_TopOpeBRepDS_HDataStructure)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_EIR;
		 TopOpeBRepDS_EIR (const Handle_TopOpeBRepDS_HDataStructure & HDS);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ProcessEdgeInterferences;
		void ProcessEdgeInterferences ();
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ProcessEdgeInterferences;
		void ProcessEdgeInterferences (const Standard_Integer I);
};


%feature("shadow") TopOpeBRepDS_EIR::~TopOpeBRepDS_EIR %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_EIR {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_Edge3dInterferenceTool;
class TopOpeBRepDS_Edge3dInterferenceTool {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_Edge3dInterferenceTool;
		 TopOpeBRepDS_Edge3dInterferenceTool ();
		%feature("autodoc", "Args:
	IsVertex(Standard_Integer)
	VonOO(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") InitPointVertex;
		void InitPointVertex (const Standard_Integer IsVertex,const TopoDS_Shape & VonOO);
		%feature("autodoc", "Args:
	Eref(TopoDS_Shape)
	E(TopoDS_Shape)
	F(TopoDS_Shape)
	I(Handle_TopOpeBRepDS_Interference)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const TopoDS_Shape & Eref,const TopoDS_Shape & E,const TopoDS_Shape & F,const Handle_TopOpeBRepDS_Interference & I);
		%feature("autodoc", "Args:
	Eref(TopoDS_Shape)
	E(TopoDS_Shape)
	F(TopoDS_Shape)
	I(Handle_TopOpeBRepDS_Interference)

Returns:
	None

No detailed docstring for this function.") Add;
		void Add (const TopoDS_Shape & Eref,const TopoDS_Shape & E,const TopoDS_Shape & F,const Handle_TopOpeBRepDS_Interference & I);
		%feature("autodoc", "Args:
	I(Handle_TopOpeBRepDS_Interference)

Returns:
	None

No detailed docstring for this function.") Transition;
		void Transition (const Handle_TopOpeBRepDS_Interference & I);
};


%feature("shadow") TopOpeBRepDS_Edge3dInterferenceTool::~TopOpeBRepDS_Edge3dInterferenceTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_Edge3dInterferenceTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_EdgeInterferenceTool;
class TopOpeBRepDS_EdgeInterferenceTool {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_EdgeInterferenceTool;
		 TopOpeBRepDS_EdgeInterferenceTool ();
		%feature("autodoc", "Args:
	E(TopoDS_Shape)
	I(Handle_TopOpeBRepDS_Interference)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const TopoDS_Shape & E,const Handle_TopOpeBRepDS_Interference & I);
		%feature("autodoc", "Args:
	E(TopoDS_Shape)
	V(TopoDS_Shape)
	I(Handle_TopOpeBRepDS_Interference)

Returns:
	None

No detailed docstring for this function.") Add;
		void Add (const TopoDS_Shape & E,const TopoDS_Shape & V,const Handle_TopOpeBRepDS_Interference & I);
		%feature("autodoc", "Args:
	E(TopoDS_Shape)
	P(TopOpeBRepDS_Point)
	I(Handle_TopOpeBRepDS_Interference)

Returns:
	None

No detailed docstring for this function.") Add;
		void Add (const TopoDS_Shape & E,const TopOpeBRepDS_Point & P,const Handle_TopOpeBRepDS_Interference & I);
		%feature("autodoc", "Args:
	I(Handle_TopOpeBRepDS_Interference)

Returns:
	None

No detailed docstring for this function.") Transition;
		void Transition (const Handle_TopOpeBRepDS_Interference & I);
};


%feature("shadow") TopOpeBRepDS_EdgeInterferenceTool::~TopOpeBRepDS_EdgeInterferenceTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_EdgeInterferenceTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_Explorer;
class TopOpeBRepDS_Explorer {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_Explorer;
		 TopOpeBRepDS_Explorer ();
		%feature("autodoc", "Args:
	HDS(Handle_TopOpeBRepDS_HDataStructure)
	T(TopAbs_ShapeEnum)=TopAbs_SHAPE
	findkeep(Standard_Boolean)=Standard_True

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_Explorer;
		 TopOpeBRepDS_Explorer (const Handle_TopOpeBRepDS_HDataStructure & HDS,const TopAbs_ShapeEnum T = TopAbs_SHAPE,const Standard_Boolean findkeep = Standard_True);
		%feature("autodoc", "Args:
	HDS(Handle_TopOpeBRepDS_HDataStructure)
	T(TopAbs_ShapeEnum)=TopAbs_SHAPE
	findkeep(Standard_Boolean)=Standard_True

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_TopOpeBRepDS_HDataStructure & HDS,const TopAbs_ShapeEnum T = TopAbs_SHAPE,const Standard_Boolean findkeep = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_ShapeEnum

No detailed docstring for this function.") Type;
		TopAbs_ShapeEnum Type ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Current;
		const TopoDS_Shape & Current ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Index;
		Standard_Integer Index ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Face

No detailed docstring for this function.") Face;
		const TopoDS_Face & Face ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Edge

No detailed docstring for this function.") Edge;
		const TopoDS_Edge & Edge ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Vertex

No detailed docstring for this function.") Vertex;
		const TopoDS_Vertex & Vertex ();
};


%feature("shadow") TopOpeBRepDS_Explorer::~TopOpeBRepDS_Explorer %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_Explorer {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_FIR;
class TopOpeBRepDS_FIR {
	public:
		%feature("autodoc", "Args:
	HDS(Handle_TopOpeBRepDS_HDataStructure)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_FIR;
		 TopOpeBRepDS_FIR (const Handle_TopOpeBRepDS_HDataStructure & HDS);
		%feature("autodoc", "Args:
	M(TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State)

Returns:
	None

No detailed docstring for this function.") ProcessFaceInterferences;
		void ProcessFaceInterferences (const TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State & M);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	M(TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State)

Returns:
	None

No detailed docstring for this function.") ProcessFaceInterferences;
		void ProcessFaceInterferences (const Standard_Integer I,const TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State & M);
};


%feature("shadow") TopOpeBRepDS_FIR::~TopOpeBRepDS_FIR %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_FIR {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_FaceInterferenceTool;
class TopOpeBRepDS_FaceInterferenceTool {
	public:
		%feature("autodoc", "Args:
	P(TopOpeBRepDS_PDataStructure)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_FaceInterferenceTool;
		 TopOpeBRepDS_FaceInterferenceTool (const TopOpeBRepDS_PDataStructure & P);
		%feature("autodoc", "Args:
	FI(TopoDS_Shape)
	E(TopoDS_Shape)
	Eisnew(Standard_Boolean)
	I(Handle_TopOpeBRepDS_Interference)

Returns:
	None

Eisnew = true if E is a new edge built on edge I->Geometry()  
	        false if E is shape <=> I->Geometry()") Init;
		void Init (const TopoDS_Shape & FI,const TopoDS_Shape & E,const Standard_Boolean Eisnew,const Handle_TopOpeBRepDS_Interference & I);
		%feature("autodoc", "Args:
	FI(TopoDS_Shape)
	F(TopoDS_Shape)
	E(TopoDS_Shape)
	Eisnew(Standard_Boolean)
	I(Handle_TopOpeBRepDS_Interference)

Returns:
	None

Eisnew = true if E is a new edge built on edge I->Geometry()  
	        false if E is shape <=> I->Geometry()") Add;
		void Add (const TopoDS_Shape & FI,const TopoDS_Shape & F,const TopoDS_Shape & E,const Standard_Boolean Eisnew,const Handle_TopOpeBRepDS_Interference & I);
		%feature("autodoc", "Args:
	E(TopoDS_Shape)
	C(TopOpeBRepDS_Curve)
	I(Handle_TopOpeBRepDS_Interference)

Returns:
	None

No detailed docstring for this function.") Add;
		void Add (const TopoDS_Shape & E,const TopOpeBRepDS_Curve & C,const Handle_TopOpeBRepDS_Interference & I);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	par(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetEdgePntPar;
		void SetEdgePntPar (const gp_Pnt & P,const Standard_Real par);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	par(Standard_Real)

Returns:
	None

No detailed docstring for this function.") GetEdgePntPar;
		void GetEdgePntPar (gp_Pnt & P,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEdgePntParDef;
		Standard_Boolean IsEdgePntParDef ();
		%feature("autodoc", "Args:
	I(Handle_TopOpeBRepDS_Interference)

Returns:
	None

No detailed docstring for this function.") Transition;
		void Transition (const Handle_TopOpeBRepDS_Interference & I);
};


%feature("shadow") TopOpeBRepDS_FaceInterferenceTool::~TopOpeBRepDS_FaceInterferenceTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_FaceInterferenceTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_Filter;
class TopOpeBRepDS_Filter {
	public:
		%feature("autodoc", "Args:
	HDS(Handle_TopOpeBRepDS_HDataStructure)
	pClassif(TopOpeBRepTool_PShapeClassifier)=0

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_Filter;
		 TopOpeBRepDS_Filter (const Handle_TopOpeBRepDS_HDataStructure & HDS,const TopOpeBRepTool_PShapeClassifier & pClassif = 0);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ProcessInterferences;
		void ProcessInterferences ();
		%feature("autodoc", "Args:
	MEsp(TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State)

Returns:
	None

No detailed docstring for this function.") ProcessFaceInterferences;
		void ProcessFaceInterferences (const TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State & MEsp);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	MEsp(TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State)

Returns:
	None

No detailed docstring for this function.") ProcessFaceInterferences;
		void ProcessFaceInterferences (const Standard_Integer I,const TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State & MEsp);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ProcessEdgeInterferences;
		void ProcessEdgeInterferences ();
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ProcessEdgeInterferences;
		void ProcessEdgeInterferences (const Standard_Integer I);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ProcessCurveInterferences;
		void ProcessCurveInterferences ();
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ProcessCurveInterferences;
		void ProcessCurveInterferences (const Standard_Integer I);
};


%feature("shadow") TopOpeBRepDS_Filter::~TopOpeBRepDS_Filter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_Filter {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_GapFiller;
class TopOpeBRepDS_GapFiller {
	public:
		%feature("autodoc", "Args:
	HDS(Handle_TopOpeBRepDS_HDataStructure)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_GapFiller;
		 TopOpeBRepDS_GapFiller (const Handle_TopOpeBRepDS_HDataStructure & HDS);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform ();
		%feature("autodoc", "Args:
	I(Handle_TopOpeBRepDS_Interference)
	LI(TopOpeBRepDS_ListOfInterference)

Returns:
	None

Recherche parmi  l'ensemble  des points  d'Interference  
         la Liste <LI> des points qui correspondent au point d'indice <Index>") FindAssociatedPoints;
		void FindAssociatedPoints (const Handle_TopOpeBRepDS_Interference & I,TopOpeBRepDS_ListOfInterference & LI);
		%feature("autodoc", "Args:
	LI(TopOpeBRepDS_ListOfInterference)

Returns:
	Standard_Boolean

//!Enchaine les sections   via  les points d'Interferences  deja  
        associe; Renvoit  dans   <L> les points extremites des Lignes.  Methodes pour  construire la liste des Points qui  
         peuvent correspondre a une Point donne.") CheckConnexity;
		Standard_Boolean CheckConnexity (TopOpeBRepDS_ListOfInterference & LI);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	LI(TopOpeBRepDS_ListOfInterference)

Returns:
	None

No detailed docstring for this function.") AddPointsOnShape;
		void AddPointsOnShape (const TopoDS_Shape & S,TopOpeBRepDS_ListOfInterference & LI);
		%feature("autodoc", "Args:
	F(TopoDS_Shape)
	LI(TopOpeBRepDS_ListOfInterference)

Returns:
	None

Methodes pour  reduire la liste des Points qui  
         peuvent correspondre a une Point donne.") AddPointsOnConnexShape;
		void AddPointsOnConnexShape (const TopoDS_Shape & F,const TopOpeBRepDS_ListOfInterference & LI);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	LI(TopOpeBRepDS_ListOfInterference)

Returns:
	None

No detailed docstring for this function.") FilterByFace;
		void FilterByFace (const TopoDS_Face & F,TopOpeBRepDS_ListOfInterference & LI);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	LI(TopOpeBRepDS_ListOfInterference)

Returns:
	None

No detailed docstring for this function.") FilterByEdge;
		void FilterByEdge (const TopoDS_Edge & E,TopOpeBRepDS_ListOfInterference & LI);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	I(Handle_TopOpeBRepDS_Interference)
	LI(TopOpeBRepDS_ListOfInterference)

Returns:
	None

No detailed docstring for this function.") FilterByIncidentDistance;
		void FilterByIncidentDistance (const TopoDS_Face & F,const Handle_TopOpeBRepDS_Interference & I,TopOpeBRepDS_ListOfInterference & LI);
		%feature("autodoc", "Args:
	I(Handle_TopOpeBRepDS_Interference)
	F(TopoDS_Face)

Returns:
	Standard_Boolean

Return TRUE si I a ete obtenu par une intersection  
         avec <F>.") IsOnFace;
		Standard_Boolean IsOnFace (const Handle_TopOpeBRepDS_Interference & I,const TopoDS_Face & F);
		%feature("autodoc", "Args:
	I(Handle_TopOpeBRepDS_Interference)
	E(TopoDS_Edge)

Returns:
	Standard_Boolean

Return TRUE  si I ou une  de  ses representaions a  
         pour support <E>.  Methodes de  reconstructions des  geometries des point  
         et des courbes de section") IsOnEdge;
		Standard_Boolean IsOnEdge (const Handle_TopOpeBRepDS_Interference & I,const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BuildNewGeometries;
		void BuildNewGeometries ();
		%feature("autodoc", "Args:
	I1(Handle_TopOpeBRepDS_Interference)
	Done(TColStd_MapOfInteger)

Returns:
	None

No detailed docstring for this function.") ReBuildGeom;
		void ReBuildGeom (const Handle_TopOpeBRepDS_Interference & I1,TColStd_MapOfInteger & Done);
};


%feature("shadow") TopOpeBRepDS_GapFiller::~TopOpeBRepDS_GapFiller %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_GapFiller {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_GapTool;
class TopOpeBRepDS_GapTool : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_GapTool;
		 TopOpeBRepDS_GapTool ();
		%feature("autodoc", "Args:
	HDS(Handle_TopOpeBRepDS_HDataStructure)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_GapTool;
		 TopOpeBRepDS_GapTool (const Handle_TopOpeBRepDS_HDataStructure & HDS);
		%feature("autodoc", "Args:
	HDS(Handle_TopOpeBRepDS_HDataStructure)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_TopOpeBRepDS_HDataStructure & HDS);
		%feature("autodoc", "Args:
	IndexPoint(Standard_Integer)

Returns:
	TopOpeBRepDS_ListOfInterference

No detailed docstring for this function.") Interferences;
		const TopOpeBRepDS_ListOfInterference & Interferences (const Standard_Integer IndexPoint);
		%feature("autodoc", "Args:
	I(Handle_TopOpeBRepDS_Interference)

Returns:
	TopOpeBRepDS_ListOfInterference

No detailed docstring for this function.") SameInterferences;
		const TopOpeBRepDS_ListOfInterference & SameInterferences (const Handle_TopOpeBRepDS_Interference & I);
		%feature("autodoc", "Args:
	I(Handle_TopOpeBRepDS_Interference)

Returns:
	TopOpeBRepDS_ListOfInterference

No detailed docstring for this function.") ChangeSameInterferences;
		TopOpeBRepDS_ListOfInterference & ChangeSameInterferences (const Handle_TopOpeBRepDS_Interference & I);
		%feature("autodoc", "Args:
	I(Handle_TopOpeBRepDS_Interference)
	C(TopOpeBRepDS_Curve)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Curve;
		Standard_Boolean Curve (const Handle_TopOpeBRepDS_Interference & I,TopOpeBRepDS_Curve & C);
		%feature("autodoc", "Args:
	I(Handle_TopOpeBRepDS_Interference)
	E(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") EdgeSupport;
		Standard_Boolean EdgeSupport (const Handle_TopOpeBRepDS_Interference & I,TopoDS_Shape & E);
		%feature("autodoc", "Args:
	I(Handle_TopOpeBRepDS_Interference)
	F1(TopoDS_Shape)
	F2(TopoDS_Shape)

Returns:
	Standard_Boolean

Return les faces qui  ont genere la section origine  
         de I") FacesSupport;
		Standard_Boolean FacesSupport (const Handle_TopOpeBRepDS_Interference & I,TopoDS_Shape & F1,TopoDS_Shape & F2);
		%feature("autodoc", "Args:
	I(Handle_TopOpeBRepDS_Interference)
	E(TopoDS_Shape)
	U(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") ParameterOnEdge;
		Standard_Boolean ParameterOnEdge (const Handle_TopOpeBRepDS_Interference & I,const TopoDS_Shape & E,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	I(Handle_TopOpeBRepDS_Interference)
	IndexPoint(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetPoint;
		void SetPoint (const Handle_TopOpeBRepDS_Interference & I,const Standard_Integer IndexPoint);
		%feature("autodoc", "Args:
	I(Handle_TopOpeBRepDS_Interference)
	E(TopoDS_Shape)
	U(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetParameterOnEdge;
		void SetParameterOnEdge (const Handle_TopOpeBRepDS_Interference & I,const TopoDS_Shape & E,const Standard_Real U);
};


%feature("shadow") TopOpeBRepDS_GapTool::~TopOpeBRepDS_GapTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_GapTool {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopOpeBRepDS_GapTool {
	Handle_TopOpeBRepDS_GapTool GetHandle() {
	return *(Handle_TopOpeBRepDS_GapTool*) &$self;
	}
};

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
    TopOpeBRepDS_GapTool* GetObject() {
    return (TopOpeBRepDS_GapTool*)$self->Access();
    }
};
%feature("shadow") Handle_TopOpeBRepDS_GapTool::~Handle_TopOpeBRepDS_GapTool %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopOpeBRepDS_GapTool {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopOpeBRepDS_GeometryData;
class TopOpeBRepDS_GeometryData {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_GeometryData;
		 TopOpeBRepDS_GeometryData ();
		%feature("autodoc", "Args:
	Other(TopOpeBRepDS_GeometryData)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_GeometryData;
		 TopOpeBRepDS_GeometryData (const TopOpeBRepDS_GeometryData & Other);
		%feature("autodoc", "Args:
	Other(TopOpeBRepDS_GeometryData)

Returns:
	None

No detailed docstring for this function.") Assign;
		void Assign (const TopOpeBRepDS_GeometryData & Other);
		%feature("autodoc", "Args:
	Other(TopOpeBRepDS_GeometryData)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const TopOpeBRepDS_GeometryData & Other);
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepDS_ListOfInterference

No detailed docstring for this function.") Interferences;
		const TopOpeBRepDS_ListOfInterference & Interferences ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepDS_ListOfInterference

No detailed docstring for this function.") ChangeInterferences;
		TopOpeBRepDS_ListOfInterference & ChangeInterferences ();
		%feature("autodoc", "Args:
	I(Handle_TopOpeBRepDS_Interference)

Returns:
	None

No detailed docstring for this function.") AddInterference;
		void AddInterference (const Handle_TopOpeBRepDS_Interference & I);
};


%feature("shadow") TopOpeBRepDS_GeometryData::~TopOpeBRepDS_GeometryData %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_GeometryData {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_HArray1OfDataMapOfIntegerListOfInterference;
class TopOpeBRepDS_HArray1OfDataMapOfIntegerListOfInterference : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_HArray1OfDataMapOfIntegerListOfInterference;
		 TopOpeBRepDS_HArray1OfDataMapOfIntegerListOfInterference (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)
	V(TopOpeBRepDS_DataMapOfIntegerListOfInterference)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_HArray1OfDataMapOfIntegerListOfInterference;
		 TopOpeBRepDS_HArray1OfDataMapOfIntegerListOfInterference (const Standard_Integer Low,const Standard_Integer Up,const TopOpeBRepDS_DataMapOfIntegerListOfInterference & V);
		%feature("autodoc", "Args:
	V(TopOpeBRepDS_DataMapOfIntegerListOfInterference)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const TopOpeBRepDS_DataMapOfIntegerListOfInterference & V);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(TopOpeBRepDS_DataMapOfIntegerListOfInterference)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const TopOpeBRepDS_DataMapOfIntegerListOfInterference & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TopOpeBRepDS_DataMapOfIntegerListOfInterference

No detailed docstring for this function.") Value;
		const TopOpeBRepDS_DataMapOfIntegerListOfInterference & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TopOpeBRepDS_DataMapOfIntegerListOfInterference

No detailed docstring for this function.") ChangeValue;
		TopOpeBRepDS_DataMapOfIntegerListOfInterference & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepDS_Array1OfDataMapOfIntegerListOfInterference

No detailed docstring for this function.") Array1;
		const TopOpeBRepDS_Array1OfDataMapOfIntegerListOfInterference & Array1 ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepDS_Array1OfDataMapOfIntegerListOfInterference

No detailed docstring for this function.") ChangeArray1;
		TopOpeBRepDS_Array1OfDataMapOfIntegerListOfInterference & ChangeArray1 ();
};


%feature("shadow") TopOpeBRepDS_HArray1OfDataMapOfIntegerListOfInterference::~TopOpeBRepDS_HArray1OfDataMapOfIntegerListOfInterference %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_HArray1OfDataMapOfIntegerListOfInterference {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopOpeBRepDS_HArray1OfDataMapOfIntegerListOfInterference {
	Handle_TopOpeBRepDS_HArray1OfDataMapOfIntegerListOfInterference GetHandle() {
	return *(Handle_TopOpeBRepDS_HArray1OfDataMapOfIntegerListOfInterference*) &$self;
	}
};

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
    TopOpeBRepDS_HArray1OfDataMapOfIntegerListOfInterference* GetObject() {
    return (TopOpeBRepDS_HArray1OfDataMapOfIntegerListOfInterference*)$self->Access();
    }
};
%feature("shadow") Handle_TopOpeBRepDS_HArray1OfDataMapOfIntegerListOfInterference::~Handle_TopOpeBRepDS_HArray1OfDataMapOfIntegerListOfInterference %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopOpeBRepDS_HArray1OfDataMapOfIntegerListOfInterference {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfShapeWithState;
class TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfShapeWithState : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K1(TopoDS_Shape)
	K2(Standard_Integer)
	I(TopOpeBRepDS_ShapeWithState)
	n1(TCollection_MapNodePtr)
	n2(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfShapeWithState;
		 TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfShapeWithState (const TopoDS_Shape & K1,const Standard_Integer K2,const TopOpeBRepDS_ShapeWithState & I,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key1;
		TopoDS_Shape & Key1 ();

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
            		%feature("autodoc", "Args:
	None
Returns:
	TCollection_MapNodePtr

No detailed docstring for this function.") Next2;
		TCollection_MapNodePtr & Next2 ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepDS_ShapeWithState

No detailed docstring for this function.") Value;
		TopOpeBRepDS_ShapeWithState & Value ();
};


%feature("shadow") TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfShapeWithState::~TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfShapeWithState %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfShapeWithState {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfShapeWithState {
	Handle_TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfShapeWithState GetHandle() {
	return *(Handle_TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfShapeWithState*) &$self;
	}
};

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
    TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfShapeWithState* GetObject() {
    return (TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfShapeWithState*)$self->Access();
    }
};
%feature("shadow") Handle_TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfShapeWithState::~Handle_TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfShapeWithState %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfShapeWithState {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfVertexPoint;
class TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfVertexPoint : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K1(TopoDS_Shape)
	K2(Standard_Integer)
	I(TopOpeBRepDS_Point)
	n1(TCollection_MapNodePtr)
	n2(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfVertexPoint;
		 TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfVertexPoint (const TopoDS_Shape & K1,const Standard_Integer K2,const TopOpeBRepDS_Point & I,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key1;
		TopoDS_Shape & Key1 ();

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
            		%feature("autodoc", "Args:
	None
Returns:
	TCollection_MapNodePtr

No detailed docstring for this function.") Next2;
		TCollection_MapNodePtr & Next2 ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepDS_Point

No detailed docstring for this function.") Value;
		TopOpeBRepDS_Point & Value ();
};


%feature("shadow") TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfVertexPoint::~TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfVertexPoint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfVertexPoint {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfVertexPoint {
	Handle_TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfVertexPoint GetHandle() {
	return *(Handle_TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfVertexPoint*) &$self;
	}
};

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
    TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfVertexPoint* GetObject() {
    return (TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfVertexPoint*)$self->Access();
    }
};
%feature("shadow") Handle_TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfVertexPoint::~Handle_TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfVertexPoint %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopOpeBRepDS_IndexedDataMapNodeOfIndexedDataMapOfVertexPoint {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopOpeBRepDS_IndexedDataMapNodeOfMapOfShapeData;
class TopOpeBRepDS_IndexedDataMapNodeOfMapOfShapeData : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K1(TopoDS_Shape)
	K2(Standard_Integer)
	I(TopOpeBRepDS_ShapeData)
	n1(TCollection_MapNodePtr)
	n2(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_IndexedDataMapNodeOfMapOfShapeData;
		 TopOpeBRepDS_IndexedDataMapNodeOfMapOfShapeData (const TopoDS_Shape & K1,const Standard_Integer K2,const TopOpeBRepDS_ShapeData & I,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key1;
		TopoDS_Shape & Key1 ();

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
            		%feature("autodoc", "Args:
	None
Returns:
	TCollection_MapNodePtr

No detailed docstring for this function.") Next2;
		TCollection_MapNodePtr & Next2 ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepDS_ShapeData

No detailed docstring for this function.") Value;
		TopOpeBRepDS_ShapeData & Value ();
};


%feature("shadow") TopOpeBRepDS_IndexedDataMapNodeOfMapOfShapeData::~TopOpeBRepDS_IndexedDataMapNodeOfMapOfShapeData %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_IndexedDataMapNodeOfMapOfShapeData {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopOpeBRepDS_IndexedDataMapNodeOfMapOfShapeData {
	Handle_TopOpeBRepDS_IndexedDataMapNodeOfMapOfShapeData GetHandle() {
	return *(Handle_TopOpeBRepDS_IndexedDataMapNodeOfMapOfShapeData*) &$self;
	}
};

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
    TopOpeBRepDS_IndexedDataMapNodeOfMapOfShapeData* GetObject() {
    return (TopOpeBRepDS_IndexedDataMapNodeOfMapOfShapeData*)$self->Access();
    }
};
%feature("shadow") Handle_TopOpeBRepDS_IndexedDataMapNodeOfMapOfShapeData::~Handle_TopOpeBRepDS_IndexedDataMapNodeOfMapOfShapeData %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopOpeBRepDS_IndexedDataMapNodeOfMapOfShapeData {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopOpeBRepDS_IndexedDataMapOfShapeWithState;
class TopOpeBRepDS_IndexedDataMapOfShapeWithState : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_IndexedDataMapOfShapeWithState;
		 TopOpeBRepDS_IndexedDataMapOfShapeWithState (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(TopOpeBRepDS_IndexedDataMapOfShapeWithState)

Returns:
	TopOpeBRepDS_IndexedDataMapOfShapeWithState

No detailed docstring for this function.") Assign;
		TopOpeBRepDS_IndexedDataMapOfShapeWithState & Assign (const TopOpeBRepDS_IndexedDataMapOfShapeWithState & Other);
		%feature("autodoc", "Args:
	Other(TopOpeBRepDS_IndexedDataMapOfShapeWithState)

Returns:
	TopOpeBRepDS_IndexedDataMapOfShapeWithState

No detailed docstring for this function.") operator=;
		TopOpeBRepDS_IndexedDataMapOfShapeWithState & operator = (const TopOpeBRepDS_IndexedDataMapOfShapeWithState & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(TopOpeBRepDS_ShapeWithState)

Returns:
	Standard_Integer

No detailed docstring for this function.") Add;
		Standard_Integer Add (const TopoDS_Shape & K,const TopOpeBRepDS_ShapeWithState & I);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	K(TopoDS_Shape)
	T(TopOpeBRepDS_ShapeWithState)

Returns:
	None

No detailed docstring for this function.") Substitute;
		void Substitute (const Standard_Integer I,const TopoDS_Shape & K,const TopOpeBRepDS_ShapeWithState & T);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveLast;
		void RemoveLast ();
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Contains;
		Standard_Boolean Contains (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") FindKey;
		const TopoDS_Shape & FindKey (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopOpeBRepDS_ShapeWithState

No detailed docstring for this function.") FindFromIndex;
		const TopOpeBRepDS_ShapeWithState & FindFromIndex (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopOpeBRepDS_ShapeWithState

No detailed docstring for this function.") ChangeFromIndex;
		TopOpeBRepDS_ShapeWithState & ChangeFromIndex (const Standard_Integer I);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Integer

No detailed docstring for this function.") FindIndex;
		Standard_Integer FindIndex (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	TopOpeBRepDS_ShapeWithState

No detailed docstring for this function.") FindFromKey;
		const TopOpeBRepDS_ShapeWithState & FindFromKey (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	TopOpeBRepDS_ShapeWithState

No detailed docstring for this function.") ChangeFromKey;
		TopOpeBRepDS_ShapeWithState & ChangeFromKey (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") FindFromKey1;
		Standard_Address FindFromKey1 (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFromKey1;
		Standard_Address ChangeFromKey1 (const TopoDS_Shape & K);
};


%feature("shadow") TopOpeBRepDS_IndexedDataMapOfShapeWithState::~TopOpeBRepDS_IndexedDataMapOfShapeWithState %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_IndexedDataMapOfShapeWithState {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_IndexedDataMapOfVertexPoint;
class TopOpeBRepDS_IndexedDataMapOfVertexPoint : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_IndexedDataMapOfVertexPoint;
		 TopOpeBRepDS_IndexedDataMapOfVertexPoint (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(TopOpeBRepDS_IndexedDataMapOfVertexPoint)

Returns:
	TopOpeBRepDS_IndexedDataMapOfVertexPoint

No detailed docstring for this function.") Assign;
		TopOpeBRepDS_IndexedDataMapOfVertexPoint & Assign (const TopOpeBRepDS_IndexedDataMapOfVertexPoint & Other);
		%feature("autodoc", "Args:
	Other(TopOpeBRepDS_IndexedDataMapOfVertexPoint)

Returns:
	TopOpeBRepDS_IndexedDataMapOfVertexPoint

No detailed docstring for this function.") operator=;
		TopOpeBRepDS_IndexedDataMapOfVertexPoint & operator = (const TopOpeBRepDS_IndexedDataMapOfVertexPoint & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(TopOpeBRepDS_Point)

Returns:
	Standard_Integer

No detailed docstring for this function.") Add;
		Standard_Integer Add (const TopoDS_Shape & K,const TopOpeBRepDS_Point & I);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	K(TopoDS_Shape)
	T(TopOpeBRepDS_Point)

Returns:
	None

No detailed docstring for this function.") Substitute;
		void Substitute (const Standard_Integer I,const TopoDS_Shape & K,const TopOpeBRepDS_Point & T);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveLast;
		void RemoveLast ();
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Contains;
		Standard_Boolean Contains (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") FindKey;
		const TopoDS_Shape & FindKey (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopOpeBRepDS_Point

No detailed docstring for this function.") FindFromIndex;
		const TopOpeBRepDS_Point & FindFromIndex (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopOpeBRepDS_Point

No detailed docstring for this function.") ChangeFromIndex;
		TopOpeBRepDS_Point & ChangeFromIndex (const Standard_Integer I);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Integer

No detailed docstring for this function.") FindIndex;
		Standard_Integer FindIndex (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	TopOpeBRepDS_Point

No detailed docstring for this function.") FindFromKey;
		const TopOpeBRepDS_Point & FindFromKey (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	TopOpeBRepDS_Point

No detailed docstring for this function.") ChangeFromKey;
		TopOpeBRepDS_Point & ChangeFromKey (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") FindFromKey1;
		Standard_Address FindFromKey1 (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFromKey1;
		Standard_Address ChangeFromKey1 (const TopoDS_Shape & K);
};


%feature("shadow") TopOpeBRepDS_IndexedDataMapOfVertexPoint::~TopOpeBRepDS_IndexedDataMapOfVertexPoint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_IndexedDataMapOfVertexPoint {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_Interference;
class TopOpeBRepDS_Interference : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_Interference;
		 TopOpeBRepDS_Interference ();
		%feature("autodoc", "Args:
	Transition(TopOpeBRepDS_Transition)
	SupportType(TopOpeBRepDS_Kind)
	Support(Standard_Integer)
	GeometryType(TopOpeBRepDS_Kind)
	Geometry(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_Interference;
		 TopOpeBRepDS_Interference (const TopOpeBRepDS_Transition & Transition,const TopOpeBRepDS_Kind SupportType,const Standard_Integer Support,const TopOpeBRepDS_Kind GeometryType,const Standard_Integer Geometry);
		%feature("autodoc", "Args:
	I(Handle_TopOpeBRepDS_Interference)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_Interference;
		 TopOpeBRepDS_Interference (const Handle_TopOpeBRepDS_Interference & I);
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepDS_Transition

No detailed docstring for this function.") Transition;
		const TopOpeBRepDS_Transition & Transition ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepDS_Transition

No detailed docstring for this function.") ChangeTransition;
		TopOpeBRepDS_Transition & ChangeTransition ();
		%feature("autodoc", "Args:
	T(TopOpeBRepDS_Transition)

Returns:
	None

No detailed docstring for this function.") Transition;
		void Transition (const TopOpeBRepDS_Transition & T);
		%feature("autodoc", "Args:
	GK(TopOpeBRepDS_Kind)
	G(Standard_Integer)
	SK(TopOpeBRepDS_Kind)
	S(Standard_Integer)

Returns:
	None

return GeometryType + Geometry + SupportType + Support") GKGSKS;
		void GKGSKS (TopOpeBRepDS_Kind & GK,Standard_Integer &OutValue,TopOpeBRepDS_Kind & SK,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepDS_Kind

No detailed docstring for this function.") SupportType;
		TopOpeBRepDS_Kind SupportType ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Support;
		Standard_Integer Support ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepDS_Kind

No detailed docstring for this function.") GeometryType;
		TopOpeBRepDS_Kind GeometryType ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Geometry;
		Standard_Integer Geometry ();
		%feature("autodoc", "Args:
	GI(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetGeometry;
		void SetGeometry (const Standard_Integer GI);
		%feature("autodoc", "Args:
	ST(TopOpeBRepDS_Kind)

Returns:
	None

No detailed docstring for this function.") SupportType;
		void SupportType (const TopOpeBRepDS_Kind ST);
		%feature("autodoc", "Args:
	S(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Support;
		void Support (const Standard_Integer S);
		%feature("autodoc", "Args:
	GT(TopOpeBRepDS_Kind)

Returns:
	None

No detailed docstring for this function.") GeometryType;
		void GeometryType (const TopOpeBRepDS_Kind GT);
		%feature("autodoc", "Args:
	G(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Geometry;
		void Geometry (const Standard_Integer G);
		%feature("autodoc", "Args:
	Other(Handle_TopOpeBRepDS_Interference)

Returns:
	Standard_Boolean

No detailed docstring for this function.") HasSameSupport;
		Standard_Boolean HasSameSupport (const Handle_TopOpeBRepDS_Interference & Other);
		%feature("autodoc", "Args:
	Other(Handle_TopOpeBRepDS_Interference)

Returns:
	Standard_Boolean

No detailed docstring for this function.") HasSameGeometry;
		Standard_Boolean HasSameGeometry (const Handle_TopOpeBRepDS_Interference & Other);
		%feature("autodoc", "Args:
	OS(Standard_OStream)

Returns:
	Standard_OStream

No detailed docstring for this function.") DumpG;
		Standard_OStream & DumpG (Standard_OStream & OS);
		%feature("autodoc", "Args:
	OS(Standard_OStream)

Returns:
	Standard_OStream

No detailed docstring for this function.") DumpS;
		Standard_OStream & DumpS (Standard_OStream & OS);
		%feature("autodoc", "Args:
	OS(Standard_OStream)

Returns:
	virtual Standard_OStream

No detailed docstring for this function.") Dump;
		virtual Standard_OStream & Dump (Standard_OStream & OS);
		%feature("autodoc", "Args:
	OS(Standard_OStream)
	s1(TCollection_AsciiString)
	s2(TCollection_AsciiString)

Returns:
	Standard_OStream

No detailed docstring for this function.") Dump;
		Standard_OStream & Dump (Standard_OStream & OS,const TCollection_AsciiString & s1,const TCollection_AsciiString & s2);
};


%feature("shadow") TopOpeBRepDS_Interference::~TopOpeBRepDS_Interference %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_Interference {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopOpeBRepDS_Interference {
	Handle_TopOpeBRepDS_Interference GetHandle() {
	return *(Handle_TopOpeBRepDS_Interference*) &$self;
	}
};

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
    TopOpeBRepDS_Interference* GetObject() {
    return (TopOpeBRepDS_Interference*)$self->Access();
    }
};
%feature("shadow") Handle_TopOpeBRepDS_Interference::~Handle_TopOpeBRepDS_Interference %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopOpeBRepDS_Interference {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopOpeBRepDS_InterferenceIterator;
class TopOpeBRepDS_InterferenceIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_InterferenceIterator;
		 TopOpeBRepDS_InterferenceIterator ();
		%feature("autodoc", "Args:
	L(TopOpeBRepDS_ListOfInterference)

Returns:
	None

Creates an iterator on the Interference of list <L>.") TopOpeBRepDS_InterferenceIterator;
		 TopOpeBRepDS_InterferenceIterator (const TopOpeBRepDS_ListOfInterference & L);
		%feature("autodoc", "Args:
	L(TopOpeBRepDS_ListOfInterference)

Returns:
	None

re-initialize  interference iteration  process  on  
         the list of interference <L>.  
         Conditions are not modified.") Init;
		void Init (const TopOpeBRepDS_ListOfInterference & L);
		%feature("autodoc", "Args:
	GK(TopOpeBRepDS_Kind)

Returns:
	None

define a condition on interference iteration process.  
         Interference must match the Geometry Kind <ST>") GeometryKind;
		void GeometryKind (const TopOpeBRepDS_Kind GK);
		%feature("autodoc", "Args:
	G(Standard_Integer)

Returns:
	None

define a condition on interference iteration process.  
         Interference must match the Geometry <G>") Geometry;
		void Geometry (const Standard_Integer G);
		%feature("autodoc", "Args:
	ST(TopOpeBRepDS_Kind)

Returns:
	None

define a condition on interference iteration process.  
         Interference must match the Support Kind <ST>") SupportKind;
		void SupportKind (const TopOpeBRepDS_Kind ST);
		%feature("autodoc", "Args:
	S(Standard_Integer)

Returns:
	None

define a condition on interference iteration process.  
         Interference must match the Support <S>") Support;
		void Support (const Standard_Integer S);
		%feature("autodoc", "Args:
	None
Returns:
	None

reach for an interference  matching the conditions  
         (if  defined).") Match;
		void Match ();
		%feature("autodoc", "Args:
	I(Handle_TopOpeBRepDS_Interference)

Returns:
	virtual Standard_Boolean

Returns  True if the Interference <I>  matches the  
         conditions (if defined).  
         If no conditions defined, returns True.") MatchInterference;
		virtual Standard_Boolean MatchInterference (const Handle_TopOpeBRepDS_Interference & I);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if there is a current Interference in  
         the iteration.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Move to the next Interference.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopOpeBRepDS_Interference

Returns   the   current   Interference,   matching   the  
         conditions  (if defined).") Value;
		Handle_TopOpeBRepDS_Interference & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepDS_ListIteratorOfListOfInterference

No detailed docstring for this function.") ChangeIterator;
		TopOpeBRepDS_ListIteratorOfListOfInterference & ChangeIterator ();
};


%feature("shadow") TopOpeBRepDS_InterferenceIterator::~TopOpeBRepDS_InterferenceIterator %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_InterferenceIterator {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_InterferenceTool;
class TopOpeBRepDS_InterferenceTool {
	public:
		%feature("autodoc", "Args:
	T(TopOpeBRepDS_Transition)
	SK(TopOpeBRepDS_Kind)
	SI(Standard_Integer)
	GK(TopOpeBRepDS_Kind)
	GI(Standard_Integer)
	P(Standard_Real)

Returns:
	static Handle_TopOpeBRepDS_Interference

No detailed docstring for this function.") MakeEdgeInterference;
		static Handle_TopOpeBRepDS_Interference MakeEdgeInterference (const TopOpeBRepDS_Transition & T,const TopOpeBRepDS_Kind SK,const Standard_Integer SI,const TopOpeBRepDS_Kind GK,const Standard_Integer GI,const Standard_Real P);
		%feature("autodoc", "Args:
	T(TopOpeBRepDS_Transition)
	SK(TopOpeBRepDS_Kind)
	SI(Standard_Integer)
	GK(TopOpeBRepDS_Kind)
	GI(Standard_Integer)
	P(Standard_Real)

Returns:
	static Handle_TopOpeBRepDS_Interference

No detailed docstring for this function.") MakeCurveInterference;
		static Handle_TopOpeBRepDS_Interference MakeCurveInterference (const TopOpeBRepDS_Transition & T,const TopOpeBRepDS_Kind SK,const Standard_Integer SI,const TopOpeBRepDS_Kind GK,const Standard_Integer GI,const Standard_Real P);
		%feature("autodoc", "Args:
	I(Handle_TopOpeBRepDS_Interference)

Returns:
	static Handle_TopOpeBRepDS_Interference

duplicate I in a new interference with Complement() transition.") DuplicateCurvePointInterference;
		static Handle_TopOpeBRepDS_Interference DuplicateCurvePointInterference (const Handle_TopOpeBRepDS_Interference & I);
		%feature("autodoc", "Args:
	Transition(TopOpeBRepDS_Transition)
	FaceI(Standard_Integer)
	CurveI(Standard_Integer)
	PC(Handle_Geom2d_Curve)

Returns:
	static Handle_TopOpeBRepDS_Interference

No detailed docstring for this function.") MakeFaceCurveInterference;
		static Handle_TopOpeBRepDS_Interference MakeFaceCurveInterference (const TopOpeBRepDS_Transition & Transition,const Standard_Integer FaceI,const Standard_Integer CurveI,const Handle_Geom2d_Curve & PC);
		%feature("autodoc", "Args:
	Transition(TopOpeBRepDS_Transition)
	SolidI(Standard_Integer)
	SurfaceI(Standard_Integer)

Returns:
	static Handle_TopOpeBRepDS_Interference

No detailed docstring for this function.") MakeSolidSurfaceInterference;
		static Handle_TopOpeBRepDS_Interference MakeSolidSurfaceInterference (const TopOpeBRepDS_Transition & Transition,const Standard_Integer SolidI,const Standard_Integer SurfaceI);
		%feature("autodoc", "Args:
	Transition(TopOpeBRepDS_Transition)
	EdgeI(Standard_Integer)
	VertexI(Standard_Integer)
	VertexIsBound(Standard_Boolean)
	Config(TopOpeBRepDS_Config)
	param(Standard_Real)

Returns:
	static Handle_TopOpeBRepDS_Interference

No detailed docstring for this function.") MakeEdgeVertexInterference;
		static Handle_TopOpeBRepDS_Interference MakeEdgeVertexInterference (const TopOpeBRepDS_Transition & Transition,const Standard_Integer EdgeI,const Standard_Integer VertexI,const Standard_Boolean VertexIsBound,const TopOpeBRepDS_Config Config,const Standard_Real param);
		%feature("autodoc", "Args:
	Transition(TopOpeBRepDS_Transition)
	FaceI(Standard_Integer)
	EdgeI(Standard_Integer)
	EdgeIsBound(Standard_Boolean)
	Config(TopOpeBRepDS_Config)

Returns:
	static Handle_TopOpeBRepDS_Interference

No detailed docstring for this function.") MakeFaceEdgeInterference;
		static Handle_TopOpeBRepDS_Interference MakeFaceEdgeInterference (const TopOpeBRepDS_Transition & Transition,const Standard_Integer FaceI,const Standard_Integer EdgeI,const Standard_Boolean EdgeIsBound,const TopOpeBRepDS_Config Config);
		%feature("autodoc", "Args:
	CPI(Handle_TopOpeBRepDS_Interference)

Returns:
	static Standard_Real

No detailed docstring for this function.") Parameter;
		static Standard_Real Parameter (const Handle_TopOpeBRepDS_Interference & CPI);
		%feature("autodoc", "Args:
	CPI(Handle_TopOpeBRepDS_Interference)
	Par(Standard_Real)

Returns:
	static void

No detailed docstring for this function.") Parameter;
		static void Parameter (const Handle_TopOpeBRepDS_Interference & CPI,const Standard_Real Par);
};


%feature("shadow") TopOpeBRepDS_InterferenceTool::~TopOpeBRepDS_InterferenceTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_InterferenceTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_ListIteratorOfListOfInterference;
class TopOpeBRepDS_ListIteratorOfListOfInterference {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_ListIteratorOfListOfInterference;
		 TopOpeBRepDS_ListIteratorOfListOfInterference ();
		%feature("autodoc", "Args:
	L(TopOpeBRepDS_ListOfInterference)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_ListIteratorOfListOfInterference;
		 TopOpeBRepDS_ListIteratorOfListOfInterference (const TopOpeBRepDS_ListOfInterference & L);
		%feature("autodoc", "Args:
	L(TopOpeBRepDS_ListOfInterference)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TopOpeBRepDS_ListOfInterference & L);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopOpeBRepDS_Interference

No detailed docstring for this function.") Value;
		Handle_TopOpeBRepDS_Interference & Value ();
};


%feature("shadow") TopOpeBRepDS_ListIteratorOfListOfInterference::~TopOpeBRepDS_ListIteratorOfListOfInterference %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_ListIteratorOfListOfInterference {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_ListNodeOfListOfInterference;
class TopOpeBRepDS_ListNodeOfListOfInterference : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	I(Handle_TopOpeBRepDS_Interference)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_ListNodeOfListOfInterference;
		 TopOpeBRepDS_ListNodeOfListOfInterference (const Handle_TopOpeBRepDS_Interference & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopOpeBRepDS_Interference

No detailed docstring for this function.") Value;
		Handle_TopOpeBRepDS_Interference & Value ();
};


%feature("shadow") TopOpeBRepDS_ListNodeOfListOfInterference::~TopOpeBRepDS_ListNodeOfListOfInterference %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_ListNodeOfListOfInterference {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopOpeBRepDS_ListNodeOfListOfInterference {
	Handle_TopOpeBRepDS_ListNodeOfListOfInterference GetHandle() {
	return *(Handle_TopOpeBRepDS_ListNodeOfListOfInterference*) &$self;
	}
};

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
    TopOpeBRepDS_ListNodeOfListOfInterference* GetObject() {
    return (TopOpeBRepDS_ListNodeOfListOfInterference*)$self->Access();
    }
};
%feature("shadow") Handle_TopOpeBRepDS_ListNodeOfListOfInterference::~Handle_TopOpeBRepDS_ListNodeOfListOfInterference %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopOpeBRepDS_ListNodeOfListOfInterference {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopOpeBRepDS_ListOfInterference;
class TopOpeBRepDS_ListOfInterference {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_ListOfInterference;
		 TopOpeBRepDS_ListOfInterference ();
		%feature("autodoc", "Args:
	Other(TopOpeBRepDS_ListOfInterference)

Returns:
	None

No detailed docstring for this function.") Assign;
		void Assign (const TopOpeBRepDS_ListOfInterference & Other);
		%feature("autodoc", "Args:
	Other(TopOpeBRepDS_ListOfInterference)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const TopOpeBRepDS_ListOfInterference & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	I(Handle_TopOpeBRepDS_Interference)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_TopOpeBRepDS_Interference & I);
		%feature("autodoc", "Args:
	I(Handle_TopOpeBRepDS_Interference)
	theIt(TopOpeBRepDS_ListIteratorOfListOfInterference)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_TopOpeBRepDS_Interference & I,TopOpeBRepDS_ListIteratorOfListOfInterference & theIt);
		%feature("autodoc", "Args:
	Other(TopOpeBRepDS_ListOfInterference)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (TopOpeBRepDS_ListOfInterference & Other);
		%feature("autodoc", "Args:
	I(Handle_TopOpeBRepDS_Interference)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_TopOpeBRepDS_Interference & I);
		%feature("autodoc", "Args:
	I(Handle_TopOpeBRepDS_Interference)
	theIt(TopOpeBRepDS_ListIteratorOfListOfInterference)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_TopOpeBRepDS_Interference & I,TopOpeBRepDS_ListIteratorOfListOfInterference & theIt);
		%feature("autodoc", "Args:
	Other(TopOpeBRepDS_ListOfInterference)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (TopOpeBRepDS_ListOfInterference & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopOpeBRepDS_Interference

No detailed docstring for this function.") First;
		Handle_TopOpeBRepDS_Interference & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopOpeBRepDS_Interference

No detailed docstring for this function.") Last;
		Handle_TopOpeBRepDS_Interference & Last ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "Args:
	It(TopOpeBRepDS_ListIteratorOfListOfInterference)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (TopOpeBRepDS_ListIteratorOfListOfInterference & It);
		%feature("autodoc", "Args:
	I(Handle_TopOpeBRepDS_Interference)
	It(TopOpeBRepDS_ListIteratorOfListOfInterference)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Handle_TopOpeBRepDS_Interference & I,TopOpeBRepDS_ListIteratorOfListOfInterference & It);
		%feature("autodoc", "Args:
	Other(TopOpeBRepDS_ListOfInterference)
	It(TopOpeBRepDS_ListIteratorOfListOfInterference)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (TopOpeBRepDS_ListOfInterference & Other,TopOpeBRepDS_ListIteratorOfListOfInterference & It);
		%feature("autodoc", "Args:
	I(Handle_TopOpeBRepDS_Interference)
	It(TopOpeBRepDS_ListIteratorOfListOfInterference)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Handle_TopOpeBRepDS_Interference & I,TopOpeBRepDS_ListIteratorOfListOfInterference & It);
		%feature("autodoc", "Args:
	Other(TopOpeBRepDS_ListOfInterference)
	It(TopOpeBRepDS_ListIteratorOfListOfInterference)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (TopOpeBRepDS_ListOfInterference & Other,TopOpeBRepDS_ListIteratorOfListOfInterference & It);
};


%feature("shadow") TopOpeBRepDS_ListOfInterference::~TopOpeBRepDS_ListOfInterference %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_ListOfInterference {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_ListOfShapeOn1State;
class TopOpeBRepDS_ListOfShapeOn1State {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_ListOfShapeOn1State;
		 TopOpeBRepDS_ListOfShapeOn1State ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") ListOnState;
		const TopTools_ListOfShape & ListOnState ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") ChangeListOnState;
		TopTools_ListOfShape & ChangeListOnState ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsSplit;
		Standard_Boolean IsSplit ();
		%feature("autodoc", "Args:
	B(Standard_Boolean)=Standard_True

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Boolean B = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
};


%feature("shadow") TopOpeBRepDS_ListOfShapeOn1State::~TopOpeBRepDS_ListOfShapeOn1State %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_ListOfShapeOn1State {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_MapOfCurve;
class TopOpeBRepDS_MapOfCurve : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_MapOfCurve;
		 TopOpeBRepDS_MapOfCurve (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(TopOpeBRepDS_MapOfCurve)

Returns:
	TopOpeBRepDS_MapOfCurve

No detailed docstring for this function.") Assign;
		TopOpeBRepDS_MapOfCurve & Assign (const TopOpeBRepDS_MapOfCurve & Other);
		%feature("autodoc", "Args:
	Other(TopOpeBRepDS_MapOfCurve)

Returns:
	TopOpeBRepDS_MapOfCurve

No detailed docstring for this function.") operator=;
		TopOpeBRepDS_MapOfCurve & operator = (const TopOpeBRepDS_MapOfCurve & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(Standard_Integer)
	I(TopOpeBRepDS_CurveData)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (Standard_Integer &OutValue,const TopOpeBRepDS_CurveData & I);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	TopOpeBRepDS_CurveData

No detailed docstring for this function.") Find;
		const TopOpeBRepDS_CurveData & Find (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	TopOpeBRepDS_CurveData

No detailed docstring for this function.") ChangeFind;
		TopOpeBRepDS_CurveData & ChangeFind (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
		Standard_Address ChangeFind1 (Standard_Integer &OutValue);
};


%feature("shadow") TopOpeBRepDS_MapOfCurve::~TopOpeBRepDS_MapOfCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_MapOfCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_MapOfIntegerShapeData;
class TopOpeBRepDS_MapOfIntegerShapeData : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_MapOfIntegerShapeData;
		 TopOpeBRepDS_MapOfIntegerShapeData (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(TopOpeBRepDS_MapOfIntegerShapeData)

Returns:
	TopOpeBRepDS_MapOfIntegerShapeData

No detailed docstring for this function.") Assign;
		TopOpeBRepDS_MapOfIntegerShapeData & Assign (const TopOpeBRepDS_MapOfIntegerShapeData & Other);
		%feature("autodoc", "Args:
	Other(TopOpeBRepDS_MapOfIntegerShapeData)

Returns:
	TopOpeBRepDS_MapOfIntegerShapeData

No detailed docstring for this function.") operator=;
		TopOpeBRepDS_MapOfIntegerShapeData & operator = (const TopOpeBRepDS_MapOfIntegerShapeData & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(Standard_Integer)
	I(TopOpeBRepDS_ShapeData)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (Standard_Integer &OutValue,const TopOpeBRepDS_ShapeData & I);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	TopOpeBRepDS_ShapeData

No detailed docstring for this function.") Find;
		const TopOpeBRepDS_ShapeData & Find (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	TopOpeBRepDS_ShapeData

No detailed docstring for this function.") ChangeFind;
		TopOpeBRepDS_ShapeData & ChangeFind (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
		Standard_Address ChangeFind1 (Standard_Integer &OutValue);
};


%feature("shadow") TopOpeBRepDS_MapOfIntegerShapeData::~TopOpeBRepDS_MapOfIntegerShapeData %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_MapOfIntegerShapeData {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_MapOfPoint;
class TopOpeBRepDS_MapOfPoint : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_MapOfPoint;
		 TopOpeBRepDS_MapOfPoint (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(TopOpeBRepDS_MapOfPoint)

Returns:
	TopOpeBRepDS_MapOfPoint

No detailed docstring for this function.") Assign;
		TopOpeBRepDS_MapOfPoint & Assign (const TopOpeBRepDS_MapOfPoint & Other);
		%feature("autodoc", "Args:
	Other(TopOpeBRepDS_MapOfPoint)

Returns:
	TopOpeBRepDS_MapOfPoint

No detailed docstring for this function.") operator=;
		TopOpeBRepDS_MapOfPoint & operator = (const TopOpeBRepDS_MapOfPoint & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(Standard_Integer)
	I(TopOpeBRepDS_PointData)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (Standard_Integer &OutValue,const TopOpeBRepDS_PointData & I);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	TopOpeBRepDS_PointData

No detailed docstring for this function.") Find;
		const TopOpeBRepDS_PointData & Find (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	TopOpeBRepDS_PointData

No detailed docstring for this function.") ChangeFind;
		TopOpeBRepDS_PointData & ChangeFind (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
		Standard_Address ChangeFind1 (Standard_Integer &OutValue);
};


%feature("shadow") TopOpeBRepDS_MapOfPoint::~TopOpeBRepDS_MapOfPoint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_MapOfPoint {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_MapOfShapeData;
class TopOpeBRepDS_MapOfShapeData : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_MapOfShapeData;
		 TopOpeBRepDS_MapOfShapeData (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(TopOpeBRepDS_MapOfShapeData)

Returns:
	TopOpeBRepDS_MapOfShapeData

No detailed docstring for this function.") Assign;
		TopOpeBRepDS_MapOfShapeData & Assign (const TopOpeBRepDS_MapOfShapeData & Other);
		%feature("autodoc", "Args:
	Other(TopOpeBRepDS_MapOfShapeData)

Returns:
	TopOpeBRepDS_MapOfShapeData

No detailed docstring for this function.") operator=;
		TopOpeBRepDS_MapOfShapeData & operator = (const TopOpeBRepDS_MapOfShapeData & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(TopOpeBRepDS_ShapeData)

Returns:
	Standard_Integer

No detailed docstring for this function.") Add;
		Standard_Integer Add (const TopoDS_Shape & K,const TopOpeBRepDS_ShapeData & I);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	K(TopoDS_Shape)
	T(TopOpeBRepDS_ShapeData)

Returns:
	None

No detailed docstring for this function.") Substitute;
		void Substitute (const Standard_Integer I,const TopoDS_Shape & K,const TopOpeBRepDS_ShapeData & T);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveLast;
		void RemoveLast ();
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Contains;
		Standard_Boolean Contains (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") FindKey;
		const TopoDS_Shape & FindKey (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopOpeBRepDS_ShapeData

No detailed docstring for this function.") FindFromIndex;
		const TopOpeBRepDS_ShapeData & FindFromIndex (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopOpeBRepDS_ShapeData

No detailed docstring for this function.") ChangeFromIndex;
		TopOpeBRepDS_ShapeData & ChangeFromIndex (const Standard_Integer I);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Integer

No detailed docstring for this function.") FindIndex;
		Standard_Integer FindIndex (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	TopOpeBRepDS_ShapeData

No detailed docstring for this function.") FindFromKey;
		const TopOpeBRepDS_ShapeData & FindFromKey (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	TopOpeBRepDS_ShapeData

No detailed docstring for this function.") ChangeFromKey;
		TopOpeBRepDS_ShapeData & ChangeFromKey (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") FindFromKey1;
		Standard_Address FindFromKey1 (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFromKey1;
		Standard_Address ChangeFromKey1 (const TopoDS_Shape & K);
};


%feature("shadow") TopOpeBRepDS_MapOfShapeData::~TopOpeBRepDS_MapOfShapeData %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_MapOfShapeData {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_MapOfSurface;
class TopOpeBRepDS_MapOfSurface : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_MapOfSurface;
		 TopOpeBRepDS_MapOfSurface (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(TopOpeBRepDS_MapOfSurface)

Returns:
	TopOpeBRepDS_MapOfSurface

No detailed docstring for this function.") Assign;
		TopOpeBRepDS_MapOfSurface & Assign (const TopOpeBRepDS_MapOfSurface & Other);
		%feature("autodoc", "Args:
	Other(TopOpeBRepDS_MapOfSurface)

Returns:
	TopOpeBRepDS_MapOfSurface

No detailed docstring for this function.") operator=;
		TopOpeBRepDS_MapOfSurface & operator = (const TopOpeBRepDS_MapOfSurface & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(Standard_Integer)
	I(TopOpeBRepDS_SurfaceData)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (Standard_Integer &OutValue,const TopOpeBRepDS_SurfaceData & I);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	TopOpeBRepDS_SurfaceData

No detailed docstring for this function.") Find;
		const TopOpeBRepDS_SurfaceData & Find (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	TopOpeBRepDS_SurfaceData

No detailed docstring for this function.") ChangeFind;
		TopOpeBRepDS_SurfaceData & ChangeFind (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
		Standard_Address ChangeFind1 (Standard_Integer &OutValue);
};


%feature("shadow") TopOpeBRepDS_MapOfSurface::~TopOpeBRepDS_MapOfSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_MapOfSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_Marker;
class TopOpeBRepDS_Marker : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_Marker;
		 TopOpeBRepDS_Marker ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Reset;
		void Reset ();
		%feature("autodoc", "Args:
	i(Standard_Integer)
	b(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const Standard_Integer i,const Standard_Boolean b);
		%feature("autodoc", "Args:
	b(Standard_Boolean)
	n(Standard_Integer)
	a(Standard_Address)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const Standard_Boolean b,const Standard_Integer n,const Standard_Address a);
		%feature("autodoc", "Args:
	i(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") GetI;
		Standard_Boolean GetI (const Standard_Integer i);
		%feature("autodoc", "Args:
	n(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Allocate;
		void Allocate (const Standard_Integer n);
};


%feature("shadow") TopOpeBRepDS_Marker::~TopOpeBRepDS_Marker %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_Marker {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopOpeBRepDS_Marker {
	Handle_TopOpeBRepDS_Marker GetHandle() {
	return *(Handle_TopOpeBRepDS_Marker*) &$self;
	}
};

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
    TopOpeBRepDS_Marker* GetObject() {
    return (TopOpeBRepDS_Marker*)$self->Access();
    }
};
%feature("shadow") Handle_TopOpeBRepDS_Marker::~Handle_TopOpeBRepDS_Marker %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopOpeBRepDS_Marker {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopOpeBRepDS_Point;
class TopOpeBRepDS_Point {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_Point;
		 TopOpeBRepDS_Point ();
		%feature("autodoc", "Args:
	P(gp_Pnt)
	T(Standard_Real)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_Point;
		 TopOpeBRepDS_Point (const gp_Pnt & P,const Standard_Real T);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_Point;
		 TopOpeBRepDS_Point (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	other(TopOpeBRepDS_Point)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEqual;
		Standard_Boolean IsEqual (const TopOpeBRepDS_Point & other);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

No detailed docstring for this function.") Point;
		const gp_Pnt & Point ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

No detailed docstring for this function.") ChangePoint;
		gp_Pnt & ChangePoint ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Tolerance;
		Standard_Real Tolerance ();
		%feature("autodoc", "Args:
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Tolerance;
		void Tolerance (const Standard_Real Tol);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") Keep;
		Standard_Boolean Keep ();
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") ChangeKeep;
		void ChangeKeep (const Standard_Boolean B);
};


%feature("shadow") TopOpeBRepDS_Point::~TopOpeBRepDS_Point %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_Point {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_PointExplorer;
class TopOpeBRepDS_PointExplorer {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_PointExplorer;
		 TopOpeBRepDS_PointExplorer ();
		%feature("autodoc", "Args:
	DS(TopOpeBRepDS_DataStructure)
	FindOnlyKeep(Standard_Boolean)=Standard_True

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_PointExplorer;
		 TopOpeBRepDS_PointExplorer (const TopOpeBRepDS_DataStructure & DS,const Standard_Boolean FindOnlyKeep = Standard_True);
		%feature("autodoc", "Args:
	DS(TopOpeBRepDS_DataStructure)
	FindOnlyKeep(Standard_Boolean)=Standard_True

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const TopOpeBRepDS_DataStructure & DS,const Standard_Boolean FindOnlyKeep = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepDS_Point

No detailed docstring for this function.") Point;
		const TopOpeBRepDS_Point & Point ();
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsPoint;
		Standard_Boolean IsPoint (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsPointKeep;
		Standard_Boolean IsPointKeep (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopOpeBRepDS_Point

No detailed docstring for this function.") Point;
		const TopOpeBRepDS_Point & Point (const Standard_Integer I);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbPoint;
		Standard_Integer NbPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Index;
		Standard_Integer Index ();
};


%feature("shadow") TopOpeBRepDS_PointExplorer::~TopOpeBRepDS_PointExplorer %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_PointExplorer {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_Reducer;
class TopOpeBRepDS_Reducer {
	public:
		%feature("autodoc", "Args:
	HDS(Handle_TopOpeBRepDS_HDataStructure)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_Reducer;
		 TopOpeBRepDS_Reducer (const Handle_TopOpeBRepDS_HDataStructure & HDS);
		%feature("autodoc", "Args:
	M(TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State)

Returns:
	None

No detailed docstring for this function.") ProcessFaceInterferences;
		void ProcessFaceInterferences (const TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State & M);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ProcessEdgeInterferences;
		void ProcessEdgeInterferences ();
};


%feature("shadow") TopOpeBRepDS_Reducer::~TopOpeBRepDS_Reducer %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_Reducer {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_ShapeData;
class TopOpeBRepDS_ShapeData {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_ShapeData;
		 TopOpeBRepDS_ShapeData ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepDS_ListOfInterference

No detailed docstring for this function.") Interferences;
		const TopOpeBRepDS_ListOfInterference & Interferences ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepDS_ListOfInterference

No detailed docstring for this function.") ChangeInterferences;
		TopOpeBRepDS_ListOfInterference & ChangeInterferences ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") Keep;
		Standard_Boolean Keep ();
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") ChangeKeep;
		void ChangeKeep (const Standard_Boolean B);
};


%feature("shadow") TopOpeBRepDS_ShapeData::~TopOpeBRepDS_ShapeData %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_ShapeData {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_ShapeSurface;
class TopOpeBRepDS_ShapeSurface : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_ShapeSurface;
		 TopOpeBRepDS_ShapeSurface (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(TopOpeBRepDS_ShapeSurface)

Returns:
	TopOpeBRepDS_ShapeSurface

No detailed docstring for this function.") Assign;
		TopOpeBRepDS_ShapeSurface & Assign (const TopOpeBRepDS_ShapeSurface & Other);
		%feature("autodoc", "Args:
	Other(TopOpeBRepDS_ShapeSurface)

Returns:
	TopOpeBRepDS_ShapeSurface

No detailed docstring for this function.") operator=;
		TopOpeBRepDS_ShapeSurface & operator = (const TopOpeBRepDS_ShapeSurface & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(Handle_Geom_Surface)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const Handle_Geom_Surface & I);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Handle_Geom_Surface

No detailed docstring for this function.") Find;
		const Handle_Geom_Surface & Find (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Handle_Geom_Surface

No detailed docstring for this function.") ChangeFind;
		Handle_Geom_Surface & ChangeFind (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Shape & K);
};


%feature("shadow") TopOpeBRepDS_ShapeSurface::~TopOpeBRepDS_ShapeSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_ShapeSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_ShapeWithState;
class TopOpeBRepDS_ShapeWithState {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_ShapeWithState;
		 TopOpeBRepDS_ShapeWithState ();
		%feature("autodoc", "Args:
	aState(TopAbs_State)

Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") Part;
		const TopTools_ListOfShape & Part (const TopAbs_State aState);
		%feature("autodoc", "Args:
	aShape(TopoDS_Shape)
	aState(TopAbs_State)

Returns:
	None

No detailed docstring for this function.") AddPart;
		void AddPart (const TopoDS_Shape & aShape,const TopAbs_State aState);
		%feature("autodoc", "Args:
	aListOfShape(TopTools_ListOfShape)
	aState(TopAbs_State)

Returns:
	None

No detailed docstring for this function.") AddParts;
		void AddParts (const TopTools_ListOfShape & aListOfShape,const TopAbs_State aState);
		%feature("autodoc", "Args:
	aState(TopAbs_State)

Returns:
	None

No detailed docstring for this function.") SetState;
		void SetState (const TopAbs_State aState);
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_State

No detailed docstring for this function.") State;
		TopAbs_State State ();
		%feature("autodoc", "Args:
	anIsSplitted(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") SetIsSplitted;
		void SetIsSplitted (const Standard_Boolean anIsSplitted);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsSplitted;
		Standard_Boolean IsSplitted ();
};


%feature("shadow") TopOpeBRepDS_ShapeWithState::~TopOpeBRepDS_ShapeWithState %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_ShapeWithState {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_Surface;
class TopOpeBRepDS_Surface {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_Surface;
		 TopOpeBRepDS_Surface ();
		%feature("autodoc", "Args:
	P(Handle_Geom_Surface)
	T(Standard_Real)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_Surface;
		 TopOpeBRepDS_Surface (const Handle_Geom_Surface & P,const Standard_Real T);
		%feature("autodoc", "Args:
	Other(TopOpeBRepDS_Surface)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_Surface;
		 TopOpeBRepDS_Surface (const TopOpeBRepDS_Surface & Other);
		%feature("autodoc", "Args:
	Other(TopOpeBRepDS_Surface)

Returns:
	None

No detailed docstring for this function.") Assign;
		void Assign (const TopOpeBRepDS_Surface & Other);
		%feature("autodoc", "Args:
	Other(TopOpeBRepDS_Surface)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const TopOpeBRepDS_Surface & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Surface

No detailed docstring for this function.") Surface;
		const Handle_Geom_Surface & Surface ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Tolerance;
		Standard_Real Tolerance ();
		%feature("autodoc", "Args:
	tol(Standard_Real)

Returns:
	None

Update the tolerance") Tolerance;
		void Tolerance (const Standard_Real tol);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") Keep;
		Standard_Boolean Keep ();
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") ChangeKeep;
		void ChangeKeep (const Standard_Boolean B);
};


%feature("shadow") TopOpeBRepDS_Surface::~TopOpeBRepDS_Surface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_Surface {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_SurfaceExplorer;
class TopOpeBRepDS_SurfaceExplorer {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_SurfaceExplorer;
		 TopOpeBRepDS_SurfaceExplorer ();
		%feature("autodoc", "Args:
	DS(TopOpeBRepDS_DataStructure)
	FindOnlyKeep(Standard_Boolean)=Standard_True

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_SurfaceExplorer;
		 TopOpeBRepDS_SurfaceExplorer (const TopOpeBRepDS_DataStructure & DS,const Standard_Boolean FindOnlyKeep = Standard_True);
		%feature("autodoc", "Args:
	DS(TopOpeBRepDS_DataStructure)
	FindOnlyKeep(Standard_Boolean)=Standard_True

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const TopOpeBRepDS_DataStructure & DS,const Standard_Boolean FindOnlyKeep = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepDS_Surface

No detailed docstring for this function.") Surface;
		const TopOpeBRepDS_Surface & Surface ();
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsSurface;
		Standard_Boolean IsSurface (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsSurfaceKeep;
		Standard_Boolean IsSurfaceKeep (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopOpeBRepDS_Surface

No detailed docstring for this function.") Surface;
		const TopOpeBRepDS_Surface & Surface (const Standard_Integer I);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbSurface;
		Standard_Integer NbSurface ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Index;
		Standard_Integer Index ();
};


%feature("shadow") TopOpeBRepDS_SurfaceExplorer::~TopOpeBRepDS_SurfaceExplorer %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_SurfaceExplorer {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_TKI;
class TopOpeBRepDS_TKI {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_TKI;
		 TopOpeBRepDS_TKI ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	L(TopOpeBRepDS_ListOfInterference)

Returns:
	None

No detailed docstring for this function.") FillOnGeometry;
		void FillOnGeometry (const TopOpeBRepDS_ListOfInterference & L);
		%feature("autodoc", "Args:
	L(TopOpeBRepDS_ListOfInterference)

Returns:
	None

No detailed docstring for this function.") FillOnSupport;
		void FillOnSupport (const TopOpeBRepDS_ListOfInterference & L);
		%feature("autodoc", "Args:
	K(TopOpeBRepDS_Kind)
	G(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (const TopOpeBRepDS_Kind K,const Standard_Integer G);
		%feature("autodoc", "Args:
	K(TopOpeBRepDS_Kind)
	G(Standard_Integer)

Returns:
	TopOpeBRepDS_ListOfInterference

No detailed docstring for this function.") Interferences;
		const TopOpeBRepDS_ListOfInterference & Interferences (const TopOpeBRepDS_Kind K,const Standard_Integer G);
		%feature("autodoc", "Args:
	K(TopOpeBRepDS_Kind)
	G(Standard_Integer)

Returns:
	TopOpeBRepDS_ListOfInterference

No detailed docstring for this function.") ChangeInterferences;
		TopOpeBRepDS_ListOfInterference & ChangeInterferences (const TopOpeBRepDS_Kind K,const Standard_Integer G);
		%feature("autodoc", "Args:
	K(TopOpeBRepDS_Kind)
	G(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") HasInterferences;
		Standard_Boolean HasInterferences (const TopOpeBRepDS_Kind K,const Standard_Integer G);
		%feature("autodoc", "Args:
	K(TopOpeBRepDS_Kind)
	G(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Add;
		void Add (const TopOpeBRepDS_Kind K,const Standard_Integer G);
		%feature("autodoc", "Args:
	K(TopOpeBRepDS_Kind)
	G(Standard_Integer)
	HI(Handle_TopOpeBRepDS_Interference)

Returns:
	None

No detailed docstring for this function.") Add;
		void Add (const TopOpeBRepDS_Kind K,const Standard_Integer G,const Handle_TopOpeBRepDS_Interference & HI);
		%feature("autodoc", "Args:
	s1(TCollection_AsciiString)=
	s2(TCollection_AsciiString)=

Returns:
	None

No detailed docstring for this function.") DumpTKI;
		void DumpTKI (const TCollection_AsciiString & s1 = "",const TCollection_AsciiString & s2 = "");
		%feature("autodoc", "Args:
	K(TopOpeBRepDS_Kind)
	s1(TCollection_AsciiString)=
	s2(TCollection_AsciiString)=

Returns:
	None

No detailed docstring for this function.") DumpTKI;
		void DumpTKI (const TopOpeBRepDS_Kind K,const TCollection_AsciiString & s1 = "",const TCollection_AsciiString & s2 = "");
		%feature("autodoc", "Args:
	K(TopOpeBRepDS_Kind)
	G(Standard_Integer)
	s1(TCollection_AsciiString)=
	s2(TCollection_AsciiString)=

Returns:
	None

No detailed docstring for this function.") DumpTKI;
		void DumpTKI (const TopOpeBRepDS_Kind K,const Standard_Integer G,const TCollection_AsciiString & s1 = "",const TCollection_AsciiString & s2 = "");
		%feature("autodoc", "Args:
	K(TopOpeBRepDS_Kind)
	G(Standard_Integer)
	L(TopOpeBRepDS_ListOfInterference)
	s1(TCollection_AsciiString)=
	s2(TCollection_AsciiString)=

Returns:
	None

No detailed docstring for this function.") DumpTKI;
		void DumpTKI (const TopOpeBRepDS_Kind K,const Standard_Integer G,const TopOpeBRepDS_ListOfInterference & L,const TCollection_AsciiString & s1 = "",const TCollection_AsciiString & s2 = "");
		%feature("autodoc", "Args:
	s1(TCollection_AsciiString)=
	s2(TCollection_AsciiString)=

Returns:
	None

No detailed docstring for this function.") DumpTKIIterator;
		void DumpTKIIterator (const TCollection_AsciiString & s1 = "",const TCollection_AsciiString & s2 = "");
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Init;
		void Init ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
		void Next ();
		%feature("autodoc", "Args:
	K(TopOpeBRepDS_Kind)
	G(Standard_Integer)

Returns:
	TopOpeBRepDS_ListOfInterference

No detailed docstring for this function.") Value;
		const TopOpeBRepDS_ListOfInterference & Value (TopOpeBRepDS_Kind & K,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(TopOpeBRepDS_Kind)
	G(Standard_Integer)

Returns:
	TopOpeBRepDS_ListOfInterference

No detailed docstring for this function.") ChangeValue;
		TopOpeBRepDS_ListOfInterference & ChangeValue (TopOpeBRepDS_Kind & K,Standard_Integer &OutValue);
};


%feature("shadow") TopOpeBRepDS_TKI::~TopOpeBRepDS_TKI %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_TKI {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_TOOL;
class TopOpeBRepDS_TOOL {
	public:
		%feature("autodoc", "Args:
	HDS(Handle_TopOpeBRepDS_HDataStructure)
	E(TopoDS_Edge)
	lEsd(TopTools_ListOfShape)

Returns:
	static Standard_Integer

No detailed docstring for this function.") EShareG;
		static Standard_Integer EShareG (const Handle_TopOpeBRepDS_HDataStructure & HDS,const TopoDS_Edge & E,TopTools_ListOfShape & lEsd);
		%feature("autodoc", "Args:
	HDS(Handle_TopOpeBRepDS_HDataStructure)
	is1(Standard_Integer)
	is2(Standard_Integer)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") ShareG;
		static Standard_Boolean ShareG (const Handle_TopOpeBRepDS_HDataStructure & HDS,const Standard_Integer is1,const Standard_Integer is2);
		%feature("autodoc", "Args:
	HDS(Handle_TopOpeBRepDS_HDataStructure)
	S(TopoDS_Shape)
	ie(Standard_Integer)
	iesd(Standard_Integer)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") GetEsd;
		static Standard_Boolean GetEsd (const Handle_TopOpeBRepDS_HDataStructure & HDS,const TopoDS_Shape & S,const Standard_Integer ie,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	HDS(Handle_TopOpeBRepDS_HDataStructure)
	MspON(TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State)
	i1(Standard_Integer)
	i2(Standard_Integer)
	spON(TopoDS_Shape)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") ShareSplitON;
		static Standard_Boolean ShareSplitON (const Handle_TopOpeBRepDS_HDataStructure & HDS,const TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State & MspON,const Standard_Integer i1,const Standard_Integer i2,TopoDS_Shape & spON);
		%feature("autodoc", "Args:
	HDS(Handle_TopOpeBRepDS_HDataStructure)
	MEspON(TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State)
	ie(Standard_Integer)
	iesd(Standard_Integer)
	conf(Standard_Integer)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") GetConfig;
		static Standard_Boolean GetConfig (const Handle_TopOpeBRepDS_HDataStructure & HDS,const TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State & MEspON,const Standard_Integer ie,const Standard_Integer iesd,Standard_Integer &OutValue);
};


%feature("shadow") TopOpeBRepDS_TOOL::~TopOpeBRepDS_TOOL %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_TOOL {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_Transition;
class TopOpeBRepDS_Transition {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_Transition;
		 TopOpeBRepDS_Transition ();
		%feature("autodoc", "Args:
	StateBefore(TopAbs_State)
	StateAfter(TopAbs_State)
	ShapeBefore(TopAbs_ShapeEnum)=TopAbs_FACE
	ShapeAfter(TopAbs_ShapeEnum)=TopAbs_FACE

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_Transition;
		 TopOpeBRepDS_Transition (const TopAbs_State StateBefore,const TopAbs_State StateAfter,const TopAbs_ShapeEnum ShapeBefore = TopAbs_FACE,const TopAbs_ShapeEnum ShapeAfter = TopAbs_FACE);
		%feature("autodoc", "Args:
	O(TopAbs_Orientation)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_Transition;
		 TopOpeBRepDS_Transition (const TopAbs_Orientation O);
		%feature("autodoc", "Args:
	StateBefore(TopAbs_State)
	StateAfter(TopAbs_State)
	ShapeBefore(TopAbs_ShapeEnum)=TopAbs_FACE
	ShapeAfter(TopAbs_ShapeEnum)=TopAbs_FACE

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const TopAbs_State StateBefore,const TopAbs_State StateAfter,const TopAbs_ShapeEnum ShapeBefore = TopAbs_FACE,const TopAbs_ShapeEnum ShapeAfter = TopAbs_FACE);
		%feature("autodoc", "Args:
	S(TopAbs_State)

Returns:
	None

No detailed docstring for this function.") StateBefore;
		void StateBefore (const TopAbs_State S);
		%feature("autodoc", "Args:
	S(TopAbs_State)

Returns:
	None

No detailed docstring for this function.") StateAfter;
		void StateAfter (const TopAbs_State S);
		%feature("autodoc", "Args:
	SE(TopAbs_ShapeEnum)

Returns:
	None

No detailed docstring for this function.") ShapeBefore;
		void ShapeBefore (const TopAbs_ShapeEnum SE);
		%feature("autodoc", "Args:
	SE(TopAbs_ShapeEnum)

Returns:
	None

No detailed docstring for this function.") ShapeAfter;
		void ShapeAfter (const TopAbs_ShapeEnum SE);
		%feature("autodoc", "Args:
	S(TopAbs_State)
	ShapeBefore(TopAbs_ShapeEnum)=TopAbs_FACE

Returns:
	None

No detailed docstring for this function.") Before;
		void Before (const TopAbs_State S,const TopAbs_ShapeEnum ShapeBefore = TopAbs_FACE);
		%feature("autodoc", "Args:
	S(TopAbs_State)
	ShapeAfter(TopAbs_ShapeEnum)=TopAbs_FACE

Returns:
	None

No detailed docstring for this function.") After;
		void After (const TopAbs_State S,const TopAbs_ShapeEnum ShapeAfter = TopAbs_FACE);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Index;
		void Index (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") IndexBefore;
		void IndexBefore (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") IndexAfter;
		void IndexAfter (const Standard_Integer I);
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_State

No detailed docstring for this function.") Before;
		TopAbs_State Before ();
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_ShapeEnum

No detailed docstring for this function.") ONBefore;
		TopAbs_ShapeEnum ONBefore ();
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_State

No detailed docstring for this function.") After;
		TopAbs_State After ();
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_ShapeEnum

No detailed docstring for this function.") ONAfter;
		TopAbs_ShapeEnum ONAfter ();
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_ShapeEnum

No detailed docstring for this function.") ShapeBefore;
		TopAbs_ShapeEnum ShapeBefore ();
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_ShapeEnum

No detailed docstring for this function.") ShapeAfter;
		TopAbs_ShapeEnum ShapeAfter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Index;
		Standard_Integer Index ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") IndexBefore;
		Standard_Integer IndexBefore ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") IndexAfter;
		Standard_Integer IndexAfter ();
		%feature("autodoc", "Args:
	O(TopAbs_Orientation)

Returns:
	None

set the transition corresponding to orientation <O>  
 
      O       Before  After  
 
  FORWARD       OUT    IN  
  REVERSED      IN     OUT  
  INTERNAL      IN     IN  
  EXTERNAL      OUT    OUT") Set;
		void Set (const TopAbs_Orientation O);
		%feature("autodoc", "Args:
	S(TopAbs_State)
	T(TopAbs_ShapeEnum)=TopAbs_FACE

Returns:
	TopAbs_Orientation

returns the orientation corresponding to state <S>  
 
Before and After not equal TopAbs_ON :  
--------------------------------------  
Before  After   Computed orientation  
 
 S      not S   REVERSED (we leave state S)  
 not S  S       FORWARD  (we enter state S)  
 S      S       INTERNAL (we stay in state S)  
 not S  not S   EXTERNAL (we stay outside state S)") Orientation;
		TopAbs_Orientation Orientation (const TopAbs_State S,const TopAbs_ShapeEnum T = TopAbs_FACE);
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepDS_Transition

No detailed docstring for this function.") Complement;
		TopOpeBRepDS_Transition Complement ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

returns True if both states are UNKNOWN") IsUnknown;
		Standard_Boolean IsUnknown ();
		%feature("autodoc", "Args:
	OS(Standard_OStream)

Returns:
	Standard_OStream

No detailed docstring for this function.") DumpA;
		Standard_OStream & DumpA (Standard_OStream & OS);
		%feature("autodoc", "Args:
	OS(Standard_OStream)

Returns:
	Standard_OStream

No detailed docstring for this function.") DumpB;
		Standard_OStream & DumpB (Standard_OStream & OS);
		%feature("autodoc", "Args:
	OS(Standard_OStream)

Returns:
	Standard_OStream

No detailed docstring for this function.") Dump;
		Standard_OStream & Dump (Standard_OStream & OS);
};


%feature("shadow") TopOpeBRepDS_Transition::~TopOpeBRepDS_Transition %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_Transition {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_CurveData;
class TopOpeBRepDS_CurveData : public TopOpeBRepDS_GeometryData {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_CurveData;
		 TopOpeBRepDS_CurveData ();
		%feature("autodoc", "Args:
	C(TopOpeBRepDS_Curve)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_CurveData;
		 TopOpeBRepDS_CurveData (const TopOpeBRepDS_Curve & C);
};


%feature("shadow") TopOpeBRepDS_CurveData::~TopOpeBRepDS_CurveData %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_CurveData {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_CurveIterator;
class TopOpeBRepDS_CurveIterator : public TopOpeBRepDS_InterferenceIterator {
	public:
		%feature("autodoc", "Args:
	L(TopOpeBRepDS_ListOfInterference)

Returns:
	None

Creates an  iterator on the  curves on surface  
         described by the interferences in <L>.") TopOpeBRepDS_CurveIterator;
		 TopOpeBRepDS_CurveIterator (const TopOpeBRepDS_ListOfInterference & L);
		%feature("autodoc", "Args:
	I(Handle_TopOpeBRepDS_Interference)

Returns:
	virtual Standard_Boolean

Returns  True if the Interference <I>  has a  
         GeometryType() TopOpeBRepDS_CURVE  
         returns False else.") MatchInterference;
		virtual Standard_Boolean MatchInterference (const Handle_TopOpeBRepDS_Interference & I);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Index of the curve in the data structure.") Current;
		Standard_Integer Current ();
		%feature("autodoc", "Args:
	S(TopAbs_State)

Returns:
	TopAbs_Orientation

No detailed docstring for this function.") Orientation;
		TopAbs_Orientation Orientation (const TopAbs_State S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_Curve

No detailed docstring for this function.") PCurve;
		const Handle_Geom2d_Curve & PCurve ();
};


%feature("shadow") TopOpeBRepDS_CurveIterator::~TopOpeBRepDS_CurveIterator %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_CurveIterator {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_CurvePointInterference;
class TopOpeBRepDS_CurvePointInterference : public TopOpeBRepDS_Interference {
	public:
		%feature("autodoc", "Args:
	T(TopOpeBRepDS_Transition)
	ST(TopOpeBRepDS_Kind)
	S(Standard_Integer)
	GT(TopOpeBRepDS_Kind)
	G(Standard_Integer)
	P(Standard_Real)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_CurvePointInterference;
		 TopOpeBRepDS_CurvePointInterference (const TopOpeBRepDS_Transition & T,const TopOpeBRepDS_Kind ST,const Standard_Integer S,const TopOpeBRepDS_Kind GT,const Standard_Integer G,const Standard_Real P);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Parameter;
		Standard_Real Parameter ();
		%feature("autodoc", "Args:
	P(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Parameter;
		void Parameter (const Standard_Real P);
		%feature("autodoc", "Args:
	OS(Standard_OStream)

Returns:
	virtual Standard_OStream

No detailed docstring for this function.") Dump;
		virtual Standard_OStream & Dump (Standard_OStream & OS);
};


%feature("shadow") TopOpeBRepDS_CurvePointInterference::~TopOpeBRepDS_CurvePointInterference %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_CurvePointInterference {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopOpeBRepDS_CurvePointInterference {
	Handle_TopOpeBRepDS_CurvePointInterference GetHandle() {
	return *(Handle_TopOpeBRepDS_CurvePointInterference*) &$self;
	}
};

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
    TopOpeBRepDS_CurvePointInterference* GetObject() {
    return (TopOpeBRepDS_CurvePointInterference*)$self->Access();
    }
};
%feature("shadow") Handle_TopOpeBRepDS_CurvePointInterference::~Handle_TopOpeBRepDS_CurvePointInterference %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopOpeBRepDS_CurvePointInterference {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopOpeBRepDS_PointData;
class TopOpeBRepDS_PointData : public TopOpeBRepDS_GeometryData {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_PointData;
		 TopOpeBRepDS_PointData ();
		%feature("autodoc", "Args:
	P(TopOpeBRepDS_Point)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_PointData;
		 TopOpeBRepDS_PointData (const TopOpeBRepDS_Point & P);
		%feature("autodoc", "Args:
	P(TopOpeBRepDS_Point)
	I1(Standard_Integer)
	I2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_PointData;
		 TopOpeBRepDS_PointData (const TopOpeBRepDS_Point & P,const Standard_Integer I1,const Standard_Integer I2);
		%feature("autodoc", "Args:
	I1(Standard_Integer)
	I2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetShapes;
		void SetShapes (const Standard_Integer I1,const Standard_Integer I2);
		%feature("autodoc", "Args:
	I1(Standard_Integer)
	I2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") GetShapes;
		void GetShapes (Standard_Integer &OutValue,Standard_Integer &OutValue);
};


%feature("shadow") TopOpeBRepDS_PointData::~TopOpeBRepDS_PointData %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_PointData {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_PointIterator;
class TopOpeBRepDS_PointIterator : public TopOpeBRepDS_InterferenceIterator {
	public:
		%feature("autodoc", "Args:
	L(TopOpeBRepDS_ListOfInterference)

Returns:
	None

Creates an  iterator on the  points on curves  
         described by the interferences in <L>.") TopOpeBRepDS_PointIterator;
		 TopOpeBRepDS_PointIterator (const TopOpeBRepDS_ListOfInterference & L);
		%feature("autodoc", "Args:
	I(Handle_TopOpeBRepDS_Interference)

Returns:
	virtual Standard_Boolean

Returns  True if the Interference <I>  has a  
         GeometryType() TopOpeBRepDS_POINT or TopOpeBRepDS_VERTEX  
         returns False else.") MatchInterference;
		virtual Standard_Boolean MatchInterference (const Handle_TopOpeBRepDS_Interference & I);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Index of the point in the data structure.") Current;
		Standard_Integer Current ();
		%feature("autodoc", "Args:
	S(TopAbs_State)

Returns:
	TopAbs_Orientation

No detailed docstring for this function.") Orientation;
		TopAbs_Orientation Orientation (const TopAbs_State S);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Parameter;
		Standard_Real Parameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsVertex;
		Standard_Boolean IsVertex ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsPoint;
		Standard_Boolean IsPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") DiffOriented;
		Standard_Boolean DiffOriented ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") SameOriented;
		Standard_Boolean SameOriented ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Support;
		Standard_Integer Support ();
};


%feature("shadow") TopOpeBRepDS_PointIterator::~TopOpeBRepDS_PointIterator %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_PointIterator {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_ShapeShapeInterference;
class TopOpeBRepDS_ShapeShapeInterference : public TopOpeBRepDS_Interference {
	public:
		%feature("autodoc", "Args:
	T(TopOpeBRepDS_Transition)
	ST(TopOpeBRepDS_Kind)
	S(Standard_Integer)
	GT(TopOpeBRepDS_Kind)
	G(Standard_Integer)
	GBound(Standard_Boolean)
	C(TopOpeBRepDS_Config)

Returns:
	None

a shape interfers on shape <G> with shape <S>.  
examples :  
create a ShapeShapeInterference describing :  
vertex V of edge E1 found on edge E2 :  
ST,S,GT,G = TopOpeBRepDS_EDGE,E2,TopOpeBRepDS_VERTEX,V  
 
create a ShapeShapeInterference describing  
vertex V of edge E found on face F :  
ST,S,GT,G = TopOpeBRepDS_FACE,F,TopOpeBRepDS_VERTEX,V  
 
<GBound> indicates if shape <G> is a bound of shape <S>.  
 
<SCC> :  
UNSH_GEOMETRY :  
	 <S> and <Ancestor> have any types,  
	 <S> and <Ancestor> don't share the same geometry  
SAME_ORIENTED :  
	 <S> and <Ancestor> have identical types,  
	 <S> and <Ancestor> orientations are IDENTICAL.  
DIFF_ORIENTED :  
	 <S> and <Ancestor> have identical types,  
	 <S> and <Ancestor> orientations are DIFFERENT.") TopOpeBRepDS_ShapeShapeInterference;
		 TopOpeBRepDS_ShapeShapeInterference (const TopOpeBRepDS_Transition & T,const TopOpeBRepDS_Kind ST,const Standard_Integer S,const TopOpeBRepDS_Kind GT,const Standard_Integer G,const Standard_Boolean GBound,const TopOpeBRepDS_Config C);
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepDS_Config

No detailed docstring for this function.") Config;
		TopOpeBRepDS_Config Config ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") GBound;
		Standard_Boolean GBound ();
		%feature("autodoc", "Args:
	b(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") SetGBound;
		void SetGBound (const Standard_Boolean b);
		%feature("autodoc", "Args:
	OS(Standard_OStream)

Returns:
	virtual Standard_OStream

No detailed docstring for this function.") Dump;
		virtual Standard_OStream & Dump (Standard_OStream & OS);
};


%feature("shadow") TopOpeBRepDS_ShapeShapeInterference::~TopOpeBRepDS_ShapeShapeInterference %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_ShapeShapeInterference {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopOpeBRepDS_ShapeShapeInterference {
	Handle_TopOpeBRepDS_ShapeShapeInterference GetHandle() {
	return *(Handle_TopOpeBRepDS_ShapeShapeInterference*) &$self;
	}
};

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
    TopOpeBRepDS_ShapeShapeInterference* GetObject() {
    return (TopOpeBRepDS_ShapeShapeInterference*)$self->Access();
    }
};
%feature("shadow") Handle_TopOpeBRepDS_ShapeShapeInterference::~Handle_TopOpeBRepDS_ShapeShapeInterference %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopOpeBRepDS_ShapeShapeInterference {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopOpeBRepDS_SolidSurfaceInterference;
class TopOpeBRepDS_SolidSurfaceInterference : public TopOpeBRepDS_Interference {
	public:
		%feature("autodoc", "Args:
	Transition(TopOpeBRepDS_Transition)
	SupportType(TopOpeBRepDS_Kind)
	Support(Standard_Integer)
	GeometryType(TopOpeBRepDS_Kind)
	Geometry(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_SolidSurfaceInterference;
		 TopOpeBRepDS_SolidSurfaceInterference (const TopOpeBRepDS_Transition & Transition,const TopOpeBRepDS_Kind SupportType,const Standard_Integer Support,const TopOpeBRepDS_Kind GeometryType,const Standard_Integer Geometry);
		%feature("autodoc", "Args:
	OS(Standard_OStream)

Returns:
	virtual Standard_OStream

No detailed docstring for this function.") Dump;
		virtual Standard_OStream & Dump (Standard_OStream & OS);
};


%feature("shadow") TopOpeBRepDS_SolidSurfaceInterference::~TopOpeBRepDS_SolidSurfaceInterference %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_SolidSurfaceInterference {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopOpeBRepDS_SolidSurfaceInterference {
	Handle_TopOpeBRepDS_SolidSurfaceInterference GetHandle() {
	return *(Handle_TopOpeBRepDS_SolidSurfaceInterference*) &$self;
	}
};

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
    TopOpeBRepDS_SolidSurfaceInterference* GetObject() {
    return (TopOpeBRepDS_SolidSurfaceInterference*)$self->Access();
    }
};
%feature("shadow") Handle_TopOpeBRepDS_SolidSurfaceInterference::~Handle_TopOpeBRepDS_SolidSurfaceInterference %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopOpeBRepDS_SolidSurfaceInterference {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopOpeBRepDS_SurfaceCurveInterference;
class TopOpeBRepDS_SurfaceCurveInterference : public TopOpeBRepDS_Interference {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_SurfaceCurveInterference;
		 TopOpeBRepDS_SurfaceCurveInterference ();
		%feature("autodoc", "Args:
	Transition(TopOpeBRepDS_Transition)
	SupportType(TopOpeBRepDS_Kind)
	Support(Standard_Integer)
	GeometryType(TopOpeBRepDS_Kind)
	Geometry(Standard_Integer)
	PC(Handle_Geom2d_Curve)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_SurfaceCurveInterference;
		 TopOpeBRepDS_SurfaceCurveInterference (const TopOpeBRepDS_Transition & Transition,const TopOpeBRepDS_Kind SupportType,const Standard_Integer Support,const TopOpeBRepDS_Kind GeometryType,const Standard_Integer Geometry,const Handle_Geom2d_Curve & PC);
		%feature("autodoc", "Args:
	I(Handle_TopOpeBRepDS_Interference)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_SurfaceCurveInterference;
		 TopOpeBRepDS_SurfaceCurveInterference (const Handle_TopOpeBRepDS_Interference & I);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_Curve

No detailed docstring for this function.") PCurve;
		const Handle_Geom2d_Curve & PCurve ();
		%feature("autodoc", "Args:
	PC(Handle_Geom2d_Curve)

Returns:
	None

No detailed docstring for this function.") PCurve;
		void PCurve (const Handle_Geom2d_Curve & PC);
		%feature("autodoc", "Args:
	OS(Standard_OStream)
	compact(Standard_Boolean)=Standard_True

Returns:
	Standard_OStream

No detailed docstring for this function.") DumpPCurve;
		Standard_OStream & DumpPCurve (Standard_OStream & OS,const Standard_Boolean compact = Standard_True);
		%feature("autodoc", "Args:
	OS(Standard_OStream)

Returns:
	virtual Standard_OStream

No detailed docstring for this function.") Dump;
		virtual Standard_OStream & Dump (Standard_OStream & OS);
};


%feature("shadow") TopOpeBRepDS_SurfaceCurveInterference::~TopOpeBRepDS_SurfaceCurveInterference %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_SurfaceCurveInterference {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopOpeBRepDS_SurfaceCurveInterference {
	Handle_TopOpeBRepDS_SurfaceCurveInterference GetHandle() {
	return *(Handle_TopOpeBRepDS_SurfaceCurveInterference*) &$self;
	}
};

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
    TopOpeBRepDS_SurfaceCurveInterference* GetObject() {
    return (TopOpeBRepDS_SurfaceCurveInterference*)$self->Access();
    }
};
%feature("shadow") Handle_TopOpeBRepDS_SurfaceCurveInterference::~Handle_TopOpeBRepDS_SurfaceCurveInterference %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopOpeBRepDS_SurfaceCurveInterference {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopOpeBRepDS_SurfaceData;
class TopOpeBRepDS_SurfaceData : public TopOpeBRepDS_GeometryData {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_SurfaceData;
		 TopOpeBRepDS_SurfaceData ();
		%feature("autodoc", "Args:
	S(TopOpeBRepDS_Surface)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepDS_SurfaceData;
		 TopOpeBRepDS_SurfaceData (const TopOpeBRepDS_Surface & S);
};


%feature("shadow") TopOpeBRepDS_SurfaceData::~TopOpeBRepDS_SurfaceData %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_SurfaceData {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_SurfaceIterator;
class TopOpeBRepDS_SurfaceIterator : public TopOpeBRepDS_InterferenceIterator {
	public:
		%feature("autodoc", "Args:
	L(TopOpeBRepDS_ListOfInterference)

Returns:
	None

Creates an  iterator on the  Surfaces on solid  
         described by the interferences in <L>.") TopOpeBRepDS_SurfaceIterator;
		 TopOpeBRepDS_SurfaceIterator (const TopOpeBRepDS_ListOfInterference & L);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Index of the surface in the data structure.") Current;
		Standard_Integer Current ();
		%feature("autodoc", "Args:
	S(TopAbs_State)

Returns:
	TopAbs_Orientation

No detailed docstring for this function.") Orientation;
		TopAbs_Orientation Orientation (const TopAbs_State S);
};


%feature("shadow") TopOpeBRepDS_SurfaceIterator::~TopOpeBRepDS_SurfaceIterator %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_SurfaceIterator {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepDS_EdgeVertexInterference;
class TopOpeBRepDS_EdgeVertexInterference : public TopOpeBRepDS_ShapeShapeInterference {
	public:
		%feature("autodoc", "Args:
	T(TopOpeBRepDS_Transition)
	ST(TopOpeBRepDS_Kind)
	S(Standard_Integer)
	G(Standard_Integer)
	GIsBound(Standard_Boolean)
	C(TopOpeBRepDS_Config)
	P(Standard_Real)

Returns:
	None

Create an interference of VERTEX <G> on a crossed EDGE E.  
 
 if support type <ST> == EDGE : <S> is edge E  
                         FACE : <S> is the face with bound E.  
 <T> is the transition along the edge, crossing the crossed edge.  
  E  is the crossed edge.  
 <GIsBound> indicates if <G> is a bound of the edge.  
 <P> is the parameter of <G> on the edge.  
 
 interference is stored in the list of interfs of the edge.") TopOpeBRepDS_EdgeVertexInterference;
		 TopOpeBRepDS_EdgeVertexInterference (const TopOpeBRepDS_Transition & T,const TopOpeBRepDS_Kind ST,const Standard_Integer S,const Standard_Integer G,const Standard_Boolean GIsBound,const TopOpeBRepDS_Config C,const Standard_Real P);
		%feature("autodoc", "Args:
	T(TopOpeBRepDS_Transition)
	S(Standard_Integer)
	G(Standard_Integer)
	GIsBound(Standard_Boolean)
	C(TopOpeBRepDS_Config)
	P(Standard_Real)

Returns:
	None

Create an interference of VERTEX <G> on crossed EDGE <S>.  
 
 <T> is the transition along the edge, crossing the crossed edge.  
 <S> is the crossed edge.  
 <GIsBound> indicates if <G> is a bound of the edge.  
 <C> indicates the geometric configuration between  
       the edge and the crossed edge.  
 <P> is the parameter of <G> on the edge.  
 
 interference is stored in the list of interfs of the edge.") TopOpeBRepDS_EdgeVertexInterference;
		 TopOpeBRepDS_EdgeVertexInterference (const TopOpeBRepDS_Transition & T,const Standard_Integer S,const Standard_Integer G,const Standard_Boolean GIsBound,const TopOpeBRepDS_Config C,const Standard_Real P);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Parameter;
		Standard_Real Parameter ();
		%feature("autodoc", "Args:
	P(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Parameter;
		void Parameter (const Standard_Real P);
		%feature("autodoc", "Args:
	OS(Standard_OStream)

Returns:
	virtual Standard_OStream

No detailed docstring for this function.") Dump;
		virtual Standard_OStream & Dump (Standard_OStream & OS);
};


%feature("shadow") TopOpeBRepDS_EdgeVertexInterference::~TopOpeBRepDS_EdgeVertexInterference %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_EdgeVertexInterference {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopOpeBRepDS_EdgeVertexInterference {
	Handle_TopOpeBRepDS_EdgeVertexInterference GetHandle() {
	return *(Handle_TopOpeBRepDS_EdgeVertexInterference*) &$self;
	}
};

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
    TopOpeBRepDS_EdgeVertexInterference* GetObject() {
    return (TopOpeBRepDS_EdgeVertexInterference*)$self->Access();
    }
};
%feature("shadow") Handle_TopOpeBRepDS_EdgeVertexInterference::~Handle_TopOpeBRepDS_EdgeVertexInterference %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopOpeBRepDS_EdgeVertexInterference {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopOpeBRepDS_FaceEdgeInterference;
class TopOpeBRepDS_FaceEdgeInterference : public TopOpeBRepDS_ShapeShapeInterference {
	public:
		%feature("autodoc", "Args:
	T(TopOpeBRepDS_Transition)
	S(Standard_Integer)
	G(Standard_Integer)
	GIsBound(Standard_Boolean)
	C(TopOpeBRepDS_Config)

Returns:
	None

Create an interference of EDGE <G> on FACE <S>.") TopOpeBRepDS_FaceEdgeInterference;
		 TopOpeBRepDS_FaceEdgeInterference (const TopOpeBRepDS_Transition & T,const Standard_Integer S,const Standard_Integer G,const Standard_Boolean GIsBound,const TopOpeBRepDS_Config C);
		%feature("autodoc", "Args:
	OS(Standard_OStream)

Returns:
	virtual Standard_OStream

No detailed docstring for this function.") Dump;
		virtual Standard_OStream & Dump (Standard_OStream & OS);
};


%feature("shadow") TopOpeBRepDS_FaceEdgeInterference::~TopOpeBRepDS_FaceEdgeInterference %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepDS_FaceEdgeInterference {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopOpeBRepDS_FaceEdgeInterference {
	Handle_TopOpeBRepDS_FaceEdgeInterference GetHandle() {
	return *(Handle_TopOpeBRepDS_FaceEdgeInterference*) &$self;
	}
};

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
    TopOpeBRepDS_FaceEdgeInterference* GetObject() {
    return (TopOpeBRepDS_FaceEdgeInterference*)$self->Access();
    }
};
%feature("shadow") Handle_TopOpeBRepDS_FaceEdgeInterference::~Handle_TopOpeBRepDS_FaceEdgeInterference %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopOpeBRepDS_FaceEdgeInterference {
    void _kill_pointed() {
        delete $self;
    }
};

