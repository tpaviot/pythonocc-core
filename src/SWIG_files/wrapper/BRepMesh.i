/*
Copyright 2008-2015 Thomas Paviot (tpaviot@gmail.com)


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
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i


%include BRepMesh_headers.i


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
class BRepMesh {
	public:
		%feature("compactdefaultargs") Mesh;
		%feature("autodoc", "	* call to incremental mesh.

	:param S:
	:type S: TopoDS_Shape &
	:param d:
	:type d: float
	:rtype: void
") Mesh;
		static void Mesh (const TopoDS_Shape & S,const Standard_Real d);
};


%nodefaultctor BRepMesh_Array1OfBiPoint;
class BRepMesh_Array1OfBiPoint {
	public:
		%feature("compactdefaultargs") BRepMesh_Array1OfBiPoint;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") BRepMesh_Array1OfBiPoint;
		 BRepMesh_Array1OfBiPoint (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") BRepMesh_Array1OfBiPoint;
		%feature("autodoc", "	:param Item:
	:type Item: BRepMesh_BiPoint &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") BRepMesh_Array1OfBiPoint;
		 BRepMesh_Array1OfBiPoint (const BRepMesh_BiPoint & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: BRepMesh_BiPoint &
	:rtype: None
") Init;
		void Init (const BRepMesh_BiPoint & V);
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
	:type Other: BRepMesh_Array1OfBiPoint &
	:rtype: BRepMesh_Array1OfBiPoint
") Assign;
		const BRepMesh_Array1OfBiPoint & Assign (const BRepMesh_Array1OfBiPoint & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: BRepMesh_Array1OfBiPoint &
	:rtype: BRepMesh_Array1OfBiPoint
") operator=;
		const BRepMesh_Array1OfBiPoint & operator = (const BRepMesh_Array1OfBiPoint & Other);
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
	:type Value: BRepMesh_BiPoint &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const BRepMesh_BiPoint & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: BRepMesh_BiPoint
") Value;
		const BRepMesh_BiPoint & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: BRepMesh_BiPoint
") ChangeValue;
		BRepMesh_BiPoint & ChangeValue (const Standard_Integer Index);
};


%nodefaultctor BRepMesh_Array1OfVertexOfDelaun;
class BRepMesh_Array1OfVertexOfDelaun {
	public:
		%feature("compactdefaultargs") BRepMesh_Array1OfVertexOfDelaun;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") BRepMesh_Array1OfVertexOfDelaun;
		 BRepMesh_Array1OfVertexOfDelaun (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") BRepMesh_Array1OfVertexOfDelaun;
		%feature("autodoc", "	:param Item:
	:type Item: BRepMesh_Vertex &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") BRepMesh_Array1OfVertexOfDelaun;
		 BRepMesh_Array1OfVertexOfDelaun (const BRepMesh_Vertex & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: BRepMesh_Vertex &
	:rtype: None
") Init;
		void Init (const BRepMesh_Vertex & V);
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
	:type Other: BRepMesh_Array1OfVertexOfDelaun &
	:rtype: BRepMesh_Array1OfVertexOfDelaun
") Assign;
		const BRepMesh_Array1OfVertexOfDelaun & Assign (const BRepMesh_Array1OfVertexOfDelaun & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: BRepMesh_Array1OfVertexOfDelaun &
	:rtype: BRepMesh_Array1OfVertexOfDelaun
") operator=;
		const BRepMesh_Array1OfVertexOfDelaun & operator = (const BRepMesh_Array1OfVertexOfDelaun & Other);
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
	:type Value: BRepMesh_Vertex &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const BRepMesh_Vertex & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: BRepMesh_Vertex
") Value;
		const BRepMesh_Vertex & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: BRepMesh_Vertex
") ChangeValue;
		BRepMesh_Vertex & ChangeValue (const Standard_Integer Index);
};


%nodefaultctor BRepMesh_BiPoint;
class BRepMesh_BiPoint {
	public:
		%feature("compactdefaultargs") BRepMesh_BiPoint;
		%feature("autodoc", "	:rtype: None
") BRepMesh_BiPoint;
		 BRepMesh_BiPoint ();
		%feature("compactdefaultargs") BRepMesh_BiPoint;
		%feature("autodoc", "	:param X1:
	:type X1: float
	:param Y1:
	:type Y1: float
	:param X2:
	:type X2: float
	:param Y2:
	:type Y2: float
	:rtype: None
") BRepMesh_BiPoint;
		 BRepMesh_BiPoint (const Standard_Real X1,const Standard_Real Y1,const Standard_Real X2,const Standard_Real Y2);
		%feature("compactdefaultargs") Indices;
		%feature("autodoc", "	:rtype: Standard_Address
") Indices;
		Standard_Address Indices ();
		%feature("compactdefaultargs") Coordinates;
		%feature("autodoc", "	:rtype: Standard_Address
") Coordinates;
		Standard_Address Coordinates ();
};


%nodefaultctor BRepMesh_Circ;
class BRepMesh_Circ {
	public:
		%feature("compactdefaultargs") BRepMesh_Circ;
		%feature("autodoc", "	:rtype: None
") BRepMesh_Circ;
		 BRepMesh_Circ ();
		%feature("compactdefaultargs") BRepMesh_Circ;
		%feature("autodoc", "	:param loc:
	:type loc: gp_XY
	:param rad:
	:type rad: float
	:rtype: None
") BRepMesh_Circ;
		 BRepMesh_Circ (const gp_XY & loc,const Standard_Real rad);
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "	:param loc:
	:type loc: gp_XY
	:rtype: None
") SetLocation;
		void SetLocation (const gp_XY & loc);
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "	:param rad:
	:type rad: float
	:rtype: None
") SetRadius;
		void SetRadius (const Standard_Real rad);
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "	:rtype: gp_XY
") Location;
		const gp_XY  Location ();
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "	:rtype: float
") Radius;
		const Standard_Real & Radius ();
};


%nodefaultctor BRepMesh_CircleInspector;
class BRepMesh_CircleInspector : public NCollection_CellFilter_InspectorXY {
	public:
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param theInd:
	:type theInd: int
	:param theCircle:
	:type theCircle: BRepMesh_Circ &
	:rtype: None
") Add;
		void Add (Standard_Integer theInd,const BRepMesh_Circ & theCircle);
		%feature("compactdefaultargs") ClerResList;
		%feature("autodoc", "	:rtype: None
") ClerResList;
		void ClerResList ();
		%feature("compactdefaultargs") MapOfCirc;
		%feature("autodoc", "	:rtype: CircVector
") MapOfCirc;
		CircVector & MapOfCirc ();
		%feature("compactdefaultargs") GetCirc;
		%feature("autodoc", "	:param theInd:
	:type theInd: int
	:rtype: BRepMesh_Circ
") GetCirc;
		BRepMesh_Circ & GetCirc (Standard_Integer theInd);
		%feature("compactdefaultargs") SetCurrent;
		%feature("autodoc", "	* Set current node to be checked

	:param theCurCircle:
	:type theCurCircle: gp_XY
	:rtype: None
") SetCurrent;
		void SetCurrent (const gp_XY & theCurCircle);
		%feature("compactdefaultargs") GetCoincidentInd;
		%feature("autodoc", "	* //!Get result index of node

	:rtype: BRepMesh_ListOfInteger
") GetCoincidentInd;
		BRepMesh_ListOfInteger & GetCoincidentInd ();
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	:param theIdx:
	:type theIdx: int
	:param theTarget:
	:type theTarget: int
	:rtype: bool
") IsEqual;
		static Standard_Boolean IsEqual (Standard_Integer theIdx,const Standard_Integer theTarget);
};


%nodefaultctor BRepMesh_CircleTool;
class BRepMesh_CircleTool {
	public:
		%feature("compactdefaultargs") BRepMesh_CircleTool;
		%feature("autodoc", "	:param theAlloc:
	:type theAlloc: BRepMesh_BaseAllocator &
	:rtype: None
") BRepMesh_CircleTool;
		 BRepMesh_CircleTool (const BRepMesh_BaseAllocator & theAlloc);
		%feature("compactdefaultargs") BRepMesh_CircleTool;
		%feature("autodoc", "	* Constructs a CircleTool with the maximal dimension of the occuped space and an evaluation of the number of circles.

	:param numberOfComponents:
	:type numberOfComponents: int
	:param theAlloc:
	:type theAlloc: BRepMesh_BaseAllocator &
	:rtype: None
") BRepMesh_CircleTool;
		 BRepMesh_CircleTool (const Standard_Integer numberOfComponents,const BRepMesh_BaseAllocator & theAlloc);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* Constructs a CircleTool with the maximal dimension of the occuped space and an evaluation of the number of circles.

	:param numberOfComponents:
	:type numberOfComponents: int
	:rtype: None
") Initialize;
		void Initialize (const Standard_Integer numberOfComponents);
		%feature("compactdefaultargs") SetCellSize;
		%feature("autodoc", "	* Sets new size for cellfilter

	:param theSize:
	:type theSize: float
	:rtype: None
") SetCellSize;
		void SetCellSize (const Standard_Real theSize);
		%feature("compactdefaultargs") SetCellSize;
		%feature("autodoc", "	* Sets new size for cellfilter

	:param theXSize:
	:type theXSize: float
	:param theYSize:
	:type theYSize: float
	:rtype: None
") SetCellSize;
		void SetCellSize (const Standard_Real theXSize,const Standard_Real theYSize);
		%feature("compactdefaultargs") SetMinMaxSize;
		%feature("autodoc", "	* Sets min and max size for circle

	:param theMin:
	:type theMin: gp_XY
	:param theMax:
	:type theMax: gp_XY
	:rtype: None
") SetMinMaxSize;
		void SetMinMaxSize (const gp_XY & theMin,const gp_XY & theMax);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds and binds circle to the tool.

	:param theCirc:
	:type theCirc: gp_Circ2d
	:param theIndex:
	:type theIndex: int
	:rtype: None
") Add;
		void Add (const gp_Circ2d & theCirc,const Standard_Integer theIndex);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Computes adds and binds circle to the tool.

	:param p1:
	:type p1: gp_XY
	:param p2:
	:type p2: gp_XY
	:param p3:
	:type p3: gp_XY
	:param theIndex:
	:type theIndex: int
	:rtype: bool
") Add;
		Standard_Boolean Add (const gp_XY & p1,const gp_XY & p2,const gp_XY & p3,const Standard_Integer theIndex);
		%feature("compactdefaultargs") MocAdd;
		%feature("autodoc", "	* Adds implicit zero circle

	:param theIndex:
	:type theIndex: int
	:rtype: None
") MocAdd;
		void MocAdd (const Standard_Integer theIndex);
		%feature("compactdefaultargs") Delete;
		%feature("autodoc", "	* Deletes a circle from the tool.

	:param theIndex:
	:type theIndex: int
	:rtype: None
") Delete;
		void Delete (const Standard_Integer theIndex);
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "	* Select the circles which contains thePnt.

	:param thePnt:
	:type thePnt: gp_XY
	:rtype: BRepMesh_ListOfInteger
") Select;
		BRepMesh_ListOfInteger & Select (const gp_XY & thePnt);
};


%nodefaultctor BRepMesh_Classifier;
class BRepMesh_Classifier {
	public:
		%feature("compactdefaultargs") BRepMesh_Classifier;
		%feature("autodoc", "	:param theFace:
	:type theFace: TopoDS_Face &
	:param theTolUV:
	:type theTolUV: float
	:param theEdges:
	:type theEdges: BRepMesh_DataMapOfShapePairOfPolygon &
	:param theMap:
	:type theMap: TColStd_IndexedMapOfInteger &
	:param theStructure:
	:type theStructure: Handle_BRepMesh_DataStructureOfDelaun &
	:param theUmin:
	:type theUmin: float
	:param theUmax:
	:type theUmax: float
	:param theVmin:
	:type theVmin: float
	:param theVmax:
	:type theVmax: float
	:rtype: None
") BRepMesh_Classifier;
		 BRepMesh_Classifier (const TopoDS_Face & theFace,const Standard_Real theTolUV,const BRepMesh_DataMapOfShapePairOfPolygon & theEdges,const TColStd_IndexedMapOfInteger & theMap,const Handle_BRepMesh_DataStructureOfDelaun & theStructure,const Standard_Real theUmin,const Standard_Real theUmax,const Standard_Real theVmin,const Standard_Real theVmax);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param thePoint:
	:type thePoint: gp_Pnt2d
	:rtype: TopAbs_State
") Perform;
		TopAbs_State Perform (const gp_Pnt2d & thePoint);
		%feature("compactdefaultargs") State;
		%feature("autodoc", "	:rtype: BRepMesh_Status
") State;
		BRepMesh_Status State ();
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
};


%nodefaultctor BRepMesh_ComparatorOfIndexedVertexOfDelaun;
class BRepMesh_ComparatorOfIndexedVertexOfDelaun {
	public:
		%feature("compactdefaultargs") BRepMesh_ComparatorOfIndexedVertexOfDelaun;
		%feature("autodoc", "	:param theDir:
	:type theDir: gp_XY
	:param TheTol:
	:type TheTol: float
	:param HDS:
	:type HDS: Handle_BRepMesh_DataStructureOfDelaun &
	:rtype: None
") BRepMesh_ComparatorOfIndexedVertexOfDelaun;
		 BRepMesh_ComparatorOfIndexedVertexOfDelaun (const gp_XY & theDir,const Standard_Real TheTol,const Handle_BRepMesh_DataStructureOfDelaun & HDS);
		%feature("compactdefaultargs") IsLower;
		%feature("autodoc", "	* returns True if <Left> is lower than <Right>

	:param Left:
	:type Left: int
	:param Right:
	:type Right: int
	:rtype: bool
") IsLower;
		Standard_Boolean IsLower (const Standard_Integer Left,const Standard_Integer Right);
		%feature("compactdefaultargs") IsGreater;
		%feature("autodoc", "	* returns True if <Left> is greater than <Right>

	:param Left:
	:type Left: int
	:param Right:
	:type Right: int
	:rtype: bool
") IsGreater;
		Standard_Boolean IsGreater (const Standard_Integer Left,const Standard_Integer Right);
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	* returns True when <Right> and <Left> are equal.

	:param Left:
	:type Left: int
	:param Right:
	:type Right: int
	:rtype: bool
") IsEqual;
		Standard_Boolean IsEqual (const Standard_Integer Left,const Standard_Integer Right);
};


%nodefaultctor BRepMesh_ComparatorOfVertexOfDelaun;
class BRepMesh_ComparatorOfVertexOfDelaun {
	public:
		%feature("compactdefaultargs") BRepMesh_ComparatorOfVertexOfDelaun;
		%feature("autodoc", "	:param theDir:
	:type theDir: gp_XY
	:rtype: None
") BRepMesh_ComparatorOfVertexOfDelaun;
		 BRepMesh_ComparatorOfVertexOfDelaun (const gp_XY & theDir);
		%feature("compactdefaultargs") IsLower;
		%feature("autodoc", "	* returns True if <Left> is lower than <Right>

	:param Left:
	:type Left: BRepMesh_Vertex &
	:param Right:
	:type Right: BRepMesh_Vertex &
	:rtype: bool
") IsLower;
		Standard_Boolean IsLower (const BRepMesh_Vertex & Left,const BRepMesh_Vertex & Right);
		%feature("compactdefaultargs") IsGreater;
		%feature("autodoc", "	* returns True if <Left> is greater than <Right>

	:param Left:
	:type Left: BRepMesh_Vertex &
	:param Right:
	:type Right: BRepMesh_Vertex &
	:rtype: bool
") IsGreater;
		Standard_Boolean IsGreater (const BRepMesh_Vertex & Left,const BRepMesh_Vertex & Right);
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	* returns True when <Right> and <Left> are equal.

	:param Left:
	:type Left: BRepMesh_Vertex &
	:param Right:
	:type Right: BRepMesh_Vertex &
	:rtype: bool
") IsEqual;
		Standard_Boolean IsEqual (const BRepMesh_Vertex & Left,const BRepMesh_Vertex & Right);
};


%nodefaultctor BRepMesh_DataMapIteratorOfDataMapOfFaceAttribute;
class BRepMesh_DataMapIteratorOfDataMapOfFaceAttribute : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") BRepMesh_DataMapIteratorOfDataMapOfFaceAttribute;
		%feature("autodoc", "	:rtype: None
") BRepMesh_DataMapIteratorOfDataMapOfFaceAttribute;
		 BRepMesh_DataMapIteratorOfDataMapOfFaceAttribute ();
		%feature("compactdefaultargs") BRepMesh_DataMapIteratorOfDataMapOfFaceAttribute;
		%feature("autodoc", "	:param aMap:
	:type aMap: BRepMesh_DataMapOfFaceAttribute &
	:rtype: None
") BRepMesh_DataMapIteratorOfDataMapOfFaceAttribute;
		 BRepMesh_DataMapIteratorOfDataMapOfFaceAttribute (const BRepMesh_DataMapOfFaceAttribute & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: BRepMesh_DataMapOfFaceAttribute &
	:rtype: None
") Initialize;
		void Initialize (const BRepMesh_DataMapOfFaceAttribute & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Face
") Key;
		const TopoDS_Face  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_BRepMesh_FaceAttribute
") Value;
		Handle_BRepMesh_FaceAttribute Value ();
};


%nodefaultctor BRepMesh_DataMapIteratorOfDataMapOfIntegerListOfInteger;
class BRepMesh_DataMapIteratorOfDataMapOfIntegerListOfInteger : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") BRepMesh_DataMapIteratorOfDataMapOfIntegerListOfInteger;
		%feature("autodoc", "	:rtype: None
") BRepMesh_DataMapIteratorOfDataMapOfIntegerListOfInteger;
		 BRepMesh_DataMapIteratorOfDataMapOfIntegerListOfInteger ();
		%feature("compactdefaultargs") BRepMesh_DataMapIteratorOfDataMapOfIntegerListOfInteger;
		%feature("autodoc", "	:param aMap:
	:type aMap: BRepMesh_DataMapOfIntegerListOfInteger &
	:rtype: None
") BRepMesh_DataMapIteratorOfDataMapOfIntegerListOfInteger;
		 BRepMesh_DataMapIteratorOfDataMapOfIntegerListOfInteger (const BRepMesh_DataMapOfIntegerListOfInteger & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: BRepMesh_DataMapOfIntegerListOfInteger &
	:rtype: None
") Initialize;
		void Initialize (const BRepMesh_DataMapOfIntegerListOfInteger & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: int
") Key;
		const Standard_Integer & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: BRepMesh_ListOfInteger
") Value;
		const BRepMesh_ListOfInteger & Value ();
};


%nodefaultctor BRepMesh_DataMapIteratorOfDataMapOfIntegerListOfXY;
class BRepMesh_DataMapIteratorOfDataMapOfIntegerListOfXY : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") BRepMesh_DataMapIteratorOfDataMapOfIntegerListOfXY;
		%feature("autodoc", "	:rtype: None
") BRepMesh_DataMapIteratorOfDataMapOfIntegerListOfXY;
		 BRepMesh_DataMapIteratorOfDataMapOfIntegerListOfXY ();
		%feature("compactdefaultargs") BRepMesh_DataMapIteratorOfDataMapOfIntegerListOfXY;
		%feature("autodoc", "	:param aMap:
	:type aMap: BRepMesh_DataMapOfIntegerListOfXY &
	:rtype: None
") BRepMesh_DataMapIteratorOfDataMapOfIntegerListOfXY;
		 BRepMesh_DataMapIteratorOfDataMapOfIntegerListOfXY (const BRepMesh_DataMapOfIntegerListOfXY & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: BRepMesh_DataMapOfIntegerListOfXY &
	:rtype: None
") Initialize;
		void Initialize (const BRepMesh_DataMapOfIntegerListOfXY & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: int
") Key;
		const Standard_Integer & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: BRepMesh_ListOfXY
") Value;
		const BRepMesh_ListOfXY & Value ();
};


%nodefaultctor BRepMesh_DataMapIteratorOfDataMapOfIntegerPnt;
class BRepMesh_DataMapIteratorOfDataMapOfIntegerPnt : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") BRepMesh_DataMapIteratorOfDataMapOfIntegerPnt;
		%feature("autodoc", "	:rtype: None
") BRepMesh_DataMapIteratorOfDataMapOfIntegerPnt;
		 BRepMesh_DataMapIteratorOfDataMapOfIntegerPnt ();
		%feature("compactdefaultargs") BRepMesh_DataMapIteratorOfDataMapOfIntegerPnt;
		%feature("autodoc", "	:param aMap:
	:type aMap: BRepMesh_DataMapOfIntegerPnt &
	:rtype: None
") BRepMesh_DataMapIteratorOfDataMapOfIntegerPnt;
		 BRepMesh_DataMapIteratorOfDataMapOfIntegerPnt (const BRepMesh_DataMapOfIntegerPnt & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: BRepMesh_DataMapOfIntegerPnt &
	:rtype: None
") Initialize;
		void Initialize (const BRepMesh_DataMapOfIntegerPnt & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: int
") Key;
		const Standard_Integer & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: gp_Pnt
") Value;
		const gp_Pnt  Value ();
};


%nodefaultctor BRepMesh_DataMapIteratorOfDataMapOfShapePairOfPolygon;
class BRepMesh_DataMapIteratorOfDataMapOfShapePairOfPolygon : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") BRepMesh_DataMapIteratorOfDataMapOfShapePairOfPolygon;
		%feature("autodoc", "	:rtype: None
") BRepMesh_DataMapIteratorOfDataMapOfShapePairOfPolygon;
		 BRepMesh_DataMapIteratorOfDataMapOfShapePairOfPolygon ();
		%feature("compactdefaultargs") BRepMesh_DataMapIteratorOfDataMapOfShapePairOfPolygon;
		%feature("autodoc", "	:param aMap:
	:type aMap: BRepMesh_DataMapOfShapePairOfPolygon &
	:rtype: None
") BRepMesh_DataMapIteratorOfDataMapOfShapePairOfPolygon;
		 BRepMesh_DataMapIteratorOfDataMapOfShapePairOfPolygon (const BRepMesh_DataMapOfShapePairOfPolygon & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: BRepMesh_DataMapOfShapePairOfPolygon &
	:rtype: None
") Initialize;
		void Initialize (const BRepMesh_DataMapOfShapePairOfPolygon & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		const TopoDS_Shape  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: BRepMesh_PairOfPolygon
") Value;
		const BRepMesh_PairOfPolygon & Value ();
};


%nodefaultctor BRepMesh_DataMapIteratorOfDataMapOfShapeReal;
class BRepMesh_DataMapIteratorOfDataMapOfShapeReal : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") BRepMesh_DataMapIteratorOfDataMapOfShapeReal;
		%feature("autodoc", "	:rtype: None
") BRepMesh_DataMapIteratorOfDataMapOfShapeReal;
		 BRepMesh_DataMapIteratorOfDataMapOfShapeReal ();
		%feature("compactdefaultargs") BRepMesh_DataMapIteratorOfDataMapOfShapeReal;
		%feature("autodoc", "	:param aMap:
	:type aMap: BRepMesh_DataMapOfShapeReal &
	:rtype: None
") BRepMesh_DataMapIteratorOfDataMapOfShapeReal;
		 BRepMesh_DataMapIteratorOfDataMapOfShapeReal (const BRepMesh_DataMapOfShapeReal & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: BRepMesh_DataMapOfShapeReal &
	:rtype: None
") Initialize;
		void Initialize (const BRepMesh_DataMapOfShapeReal & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		const TopoDS_Shape  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: float
") Value;
		const Standard_Real & Value ();
};


%nodefaultctor BRepMesh_DataMapIteratorOfDataMapOfVertexInteger;
class BRepMesh_DataMapIteratorOfDataMapOfVertexInteger : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") BRepMesh_DataMapIteratorOfDataMapOfVertexInteger;
		%feature("autodoc", "	:rtype: None
") BRepMesh_DataMapIteratorOfDataMapOfVertexInteger;
		 BRepMesh_DataMapIteratorOfDataMapOfVertexInteger ();
		%feature("compactdefaultargs") BRepMesh_DataMapIteratorOfDataMapOfVertexInteger;
		%feature("autodoc", "	:param aMap:
	:type aMap: BRepMesh_DataMapOfVertexInteger &
	:rtype: None
") BRepMesh_DataMapIteratorOfDataMapOfVertexInteger;
		 BRepMesh_DataMapIteratorOfDataMapOfVertexInteger (const BRepMesh_DataMapOfVertexInteger & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: BRepMesh_DataMapOfVertexInteger &
	:rtype: None
") Initialize;
		void Initialize (const BRepMesh_DataMapOfVertexInteger & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Vertex
") Key;
		const TopoDS_Vertex  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: int
") Value;
		const Standard_Integer & Value ();
};


%nodefaultctor BRepMesh_DataMapNodeOfDataMapOfFaceAttribute;
class BRepMesh_DataMapNodeOfDataMapOfFaceAttribute : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") BRepMesh_DataMapNodeOfDataMapOfFaceAttribute;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Face &
	:param I:
	:type I: Handle_BRepMesh_FaceAttribute &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") BRepMesh_DataMapNodeOfDataMapOfFaceAttribute;
		 BRepMesh_DataMapNodeOfDataMapOfFaceAttribute (const TopoDS_Face & K,const Handle_BRepMesh_FaceAttribute & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Face
") Key;
		TopoDS_Face  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_BRepMesh_FaceAttribute
") Value;
		Handle_BRepMesh_FaceAttribute Value ();
};


%extend BRepMesh_DataMapNodeOfDataMapOfFaceAttribute {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepMesh_DataMapNodeOfDataMapOfFaceAttribute(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepMesh_DataMapNodeOfDataMapOfFaceAttribute::Handle_BRepMesh_DataMapNodeOfDataMapOfFaceAttribute %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor BRepMesh_DataMapNodeOfDataMapOfIntegerListOfInteger;
class BRepMesh_DataMapNodeOfDataMapOfIntegerListOfInteger : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") BRepMesh_DataMapNodeOfDataMapOfIntegerListOfInteger;
		%feature("autodoc", "	:param K:
	:type K: int &
	:param I:
	:type I: BRepMesh_ListOfInteger &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") BRepMesh_DataMapNodeOfDataMapOfIntegerListOfInteger;
		 BRepMesh_DataMapNodeOfDataMapOfIntegerListOfInteger (const Standard_Integer & K,const BRepMesh_ListOfInteger & I,const TCollection_MapNodePtr & n);

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
		%feature("autodoc", "	:rtype: BRepMesh_ListOfInteger
") Value;
		BRepMesh_ListOfInteger & Value ();
};


%extend BRepMesh_DataMapNodeOfDataMapOfIntegerListOfInteger {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepMesh_DataMapNodeOfDataMapOfIntegerListOfInteger(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepMesh_DataMapNodeOfDataMapOfIntegerListOfInteger::Handle_BRepMesh_DataMapNodeOfDataMapOfIntegerListOfInteger %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor BRepMesh_DataMapNodeOfDataMapOfIntegerListOfXY;
class BRepMesh_DataMapNodeOfDataMapOfIntegerListOfXY : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") BRepMesh_DataMapNodeOfDataMapOfIntegerListOfXY;
		%feature("autodoc", "	:param K:
	:type K: int &
	:param I:
	:type I: BRepMesh_ListOfXY &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") BRepMesh_DataMapNodeOfDataMapOfIntegerListOfXY;
		 BRepMesh_DataMapNodeOfDataMapOfIntegerListOfXY (const Standard_Integer & K,const BRepMesh_ListOfXY & I,const TCollection_MapNodePtr & n);

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
		%feature("autodoc", "	:rtype: BRepMesh_ListOfXY
") Value;
		BRepMesh_ListOfXY & Value ();
};


%extend BRepMesh_DataMapNodeOfDataMapOfIntegerListOfXY {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepMesh_DataMapNodeOfDataMapOfIntegerListOfXY(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepMesh_DataMapNodeOfDataMapOfIntegerListOfXY::Handle_BRepMesh_DataMapNodeOfDataMapOfIntegerListOfXY %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor BRepMesh_DataMapNodeOfDataMapOfIntegerPnt;
class BRepMesh_DataMapNodeOfDataMapOfIntegerPnt : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") BRepMesh_DataMapNodeOfDataMapOfIntegerPnt;
		%feature("autodoc", "	:param K:
	:type K: int &
	:param I:
	:type I: gp_Pnt
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") BRepMesh_DataMapNodeOfDataMapOfIntegerPnt;
		 BRepMesh_DataMapNodeOfDataMapOfIntegerPnt (const Standard_Integer & K,const gp_Pnt & I,const TCollection_MapNodePtr & n);

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
		%feature("autodoc", "	:rtype: gp_Pnt
") Value;
		gp_Pnt  Value ();
};


%extend BRepMesh_DataMapNodeOfDataMapOfIntegerPnt {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepMesh_DataMapNodeOfDataMapOfIntegerPnt(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepMesh_DataMapNodeOfDataMapOfIntegerPnt::Handle_BRepMesh_DataMapNodeOfDataMapOfIntegerPnt %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor BRepMesh_DataMapNodeOfDataMapOfShapePairOfPolygon;
class BRepMesh_DataMapNodeOfDataMapOfShapePairOfPolygon : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") BRepMesh_DataMapNodeOfDataMapOfShapePairOfPolygon;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: BRepMesh_PairOfPolygon &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") BRepMesh_DataMapNodeOfDataMapOfShapePairOfPolygon;
		 BRepMesh_DataMapNodeOfDataMapOfShapePairOfPolygon (const TopoDS_Shape & K,const BRepMesh_PairOfPolygon & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		TopoDS_Shape  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: BRepMesh_PairOfPolygon
") Value;
		BRepMesh_PairOfPolygon & Value ();
};


%extend BRepMesh_DataMapNodeOfDataMapOfShapePairOfPolygon {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepMesh_DataMapNodeOfDataMapOfShapePairOfPolygon(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepMesh_DataMapNodeOfDataMapOfShapePairOfPolygon::Handle_BRepMesh_DataMapNodeOfDataMapOfShapePairOfPolygon %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor BRepMesh_DataMapNodeOfDataMapOfShapeReal;
class BRepMesh_DataMapNodeOfDataMapOfShapeReal : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") BRepMesh_DataMapNodeOfDataMapOfShapeReal;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: float &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") BRepMesh_DataMapNodeOfDataMapOfShapeReal;
		 BRepMesh_DataMapNodeOfDataMapOfShapeReal (const TopoDS_Shape & K,const Standard_Real & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		TopoDS_Shape  Key ();

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


%extend BRepMesh_DataMapNodeOfDataMapOfShapeReal {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepMesh_DataMapNodeOfDataMapOfShapeReal(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepMesh_DataMapNodeOfDataMapOfShapeReal::Handle_BRepMesh_DataMapNodeOfDataMapOfShapeReal %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor BRepMesh_DataMapNodeOfDataMapOfVertexInteger;
class BRepMesh_DataMapNodeOfDataMapOfVertexInteger : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") BRepMesh_DataMapNodeOfDataMapOfVertexInteger;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Vertex &
	:param I:
	:type I: int &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") BRepMesh_DataMapNodeOfDataMapOfVertexInteger;
		 BRepMesh_DataMapNodeOfDataMapOfVertexInteger (const TopoDS_Vertex & K,const Standard_Integer & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Vertex
") Key;
		TopoDS_Vertex  Key ();

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


%extend BRepMesh_DataMapNodeOfDataMapOfVertexInteger {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepMesh_DataMapNodeOfDataMapOfVertexInteger(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepMesh_DataMapNodeOfDataMapOfVertexInteger::Handle_BRepMesh_DataMapNodeOfDataMapOfVertexInteger %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor BRepMesh_DataMapOfFaceAttribute;
class BRepMesh_DataMapOfFaceAttribute : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") BRepMesh_DataMapOfFaceAttribute;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") BRepMesh_DataMapOfFaceAttribute;
		 BRepMesh_DataMapOfFaceAttribute (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: BRepMesh_DataMapOfFaceAttribute &
	:rtype: BRepMesh_DataMapOfFaceAttribute
") Assign;
		BRepMesh_DataMapOfFaceAttribute & Assign (const BRepMesh_DataMapOfFaceAttribute & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: BRepMesh_DataMapOfFaceAttribute &
	:rtype: BRepMesh_DataMapOfFaceAttribute
") operator=;
		BRepMesh_DataMapOfFaceAttribute & operator = (const BRepMesh_DataMapOfFaceAttribute & Other);
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
	:type K: TopoDS_Face &
	:param I:
	:type I: Handle_BRepMesh_FaceAttribute &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TopoDS_Face & K,const Handle_BRepMesh_FaceAttribute & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Face &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const TopoDS_Face & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Face &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const TopoDS_Face & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Face &
	:rtype: Handle_BRepMesh_FaceAttribute
") Find;
		Handle_BRepMesh_FaceAttribute Find (const TopoDS_Face & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Face &
	:rtype: Handle_BRepMesh_FaceAttribute
") ChangeFind;
		Handle_BRepMesh_FaceAttribute ChangeFind (const TopoDS_Face & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Face &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const TopoDS_Face & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Face &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Face & K);
};


%nodefaultctor BRepMesh_DataMapOfIntegerListOfInteger;
class BRepMesh_DataMapOfIntegerListOfInteger : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") BRepMesh_DataMapOfIntegerListOfInteger;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") BRepMesh_DataMapOfIntegerListOfInteger;
		 BRepMesh_DataMapOfIntegerListOfInteger (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: BRepMesh_DataMapOfIntegerListOfInteger &
	:rtype: BRepMesh_DataMapOfIntegerListOfInteger
") Assign;
		BRepMesh_DataMapOfIntegerListOfInteger & Assign (const BRepMesh_DataMapOfIntegerListOfInteger & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: BRepMesh_DataMapOfIntegerListOfInteger &
	:rtype: BRepMesh_DataMapOfIntegerListOfInteger
") operator=;
		BRepMesh_DataMapOfIntegerListOfInteger & operator = (const BRepMesh_DataMapOfIntegerListOfInteger & Other);
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
	:type I: BRepMesh_ListOfInteger &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const Standard_Integer & K,const BRepMesh_ListOfInteger & I);
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
	:rtype: BRepMesh_ListOfInteger
") Find;
		const BRepMesh_ListOfInteger & Find (const Standard_Integer & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: BRepMesh_ListOfInteger
") ChangeFind;
		BRepMesh_ListOfInteger & ChangeFind (const Standard_Integer & K);
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


%nodefaultctor BRepMesh_DataMapOfIntegerListOfXY;
class BRepMesh_DataMapOfIntegerListOfXY : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") BRepMesh_DataMapOfIntegerListOfXY;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") BRepMesh_DataMapOfIntegerListOfXY;
		 BRepMesh_DataMapOfIntegerListOfXY (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: BRepMesh_DataMapOfIntegerListOfXY &
	:rtype: BRepMesh_DataMapOfIntegerListOfXY
") Assign;
		BRepMesh_DataMapOfIntegerListOfXY & Assign (const BRepMesh_DataMapOfIntegerListOfXY & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: BRepMesh_DataMapOfIntegerListOfXY &
	:rtype: BRepMesh_DataMapOfIntegerListOfXY
") operator=;
		BRepMesh_DataMapOfIntegerListOfXY & operator = (const BRepMesh_DataMapOfIntegerListOfXY & Other);
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
	:type I: BRepMesh_ListOfXY &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const Standard_Integer & K,const BRepMesh_ListOfXY & I);
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
	:rtype: BRepMesh_ListOfXY
") Find;
		const BRepMesh_ListOfXY & Find (const Standard_Integer & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: BRepMesh_ListOfXY
") ChangeFind;
		BRepMesh_ListOfXY & ChangeFind (const Standard_Integer & K);
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


%nodefaultctor BRepMesh_DataMapOfIntegerPnt;
class BRepMesh_DataMapOfIntegerPnt : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") BRepMesh_DataMapOfIntegerPnt;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") BRepMesh_DataMapOfIntegerPnt;
		 BRepMesh_DataMapOfIntegerPnt (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: BRepMesh_DataMapOfIntegerPnt &
	:rtype: BRepMesh_DataMapOfIntegerPnt
") Assign;
		BRepMesh_DataMapOfIntegerPnt & Assign (const BRepMesh_DataMapOfIntegerPnt & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: BRepMesh_DataMapOfIntegerPnt &
	:rtype: BRepMesh_DataMapOfIntegerPnt
") operator=;
		BRepMesh_DataMapOfIntegerPnt & operator = (const BRepMesh_DataMapOfIntegerPnt & Other);
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
	:type I: gp_Pnt
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const Standard_Integer & K,const gp_Pnt & I);
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
	:rtype: gp_Pnt
") Find;
		const gp_Pnt  Find (const Standard_Integer & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: gp_Pnt
") ChangeFind;
		gp_Pnt  ChangeFind (const Standard_Integer & K);
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


%nodefaultctor BRepMesh_DataMapOfShapePairOfPolygon;
class BRepMesh_DataMapOfShapePairOfPolygon : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") BRepMesh_DataMapOfShapePairOfPolygon;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") BRepMesh_DataMapOfShapePairOfPolygon;
		 BRepMesh_DataMapOfShapePairOfPolygon (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: BRepMesh_DataMapOfShapePairOfPolygon &
	:rtype: BRepMesh_DataMapOfShapePairOfPolygon
") Assign;
		BRepMesh_DataMapOfShapePairOfPolygon & Assign (const BRepMesh_DataMapOfShapePairOfPolygon & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: BRepMesh_DataMapOfShapePairOfPolygon &
	:rtype: BRepMesh_DataMapOfShapePairOfPolygon
") operator=;
		BRepMesh_DataMapOfShapePairOfPolygon & operator = (const BRepMesh_DataMapOfShapePairOfPolygon & Other);
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
	:type I: BRepMesh_PairOfPolygon &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const BRepMesh_PairOfPolygon & I);
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
	:rtype: BRepMesh_PairOfPolygon
") Find;
		const BRepMesh_PairOfPolygon & Find (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: BRepMesh_PairOfPolygon
") ChangeFind;
		BRepMesh_PairOfPolygon & ChangeFind (const TopoDS_Shape & K);
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


%nodefaultctor BRepMesh_DataMapOfShapeReal;
class BRepMesh_DataMapOfShapeReal : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") BRepMesh_DataMapOfShapeReal;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") BRepMesh_DataMapOfShapeReal;
		 BRepMesh_DataMapOfShapeReal (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: BRepMesh_DataMapOfShapeReal &
	:rtype: BRepMesh_DataMapOfShapeReal
") Assign;
		BRepMesh_DataMapOfShapeReal & Assign (const BRepMesh_DataMapOfShapeReal & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: BRepMesh_DataMapOfShapeReal &
	:rtype: BRepMesh_DataMapOfShapeReal
") operator=;
		BRepMesh_DataMapOfShapeReal & operator = (const BRepMesh_DataMapOfShapeReal & Other);
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
	:type I: float &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const Standard_Real & I);
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
	:rtype: float
") Find;
		const Standard_Real & Find (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: float
") ChangeFind;
		Standard_Real & ChangeFind (const TopoDS_Shape & K);
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


%nodefaultctor BRepMesh_DataMapOfVertexInteger;
class BRepMesh_DataMapOfVertexInteger : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") BRepMesh_DataMapOfVertexInteger;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") BRepMesh_DataMapOfVertexInteger;
		 BRepMesh_DataMapOfVertexInteger (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: BRepMesh_DataMapOfVertexInteger &
	:rtype: BRepMesh_DataMapOfVertexInteger
") Assign;
		BRepMesh_DataMapOfVertexInteger & Assign (const BRepMesh_DataMapOfVertexInteger & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: BRepMesh_DataMapOfVertexInteger &
	:rtype: BRepMesh_DataMapOfVertexInteger
") operator=;
		BRepMesh_DataMapOfVertexInteger & operator = (const BRepMesh_DataMapOfVertexInteger & Other);
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
	:type K: TopoDS_Vertex &
	:param I:
	:type I: int &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TopoDS_Vertex & K,const Standard_Integer & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Vertex &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const TopoDS_Vertex & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Vertex &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const TopoDS_Vertex & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Vertex &
	:rtype: int
") Find;
		const Standard_Integer & Find (const TopoDS_Vertex & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Vertex &
	:rtype: int
") ChangeFind;
		Standard_Integer & ChangeFind (const TopoDS_Vertex & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Vertex &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const TopoDS_Vertex & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Vertex &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Vertex & K);
};


%nodefaultctor BRepMesh_DataStructureOfDelaun;
class BRepMesh_DataStructureOfDelaun : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") BRepMesh_DataStructureOfDelaun;
		%feature("autodoc", "	* <NodeNumber> is just an evaluation of the presumed number of nodes in this mesh. The Mesh data structure will be automatically redimensioned if necessary.

	:param theAllocator:
	:type theAllocator: BRepMesh_BaseAllocator &
	:param NodeNumber: default value is 100
	:type NodeNumber: int
	:rtype: None
") BRepMesh_DataStructureOfDelaun;
		 BRepMesh_DataStructureOfDelaun (const BRepMesh_BaseAllocator & theAllocator,const Standard_Integer NodeNumber = 100);
		%feature("compactdefaultargs") AddNode;
		%feature("autodoc", "	* Adds a node to the mesh if the node is not already in the Mesh. Returns the index of the node in the structure.

	:param theNode:
	:type theNode: BRepMesh_Vertex &
	:rtype: int
") AddNode;
		Standard_Integer AddNode (const BRepMesh_Vertex & theNode);
		%feature("compactdefaultargs") GetNode;
		%feature("autodoc", "	* Get the value of node <Index>.

	:param Index:
	:type Index: int
	:rtype: BRepMesh_Vertex
") GetNode;
		const BRepMesh_Vertex & GetNode (const Standard_Integer Index);
		%feature("compactdefaultargs") GetNodeList;
		%feature("autodoc", "	* Get the list of node <Index>.

	:param Index:
	:type Index: int
	:rtype: BRepMesh_ListOfInteger
") GetNodeList;
		const BRepMesh_ListOfInteger & GetNodeList (const Standard_Integer Index);
		%feature("compactdefaultargs") ForceRemoveNode;
		%feature("autodoc", "	* Removes the node of index <index> from the mesh.

	:param Index:
	:type Index: int
	:rtype: None
") ForceRemoveNode;
		void ForceRemoveNode (const Standard_Integer Index);
		%feature("compactdefaultargs") ForceRemoveLink;
		%feature("autodoc", "	* Removes the link of index <index> from the mesh.

	:param Index:
	:type Index: int
	:rtype: None
") ForceRemoveLink;
		void ForceRemoveLink (const Standard_Integer Index);
		%feature("compactdefaultargs") ReplaceNodes;
		%feature("autodoc", "	* Removes the all nodes and sets new map of nodes from the mesh. For internal use only.

	:param NewNodes:
	:type NewNodes: BRepMesh_VertexTool &
	:rtype: None
") ReplaceNodes;
		void ReplaceNodes (const BRepMesh_VertexTool & NewNodes);
		%feature("compactdefaultargs") RemoveNode;
		%feature("autodoc", "	* Removes the node of index <index> from the mesh.

	:param Index:
	:type Index: int
	:rtype: None
") RemoveNode;
		void RemoveNode (const Standard_Integer Index);
		%feature("compactdefaultargs") MoveNode;
		%feature("autodoc", "	* Changes the UV value of node of index <Index> by <newNode>. Returns false if <newnode> is already in the structure.

	:param Index:
	:type Index: int
	:param newNode:
	:type newNode: BRepMesh_Vertex &
	:rtype: bool
") MoveNode;
		Standard_Boolean MoveNode (const Standard_Integer Index,const BRepMesh_Vertex & newNode);
		%feature("compactdefaultargs") NbNodes;
		%feature("autodoc", "	* Gives the number of nodes in this mesh.

	:rtype: int
") NbNodes;
		Standard_Integer NbNodes ();
		%feature("compactdefaultargs") AddLink;
		%feature("autodoc", "	* Adds a Link to the mesh if the Link is not already in the structure. Returns the index of the link in the structure.

	:param theLink:
	:type theLink: BRepMesh_Edge &
	:rtype: int
") AddLink;
		Standard_Integer AddLink (const BRepMesh_Edge & theLink);
		%feature("compactdefaultargs") GetLink;
		%feature("autodoc", "	* Get the value of Link <Index>.

	:param Index:
	:type Index: int
	:rtype: BRepMesh_Edge
") GetLink;
		const BRepMesh_Edge & GetLink (const Standard_Integer Index);
		%feature("compactdefaultargs") RemoveLink;
		%feature("autodoc", "	* Removes the Link of index <Index> from the mesh.

	:param Index:
	:type Index: int
	:rtype: None
") RemoveLink;
		void RemoveLink (const Standard_Integer Index);
		%feature("compactdefaultargs") SubstituteLink;
		%feature("autodoc", "	* Substitutes the Link of index <Index> by <newLink> clear the connectivity.

	:param Index:
	:type Index: int
	:param newLink:
	:type newLink: BRepMesh_Edge &
	:rtype: bool
") SubstituteLink;
		Standard_Boolean SubstituteLink (const Standard_Integer Index,const BRepMesh_Edge & newLink);
		%feature("compactdefaultargs") NbLinks;
		%feature("autodoc", "	* Gives the number of elements in this mesh.

	:rtype: int
") NbLinks;
		Standard_Integer NbLinks ();
		%feature("compactdefaultargs") AddElement;
		%feature("autodoc", "	* Adds an element to the mesh if it is not already in the Mesh. Returns the index of the element in the structure.

	:param theElement:
	:type theElement: BRepMesh_Triangle &
	:rtype: int
") AddElement;
		Standard_Integer AddElement (const BRepMesh_Triangle & theElement);
		%feature("compactdefaultargs") GetElement;
		%feature("autodoc", "	* Get the value of Element <Index>.

	:param Index:
	:type Index: int
	:rtype: BRepMesh_Triangle
") GetElement;
		const BRepMesh_Triangle & GetElement (const Standard_Integer Index);
		%feature("compactdefaultargs") RemoveElement;
		%feature("autodoc", "	* Removes the element of index <Index> in the mesh.

	:param Index:
	:type Index: int
	:rtype: None
") RemoveElement;
		void RemoveElement (const Standard_Integer Index);
		%feature("compactdefaultargs") SubstituteElement;
		%feature("autodoc", "	* Substitutes the element of index <Index> by <newElement>. The links connectivity is updated.

	:param Index:
	:type Index: int
	:param newElement:
	:type newElement: BRepMesh_Triangle &
	:rtype: bool
") SubstituteElement;
		Standard_Boolean SubstituteElement (const Standard_Integer Index,const BRepMesh_Triangle & newElement);
		%feature("compactdefaultargs") NbElements;
		%feature("autodoc", "	* Gives the number of elements in this mesh.

	:rtype: int
") NbElements;
		Standard_Integer NbElements ();
		%feature("compactdefaultargs") ClearDomain;
		%feature("autodoc", "	* Removes all elements

	:rtype: None
") ClearDomain;
		void ClearDomain ();
		%feature("compactdefaultargs") IndexOf;
		%feature("autodoc", "	* Finds the index of the node. Returns 0 if the node is not in the mesh.

	:param aNode:
	:type aNode: BRepMesh_Vertex &
	:rtype: int
") IndexOf;
		Standard_Integer IndexOf (const BRepMesh_Vertex & aNode);
		%feature("compactdefaultargs") IndexOf;
		%feature("autodoc", "	* Finds the index of the Link. Returns 0 if the Link is not in the mesh.

	:param aLink:
	:type aLink: BRepMesh_Edge &
	:rtype: int
") IndexOf;
		Standard_Integer IndexOf (const BRepMesh_Edge & aLink);
		%feature("compactdefaultargs") IndexOf;
		%feature("autodoc", "	* Finds the index of the Element. Returns 0 if the Element is not in the mesh.

	:param anElement:
	:type anElement: BRepMesh_Triangle &
	:rtype: int
") IndexOf;
		Standard_Integer IndexOf (const BRepMesh_Triangle & anElement);
		%feature("compactdefaultargs") LinkNeighboursOf;
		%feature("autodoc", "	* Gives the list of Link's indices handling the node <theNode>.

	:param theNode:
	:type theNode: int
	:rtype: BRepMesh_ListOfInteger
") LinkNeighboursOf;
		const BRepMesh_ListOfInteger & LinkNeighboursOf (const Standard_Integer theNode);
		%feature("compactdefaultargs") ElemConnectedTo;
		%feature("autodoc", "	* Gives the element's indices conected to <theLink>.

	:param theLink:
	:type theLink: int
	:rtype: BRepMesh_PairOfIndex
") ElemConnectedTo;
		const BRepMesh_PairOfIndex & ElemConnectedTo (const Standard_Integer theLink);
		%feature("compactdefaultargs") ElemOfDomain;
		%feature("autodoc", "	* Gives the list of element's indices

	:rtype: BRepMesh_MapOfInteger
") ElemOfDomain;
		const BRepMesh_MapOfInteger & ElemOfDomain ();
		%feature("compactdefaultargs") LinkOfDomain;
		%feature("autodoc", "	* Gives the list of link's indices

	:rtype: BRepMesh_MapOfInteger
") LinkOfDomain;
		const BRepMesh_MapOfInteger & LinkOfDomain ();
		%feature("compactdefaultargs") ClearDeleted;
		%feature("autodoc", "	* This method substitute the deleted items by the last in Indexed Data Maps to have only non-deleted elements, links or nodes in the structure.

	:rtype: None
") ClearDeleted;
		void ClearDeleted ();

        %feature("autodoc", "1");
        %extend{
            std::string StatisticsToString() {
            std::stringstream s;
            self->Statistics(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") Allocator;
		%feature("autodoc", "	:rtype: BRepMesh_BaseAllocator
") Allocator;
		const BRepMesh_BaseAllocator & Allocator ();
		%feature("compactdefaultargs") Data;
		%feature("autodoc", "	* Give the data structure for cell size and tolerance initialization.

	:rtype: BRepMesh_VertexTool
") Data;
		BRepMesh_VertexTool & Data ();
};


%extend BRepMesh_DataStructureOfDelaun {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepMesh_DataStructureOfDelaun(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepMesh_DataStructureOfDelaun::Handle_BRepMesh_DataStructureOfDelaun %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor BRepMesh_Delaun;
class BRepMesh_Delaun {
	public:
		%feature("compactdefaultargs") BRepMesh_Delaun;
		%feature("autodoc", "	* Creates the triangulation with an empty Mesh data structure.

	:param theVertices:
	:type theVertices: BRepMesh_Array1OfVertexOfDelaun &
	:param isPositive: default value is Standard_True
	:type isPositive: bool
	:rtype: None
") BRepMesh_Delaun;
		 BRepMesh_Delaun (BRepMesh_Array1OfVertexOfDelaun & theVertices,const Standard_Boolean isPositive = Standard_True);
		%feature("compactdefaultargs") BRepMesh_Delaun;
		%feature("autodoc", "	* Creates the triangulation with and existent Mesh data structure.

	:param theOldMesh:
	:type theOldMesh: Handle_BRepMesh_DataStructureOfDelaun &
	:param theVertices:
	:type theVertices: BRepMesh_Array1OfVertexOfDelaun &
	:param isPositive: default value is Standard_True
	:type isPositive: bool
	:rtype: None
") BRepMesh_Delaun;
		 BRepMesh_Delaun (const Handle_BRepMesh_DataStructureOfDelaun & theOldMesh,BRepMesh_Array1OfVertexOfDelaun & theVertices,const Standard_Boolean isPositive = Standard_True);
		%feature("compactdefaultargs") BRepMesh_Delaun;
		%feature("autodoc", "	* Creates the triangulation with and existant Mesh data structure.

	:param theOldMesh:
	:type theOldMesh: Handle_BRepMesh_DataStructureOfDelaun &
	:param theVertexIndices:
	:type theVertexIndices: TColStd_Array1OfInteger &
	:param isPositive: default value is Standard_True
	:type isPositive: bool
	:rtype: None
") BRepMesh_Delaun;
		 BRepMesh_Delaun (const Handle_BRepMesh_DataStructureOfDelaun & theOldMesh,TColStd_Array1OfInteger & theVertexIndices,const Standard_Boolean isPositive = Standard_True);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initializes the triangulation with an array of vertices.

	:param theVertices:
	:type theVertices: BRepMesh_Array1OfVertexOfDelaun &
	:rtype: None
") Init;
		void Init (BRepMesh_Array1OfVertexOfDelaun & theVertices);
		%feature("compactdefaultargs") RemoveVertex;
		%feature("autodoc", "	* Removes a vertex from the triangulation.

	:param theVertex:
	:type theVertex: BRepMesh_Vertex &
	:rtype: None
") RemoveVertex;
		void RemoveVertex (const BRepMesh_Vertex & theVertex);
		%feature("compactdefaultargs") AddVertices;
		%feature("autodoc", "	* Adds some vertices into the triangulation.

	:param theVertices:
	:type theVertices: BRepMesh_Array1OfVertexOfDelaun &
	:rtype: None
") AddVertices;
		void AddVertices (BRepMesh_Array1OfVertexOfDelaun & theVertices);
		%feature("compactdefaultargs") UseEdge;
		%feature("autodoc", "	* Modify mesh to use the edge. Return True if done.

	:param theEdge:
	:type theEdge: int
	:rtype: bool
") UseEdge;
		Standard_Boolean UseEdge (const Standard_Integer theEdge);
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "	* Gives the Mesh data structure.

	:rtype: Handle_BRepMesh_DataStructureOfDelaun
") Result;
		Handle_BRepMesh_DataStructureOfDelaun Result ();
		%feature("compactdefaultargs") GetVertex;
		%feature("autodoc", "	* Gives vertex with the given index

	:param theIndex:
	:type theIndex: int
	:rtype: inline  BRepMesh_Vertex
") GetVertex;
		inline const BRepMesh_Vertex & GetVertex (const Standard_Integer theIndex);
		%feature("compactdefaultargs") GetEdge;
		%feature("autodoc", "	* Gives edge with the given index

	:param theIndex:
	:type theIndex: int
	:rtype: inline  BRepMesh_Edge
") GetEdge;
		inline const BRepMesh_Edge & GetEdge (const Standard_Integer theIndex);
		%feature("compactdefaultargs") GetTriangle;
		%feature("autodoc", "	* Gives triangle with the given index

	:param theIndex:
	:type theIndex: int
	:rtype: inline  BRepMesh_Triangle
") GetTriangle;
		inline const BRepMesh_Triangle & GetTriangle (const Standard_Integer theIndex);
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	* Test is the given triangle contains the given vertex. If <theEdgeOn> != 0 the vertex lies onto the edge index returned through this parameter.

	:param theTriangleId:
	:type theTriangleId: int
	:param theVertex:
	:type theVertex: BRepMesh_Vertex &
	:param theEdgeOn:
	:type theEdgeOn: int &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Standard_Integer theTriangleId,const BRepMesh_Vertex & theVertex,Standard_Integer &OutValue);
};


%nodefaultctor BRepMesh_DiscretRoot;
class BRepMesh_DiscretRoot : public Standard_Transient {
	public:
		%feature("compactdefaultargs") SetDeflection;
		%feature("autodoc", "	* Setup linear deflection.

	:param theDeflection:
	:type theDeflection: float
	:rtype: None
") SetDeflection;
		void SetDeflection (const Standard_Real theDeflection);
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "	* Returns linear deflection.

	:rtype: float
") Deflection;
		Standard_Real Deflection ();
		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", "	* Setup angular deflection.

	:param theAngle:
	:type theAngle: float
	:rtype: None
") SetAngle;
		void SetAngle (const Standard_Real theAngle);
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "	* Returns angular deflection.

	:rtype: float
") Angle;
		Standard_Real Angle ();
		%feature("compactdefaultargs") SetShape;
		%feature("autodoc", "	* Set the shape to triangulate.

	:param theShape:
	:type theShape: TopoDS_Shape &
	:rtype: None
") SetShape;
		void SetShape (const TopoDS_Shape & theShape);
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Shape;
		const TopoDS_Shape  Shape ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Compute triangulation for set shape.

	:rtype: void
") Perform;
		virtual void Perform ();
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns true if triangualtion was performed and has success.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
};


%extend BRepMesh_DiscretRoot {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepMesh_DiscretRoot(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepMesh_DiscretRoot::Handle_BRepMesh_DiscretRoot %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor BRepMesh_Edge;
class BRepMesh_Edge {
	public:
		%feature("compactdefaultargs") BRepMesh_Edge;
		%feature("autodoc", "	:rtype: None
") BRepMesh_Edge;
		 BRepMesh_Edge ();
		%feature("compactdefaultargs") BRepMesh_Edge;
		%feature("autodoc", "	* Contructs a link beetween to vertices.

	:param vDebut:
	:type vDebut: int
	:param vFin:
	:type vFin: int
	:param canMove:
	:type canMove: BRepMesh_DegreeOfFreedom
	:rtype: None
") BRepMesh_Edge;
		 BRepMesh_Edge (const Standard_Integer vDebut,const Standard_Integer vFin,const BRepMesh_DegreeOfFreedom canMove);
		%feature("compactdefaultargs") FirstNode;
		%feature("autodoc", "	* Give the index of first node of the Link.

	:rtype: int
") FirstNode;
		Standard_Integer FirstNode ();
		%feature("compactdefaultargs") LastNode;
		%feature("autodoc", "	* Give the index of Last node of the Link.

	:rtype: int
") LastNode;
		Standard_Integer LastNode ();
		%feature("compactdefaultargs") Movability;
		%feature("autodoc", "	:rtype: BRepMesh_DegreeOfFreedom
") Movability;
		BRepMesh_DegreeOfFreedom Movability ();
		%feature("compactdefaultargs") SetMovability;
		%feature("autodoc", "	:param Move:
	:type Move: BRepMesh_DegreeOfFreedom
	:rtype: None
") SetMovability;
		void SetMovability (const BRepMesh_DegreeOfFreedom Move);
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "	:param Upper:
	:type Upper: int
	:rtype: int
") HashCode;
		Standard_Integer HashCode (const Standard_Integer Upper);

        %extend {
            Standard_Integer __hash__() {
            return $self->HashCode(2147483647);
            }
        };
        		%feature("compactdefaultargs") SameOrientation;
		%feature("autodoc", "	:param Other:
	:type Other: BRepMesh_Edge &
	:rtype: bool
") SameOrientation;
		Standard_Boolean SameOrientation (const BRepMesh_Edge & Other);
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	:param Other:
	:type Other: BRepMesh_Edge &
	:rtype: bool
") IsEqual;
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


class BRepMesh_ElemHasherOfDataStructureOfDelaun {
	public:
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "	:param K:
	:type K: BRepMesh_Triangle &
	:param Upper:
	:type Upper: int
	:rtype: int
") HashCode;
		static Standard_Integer HashCode (const BRepMesh_Triangle & K,const Standard_Integer Upper);
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	:param K1:
	:type K1: BRepMesh_Triangle &
	:param K2:
	:type K2: BRepMesh_Triangle &
	:rtype: bool
") IsEqual;
		static Standard_Boolean IsEqual (const BRepMesh_Triangle & K1,const BRepMesh_Triangle & K2);
};


%nodefaultctor BRepMesh_FaceAttribute;
class BRepMesh_FaceAttribute : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") BRepMesh_FaceAttribute;
		%feature("autodoc", "	:rtype: None
") BRepMesh_FaceAttribute;
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
            		%feature("compactdefaultargs") GetClassifier;
		%feature("autodoc", "	:rtype: BRepMesh_ClassifierPtr
") GetClassifier;
		BRepMesh_ClassifierPtr & GetClassifier ();
};


%extend BRepMesh_FaceAttribute {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepMesh_FaceAttribute(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepMesh_FaceAttribute::Handle_BRepMesh_FaceAttribute %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor BRepMesh_FastDiscret;
class BRepMesh_FastDiscret : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") BRepMesh_FastDiscret;
		%feature("autodoc", "	:param defle:
	:type defle: float
	:param angle:
	:type angle: float
	:param B:
	:type B: Bnd_Box &
	:param withShare: default value is Standard_True
	:type withShare: bool
	:param inshape: default value is Standard_False
	:type inshape: bool
	:param relative: default value is Standard_False
	:type relative: bool
	:param shapetrigu: default value is Standard_False
	:type shapetrigu: bool
	:rtype: None
") BRepMesh_FastDiscret;
		 BRepMesh_FastDiscret (const Standard_Real defle,const Standard_Real angle,const Bnd_Box & B,const Standard_Boolean withShare = Standard_True,const Standard_Boolean inshape = Standard_False,const Standard_Boolean relative = Standard_False,const Standard_Boolean shapetrigu = Standard_False);
		%feature("compactdefaultargs") BRepMesh_FastDiscret;
		%feature("autodoc", "	* if the boolean <relative> is True, the deflection used for the polygonalisation of each edge will be <defle> * Size of Edge. the deflection used for the faces will be the maximum deflection of their edges.  if <shapetrigu> is True, the triangulation, if exists with a correct deflection, can be used to re-triangulate the shape.  if <inshape> is True, the calculated triangulation will be stored in the shape.

	:param defle:
	:type defle: float
	:param shape:
	:type shape: TopoDS_Shape &
	:param B:
	:type B: Bnd_Box &
	:param angle:
	:type angle: float
	:param withShare: default value is Standard_True
	:type withShare: bool
	:param inshape: default value is Standard_False
	:type inshape: bool
	:param relative: default value is Standard_False
	:type relative: bool
	:param shapetrigu: default value is Standard_False
	:type shapetrigu: bool
	:rtype: None
") BRepMesh_FastDiscret;
		 BRepMesh_FastDiscret (const Standard_Real defle,const TopoDS_Shape & shape,const Bnd_Box & B,const Standard_Real angle,const Standard_Boolean withShare = Standard_True,const Standard_Boolean inshape = Standard_False,const Standard_Boolean relative = Standard_False,const Standard_Boolean shapetrigu = Standard_False);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Build triangulation on the whole shape

	:param shape:
	:type shape: TopoDS_Shape &
	:rtype: None
") Perform;
		void Perform (const TopoDS_Shape & shape);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Record a face for further processing.

	:param face:
	:type face: TopoDS_Face &
	:param ancestor:
	:type ancestor: TopTools_IndexedDataMapOfShapeListOfShape &
	:rtype: None
") Add;
		void Add (const TopoDS_Face & face,const TopTools_IndexedDataMapOfShapeListOfShape & ancestor);
		%feature("compactdefaultargs") Process;
		%feature("autodoc", "	* Triangulate a face previously recorded for processing by call to Add(). Can be executed in parallel threads.

	:param face:
	:type face: TopoDS_Face &
	:rtype: None
") Process;
		void Process (const TopoDS_Face & face);
		%feature("compactdefaultargs") CurrentFaceStatus;
		%feature("autodoc", "	:rtype: BRepMesh_Status
") CurrentFaceStatus;
		BRepMesh_Status CurrentFaceStatus ();
		%feature("compactdefaultargs") RelativeEdgeDeflection;
		%feature("autodoc", "	* Returns computed relative deflection for edge

	:param edge:
	:type edge: TopoDS_Edge &
	:param defle:
	:type defle: float
	:param dtotale:
	:type dtotale: float
	:param cdef:
	:type cdef: float &
	:rtype: float
") RelativeEdgeDeflection;
		static Standard_Real RelativeEdgeDeflection (const TopoDS_Edge & edge,const Standard_Real defle,const Standard_Real dtotale,Standard_Real &OutValue);
		%feature("compactdefaultargs") BoxMaxDimension;
		%feature("autodoc", "	* Returns the maximal dimension of Bnd_Box

	:param box:
	:type box: Bnd_Box &
	:param maxdim:
	:type maxdim: float &
	:rtype: void
") BoxMaxDimension;
		static void BoxMaxDimension (const Bnd_Box & box,Standard_Real &OutValue);
		%feature("compactdefaultargs") SetParallel;
		%feature("autodoc", "	* Request algorithm to launch in multiple threads to improve performance (should be supported by plugin).

	:param theInParallel:
	:type theInParallel: bool
	:rtype: None
") SetParallel;
		void SetParallel (const Standard_Boolean theInParallel);
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "	* Returns the multi-threading usage flag.

	:rtype: bool
") IsParallel;
		Standard_Boolean IsParallel ();
		%feature("compactdefaultargs") CreateMutexesForSubShapes;
		%feature("autodoc", "	* Creates mutexes for each sub-shape of type theType in theShape. Used to avoid data races.

	:param theShape:
	:type theShape: TopoDS_Shape &
	:param theType:
	:type theType: TopAbs_ShapeEnum
	:rtype: None
") CreateMutexesForSubShapes;
		void CreateMutexesForSubShapes (const TopoDS_Shape & theShape,const TopAbs_ShapeEnum theType);
		%feature("compactdefaultargs") RemoveAllMutexes;
		%feature("autodoc", "	* Removes all created mutexes

	:rtype: None
") RemoveAllMutexes;
		void RemoveAllMutexes ();
		%feature("compactdefaultargs") NbTriangles;
		%feature("autodoc", "	* Gives the number of built triangles.

	:rtype: int
") NbTriangles;
		Standard_Integer NbTriangles ();
		%feature("compactdefaultargs") Triangle;
		%feature("autodoc", "	* Gives the triangle of <Index>.

	:param Index:
	:type Index: int
	:rtype: BRepMesh_Triangle
") Triangle;
		const BRepMesh_Triangle & Triangle (const Standard_Integer Index);
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "	* Gives the number of built Edges

	:rtype: int
") NbEdges;
		Standard_Integer NbEdges ();
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "	* Gives the edge of index <Index>.

	:param Index:
	:type Index: int
	:rtype: BRepMesh_Edge
") Edge;
		const BRepMesh_Edge & Edge (const Standard_Integer Index);
		%feature("compactdefaultargs") NbVertices;
		%feature("autodoc", "	* Gives the number of built Vertices.

	:rtype: int
") NbVertices;
		Standard_Integer NbVertices ();
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "	* Gives the vertex of <Index>.

	:param Index:
	:type Index: int
	:rtype: BRepMesh_Vertex
") Vertex;
		const BRepMesh_Vertex & Vertex (const Standard_Integer Index);
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "	* Gives the location3d of the vertex of <Index>.

	:param Index:
	:type Index: int
	:rtype: gp_Pnt
") Pnt;
		const gp_Pnt  Pnt (const Standard_Integer Index);
		%feature("compactdefaultargs") VerticesOfDomain;
		%feature("autodoc", "	* Gives the list of indices of the vertices

	:param Indices:
	:type Indices: BRepMesh_MapOfInteger &
	:rtype: None
") VerticesOfDomain;
		void VerticesOfDomain (BRepMesh_MapOfInteger & Indices);
		%feature("compactdefaultargs") EdgesOfDomain;
		%feature("autodoc", "	* Gives the list of indices of the edges

	:param Indices:
	:type Indices: BRepMesh_MapOfInteger &
	:rtype: None
") EdgesOfDomain;
		void EdgesOfDomain (BRepMesh_MapOfInteger & Indices);
		%feature("compactdefaultargs") TrianglesOfDomain;
		%feature("autodoc", "	* Gives the list of indices of the triangles

	:param Indices:
	:type Indices: BRepMesh_MapOfInteger &
	:rtype: None
") TrianglesOfDomain;
		void TrianglesOfDomain (BRepMesh_MapOfInteger & Indices);
		%feature("compactdefaultargs") NbPoint3d;
		%feature("autodoc", "	* Gives the number of different location in 3d space. It is different of the number of vertices if there is more than one surface. Even for one surface, the number can be different if an edge is shared.

	:rtype: int
") NbPoint3d;
		Standard_Integer NbPoint3d ();
		%feature("compactdefaultargs") Point3d;
		%feature("autodoc", "	* Gives the 3d space location of the vertex <Index>.

	:param Index:
	:type Index: int
	:rtype: gp_Pnt
") Point3d;
		const gp_Pnt  Point3d (const Standard_Integer Index);
		%feature("compactdefaultargs") GetDeflection;
		%feature("autodoc", "	* returns the deflection value.

	:rtype: float
") GetDeflection;
		Standard_Real GetDeflection ();
		%feature("compactdefaultargs") GetAngle;
		%feature("autodoc", "	* returns the deflection value.

	:rtype: float
") GetAngle;
		Standard_Real GetAngle ();
		%feature("compactdefaultargs") WithShare;
		%feature("autodoc", "	:rtype: bool
") WithShare;
		Standard_Boolean WithShare ();
		%feature("compactdefaultargs") InShape;
		%feature("autodoc", "	:rtype: bool
") InShape;
		Standard_Boolean InShape ();
		%feature("compactdefaultargs") ShapeTrigu;
		%feature("autodoc", "	:rtype: bool
") ShapeTrigu;
		Standard_Boolean ShapeTrigu ();
		%feature("compactdefaultargs") GetFaceAttribute;
		%feature("autodoc", "	* returns the face deflection value.

	:param face:
	:type face: TopoDS_Face &
	:param fattrib:
	:type fattrib: Handle_BRepMesh_FaceAttribute &
	:rtype: bool
") GetFaceAttribute;
		Standard_Boolean GetFaceAttribute (const TopoDS_Face & face,Handle_BRepMesh_FaceAttribute & fattrib);
		%feature("compactdefaultargs") RemoveFaceAttribute;
		%feature("autodoc", "	* remove face attribute as useless to free locate memory

	:param face:
	:type face: TopoDS_Face &
	:rtype: None
") RemoveFaceAttribute;
		void RemoveFaceAttribute (const TopoDS_Face & face);
		%feature("compactdefaultargs") GetMapOfDefEdge;
		%feature("autodoc", "	:rtype: TopTools_DataMapOfShapeReal
") GetMapOfDefEdge;
		const TopTools_DataMapOfShapeReal & GetMapOfDefEdge ();
};


%extend BRepMesh_FastDiscret {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepMesh_FastDiscret(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepMesh_FastDiscret::Handle_BRepMesh_FastDiscret %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor BRepMesh_FastDiscretFace;
class BRepMesh_FastDiscretFace : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") BRepMesh_FastDiscretFace;
		%feature("autodoc", "	:param theAngle:
	:type theAngle: float
	:param theWithShare: default value is Standard_True
	:type theWithShare: bool
	:rtype: None
") BRepMesh_FastDiscretFace;
		 BRepMesh_FastDiscretFace (const Standard_Real theAngle,const Standard_Boolean theWithShare = Standard_True);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param theFace:
	:type theFace: TopoDS_Face &
	:param theAttrib:
	:type theAttrib: Handle_BRepMesh_FaceAttribute &
	:param theMapDefle:
	:type theMapDefle: TopTools_DataMapOfShapeReal &
	:param theMutexProvider:
	:type theMutexProvider: TopTools_MutexForShapeProvider &
	:rtype: None
") Add;
		void Add (const TopoDS_Face & theFace,const Handle_BRepMesh_FaceAttribute & theAttrib,const TopTools_DataMapOfShapeReal & theMapDefle,const TopTools_MutexForShapeProvider & theMutexProvider);
		%feature("compactdefaultargs") Control;
		%feature("autodoc", "	:param theCaro:
	:type theCaro: Handle_BRepAdaptor_HSurface &
	:param theDefFace:
	:type theDefFace: float
	:param theInternalV:
	:type theInternalV: BRepMesh_ListOfVertex &
	:param theBadTriangles:
	:type theBadTriangles: TColStd_ListOfInteger &
	:param theNulTriangles:
	:type theNulTriangles: TColStd_ListOfInteger &
	:param theTrigu:
	:type theTrigu: BRepMesh_Delaun &
	:param theIsFirst:
	:type theIsFirst: bool
	:rtype: float
") Control;
		Standard_Real Control (const Handle_BRepAdaptor_HSurface & theCaro,const Standard_Real theDefFace,BRepMesh_ListOfVertex & theInternalV,TColStd_ListOfInteger & theBadTriangles,TColStd_ListOfInteger & theNulTriangles,BRepMesh_Delaun & theTrigu,const Standard_Boolean theIsFirst);
		%feature("compactdefaultargs") FindUV;
		%feature("autodoc", "	:param theV:
	:type theV: TopoDS_Vertex &
	:param theXY:
	:type theXY: gp_Pnt2d
	:param theIp:
	:type theIp: int
	:param theSFace:
	:type theSFace: Handle_BRepAdaptor_HSurface &
	:param theMinDist:
	:type theMinDist: float
	:param theFaceAttribute:
	:type theFaceAttribute: Handle_BRepMesh_FaceAttribute &
	:param theLocation2dMap:
	:type theLocation2dMap: BRepMesh_DataMapOfIntegerListOfXY &
	:rtype: gp_XY
") FindUV;
		static gp_XY FindUV (const TopoDS_Vertex & theV,const gp_Pnt2d & theXY,const Standard_Integer theIp,const Handle_BRepAdaptor_HSurface & theSFace,const Standard_Real theMinDist,const Handle_BRepMesh_FaceAttribute & theFaceAttribute,BRepMesh_DataMapOfIntegerListOfXY & theLocation2dMap);
		%feature("compactdefaultargs") Triangle;
		%feature("autodoc", "	* Gives the triangle of <Index>.

	:param theIndex:
	:type theIndex: int
	:rtype: BRepMesh_Triangle
") Triangle;
		const BRepMesh_Triangle & Triangle (const Standard_Integer theIndex);
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "	* Gives the edge of index <Index>.

	:param theIndex:
	:type theIndex: int
	:rtype: BRepMesh_Edge
") Edge;
		const BRepMesh_Edge & Edge (const Standard_Integer theIndex);
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "	* Gives the vertex of <Index>.

	:param theIndex:
	:type theIndex: int
	:rtype: BRepMesh_Vertex
") Vertex;
		const BRepMesh_Vertex & Vertex (const Standard_Integer theIndex);
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "	* Gives the location3d of the vertex of <Index>.

	:param theIndex:
	:type theIndex: int
	:rtype: gp_Pnt
") Pnt;
		const gp_Pnt  Pnt (const Standard_Integer theIndex);
};


%extend BRepMesh_FastDiscretFace {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepMesh_FastDiscretFace(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepMesh_FastDiscretFace::Handle_BRepMesh_FastDiscretFace %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor BRepMesh_GeomTool;
class BRepMesh_GeomTool {
	public:
		%feature("compactdefaultargs") BRepMesh_GeomTool;
		%feature("autodoc", "	:param C:
	:type C: BRepAdaptor_Curve &
	:param Ufirst:
	:type Ufirst: float
	:param Ulast:
	:type Ulast: float
	:param AngDefl:
	:type AngDefl: float
	:param Deflection:
	:type Deflection: float
	:param nbpointsmin: default value is 2
	:type nbpointsmin: int
	:rtype: None
") BRepMesh_GeomTool;
		 BRepMesh_GeomTool (BRepAdaptor_Curve & C,const Standard_Real Ufirst,const Standard_Real Ulast,const Standard_Real AngDefl,const Standard_Real Deflection,const Standard_Integer nbpointsmin = 2);
		%feature("compactdefaultargs") BRepMesh_GeomTool;
		%feature("autodoc", "	:param S:
	:type S: Handle_BRepAdaptor_HSurface &
	:param ParamIso:
	:type ParamIso: float
	:param Type:
	:type Type: GeomAbs_IsoType
	:param Ufirst:
	:type Ufirst: float
	:param Ulast:
	:type Ulast: float
	:param AngDefl:
	:type AngDefl: float
	:param Deflection:
	:type Deflection: float
	:param nbpointsmin: default value is 2
	:type nbpointsmin: int
	:rtype: None
") BRepMesh_GeomTool;
		 BRepMesh_GeomTool (const Handle_BRepAdaptor_HSurface & S,const Standard_Real ParamIso,const GeomAbs_IsoType Type,const Standard_Real Ufirst,const Standard_Real Ulast,const Standard_Real AngDefl,const Standard_Real Deflection,const Standard_Integer nbpointsmin = 2);
		%feature("compactdefaultargs") AddPoint;
		%feature("autodoc", "	* Add point to already calculated points (or replace existing) Returns index of new added point or founded with parametric tolerance (replaced if theIsReplace is true)

	:param thePnt:
	:type thePnt: gp_Pnt
	:param theParam:
	:type theParam: float
	:param theIsReplace: default value is Standard_True
	:type theIsReplace: bool
	:rtype: int
") AddPoint;
		Standard_Integer AddPoint (const gp_Pnt & thePnt,const Standard_Real theParam,const Standard_Boolean theIsReplace = Standard_True);
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "	:rtype: int
") NbPoints;
		Standard_Integer NbPoints ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param IsoParam:
	:type IsoParam: float
	:param Index:
	:type Index: int
	:param W:
	:type W: float &
	:param P:
	:type P: gp_Pnt
	:param UV:
	:type UV: gp_Pnt2d
	:rtype: None
") Value;
		void Value (const Standard_Real IsoParam,const Standard_Integer Index,Standard_Real &OutValue,gp_Pnt & P,gp_Pnt2d & UV);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param C:
	:type C: BRepAdaptor_Curve &
	:param S:
	:type S: Handle_BRepAdaptor_HSurface &
	:param Index:
	:type Index: int
	:param W:
	:type W: float &
	:param P:
	:type P: gp_Pnt
	:param UV:
	:type UV: gp_Pnt2d
	:rtype: None
") Value;
		void Value (const BRepAdaptor_Curve & C,const Handle_BRepAdaptor_HSurface & S,const Standard_Integer Index,Standard_Real &OutValue,gp_Pnt & P,gp_Pnt2d & UV);
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	:param F:
	:type F: Handle_BRepAdaptor_HSurface &
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param P:
	:type P: gp_Pnt
	:rtype: void
") D0;
		static void D0 (const Handle_BRepAdaptor_HSurface & F,const Standard_Real U,const Standard_Real V,gp_Pnt & P);
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "	* return false if the normal can not be computed

	:param F:
	:type F: Handle_BRepAdaptor_HSurface &
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param P:
	:type P: gp_Pnt
	:param Nor:
	:type Nor: gp_Dir
	:rtype: bool
") Normal;
		static Standard_Boolean Normal (const Handle_BRepAdaptor_HSurface & F,const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Dir & Nor);
};


%nodefaultctor BRepMesh_HArray1OfVertexOfDelaun;
class BRepMesh_HArray1OfVertexOfDelaun : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") BRepMesh_HArray1OfVertexOfDelaun;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") BRepMesh_HArray1OfVertexOfDelaun;
		 BRepMesh_HArray1OfVertexOfDelaun (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") BRepMesh_HArray1OfVertexOfDelaun;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: BRepMesh_Vertex &
	:rtype: None
") BRepMesh_HArray1OfVertexOfDelaun;
		 BRepMesh_HArray1OfVertexOfDelaun (const Standard_Integer Low,const Standard_Integer Up,const BRepMesh_Vertex & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: BRepMesh_Vertex &
	:rtype: None
") Init;
		void Init (const BRepMesh_Vertex & V);
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
	:type Value: BRepMesh_Vertex &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const BRepMesh_Vertex & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: BRepMesh_Vertex
") Value;
		const BRepMesh_Vertex & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: BRepMesh_Vertex
") ChangeValue;
		BRepMesh_Vertex & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: BRepMesh_Array1OfVertexOfDelaun
") Array1;
		const BRepMesh_Array1OfVertexOfDelaun & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: BRepMesh_Array1OfVertexOfDelaun
") ChangeArray1;
		BRepMesh_Array1OfVertexOfDelaun & ChangeArray1 ();
};


%extend BRepMesh_HArray1OfVertexOfDelaun {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepMesh_HArray1OfVertexOfDelaun(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepMesh_HArray1OfVertexOfDelaun::Handle_BRepMesh_HArray1OfVertexOfDelaun %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

class BRepMesh_HeapSortIndexedVertexOfDelaun {
	public:
		%feature("compactdefaultargs") Sort;
		%feature("autodoc", "	:param TheArray:
	:type TheArray: TColStd_Array1OfInteger &
	:param Comp:
	:type Comp: BRepMesh_ComparatorOfIndexedVertexOfDelaun &
	:rtype: void
") Sort;
		static void Sort (TColStd_Array1OfInteger & TheArray,const BRepMesh_ComparatorOfIndexedVertexOfDelaun & Comp);
};


class BRepMesh_HeapSortVertexOfDelaun {
	public:
		%feature("compactdefaultargs") Sort;
		%feature("autodoc", "	:param TheArray:
	:type TheArray: BRepMesh_Array1OfVertexOfDelaun &
	:param Comp:
	:type Comp: BRepMesh_ComparatorOfVertexOfDelaun &
	:rtype: void
") Sort;
		static void Sort (BRepMesh_Array1OfVertexOfDelaun & TheArray,const BRepMesh_ComparatorOfVertexOfDelaun & Comp);
};


%nodefaultctor BRepMesh_IDMapOfLinkOfDataStructureOfDelaun;
class BRepMesh_IDMapOfLinkOfDataStructureOfDelaun : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") BRepMesh_IDMapOfLinkOfDataStructureOfDelaun;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") BRepMesh_IDMapOfLinkOfDataStructureOfDelaun;
		 BRepMesh_IDMapOfLinkOfDataStructureOfDelaun (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: BRepMesh_IDMapOfLinkOfDataStructureOfDelaun &
	:rtype: BRepMesh_IDMapOfLinkOfDataStructureOfDelaun
") Assign;
		BRepMesh_IDMapOfLinkOfDataStructureOfDelaun & Assign (const BRepMesh_IDMapOfLinkOfDataStructureOfDelaun & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: BRepMesh_IDMapOfLinkOfDataStructureOfDelaun &
	:rtype: BRepMesh_IDMapOfLinkOfDataStructureOfDelaun
") operator=;
		BRepMesh_IDMapOfLinkOfDataStructureOfDelaun & operator = (const BRepMesh_IDMapOfLinkOfDataStructureOfDelaun & Other);
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
	:type K: BRepMesh_Edge &
	:param I:
	:type I: BRepMesh_PairOfIndex &
	:rtype: int
") Add;
		Standard_Integer Add (const BRepMesh_Edge & K,const BRepMesh_PairOfIndex & I);
		%feature("compactdefaultargs") Substitute;
		%feature("autodoc", "	:param I:
	:type I: int
	:param K:
	:type K: BRepMesh_Edge &
	:param T:
	:type T: BRepMesh_PairOfIndex &
	:rtype: None
") Substitute;
		void Substitute (const Standard_Integer I,const BRepMesh_Edge & K,const BRepMesh_PairOfIndex & T);
		%feature("compactdefaultargs") RemoveLast;
		%feature("autodoc", "	:rtype: None
") RemoveLast;
		void RemoveLast ();
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	:param K:
	:type K: BRepMesh_Edge &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const BRepMesh_Edge & K);
		%feature("compactdefaultargs") FindKey;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: BRepMesh_Edge
") FindKey;
		const BRepMesh_Edge & FindKey (const Standard_Integer I);
		%feature("compactdefaultargs") FindFromIndex;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: BRepMesh_PairOfIndex
") FindFromIndex;
		const BRepMesh_PairOfIndex & FindFromIndex (const Standard_Integer I);
		%feature("compactdefaultargs") ChangeFromIndex;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: BRepMesh_PairOfIndex
") ChangeFromIndex;
		BRepMesh_PairOfIndex & ChangeFromIndex (const Standard_Integer I);
		%feature("compactdefaultargs") FindIndex;
		%feature("autodoc", "	:param K:
	:type K: BRepMesh_Edge &
	:rtype: int
") FindIndex;
		Standard_Integer FindIndex (const BRepMesh_Edge & K);
		%feature("compactdefaultargs") FindFromKey;
		%feature("autodoc", "	:param K:
	:type K: BRepMesh_Edge &
	:rtype: BRepMesh_PairOfIndex
") FindFromKey;
		const BRepMesh_PairOfIndex & FindFromKey (const BRepMesh_Edge & K);
		%feature("compactdefaultargs") ChangeFromKey;
		%feature("autodoc", "	:param K:
	:type K: BRepMesh_Edge &
	:rtype: BRepMesh_PairOfIndex
") ChangeFromKey;
		BRepMesh_PairOfIndex & ChangeFromKey (const BRepMesh_Edge & K);
		%feature("compactdefaultargs") FindFromKey1;
		%feature("autodoc", "	:param K:
	:type K: BRepMesh_Edge &
	:rtype: Standard_Address
") FindFromKey1;
		Standard_Address FindFromKey1 (const BRepMesh_Edge & K);
		%feature("compactdefaultargs") ChangeFromKey1;
		%feature("autodoc", "	:param K:
	:type K: BRepMesh_Edge &
	:rtype: Standard_Address
") ChangeFromKey1;
		Standard_Address ChangeFromKey1 (const BRepMesh_Edge & K);
};


%nodefaultctor BRepMesh_IDMapOfNodeOfDataStructureOfDelaun;
class BRepMesh_IDMapOfNodeOfDataStructureOfDelaun : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") BRepMesh_IDMapOfNodeOfDataStructureOfDelaun;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") BRepMesh_IDMapOfNodeOfDataStructureOfDelaun;
		 BRepMesh_IDMapOfNodeOfDataStructureOfDelaun (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: BRepMesh_IDMapOfNodeOfDataStructureOfDelaun &
	:rtype: BRepMesh_IDMapOfNodeOfDataStructureOfDelaun
") Assign;
		BRepMesh_IDMapOfNodeOfDataStructureOfDelaun & Assign (const BRepMesh_IDMapOfNodeOfDataStructureOfDelaun & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: BRepMesh_IDMapOfNodeOfDataStructureOfDelaun &
	:rtype: BRepMesh_IDMapOfNodeOfDataStructureOfDelaun
") operator=;
		BRepMesh_IDMapOfNodeOfDataStructureOfDelaun & operator = (const BRepMesh_IDMapOfNodeOfDataStructureOfDelaun & Other);
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
	:type K: BRepMesh_Vertex &
	:param I:
	:type I: BRepMesh_ListOfInteger &
	:rtype: int
") Add;
		Standard_Integer Add (const BRepMesh_Vertex & K,const BRepMesh_ListOfInteger & I);
		%feature("compactdefaultargs") Substitute;
		%feature("autodoc", "	:param I:
	:type I: int
	:param K:
	:type K: BRepMesh_Vertex &
	:param T:
	:type T: BRepMesh_ListOfInteger &
	:rtype: None
") Substitute;
		void Substitute (const Standard_Integer I,const BRepMesh_Vertex & K,const BRepMesh_ListOfInteger & T);
		%feature("compactdefaultargs") RemoveLast;
		%feature("autodoc", "	:rtype: None
") RemoveLast;
		void RemoveLast ();
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	:param K:
	:type K: BRepMesh_Vertex &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const BRepMesh_Vertex & K);
		%feature("compactdefaultargs") FindKey;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: BRepMesh_Vertex
") FindKey;
		const BRepMesh_Vertex & FindKey (const Standard_Integer I);
		%feature("compactdefaultargs") FindFromIndex;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: BRepMesh_ListOfInteger
") FindFromIndex;
		const BRepMesh_ListOfInteger & FindFromIndex (const Standard_Integer I);
		%feature("compactdefaultargs") ChangeFromIndex;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: BRepMesh_ListOfInteger
") ChangeFromIndex;
		BRepMesh_ListOfInteger & ChangeFromIndex (const Standard_Integer I);
		%feature("compactdefaultargs") FindIndex;
		%feature("autodoc", "	:param K:
	:type K: BRepMesh_Vertex &
	:rtype: int
") FindIndex;
		Standard_Integer FindIndex (const BRepMesh_Vertex & K);
		%feature("compactdefaultargs") FindFromKey;
		%feature("autodoc", "	:param K:
	:type K: BRepMesh_Vertex &
	:rtype: BRepMesh_ListOfInteger
") FindFromKey;
		const BRepMesh_ListOfInteger & FindFromKey (const BRepMesh_Vertex & K);
		%feature("compactdefaultargs") ChangeFromKey;
		%feature("autodoc", "	:param K:
	:type K: BRepMesh_Vertex &
	:rtype: BRepMesh_ListOfInteger
") ChangeFromKey;
		BRepMesh_ListOfInteger & ChangeFromKey (const BRepMesh_Vertex & K);
		%feature("compactdefaultargs") FindFromKey1;
		%feature("autodoc", "	:param K:
	:type K: BRepMesh_Vertex &
	:rtype: Standard_Address
") FindFromKey1;
		Standard_Address FindFromKey1 (const BRepMesh_Vertex & K);
		%feature("compactdefaultargs") ChangeFromKey1;
		%feature("autodoc", "	:param K:
	:type K: BRepMesh_Vertex &
	:rtype: Standard_Address
") ChangeFromKey1;
		Standard_Address ChangeFromKey1 (const BRepMesh_Vertex & K);
};


%nodefaultctor BRepMesh_IMapOfElementOfDataStructureOfDelaun;
class BRepMesh_IMapOfElementOfDataStructureOfDelaun : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") BRepMesh_IMapOfElementOfDataStructureOfDelaun;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") BRepMesh_IMapOfElementOfDataStructureOfDelaun;
		 BRepMesh_IMapOfElementOfDataStructureOfDelaun (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: BRepMesh_IMapOfElementOfDataStructureOfDelaun &
	:rtype: BRepMesh_IMapOfElementOfDataStructureOfDelaun
") Assign;
		BRepMesh_IMapOfElementOfDataStructureOfDelaun & Assign (const BRepMesh_IMapOfElementOfDataStructureOfDelaun & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: BRepMesh_IMapOfElementOfDataStructureOfDelaun &
	:rtype: BRepMesh_IMapOfElementOfDataStructureOfDelaun
") operator=;
		BRepMesh_IMapOfElementOfDataStructureOfDelaun & operator = (const BRepMesh_IMapOfElementOfDataStructureOfDelaun & Other);
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
	:type K: BRepMesh_Triangle &
	:rtype: int
") Add;
		Standard_Integer Add (const BRepMesh_Triangle & K);
		%feature("compactdefaultargs") Substitute;
		%feature("autodoc", "	:param I:
	:type I: int
	:param K:
	:type K: BRepMesh_Triangle &
	:rtype: None
") Substitute;
		void Substitute (const Standard_Integer I,const BRepMesh_Triangle & K);
		%feature("compactdefaultargs") RemoveLast;
		%feature("autodoc", "	:rtype: None
") RemoveLast;
		void RemoveLast ();
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	:param K:
	:type K: BRepMesh_Triangle &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const BRepMesh_Triangle & K);
		%feature("compactdefaultargs") FindKey;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: BRepMesh_Triangle
") FindKey;
		const BRepMesh_Triangle & FindKey (const Standard_Integer I);
		%feature("compactdefaultargs") FindIndex;
		%feature("autodoc", "	:param K:
	:type K: BRepMesh_Triangle &
	:rtype: int
") FindIndex;
		Standard_Integer FindIndex (const BRepMesh_Triangle & K);
};


%nodefaultctor BRepMesh_IndexedDataMapNodeOfIDMapOfLinkOfDataStructureOfDelaun;
class BRepMesh_IndexedDataMapNodeOfIDMapOfLinkOfDataStructureOfDelaun : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") BRepMesh_IndexedDataMapNodeOfIDMapOfLinkOfDataStructureOfDelaun;
		%feature("autodoc", "	:param K1:
	:type K1: BRepMesh_Edge &
	:param K2:
	:type K2: int
	:param I:
	:type I: BRepMesh_PairOfIndex &
	:param n1:
	:type n1: TCollection_MapNodePtr &
	:param n2:
	:type n2: TCollection_MapNodePtr &
	:rtype: None
") BRepMesh_IndexedDataMapNodeOfIDMapOfLinkOfDataStructureOfDelaun;
		 BRepMesh_IndexedDataMapNodeOfIDMapOfLinkOfDataStructureOfDelaun (const BRepMesh_Edge & K1,const Standard_Integer K2,const BRepMesh_PairOfIndex & I,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("compactdefaultargs") Key1;
		%feature("autodoc", "	:rtype: BRepMesh_Edge
") Key1;
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
            		%feature("compactdefaultargs") Next2;
		%feature("autodoc", "	:rtype: TCollection_MapNodePtr
") Next2;
		TCollection_MapNodePtr & Next2 ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: BRepMesh_PairOfIndex
") Value;
		BRepMesh_PairOfIndex & Value ();
};


%extend BRepMesh_IndexedDataMapNodeOfIDMapOfLinkOfDataStructureOfDelaun {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepMesh_IndexedDataMapNodeOfIDMapOfLinkOfDataStructureOfDelaun(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepMesh_IndexedDataMapNodeOfIDMapOfLinkOfDataStructureOfDelaun::Handle_BRepMesh_IndexedDataMapNodeOfIDMapOfLinkOfDataStructureOfDelaun %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor BRepMesh_IndexedDataMapNodeOfIDMapOfNodeOfDataStructureOfDelaun;
class BRepMesh_IndexedDataMapNodeOfIDMapOfNodeOfDataStructureOfDelaun : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") BRepMesh_IndexedDataMapNodeOfIDMapOfNodeOfDataStructureOfDelaun;
		%feature("autodoc", "	:param K1:
	:type K1: BRepMesh_Vertex &
	:param K2:
	:type K2: int
	:param I:
	:type I: BRepMesh_ListOfInteger &
	:param n1:
	:type n1: TCollection_MapNodePtr &
	:param n2:
	:type n2: TCollection_MapNodePtr &
	:rtype: None
") BRepMesh_IndexedDataMapNodeOfIDMapOfNodeOfDataStructureOfDelaun;
		 BRepMesh_IndexedDataMapNodeOfIDMapOfNodeOfDataStructureOfDelaun (const BRepMesh_Vertex & K1,const Standard_Integer K2,const BRepMesh_ListOfInteger & I,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("compactdefaultargs") Key1;
		%feature("autodoc", "	:rtype: BRepMesh_Vertex
") Key1;
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
            		%feature("compactdefaultargs") Next2;
		%feature("autodoc", "	:rtype: TCollection_MapNodePtr
") Next2;
		TCollection_MapNodePtr & Next2 ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: BRepMesh_ListOfInteger
") Value;
		BRepMesh_ListOfInteger & Value ();
};


%extend BRepMesh_IndexedDataMapNodeOfIDMapOfNodeOfDataStructureOfDelaun {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepMesh_IndexedDataMapNodeOfIDMapOfNodeOfDataStructureOfDelaun(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepMesh_IndexedDataMapNodeOfIDMapOfNodeOfDataStructureOfDelaun::Handle_BRepMesh_IndexedDataMapNodeOfIDMapOfNodeOfDataStructureOfDelaun %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor BRepMesh_IndexedMapNodeOfIMapOfElementOfDataStructureOfDelaun;
class BRepMesh_IndexedMapNodeOfIMapOfElementOfDataStructureOfDelaun : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") BRepMesh_IndexedMapNodeOfIMapOfElementOfDataStructureOfDelaun;
		%feature("autodoc", "	:param K1:
	:type K1: BRepMesh_Triangle &
	:param K2:
	:type K2: int
	:param n1:
	:type n1: TCollection_MapNodePtr &
	:param n2:
	:type n2: TCollection_MapNodePtr &
	:rtype: None
") BRepMesh_IndexedMapNodeOfIMapOfElementOfDataStructureOfDelaun;
		 BRepMesh_IndexedMapNodeOfIMapOfElementOfDataStructureOfDelaun (const BRepMesh_Triangle & K1,const Standard_Integer K2,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("compactdefaultargs") Key1;
		%feature("autodoc", "	:rtype: BRepMesh_Triangle
") Key1;
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
            		%feature("compactdefaultargs") Next2;
		%feature("autodoc", "	:rtype: TCollection_MapNodePtr
") Next2;
		TCollection_MapNodePtr & Next2 ();
};


%extend BRepMesh_IndexedMapNodeOfIMapOfElementOfDataStructureOfDelaun {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepMesh_IndexedMapNodeOfIMapOfElementOfDataStructureOfDelaun(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepMesh_IndexedMapNodeOfIMapOfElementOfDataStructureOfDelaun::Handle_BRepMesh_IndexedMapNodeOfIMapOfElementOfDataStructureOfDelaun %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor BRepMesh_IndexedMapNodeOfIndexedMapOfVertex;
class BRepMesh_IndexedMapNodeOfIndexedMapOfVertex : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") BRepMesh_IndexedMapNodeOfIndexedMapOfVertex;
		%feature("autodoc", "	:param K1:
	:type K1: BRepMesh_Vertex &
	:param K2:
	:type K2: int
	:param n1:
	:type n1: TCollection_MapNodePtr &
	:param n2:
	:type n2: TCollection_MapNodePtr &
	:rtype: None
") BRepMesh_IndexedMapNodeOfIndexedMapOfVertex;
		 BRepMesh_IndexedMapNodeOfIndexedMapOfVertex (const BRepMesh_Vertex & K1,const Standard_Integer K2,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("compactdefaultargs") Key1;
		%feature("autodoc", "	:rtype: BRepMesh_Vertex
") Key1;
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
            		%feature("compactdefaultargs") Next2;
		%feature("autodoc", "	:rtype: TCollection_MapNodePtr
") Next2;
		TCollection_MapNodePtr & Next2 ();
};


%extend BRepMesh_IndexedMapNodeOfIndexedMapOfVertex {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepMesh_IndexedMapNodeOfIndexedMapOfVertex(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepMesh_IndexedMapNodeOfIndexedMapOfVertex::Handle_BRepMesh_IndexedMapNodeOfIndexedMapOfVertex %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor BRepMesh_IndexedMapOfVertex;
class BRepMesh_IndexedMapOfVertex : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") BRepMesh_IndexedMapOfVertex;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") BRepMesh_IndexedMapOfVertex;
		 BRepMesh_IndexedMapOfVertex (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: BRepMesh_IndexedMapOfVertex &
	:rtype: BRepMesh_IndexedMapOfVertex
") Assign;
		BRepMesh_IndexedMapOfVertex & Assign (const BRepMesh_IndexedMapOfVertex & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: BRepMesh_IndexedMapOfVertex &
	:rtype: BRepMesh_IndexedMapOfVertex
") operator=;
		BRepMesh_IndexedMapOfVertex & operator = (const BRepMesh_IndexedMapOfVertex & Other);
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
	:type K: BRepMesh_Vertex &
	:rtype: int
") Add;
		Standard_Integer Add (const BRepMesh_Vertex & K);
		%feature("compactdefaultargs") Substitute;
		%feature("autodoc", "	:param I:
	:type I: int
	:param K:
	:type K: BRepMesh_Vertex &
	:rtype: None
") Substitute;
		void Substitute (const Standard_Integer I,const BRepMesh_Vertex & K);
		%feature("compactdefaultargs") RemoveLast;
		%feature("autodoc", "	:rtype: None
") RemoveLast;
		void RemoveLast ();
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	:param K:
	:type K: BRepMesh_Vertex &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const BRepMesh_Vertex & K);
		%feature("compactdefaultargs") FindKey;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: BRepMesh_Vertex
") FindKey;
		const BRepMesh_Vertex & FindKey (const Standard_Integer I);
		%feature("compactdefaultargs") FindIndex;
		%feature("autodoc", "	:param K:
	:type K: BRepMesh_Vertex &
	:rtype: int
") FindIndex;
		Standard_Integer FindIndex (const BRepMesh_Vertex & K);
};


class BRepMesh_LinkHasherOfDataStructureOfDelaun {
	public:
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "	:param K:
	:type K: BRepMesh_Edge &
	:param Upper:
	:type Upper: int
	:rtype: int
") HashCode;
		static Standard_Integer HashCode (const BRepMesh_Edge & K,const Standard_Integer Upper);
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	:param K1:
	:type K1: BRepMesh_Edge &
	:param K2:
	:type K2: BRepMesh_Edge &
	:rtype: bool
") IsEqual;
		static Standard_Boolean IsEqual (const BRepMesh_Edge & K1,const BRepMesh_Edge & K2);
};


%nodefaultctor BRepMesh_ListIteratorOfListOfVertex;
class BRepMesh_ListIteratorOfListOfVertex {
	public:
		%feature("compactdefaultargs") BRepMesh_ListIteratorOfListOfVertex;
		%feature("autodoc", "	:rtype: None
") BRepMesh_ListIteratorOfListOfVertex;
		 BRepMesh_ListIteratorOfListOfVertex ();
		%feature("compactdefaultargs") BRepMesh_ListIteratorOfListOfVertex;
		%feature("autodoc", "	:param L:
	:type L: BRepMesh_ListOfVertex &
	:rtype: None
") BRepMesh_ListIteratorOfListOfVertex;
		 BRepMesh_ListIteratorOfListOfVertex (const BRepMesh_ListOfVertex & L);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param L:
	:type L: BRepMesh_ListOfVertex &
	:rtype: None
") Initialize;
		void Initialize (const BRepMesh_ListOfVertex & L);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: BRepMesh_Vertex
") Value;
		BRepMesh_Vertex & Value ();
};


%nodefaultctor BRepMesh_ListIteratorOfListOfXY;
class BRepMesh_ListIteratorOfListOfXY {
	public:
		%feature("compactdefaultargs") BRepMesh_ListIteratorOfListOfXY;
		%feature("autodoc", "	:rtype: None
") BRepMesh_ListIteratorOfListOfXY;
		 BRepMesh_ListIteratorOfListOfXY ();
		%feature("compactdefaultargs") BRepMesh_ListIteratorOfListOfXY;
		%feature("autodoc", "	:param L:
	:type L: BRepMesh_ListOfXY &
	:rtype: None
") BRepMesh_ListIteratorOfListOfXY;
		 BRepMesh_ListIteratorOfListOfXY (const BRepMesh_ListOfXY & L);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param L:
	:type L: BRepMesh_ListOfXY &
	:rtype: None
") Initialize;
		void Initialize (const BRepMesh_ListOfXY & L);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: gp_XY
") Value;
		gp_XY  Value ();
};


%nodefaultctor BRepMesh_ListNodeOfListOfVertex;
class BRepMesh_ListNodeOfListOfVertex : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") BRepMesh_ListNodeOfListOfVertex;
		%feature("autodoc", "	:param I:
	:type I: BRepMesh_Vertex &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") BRepMesh_ListNodeOfListOfVertex;
		 BRepMesh_ListNodeOfListOfVertex (const BRepMesh_Vertex & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: BRepMesh_Vertex
") Value;
		BRepMesh_Vertex & Value ();
};


%extend BRepMesh_ListNodeOfListOfVertex {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepMesh_ListNodeOfListOfVertex(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepMesh_ListNodeOfListOfVertex::Handle_BRepMesh_ListNodeOfListOfVertex %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor BRepMesh_ListNodeOfListOfXY;
class BRepMesh_ListNodeOfListOfXY : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") BRepMesh_ListNodeOfListOfXY;
		%feature("autodoc", "	:param I:
	:type I: gp_XY
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") BRepMesh_ListNodeOfListOfXY;
		 BRepMesh_ListNodeOfListOfXY (const gp_XY & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: gp_XY
") Value;
		gp_XY  Value ();
};


%extend BRepMesh_ListNodeOfListOfXY {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepMesh_ListNodeOfListOfXY(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepMesh_ListNodeOfListOfXY::Handle_BRepMesh_ListNodeOfListOfXY %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor BRepMesh_ListOfVertex;
class BRepMesh_ListOfVertex {
	public:
		%feature("compactdefaultargs") BRepMesh_ListOfVertex;
		%feature("autodoc", "	:rtype: None
") BRepMesh_ListOfVertex;
		 BRepMesh_ListOfVertex ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: BRepMesh_ListOfVertex &
	:rtype: None
") Assign;
		void Assign (const BRepMesh_ListOfVertex & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: BRepMesh_ListOfVertex &
	:rtype: None
") operator=;
		void operator = (const BRepMesh_ListOfVertex & Other);
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
	:type I: BRepMesh_Vertex &
	:rtype: None
") Prepend;
		void Prepend (const BRepMesh_Vertex & I);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: BRepMesh_Vertex &
	:param theIt:
	:type theIt: BRepMesh_ListIteratorOfListOfVertex &
	:rtype: None
") Prepend;
		void Prepend (const BRepMesh_Vertex & I,BRepMesh_ListIteratorOfListOfVertex & theIt);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param Other:
	:type Other: BRepMesh_ListOfVertex &
	:rtype: None
") Prepend;
		void Prepend (BRepMesh_ListOfVertex & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: BRepMesh_Vertex &
	:rtype: None
") Append;
		void Append (const BRepMesh_Vertex & I);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: BRepMesh_Vertex &
	:param theIt:
	:type theIt: BRepMesh_ListIteratorOfListOfVertex &
	:rtype: None
") Append;
		void Append (const BRepMesh_Vertex & I,BRepMesh_ListIteratorOfListOfVertex & theIt);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param Other:
	:type Other: BRepMesh_ListOfVertex &
	:rtype: None
") Append;
		void Append (BRepMesh_ListOfVertex & Other);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: BRepMesh_Vertex
") First;
		BRepMesh_Vertex & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: BRepMesh_Vertex
") Last;
		BRepMesh_Vertex & Last ();
		%feature("compactdefaultargs") RemoveFirst;
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param It:
	:type It: BRepMesh_ListIteratorOfListOfVertex &
	:rtype: None
") Remove;
		void Remove (BRepMesh_ListIteratorOfListOfVertex & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param I:
	:type I: BRepMesh_Vertex &
	:param It:
	:type It: BRepMesh_ListIteratorOfListOfVertex &
	:rtype: None
") InsertBefore;
		void InsertBefore (const BRepMesh_Vertex & I,BRepMesh_ListIteratorOfListOfVertex & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Other:
	:type Other: BRepMesh_ListOfVertex &
	:param It:
	:type It: BRepMesh_ListIteratorOfListOfVertex &
	:rtype: None
") InsertBefore;
		void InsertBefore (BRepMesh_ListOfVertex & Other,BRepMesh_ListIteratorOfListOfVertex & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param I:
	:type I: BRepMesh_Vertex &
	:param It:
	:type It: BRepMesh_ListIteratorOfListOfVertex &
	:rtype: None
") InsertAfter;
		void InsertAfter (const BRepMesh_Vertex & I,BRepMesh_ListIteratorOfListOfVertex & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Other:
	:type Other: BRepMesh_ListOfVertex &
	:param It:
	:type It: BRepMesh_ListIteratorOfListOfVertex &
	:rtype: None
") InsertAfter;
		void InsertAfter (BRepMesh_ListOfVertex & Other,BRepMesh_ListIteratorOfListOfVertex & It);
};


%nodefaultctor BRepMesh_ListOfXY;
class BRepMesh_ListOfXY {
	public:
		%feature("compactdefaultargs") BRepMesh_ListOfXY;
		%feature("autodoc", "	:rtype: None
") BRepMesh_ListOfXY;
		 BRepMesh_ListOfXY ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: BRepMesh_ListOfXY &
	:rtype: None
") Assign;
		void Assign (const BRepMesh_ListOfXY & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: BRepMesh_ListOfXY &
	:rtype: None
") operator=;
		void operator = (const BRepMesh_ListOfXY & Other);
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
	:type I: gp_XY
	:rtype: None
") Prepend;
		void Prepend (const gp_XY & I);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: gp_XY
	:param theIt:
	:type theIt: BRepMesh_ListIteratorOfListOfXY &
	:rtype: None
") Prepend;
		void Prepend (const gp_XY & I,BRepMesh_ListIteratorOfListOfXY & theIt);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param Other:
	:type Other: BRepMesh_ListOfXY &
	:rtype: None
") Prepend;
		void Prepend (BRepMesh_ListOfXY & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: gp_XY
	:rtype: None
") Append;
		void Append (const gp_XY & I);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: gp_XY
	:param theIt:
	:type theIt: BRepMesh_ListIteratorOfListOfXY &
	:rtype: None
") Append;
		void Append (const gp_XY & I,BRepMesh_ListIteratorOfListOfXY & theIt);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param Other:
	:type Other: BRepMesh_ListOfXY &
	:rtype: None
") Append;
		void Append (BRepMesh_ListOfXY & Other);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: gp_XY
") First;
		gp_XY  First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: gp_XY
") Last;
		gp_XY  Last ();
		%feature("compactdefaultargs") RemoveFirst;
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param It:
	:type It: BRepMesh_ListIteratorOfListOfXY &
	:rtype: None
") Remove;
		void Remove (BRepMesh_ListIteratorOfListOfXY & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param I:
	:type I: gp_XY
	:param It:
	:type It: BRepMesh_ListIteratorOfListOfXY &
	:rtype: None
") InsertBefore;
		void InsertBefore (const gp_XY & I,BRepMesh_ListIteratorOfListOfXY & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Other:
	:type Other: BRepMesh_ListOfXY &
	:param It:
	:type It: BRepMesh_ListIteratorOfListOfXY &
	:rtype: None
") InsertBefore;
		void InsertBefore (BRepMesh_ListOfXY & Other,BRepMesh_ListIteratorOfListOfXY & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param I:
	:type I: gp_XY
	:param It:
	:type It: BRepMesh_ListIteratorOfListOfXY &
	:rtype: None
") InsertAfter;
		void InsertAfter (const gp_XY & I,BRepMesh_ListIteratorOfListOfXY & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Other:
	:type Other: BRepMesh_ListOfXY &
	:param It:
	:type It: BRepMesh_ListIteratorOfListOfXY &
	:rtype: None
") InsertAfter;
		void InsertAfter (BRepMesh_ListOfXY & Other,BRepMesh_ListIteratorOfListOfXY & It);
};


class BRepMesh_NodeHasherOfDataStructureOfDelaun {
	public:
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "	:param K:
	:type K: BRepMesh_Vertex &
	:param Upper:
	:type Upper: int
	:rtype: int
") HashCode;
		static Standard_Integer HashCode (const BRepMesh_Vertex & K,const Standard_Integer Upper);
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	:param K1:
	:type K1: BRepMesh_Vertex &
	:param K2:
	:type K2: BRepMesh_Vertex &
	:rtype: bool
") IsEqual;
		static Standard_Boolean IsEqual (const BRepMesh_Vertex & K1,const BRepMesh_Vertex & K2);
};


%nodefaultctor BRepMesh_PairOfIndex;
class BRepMesh_PairOfIndex {
	public:
		%feature("compactdefaultargs") BRepMesh_PairOfIndex;
		%feature("autodoc", "	:rtype: None
") BRepMesh_PairOfIndex;
		 BRepMesh_PairOfIndex ();
		%feature("compactdefaultargs") BRepMesh_PairOfIndex;
		%feature("autodoc", "	:param theOther:
	:type theOther: BRepMesh_PairOfIndex &
	:rtype: None
") BRepMesh_PairOfIndex;
		 BRepMesh_PairOfIndex (const BRepMesh_PairOfIndex & theOther);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clear indices

	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	* append index (store first of last index of pair)

	:param theIndx:
	:type theIndx: int
	:rtype: None
") Append;
		void Append (const Standard_Integer theIndx);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	* prepend index (store first index)

	:param theIndx:
	:type theIndx: int
	:rtype: None
") Prepend;
		void Prepend (const Standard_Integer theIndx);
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	* returns is pair not initialized by index

	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	* returns numner of initialized indeces

	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("compactdefaultargs") FirstIndex;
		%feature("autodoc", "	* returns first index from pair

	:rtype: int
") FirstIndex;
		Standard_Integer FirstIndex ();
		%feature("compactdefaultargs") LastIndex;
		%feature("autodoc", "	* returns last index

	:rtype: int
") LastIndex;
		Standard_Integer LastIndex ();
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "	:param theNum:
	:type theNum: int
	:rtype: int
") Index;
		Standard_Integer Index (const Standard_Integer theNum);
		%feature("compactdefaultargs") SetIndex;
		%feature("autodoc", "	:param theNum:
	:type theNum: int
	:param theIndex:
	:type theIndex: int
	:rtype: None
") SetIndex;
		void SetIndex (const Standard_Integer theNum,const Standard_Integer theIndex);
		%feature("compactdefaultargs") RemoveIndex;
		%feature("autodoc", "	* remove indicated

	:param theNum:
	:type theNum: int
	:rtype: None
") RemoveIndex;
		void RemoveIndex (const Standard_Integer theNum);
};


%nodefaultctor BRepMesh_PairOfPolygon;
class BRepMesh_PairOfPolygon {
	public:
		%feature("compactdefaultargs") BRepMesh_PairOfPolygon;
		%feature("autodoc", "	* Create empty pair with null fileds

	:rtype: None
") BRepMesh_PairOfPolygon;
		 BRepMesh_PairOfPolygon ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clear pair handles

	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param thePoly:
	:type thePoly: Handle_Poly_PolygonOnTriangulation &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Poly_PolygonOnTriangulation & thePoly);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param thePoly:
	:type thePoly: Handle_Poly_PolygonOnTriangulation &
	:rtype: None
") Append;
		void Append (const Handle_Poly_PolygonOnTriangulation & thePoly);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	* Returns first polygon on triangulation

	:rtype: Handle_Poly_PolygonOnTriangulation
") First;
		Handle_Poly_PolygonOnTriangulation First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	* Returns last polygon on triangulation

	:rtype: Handle_Poly_PolygonOnTriangulation
") Last;
		Handle_Poly_PolygonOnTriangulation Last ();
};


%nodefaultctor BRepMesh_SelectorOfDataStructureOfDelaun;
class BRepMesh_SelectorOfDataStructureOfDelaun {
	public:
		%feature("compactdefaultargs") BRepMesh_SelectorOfDataStructureOfDelaun;
		%feature("autodoc", "	:rtype: None
") BRepMesh_SelectorOfDataStructureOfDelaun;
		 BRepMesh_SelectorOfDataStructureOfDelaun ();
		%feature("compactdefaultargs") BRepMesh_SelectorOfDataStructureOfDelaun;
		%feature("autodoc", "	:param theMesh:
	:type theMesh: Handle_BRepMesh_DataStructureOfDelaun &
	:rtype: None
") BRepMesh_SelectorOfDataStructureOfDelaun;
		 BRepMesh_SelectorOfDataStructureOfDelaun (const Handle_BRepMesh_DataStructureOfDelaun & theMesh);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param theMesh:
	:type theMesh: Handle_BRepMesh_DataStructureOfDelaun &
	:rtype: None
") Initialize;
		void Initialize (const Handle_BRepMesh_DataStructureOfDelaun & theMesh);
		%feature("compactdefaultargs") NeighboursOf;
		%feature("autodoc", "	:param theNode:
	:type theNode: BRepMesh_Vertex &
	:rtype: None
") NeighboursOf;
		void NeighboursOf (const BRepMesh_Vertex & theNode);
		%feature("compactdefaultargs") NeighboursOfNode;
		%feature("autodoc", "	:param indexNode:
	:type indexNode: int
	:rtype: None
") NeighboursOfNode;
		void NeighboursOfNode (const Standard_Integer indexNode);
		%feature("compactdefaultargs") NeighboursOf;
		%feature("autodoc", "	:param theLink:
	:type theLink: BRepMesh_Edge &
	:rtype: None
") NeighboursOf;
		void NeighboursOf (const BRepMesh_Edge & theLink);
		%feature("compactdefaultargs") NeighboursOfLink;
		%feature("autodoc", "	:param indexLink:
	:type indexLink: int
	:rtype: None
") NeighboursOfLink;
		void NeighboursOfLink (const Standard_Integer indexLink);
		%feature("compactdefaultargs") NeighboursOf;
		%feature("autodoc", "	:param theElem:
	:type theElem: BRepMesh_Triangle &
	:rtype: None
") NeighboursOf;
		void NeighboursOf (const BRepMesh_Triangle & theElem);
		%feature("compactdefaultargs") NeighboursOfElement;
		%feature("autodoc", "	* All Neighbours Of the Element. By edge or by vertices.

	:param indexElem:
	:type indexElem: int
	:rtype: None
") NeighboursOfElement;
		void NeighboursOfElement (const Standard_Integer indexElem);
		%feature("compactdefaultargs") NeighboursByEdgeOf;
		%feature("autodoc", "	* Neighbours by edge Of the Element.

	:param theElem:
	:type theElem: BRepMesh_Triangle &
	:rtype: None
") NeighboursByEdgeOf;
		void NeighboursByEdgeOf (const BRepMesh_Triangle & theElem);
		%feature("compactdefaultargs") NeighboursOf;
		%feature("autodoc", "	* Adds a level of Neighbours by edge to the selector <theSelector>.

	:param theSelector:
	:type theSelector: BRepMesh_SelectorOfDataStructureOfDelaun &
	:rtype: None
") NeighboursOf;
		void NeighboursOf (const BRepMesh_SelectorOfDataStructureOfDelaun & theSelector);
		%feature("compactdefaultargs") AddNeighbours;
		%feature("autodoc", "	* Adds a level of Neighbours by edge to the selector <self>.

	:rtype: None
") AddNeighbours;
		void AddNeighbours ();
		%feature("compactdefaultargs") Nodes;
		%feature("autodoc", "	:rtype: BRepMesh_MapOfInteger
") Nodes;
		const BRepMesh_MapOfInteger & Nodes ();
		%feature("compactdefaultargs") Links;
		%feature("autodoc", "	:rtype: BRepMesh_MapOfInteger
") Links;
		const BRepMesh_MapOfInteger & Links ();
		%feature("compactdefaultargs") Elements;
		%feature("autodoc", "	:rtype: BRepMesh_MapOfInteger
") Elements;
		const BRepMesh_MapOfInteger & Elements ();
		%feature("compactdefaultargs") FrontierLinks;
		%feature("autodoc", "	* Gives the list of links incices frontier of the selector <self>.

	:rtype: BRepMesh_MapOfInteger
") FrontierLinks;
		const BRepMesh_MapOfInteger & FrontierLinks ();
};


%nodefaultctor BRepMesh_ShapeTool;
class BRepMesh_ShapeTool {
	public:
		%feature("compactdefaultargs") BRepMesh_ShapeTool;
		%feature("autodoc", "	:rtype: None
") BRepMesh_ShapeTool;
		 BRepMesh_ShapeTool ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") Init;
		void Init (const TopoDS_Shape & S);
		%feature("compactdefaultargs") MoreFace;
		%feature("autodoc", "	:rtype: bool
") MoreFace;
		Standard_Boolean MoreFace ();
		%feature("compactdefaultargs") NextFace;
		%feature("autodoc", "	:rtype: None
") NextFace;
		void NextFace ();
		%feature("compactdefaultargs") CurrentFace;
		%feature("autodoc", "	:rtype: TopoDS_Face
") CurrentFace;
		const TopoDS_Face  CurrentFace ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") Init;
		void Init (const TopoDS_Face & F);
		%feature("compactdefaultargs") MoreEdge;
		%feature("autodoc", "	:rtype: bool
") MoreEdge;
		Standard_Boolean MoreEdge ();
		%feature("compactdefaultargs") NextEdge;
		%feature("autodoc", "	:rtype: None
") NextEdge;
		void NextEdge ();
		%feature("compactdefaultargs") CurrentEdge;
		%feature("autodoc", "	:rtype: TopoDS_Edge
") CurrentEdge;
		const TopoDS_Edge  CurrentEdge ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Edge &
	:rtype: None
") Init;
		void Init (const TopoDS_Edge & E);
		%feature("compactdefaultargs") MoreInternalVertex;
		%feature("autodoc", "	:rtype: bool
") MoreInternalVertex;
		Standard_Boolean MoreInternalVertex ();
		%feature("compactdefaultargs") NextInternalVertex;
		%feature("autodoc", "	:rtype: None
") NextInternalVertex;
		void NextInternalVertex ();
		%feature("compactdefaultargs") CurrentInternalVertex;
		%feature("autodoc", "	:rtype: TopoDS_Vertex
") CurrentInternalVertex;
		const TopoDS_Vertex  CurrentInternalVertex ();
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:rtype: TopAbs_Orientation
") Orientation;
		static TopAbs_Orientation Orientation (const TopoDS_Face & F);
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Edge &
	:rtype: TopAbs_Orientation
") Orientation;
		static TopAbs_Orientation Orientation (const TopoDS_Edge & E);
		%feature("compactdefaultargs") Bound;
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:rtype: Bnd_Box
") Bound;
		static Bnd_Box Bound (const TopoDS_Face & F);
		%feature("compactdefaultargs") Bound;
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Edge &
	:rtype: Bnd_Box
") Bound;
		static Bnd_Box Bound (const TopoDS_Edge & E);
		%feature("compactdefaultargs") FirstVertex;
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Edge &
	:rtype: TopoDS_Vertex
") FirstVertex;
		static TopoDS_Vertex FirstVertex (const TopoDS_Edge & E);
		%feature("compactdefaultargs") LastVertex;
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Edge &
	:rtype: TopoDS_Vertex
") LastVertex;
		static TopoDS_Vertex LastVertex (const TopoDS_Edge & E);
		%feature("compactdefaultargs") Vertices;
		%feature("autodoc", "	* If there is not First or Last vertex (infinite or semi-infinite edge) return null shapes.

	:param E:
	:type E: TopoDS_Edge &
	:param Vfirst:
	:type Vfirst: TopoDS_Vertex &
	:param Vlast:
	:type Vlast: TopoDS_Vertex &
	:rtype: void
") Vertices;
		static void Vertices (const TopoDS_Edge & E,TopoDS_Vertex & Vfirst,TopoDS_Vertex & Vlast);
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Edge &
	:param F:
	:type F: TopoDS_Face &
	:param wFirst:
	:type wFirst: float &
	:param wLast:
	:type wLast: float &
	:rtype: void
") Range;
		static void Range (const TopoDS_Edge & E,const TopoDS_Face & F,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") UVPoints;
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Edge &
	:param F:
	:type F: TopoDS_Face &
	:param uvFirst:
	:type uvFirst: gp_Pnt2d
	:param uvLast:
	:type uvLast: gp_Pnt2d
	:rtype: void
") UVPoints;
		static void UVPoints (const TopoDS_Edge & E,const TopoDS_Face & F,gp_Pnt2d & uvFirst,gp_Pnt2d & uvLast);
		%feature("compactdefaultargs") Degenerated;
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Edge &
	:rtype: bool
") Degenerated;
		static Standard_Boolean Degenerated (const TopoDS_Edge & E);
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "	:param V:
	:type V: TopoDS_Vertex &
	:rtype: float
") Tolerance;
		static Standard_Real Tolerance (const TopoDS_Vertex & V);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	:param V:
	:type V: TopoDS_Vertex &
	:param E:
	:type E: TopoDS_Edge &
	:param F:
	:type F: TopoDS_Face &
	:rtype: float
") Parameter;
		static Standard_Real Parameter (const TopoDS_Vertex & V,const TopoDS_Edge & E,const TopoDS_Face & F);
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Edge &
	:param F:
	:type F: TopoDS_Face &
	:param W:
	:type W: float
	:param UV:
	:type UV: gp_Pnt2d
	:rtype: void
") Parameters;
		static void Parameters (const TopoDS_Edge & E,const TopoDS_Face & F,const Standard_Real W,gp_Pnt2d & UV);
		%feature("compactdefaultargs") Locate;
		%feature("autodoc", "	:param C:
	:type C: BRepAdaptor_Curve &
	:param W:
	:type W: float
	:param WFound:
	:type WFound: float &
	:param p3d:
	:type p3d: gp_Pnt
	:param UV:
	:type UV: gp_Pnt2d
	:rtype: void
") Locate;
		static void Locate (const BRepAdaptor_Curve & C,const Standard_Real W,Standard_Real &OutValue,const gp_Pnt & p3d,gp_Pnt2d & UV);
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "	:param V:
	:type V: TopoDS_Vertex &
	:rtype: gp_Pnt
") Pnt;
		static gp_Pnt Pnt (const TopoDS_Vertex & V);
		%feature("compactdefaultargs") AddInFace;
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:param T:
	:type T: Handle_Poly_Triangulation &
	:rtype: void
") AddInFace;
		static void AddInFace (const TopoDS_Face & F,Handle_Poly_Triangulation & T);
};


%nodefaultctor BRepMesh_Triangle;
class BRepMesh_Triangle {
	public:
		%feature("compactdefaultargs") BRepMesh_Triangle;
		%feature("autodoc", "	:rtype: None
") BRepMesh_Triangle;
		 BRepMesh_Triangle ();
		%feature("compactdefaultargs") BRepMesh_Triangle;
		%feature("autodoc", "	:param theEdge1:
	:type theEdge1: int
	:param theEdge2:
	:type theEdge2: int
	:param theEdge3:
	:type theEdge3: int
	:param theOrientation1:
	:type theOrientation1: bool
	:param theOrientation2:
	:type theOrientation2: bool
	:param theOrientation3:
	:type theOrientation3: bool
	:param isCanMove:
	:type isCanMove: BRepMesh_DegreeOfFreedom
	:rtype: None
") BRepMesh_Triangle;
		 BRepMesh_Triangle (const Standard_Integer theEdge1,const Standard_Integer theEdge2,const Standard_Integer theEdge3,const Standard_Boolean theOrientation1,const Standard_Boolean theOrientation2,const Standard_Boolean theOrientation3,const BRepMesh_DegreeOfFreedom isCanMove);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param theEdge1:
	:type theEdge1: int
	:param theEdge2:
	:type theEdge2: int
	:param theEdge3:
	:type theEdge3: int
	:param theOrientation1:
	:type theOrientation1: bool
	:param theOrientation2:
	:type theOrientation2: bool
	:param theOrientation3:
	:type theOrientation3: bool
	:param isCanMove:
	:type isCanMove: BRepMesh_DegreeOfFreedom
	:rtype: None
") Initialize;
		void Initialize (const Standard_Integer theEdge1,const Standard_Integer theEdge2,const Standard_Integer theEdge3,const Standard_Boolean theOrientation1,const Standard_Boolean theOrientation2,const Standard_Boolean theOrientation3,const BRepMesh_DegreeOfFreedom isCanMove);
		%feature("compactdefaultargs") Edges;
		%feature("autodoc", "	:param theEdge1:
	:type theEdge1: int &
	:param theEdge2:
	:type theEdge2: int &
	:param theEdge3:
	:type theEdge3: int &
	:param theOrientation1:
	:type theOrientation1: bool
	:param theOrientation2:
	:type theOrientation2: bool
	:param theOrientation3:
	:type theOrientation3: bool
	:rtype: None
") Edges;
		void Edges (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Boolean &OutValue,Standard_Boolean &OutValue,Standard_Boolean &OutValue);
		%feature("compactdefaultargs") Movability;
		%feature("autodoc", "	:rtype: inline BRepMesh_DegreeOfFreedom
") Movability;
		inline BRepMesh_DegreeOfFreedom Movability ();
		%feature("compactdefaultargs") SetMovability;
		%feature("autodoc", "	:param theMovability:
	:type theMovability: BRepMesh_DegreeOfFreedom
	:rtype: None
") SetMovability;
		void SetMovability (const BRepMesh_DegreeOfFreedom theMovability);
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "	:param theUpper:
	:type theUpper: int
	:rtype: int
") HashCode;
		Standard_Integer HashCode (const Standard_Integer theUpper);

        %extend {
            Standard_Integer __hash__() {
            return $self->HashCode(2147483647);
            }
        };
        		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	:param theOther:
	:type theOther: BRepMesh_Triangle &
	:rtype: bool
") IsEqual;
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


%nodefaultctor BRepMesh_Vertex;
class BRepMesh_Vertex {
	public:
		%feature("compactdefaultargs") BRepMesh_Vertex;
		%feature("autodoc", "	:rtype: None
") BRepMesh_Vertex;
		 BRepMesh_Vertex ();
		%feature("compactdefaultargs") BRepMesh_Vertex;
		%feature("autodoc", "	:param UV:
	:type UV: gp_XY
	:param Locat3d:
	:type Locat3d: int
	:param Move:
	:type Move: BRepMesh_DegreeOfFreedom
	:rtype: None
") BRepMesh_Vertex;
		 BRepMesh_Vertex (const gp_XY & UV,const Standard_Integer Locat3d,const BRepMesh_DegreeOfFreedom Move);
		%feature("compactdefaultargs") BRepMesh_Vertex;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Move:
	:type Move: BRepMesh_DegreeOfFreedom
	:rtype: None
") BRepMesh_Vertex;
		 BRepMesh_Vertex (const Standard_Real U,const Standard_Real V,const BRepMesh_DegreeOfFreedom Move);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param UV:
	:type UV: gp_XY
	:param Locat3d:
	:type Locat3d: int
	:param Move:
	:type Move: BRepMesh_DegreeOfFreedom
	:rtype: None
") Initialize;
		void Initialize (const gp_XY & UV,const Standard_Integer Locat3d,const BRepMesh_DegreeOfFreedom Move);
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "	:rtype: gp_XY
") Coord;
		const gp_XY  Coord ();
		%feature("compactdefaultargs") Location3d;
		%feature("autodoc", "	:rtype: int
") Location3d;
		Standard_Integer Location3d ();
		%feature("compactdefaultargs") Movability;
		%feature("autodoc", "	:rtype: BRepMesh_DegreeOfFreedom
") Movability;
		BRepMesh_DegreeOfFreedom Movability ();
		%feature("compactdefaultargs") SetMovability;
		%feature("autodoc", "	:param Move:
	:type Move: BRepMesh_DegreeOfFreedom
	:rtype: None
") SetMovability;
		void SetMovability (const BRepMesh_DegreeOfFreedom Move);
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "	:param Upper:
	:type Upper: int
	:rtype: int
") HashCode;
		Standard_Integer HashCode (const Standard_Integer Upper);

        %extend {
            Standard_Integer __hash__() {
            return $self->HashCode(2147483647);
            }
        };
        		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	:param Other:
	:type Other: BRepMesh_Vertex &
	:rtype: bool
") IsEqual;
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


class BRepMesh_VertexHasher {
	public:
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "	:param K:
	:type K: BRepMesh_Vertex &
	:param Upper:
	:type Upper: int
	:rtype: int
") HashCode;
		static Standard_Integer HashCode (const BRepMesh_Vertex & K,const Standard_Integer Upper);
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	:param K1:
	:type K1: BRepMesh_Vertex &
	:param K2:
	:type K2: BRepMesh_Vertex &
	:rtype: bool
") IsEqual;
		static Standard_Boolean IsEqual (const BRepMesh_Vertex & K1,const BRepMesh_Vertex & K2);
};


%nodefaultctor BRepMesh_VertexInspector;
class BRepMesh_VertexInspector : public NCollection_CellFilter_InspectorXY {
	public:
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "	:param theTol:
	:type theTol: float
	:rtype: None
") SetTolerance;
		void SetTolerance (const Standard_Real theTol);
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "	:param theTolX:
	:type theTolX: float
	:param theTolY:
	:type theTolY: float
	:rtype: None
") SetTolerance;
		void SetTolerance (const Standard_Real theTolX,const Standard_Real theTolY);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Delete;
		%feature("autodoc", "	:param theIndex:
	:type theIndex: int
	:rtype: None
") Delete;
		void Delete (const Standard_Integer theIndex);
		%feature("compactdefaultargs") GetNbVertices;
		%feature("autodoc", "	:rtype: int
") GetNbVertices;
		Standard_Integer GetNbVertices ();
		%feature("compactdefaultargs") GetVertex;
		%feature("autodoc", "	:param theInd:
	:type theInd: int
	:rtype: BRepMesh_Vertex
") GetVertex;
		BRepMesh_Vertex & GetVertex (Standard_Integer theInd);
		%feature("compactdefaultargs") SetCurrent;
		%feature("autodoc", "	* Set current node to be checked

	:param theCurVertex:
	:type theCurVertex: gp_XY
	:param Standard_Boolean:
	:type Standard_Boolean: 
	:rtype: None
") SetCurrent;
		void SetCurrent (const gp_XY & theCurVertex,const Standard_Boolean);
		%feature("compactdefaultargs") GetCoincidentInd;
		%feature("autodoc", "	* //!Get result index of node

	:rtype: int
") GetCoincidentInd;
		Standard_Integer GetCoincidentInd ();
		%feature("compactdefaultargs") GetListOfDelNodes;
		%feature("autodoc", "	:rtype: BRepMesh_ListOfInteger
") GetListOfDelNodes;
		const BRepMesh_ListOfInteger & GetListOfDelNodes ();
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	:param theIdx:
	:type theIdx: int
	:param theTarget:
	:type theTarget: int
	:rtype: bool
") IsEqual;
		static Standard_Boolean IsEqual (Standard_Integer theIdx,const Standard_Integer theTarget);
};


%nodefaultctor BRepMesh_VertexTool;
class BRepMesh_VertexTool {
	public:
		%feature("compactdefaultargs") BRepMesh_VertexTool;
		%feature("autodoc", "	:param theAlloc:
	:type theAlloc: BRepMesh_BaseAllocator &
	:rtype: None
") BRepMesh_VertexTool;
		 BRepMesh_VertexTool (const BRepMesh_BaseAllocator & theAlloc);
		%feature("compactdefaultargs") BRepMesh_VertexTool;
		%feature("autodoc", "	* Constructs a VertexTool with an evaluation of the number of vertices.

	:param nbComp:
	:type nbComp: int
	:param theAlloc:
	:type theAlloc: BRepMesh_BaseAllocator &
	:rtype: None
") BRepMesh_VertexTool;
		 BRepMesh_VertexTool (const Standard_Integer nbComp,const BRepMesh_BaseAllocator & theAlloc);
		%feature("compactdefaultargs") SetCellSize;
		%feature("autodoc", "	* Sets new size for cellfilter.

	:param theSize:
	:type theSize: float
	:rtype: None
") SetCellSize;
		void SetCellSize (const Standard_Real theSize);
		%feature("compactdefaultargs") SetCellSize;
		%feature("autodoc", "	* Sets new size for cellfilter.

	:param theXSize:
	:type theXSize: float
	:param theYSize:
	:type theYSize: float
	:rtype: None
") SetCellSize;
		void SetCellSize (const Standard_Real theXSize,const Standard_Real theYSize);
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "	* Sets new size for cellfilter.

	:param theTol:
	:type theTol: float
	:rtype: None
") SetTolerance;
		void SetTolerance (const Standard_Real theTol);
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "	* Sets new size for cellfilter.

	:param theTolX:
	:type theTolX: float
	:param theTolY:
	:type theTolY: float
	:rtype: None
") SetTolerance;
		void SetTolerance (const Standard_Real theTolX,const Standard_Real theTolY);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds a vertex to the tool.

	:param theVertex:
	:type theVertex: BRepMesh_Vertex &
	:param theParams:
	:type theParams: BRepMesh_ListOfInteger &
	:rtype: int
") Add;
		Standard_Integer Add (const BRepMesh_Vertex & theVertex,const BRepMesh_ListOfInteger & theParams);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds a vertex to the tool.

	:param theVertex:
	:type theVertex: BRepMesh_Vertex &
	:rtype: int
") Add;
		Standard_Integer Add (const BRepMesh_Vertex & theVertex);
		%feature("compactdefaultargs") Delete;
		%feature("autodoc", "	* Deletes a vertex from the tool.

	:param theIndex:
	:type theIndex: int
	:rtype: None
") Delete;
		void Delete (const Standard_Integer theIndex);
		%feature("compactdefaultargs") FindFromIndex;
		%feature("autodoc", "	* Returns data assigned to theIndex.

	:param theIndex:
	:type theIndex: int
	:rtype: BRepMesh_ListOfInteger
") FindFromIndex;
		BRepMesh_ListOfInteger & FindFromIndex (const Standard_Integer theIndex);
		%feature("compactdefaultargs") FindKey;
		%feature("autodoc", "	* Selects the vertex by theIndex.

	:param theIndex:
	:type theIndex: int
	:rtype: BRepMesh_Vertex
") FindKey;
		const BRepMesh_Vertex & FindKey (const Standard_Integer theIndex);
		%feature("compactdefaultargs") FindIndex;
		%feature("autodoc", "	* Returns an index of theVertex.

	:param theVertex:
	:type theVertex: BRepMesh_Vertex &
	:rtype: int
") FindIndex;
		Standard_Integer FindIndex (const BRepMesh_Vertex & theVertex);
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	* Returns a number of vertices.

	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	* Returns True when the map contains no keys.

	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Substitute;
		%feature("autodoc", "	* Substitutes vertex with Index on theVertex with attributes theData.

	:param Index:
	:type Index: int
	:param theVertex:
	:type theVertex: BRepMesh_Vertex &
	:param theData:
	:type theData: BRepMesh_ListOfInteger &
	:rtype: None
") Substitute;
		void Substitute (const Standard_Integer Index,const BRepMesh_Vertex & theVertex,const BRepMesh_ListOfInteger & theData);
		%feature("compactdefaultargs") RemoveLast;
		%feature("autodoc", "	* Remove last node from the structure.

	:rtype: None
") RemoveLast;
		void RemoveLast ();
		%feature("compactdefaultargs") GetListOfDelNodes;
		%feature("autodoc", "	* Returns the list with indexes of vertices that have Movability attribute equal to BRepMesh_Deleted and can be replaced with another node.

	:rtype: BRepMesh_ListOfInteger
") GetListOfDelNodes;
		const BRepMesh_ListOfInteger & GetListOfDelNodes ();

        %feature("autodoc", "1");
        %extend{
            std::string StatisticsToString() {
            std::stringstream s;
            self->Statistics(s);
            return s.str();}
        };
        };


%nodefaultctor BRepMesh_IncrementalMesh;
class BRepMesh_IncrementalMesh : public BRepMesh_DiscretRoot {
	public:
		%feature("compactdefaultargs") BRepMesh_IncrementalMesh;
		%feature("autodoc", "	:rtype: None
") BRepMesh_IncrementalMesh;
		 BRepMesh_IncrementalMesh ();
		%feature("compactdefaultargs") BRepMesh_IncrementalMesh;
		%feature("autodoc", "	* If the boolean <Relatif> is True, the deflection used for the polygonalisation of each edge will be <D> * Size of Edge. the deflection used for the faces will be the maximum deflection of their edges.

	:param S:
	:type S: TopoDS_Shape &
	:param D:
	:type D: float
	:param Relatif: default value is Standard_False
	:type Relatif: bool
	:param Ang: default value is 0.5
	:type Ang: float
	:param InParallel: default value is Standard_False
	:type InParallel: bool
	:rtype: None
") BRepMesh_IncrementalMesh;
		 BRepMesh_IncrementalMesh (const TopoDS_Shape & S,const Standard_Real D,const Standard_Boolean Relatif = Standard_False,const Standard_Real Ang = 0.5,const Standard_Boolean InParallel = Standard_False);
		%feature("compactdefaultargs") SetRelative;
		%feature("autodoc", "	:param theFlag:
	:type theFlag: bool
	:rtype: None
") SetRelative;
		void SetRelative (const Standard_Boolean theFlag);
		%feature("compactdefaultargs") Relative;
		%feature("autodoc", "	:rtype: bool
") Relative;
		Standard_Boolean Relative ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:rtype: void
") Perform;
		virtual void Perform ();
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "	* Builds the incremental mesh of the shape

	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") Update;
		void Update (const TopoDS_Shape & S);
		%feature("compactdefaultargs") IsModified;
		%feature("autodoc", "	:rtype: bool
") IsModified;
		Standard_Boolean IsModified ();
		%feature("compactdefaultargs") GetStatusFlags;
		%feature("autodoc", "	:rtype: int
") GetStatusFlags;
		Standard_Integer GetStatusFlags ();
		%feature("compactdefaultargs") SetParallel;
		%feature("autodoc", "	* Request algorithm to launch in multiple threads to improve performance.

	:param theInParallel:
	:type theInParallel: bool
	:rtype: None
") SetParallel;
		void SetParallel (const Standard_Boolean theInParallel);
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "	* Returns the multi-threading usage flag.

	:rtype: bool
") IsParallel;
		Standard_Boolean IsParallel ();
		%feature("compactdefaultargs") Discret;
		%feature("autodoc", "	* Plugin interface for the Mesh Factories.

	:param theShape:
	:type theShape: TopoDS_Shape &
	:param theDeflection:
	:type theDeflection: float
	:param theAngle:
	:type theAngle: float
	:param theAlgo:
	:type theAlgo: BRepMesh_PDiscretRoot &
	:rtype: int
") Discret;
		static Standard_Integer Discret (const TopoDS_Shape & theShape,const Standard_Real theDeflection,const Standard_Real theAngle,BRepMesh_PDiscretRoot & theAlgo);
		%feature("compactdefaultargs") IsParallelDefault;
		%feature("autodoc", "	* Returns multi-threading usage flag set by default in Discret() static method (thus applied only to Mesh Factories).

	:rtype: bool
") IsParallelDefault;
		static Standard_Boolean IsParallelDefault ();
		%feature("compactdefaultargs") SetParallelDefault;
		%feature("autodoc", "	* Setup multi-threading usage flag set by default in Discret() static method (thus applied only to Mesh Factories).

	:param theInParallel:
	:type theInParallel: bool
	:rtype: void
") SetParallelDefault;
		static void SetParallelDefault (const Standard_Boolean theInParallel);
};


%extend BRepMesh_IncrementalMesh {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepMesh_IncrementalMesh(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepMesh_IncrementalMesh::Handle_BRepMesh_IncrementalMesh %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

