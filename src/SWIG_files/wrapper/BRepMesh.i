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
%module (package="OCC") BRepMesh

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

%include BRepMesh_headers.i

/* typedefs */
typedef NCollection_Vector <BRepMesh_Vertex> BRepMesh_VectorOfVertex;
typedef NCollection_DataMap <Standard_Integer , Standard_Integer> BRepMesh_MapOfIntegerInteger;
typedef Standard_Integer ( * BRepMesh_PluginEntryType ) ( const TopoDS_Shape & theShape , const Standard_Real theDeflection , const Standard_Real theAngle , BRepMesh_DiscretRoot * & theMeshAlgoInstance );
typedef Handle_NCollection_IncAllocator BRepMesh_BaseAllocator;
typedef NCollection_Handle <BRepMesh_Classifier> BRepMesh_ClassifierPtr;
typedef NCollection_CellFilter <BRepMesh_CircleInspector> BRepMesh_CellFilter;
typedef NCollection_Map <Standard_Integer> BRepMesh_MapOfInteger;
typedef NCollection_Vector <BRepMesh_Circ> CircVector;
typedef NCollection_Handle <BRepMesh_MapOfInteger> Handle_BRepMesh_MapOfInteger;
typedef BRepMesh_DiscretRoot * BRepMesh_PDiscretRoot;
typedef NCollection_CellFilter <BRepMesh_VertexInspector> BRepMesh_VertexCellFilter;
typedef NCollection_List <Standard_Integer> BRepMesh_ListOfInteger;
/* end typedefs declaration */

/* public enums */
enum BRepMesh_DegreeOfFreedom {
	BRepMesh_Free = 0,
	BRepMesh_InVolume = 1,
	BRepMesh_OnSurface = 2,
	BRepMesh_OnCurve = 3,
	BRepMesh_Fixed = 4,
	BRepMesh_Frontier = 5,
	BRepMesh_Deleted = 6,
};

enum BRepMesh_FactoryError {
	BRepMesh_FE_NOERROR = 0,
	BRepMesh_FE_LIBRARYNOTFOUND = 1,
	BRepMesh_FE_FUNCTIONNOTFOUND = 2,
	BRepMesh_FE_CANNOTCREATEALGO = 3,
};

enum BRepMesh_Status {
	BRepMesh_NoError = 0,
	BRepMesh_OpenWire = 1,
	BRepMesh_SelfIntersectingWire = 2,
	BRepMesh_Failure = 4,
	BRepMesh_ReMesh = 8,
};

/* end public enums declaration */

%rename(brepmesh) BRepMesh;
%nodefaultctor BRepMesh;
class BRepMesh {
	public:
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	d(Standard_Real)

Returns:
	static void

call to incremental mesh.") Mesh;
		static void Mesh (const TopoDS_Shape & S,const Standard_Real d);
};


%feature("shadow") BRepMesh::~BRepMesh %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepMesh_Array1OfBiPoint;
class BRepMesh_Array1OfBiPoint {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") BRepMesh_Array1OfBiPoint;
		 BRepMesh_Array1OfBiPoint (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(BRepMesh_BiPoint)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") BRepMesh_Array1OfBiPoint;
		 BRepMesh_Array1OfBiPoint (const BRepMesh_BiPoint & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(BRepMesh_BiPoint)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const BRepMesh_BiPoint & V);
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
	Other(BRepMesh_Array1OfBiPoint)

Returns:
	BRepMesh_Array1OfBiPoint

No detailed docstring for this function.") Assign;
		const BRepMesh_Array1OfBiPoint & Assign (const BRepMesh_Array1OfBiPoint & Other);
		%feature("autodoc", "Args:
	Other(BRepMesh_Array1OfBiPoint)

Returns:
	BRepMesh_Array1OfBiPoint

No detailed docstring for this function.") operator=;
		const BRepMesh_Array1OfBiPoint & operator = (const BRepMesh_Array1OfBiPoint & Other);
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
	Value(BRepMesh_BiPoint)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const BRepMesh_BiPoint & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	BRepMesh_BiPoint

No detailed docstring for this function.") Value;
		const BRepMesh_BiPoint & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	BRepMesh_BiPoint

No detailed docstring for this function.") ChangeValue;
		BRepMesh_BiPoint & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") BRepMesh_Array1OfBiPoint::~BRepMesh_Array1OfBiPoint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_Array1OfBiPoint {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepMesh_Array1OfVertexOfDelaun;
class BRepMesh_Array1OfVertexOfDelaun {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") BRepMesh_Array1OfVertexOfDelaun;
		 BRepMesh_Array1OfVertexOfDelaun (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(BRepMesh_Vertex)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") BRepMesh_Array1OfVertexOfDelaun;
		 BRepMesh_Array1OfVertexOfDelaun (const BRepMesh_Vertex & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(BRepMesh_Vertex)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const BRepMesh_Vertex & V);
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
	Other(BRepMesh_Array1OfVertexOfDelaun)

Returns:
	BRepMesh_Array1OfVertexOfDelaun

No detailed docstring for this function.") Assign;
		const BRepMesh_Array1OfVertexOfDelaun & Assign (const BRepMesh_Array1OfVertexOfDelaun & Other);
		%feature("autodoc", "Args:
	Other(BRepMesh_Array1OfVertexOfDelaun)

Returns:
	BRepMesh_Array1OfVertexOfDelaun

No detailed docstring for this function.") operator=;
		const BRepMesh_Array1OfVertexOfDelaun & operator = (const BRepMesh_Array1OfVertexOfDelaun & Other);
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
	Value(BRepMesh_Vertex)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const BRepMesh_Vertex & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	BRepMesh_Vertex

No detailed docstring for this function.") Value;
		const BRepMesh_Vertex & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	BRepMesh_Vertex

No detailed docstring for this function.") ChangeValue;
		BRepMesh_Vertex & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") BRepMesh_Array1OfVertexOfDelaun::~BRepMesh_Array1OfVertexOfDelaun %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_Array1OfVertexOfDelaun {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepMesh_BiPoint;
class BRepMesh_BiPoint {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepMesh_BiPoint;
		 BRepMesh_BiPoint ();
		%feature("autodoc", "Args:
	X1(Standard_Real)
	Y1(Standard_Real)
	X2(Standard_Real)
	Y2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepMesh_BiPoint;
		 BRepMesh_BiPoint (const Standard_Real X1,const Standard_Real Y1,const Standard_Real X2,const Standard_Real Y2);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Address

No detailed docstring for this function.") Indices;
		Standard_Address Indices ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Address

No detailed docstring for this function.") Coordinates;
		Standard_Address Coordinates ();
};


%feature("shadow") BRepMesh_BiPoint::~BRepMesh_BiPoint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_BiPoint {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepMesh_Circ;
class BRepMesh_Circ {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepMesh_Circ;
		 BRepMesh_Circ ();
		%feature("autodoc", "Args:
	loc(gp_XY)
	rad(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepMesh_Circ;
		 BRepMesh_Circ (const gp_XY & loc,const Standard_Real rad);
		%feature("autodoc", "Args:
	loc(gp_XY)

Returns:
	None

No detailed docstring for this function.") SetLocation;
		void SetLocation (const gp_XY & loc);
		%feature("autodoc", "Args:
	rad(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetRadius;
		void SetRadius (const Standard_Real rad);
		%feature("autodoc", "Args:
	None
Returns:
	gp_XY

No detailed docstring for this function.") Location;
		const gp_XY & Location ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Radius;
		const Standard_Real & Radius ();
};


%feature("shadow") BRepMesh_Circ::~BRepMesh_Circ %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_Circ {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepMesh_CircleInspector;
class BRepMesh_CircleInspector : public NCollection_CellFilter_InspectorXY {
	public:
		%feature("autodoc", "Args:
	theTol(Standard_Real)
	nbComp(Standard_Integer)
	theAlloc(BRepMesh_BaseAllocator)

Returns:
	None

Constructor; remembers tolerance and collector data structure.
All the found points are put in the map and excluded from further
consideration.") BRepMesh_CircleInspector;
		 BRepMesh_CircleInspector (Standard_Real theTol,Standard_Integer nbComp,const BRepMesh_BaseAllocator & theAlloc);
		%feature("autodoc", "Args:
	theInd(Standard_Integer)
	theCircle(BRepMesh_Circ)

Returns:
	None

No detailed docstring for this function.") Add;
		void Add (Standard_Integer theInd,const BRepMesh_Circ & theCircle);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ClerResList;
		void ClerResList ();
		%feature("autodoc", "Args:
	None
Returns:
	CircVector

No detailed docstring for this function.") MapOfCirc;
		CircVector & MapOfCirc ();
		%feature("autodoc", "Args:
	theInd(Standard_Integer)

Returns:
	BRepMesh_Circ

No detailed docstring for this function.") GetCirc;
		BRepMesh_Circ & GetCirc (Standard_Integer theInd);
		%feature("autodoc", "Args:
	theCurCircle(gp_XY)

Returns:
	None

Set current node to be checked") SetCurrent;
		void SetCurrent (const gp_XY & theCurCircle);
		%feature("autodoc", "Args:
	None
Returns:
	BRepMesh_ListOfInteger

//!Get result index of node") GetCoincidentInd;
		BRepMesh_ListOfInteger & GetCoincidentInd ();
		%feature("autodoc", "Args:
	theTarget(Standard_Integer)

Returns:
	NCollection_CellFilter_Action

Implementation of inspection method") Inspect;
		NCollection_CellFilter_Action Inspect (const Standard_Integer theTarget);
		%feature("autodoc", "Args:
	theIdx(Standard_Integer)
	theTarget(Standard_Integer)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsEqual;
		static Standard_Boolean IsEqual (Standard_Integer theIdx,const Standard_Integer theTarget);
};


%feature("shadow") BRepMesh_CircleInspector::~BRepMesh_CircleInspector %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_CircleInspector {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepMesh_CircleTool;
class BRepMesh_CircleTool {
	public:
		%feature("autodoc", "Args:
	theAlloc(BRepMesh_BaseAllocator)

Returns:
	None

No detailed docstring for this function.") BRepMesh_CircleTool;
		 BRepMesh_CircleTool (const BRepMesh_BaseAllocator & theAlloc);
		%feature("autodoc", "Args:
	numberOfComponents(Standard_Integer)
	theAlloc(BRepMesh_BaseAllocator)

Returns:
	None

Constructs a CircleTool with the maximal dimension  
         of  the occuped  space and  an  evaluation of  the  
         number of circles.") BRepMesh_CircleTool;
		 BRepMesh_CircleTool (const Standard_Integer numberOfComponents,const BRepMesh_BaseAllocator & theAlloc);
		%feature("autodoc", "Args:
	numberOfComponents(Standard_Integer)

Returns:
	None

Constructs a CircleTool with the maximal dimension  
         of  the occuped  space and  an  evaluation of  the  
         number of circles.") Initialize;
		void Initialize (const Standard_Integer numberOfComponents);
		%feature("autodoc", "Args:
	theSize(Standard_Real)

Returns:
	None

Sets new size for cellfilter") SetCellSize;
		void SetCellSize (const Standard_Real theSize);
		%feature("autodoc", "Args:
	theXSize(Standard_Real)
	theYSize(Standard_Real)

Returns:
	None

Sets new size for cellfilter") SetCellSize;
		void SetCellSize (const Standard_Real theXSize,const Standard_Real theYSize);
		%feature("autodoc", "Args:
	theMin(gp_XY)
	theMax(gp_XY)

Returns:
	None

Sets min and max size for circle") SetMinMaxSize;
		void SetMinMaxSize (const gp_XY & theMin,const gp_XY & theMax);
		%feature("autodoc", "Args:
	theCirc(gp_Circ2d)
	theIndex(Standard_Integer)

Returns:
	None

Adds and binds circle to the tool.") Add;
		void Add (const gp_Circ2d & theCirc,const Standard_Integer theIndex);
		%feature("autodoc", "Args:
	p1(gp_XY)
	p2(gp_XY)
	p3(gp_XY)
	theIndex(Standard_Integer)

Returns:
	Standard_Boolean

Computes adds and binds circle to the tool.") Add;
		Standard_Boolean Add (const gp_XY & p1,const gp_XY & p2,const gp_XY & p3,const Standard_Integer theIndex);
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)

Returns:
	None

Adds implicit zero circle") MocAdd;
		void MocAdd (const Standard_Integer theIndex);
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)

Returns:
	None

Deletes a circle from the tool.") Delete;
		void Delete (const Standard_Integer theIndex);
		%feature("autodoc", "Args:
	thePnt(gp_XY)

Returns:
	BRepMesh_ListOfInteger

Select the circles which contains thePnt.") Select;
		BRepMesh_ListOfInteger & Select (const gp_XY & thePnt);
};


%feature("shadow") BRepMesh_CircleTool::~BRepMesh_CircleTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_CircleTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepMesh_Classifier;
class BRepMesh_Classifier {
	public:
		%feature("autodoc", "Args:
	theFace(TopoDS_Face)
	theTolUV(Standard_Real)
	theEdges(BRepMesh_DataMapOfShapePairOfPolygon)
	theMap(TColStd_IndexedMapOfInteger)
	theStructure(Handle_BRepMesh_DataStructureOfDelaun)
	theUmin(Standard_Real)
	theUmax(Standard_Real)
	theVmin(Standard_Real)
	theVmax(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepMesh_Classifier;
		 BRepMesh_Classifier (const TopoDS_Face & theFace,const Standard_Real theTolUV,const BRepMesh_DataMapOfShapePairOfPolygon & theEdges,const TColStd_IndexedMapOfInteger & theMap,const Handle_BRepMesh_DataStructureOfDelaun & theStructure,const Standard_Real theUmin,const Standard_Real theUmax,const Standard_Real theVmin,const Standard_Real theVmax);
		%feature("autodoc", "Args:
	thePoint(gp_Pnt2d)

Returns:
	TopAbs_State

No detailed docstring for this function.") Perform;
		TopAbs_State Perform (const gp_Pnt2d & thePoint);
		%feature("autodoc", "Args:
	None
Returns:
	BRepMesh_Status

No detailed docstring for this function.") State;
		BRepMesh_Status State ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
};


%feature("shadow") BRepMesh_Classifier::~BRepMesh_Classifier %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_Classifier {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepMesh_ComparatorOfIndexedVertexOfDelaun;
class BRepMesh_ComparatorOfIndexedVertexOfDelaun {
	public:
		%feature("autodoc", "Args:
	theDir(gp_XY)
	TheTol(Standard_Real)
	HDS(Handle_BRepMesh_DataStructureOfDelaun)

Returns:
	None

No detailed docstring for this function.") BRepMesh_ComparatorOfIndexedVertexOfDelaun;
		 BRepMesh_ComparatorOfIndexedVertexOfDelaun (const gp_XY & theDir,const Standard_Real TheTol,const Handle_BRepMesh_DataStructureOfDelaun & HDS);
		%feature("autodoc", "Args:
	Left(Standard_Integer)
	Right(Standard_Integer)

Returns:
	Standard_Boolean

returns True if <Left> is lower than <Right>") IsLower;
		Standard_Boolean IsLower (const Standard_Integer Left,const Standard_Integer Right);
		%feature("autodoc", "Args:
	Left(Standard_Integer)
	Right(Standard_Integer)

Returns:
	Standard_Boolean

returns True if <Left> is greater than <Right>") IsGreater;
		Standard_Boolean IsGreater (const Standard_Integer Left,const Standard_Integer Right);
		%feature("autodoc", "Args:
	Left(Standard_Integer)
	Right(Standard_Integer)

Returns:
	Standard_Boolean

returns True when <Right> and <Left> are equal.") IsEqual;
		Standard_Boolean IsEqual (const Standard_Integer Left,const Standard_Integer Right);
};


%feature("shadow") BRepMesh_ComparatorOfIndexedVertexOfDelaun::~BRepMesh_ComparatorOfIndexedVertexOfDelaun %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_ComparatorOfIndexedVertexOfDelaun {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepMesh_ComparatorOfVertexOfDelaun;
class BRepMesh_ComparatorOfVertexOfDelaun {
	public:
		%feature("autodoc", "Args:
	theDir(gp_XY)

Returns:
	None

No detailed docstring for this function.") BRepMesh_ComparatorOfVertexOfDelaun;
		 BRepMesh_ComparatorOfVertexOfDelaun (const gp_XY & theDir);
		%feature("autodoc", "Args:
	Left(BRepMesh_Vertex)
	Right(BRepMesh_Vertex)

Returns:
	Standard_Boolean

returns True if <Left> is lower than <Right>") IsLower;
		Standard_Boolean IsLower (const BRepMesh_Vertex & Left,const BRepMesh_Vertex & Right);
		%feature("autodoc", "Args:
	Left(BRepMesh_Vertex)
	Right(BRepMesh_Vertex)

Returns:
	Standard_Boolean

returns True if <Left> is greater than <Right>") IsGreater;
		Standard_Boolean IsGreater (const BRepMesh_Vertex & Left,const BRepMesh_Vertex & Right);
		%feature("autodoc", "Args:
	Left(BRepMesh_Vertex)
	Right(BRepMesh_Vertex)

Returns:
	Standard_Boolean

returns True when <Right> and <Left> are equal.") IsEqual;
		Standard_Boolean IsEqual (const BRepMesh_Vertex & Left,const BRepMesh_Vertex & Right);
};


%feature("shadow") BRepMesh_ComparatorOfVertexOfDelaun::~BRepMesh_ComparatorOfVertexOfDelaun %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_ComparatorOfVertexOfDelaun {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepMesh_DataMapIteratorOfDataMapOfFaceAttribute;
class BRepMesh_DataMapIteratorOfDataMapOfFaceAttribute : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepMesh_DataMapIteratorOfDataMapOfFaceAttribute;
		 BRepMesh_DataMapIteratorOfDataMapOfFaceAttribute ();
		%feature("autodoc", "Args:
	aMap(BRepMesh_DataMapOfFaceAttribute)

Returns:
	None

No detailed docstring for this function.") BRepMesh_DataMapIteratorOfDataMapOfFaceAttribute;
		 BRepMesh_DataMapIteratorOfDataMapOfFaceAttribute (const BRepMesh_DataMapOfFaceAttribute & aMap);
		%feature("autodoc", "Args:
	aMap(BRepMesh_DataMapOfFaceAttribute)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const BRepMesh_DataMapOfFaceAttribute & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Face

No detailed docstring for this function.") Key;
		const TopoDS_Face & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_BRepMesh_FaceAttribute

No detailed docstring for this function.") Value;
		const Handle_BRepMesh_FaceAttribute & Value ();
};


%feature("shadow") BRepMesh_DataMapIteratorOfDataMapOfFaceAttribute::~BRepMesh_DataMapIteratorOfDataMapOfFaceAttribute %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_DataMapIteratorOfDataMapOfFaceAttribute {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepMesh_DataMapIteratorOfDataMapOfIntegerListOfInteger;
class BRepMesh_DataMapIteratorOfDataMapOfIntegerListOfInteger : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepMesh_DataMapIteratorOfDataMapOfIntegerListOfInteger;
		 BRepMesh_DataMapIteratorOfDataMapOfIntegerListOfInteger ();
		%feature("autodoc", "Args:
	aMap(BRepMesh_DataMapOfIntegerListOfInteger)

Returns:
	None

No detailed docstring for this function.") BRepMesh_DataMapIteratorOfDataMapOfIntegerListOfInteger;
		 BRepMesh_DataMapIteratorOfDataMapOfIntegerListOfInteger (const BRepMesh_DataMapOfIntegerListOfInteger & aMap);
		%feature("autodoc", "Args:
	aMap(BRepMesh_DataMapOfIntegerListOfInteger)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const BRepMesh_DataMapOfIntegerListOfInteger & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Key;
		const Standard_Integer & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepMesh_ListOfInteger

No detailed docstring for this function.") Value;
		const BRepMesh_ListOfInteger & Value ();
};


%feature("shadow") BRepMesh_DataMapIteratorOfDataMapOfIntegerListOfInteger::~BRepMesh_DataMapIteratorOfDataMapOfIntegerListOfInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_DataMapIteratorOfDataMapOfIntegerListOfInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepMesh_DataMapIteratorOfDataMapOfIntegerListOfXY;
class BRepMesh_DataMapIteratorOfDataMapOfIntegerListOfXY : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepMesh_DataMapIteratorOfDataMapOfIntegerListOfXY;
		 BRepMesh_DataMapIteratorOfDataMapOfIntegerListOfXY ();
		%feature("autodoc", "Args:
	aMap(BRepMesh_DataMapOfIntegerListOfXY)

Returns:
	None

No detailed docstring for this function.") BRepMesh_DataMapIteratorOfDataMapOfIntegerListOfXY;
		 BRepMesh_DataMapIteratorOfDataMapOfIntegerListOfXY (const BRepMesh_DataMapOfIntegerListOfXY & aMap);
		%feature("autodoc", "Args:
	aMap(BRepMesh_DataMapOfIntegerListOfXY)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const BRepMesh_DataMapOfIntegerListOfXY & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Key;
		const Standard_Integer & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepMesh_ListOfXY

No detailed docstring for this function.") Value;
		const BRepMesh_ListOfXY & Value ();
};


%feature("shadow") BRepMesh_DataMapIteratorOfDataMapOfIntegerListOfXY::~BRepMesh_DataMapIteratorOfDataMapOfIntegerListOfXY %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_DataMapIteratorOfDataMapOfIntegerListOfXY {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepMesh_DataMapIteratorOfDataMapOfIntegerPnt;
class BRepMesh_DataMapIteratorOfDataMapOfIntegerPnt : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepMesh_DataMapIteratorOfDataMapOfIntegerPnt;
		 BRepMesh_DataMapIteratorOfDataMapOfIntegerPnt ();
		%feature("autodoc", "Args:
	aMap(BRepMesh_DataMapOfIntegerPnt)

Returns:
	None

No detailed docstring for this function.") BRepMesh_DataMapIteratorOfDataMapOfIntegerPnt;
		 BRepMesh_DataMapIteratorOfDataMapOfIntegerPnt (const BRepMesh_DataMapOfIntegerPnt & aMap);
		%feature("autodoc", "Args:
	aMap(BRepMesh_DataMapOfIntegerPnt)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const BRepMesh_DataMapOfIntegerPnt & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Key;
		const Standard_Integer & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

No detailed docstring for this function.") Value;
		const gp_Pnt & Value ();
};


%feature("shadow") BRepMesh_DataMapIteratorOfDataMapOfIntegerPnt::~BRepMesh_DataMapIteratorOfDataMapOfIntegerPnt %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_DataMapIteratorOfDataMapOfIntegerPnt {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepMesh_DataMapIteratorOfDataMapOfShapePairOfPolygon;
class BRepMesh_DataMapIteratorOfDataMapOfShapePairOfPolygon : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepMesh_DataMapIteratorOfDataMapOfShapePairOfPolygon;
		 BRepMesh_DataMapIteratorOfDataMapOfShapePairOfPolygon ();
		%feature("autodoc", "Args:
	aMap(BRepMesh_DataMapOfShapePairOfPolygon)

Returns:
	None

No detailed docstring for this function.") BRepMesh_DataMapIteratorOfDataMapOfShapePairOfPolygon;
		 BRepMesh_DataMapIteratorOfDataMapOfShapePairOfPolygon (const BRepMesh_DataMapOfShapePairOfPolygon & aMap);
		%feature("autodoc", "Args:
	aMap(BRepMesh_DataMapOfShapePairOfPolygon)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const BRepMesh_DataMapOfShapePairOfPolygon & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		const TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepMesh_PairOfPolygon

No detailed docstring for this function.") Value;
		const BRepMesh_PairOfPolygon & Value ();
};


%feature("shadow") BRepMesh_DataMapIteratorOfDataMapOfShapePairOfPolygon::~BRepMesh_DataMapIteratorOfDataMapOfShapePairOfPolygon %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_DataMapIteratorOfDataMapOfShapePairOfPolygon {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepMesh_DataMapIteratorOfDataMapOfShapeReal;
class BRepMesh_DataMapIteratorOfDataMapOfShapeReal : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepMesh_DataMapIteratorOfDataMapOfShapeReal;
		 BRepMesh_DataMapIteratorOfDataMapOfShapeReal ();
		%feature("autodoc", "Args:
	aMap(BRepMesh_DataMapOfShapeReal)

Returns:
	None

No detailed docstring for this function.") BRepMesh_DataMapIteratorOfDataMapOfShapeReal;
		 BRepMesh_DataMapIteratorOfDataMapOfShapeReal (const BRepMesh_DataMapOfShapeReal & aMap);
		%feature("autodoc", "Args:
	aMap(BRepMesh_DataMapOfShapeReal)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const BRepMesh_DataMapOfShapeReal & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		const TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Value;
		const Standard_Real & Value ();
};


%feature("shadow") BRepMesh_DataMapIteratorOfDataMapOfShapeReal::~BRepMesh_DataMapIteratorOfDataMapOfShapeReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_DataMapIteratorOfDataMapOfShapeReal {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepMesh_DataMapIteratorOfDataMapOfVertexInteger;
class BRepMesh_DataMapIteratorOfDataMapOfVertexInteger : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepMesh_DataMapIteratorOfDataMapOfVertexInteger;
		 BRepMesh_DataMapIteratorOfDataMapOfVertexInteger ();
		%feature("autodoc", "Args:
	aMap(BRepMesh_DataMapOfVertexInteger)

Returns:
	None

No detailed docstring for this function.") BRepMesh_DataMapIteratorOfDataMapOfVertexInteger;
		 BRepMesh_DataMapIteratorOfDataMapOfVertexInteger (const BRepMesh_DataMapOfVertexInteger & aMap);
		%feature("autodoc", "Args:
	aMap(BRepMesh_DataMapOfVertexInteger)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const BRepMesh_DataMapOfVertexInteger & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Vertex

No detailed docstring for this function.") Key;
		const TopoDS_Vertex & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Value;
		const Standard_Integer & Value ();
};


%feature("shadow") BRepMesh_DataMapIteratorOfDataMapOfVertexInteger::~BRepMesh_DataMapIteratorOfDataMapOfVertexInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_DataMapIteratorOfDataMapOfVertexInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepMesh_DataMapNodeOfDataMapOfFaceAttribute;
class BRepMesh_DataMapNodeOfDataMapOfFaceAttribute : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(TopoDS_Face)
	I(Handle_BRepMesh_FaceAttribute)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") BRepMesh_DataMapNodeOfDataMapOfFaceAttribute;
		 BRepMesh_DataMapNodeOfDataMapOfFaceAttribute (const TopoDS_Face & K,const Handle_BRepMesh_FaceAttribute & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Face

No detailed docstring for this function.") Key;
		TopoDS_Face & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_BRepMesh_FaceAttribute

No detailed docstring for this function.") Value;
		Handle_BRepMesh_FaceAttribute & Value ();
};


%feature("shadow") BRepMesh_DataMapNodeOfDataMapOfFaceAttribute::~BRepMesh_DataMapNodeOfDataMapOfFaceAttribute %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_DataMapNodeOfDataMapOfFaceAttribute {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepMesh_DataMapNodeOfDataMapOfFaceAttribute {
	Handle_BRepMesh_DataMapNodeOfDataMapOfFaceAttribute GetHandle() {
	return *(Handle_BRepMesh_DataMapNodeOfDataMapOfFaceAttribute*) &$self;
	}
};

%nodefaultctor Handle_BRepMesh_DataMapNodeOfDataMapOfFaceAttribute;
class Handle_BRepMesh_DataMapNodeOfDataMapOfFaceAttribute : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_BRepMesh_DataMapNodeOfDataMapOfFaceAttribute();
        Handle_BRepMesh_DataMapNodeOfDataMapOfFaceAttribute(const Handle_BRepMesh_DataMapNodeOfDataMapOfFaceAttribute &aHandle);
        Handle_BRepMesh_DataMapNodeOfDataMapOfFaceAttribute(const BRepMesh_DataMapNodeOfDataMapOfFaceAttribute *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepMesh_DataMapNodeOfDataMapOfFaceAttribute DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepMesh_DataMapNodeOfDataMapOfFaceAttribute {
    BRepMesh_DataMapNodeOfDataMapOfFaceAttribute* GetObject() {
    return (BRepMesh_DataMapNodeOfDataMapOfFaceAttribute*)$self->Access();
    }
};
%feature("shadow") Handle_BRepMesh_DataMapNodeOfDataMapOfFaceAttribute::~Handle_BRepMesh_DataMapNodeOfDataMapOfFaceAttribute %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepMesh_DataMapNodeOfDataMapOfFaceAttribute {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepMesh_DataMapNodeOfDataMapOfIntegerListOfInteger;
class BRepMesh_DataMapNodeOfDataMapOfIntegerListOfInteger : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(Standard_Integer)
	I(BRepMesh_ListOfInteger)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") BRepMesh_DataMapNodeOfDataMapOfIntegerListOfInteger;
		 BRepMesh_DataMapNodeOfDataMapOfIntegerListOfInteger (Standard_Integer &OutValue,const BRepMesh_ListOfInteger & I,const TCollection_MapNodePtr & n);

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
	BRepMesh_ListOfInteger

No detailed docstring for this function.") Value;
		BRepMesh_ListOfInteger & Value ();
};


%feature("shadow") BRepMesh_DataMapNodeOfDataMapOfIntegerListOfInteger::~BRepMesh_DataMapNodeOfDataMapOfIntegerListOfInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_DataMapNodeOfDataMapOfIntegerListOfInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepMesh_DataMapNodeOfDataMapOfIntegerListOfInteger {
	Handle_BRepMesh_DataMapNodeOfDataMapOfIntegerListOfInteger GetHandle() {
	return *(Handle_BRepMesh_DataMapNodeOfDataMapOfIntegerListOfInteger*) &$self;
	}
};

%nodefaultctor Handle_BRepMesh_DataMapNodeOfDataMapOfIntegerListOfInteger;
class Handle_BRepMesh_DataMapNodeOfDataMapOfIntegerListOfInteger : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_BRepMesh_DataMapNodeOfDataMapOfIntegerListOfInteger();
        Handle_BRepMesh_DataMapNodeOfDataMapOfIntegerListOfInteger(const Handle_BRepMesh_DataMapNodeOfDataMapOfIntegerListOfInteger &aHandle);
        Handle_BRepMesh_DataMapNodeOfDataMapOfIntegerListOfInteger(const BRepMesh_DataMapNodeOfDataMapOfIntegerListOfInteger *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepMesh_DataMapNodeOfDataMapOfIntegerListOfInteger DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepMesh_DataMapNodeOfDataMapOfIntegerListOfInteger {
    BRepMesh_DataMapNodeOfDataMapOfIntegerListOfInteger* GetObject() {
    return (BRepMesh_DataMapNodeOfDataMapOfIntegerListOfInteger*)$self->Access();
    }
};
%feature("shadow") Handle_BRepMesh_DataMapNodeOfDataMapOfIntegerListOfInteger::~Handle_BRepMesh_DataMapNodeOfDataMapOfIntegerListOfInteger %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepMesh_DataMapNodeOfDataMapOfIntegerListOfInteger {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepMesh_DataMapNodeOfDataMapOfIntegerListOfXY;
class BRepMesh_DataMapNodeOfDataMapOfIntegerListOfXY : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(Standard_Integer)
	I(BRepMesh_ListOfXY)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") BRepMesh_DataMapNodeOfDataMapOfIntegerListOfXY;
		 BRepMesh_DataMapNodeOfDataMapOfIntegerListOfXY (Standard_Integer &OutValue,const BRepMesh_ListOfXY & I,const TCollection_MapNodePtr & n);

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
	BRepMesh_ListOfXY

No detailed docstring for this function.") Value;
		BRepMesh_ListOfXY & Value ();
};


%feature("shadow") BRepMesh_DataMapNodeOfDataMapOfIntegerListOfXY::~BRepMesh_DataMapNodeOfDataMapOfIntegerListOfXY %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_DataMapNodeOfDataMapOfIntegerListOfXY {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepMesh_DataMapNodeOfDataMapOfIntegerListOfXY {
	Handle_BRepMesh_DataMapNodeOfDataMapOfIntegerListOfXY GetHandle() {
	return *(Handle_BRepMesh_DataMapNodeOfDataMapOfIntegerListOfXY*) &$self;
	}
};

%nodefaultctor Handle_BRepMesh_DataMapNodeOfDataMapOfIntegerListOfXY;
class Handle_BRepMesh_DataMapNodeOfDataMapOfIntegerListOfXY : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_BRepMesh_DataMapNodeOfDataMapOfIntegerListOfXY();
        Handle_BRepMesh_DataMapNodeOfDataMapOfIntegerListOfXY(const Handle_BRepMesh_DataMapNodeOfDataMapOfIntegerListOfXY &aHandle);
        Handle_BRepMesh_DataMapNodeOfDataMapOfIntegerListOfXY(const BRepMesh_DataMapNodeOfDataMapOfIntegerListOfXY *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepMesh_DataMapNodeOfDataMapOfIntegerListOfXY DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepMesh_DataMapNodeOfDataMapOfIntegerListOfXY {
    BRepMesh_DataMapNodeOfDataMapOfIntegerListOfXY* GetObject() {
    return (BRepMesh_DataMapNodeOfDataMapOfIntegerListOfXY*)$self->Access();
    }
};
%feature("shadow") Handle_BRepMesh_DataMapNodeOfDataMapOfIntegerListOfXY::~Handle_BRepMesh_DataMapNodeOfDataMapOfIntegerListOfXY %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepMesh_DataMapNodeOfDataMapOfIntegerListOfXY {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepMesh_DataMapNodeOfDataMapOfIntegerPnt;
class BRepMesh_DataMapNodeOfDataMapOfIntegerPnt : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(Standard_Integer)
	I(gp_Pnt)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") BRepMesh_DataMapNodeOfDataMapOfIntegerPnt;
		 BRepMesh_DataMapNodeOfDataMapOfIntegerPnt (Standard_Integer &OutValue,const gp_Pnt & I,const TCollection_MapNodePtr & n);

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
	gp_Pnt

No detailed docstring for this function.") Value;
		gp_Pnt & Value ();
};


%feature("shadow") BRepMesh_DataMapNodeOfDataMapOfIntegerPnt::~BRepMesh_DataMapNodeOfDataMapOfIntegerPnt %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_DataMapNodeOfDataMapOfIntegerPnt {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepMesh_DataMapNodeOfDataMapOfIntegerPnt {
	Handle_BRepMesh_DataMapNodeOfDataMapOfIntegerPnt GetHandle() {
	return *(Handle_BRepMesh_DataMapNodeOfDataMapOfIntegerPnt*) &$self;
	}
};

%nodefaultctor Handle_BRepMesh_DataMapNodeOfDataMapOfIntegerPnt;
class Handle_BRepMesh_DataMapNodeOfDataMapOfIntegerPnt : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_BRepMesh_DataMapNodeOfDataMapOfIntegerPnt();
        Handle_BRepMesh_DataMapNodeOfDataMapOfIntegerPnt(const Handle_BRepMesh_DataMapNodeOfDataMapOfIntegerPnt &aHandle);
        Handle_BRepMesh_DataMapNodeOfDataMapOfIntegerPnt(const BRepMesh_DataMapNodeOfDataMapOfIntegerPnt *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepMesh_DataMapNodeOfDataMapOfIntegerPnt DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepMesh_DataMapNodeOfDataMapOfIntegerPnt {
    BRepMesh_DataMapNodeOfDataMapOfIntegerPnt* GetObject() {
    return (BRepMesh_DataMapNodeOfDataMapOfIntegerPnt*)$self->Access();
    }
};
%feature("shadow") Handle_BRepMesh_DataMapNodeOfDataMapOfIntegerPnt::~Handle_BRepMesh_DataMapNodeOfDataMapOfIntegerPnt %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepMesh_DataMapNodeOfDataMapOfIntegerPnt {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepMesh_DataMapNodeOfDataMapOfShapePairOfPolygon;
class BRepMesh_DataMapNodeOfDataMapOfShapePairOfPolygon : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(BRepMesh_PairOfPolygon)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") BRepMesh_DataMapNodeOfDataMapOfShapePairOfPolygon;
		 BRepMesh_DataMapNodeOfDataMapOfShapePairOfPolygon (const TopoDS_Shape & K,const BRepMesh_PairOfPolygon & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepMesh_PairOfPolygon

No detailed docstring for this function.") Value;
		BRepMesh_PairOfPolygon & Value ();
};


%feature("shadow") BRepMesh_DataMapNodeOfDataMapOfShapePairOfPolygon::~BRepMesh_DataMapNodeOfDataMapOfShapePairOfPolygon %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_DataMapNodeOfDataMapOfShapePairOfPolygon {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepMesh_DataMapNodeOfDataMapOfShapePairOfPolygon {
	Handle_BRepMesh_DataMapNodeOfDataMapOfShapePairOfPolygon GetHandle() {
	return *(Handle_BRepMesh_DataMapNodeOfDataMapOfShapePairOfPolygon*) &$self;
	}
};

%nodefaultctor Handle_BRepMesh_DataMapNodeOfDataMapOfShapePairOfPolygon;
class Handle_BRepMesh_DataMapNodeOfDataMapOfShapePairOfPolygon : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_BRepMesh_DataMapNodeOfDataMapOfShapePairOfPolygon();
        Handle_BRepMesh_DataMapNodeOfDataMapOfShapePairOfPolygon(const Handle_BRepMesh_DataMapNodeOfDataMapOfShapePairOfPolygon &aHandle);
        Handle_BRepMesh_DataMapNodeOfDataMapOfShapePairOfPolygon(const BRepMesh_DataMapNodeOfDataMapOfShapePairOfPolygon *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepMesh_DataMapNodeOfDataMapOfShapePairOfPolygon DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepMesh_DataMapNodeOfDataMapOfShapePairOfPolygon {
    BRepMesh_DataMapNodeOfDataMapOfShapePairOfPolygon* GetObject() {
    return (BRepMesh_DataMapNodeOfDataMapOfShapePairOfPolygon*)$self->Access();
    }
};
%feature("shadow") Handle_BRepMesh_DataMapNodeOfDataMapOfShapePairOfPolygon::~Handle_BRepMesh_DataMapNodeOfDataMapOfShapePairOfPolygon %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepMesh_DataMapNodeOfDataMapOfShapePairOfPolygon {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepMesh_DataMapNodeOfDataMapOfShapeReal;
class BRepMesh_DataMapNodeOfDataMapOfShapeReal : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(Standard_Real)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") BRepMesh_DataMapNodeOfDataMapOfShapeReal;
		 BRepMesh_DataMapNodeOfDataMapOfShapeReal (const TopoDS_Shape & K,const Standard_Real & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		TopoDS_Shape & Key ();

            %feature("autodoc","1");
            %extend {
                Standard_Real GetValue() {
                return (Standard_Real) $self->Value();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetValue(Standard_Real value ) {
                $self->Value()=value;
                }
            };
            };


%feature("shadow") BRepMesh_DataMapNodeOfDataMapOfShapeReal::~BRepMesh_DataMapNodeOfDataMapOfShapeReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_DataMapNodeOfDataMapOfShapeReal {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepMesh_DataMapNodeOfDataMapOfShapeReal {
	Handle_BRepMesh_DataMapNodeOfDataMapOfShapeReal GetHandle() {
	return *(Handle_BRepMesh_DataMapNodeOfDataMapOfShapeReal*) &$self;
	}
};

%nodefaultctor Handle_BRepMesh_DataMapNodeOfDataMapOfShapeReal;
class Handle_BRepMesh_DataMapNodeOfDataMapOfShapeReal : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_BRepMesh_DataMapNodeOfDataMapOfShapeReal();
        Handle_BRepMesh_DataMapNodeOfDataMapOfShapeReal(const Handle_BRepMesh_DataMapNodeOfDataMapOfShapeReal &aHandle);
        Handle_BRepMesh_DataMapNodeOfDataMapOfShapeReal(const BRepMesh_DataMapNodeOfDataMapOfShapeReal *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepMesh_DataMapNodeOfDataMapOfShapeReal DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepMesh_DataMapNodeOfDataMapOfShapeReal {
    BRepMesh_DataMapNodeOfDataMapOfShapeReal* GetObject() {
    return (BRepMesh_DataMapNodeOfDataMapOfShapeReal*)$self->Access();
    }
};
%feature("shadow") Handle_BRepMesh_DataMapNodeOfDataMapOfShapeReal::~Handle_BRepMesh_DataMapNodeOfDataMapOfShapeReal %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepMesh_DataMapNodeOfDataMapOfShapeReal {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepMesh_DataMapNodeOfDataMapOfVertexInteger;
class BRepMesh_DataMapNodeOfDataMapOfVertexInteger : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(TopoDS_Vertex)
	I(Standard_Integer)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") BRepMesh_DataMapNodeOfDataMapOfVertexInteger;
		 BRepMesh_DataMapNodeOfDataMapOfVertexInteger (const TopoDS_Vertex & K,Standard_Integer &OutValue,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Vertex

No detailed docstring for this function.") Key;
		TopoDS_Vertex & Key ();

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetValue() {
                return (Standard_Integer) $self->Value();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetValue(Standard_Integer value ) {
                $self->Value()=value;
                }
            };
            };


%feature("shadow") BRepMesh_DataMapNodeOfDataMapOfVertexInteger::~BRepMesh_DataMapNodeOfDataMapOfVertexInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_DataMapNodeOfDataMapOfVertexInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepMesh_DataMapNodeOfDataMapOfVertexInteger {
	Handle_BRepMesh_DataMapNodeOfDataMapOfVertexInteger GetHandle() {
	return *(Handle_BRepMesh_DataMapNodeOfDataMapOfVertexInteger*) &$self;
	}
};

%nodefaultctor Handle_BRepMesh_DataMapNodeOfDataMapOfVertexInteger;
class Handle_BRepMesh_DataMapNodeOfDataMapOfVertexInteger : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_BRepMesh_DataMapNodeOfDataMapOfVertexInteger();
        Handle_BRepMesh_DataMapNodeOfDataMapOfVertexInteger(const Handle_BRepMesh_DataMapNodeOfDataMapOfVertexInteger &aHandle);
        Handle_BRepMesh_DataMapNodeOfDataMapOfVertexInteger(const BRepMesh_DataMapNodeOfDataMapOfVertexInteger *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepMesh_DataMapNodeOfDataMapOfVertexInteger DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepMesh_DataMapNodeOfDataMapOfVertexInteger {
    BRepMesh_DataMapNodeOfDataMapOfVertexInteger* GetObject() {
    return (BRepMesh_DataMapNodeOfDataMapOfVertexInteger*)$self->Access();
    }
};
%feature("shadow") Handle_BRepMesh_DataMapNodeOfDataMapOfVertexInteger::~Handle_BRepMesh_DataMapNodeOfDataMapOfVertexInteger %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepMesh_DataMapNodeOfDataMapOfVertexInteger {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepMesh_DataMapOfFaceAttribute;
class BRepMesh_DataMapOfFaceAttribute : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") BRepMesh_DataMapOfFaceAttribute;
		 BRepMesh_DataMapOfFaceAttribute (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(BRepMesh_DataMapOfFaceAttribute)

Returns:
	BRepMesh_DataMapOfFaceAttribute

No detailed docstring for this function.") Assign;
		BRepMesh_DataMapOfFaceAttribute & Assign (const BRepMesh_DataMapOfFaceAttribute & Other);
		%feature("autodoc", "Args:
	Other(BRepMesh_DataMapOfFaceAttribute)

Returns:
	BRepMesh_DataMapOfFaceAttribute

No detailed docstring for this function.") operator=;
		BRepMesh_DataMapOfFaceAttribute & operator = (const BRepMesh_DataMapOfFaceAttribute & Other);
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
	K(TopoDS_Face)
	I(Handle_BRepMesh_FaceAttribute)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const TopoDS_Face & K,const Handle_BRepMesh_FaceAttribute & I);
		%feature("autodoc", "Args:
	K(TopoDS_Face)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (const TopoDS_Face & K);
		%feature("autodoc", "Args:
	K(TopoDS_Face)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (const TopoDS_Face & K);
		%feature("autodoc", "Args:
	K(TopoDS_Face)

Returns:
	Handle_BRepMesh_FaceAttribute

No detailed docstring for this function.") Find;
		const Handle_BRepMesh_FaceAttribute & Find (const TopoDS_Face & K);
		%feature("autodoc", "Args:
	K(TopoDS_Face)

Returns:
	Handle_BRepMesh_FaceAttribute

No detailed docstring for this function.") ChangeFind;
		Handle_BRepMesh_FaceAttribute & ChangeFind (const TopoDS_Face & K);
		%feature("autodoc", "Args:
	K(TopoDS_Face)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (const TopoDS_Face & K);
		%feature("autodoc", "Args:
	K(TopoDS_Face)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Face & K);
};


%feature("shadow") BRepMesh_DataMapOfFaceAttribute::~BRepMesh_DataMapOfFaceAttribute %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_DataMapOfFaceAttribute {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepMesh_DataMapOfIntegerListOfInteger;
class BRepMesh_DataMapOfIntegerListOfInteger : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") BRepMesh_DataMapOfIntegerListOfInteger;
		 BRepMesh_DataMapOfIntegerListOfInteger (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(BRepMesh_DataMapOfIntegerListOfInteger)

Returns:
	BRepMesh_DataMapOfIntegerListOfInteger

No detailed docstring for this function.") Assign;
		BRepMesh_DataMapOfIntegerListOfInteger & Assign (const BRepMesh_DataMapOfIntegerListOfInteger & Other);
		%feature("autodoc", "Args:
	Other(BRepMesh_DataMapOfIntegerListOfInteger)

Returns:
	BRepMesh_DataMapOfIntegerListOfInteger

No detailed docstring for this function.") operator=;
		BRepMesh_DataMapOfIntegerListOfInteger & operator = (const BRepMesh_DataMapOfIntegerListOfInteger & Other);
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
	I(BRepMesh_ListOfInteger)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (Standard_Integer &OutValue,const BRepMesh_ListOfInteger & I);
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
	BRepMesh_ListOfInteger

No detailed docstring for this function.") Find;
		const BRepMesh_ListOfInteger & Find (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	BRepMesh_ListOfInteger

No detailed docstring for this function.") ChangeFind;
		BRepMesh_ListOfInteger & ChangeFind (Standard_Integer &OutValue);
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


%feature("shadow") BRepMesh_DataMapOfIntegerListOfInteger::~BRepMesh_DataMapOfIntegerListOfInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_DataMapOfIntegerListOfInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepMesh_DataMapOfIntegerListOfXY;
class BRepMesh_DataMapOfIntegerListOfXY : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") BRepMesh_DataMapOfIntegerListOfXY;
		 BRepMesh_DataMapOfIntegerListOfXY (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(BRepMesh_DataMapOfIntegerListOfXY)

Returns:
	BRepMesh_DataMapOfIntegerListOfXY

No detailed docstring for this function.") Assign;
		BRepMesh_DataMapOfIntegerListOfXY & Assign (const BRepMesh_DataMapOfIntegerListOfXY & Other);
		%feature("autodoc", "Args:
	Other(BRepMesh_DataMapOfIntegerListOfXY)

Returns:
	BRepMesh_DataMapOfIntegerListOfXY

No detailed docstring for this function.") operator=;
		BRepMesh_DataMapOfIntegerListOfXY & operator = (const BRepMesh_DataMapOfIntegerListOfXY & Other);
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
	I(BRepMesh_ListOfXY)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (Standard_Integer &OutValue,const BRepMesh_ListOfXY & I);
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
	BRepMesh_ListOfXY

No detailed docstring for this function.") Find;
		const BRepMesh_ListOfXY & Find (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	BRepMesh_ListOfXY

No detailed docstring for this function.") ChangeFind;
		BRepMesh_ListOfXY & ChangeFind (Standard_Integer &OutValue);
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


%feature("shadow") BRepMesh_DataMapOfIntegerListOfXY::~BRepMesh_DataMapOfIntegerListOfXY %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_DataMapOfIntegerListOfXY {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepMesh_DataMapOfIntegerPnt;
class BRepMesh_DataMapOfIntegerPnt : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") BRepMesh_DataMapOfIntegerPnt;
		 BRepMesh_DataMapOfIntegerPnt (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(BRepMesh_DataMapOfIntegerPnt)

Returns:
	BRepMesh_DataMapOfIntegerPnt

No detailed docstring for this function.") Assign;
		BRepMesh_DataMapOfIntegerPnt & Assign (const BRepMesh_DataMapOfIntegerPnt & Other);
		%feature("autodoc", "Args:
	Other(BRepMesh_DataMapOfIntegerPnt)

Returns:
	BRepMesh_DataMapOfIntegerPnt

No detailed docstring for this function.") operator=;
		BRepMesh_DataMapOfIntegerPnt & operator = (const BRepMesh_DataMapOfIntegerPnt & Other);
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
	I(gp_Pnt)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (Standard_Integer &OutValue,const gp_Pnt & I);
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
	gp_Pnt

No detailed docstring for this function.") Find;
		const gp_Pnt & Find (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	gp_Pnt

No detailed docstring for this function.") ChangeFind;
		gp_Pnt & ChangeFind (Standard_Integer &OutValue);
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


%feature("shadow") BRepMesh_DataMapOfIntegerPnt::~BRepMesh_DataMapOfIntegerPnt %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_DataMapOfIntegerPnt {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepMesh_DataMapOfShapePairOfPolygon;
class BRepMesh_DataMapOfShapePairOfPolygon : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") BRepMesh_DataMapOfShapePairOfPolygon;
		 BRepMesh_DataMapOfShapePairOfPolygon (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(BRepMesh_DataMapOfShapePairOfPolygon)

Returns:
	BRepMesh_DataMapOfShapePairOfPolygon

No detailed docstring for this function.") Assign;
		BRepMesh_DataMapOfShapePairOfPolygon & Assign (const BRepMesh_DataMapOfShapePairOfPolygon & Other);
		%feature("autodoc", "Args:
	Other(BRepMesh_DataMapOfShapePairOfPolygon)

Returns:
	BRepMesh_DataMapOfShapePairOfPolygon

No detailed docstring for this function.") operator=;
		BRepMesh_DataMapOfShapePairOfPolygon & operator = (const BRepMesh_DataMapOfShapePairOfPolygon & Other);
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
	I(BRepMesh_PairOfPolygon)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const BRepMesh_PairOfPolygon & I);
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
	BRepMesh_PairOfPolygon

No detailed docstring for this function.") Find;
		const BRepMesh_PairOfPolygon & Find (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	BRepMesh_PairOfPolygon

No detailed docstring for this function.") ChangeFind;
		BRepMesh_PairOfPolygon & ChangeFind (const TopoDS_Shape & K);
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


%feature("shadow") BRepMesh_DataMapOfShapePairOfPolygon::~BRepMesh_DataMapOfShapePairOfPolygon %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_DataMapOfShapePairOfPolygon {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepMesh_DataMapOfShapeReal;
class BRepMesh_DataMapOfShapeReal : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") BRepMesh_DataMapOfShapeReal;
		 BRepMesh_DataMapOfShapeReal (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(BRepMesh_DataMapOfShapeReal)

Returns:
	BRepMesh_DataMapOfShapeReal

No detailed docstring for this function.") Assign;
		BRepMesh_DataMapOfShapeReal & Assign (const BRepMesh_DataMapOfShapeReal & Other);
		%feature("autodoc", "Args:
	Other(BRepMesh_DataMapOfShapeReal)

Returns:
	BRepMesh_DataMapOfShapeReal

No detailed docstring for this function.") operator=;
		BRepMesh_DataMapOfShapeReal & operator = (const BRepMesh_DataMapOfShapeReal & Other);
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
	I(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const Standard_Real & I);
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
	Standard_Real

No detailed docstring for this function.") Find;
		const Standard_Real & Find (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Real

No detailed docstring for this function.") ChangeFind;
		Standard_Real & ChangeFind (const TopoDS_Shape & K);
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


%feature("shadow") BRepMesh_DataMapOfShapeReal::~BRepMesh_DataMapOfShapeReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_DataMapOfShapeReal {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepMesh_DataMapOfVertexInteger;
class BRepMesh_DataMapOfVertexInteger : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") BRepMesh_DataMapOfVertexInteger;
		 BRepMesh_DataMapOfVertexInteger (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(BRepMesh_DataMapOfVertexInteger)

Returns:
	BRepMesh_DataMapOfVertexInteger

No detailed docstring for this function.") Assign;
		BRepMesh_DataMapOfVertexInteger & Assign (const BRepMesh_DataMapOfVertexInteger & Other);
		%feature("autodoc", "Args:
	Other(BRepMesh_DataMapOfVertexInteger)

Returns:
	BRepMesh_DataMapOfVertexInteger

No detailed docstring for this function.") operator=;
		BRepMesh_DataMapOfVertexInteger & operator = (const BRepMesh_DataMapOfVertexInteger & Other);
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
	K(TopoDS_Vertex)
	I(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const TopoDS_Vertex & K,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(TopoDS_Vertex)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (const TopoDS_Vertex & K);
		%feature("autodoc", "Args:
	K(TopoDS_Vertex)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (const TopoDS_Vertex & K);
		%feature("autodoc", "Args:
	K(TopoDS_Vertex)

Returns:
	Standard_Integer

No detailed docstring for this function.") Find;
		const Standard_Integer & Find (const TopoDS_Vertex & K);
		%feature("autodoc", "Args:
	K(TopoDS_Vertex)

Returns:
	Standard_Integer

No detailed docstring for this function.") ChangeFind;
		Standard_Integer & ChangeFind (const TopoDS_Vertex & K);
		%feature("autodoc", "Args:
	K(TopoDS_Vertex)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (const TopoDS_Vertex & K);
		%feature("autodoc", "Args:
	K(TopoDS_Vertex)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Vertex & K);
};


%feature("shadow") BRepMesh_DataMapOfVertexInteger::~BRepMesh_DataMapOfVertexInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_DataMapOfVertexInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepMesh_DataStructureOfDelaun;
class BRepMesh_DataStructureOfDelaun : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	theAllocator(BRepMesh_BaseAllocator)
	NodeNumber(Standard_Integer)=100

Returns:
	None

<NodeNumber>   is just  an   evaluation of the  
         presumed  number of nodes  in this mesh.   The  
         Mesh   data  structure will   be automatically  
         redimensioned if necessary.") BRepMesh_DataStructureOfDelaun;
		 BRepMesh_DataStructureOfDelaun (const BRepMesh_BaseAllocator & theAllocator,const Standard_Integer NodeNumber = 100);
		%feature("autodoc", "Args:
	theNode(BRepMesh_Vertex)

Returns:
	Standard_Integer

Adds a node to the  mesh  if  the node is  not  
         already in the Mesh.  Returns the index of the  
         node in the structure.") AddNode;
		Standard_Integer AddNode (const BRepMesh_Vertex & theNode);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	BRepMesh_Vertex

Get the value of node <Index>.") GetNode;
		const BRepMesh_Vertex & GetNode (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	BRepMesh_ListOfInteger

Get the list of node <Index>.") GetNodeList;
		const BRepMesh_ListOfInteger & GetNodeList (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

Removes the node of index <index> from the mesh.") ForceRemoveNode;
		void ForceRemoveNode (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

Removes the link of index <index> from the mesh.") ForceRemoveLink;
		void ForceRemoveLink (const Standard_Integer Index);
		%feature("autodoc", "Args:
	NewNodes(BRepMesh_VertexTool)

Returns:
	None

Removes the all nodes and sets new map of  
nodes from the mesh.  
For internal use only.") ReplaceNodes;
		void ReplaceNodes (const BRepMesh_VertexTool & NewNodes);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

Removes the node of index <index> from the mesh.") RemoveNode;
		void RemoveNode (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	newNode(BRepMesh_Vertex)

Returns:
	Standard_Boolean

Changes the UV  value of node of index <Index>  by  
         <newNode>. Returns false if <newnode> is already in  
         the structure.") MoveNode;
		Standard_Boolean MoveNode (const Standard_Integer Index,const BRepMesh_Vertex & newNode);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Gives the number of nodes in this mesh.") NbNodes;
		Standard_Integer NbNodes ();
		%feature("autodoc", "Args:
	theLink(BRepMesh_Edge)

Returns:
	Standard_Integer

Adds a Link  to the  mesh if  the Link is  not  
         already in the structure. Returns the index of  
         the link in the structure.") AddLink;
		Standard_Integer AddLink (const BRepMesh_Edge & theLink);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	BRepMesh_Edge

Get the value of Link <Index>.") GetLink;
		const BRepMesh_Edge & GetLink (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

Removes the Link of  index  <Index> from the  
         mesh.") RemoveLink;
		void RemoveLink (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	newLink(BRepMesh_Edge)

Returns:
	Standard_Boolean

Substitutes  the  Link  of  index  <Index>  by  
         <newLink> clear the connectivity.") SubstituteLink;
		Standard_Boolean SubstituteLink (const Standard_Integer Index,const BRepMesh_Edge & newLink);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Gives the number of elements in this mesh.") NbLinks;
		Standard_Integer NbLinks ();
		%feature("autodoc", "Args:
	theElement(BRepMesh_Triangle)

Returns:
	Standard_Integer

Adds an element  to  the mesh  if it    is not  
         already in the  Mesh. Returns the index of the  
         element in the structure.") AddElement;
		Standard_Integer AddElement (const BRepMesh_Triangle & theElement);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	BRepMesh_Triangle

Get the value of Element <Index>.") GetElement;
		const BRepMesh_Triangle & GetElement (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

Removes the element of index <Index> in the mesh.") RemoveElement;
		void RemoveElement (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	newElement(BRepMesh_Triangle)

Returns:
	Standard_Boolean

Substitutes  the  element   of  index  <Index>  by  
         <newElement>. The links connectivity is updated.") SubstituteElement;
		Standard_Boolean SubstituteElement (const Standard_Integer Index,const BRepMesh_Triangle & newElement);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Gives the number of elements in this mesh.") NbElements;
		Standard_Integer NbElements ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Removes all elements") ClearDomain;
		void ClearDomain ();
		%feature("autodoc", "Args:
	aNode(BRepMesh_Vertex)

Returns:
	Standard_Integer

Finds the index of the node.  Returns 0 if the  
         node is not in the mesh.") IndexOf;
		Standard_Integer IndexOf (const BRepMesh_Vertex & aNode);
		%feature("autodoc", "Args:
	aLink(BRepMesh_Edge)

Returns:
	Standard_Integer

Finds the index of the Link.  Returns 0 if the  
         Link is not in the mesh.") IndexOf;
		Standard_Integer IndexOf (const BRepMesh_Edge & aLink);
		%feature("autodoc", "Args:
	anElement(BRepMesh_Triangle)

Returns:
	Standard_Integer

Finds the index  of the Element.  Returns 0 if  
         the Element is not in the mesh.") IndexOf;
		Standard_Integer IndexOf (const BRepMesh_Triangle & anElement);
		%feature("autodoc", "Args:
	theNode(Standard_Integer)

Returns:
	BRepMesh_ListOfInteger

Gives the list of  Link's indices handling the  
         node <theNode>.") LinkNeighboursOf;
		const BRepMesh_ListOfInteger & LinkNeighboursOf (const Standard_Integer theNode);
		%feature("autodoc", "Args:
	theLink(Standard_Integer)

Returns:
	BRepMesh_PairOfIndex

Gives the element's indices conected  
         to <theLink>.") ElemConnectedTo;
		const BRepMesh_PairOfIndex & ElemConnectedTo (const Standard_Integer theLink);
		%feature("autodoc", "Args:
	None
Returns:
	BRepMesh_MapOfInteger

Gives  the  list  of element's indices") ElemOfDomain;
		const BRepMesh_MapOfInteger & ElemOfDomain ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepMesh_MapOfInteger

Gives  the  list  of link's indices") LinkOfDomain;
		const BRepMesh_MapOfInteger & LinkOfDomain ();
		%feature("autodoc", "Args:
	None
Returns:
	None

This method  substitute the deleted  items  by  
         the last in  Indexed Data  Maps  to  have only  
         non-deleted  elements, links  or  nodes in the  
         structure.") ClearDeleted;
		void ClearDeleted ();

        %feature("autodoc", "1");
        %extend{
            std::string StatisticsToString() {
            std::stringstream s;
            self->Statistics(s);
            return s.str();}
        };
        		%feature("autodoc", "Args:
	None
Returns:
	BRepMesh_BaseAllocator

No detailed docstring for this function.") Allocator;
		const BRepMesh_BaseAllocator & Allocator ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepMesh_VertexTool

Give the data structure for cell size and  
         tolerance initialization.") Data;
		BRepMesh_VertexTool & Data ();
};


%feature("shadow") BRepMesh_DataStructureOfDelaun::~BRepMesh_DataStructureOfDelaun %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_DataStructureOfDelaun {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepMesh_DataStructureOfDelaun {
	Handle_BRepMesh_DataStructureOfDelaun GetHandle() {
	return *(Handle_BRepMesh_DataStructureOfDelaun*) &$self;
	}
};

%nodefaultctor Handle_BRepMesh_DataStructureOfDelaun;
class Handle_BRepMesh_DataStructureOfDelaun : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_BRepMesh_DataStructureOfDelaun();
        Handle_BRepMesh_DataStructureOfDelaun(const Handle_BRepMesh_DataStructureOfDelaun &aHandle);
        Handle_BRepMesh_DataStructureOfDelaun(const BRepMesh_DataStructureOfDelaun *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepMesh_DataStructureOfDelaun DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepMesh_DataStructureOfDelaun {
    BRepMesh_DataStructureOfDelaun* GetObject() {
    return (BRepMesh_DataStructureOfDelaun*)$self->Access();
    }
};
%feature("shadow") Handle_BRepMesh_DataStructureOfDelaun::~Handle_BRepMesh_DataStructureOfDelaun %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepMesh_DataStructureOfDelaun {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepMesh_Delaun;
class BRepMesh_Delaun {
	public:
		%feature("autodoc", "Args:
	theVertices(BRepMesh_Array1OfVertexOfDelaun)
	isPositive(Standard_Boolean)=Standard_True

Returns:
	None

Creates the triangulation with an empty Mesh  
data structure.") BRepMesh_Delaun;
		 BRepMesh_Delaun (BRepMesh_Array1OfVertexOfDelaun & theVertices,const Standard_Boolean isPositive = Standard_True);
		%feature("autodoc", "Args:
	theOldMesh(Handle_BRepMesh_DataStructureOfDelaun)
	theVertices(BRepMesh_Array1OfVertexOfDelaun)
	isPositive(Standard_Boolean)=Standard_True

Returns:
	None

Creates the triangulation with and existent  
Mesh data structure.") BRepMesh_Delaun;
		 BRepMesh_Delaun (const Handle_BRepMesh_DataStructureOfDelaun & theOldMesh,BRepMesh_Array1OfVertexOfDelaun & theVertices,const Standard_Boolean isPositive = Standard_True);
		%feature("autodoc", "Args:
	theOldMesh(Handle_BRepMesh_DataStructureOfDelaun)
	theVertexIndices(TColStd_Array1OfInteger)
	isPositive(Standard_Boolean)=Standard_True

Returns:
	None

Creates the triangulation with and existant  
Mesh data structure.") BRepMesh_Delaun;
		 BRepMesh_Delaun (const Handle_BRepMesh_DataStructureOfDelaun & theOldMesh,TColStd_Array1OfInteger & theVertexIndices,const Standard_Boolean isPositive = Standard_True);
		%feature("autodoc", "Args:
	theVertices(BRepMesh_Array1OfVertexOfDelaun)

Returns:
	None

Initializes the triangulation with an array of  
vertices.") Init;
		void Init (BRepMesh_Array1OfVertexOfDelaun & theVertices);
		%feature("autodoc", "Args:
	theVertex(BRepMesh_Vertex)

Returns:
	None

Removes a vertex from the triangulation.") RemoveVertex;
		void RemoveVertex (const BRepMesh_Vertex & theVertex);
		%feature("autodoc", "Args:
	theVertices(BRepMesh_Array1OfVertexOfDelaun)

Returns:
	None

Adds some vertices into the triangulation.") AddVertices;
		void AddVertices (BRepMesh_Array1OfVertexOfDelaun & theVertices);
		%feature("autodoc", "Args:
	theEdge(Standard_Integer)

Returns:
	Standard_Boolean

Modify mesh to use the edge. Return True if done.") UseEdge;
		Standard_Boolean UseEdge (const Standard_Integer theEdge);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_BRepMesh_DataStructureOfDelaun

Gives the Mesh data structure.") Result;
		const Handle_BRepMesh_DataStructureOfDelaun & Result ();
		%feature("autodoc", "Args:
	None
Returns:
	inline Handle_BRepMesh_MapOfInteger

Gives the list of frontier edges") Frontier;
		inline Handle_BRepMesh_MapOfInteger Frontier ();
		%feature("autodoc", "Args:
	None
Returns:
	inline Handle_BRepMesh_MapOfInteger

Gives the list of internal edges") InternalEdges;
		inline Handle_BRepMesh_MapOfInteger InternalEdges ();
		%feature("autodoc", "Args:
	None
Returns:
	inline Handle_BRepMesh_MapOfInteger

Gives the list of free edges used only one time") FreeEdges;
		inline Handle_BRepMesh_MapOfInteger FreeEdges ();
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)

Returns:
	inline  BRepMesh_Vertex

Gives vertex with the given index") GetVertex;
		inline const BRepMesh_Vertex & GetVertex (const Standard_Integer theIndex);
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)

Returns:
	inline  BRepMesh_Edge

Gives edge with the given index") GetEdge;
		inline const BRepMesh_Edge & GetEdge (const Standard_Integer theIndex);
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)

Returns:
	inline  BRepMesh_Triangle

Gives triangle with the given index") GetTriangle;
		inline const BRepMesh_Triangle & GetTriangle (const Standard_Integer theIndex);
		%feature("autodoc", "Args:
	theTriangleId(Standard_Integer)
	theVertex(BRepMesh_Vertex)
	theEdgeOn(Standard_Integer)

Returns:
	Standard_Boolean

Test is the given triangle contains the given vertex.  
If <theEdgeOn> != 0 the vertex lies onto the edge index  
returned through this parameter.") Contains;
		Standard_Boolean Contains (const Standard_Integer theTriangleId,const BRepMesh_Vertex & theVertex,Standard_Integer &OutValue);
};


%feature("shadow") BRepMesh_Delaun::~BRepMesh_Delaun %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_Delaun {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepMesh_DiscretRoot;
class BRepMesh_DiscretRoot : public Standard_Transient {
	public:
		%feature("autodoc", "Args:
	theDeflection(Standard_Real)

Returns:
	None

Setup linear deflection.") SetDeflection;
		void SetDeflection (const Standard_Real theDeflection);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns linear deflection.") Deflection;
		Standard_Real Deflection ();
		%feature("autodoc", "Args:
	theAngle(Standard_Real)

Returns:
	None

Setup angular deflection.") SetAngle;
		void SetAngle (const Standard_Real theAngle);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns angular deflection.") Angle;
		Standard_Real Angle ();
		%feature("autodoc", "Args:
	theShape(TopoDS_Shape)

Returns:
	None

Set the shape to triangulate.") SetShape;
		void SetShape (const TopoDS_Shape & theShape);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Shape;
		const TopoDS_Shape & Shape ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Compute triangulation for set shape.") Perform;
		virtual void Perform ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if triangualtion was performed and has success.") IsDone;
		Standard_Boolean IsDone ();
};


%feature("shadow") BRepMesh_DiscretRoot::~BRepMesh_DiscretRoot %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_DiscretRoot {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepMesh_DiscretRoot {
	Handle_BRepMesh_DiscretRoot GetHandle() {
	return *(Handle_BRepMesh_DiscretRoot*) &$self;
	}
};

%nodefaultctor Handle_BRepMesh_DiscretRoot;
class Handle_BRepMesh_DiscretRoot : public Handle_Standard_Transient {

    public:
        // constructors
        Handle_BRepMesh_DiscretRoot();
        Handle_BRepMesh_DiscretRoot(const Handle_BRepMesh_DiscretRoot &aHandle);
        Handle_BRepMesh_DiscretRoot(const BRepMesh_DiscretRoot *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepMesh_DiscretRoot DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepMesh_DiscretRoot {
    BRepMesh_DiscretRoot* GetObject() {
    return (BRepMesh_DiscretRoot*)$self->Access();
    }
};
%feature("shadow") Handle_BRepMesh_DiscretRoot::~Handle_BRepMesh_DiscretRoot %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepMesh_DiscretRoot {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepMesh_Edge;
class BRepMesh_Edge {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepMesh_Edge;
		 BRepMesh_Edge ();
		%feature("autodoc", "Args:
	vDebut(Standard_Integer)
	vFin(Standard_Integer)
	canMove(BRepMesh_DegreeOfFreedom)

Returns:
	None

Contructs a link beetween to vertices.") BRepMesh_Edge;
		 BRepMesh_Edge (const Standard_Integer vDebut,const Standard_Integer vFin,const BRepMesh_DegreeOfFreedom canMove);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Give the index of first node of the Link.") FirstNode;
		Standard_Integer FirstNode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Give the index of Last node of the Link.") LastNode;
		Standard_Integer LastNode ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepMesh_DegreeOfFreedom

No detailed docstring for this function.") Movability;
		BRepMesh_DegreeOfFreedom Movability ();
		%feature("autodoc", "Args:
	Move(BRepMesh_DegreeOfFreedom)

Returns:
	None

No detailed docstring for this function.") SetMovability;
		void SetMovability (const BRepMesh_DegreeOfFreedom Move);
		%feature("autodoc", "Args:
	Upper(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") HashCode;
		Standard_Integer HashCode (const Standard_Integer Upper);

        %extend {
            Standard_Integer __hash__() {
            return $self->HashCode(2147483647);
            }
        };
        		%feature("autodoc", "Args:
	Other(BRepMesh_Edge)

Returns:
	Standard_Boolean

No detailed docstring for this function.") SameOrientation;
		Standard_Boolean SameOrientation (const BRepMesh_Edge & Other);
		%feature("autodoc", "Args:
	Other(BRepMesh_Edge)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEqual;
		Standard_Boolean IsEqual (const BRepMesh_Edge & Other);

        %extend{
            bool __eq_wrapper__(const BRepMesh_Edge  other) {
            if (*self==other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __eq__(self,right):
            try:
                return self.__eq_wrapper__(right)
            except:
                return False
        }
        };


%feature("shadow") BRepMesh_Edge::~BRepMesh_Edge %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_Edge {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepMesh_ElemHasherOfDataStructureOfDelaun;
class BRepMesh_ElemHasherOfDataStructureOfDelaun {
	public:
		%feature("autodoc", "Args:
	K(BRepMesh_Triangle)
	Upper(Standard_Integer)

Returns:
	static Standard_Integer

No detailed docstring for this function.") HashCode;
		static Standard_Integer HashCode (const BRepMesh_Triangle & K,const Standard_Integer Upper);
		%feature("autodoc", "Args:
	K1(BRepMesh_Triangle)
	K2(BRepMesh_Triangle)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsEqual;
		static Standard_Boolean IsEqual (const BRepMesh_Triangle & K1,const BRepMesh_Triangle & K2);
};


%feature("shadow") BRepMesh_ElemHasherOfDataStructureOfDelaun::~BRepMesh_ElemHasherOfDataStructureOfDelaun %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_ElemHasherOfDataStructureOfDelaun {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepMesh_FaceAttribute;
class BRepMesh_FaceAttribute : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepMesh_FaceAttribute;
		 BRepMesh_FaceAttribute ();

            %feature("autodoc","1");
            %extend {
                Standard_Real GetGetDefFace() {
                return (Standard_Real) $self->GetDefFace();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetGetDefFace(Standard_Real value ) {
                $self->GetDefFace()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Real GetGetUMin() {
                return (Standard_Real) $self->GetUMin();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetGetUMin(Standard_Real value ) {
                $self->GetUMin()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Real GetGetVMin() {
                return (Standard_Real) $self->GetVMin();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetGetVMin(Standard_Real value ) {
                $self->GetVMin()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Real GetGetUMax() {
                return (Standard_Real) $self->GetUMax();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetGetUMax(Standard_Real value ) {
                $self->GetUMax()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Real GetGetVMax() {
                return (Standard_Real) $self->GetVMax();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetGetVMax(Standard_Real value ) {
                $self->GetVMax()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Real GetGetDeltaX() {
                return (Standard_Real) $self->GetDeltaX();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetGetDeltaX(Standard_Real value ) {
                $self->GetDeltaX()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Real GetGetDeltaY() {
                return (Standard_Real) $self->GetDeltaY();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetGetDeltaY(Standard_Real value ) {
                $self->GetDeltaY()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Real GetGetMinX() {
                return (Standard_Real) $self->GetMinX();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetGetMinX(Standard_Real value ) {
                $self->GetMinX()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Real GetGetMinY() {
                return (Standard_Real) $self->GetMinY();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetGetMinY(Standard_Real value ) {
                $self->GetMinY()=value;
                }
            };
            		%feature("autodoc", "Args:
	None
Returns:
	BRepMesh_ClassifierPtr

No detailed docstring for this function.") GetClassifier;
		BRepMesh_ClassifierPtr & GetClassifier ();
};


%feature("shadow") BRepMesh_FaceAttribute::~BRepMesh_FaceAttribute %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_FaceAttribute {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepMesh_FaceAttribute {
	Handle_BRepMesh_FaceAttribute GetHandle() {
	return *(Handle_BRepMesh_FaceAttribute*) &$self;
	}
};

%nodefaultctor Handle_BRepMesh_FaceAttribute;
class Handle_BRepMesh_FaceAttribute : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_BRepMesh_FaceAttribute();
        Handle_BRepMesh_FaceAttribute(const Handle_BRepMesh_FaceAttribute &aHandle);
        Handle_BRepMesh_FaceAttribute(const BRepMesh_FaceAttribute *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepMesh_FaceAttribute DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepMesh_FaceAttribute {
    BRepMesh_FaceAttribute* GetObject() {
    return (BRepMesh_FaceAttribute*)$self->Access();
    }
};
%feature("shadow") Handle_BRepMesh_FaceAttribute::~Handle_BRepMesh_FaceAttribute %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepMesh_FaceAttribute {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepMesh_FastDiscret;
class BRepMesh_FastDiscret : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	defle(Standard_Real)
	angle(Standard_Real)
	B(Bnd_Box)
	withShare(Standard_Boolean)=Standard_True
	inshape(Standard_Boolean)=Standard_False
	relative(Standard_Boolean)=Standard_False
	shapetrigu(Standard_Boolean)=Standard_False

Returns:
	None

No detailed docstring for this function.") BRepMesh_FastDiscret;
		 BRepMesh_FastDiscret (const Standard_Real defle,const Standard_Real angle,const Bnd_Box & B,const Standard_Boolean withShare = Standard_True,const Standard_Boolean inshape = Standard_False,const Standard_Boolean relative = Standard_False,const Standard_Boolean shapetrigu = Standard_False);
		%feature("autodoc", "Args:
	defle(Standard_Real)
	shape(TopoDS_Shape)
	B(Bnd_Box)
	angle(Standard_Real)
	withShare(Standard_Boolean)=Standard_True
	inshape(Standard_Boolean)=Standard_False
	relative(Standard_Boolean)=Standard_False
	shapetrigu(Standard_Boolean)=Standard_False

Returns:
	None

if the  boolean    <relative>   is  True,    the  
         deflection used   for the polygonalisation   of  
         each edge will be <defle> * Size of Edge.  
         the deflection used for the faces will be the maximum  
         deflection of their edges.  
 
         if <shapetrigu> is True, the triangulation, if exists  
         with a correct deflection, can be used to re-triangulate  
         the shape.  
 
         if   <inshape>   is   True, the      calculated  
         triangulation will be stored in the shape.") BRepMesh_FastDiscret;
		 BRepMesh_FastDiscret (const Standard_Real defle,const TopoDS_Shape & shape,const Bnd_Box & B,const Standard_Real angle,const Standard_Boolean withShare = Standard_True,const Standard_Boolean inshape = Standard_False,const Standard_Boolean relative = Standard_False,const Standard_Boolean shapetrigu = Standard_False);
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)

Returns:
	None

Build triangulation on the whole shape") Perform;
		void Perform (const TopoDS_Shape & shape);
		%feature("autodoc", "Args:
	face(TopoDS_Face)
	ancestor(TopTools_IndexedDataMapOfShapeListOfShape)

Returns:
	None

Record a face for further processing.") Add;
		void Add (const TopoDS_Face & face,const TopTools_IndexedDataMapOfShapeListOfShape & ancestor);
		%feature("autodoc", "Args:
	face(TopoDS_Face)

Returns:
	None

Triangulate a face previously recorded for  
         processing by call to Add(). Can be executed in  
         parallel threads.") Process;
		void Process (const TopoDS_Face & face);
		%feature("autodoc", "Args:
	None
Returns:
	BRepMesh_Status

No detailed docstring for this function.") CurrentFaceStatus;
		BRepMesh_Status CurrentFaceStatus ();
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)
	defle(Standard_Real)
	dtotale(Standard_Real)
	cdef(Standard_Real)

Returns:
	static Standard_Real

Returns computed relative deflection for edge") RelativeEdgeDeflection;
		static Standard_Real RelativeEdgeDeflection (const TopoDS_Edge & edge,const Standard_Real defle,const Standard_Real dtotale,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	box(Bnd_Box)
	maxdim(Standard_Real)

Returns:
	static void

Returns the maximal dimension of Bnd_Box") BoxMaxDimension;
		static void BoxMaxDimension (const Bnd_Box & box,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	theInParallel(Standard_Boolean)

Returns:
	None

Request algorithm to launch in multiple threads  
to improve performance (should be supported by plugin).") SetParallel;
		void SetParallel (const Standard_Boolean theInParallel);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the multi-threading usage flag.") IsParallel;
		Standard_Boolean IsParallel ();
		%feature("autodoc", "Args:
	theShape(TopoDS_Shape)
	theType(TopAbs_ShapeEnum)

Returns:
	None

Creates mutexes for each sub-shape of type theType in theShape.  
Used to avoid data races.") CreateMutexesForSubShapes;
		void CreateMutexesForSubShapes (const TopoDS_Shape & theShape,const TopAbs_ShapeEnum theType);
		%feature("autodoc", "Args:
	None
Returns:
	None

Removes all created mutexes") RemoveAllMutexes;
		void RemoveAllMutexes ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Gives the number of built triangles.") NbTriangles;
		Standard_Integer NbTriangles ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	BRepMesh_Triangle

Gives the triangle of <Index>.") Triangle;
		const BRepMesh_Triangle & Triangle (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Gives the number of built Edges") NbEdges;
		Standard_Integer NbEdges ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	BRepMesh_Edge

Gives the edge of index <Index>.") Edge;
		const BRepMesh_Edge & Edge (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Gives the number of built Vertices.") NbVertices;
		Standard_Integer NbVertices ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	BRepMesh_Vertex

Gives the vertex of <Index>.") Vertex;
		const BRepMesh_Vertex & Vertex (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	gp_Pnt

Gives the location3d of the vertex of <Index>.") Pnt;
		const gp_Pnt & Pnt (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Indices(BRepMesh_MapOfInteger)

Returns:
	None

Gives the list of indices of the vertices") VerticesOfDomain;
		void VerticesOfDomain (BRepMesh_MapOfInteger & Indices);
		%feature("autodoc", "Args:
	Indices(BRepMesh_MapOfInteger)

Returns:
	None

Gives the list of indices of the edges") EdgesOfDomain;
		void EdgesOfDomain (BRepMesh_MapOfInteger & Indices);
		%feature("autodoc", "Args:
	Indices(BRepMesh_MapOfInteger)

Returns:
	None

Gives the list of indices of the triangles") TrianglesOfDomain;
		void TrianglesOfDomain (BRepMesh_MapOfInteger & Indices);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Gives the  number of different  location in 3d  
         space.  It  is  different    of the number  of  
         vertices if there is more than one surface.  
         Even for one surface, the number can be different  
         if an edge is shared.") NbPoint3d;
		Standard_Integer NbPoint3d ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	gp_Pnt

Gives the 3d space location of the vertex <Index>.") Point3d;
		const gp_Pnt & Point3d (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

returns the deflection value.") GetDeflection;
		Standard_Real GetDeflection ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

returns the deflection value.") GetAngle;
		Standard_Real GetAngle ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") WithShare;
		Standard_Boolean WithShare ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") InShape;
		Standard_Boolean InShape ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") ShapeTrigu;
		Standard_Boolean ShapeTrigu ();
		%feature("autodoc", "Args:
	face(TopoDS_Face)
	fattrib(Handle_BRepMesh_FaceAttribute)

Returns:
	Standard_Boolean

returns the face deflection value.") GetFaceAttribute;
		Standard_Boolean GetFaceAttribute (const TopoDS_Face & face,Handle_BRepMesh_FaceAttribute & fattrib);
		%feature("autodoc", "Args:
	face(TopoDS_Face)

Returns:
	None

remove face attribute as useless to free locate memory") RemoveFaceAttribute;
		void RemoveFaceAttribute (const TopoDS_Face & face);
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_DataMapOfShapeReal

No detailed docstring for this function.") GetMapOfDefEdge;
		const TopTools_DataMapOfShapeReal & GetMapOfDefEdge ();
};


%feature("shadow") BRepMesh_FastDiscret::~BRepMesh_FastDiscret %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_FastDiscret {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepMesh_FastDiscret {
	Handle_BRepMesh_FastDiscret GetHandle() {
	return *(Handle_BRepMesh_FastDiscret*) &$self;
	}
};

%nodefaultctor Handle_BRepMesh_FastDiscret;
class Handle_BRepMesh_FastDiscret : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_BRepMesh_FastDiscret();
        Handle_BRepMesh_FastDiscret(const Handle_BRepMesh_FastDiscret &aHandle);
        Handle_BRepMesh_FastDiscret(const BRepMesh_FastDiscret *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepMesh_FastDiscret DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepMesh_FastDiscret {
    BRepMesh_FastDiscret* GetObject() {
    return (BRepMesh_FastDiscret*)$self->Access();
    }
};
%feature("shadow") Handle_BRepMesh_FastDiscret::~Handle_BRepMesh_FastDiscret %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepMesh_FastDiscret {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepMesh_FastDiscretFace;
class BRepMesh_FastDiscretFace : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	theAngle(Standard_Real)
	theWithShare(Standard_Boolean)=Standard_True

Returns:
	None

No detailed docstring for this function.") BRepMesh_FastDiscretFace;
		 BRepMesh_FastDiscretFace (const Standard_Real theAngle,const Standard_Boolean theWithShare = Standard_True);
		%feature("autodoc", "Args:
	theFace(TopoDS_Face)
	theAttrib(Handle_BRepMesh_FaceAttribute)
	theMapDefle(TopTools_DataMapOfShapeReal)
	theMutexProvider(TopTools_MutexForShapeProvider)

Returns:
	None

No detailed docstring for this function.") Add;
		void Add (const TopoDS_Face & theFace,const Handle_BRepMesh_FaceAttribute & theAttrib,const TopTools_DataMapOfShapeReal & theMapDefle,const TopTools_MutexForShapeProvider & theMutexProvider);
		%feature("autodoc", "Args:
	theCaro(Handle_BRepAdaptor_HSurface)
	theDefFace(Standard_Real)
	theInternalV(BRepMesh_ListOfVertex)
	theBadTriangles(TColStd_ListOfInteger)
	theNulTriangles(TColStd_ListOfInteger)
	theTrigu(BRepMesh_Delaun)
	theIsFirst(Standard_Boolean)

Returns:
	Standard_Real

No detailed docstring for this function.") Control;
		Standard_Real Control (const Handle_BRepAdaptor_HSurface & theCaro,const Standard_Real theDefFace,BRepMesh_ListOfVertex & theInternalV,TColStd_ListOfInteger & theBadTriangles,TColStd_ListOfInteger & theNulTriangles,BRepMesh_Delaun & theTrigu,const Standard_Boolean theIsFirst);
		%feature("autodoc", "Args:
	theV(TopoDS_Vertex)
	theXY(gp_Pnt2d)
	theIp(Standard_Integer)
	theSFace(Handle_BRepAdaptor_HSurface)
	theMinDist(Standard_Real)
	theFaceAttribute(Handle_BRepMesh_FaceAttribute)
	theLocation2dMap(BRepMesh_DataMapOfIntegerListOfXY)

Returns:
	static gp_XY

No detailed docstring for this function.") FindUV;
		static gp_XY FindUV (const TopoDS_Vertex & theV,const gp_Pnt2d & theXY,const Standard_Integer theIp,const Handle_BRepAdaptor_HSurface & theSFace,const Standard_Real theMinDist,const Handle_BRepMesh_FaceAttribute & theFaceAttribute,BRepMesh_DataMapOfIntegerListOfXY & theLocation2dMap);
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)

Returns:
	BRepMesh_Triangle

Gives the triangle of <Index>.") Triangle;
		const BRepMesh_Triangle & Triangle (const Standard_Integer theIndex);
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)

Returns:
	BRepMesh_Edge

Gives the edge of index <Index>.") Edge;
		const BRepMesh_Edge & Edge (const Standard_Integer theIndex);
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)

Returns:
	BRepMesh_Vertex

Gives the vertex of <Index>.") Vertex;
		const BRepMesh_Vertex & Vertex (const Standard_Integer theIndex);
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)

Returns:
	gp_Pnt

Gives the location3d of the vertex of <Index>.") Pnt;
		const gp_Pnt & Pnt (const Standard_Integer theIndex);
};


%feature("shadow") BRepMesh_FastDiscretFace::~BRepMesh_FastDiscretFace %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_FastDiscretFace {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepMesh_FastDiscretFace {
	Handle_BRepMesh_FastDiscretFace GetHandle() {
	return *(Handle_BRepMesh_FastDiscretFace*) &$self;
	}
};

%nodefaultctor Handle_BRepMesh_FastDiscretFace;
class Handle_BRepMesh_FastDiscretFace : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_BRepMesh_FastDiscretFace();
        Handle_BRepMesh_FastDiscretFace(const Handle_BRepMesh_FastDiscretFace &aHandle);
        Handle_BRepMesh_FastDiscretFace(const BRepMesh_FastDiscretFace *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepMesh_FastDiscretFace DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepMesh_FastDiscretFace {
    BRepMesh_FastDiscretFace* GetObject() {
    return (BRepMesh_FastDiscretFace*)$self->Access();
    }
};
%feature("shadow") Handle_BRepMesh_FastDiscretFace::~Handle_BRepMesh_FastDiscretFace %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepMesh_FastDiscretFace {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepMesh_GeomTool;
class BRepMesh_GeomTool {
	public:
		%feature("autodoc", "Args:
	C(BRepAdaptor_Curve)
	Ufirst(Standard_Real)
	Ulast(Standard_Real)
	AngDefl(Standard_Real)
	Deflection(Standard_Real)
	nbpointsmin(Standard_Integer)=2

Returns:
	None

No detailed docstring for this function.") BRepMesh_GeomTool;
		 BRepMesh_GeomTool (BRepAdaptor_Curve & C,const Standard_Real Ufirst,const Standard_Real Ulast,const Standard_Real AngDefl,const Standard_Real Deflection,const Standard_Integer nbpointsmin = 2);
		%feature("autodoc", "Args:
	S(Handle_BRepAdaptor_HSurface)
	ParamIso(Standard_Real)
	Type(GeomAbs_IsoType)
	Ufirst(Standard_Real)
	Ulast(Standard_Real)
	AngDefl(Standard_Real)
	Deflection(Standard_Real)
	nbpointsmin(Standard_Integer)=2

Returns:
	None

No detailed docstring for this function.") BRepMesh_GeomTool;
		 BRepMesh_GeomTool (const Handle_BRepAdaptor_HSurface & S,const Standard_Real ParamIso,const GeomAbs_IsoType Type,const Standard_Real Ufirst,const Standard_Real Ulast,const Standard_Real AngDefl,const Standard_Real Deflection,const Standard_Integer nbpointsmin = 2);
		%feature("autodoc", "Args:
	thePnt(gp_Pnt)
	theParam(Standard_Real)
	theIsReplace(Standard_Boolean)=Standard_True

Returns:
	Standard_Integer

Add point to already calculated points (or replace existing)  
         Returns index of new added point  
          or founded with parametric tolerance (replaced if theIsReplace is true)") AddPoint;
		Standard_Integer AddPoint (const gp_Pnt & thePnt,const Standard_Real theParam,const Standard_Boolean theIsReplace = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbPoints;
		Standard_Integer NbPoints ();
		%feature("autodoc", "Args:
	IsoParam(Standard_Real)
	Index(Standard_Integer)
	W(Standard_Real)
	P(gp_Pnt)
	UV(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") Value;
		void Value (const Standard_Real IsoParam,const Standard_Integer Index,Standard_Real &OutValue,gp_Pnt & P,gp_Pnt2d & UV);
		%feature("autodoc", "Args:
	C(BRepAdaptor_Curve)
	S(Handle_BRepAdaptor_HSurface)
	Index(Standard_Integer)
	W(Standard_Real)
	P(gp_Pnt)
	UV(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") Value;
		void Value (const BRepAdaptor_Curve & C,const Handle_BRepAdaptor_HSurface & S,const Standard_Integer Index,Standard_Real &OutValue,gp_Pnt & P,gp_Pnt2d & UV);
		%feature("autodoc", "Args:
	F(Handle_BRepAdaptor_HSurface)
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)

Returns:
	static void

No detailed docstring for this function.") D0;
		static void D0 (const Handle_BRepAdaptor_HSurface & F,const Standard_Real U,const Standard_Real V,gp_Pnt & P);
		%feature("autodoc", "Args:
	F(Handle_BRepAdaptor_HSurface)
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	Nor(gp_Dir)

Returns:
	static Standard_Boolean

return false if the normal can not be computed") Normal;
		static Standard_Boolean Normal (const Handle_BRepAdaptor_HSurface & F,const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Dir & Nor);
};


%feature("shadow") BRepMesh_GeomTool::~BRepMesh_GeomTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_GeomTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepMesh_HArray1OfVertexOfDelaun;
class BRepMesh_HArray1OfVertexOfDelaun : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") BRepMesh_HArray1OfVertexOfDelaun;
		 BRepMesh_HArray1OfVertexOfDelaun (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)
	V(BRepMesh_Vertex)

Returns:
	None

No detailed docstring for this function.") BRepMesh_HArray1OfVertexOfDelaun;
		 BRepMesh_HArray1OfVertexOfDelaun (const Standard_Integer Low,const Standard_Integer Up,const BRepMesh_Vertex & V);
		%feature("autodoc", "Args:
	V(BRepMesh_Vertex)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const BRepMesh_Vertex & V);
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
	Value(BRepMesh_Vertex)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const BRepMesh_Vertex & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	BRepMesh_Vertex

No detailed docstring for this function.") Value;
		const BRepMesh_Vertex & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	BRepMesh_Vertex

No detailed docstring for this function.") ChangeValue;
		BRepMesh_Vertex & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	BRepMesh_Array1OfVertexOfDelaun

No detailed docstring for this function.") Array1;
		const BRepMesh_Array1OfVertexOfDelaun & Array1 ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepMesh_Array1OfVertexOfDelaun

No detailed docstring for this function.") ChangeArray1;
		BRepMesh_Array1OfVertexOfDelaun & ChangeArray1 ();
};


%feature("shadow") BRepMesh_HArray1OfVertexOfDelaun::~BRepMesh_HArray1OfVertexOfDelaun %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_HArray1OfVertexOfDelaun {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepMesh_HArray1OfVertexOfDelaun {
	Handle_BRepMesh_HArray1OfVertexOfDelaun GetHandle() {
	return *(Handle_BRepMesh_HArray1OfVertexOfDelaun*) &$self;
	}
};

%nodefaultctor Handle_BRepMesh_HArray1OfVertexOfDelaun;
class Handle_BRepMesh_HArray1OfVertexOfDelaun : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_BRepMesh_HArray1OfVertexOfDelaun();
        Handle_BRepMesh_HArray1OfVertexOfDelaun(const Handle_BRepMesh_HArray1OfVertexOfDelaun &aHandle);
        Handle_BRepMesh_HArray1OfVertexOfDelaun(const BRepMesh_HArray1OfVertexOfDelaun *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepMesh_HArray1OfVertexOfDelaun DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepMesh_HArray1OfVertexOfDelaun {
    BRepMesh_HArray1OfVertexOfDelaun* GetObject() {
    return (BRepMesh_HArray1OfVertexOfDelaun*)$self->Access();
    }
};
%feature("shadow") Handle_BRepMesh_HArray1OfVertexOfDelaun::~Handle_BRepMesh_HArray1OfVertexOfDelaun %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepMesh_HArray1OfVertexOfDelaun {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepMesh_HeapSortIndexedVertexOfDelaun;
class BRepMesh_HeapSortIndexedVertexOfDelaun {
	public:
		%feature("autodoc", "Args:
	TheArray(TColStd_Array1OfInteger)
	Comp(BRepMesh_ComparatorOfIndexedVertexOfDelaun)

Returns:
	static void

No detailed docstring for this function.") Sort;
		static void Sort (TColStd_Array1OfInteger & TheArray,const BRepMesh_ComparatorOfIndexedVertexOfDelaun & Comp);
};


%feature("shadow") BRepMesh_HeapSortIndexedVertexOfDelaun::~BRepMesh_HeapSortIndexedVertexOfDelaun %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_HeapSortIndexedVertexOfDelaun {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepMesh_HeapSortVertexOfDelaun;
class BRepMesh_HeapSortVertexOfDelaun {
	public:
		%feature("autodoc", "Args:
	TheArray(BRepMesh_Array1OfVertexOfDelaun)
	Comp(BRepMesh_ComparatorOfVertexOfDelaun)

Returns:
	static void

No detailed docstring for this function.") Sort;
		static void Sort (BRepMesh_Array1OfVertexOfDelaun & TheArray,const BRepMesh_ComparatorOfVertexOfDelaun & Comp);
};


%feature("shadow") BRepMesh_HeapSortVertexOfDelaun::~BRepMesh_HeapSortVertexOfDelaun %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_HeapSortVertexOfDelaun {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepMesh_IDMapOfLinkOfDataStructureOfDelaun;
class BRepMesh_IDMapOfLinkOfDataStructureOfDelaun : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") BRepMesh_IDMapOfLinkOfDataStructureOfDelaun;
		 BRepMesh_IDMapOfLinkOfDataStructureOfDelaun (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(BRepMesh_IDMapOfLinkOfDataStructureOfDelaun)

Returns:
	BRepMesh_IDMapOfLinkOfDataStructureOfDelaun

No detailed docstring for this function.") Assign;
		BRepMesh_IDMapOfLinkOfDataStructureOfDelaun & Assign (const BRepMesh_IDMapOfLinkOfDataStructureOfDelaun & Other);
		%feature("autodoc", "Args:
	Other(BRepMesh_IDMapOfLinkOfDataStructureOfDelaun)

Returns:
	BRepMesh_IDMapOfLinkOfDataStructureOfDelaun

No detailed docstring for this function.") operator=;
		BRepMesh_IDMapOfLinkOfDataStructureOfDelaun & operator = (const BRepMesh_IDMapOfLinkOfDataStructureOfDelaun & Other);
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
	K(BRepMesh_Edge)
	I(BRepMesh_PairOfIndex)

Returns:
	Standard_Integer

No detailed docstring for this function.") Add;
		Standard_Integer Add (const BRepMesh_Edge & K,const BRepMesh_PairOfIndex & I);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	K(BRepMesh_Edge)
	T(BRepMesh_PairOfIndex)

Returns:
	None

No detailed docstring for this function.") Substitute;
		void Substitute (const Standard_Integer I,const BRepMesh_Edge & K,const BRepMesh_PairOfIndex & T);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveLast;
		void RemoveLast ();
		%feature("autodoc", "Args:
	K(BRepMesh_Edge)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Contains;
		Standard_Boolean Contains (const BRepMesh_Edge & K);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	BRepMesh_Edge

No detailed docstring for this function.") FindKey;
		const BRepMesh_Edge & FindKey (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	BRepMesh_PairOfIndex

No detailed docstring for this function.") FindFromIndex;
		const BRepMesh_PairOfIndex & FindFromIndex (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	BRepMesh_PairOfIndex

No detailed docstring for this function.") ChangeFromIndex;
		BRepMesh_PairOfIndex & ChangeFromIndex (const Standard_Integer I);
		%feature("autodoc", "Args:
	K(BRepMesh_Edge)

Returns:
	Standard_Integer

No detailed docstring for this function.") FindIndex;
		Standard_Integer FindIndex (const BRepMesh_Edge & K);
		%feature("autodoc", "Args:
	K(BRepMesh_Edge)

Returns:
	BRepMesh_PairOfIndex

No detailed docstring for this function.") FindFromKey;
		const BRepMesh_PairOfIndex & FindFromKey (const BRepMesh_Edge & K);
		%feature("autodoc", "Args:
	K(BRepMesh_Edge)

Returns:
	BRepMesh_PairOfIndex

No detailed docstring for this function.") ChangeFromKey;
		BRepMesh_PairOfIndex & ChangeFromKey (const BRepMesh_Edge & K);
		%feature("autodoc", "Args:
	K(BRepMesh_Edge)

Returns:
	Standard_Address

No detailed docstring for this function.") FindFromKey1;
		Standard_Address FindFromKey1 (const BRepMesh_Edge & K);
		%feature("autodoc", "Args:
	K(BRepMesh_Edge)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFromKey1;
		Standard_Address ChangeFromKey1 (const BRepMesh_Edge & K);
};


%feature("shadow") BRepMesh_IDMapOfLinkOfDataStructureOfDelaun::~BRepMesh_IDMapOfLinkOfDataStructureOfDelaun %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_IDMapOfLinkOfDataStructureOfDelaun {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepMesh_IDMapOfNodeOfDataStructureOfDelaun;
class BRepMesh_IDMapOfNodeOfDataStructureOfDelaun : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") BRepMesh_IDMapOfNodeOfDataStructureOfDelaun;
		 BRepMesh_IDMapOfNodeOfDataStructureOfDelaun (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(BRepMesh_IDMapOfNodeOfDataStructureOfDelaun)

Returns:
	BRepMesh_IDMapOfNodeOfDataStructureOfDelaun

No detailed docstring for this function.") Assign;
		BRepMesh_IDMapOfNodeOfDataStructureOfDelaun & Assign (const BRepMesh_IDMapOfNodeOfDataStructureOfDelaun & Other);
		%feature("autodoc", "Args:
	Other(BRepMesh_IDMapOfNodeOfDataStructureOfDelaun)

Returns:
	BRepMesh_IDMapOfNodeOfDataStructureOfDelaun

No detailed docstring for this function.") operator=;
		BRepMesh_IDMapOfNodeOfDataStructureOfDelaun & operator = (const BRepMesh_IDMapOfNodeOfDataStructureOfDelaun & Other);
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
	K(BRepMesh_Vertex)
	I(BRepMesh_ListOfInteger)

Returns:
	Standard_Integer

No detailed docstring for this function.") Add;
		Standard_Integer Add (const BRepMesh_Vertex & K,const BRepMesh_ListOfInteger & I);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	K(BRepMesh_Vertex)
	T(BRepMesh_ListOfInteger)

Returns:
	None

No detailed docstring for this function.") Substitute;
		void Substitute (const Standard_Integer I,const BRepMesh_Vertex & K,const BRepMesh_ListOfInteger & T);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveLast;
		void RemoveLast ();
		%feature("autodoc", "Args:
	K(BRepMesh_Vertex)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Contains;
		Standard_Boolean Contains (const BRepMesh_Vertex & K);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	BRepMesh_Vertex

No detailed docstring for this function.") FindKey;
		const BRepMesh_Vertex & FindKey (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	BRepMesh_ListOfInteger

No detailed docstring for this function.") FindFromIndex;
		const BRepMesh_ListOfInteger & FindFromIndex (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	BRepMesh_ListOfInteger

No detailed docstring for this function.") ChangeFromIndex;
		BRepMesh_ListOfInteger & ChangeFromIndex (const Standard_Integer I);
		%feature("autodoc", "Args:
	K(BRepMesh_Vertex)

Returns:
	Standard_Integer

No detailed docstring for this function.") FindIndex;
		Standard_Integer FindIndex (const BRepMesh_Vertex & K);
		%feature("autodoc", "Args:
	K(BRepMesh_Vertex)

Returns:
	BRepMesh_ListOfInteger

No detailed docstring for this function.") FindFromKey;
		const BRepMesh_ListOfInteger & FindFromKey (const BRepMesh_Vertex & K);
		%feature("autodoc", "Args:
	K(BRepMesh_Vertex)

Returns:
	BRepMesh_ListOfInteger

No detailed docstring for this function.") ChangeFromKey;
		BRepMesh_ListOfInteger & ChangeFromKey (const BRepMesh_Vertex & K);
		%feature("autodoc", "Args:
	K(BRepMesh_Vertex)

Returns:
	Standard_Address

No detailed docstring for this function.") FindFromKey1;
		Standard_Address FindFromKey1 (const BRepMesh_Vertex & K);
		%feature("autodoc", "Args:
	K(BRepMesh_Vertex)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFromKey1;
		Standard_Address ChangeFromKey1 (const BRepMesh_Vertex & K);
};


%feature("shadow") BRepMesh_IDMapOfNodeOfDataStructureOfDelaun::~BRepMesh_IDMapOfNodeOfDataStructureOfDelaun %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_IDMapOfNodeOfDataStructureOfDelaun {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepMesh_IMapOfElementOfDataStructureOfDelaun;
class BRepMesh_IMapOfElementOfDataStructureOfDelaun : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") BRepMesh_IMapOfElementOfDataStructureOfDelaun;
		 BRepMesh_IMapOfElementOfDataStructureOfDelaun (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(BRepMesh_IMapOfElementOfDataStructureOfDelaun)

Returns:
	BRepMesh_IMapOfElementOfDataStructureOfDelaun

No detailed docstring for this function.") Assign;
		BRepMesh_IMapOfElementOfDataStructureOfDelaun & Assign (const BRepMesh_IMapOfElementOfDataStructureOfDelaun & Other);
		%feature("autodoc", "Args:
	Other(BRepMesh_IMapOfElementOfDataStructureOfDelaun)

Returns:
	BRepMesh_IMapOfElementOfDataStructureOfDelaun

No detailed docstring for this function.") operator=;
		BRepMesh_IMapOfElementOfDataStructureOfDelaun & operator = (const BRepMesh_IMapOfElementOfDataStructureOfDelaun & Other);
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
	K(BRepMesh_Triangle)

Returns:
	Standard_Integer

No detailed docstring for this function.") Add;
		Standard_Integer Add (const BRepMesh_Triangle & K);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	K(BRepMesh_Triangle)

Returns:
	None

No detailed docstring for this function.") Substitute;
		void Substitute (const Standard_Integer I,const BRepMesh_Triangle & K);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveLast;
		void RemoveLast ();
		%feature("autodoc", "Args:
	K(BRepMesh_Triangle)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Contains;
		Standard_Boolean Contains (const BRepMesh_Triangle & K);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	BRepMesh_Triangle

No detailed docstring for this function.") FindKey;
		const BRepMesh_Triangle & FindKey (const Standard_Integer I);
		%feature("autodoc", "Args:
	K(BRepMesh_Triangle)

Returns:
	Standard_Integer

No detailed docstring for this function.") FindIndex;
		Standard_Integer FindIndex (const BRepMesh_Triangle & K);
};


%feature("shadow") BRepMesh_IMapOfElementOfDataStructureOfDelaun::~BRepMesh_IMapOfElementOfDataStructureOfDelaun %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_IMapOfElementOfDataStructureOfDelaun {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepMesh_IndexedDataMapNodeOfIDMapOfLinkOfDataStructureOfDelaun;
class BRepMesh_IndexedDataMapNodeOfIDMapOfLinkOfDataStructureOfDelaun : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K1(BRepMesh_Edge)
	K2(Standard_Integer)
	I(BRepMesh_PairOfIndex)
	n1(TCollection_MapNodePtr)
	n2(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") BRepMesh_IndexedDataMapNodeOfIDMapOfLinkOfDataStructureOfDelaun;
		 BRepMesh_IndexedDataMapNodeOfIDMapOfLinkOfDataStructureOfDelaun (const BRepMesh_Edge & K1,const Standard_Integer K2,const BRepMesh_PairOfIndex & I,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("autodoc", "Args:
	None
Returns:
	BRepMesh_Edge

No detailed docstring for this function.") Key1;
		BRepMesh_Edge & Key1 ();

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
	BRepMesh_PairOfIndex

No detailed docstring for this function.") Value;
		BRepMesh_PairOfIndex & Value ();
};


%feature("shadow") BRepMesh_IndexedDataMapNodeOfIDMapOfLinkOfDataStructureOfDelaun::~BRepMesh_IndexedDataMapNodeOfIDMapOfLinkOfDataStructureOfDelaun %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_IndexedDataMapNodeOfIDMapOfLinkOfDataStructureOfDelaun {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepMesh_IndexedDataMapNodeOfIDMapOfLinkOfDataStructureOfDelaun {
	Handle_BRepMesh_IndexedDataMapNodeOfIDMapOfLinkOfDataStructureOfDelaun GetHandle() {
	return *(Handle_BRepMesh_IndexedDataMapNodeOfIDMapOfLinkOfDataStructureOfDelaun*) &$self;
	}
};

%nodefaultctor Handle_BRepMesh_IndexedDataMapNodeOfIDMapOfLinkOfDataStructureOfDelaun;
class Handle_BRepMesh_IndexedDataMapNodeOfIDMapOfLinkOfDataStructureOfDelaun : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_BRepMesh_IndexedDataMapNodeOfIDMapOfLinkOfDataStructureOfDelaun();
        Handle_BRepMesh_IndexedDataMapNodeOfIDMapOfLinkOfDataStructureOfDelaun(const Handle_BRepMesh_IndexedDataMapNodeOfIDMapOfLinkOfDataStructureOfDelaun &aHandle);
        Handle_BRepMesh_IndexedDataMapNodeOfIDMapOfLinkOfDataStructureOfDelaun(const BRepMesh_IndexedDataMapNodeOfIDMapOfLinkOfDataStructureOfDelaun *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepMesh_IndexedDataMapNodeOfIDMapOfLinkOfDataStructureOfDelaun DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepMesh_IndexedDataMapNodeOfIDMapOfLinkOfDataStructureOfDelaun {
    BRepMesh_IndexedDataMapNodeOfIDMapOfLinkOfDataStructureOfDelaun* GetObject() {
    return (BRepMesh_IndexedDataMapNodeOfIDMapOfLinkOfDataStructureOfDelaun*)$self->Access();
    }
};
%feature("shadow") Handle_BRepMesh_IndexedDataMapNodeOfIDMapOfLinkOfDataStructureOfDelaun::~Handle_BRepMesh_IndexedDataMapNodeOfIDMapOfLinkOfDataStructureOfDelaun %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepMesh_IndexedDataMapNodeOfIDMapOfLinkOfDataStructureOfDelaun {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepMesh_IndexedDataMapNodeOfIDMapOfNodeOfDataStructureOfDelaun;
class BRepMesh_IndexedDataMapNodeOfIDMapOfNodeOfDataStructureOfDelaun : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K1(BRepMesh_Vertex)
	K2(Standard_Integer)
	I(BRepMesh_ListOfInteger)
	n1(TCollection_MapNodePtr)
	n2(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") BRepMesh_IndexedDataMapNodeOfIDMapOfNodeOfDataStructureOfDelaun;
		 BRepMesh_IndexedDataMapNodeOfIDMapOfNodeOfDataStructureOfDelaun (const BRepMesh_Vertex & K1,const Standard_Integer K2,const BRepMesh_ListOfInteger & I,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("autodoc", "Args:
	None
Returns:
	BRepMesh_Vertex

No detailed docstring for this function.") Key1;
		BRepMesh_Vertex & Key1 ();

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
	BRepMesh_ListOfInteger

No detailed docstring for this function.") Value;
		BRepMesh_ListOfInteger & Value ();
};


%feature("shadow") BRepMesh_IndexedDataMapNodeOfIDMapOfNodeOfDataStructureOfDelaun::~BRepMesh_IndexedDataMapNodeOfIDMapOfNodeOfDataStructureOfDelaun %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_IndexedDataMapNodeOfIDMapOfNodeOfDataStructureOfDelaun {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepMesh_IndexedDataMapNodeOfIDMapOfNodeOfDataStructureOfDelaun {
	Handle_BRepMesh_IndexedDataMapNodeOfIDMapOfNodeOfDataStructureOfDelaun GetHandle() {
	return *(Handle_BRepMesh_IndexedDataMapNodeOfIDMapOfNodeOfDataStructureOfDelaun*) &$self;
	}
};

%nodefaultctor Handle_BRepMesh_IndexedDataMapNodeOfIDMapOfNodeOfDataStructureOfDelaun;
class Handle_BRepMesh_IndexedDataMapNodeOfIDMapOfNodeOfDataStructureOfDelaun : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_BRepMesh_IndexedDataMapNodeOfIDMapOfNodeOfDataStructureOfDelaun();
        Handle_BRepMesh_IndexedDataMapNodeOfIDMapOfNodeOfDataStructureOfDelaun(const Handle_BRepMesh_IndexedDataMapNodeOfIDMapOfNodeOfDataStructureOfDelaun &aHandle);
        Handle_BRepMesh_IndexedDataMapNodeOfIDMapOfNodeOfDataStructureOfDelaun(const BRepMesh_IndexedDataMapNodeOfIDMapOfNodeOfDataStructureOfDelaun *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepMesh_IndexedDataMapNodeOfIDMapOfNodeOfDataStructureOfDelaun DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepMesh_IndexedDataMapNodeOfIDMapOfNodeOfDataStructureOfDelaun {
    BRepMesh_IndexedDataMapNodeOfIDMapOfNodeOfDataStructureOfDelaun* GetObject() {
    return (BRepMesh_IndexedDataMapNodeOfIDMapOfNodeOfDataStructureOfDelaun*)$self->Access();
    }
};
%feature("shadow") Handle_BRepMesh_IndexedDataMapNodeOfIDMapOfNodeOfDataStructureOfDelaun::~Handle_BRepMesh_IndexedDataMapNodeOfIDMapOfNodeOfDataStructureOfDelaun %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepMesh_IndexedDataMapNodeOfIDMapOfNodeOfDataStructureOfDelaun {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepMesh_IndexedMapNodeOfIMapOfElementOfDataStructureOfDelaun;
class BRepMesh_IndexedMapNodeOfIMapOfElementOfDataStructureOfDelaun : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K1(BRepMesh_Triangle)
	K2(Standard_Integer)
	n1(TCollection_MapNodePtr)
	n2(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") BRepMesh_IndexedMapNodeOfIMapOfElementOfDataStructureOfDelaun;
		 BRepMesh_IndexedMapNodeOfIMapOfElementOfDataStructureOfDelaun (const BRepMesh_Triangle & K1,const Standard_Integer K2,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("autodoc", "Args:
	None
Returns:
	BRepMesh_Triangle

No detailed docstring for this function.") Key1;
		BRepMesh_Triangle & Key1 ();

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
};


%feature("shadow") BRepMesh_IndexedMapNodeOfIMapOfElementOfDataStructureOfDelaun::~BRepMesh_IndexedMapNodeOfIMapOfElementOfDataStructureOfDelaun %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_IndexedMapNodeOfIMapOfElementOfDataStructureOfDelaun {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepMesh_IndexedMapNodeOfIMapOfElementOfDataStructureOfDelaun {
	Handle_BRepMesh_IndexedMapNodeOfIMapOfElementOfDataStructureOfDelaun GetHandle() {
	return *(Handle_BRepMesh_IndexedMapNodeOfIMapOfElementOfDataStructureOfDelaun*) &$self;
	}
};

%nodefaultctor Handle_BRepMesh_IndexedMapNodeOfIMapOfElementOfDataStructureOfDelaun;
class Handle_BRepMesh_IndexedMapNodeOfIMapOfElementOfDataStructureOfDelaun : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_BRepMesh_IndexedMapNodeOfIMapOfElementOfDataStructureOfDelaun();
        Handle_BRepMesh_IndexedMapNodeOfIMapOfElementOfDataStructureOfDelaun(const Handle_BRepMesh_IndexedMapNodeOfIMapOfElementOfDataStructureOfDelaun &aHandle);
        Handle_BRepMesh_IndexedMapNodeOfIMapOfElementOfDataStructureOfDelaun(const BRepMesh_IndexedMapNodeOfIMapOfElementOfDataStructureOfDelaun *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepMesh_IndexedMapNodeOfIMapOfElementOfDataStructureOfDelaun DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepMesh_IndexedMapNodeOfIMapOfElementOfDataStructureOfDelaun {
    BRepMesh_IndexedMapNodeOfIMapOfElementOfDataStructureOfDelaun* GetObject() {
    return (BRepMesh_IndexedMapNodeOfIMapOfElementOfDataStructureOfDelaun*)$self->Access();
    }
};
%feature("shadow") Handle_BRepMesh_IndexedMapNodeOfIMapOfElementOfDataStructureOfDelaun::~Handle_BRepMesh_IndexedMapNodeOfIMapOfElementOfDataStructureOfDelaun %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepMesh_IndexedMapNodeOfIMapOfElementOfDataStructureOfDelaun {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepMesh_IndexedMapNodeOfIndexedMapOfVertex;
class BRepMesh_IndexedMapNodeOfIndexedMapOfVertex : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K1(BRepMesh_Vertex)
	K2(Standard_Integer)
	n1(TCollection_MapNodePtr)
	n2(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") BRepMesh_IndexedMapNodeOfIndexedMapOfVertex;
		 BRepMesh_IndexedMapNodeOfIndexedMapOfVertex (const BRepMesh_Vertex & K1,const Standard_Integer K2,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("autodoc", "Args:
	None
Returns:
	BRepMesh_Vertex

No detailed docstring for this function.") Key1;
		BRepMesh_Vertex & Key1 ();

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
};


%feature("shadow") BRepMesh_IndexedMapNodeOfIndexedMapOfVertex::~BRepMesh_IndexedMapNodeOfIndexedMapOfVertex %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_IndexedMapNodeOfIndexedMapOfVertex {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepMesh_IndexedMapNodeOfIndexedMapOfVertex {
	Handle_BRepMesh_IndexedMapNodeOfIndexedMapOfVertex GetHandle() {
	return *(Handle_BRepMesh_IndexedMapNodeOfIndexedMapOfVertex*) &$self;
	}
};

%nodefaultctor Handle_BRepMesh_IndexedMapNodeOfIndexedMapOfVertex;
class Handle_BRepMesh_IndexedMapNodeOfIndexedMapOfVertex : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_BRepMesh_IndexedMapNodeOfIndexedMapOfVertex();
        Handle_BRepMesh_IndexedMapNodeOfIndexedMapOfVertex(const Handle_BRepMesh_IndexedMapNodeOfIndexedMapOfVertex &aHandle);
        Handle_BRepMesh_IndexedMapNodeOfIndexedMapOfVertex(const BRepMesh_IndexedMapNodeOfIndexedMapOfVertex *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepMesh_IndexedMapNodeOfIndexedMapOfVertex DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepMesh_IndexedMapNodeOfIndexedMapOfVertex {
    BRepMesh_IndexedMapNodeOfIndexedMapOfVertex* GetObject() {
    return (BRepMesh_IndexedMapNodeOfIndexedMapOfVertex*)$self->Access();
    }
};
%feature("shadow") Handle_BRepMesh_IndexedMapNodeOfIndexedMapOfVertex::~Handle_BRepMesh_IndexedMapNodeOfIndexedMapOfVertex %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepMesh_IndexedMapNodeOfIndexedMapOfVertex {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepMesh_IndexedMapOfVertex;
class BRepMesh_IndexedMapOfVertex : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") BRepMesh_IndexedMapOfVertex;
		 BRepMesh_IndexedMapOfVertex (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(BRepMesh_IndexedMapOfVertex)

Returns:
	BRepMesh_IndexedMapOfVertex

No detailed docstring for this function.") Assign;
		BRepMesh_IndexedMapOfVertex & Assign (const BRepMesh_IndexedMapOfVertex & Other);
		%feature("autodoc", "Args:
	Other(BRepMesh_IndexedMapOfVertex)

Returns:
	BRepMesh_IndexedMapOfVertex

No detailed docstring for this function.") operator=;
		BRepMesh_IndexedMapOfVertex & operator = (const BRepMesh_IndexedMapOfVertex & Other);
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
	K(BRepMesh_Vertex)

Returns:
	Standard_Integer

No detailed docstring for this function.") Add;
		Standard_Integer Add (const BRepMesh_Vertex & K);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	K(BRepMesh_Vertex)

Returns:
	None

No detailed docstring for this function.") Substitute;
		void Substitute (const Standard_Integer I,const BRepMesh_Vertex & K);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveLast;
		void RemoveLast ();
		%feature("autodoc", "Args:
	K(BRepMesh_Vertex)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Contains;
		Standard_Boolean Contains (const BRepMesh_Vertex & K);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	BRepMesh_Vertex

No detailed docstring for this function.") FindKey;
		const BRepMesh_Vertex & FindKey (const Standard_Integer I);
		%feature("autodoc", "Args:
	K(BRepMesh_Vertex)

Returns:
	Standard_Integer

No detailed docstring for this function.") FindIndex;
		Standard_Integer FindIndex (const BRepMesh_Vertex & K);
};


%feature("shadow") BRepMesh_IndexedMapOfVertex::~BRepMesh_IndexedMapOfVertex %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_IndexedMapOfVertex {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepMesh_LinkHasherOfDataStructureOfDelaun;
class BRepMesh_LinkHasherOfDataStructureOfDelaun {
	public:
		%feature("autodoc", "Args:
	K(BRepMesh_Edge)
	Upper(Standard_Integer)

Returns:
	static Standard_Integer

No detailed docstring for this function.") HashCode;
		static Standard_Integer HashCode (const BRepMesh_Edge & K,const Standard_Integer Upper);
		%feature("autodoc", "Args:
	K1(BRepMesh_Edge)
	K2(BRepMesh_Edge)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsEqual;
		static Standard_Boolean IsEqual (const BRepMesh_Edge & K1,const BRepMesh_Edge & K2);
};


%feature("shadow") BRepMesh_LinkHasherOfDataStructureOfDelaun::~BRepMesh_LinkHasherOfDataStructureOfDelaun %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_LinkHasherOfDataStructureOfDelaun {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepMesh_ListIteratorOfListOfVertex;
class BRepMesh_ListIteratorOfListOfVertex {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepMesh_ListIteratorOfListOfVertex;
		 BRepMesh_ListIteratorOfListOfVertex ();
		%feature("autodoc", "Args:
	L(BRepMesh_ListOfVertex)

Returns:
	None

No detailed docstring for this function.") BRepMesh_ListIteratorOfListOfVertex;
		 BRepMesh_ListIteratorOfListOfVertex (const BRepMesh_ListOfVertex & L);
		%feature("autodoc", "Args:
	L(BRepMesh_ListOfVertex)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const BRepMesh_ListOfVertex & L);
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
	BRepMesh_Vertex

No detailed docstring for this function.") Value;
		BRepMesh_Vertex & Value ();
};


%feature("shadow") BRepMesh_ListIteratorOfListOfVertex::~BRepMesh_ListIteratorOfListOfVertex %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_ListIteratorOfListOfVertex {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepMesh_ListIteratorOfListOfXY;
class BRepMesh_ListIteratorOfListOfXY {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepMesh_ListIteratorOfListOfXY;
		 BRepMesh_ListIteratorOfListOfXY ();
		%feature("autodoc", "Args:
	L(BRepMesh_ListOfXY)

Returns:
	None

No detailed docstring for this function.") BRepMesh_ListIteratorOfListOfXY;
		 BRepMesh_ListIteratorOfListOfXY (const BRepMesh_ListOfXY & L);
		%feature("autodoc", "Args:
	L(BRepMesh_ListOfXY)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const BRepMesh_ListOfXY & L);
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
	gp_XY

No detailed docstring for this function.") Value;
		gp_XY & Value ();
};


%feature("shadow") BRepMesh_ListIteratorOfListOfXY::~BRepMesh_ListIteratorOfListOfXY %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_ListIteratorOfListOfXY {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepMesh_ListNodeOfListOfVertex;
class BRepMesh_ListNodeOfListOfVertex : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	I(BRepMesh_Vertex)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") BRepMesh_ListNodeOfListOfVertex;
		 BRepMesh_ListNodeOfListOfVertex (const BRepMesh_Vertex & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	BRepMesh_Vertex

No detailed docstring for this function.") Value;
		BRepMesh_Vertex & Value ();
};


%feature("shadow") BRepMesh_ListNodeOfListOfVertex::~BRepMesh_ListNodeOfListOfVertex %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_ListNodeOfListOfVertex {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepMesh_ListNodeOfListOfVertex {
	Handle_BRepMesh_ListNodeOfListOfVertex GetHandle() {
	return *(Handle_BRepMesh_ListNodeOfListOfVertex*) &$self;
	}
};

%nodefaultctor Handle_BRepMesh_ListNodeOfListOfVertex;
class Handle_BRepMesh_ListNodeOfListOfVertex : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_BRepMesh_ListNodeOfListOfVertex();
        Handle_BRepMesh_ListNodeOfListOfVertex(const Handle_BRepMesh_ListNodeOfListOfVertex &aHandle);
        Handle_BRepMesh_ListNodeOfListOfVertex(const BRepMesh_ListNodeOfListOfVertex *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepMesh_ListNodeOfListOfVertex DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepMesh_ListNodeOfListOfVertex {
    BRepMesh_ListNodeOfListOfVertex* GetObject() {
    return (BRepMesh_ListNodeOfListOfVertex*)$self->Access();
    }
};
%feature("shadow") Handle_BRepMesh_ListNodeOfListOfVertex::~Handle_BRepMesh_ListNodeOfListOfVertex %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepMesh_ListNodeOfListOfVertex {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepMesh_ListNodeOfListOfXY;
class BRepMesh_ListNodeOfListOfXY : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	I(gp_XY)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") BRepMesh_ListNodeOfListOfXY;
		 BRepMesh_ListNodeOfListOfXY (const gp_XY & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	gp_XY

No detailed docstring for this function.") Value;
		gp_XY & Value ();
};


%feature("shadow") BRepMesh_ListNodeOfListOfXY::~BRepMesh_ListNodeOfListOfXY %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_ListNodeOfListOfXY {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepMesh_ListNodeOfListOfXY {
	Handle_BRepMesh_ListNodeOfListOfXY GetHandle() {
	return *(Handle_BRepMesh_ListNodeOfListOfXY*) &$self;
	}
};

%nodefaultctor Handle_BRepMesh_ListNodeOfListOfXY;
class Handle_BRepMesh_ListNodeOfListOfXY : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_BRepMesh_ListNodeOfListOfXY();
        Handle_BRepMesh_ListNodeOfListOfXY(const Handle_BRepMesh_ListNodeOfListOfXY &aHandle);
        Handle_BRepMesh_ListNodeOfListOfXY(const BRepMesh_ListNodeOfListOfXY *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepMesh_ListNodeOfListOfXY DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepMesh_ListNodeOfListOfXY {
    BRepMesh_ListNodeOfListOfXY* GetObject() {
    return (BRepMesh_ListNodeOfListOfXY*)$self->Access();
    }
};
%feature("shadow") Handle_BRepMesh_ListNodeOfListOfXY::~Handle_BRepMesh_ListNodeOfListOfXY %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepMesh_ListNodeOfListOfXY {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepMesh_ListOfVertex;
class BRepMesh_ListOfVertex {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepMesh_ListOfVertex;
		 BRepMesh_ListOfVertex ();
		%feature("autodoc", "Args:
	Other(BRepMesh_ListOfVertex)

Returns:
	None

No detailed docstring for this function.") Assign;
		void Assign (const BRepMesh_ListOfVertex & Other);
		%feature("autodoc", "Args:
	Other(BRepMesh_ListOfVertex)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const BRepMesh_ListOfVertex & Other);
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
	I(BRepMesh_Vertex)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const BRepMesh_Vertex & I);
		%feature("autodoc", "Args:
	I(BRepMesh_Vertex)
	theIt(BRepMesh_ListIteratorOfListOfVertex)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const BRepMesh_Vertex & I,BRepMesh_ListIteratorOfListOfVertex & theIt);
		%feature("autodoc", "Args:
	Other(BRepMesh_ListOfVertex)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (BRepMesh_ListOfVertex & Other);
		%feature("autodoc", "Args:
	I(BRepMesh_Vertex)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const BRepMesh_Vertex & I);
		%feature("autodoc", "Args:
	I(BRepMesh_Vertex)
	theIt(BRepMesh_ListIteratorOfListOfVertex)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const BRepMesh_Vertex & I,BRepMesh_ListIteratorOfListOfVertex & theIt);
		%feature("autodoc", "Args:
	Other(BRepMesh_ListOfVertex)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (BRepMesh_ListOfVertex & Other);
		%feature("autodoc", "Args:
	None
Returns:
	BRepMesh_Vertex

No detailed docstring for this function.") First;
		BRepMesh_Vertex & First ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepMesh_Vertex

No detailed docstring for this function.") Last;
		BRepMesh_Vertex & Last ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "Args:
	It(BRepMesh_ListIteratorOfListOfVertex)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (BRepMesh_ListIteratorOfListOfVertex & It);
		%feature("autodoc", "Args:
	I(BRepMesh_Vertex)
	It(BRepMesh_ListIteratorOfListOfVertex)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const BRepMesh_Vertex & I,BRepMesh_ListIteratorOfListOfVertex & It);
		%feature("autodoc", "Args:
	Other(BRepMesh_ListOfVertex)
	It(BRepMesh_ListIteratorOfListOfVertex)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (BRepMesh_ListOfVertex & Other,BRepMesh_ListIteratorOfListOfVertex & It);
		%feature("autodoc", "Args:
	I(BRepMesh_Vertex)
	It(BRepMesh_ListIteratorOfListOfVertex)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const BRepMesh_Vertex & I,BRepMesh_ListIteratorOfListOfVertex & It);
		%feature("autodoc", "Args:
	Other(BRepMesh_ListOfVertex)
	It(BRepMesh_ListIteratorOfListOfVertex)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (BRepMesh_ListOfVertex & Other,BRepMesh_ListIteratorOfListOfVertex & It);
};


%feature("shadow") BRepMesh_ListOfVertex::~BRepMesh_ListOfVertex %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_ListOfVertex {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepMesh_ListOfXY;
class BRepMesh_ListOfXY {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepMesh_ListOfXY;
		 BRepMesh_ListOfXY ();
		%feature("autodoc", "Args:
	Other(BRepMesh_ListOfXY)

Returns:
	None

No detailed docstring for this function.") Assign;
		void Assign (const BRepMesh_ListOfXY & Other);
		%feature("autodoc", "Args:
	Other(BRepMesh_ListOfXY)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const BRepMesh_ListOfXY & Other);
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
	I(gp_XY)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const gp_XY & I);
		%feature("autodoc", "Args:
	I(gp_XY)
	theIt(BRepMesh_ListIteratorOfListOfXY)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const gp_XY & I,BRepMesh_ListIteratorOfListOfXY & theIt);
		%feature("autodoc", "Args:
	Other(BRepMesh_ListOfXY)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (BRepMesh_ListOfXY & Other);
		%feature("autodoc", "Args:
	I(gp_XY)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const gp_XY & I);
		%feature("autodoc", "Args:
	I(gp_XY)
	theIt(BRepMesh_ListIteratorOfListOfXY)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const gp_XY & I,BRepMesh_ListIteratorOfListOfXY & theIt);
		%feature("autodoc", "Args:
	Other(BRepMesh_ListOfXY)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (BRepMesh_ListOfXY & Other);
		%feature("autodoc", "Args:
	None
Returns:
	gp_XY

No detailed docstring for this function.") First;
		gp_XY & First ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_XY

No detailed docstring for this function.") Last;
		gp_XY & Last ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "Args:
	It(BRepMesh_ListIteratorOfListOfXY)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (BRepMesh_ListIteratorOfListOfXY & It);
		%feature("autodoc", "Args:
	I(gp_XY)
	It(BRepMesh_ListIteratorOfListOfXY)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const gp_XY & I,BRepMesh_ListIteratorOfListOfXY & It);
		%feature("autodoc", "Args:
	Other(BRepMesh_ListOfXY)
	It(BRepMesh_ListIteratorOfListOfXY)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (BRepMesh_ListOfXY & Other,BRepMesh_ListIteratorOfListOfXY & It);
		%feature("autodoc", "Args:
	I(gp_XY)
	It(BRepMesh_ListIteratorOfListOfXY)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const gp_XY & I,BRepMesh_ListIteratorOfListOfXY & It);
		%feature("autodoc", "Args:
	Other(BRepMesh_ListOfXY)
	It(BRepMesh_ListIteratorOfListOfXY)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (BRepMesh_ListOfXY & Other,BRepMesh_ListIteratorOfListOfXY & It);
};


%feature("shadow") BRepMesh_ListOfXY::~BRepMesh_ListOfXY %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_ListOfXY {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepMesh_NodeHasherOfDataStructureOfDelaun;
class BRepMesh_NodeHasherOfDataStructureOfDelaun {
	public:
		%feature("autodoc", "Args:
	K(BRepMesh_Vertex)
	Upper(Standard_Integer)

Returns:
	static Standard_Integer

No detailed docstring for this function.") HashCode;
		static Standard_Integer HashCode (const BRepMesh_Vertex & K,const Standard_Integer Upper);
		%feature("autodoc", "Args:
	K1(BRepMesh_Vertex)
	K2(BRepMesh_Vertex)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsEqual;
		static Standard_Boolean IsEqual (const BRepMesh_Vertex & K1,const BRepMesh_Vertex & K2);
};


%feature("shadow") BRepMesh_NodeHasherOfDataStructureOfDelaun::~BRepMesh_NodeHasherOfDataStructureOfDelaun %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_NodeHasherOfDataStructureOfDelaun {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepMesh_PairOfIndex;
class BRepMesh_PairOfIndex {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepMesh_PairOfIndex;
		 BRepMesh_PairOfIndex ();
		%feature("autodoc", "Args:
	theOther(BRepMesh_PairOfIndex)

Returns:
	None

No detailed docstring for this function.") BRepMesh_PairOfIndex;
		 BRepMesh_PairOfIndex (const BRepMesh_PairOfIndex & theOther);
		%feature("autodoc", "Args:
	None
Returns:
	None

Clear indices") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	theIndx(Standard_Integer)

Returns:
	None

append index (store first of last index of pair)") Append;
		void Append (const Standard_Integer theIndx);
		%feature("autodoc", "Args:
	theIndx(Standard_Integer)

Returns:
	None

prepend index (store first index)") Prepend;
		void Prepend (const Standard_Integer theIndx);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

returns is pair not initialized by index") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

returns numner of initialized indeces") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

returns first index from pair") FirstIndex;
		Standard_Integer FirstIndex ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

returns last index") LastIndex;
		Standard_Integer LastIndex ();
		%feature("autodoc", "Args:
	theNum(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") Index;
		Standard_Integer Index (const Standard_Integer theNum);
		%feature("autodoc", "Args:
	theNum(Standard_Integer)
	theIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetIndex;
		void SetIndex (const Standard_Integer theNum,const Standard_Integer theIndex);
		%feature("autodoc", "Args:
	theNum(Standard_Integer)

Returns:
	None

remove indicated") RemoveIndex;
		void RemoveIndex (const Standard_Integer theNum);
};


%feature("shadow") BRepMesh_PairOfIndex::~BRepMesh_PairOfIndex %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_PairOfIndex {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepMesh_PairOfPolygon;
class BRepMesh_PairOfPolygon {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Create empty pair with null fileds") BRepMesh_PairOfPolygon;
		 BRepMesh_PairOfPolygon ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Clear pair handles") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	thePoly(Handle_Poly_PolygonOnTriangulation)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Poly_PolygonOnTriangulation & thePoly);
		%feature("autodoc", "Args:
	thePoly(Handle_Poly_PolygonOnTriangulation)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Poly_PolygonOnTriangulation & thePoly);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Poly_PolygonOnTriangulation

Returns first polygon on triangulation") First;
		const Handle_Poly_PolygonOnTriangulation & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Poly_PolygonOnTriangulation

Returns last polygon on triangulation") Last;
		const Handle_Poly_PolygonOnTriangulation & Last ();
};


%feature("shadow") BRepMesh_PairOfPolygon::~BRepMesh_PairOfPolygon %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_PairOfPolygon {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepMesh_SelectorOfDataStructureOfDelaun;
class BRepMesh_SelectorOfDataStructureOfDelaun {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepMesh_SelectorOfDataStructureOfDelaun;
		 BRepMesh_SelectorOfDataStructureOfDelaun ();
		%feature("autodoc", "Args:
	theMesh(Handle_BRepMesh_DataStructureOfDelaun)

Returns:
	None

No detailed docstring for this function.") BRepMesh_SelectorOfDataStructureOfDelaun;
		 BRepMesh_SelectorOfDataStructureOfDelaun (const Handle_BRepMesh_DataStructureOfDelaun & theMesh);
		%feature("autodoc", "Args:
	theMesh(Handle_BRepMesh_DataStructureOfDelaun)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Handle_BRepMesh_DataStructureOfDelaun & theMesh);
		%feature("autodoc", "Args:
	theNode(BRepMesh_Vertex)

Returns:
	None

No detailed docstring for this function.") NeighboursOf;
		void NeighboursOf (const BRepMesh_Vertex & theNode);
		%feature("autodoc", "Args:
	indexNode(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") NeighboursOfNode;
		void NeighboursOfNode (const Standard_Integer indexNode);
		%feature("autodoc", "Args:
	theLink(BRepMesh_Edge)

Returns:
	None

No detailed docstring for this function.") NeighboursOf;
		void NeighboursOf (const BRepMesh_Edge & theLink);
		%feature("autodoc", "Args:
	indexLink(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") NeighboursOfLink;
		void NeighboursOfLink (const Standard_Integer indexLink);
		%feature("autodoc", "Args:
	theElem(BRepMesh_Triangle)

Returns:
	None

No detailed docstring for this function.") NeighboursOf;
		void NeighboursOf (const BRepMesh_Triangle & theElem);
		%feature("autodoc", "Args:
	indexElem(Standard_Integer)

Returns:
	None

All Neighbours  Of the Element. By  
         edge or by vertices.") NeighboursOfElement;
		void NeighboursOfElement (const Standard_Integer indexElem);
		%feature("autodoc", "Args:
	theElem(BRepMesh_Triangle)

Returns:
	None

Neighbours by edge Of the Element.") NeighboursByEdgeOf;
		void NeighboursByEdgeOf (const BRepMesh_Triangle & theElem);
		%feature("autodoc", "Args:
	theSelector(BRepMesh_SelectorOfDataStructureOfDelaun)

Returns:
	None

Adds a level of Neighbours by edge  
         to the selector <theSelector>.") NeighboursOf;
		void NeighboursOf (const BRepMesh_SelectorOfDataStructureOfDelaun & theSelector);
		%feature("autodoc", "Args:
	None
Returns:
	None

Adds a level of Neighbours by edge  
         to the selector <self>.") AddNeighbours;
		void AddNeighbours ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepMesh_MapOfInteger

No detailed docstring for this function.") Nodes;
		const BRepMesh_MapOfInteger & Nodes ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepMesh_MapOfInteger

No detailed docstring for this function.") Links;
		const BRepMesh_MapOfInteger & Links ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepMesh_MapOfInteger

No detailed docstring for this function.") Elements;
		const BRepMesh_MapOfInteger & Elements ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepMesh_MapOfInteger

Gives the  list  of links  incices  
         frontier  of  the  selector  <self>.") FrontierLinks;
		const BRepMesh_MapOfInteger & FrontierLinks ();
};


%feature("shadow") BRepMesh_SelectorOfDataStructureOfDelaun::~BRepMesh_SelectorOfDataStructureOfDelaun %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_SelectorOfDataStructureOfDelaun {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepMesh_ShapeTool;
class BRepMesh_ShapeTool {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepMesh_ShapeTool;
		 BRepMesh_ShapeTool ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") MoreFace;
		Standard_Boolean MoreFace ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") NextFace;
		void NextFace ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Face

No detailed docstring for this function.") CurrentFace;
		const TopoDS_Face & CurrentFace ();
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const TopoDS_Face & F);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") MoreEdge;
		Standard_Boolean MoreEdge ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") NextEdge;
		void NextEdge ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Edge

No detailed docstring for this function.") CurrentEdge;
		const TopoDS_Edge & CurrentEdge ();
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") MoreInternalVertex;
		Standard_Boolean MoreInternalVertex ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") NextInternalVertex;
		void NextInternalVertex ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Vertex

No detailed docstring for this function.") CurrentInternalVertex;
		const TopoDS_Vertex & CurrentInternalVertex ();
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	static TopAbs_Orientation

No detailed docstring for this function.") Orientation;
		static TopAbs_Orientation Orientation (const TopoDS_Face & F);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	static TopAbs_Orientation

No detailed docstring for this function.") Orientation;
		static TopAbs_Orientation Orientation (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	static Bnd_Box

No detailed docstring for this function.") Bound;
		static Bnd_Box Bound (const TopoDS_Face & F);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	static Bnd_Box

No detailed docstring for this function.") Bound;
		static Bnd_Box Bound (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	static TopoDS_Vertex

No detailed docstring for this function.") FirstVertex;
		static TopoDS_Vertex FirstVertex (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	static TopoDS_Vertex

No detailed docstring for this function.") LastVertex;
		static TopoDS_Vertex LastVertex (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	Vfirst(TopoDS_Vertex)
	Vlast(TopoDS_Vertex)

Returns:
	static void

If there is  not First or Last vertex (infinite or  
         semi-infinite edge) return null shapes.") Vertices;
		static void Vertices (const TopoDS_Edge & E,TopoDS_Vertex & Vfirst,TopoDS_Vertex & Vlast);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	F(TopoDS_Face)
	wFirst(Standard_Real)
	wLast(Standard_Real)

Returns:
	static void

No detailed docstring for this function.") Range;
		static void Range (const TopoDS_Edge & E,const TopoDS_Face & F,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	F(TopoDS_Face)
	uvFirst(gp_Pnt2d)
	uvLast(gp_Pnt2d)

Returns:
	static void

No detailed docstring for this function.") UVPoints;
		static void UVPoints (const TopoDS_Edge & E,const TopoDS_Face & F,gp_Pnt2d & uvFirst,gp_Pnt2d & uvLast);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") Degenerated;
		static Standard_Boolean Degenerated (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	V(TopoDS_Vertex)

Returns:
	static Standard_Real

No detailed docstring for this function.") Tolerance;
		static Standard_Real Tolerance (const TopoDS_Vertex & V);
		%feature("autodoc", "Args:
	V(TopoDS_Vertex)
	E(TopoDS_Edge)
	F(TopoDS_Face)

Returns:
	static Standard_Real

No detailed docstring for this function.") Parameter;
		static Standard_Real Parameter (const TopoDS_Vertex & V,const TopoDS_Edge & E,const TopoDS_Face & F);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	F(TopoDS_Face)
	W(Standard_Real)
	UV(gp_Pnt2d)

Returns:
	static void

No detailed docstring for this function.") Parameters;
		static void Parameters (const TopoDS_Edge & E,const TopoDS_Face & F,const Standard_Real W,gp_Pnt2d & UV);
		%feature("autodoc", "Args:
	C(BRepAdaptor_Curve)
	W(Standard_Real)
	WFound(Standard_Real)
	p3d(gp_Pnt)
	UV(gp_Pnt2d)

Returns:
	static void

No detailed docstring for this function.") Locate;
		static void Locate (const BRepAdaptor_Curve & C,const Standard_Real W,Standard_Real &OutValue,const gp_Pnt & p3d,gp_Pnt2d & UV);
		%feature("autodoc", "Args:
	V(TopoDS_Vertex)

Returns:
	static gp_Pnt

No detailed docstring for this function.") Pnt;
		static gp_Pnt Pnt (const TopoDS_Vertex & V);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	T(Handle_Poly_Triangulation)

Returns:
	static void

No detailed docstring for this function.") AddInFace;
		static void AddInFace (const TopoDS_Face & F,Handle_Poly_Triangulation & T);
};


%feature("shadow") BRepMesh_ShapeTool::~BRepMesh_ShapeTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_ShapeTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepMesh_Triangle;
class BRepMesh_Triangle {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepMesh_Triangle;
		 BRepMesh_Triangle ();
		%feature("autodoc", "Args:
	theEdge1(Standard_Integer)
	theEdge2(Standard_Integer)
	theEdge3(Standard_Integer)
	theOrientation1(Standard_Boolean)
	theOrientation2(Standard_Boolean)
	theOrientation3(Standard_Boolean)
	isCanMove(BRepMesh_DegreeOfFreedom)

Returns:
	None

No detailed docstring for this function.") BRepMesh_Triangle;
		 BRepMesh_Triangle (const Standard_Integer theEdge1,const Standard_Integer theEdge2,const Standard_Integer theEdge3,const Standard_Boolean theOrientation1,const Standard_Boolean theOrientation2,const Standard_Boolean theOrientation3,const BRepMesh_DegreeOfFreedom isCanMove);
		%feature("autodoc", "Args:
	theEdge1(Standard_Integer)
	theEdge2(Standard_Integer)
	theEdge3(Standard_Integer)
	theOrientation1(Standard_Boolean)
	theOrientation2(Standard_Boolean)
	theOrientation3(Standard_Boolean)
	isCanMove(BRepMesh_DegreeOfFreedom)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Standard_Integer theEdge1,const Standard_Integer theEdge2,const Standard_Integer theEdge3,const Standard_Boolean theOrientation1,const Standard_Boolean theOrientation2,const Standard_Boolean theOrientation3,const BRepMesh_DegreeOfFreedom isCanMove);
		%feature("autodoc", "Args:
	theEdge1(Standard_Integer)
	theEdge2(Standard_Integer)
	theEdge3(Standard_Integer)
	theOrientation1(Standard_Boolean)
	theOrientation2(Standard_Boolean)
	theOrientation3(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") Edges;
		void Edges (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Boolean & theOrientation1,Standard_Boolean & theOrientation2,Standard_Boolean & theOrientation3);
		%feature("autodoc", "Args:
	None
Returns:
	inline BRepMesh_DegreeOfFreedom

No detailed docstring for this function.") Movability;
		inline BRepMesh_DegreeOfFreedom Movability ();
		%feature("autodoc", "Args:
	theMovability(BRepMesh_DegreeOfFreedom)

Returns:
	None

No detailed docstring for this function.") SetMovability;
		void SetMovability (const BRepMesh_DegreeOfFreedom theMovability);
		%feature("autodoc", "Args:
	theUpper(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") HashCode;
		Standard_Integer HashCode (const Standard_Integer theUpper);

        %extend {
            Standard_Integer __hash__() {
            return $self->HashCode(2147483647);
            }
        };
        		%feature("autodoc", "Args:
	theOther(BRepMesh_Triangle)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEqual;
		Standard_Boolean IsEqual (const BRepMesh_Triangle & theOther);

        %extend{
            bool __eq_wrapper__(const BRepMesh_Triangle  other) {
            if (*self==other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __eq__(self,right):
            try:
                return self.__eq_wrapper__(right)
            except:
                return False
        }
        };


%feature("shadow") BRepMesh_Triangle::~BRepMesh_Triangle %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_Triangle {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepMesh_Vertex;
class BRepMesh_Vertex {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepMesh_Vertex;
		 BRepMesh_Vertex ();
		%feature("autodoc", "Args:
	UV(gp_XY)
	Locat3d(Standard_Integer)
	Move(BRepMesh_DegreeOfFreedom)

Returns:
	None

No detailed docstring for this function.") BRepMesh_Vertex;
		 BRepMesh_Vertex (const gp_XY & UV,const Standard_Integer Locat3d,const BRepMesh_DegreeOfFreedom Move);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	Move(BRepMesh_DegreeOfFreedom)

Returns:
	None

No detailed docstring for this function.") BRepMesh_Vertex;
		 BRepMesh_Vertex (const Standard_Real U,const Standard_Real V,const BRepMesh_DegreeOfFreedom Move);
		%feature("autodoc", "Args:
	UV(gp_XY)
	Locat3d(Standard_Integer)
	Move(BRepMesh_DegreeOfFreedom)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const gp_XY & UV,const Standard_Integer Locat3d,const BRepMesh_DegreeOfFreedom Move);
		%feature("autodoc", "Args:
	None
Returns:
	gp_XY

No detailed docstring for this function.") Coord;
		const gp_XY & Coord ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Location3d;
		Standard_Integer Location3d ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepMesh_DegreeOfFreedom

No detailed docstring for this function.") Movability;
		BRepMesh_DegreeOfFreedom Movability ();
		%feature("autodoc", "Args:
	Move(BRepMesh_DegreeOfFreedom)

Returns:
	None

No detailed docstring for this function.") SetMovability;
		void SetMovability (const BRepMesh_DegreeOfFreedom Move);
		%feature("autodoc", "Args:
	Upper(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") HashCode;
		Standard_Integer HashCode (const Standard_Integer Upper);

        %extend {
            Standard_Integer __hash__() {
            return $self->HashCode(2147483647);
            }
        };
        		%feature("autodoc", "Args:
	Other(BRepMesh_Vertex)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEqual;
		Standard_Boolean IsEqual (const BRepMesh_Vertex & Other);

        %extend{
            bool __eq_wrapper__(const BRepMesh_Vertex  other) {
            if (*self==other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __eq__(self,right):
            try:
                return self.__eq_wrapper__(right)
            except:
                return False
        }
        };


%feature("shadow") BRepMesh_Vertex::~BRepMesh_Vertex %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_Vertex {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepMesh_VertexHasher;
class BRepMesh_VertexHasher {
	public:
		%feature("autodoc", "Args:
	K(BRepMesh_Vertex)
	Upper(Standard_Integer)

Returns:
	static Standard_Integer

No detailed docstring for this function.") HashCode;
		static Standard_Integer HashCode (const BRepMesh_Vertex & K,const Standard_Integer Upper);
		%feature("autodoc", "Args:
	K1(BRepMesh_Vertex)
	K2(BRepMesh_Vertex)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsEqual;
		static Standard_Boolean IsEqual (const BRepMesh_Vertex & K1,const BRepMesh_Vertex & K2);
};


%feature("shadow") BRepMesh_VertexHasher::~BRepMesh_VertexHasher %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_VertexHasher {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepMesh_VertexInspector;
class BRepMesh_VertexInspector : public NCollection_CellFilter_InspectorXY {
	public:
		%feature("autodoc", "Args:
	nbComp(Standard_Integer)
	theAlloc(BRepMesh_BaseAllocator)

Returns:
	None

Constructor; remembers tolerance and collector data structure.
theTol can be Real or Array1OfReal with two elements which describe
tolerance for each dimension.") BRepMesh_VertexInspector;
		 BRepMesh_VertexInspector (const Standard_Integer nbComp,const BRepMesh_BaseAllocator & theAlloc);
		%feature("autodoc", "Args:
	nbComp(Standard_Integer)
	theTol(Standard_Real)
	theAlloc(BRepMesh_BaseAllocator)

Returns:
	None

No detailed docstring for this function.") BRepMesh_VertexInspector;
		 BRepMesh_VertexInspector (const Standard_Integer nbComp,const Standard_Real theTol,const BRepMesh_BaseAllocator & theAlloc);
		%feature("autodoc", "Args:
	nbComp(Standard_Integer)
	aTolX(Standard_Real)
	aTolY(Standard_Real)
	theAlloc(BRepMesh_BaseAllocator)

Returns:
	None

No detailed docstring for this function.") BRepMesh_VertexInspector;
		 BRepMesh_VertexInspector (const Standard_Integer nbComp,const Standard_Real aTolX,const Standard_Real aTolY,const BRepMesh_BaseAllocator & theAlloc);
		%feature("autodoc", "Args:
	theVertex(BRepMesh_Vertex)

Returns:
	Standard_Integer

No detailed docstring for this function.") Add;
		Standard_Integer Add (const BRepMesh_Vertex & theVertex);
		%feature("autodoc", "Args:
	theTol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetTolerance;
		void SetTolerance (const Standard_Real theTol);
		%feature("autodoc", "Args:
	theTolX(Standard_Real)
	theTolY(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetTolerance;
		void SetTolerance (const Standard_Real theTolX,const Standard_Real theTolY);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Delete;
		void Delete (const Standard_Integer theIndex);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") GetNbVertices;
		Standard_Integer GetNbVertices ();
		%feature("autodoc", "Args:
	theInd(Standard_Integer)

Returns:
	BRepMesh_Vertex

No detailed docstring for this function.") GetVertex;
		BRepMesh_Vertex & GetVertex (Standard_Integer theInd);
		%feature("autodoc", "Args:
	theCurVertex(gp_XY)
	Standard_Boolean()

Returns:
	None

Set current node to be checked") SetCurrent;
		void SetCurrent (const gp_XY & theCurVertex,const Standard_Boolean);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

//!Get result index of node") GetCoincidentInd;
		Standard_Integer GetCoincidentInd ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepMesh_ListOfInteger

No detailed docstring for this function.") GetListOfDelNodes;
		const BRepMesh_ListOfInteger & GetListOfDelNodes ();
		%feature("autodoc", "Args:
	theTarget(Standard_Integer)

Returns:
	NCollection_CellFilter_Action

Implementation of inspection method") Inspect;
		NCollection_CellFilter_Action Inspect (const Standard_Integer theTarget);
		%feature("autodoc", "Args:
	theIdx(Standard_Integer)
	theTarget(Standard_Integer)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsEqual;
		static Standard_Boolean IsEqual (Standard_Integer theIdx,const Standard_Integer theTarget);
};


%feature("shadow") BRepMesh_VertexInspector::~BRepMesh_VertexInspector %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_VertexInspector {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepMesh_VertexTool;
class BRepMesh_VertexTool {
	public:
		%feature("autodoc", "Args:
	theAlloc(BRepMesh_BaseAllocator)

Returns:
	None

No detailed docstring for this function.") BRepMesh_VertexTool;
		 BRepMesh_VertexTool (const BRepMesh_BaseAllocator & theAlloc);
		%feature("autodoc", "Args:
	nbComp(Standard_Integer)
	theAlloc(BRepMesh_BaseAllocator)

Returns:
	None

Constructs a VertexTool with an  evaluation of the  
         number of vertices.") BRepMesh_VertexTool;
		 BRepMesh_VertexTool (const Standard_Integer nbComp,const BRepMesh_BaseAllocator & theAlloc);
		%feature("autodoc", "Args:
	theSize(Standard_Real)

Returns:
	None

Sets new size for cellfilter.") SetCellSize;
		void SetCellSize (const Standard_Real theSize);
		%feature("autodoc", "Args:
	theXSize(Standard_Real)
	theYSize(Standard_Real)

Returns:
	None

Sets new size for cellfilter.") SetCellSize;
		void SetCellSize (const Standard_Real theXSize,const Standard_Real theYSize);
		%feature("autodoc", "Args:
	theTol(Standard_Real)

Returns:
	None

Sets new size for cellfilter.") SetTolerance;
		void SetTolerance (const Standard_Real theTol);
		%feature("autodoc", "Args:
	theTolX(Standard_Real)
	theTolY(Standard_Real)

Returns:
	None

Sets new size for cellfilter.") SetTolerance;
		void SetTolerance (const Standard_Real theTolX,const Standard_Real theTolY);
		%feature("autodoc", "Args:
	theVertex(BRepMesh_Vertex)
	theParams(BRepMesh_ListOfInteger)

Returns:
	Standard_Integer

Adds a vertex to the tool.") Add;
		Standard_Integer Add (const BRepMesh_Vertex & theVertex,const BRepMesh_ListOfInteger & theParams);
		%feature("autodoc", "Args:
	theVertex(BRepMesh_Vertex)

Returns:
	Standard_Integer

Adds a vertex to the tool.") Add;
		Standard_Integer Add (const BRepMesh_Vertex & theVertex);
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)

Returns:
	None

Deletes a vertex from the tool.") Delete;
		void Delete (const Standard_Integer theIndex);
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)

Returns:
	BRepMesh_ListOfInteger

Returns data assigned to theIndex.") FindFromIndex;
		BRepMesh_ListOfInteger & FindFromIndex (const Standard_Integer theIndex);
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)

Returns:
	BRepMesh_Vertex

Selects the vertex by theIndex.") FindKey;
		const BRepMesh_Vertex & FindKey (const Standard_Integer theIndex);
		%feature("autodoc", "Args:
	theVertex(BRepMesh_Vertex)

Returns:
	Standard_Integer

Returns an index of theVertex.") FindIndex;
		Standard_Integer FindIndex (const BRepMesh_Vertex & theVertex);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns a number of vertices.") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True when the map contains no keys.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	theVertex(BRepMesh_Vertex)
	theData(BRepMesh_ListOfInteger)

Returns:
	None

Substitutes vertex with Index on  
         theVertex with attributes theData.") Substitute;
		void Substitute (const Standard_Integer Index,const BRepMesh_Vertex & theVertex,const BRepMesh_ListOfInteger & theData);
		%feature("autodoc", "Args:
	None
Returns:
	None

Remove last node from the structure.") RemoveLast;
		void RemoveLast ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepMesh_ListOfInteger

Returns the list with indexes of  
         vertices that have Movability attribute  
         equal to BRepMesh_Deleted and can be  
         replaced with another node.") GetListOfDelNodes;
		const BRepMesh_ListOfInteger & GetListOfDelNodes ();

        %feature("autodoc", "1");
        %extend{
            std::string StatisticsToString() {
            std::stringstream s;
            self->Statistics(s);
            return s.str();}
        };
        };


%feature("shadow") BRepMesh_VertexTool::~BRepMesh_VertexTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_VertexTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepMesh_IncrementalMesh;
class BRepMesh_IncrementalMesh : public BRepMesh_DiscretRoot {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepMesh_IncrementalMesh;
		 BRepMesh_IncrementalMesh ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	D(Standard_Real)
	Relatif(Standard_Boolean)=Standard_False
	Ang(Standard_Real)=0.5
	InParallel(Standard_Boolean)=Standard_False

Returns:
	None

If the  boolean    <Relatif>   is  True,    the  
         deflection used   for the polygonalisation   of  
         each edge will be <D> * Size of Edge.  
         the deflection used for the faces will be the maximum  
         deflection of their edges.") BRepMesh_IncrementalMesh;
		 BRepMesh_IncrementalMesh (const TopoDS_Shape & S,const Standard_Real D,const Standard_Boolean Relatif = Standard_False,const Standard_Real Ang = 0.5,const Standard_Boolean InParallel = Standard_False);
		%feature("autodoc", "Args:
	theFlag(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") SetRelative;
		void SetRelative (const Standard_Boolean theFlag);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") Relative;
		Standard_Boolean Relative ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") Perform;
		virtual void Perform ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

Builds the incremental mesh of the shape") Update;
		void Update (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsModified;
		Standard_Boolean IsModified ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") GetStatusFlags;
		Standard_Integer GetStatusFlags ();
		%feature("autodoc", "Args:
	theInParallel(Standard_Boolean)

Returns:
	None

Request algorithm to launch in multiple threads to improve performance.") SetParallel;
		void SetParallel (const Standard_Boolean theInParallel);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the multi-threading usage flag.") IsParallel;
		Standard_Boolean IsParallel ();
		%feature("autodoc", "Args:
	theShape(TopoDS_Shape)
	theDeflection(Standard_Real)
	theAngle(Standard_Real)
	theAlgo(BRepMesh_PDiscretRoot)

Returns:
	static Standard_Integer

Plugin interface for the Mesh Factories.") Discret;
		static Standard_Integer Discret (const TopoDS_Shape & theShape,const Standard_Real theDeflection,const Standard_Real theAngle,BRepMesh_PDiscretRoot & theAlgo);
		%feature("autodoc", "Args:
	None
Returns:
	static Standard_Boolean

Returns multi-threading usage flag set by default in  
Discret() static method (thus applied only to Mesh Factories).") IsParallelDefault;
		static Standard_Boolean IsParallelDefault ();
		%feature("autodoc", "Args:
	theInParallel(Standard_Boolean)

Returns:
	static void

Setup multi-threading usage flag set by default in  
Discret() static method (thus applied only to Mesh Factories).") SetParallelDefault;
		static void SetParallelDefault (const Standard_Boolean theInParallel);
};


%feature("shadow") BRepMesh_IncrementalMesh::~BRepMesh_IncrementalMesh %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMesh_IncrementalMesh {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepMesh_IncrementalMesh {
	Handle_BRepMesh_IncrementalMesh GetHandle() {
	return *(Handle_BRepMesh_IncrementalMesh*) &$self;
	}
};

%nodefaultctor Handle_BRepMesh_IncrementalMesh;
class Handle_BRepMesh_IncrementalMesh : public Handle_BRepMesh_DiscretRoot {

    public:
        // constructors
        Handle_BRepMesh_IncrementalMesh();
        Handle_BRepMesh_IncrementalMesh(const Handle_BRepMesh_IncrementalMesh &aHandle);
        Handle_BRepMesh_IncrementalMesh(const BRepMesh_IncrementalMesh *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepMesh_IncrementalMesh DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepMesh_IncrementalMesh {
    BRepMesh_IncrementalMesh* GetObject() {
    return (BRepMesh_IncrementalMesh*)$self->Access();
    }
};
%feature("shadow") Handle_BRepMesh_IncrementalMesh::~Handle_BRepMesh_IncrementalMesh %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepMesh_IncrementalMesh {
    void _kill_pointed() {
        delete $self;
    }
};

