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
typedef BRepMesh::NCollection_DataMap <Handle_Poly_Triangulation , Standard_Boolean> BRepMesh::DMapOfTriangulationBool;
typedef BRepMesh::NCollection_Handle <BndBox2dTree> BRepMesh::HBndBox2dTree;
typedef BRepMesh::NCollection_UBTreeFiller <Standard_Integer , Bnd_Box2d> BRepMesh::BndBox2dTreeFiller;
typedef BRepMesh::NCollection_IndexedDataMap <BRepMesh_Edge , BRepMesh_PairOfIndex> BRepMesh::IDMapOfLink;
typedef BRepMesh::NCollection_Map <Standard_Integer> BRepMesh::MapOfInteger;
typedef BRepMesh::NCollection_Vector <BRepMesh_Circle> BRepMesh::VectorOfCircle;
typedef BRepMesh::NCollection_Handle <VectorOfVertex> BRepMesh::HVectorOfVertex;
typedef BRepMesh::NCollection_EBTree <Standard_Integer , Bnd_Box2d> BRepMesh::BndBox2dTree;
typedef BRepMesh::NCollection_Array1 <Standard_Integer> BRepMesh::Array1OfInteger;
typedef BRepMesh::NCollection_Array1 <Standard_Real> BRepMesh::Array1OfReal;
typedef BRepMesh::NCollection_Sequence <Standard_Real> BRepMesh::SequenceOfReal;
typedef BRepMesh::NCollection_DataMap <TopoDS_Edge , DMapOfTriangulationBool , TopTools_ShapeMapHasher> BRepMesh::DMapOfEdgeListOfTriangulationBool;
typedef BRepMesh::NCollection_DataMap <TopoDS_Shape , BRepMesh_PairOfPolygon , TopTools_ShapeMapHasher> BRepMesh::DMapOfShapePairOfPolygon;
typedef Standard_Integer ( * BRepMesh_PluginEntryType ) ( const TopoDS_Shape & theShape , const Standard_Real theLinDeflection , const Standard_Real theAngDeflection , BRepMesh_DiscretRoot * & theMeshAlgoInstance );
typedef BRepMesh::NCollection_Sequence <Bnd_B2d> BRepMesh::SequenceOfBndB2d;
typedef BRepMesh::NCollection_Array1 <BRepMesh_Vertex> BRepMesh::Array1OfVertexOfDelaun;
typedef BRepMesh::NCollection_IndexedMap <BRepMesh_Triangle> BRepMesh::IMapOfElement;
typedef BRepMesh::NCollection_DataMap <TopoDS_Face , Handle_BRepMesh_FaceAttribute , TopTools_ShapeMapHasher> BRepMesh::DMapOfFaceAttribute;
typedef BRepMesh::NCollection_Map <TopoDS_Shape , TopTools_ShapeMapHasher> BRepMesh::MapOfShape;
typedef BRepMesh::NCollection_List <Standard_Integer> BRepMesh::ListOfInteger;
typedef BRepMesh::NCollection_Handle <DMapOfIntegerPnt> BRepMesh::HDMapOfIntegerPnt;
typedef BRepMesh::NCollection_Array1 <SegmentsTree> BRepMesh::Array1OfSegmentsTree;
typedef BRepMesh::NCollection_Handle <DMapOfIntegerListOfXY> BRepMesh::HDMapOfIntegerListOfXY;
typedef BRepMesh::NCollection_Vector <Standard_Integer> BRepMesh::VectorOfInteger;
typedef BRepMesh::NCollection_IndexedMap <Standard_Real> BRepMesh::IMapOfReal;
typedef BRepMesh::NCollection_DataMap <TopoDS_Vertex , Standard_Integer , TopTools_ShapeMapHasher> BRepMesh::DMapOfVertexInteger;
typedef BRepMesh::NCollection_Handle <DMapOfVertexInteger> BRepMesh::HDMapOfVertexInteger;
typedef BRepMesh::NCollection_DataMap <Standard_Integer , ListOfXY> BRepMesh::DMapOfIntegerListOfXY;
typedef BRepMesh::NCollection_List <BRepMesh_Vertex> BRepMesh::ListOfVertex;
typedef BRepMesh::NCollection_List <gp_XY> BRepMesh::ListOfXY;
typedef BRepMesh::NCollection_Handle <MapOfInteger> BRepMesh::HMapOfInteger;
typedef BRepMesh::NCollection_Sequence <Standard_Integer> BRepMesh::SequenceOfInteger;
typedef BRepMesh::NCollection_Handle <IMapOfInteger> BRepMesh::HIMapOfInteger;
typedef BRepMesh::NCollection_Handle <BRepMesh_Classifier> BRepMesh::HClassifier;
typedef BRepMesh::NCollection_DataMap <Standard_Integer , ListOfInteger> BRepMesh::DMapOfIntegerListOfInteger;
typedef std::pair <HArray1OfSegments , HBndBox2dTree> BRepMesh::SegmentsTree;
typedef BRepMesh::NCollection_Array1 <Segment> BRepMesh::Array1OfSegments;
typedef BRepMesh::NCollection_Handle <Array1OfSegments> BRepMesh::HArray1OfSegments;
typedef BRepMesh::NCollection_Handle <SequenceOfBndB2d> BRepMesh::HSequenceOfBndB2d;
typedef BRepMesh::NCollection_CellFilter <BRepMesh_VertexInspector> BRepMesh::VertexCellFilter;
typedef BRepMesh::NCollection_Handle <DMapOfShapePairOfPolygon> BRepMesh::HDMapOfShapePairOfPolygon;
typedef BRepMesh::NCollection_Handle <BRepMesh_VertexTool> BRepMesh::HVertexTool;
typedef BRepMesh::NCollection_DataMap <Standard_Integer , Standard_Integer> BRepMesh::MapOfIntegerInteger;
typedef BRepMesh::NCollection_Handle <SequenceOfInteger> BRepMesh::HSequenceOfInteger;
typedef BRepMesh::NCollection_CellFilter <BRepMesh_CircleInspector> BRepMesh::CircleCellFilter;
typedef BRepMesh::NCollection_Vector <BRepMesh_Vertex> BRepMesh::VectorOfVertex;
typedef BRepMesh::NCollection_IndexedMap <Standard_Integer> BRepMesh::IMapOfInteger;
typedef BRepMesh::NCollection_DataMap <Standard_Integer , gp_Pnt> BRepMesh::DMapOfIntegerPnt;
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

%nodefaultctor BRepMesh_Circle;
class BRepMesh_Circle {
	public:
		%feature("compactdefaultargs") BRepMesh_Circle;
		%feature("autodoc", "	* Default constructor.

	:rtype: None
") BRepMesh_Circle;
		 BRepMesh_Circle ();
		%feature("compactdefaultargs") BRepMesh_Circle;
		%feature("autodoc", "	* Constructor. @param theLocation location of a circle. @param theRadius radius of a circle.

	:param theLocation:
	:type theLocation: gp_XY
	:param theRadius:
	:type theRadius: float
	:rtype: None
") BRepMesh_Circle;
		 BRepMesh_Circle (const gp_XY & theLocation,const Standard_Real theRadius);
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "	* Sets location of a circle. @param theLocation location of a circle.

	:param theLocation:
	:type theLocation: gp_XY
	:rtype: inline void
") SetLocation;
		inline void SetLocation (const gp_XY & theLocation);
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "	* Sets radius of a circle. @param theRadius radius of a circle.

	:param theRadius:
	:type theRadius: float
	:rtype: inline void
") SetRadius;
		inline void SetRadius (const Standard_Real theRadius);
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "	* Returns location of a circle.

	:rtype: inline  gp_XY
") Location;
		inline const gp_XY  Location ();
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "	* Returns radius of a circle.

	:rtype: inline  float
") Radius;
		inline const Standard_Real & Radius ();
};


%extend BRepMesh_Circle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepMesh_CircleInspector;
class BRepMesh_CircleInspector : public NCollection_CellFilter_InspectorXY {
	public:
typedef Standard_Integer Target;
		%feature("compactdefaultargs") BRepMesh_CircleInspector;
		%feature("autodoc", "	* Constructor. @param theTolerance tolerance to be used for identification of shot circles. @param theReservedSize size to be reserved for vector of circles. @param theAllocator memory allocator to be used by internal collections.

	:param theTolerance:
	:type theTolerance: float
	:param theReservedSize:
	:type theReservedSize: int
	:param theAllocator:
	:type theAllocator: Handle_NCollection_IncAllocator &
	:rtype: None
") BRepMesh_CircleInspector;
		 BRepMesh_CircleInspector (const Standard_Real theTolerance,const Standard_Integer theReservedSize,const Handle_NCollection_IncAllocator & theAllocator);
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	* Adds the circle to vector of circles at the given position. @param theIndex position of circle in the vector. @param theCircle circle to be added.

	:param theIndex:
	:type theIndex: int
	:param theCircle:
	:type theCircle: BRepMesh_Circle &
	:rtype: inline void
") Bind;
		inline void Bind (const Standard_Integer theIndex,const BRepMesh_Circle & theCircle);
		%feature("compactdefaultargs") Circles;
		%feature("autodoc", "	* Resutns vector of registered circles.

	:rtype: inline  BRepMesh::VectorOfCircle
") Circles;
		inline const BRepMesh::VectorOfCircle & Circles ();
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "	* Returns circle with the given index. @param theIndex index of circle. returns circle with the given index.

	:param theIndex:
	:type theIndex: int
	:rtype: inline BRepMesh_Circle
") Circle;
		inline BRepMesh_Circle & Circle (const Standard_Integer theIndex);
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "	* Set reference point to be checked. @param thePoint bullet point.

	:param thePoint:
	:type thePoint: gp_XY
	:rtype: inline void
") SetPoint;
		inline void SetPoint (const gp_XY & thePoint);
		%feature("compactdefaultargs") GetShotCircles;
		%feature("autodoc", "	* Returns list of circles shot by the reference point.

	:rtype: inline BRepMesh::ListOfInteger
") GetShotCircles;
		inline BRepMesh::ListOfInteger & GetShotCircles ();
		%feature("compactdefaultargs") Inspect;
		%feature("autodoc", "	* Performs inspection of a circle with the given index. @param theTargetIndex index of a circle to be checked. returns status of the check.

	:param theTargetIndex:
	:type theTargetIndex: int
	:rtype: NCollection_CellFilter_Action
") Inspect;
		NCollection_CellFilter_Action Inspect (const Standard_Integer theTargetIndex);
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	* Checks indices for equlity.

	:param theIndex:
	:type theIndex: int
	:param theTargetIndex:
	:type theTargetIndex: int
	:rtype: bool
") IsEqual;
		static Standard_Boolean IsEqual (const Standard_Integer theIndex,const Standard_Integer theTargetIndex);
};


%extend BRepMesh_CircleInspector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepMesh_CircleTool;
class BRepMesh_CircleTool {
	public:
		%feature("compactdefaultargs") BRepMesh_CircleTool;
		%feature("autodoc", "	* Constructor. @param theAllocator memory allocator to be used by internal structures.

	:param theAllocator:
	:type theAllocator: Handle_NCollection_IncAllocator &
	:rtype: None
") BRepMesh_CircleTool;
		 BRepMesh_CircleTool (const Handle_NCollection_IncAllocator & theAllocator);
		%feature("compactdefaultargs") BRepMesh_CircleTool;
		%feature("autodoc", "	* Constructor. @param theReservedSize size to be reserved for vector of circles. @param theAllocator memory allocator to be used by internal structures.

	:param theReservedSize:
	:type theReservedSize: int
	:param theAllocator:
	:type theAllocator: Handle_NCollection_IncAllocator &
	:rtype: None
") BRepMesh_CircleTool;
		 BRepMesh_CircleTool (const Standard_Integer theReservedSize,const Handle_NCollection_IncAllocator & theAllocator);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initializes the tool. @param theReservedSize size to be reserved for vector of circles.

	:param Standard_Integer:
	:type Standard_Integer: 
	:rtype: inline void
") Init;
		inline void Init (const Standard_Integer);
		%feature("compactdefaultargs") SetCellSize;
		%feature("autodoc", "	* Sets new size for cell filter. @param theSize cell size to be set for X and Y dimensions.

	:param theSize:
	:type theSize: float
	:rtype: inline void
") SetCellSize;
		inline void SetCellSize (const Standard_Real theSize);
		%feature("compactdefaultargs") SetCellSize;
		%feature("autodoc", "	* Sets new size for cell filter. @param theSizeX cell size to be set for X dimension. @param theSizeY cell size to be set for Y dimension.

	:param theSizeX:
	:type theSizeX: float
	:param theSizeY:
	:type theSizeY: float
	:rtype: inline void
") SetCellSize;
		inline void SetCellSize (const Standard_Real theSizeX,const Standard_Real theSizeY);
		%feature("compactdefaultargs") SetMinMaxSize;
		%feature("autodoc", "	* Sets limits of inspection area. @param theMin bottom left corner of inspection area. @param theMax top right corner of inspection area.

	:param theMin:
	:type theMin: gp_XY
	:param theMax:
	:type theMax: gp_XY
	:rtype: inline void
") SetMinMaxSize;
		inline void SetMinMaxSize (const gp_XY & theMin,const gp_XY & theMax);
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	* Binds the circle to the tool. @param theIndex index a circle should be bound with. @param theCircle circle to be bound.

	:param theIndex:
	:type theIndex: int
	:param theCircle:
	:type theCircle: gp_Circ2d
	:rtype: None
") Bind;
		void Bind (const Standard_Integer theIndex,const gp_Circ2d & theCircle);
		%feature("compactdefaultargs") MakeCircle;
		%feature("autodoc", "	* Computes circle on three points. @param thePoint1 first point. @param thePoint2 second point. @param thePoint3 third point. @param[out] theLocation center of computed circle. @param[out] theRadius radius of computed circle. returns False in case of impossibility to build a circle on the given points, True elsewhere.

	:param thePoint1:
	:type thePoint1: gp_XY
	:param thePoint2:
	:type thePoint2: gp_XY
	:param thePoint3:
	:type thePoint3: gp_XY
	:param theLocation:
	:type theLocation: gp_XY
	:param theRadius:
	:type theRadius: float &
	:rtype: bool
") MakeCircle;
		static Standard_Boolean MakeCircle (const gp_XY & thePoint1,const gp_XY & thePoint2,const gp_XY & thePoint3,gp_XY & theLocation,Standard_Real &OutValue);
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	* Computes circle on three points and bind it to the tool. @param theIndex index a circle should be bound with. @param thePoint1 first point. @param thePoint2 second point. @param thePoint3 third point. returns False in case of impossibility to build a circle on the given points, True elsewhere.

	:param theIndex:
	:type theIndex: int
	:param thePoint1:
	:type thePoint1: gp_XY
	:param thePoint2:
	:type thePoint2: gp_XY
	:param thePoint3:
	:type thePoint3: gp_XY
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const Standard_Integer theIndex,const gp_XY & thePoint1,const gp_XY & thePoint2,const gp_XY & thePoint3);
		%feature("compactdefaultargs") MocBind;
		%feature("autodoc", "	* Binds implicit zero circle. @param theIndex index a zero circle should be bound with.

	:param theIndex:
	:type theIndex: int
	:rtype: None
") MocBind;
		void MocBind (const Standard_Integer theIndex);
		%feature("compactdefaultargs") Delete;
		%feature("autodoc", "	* Deletes a circle from the tool. @param theIndex index of a circle to be removed.

	:param theIndex:
	:type theIndex: int
	:rtype: None
") Delete;
		void Delete (const Standard_Integer theIndex);
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "	* Select the circles shot by the given point. @param thePoint bullet point.

	:param thePoint:
	:type thePoint: gp_XY
	:rtype: BRepMesh::ListOfInteger
") Select;
		BRepMesh::ListOfInteger & Select (const gp_XY & thePoint);
};


%extend BRepMesh_CircleTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepMesh_Classifier;
class BRepMesh_Classifier {
	public:
		%feature("compactdefaultargs") BRepMesh_Classifier;
		%feature("autodoc", "	* Constructor.

	:rtype: None
") BRepMesh_Classifier;
		 BRepMesh_Classifier ();
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	* Method is called on destruction. Clears internal data structures.

	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Performs classification of the given point regarding to face internals. @param thePoint Point in parametric space to be classified. returns

	:param thePoint:
	:type thePoint: gp_Pnt2d
	:rtype: TopAbs_State
") Perform;
		TopAbs_State Perform (const gp_Pnt2d & thePoint);
		%feature("compactdefaultargs") RegisterWire;
		%feature("autodoc", "	* Registers wire specified by sequence of points for further classification of points. @param theWire Wire to be registered. Specified by sequence of points. @param theTolUV Tolerance to be used for calculations in parametric space. @param theUmin Lower U boundary of the face in parametric space. @param theUmax Upper U boundary of the face in parametric space. @param theVmin Lower V boundary of the face in parametric space. @param theVmax Upper V boundary of the face in parametric space.

	:param theWire:
	:type theWire: NCollection_Sequence<gp_Pnt2d>
	:param theTolUV:
	:type theTolUV: float
	:param theUmin:
	:type theUmin: float
	:param theUmax:
	:type theUmax: float
	:param theVmin:
	:type theVmin: float
	:param theVmax:
	:type theVmax: float
	:rtype: None
") RegisterWire;
		void RegisterWire (const NCollection_Sequence<gp_Pnt2d> & theWire,const Standard_Real theTolUV,const Standard_Real theUmin,const Standard_Real theUmax,const Standard_Real theVmin,const Standard_Real theVmax);
};


%extend BRepMesh_Classifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepMesh_DataStructureOfDelaun;
class BRepMesh_DataStructureOfDelaun : public Standard_Transient {
	public:
		%feature("compactdefaultargs") BRepMesh_DataStructureOfDelaun;
		%feature("autodoc", "	* Constructor. @param theAllocator memory allocator to be used by internal structures. @param theReservedNodeSize presumed number of nodes in this mesh.

	:param theAllocator:
	:type theAllocator: Handle_NCollection_IncAllocator &
	:param theReservedNodeSize: default value is 100
	:type theReservedNodeSize: int
	:rtype: None
") BRepMesh_DataStructureOfDelaun;
		 BRepMesh_DataStructureOfDelaun (const Handle_NCollection_IncAllocator & theAllocator,const Standard_Integer theReservedNodeSize = 100);
		%feature("compactdefaultargs") NbNodes;
		%feature("autodoc", "	* @name API for accessing mesh nodes. Returns number of nodes.

	:rtype: inline int
") NbNodes;
		inline Standard_Integer NbNodes ();
		%feature("compactdefaultargs") AddNode;
		%feature("autodoc", "	* Adds node to the mesh if it is not already in the mesh. @param theNode node to be added to the mesh. @param isForceAdd adds the given node to structure without checking on coincidence with other nodes. returns index of the node in the structure.

	:param theNode:
	:type theNode: BRepMesh_Vertex &
	:param isForceAdd: default value is Standard_False
	:type isForceAdd: bool
	:rtype: int
") AddNode;
		Standard_Integer AddNode (const BRepMesh_Vertex & theNode,const Standard_Boolean isForceAdd = Standard_False);
		%feature("compactdefaultargs") IndexOf;
		%feature("autodoc", "	* Finds the index of the given node. @param theNode node to find. returns index of the given element of zero if node is not in the mesh.

	:param theNode:
	:type theNode: BRepMesh_Vertex &
	:rtype: int
") IndexOf;
		Standard_Integer IndexOf (const BRepMesh_Vertex & theNode);
		%feature("compactdefaultargs") GetNode;
		%feature("autodoc", "	* Get node by the index. @param theIndex index of a node. returns node with the given index.

	:param theIndex:
	:type theIndex: int
	:rtype: inline  BRepMesh_Vertex
") GetNode;
		inline const BRepMesh_Vertex & GetNode (const Standard_Integer theIndex);
		%feature("compactdefaultargs") SubstituteNode;
		%feature("autodoc", "	* Substitutes the node with the given index by new one. @param theIndex index of node to be substituted. @param theNewNode substituting node. returns False in case if new node is already in the structure, True elsewhere.

	:param theIndex:
	:type theIndex: int
	:param theNewNode:
	:type theNewNode: BRepMesh_Vertex &
	:rtype: bool
") SubstituteNode;
		Standard_Boolean SubstituteNode (const Standard_Integer theIndex,const BRepMesh_Vertex & theNewNode);
		%feature("compactdefaultargs") RemoveNode;
		%feature("autodoc", "	* Removes node from the mesh in case if it has no connected links and its type is Free. @param theIndex index of node to be removed. @param isForce if True node will be removed even if movability is not Free.

	:param theIndex:
	:type theIndex: int
	:param isForce: default value is Standard_False
	:type isForce: bool
	:rtype: None
") RemoveNode;
		void RemoveNode (const Standard_Integer theIndex,const Standard_Boolean isForce = Standard_False);
		%feature("compactdefaultargs") LinksConnectedTo;
		%feature("autodoc", "	* Get list of links attached to the node with the given index. @param theIndex index of node whose links should be retrieved. returns list of links attached to the node.

	:param theIndex:
	:type theIndex: int
	:rtype: inline  BRepMesh::ListOfInteger
") LinksConnectedTo;
		inline const BRepMesh::ListOfInteger & LinksConnectedTo (const Standard_Integer theIndex);
		%feature("compactdefaultargs") NbLinks;
		%feature("autodoc", "	* @name API for accessing mesh links. Returns number of links.

	:rtype: inline int
") NbLinks;
		inline Standard_Integer NbLinks ();
		%feature("compactdefaultargs") AddLink;
		%feature("autodoc", "	* Adds link to the mesh if it is not already in the mesh. @param theLink link to be added to the mesh. returns index of the link in the structure.

	:param theLink:
	:type theLink: BRepMesh_Edge &
	:rtype: int
") AddLink;
		Standard_Integer AddLink (const BRepMesh_Edge & theLink);
		%feature("compactdefaultargs") IndexOf;
		%feature("autodoc", "	* Finds the index of the given link. @param theLink link to find. returns index of the given element of zero if link is not in the mesh.

	:param theLink:
	:type theLink: BRepMesh_Edge &
	:rtype: int
") IndexOf;
		Standard_Integer IndexOf (const BRepMesh_Edge & theLink);
		%feature("compactdefaultargs") GetLink;
		%feature("autodoc", "	* Get link by the index. @param theIndex index of a link. returns link with the given index.

	:param theIndex:
	:type theIndex: int
	:rtype: BRepMesh_Edge
") GetLink;
		const BRepMesh_Edge & GetLink (const Standard_Integer theIndex);
		%feature("compactdefaultargs") LinksOfDomain;
		%feature("autodoc", "	* Returns map of indices of links registered in mesh.

	:rtype: inline  BRepMesh::MapOfInteger
") LinksOfDomain;
		inline const BRepMesh::MapOfInteger & LinksOfDomain ();
		%feature("compactdefaultargs") SubstituteLink;
		%feature("autodoc", "	* Substitutes the link with the given index by new one. @param theIndex index of link to be substituted. @param theNewLink substituting link. returns False in case if new link is already in the structure, True elsewhere.

	:param theIndex:
	:type theIndex: int
	:param theNewLink:
	:type theNewLink: BRepMesh_Edge &
	:rtype: bool
") SubstituteLink;
		Standard_Boolean SubstituteLink (const Standard_Integer theIndex,const BRepMesh_Edge & theNewLink);
		%feature("compactdefaultargs") RemoveLink;
		%feature("autodoc", "	* Removes link from the mesh in case if it has no connected elements and its type is Free. @param theIndex index of link to be removed. @param isForce if True link will be removed even if movability is not Free.

	:param theIndex:
	:type theIndex: int
	:param isForce: default value is Standard_False
	:type isForce: bool
	:rtype: None
") RemoveLink;
		void RemoveLink (const Standard_Integer theIndex,const Standard_Boolean isForce = Standard_False);
		%feature("compactdefaultargs") ElementsConnectedTo;
		%feature("autodoc", "	* Returns indices of elements conected to the link with the given index. @param theLinkIndex index of link whose data should be retrieved. returns indices of elements conected to the link.

	:param theLinkIndex:
	:type theLinkIndex: int
	:rtype: BRepMesh_PairOfIndex
") ElementsConnectedTo;
		const BRepMesh_PairOfIndex & ElementsConnectedTo (const Standard_Integer theLinkIndex);
		%feature("compactdefaultargs") NbElements;
		%feature("autodoc", "	* @name API for accessing mesh elements. Returns number of links.

	:rtype: inline int
") NbElements;
		inline Standard_Integer NbElements ();
		%feature("compactdefaultargs") AddElement;
		%feature("autodoc", "	* Adds element to the mesh if it is not already in the mesh. @param theElement element to be added to the mesh. returns index of the element in the structure.

	:param theElement:
	:type theElement: BRepMesh_Triangle &
	:rtype: int
") AddElement;
		Standard_Integer AddElement (const BRepMesh_Triangle & theElement);
		%feature("compactdefaultargs") IndexOf;
		%feature("autodoc", "	* Finds the index of the given element. @param theElement element to find. returns index of the given element of zero if element is not in the mesh.

	:param theElement:
	:type theElement: BRepMesh_Triangle &
	:rtype: int
") IndexOf;
		Standard_Integer IndexOf (const BRepMesh_Triangle & theElement);
		%feature("compactdefaultargs") GetElement;
		%feature("autodoc", "	* Get element by the index. @param theIndex index of an element. returns element with the given index.

	:param theIndex:
	:type theIndex: int
	:rtype: BRepMesh_Triangle
") GetElement;
		const BRepMesh_Triangle & GetElement (const Standard_Integer theIndex);
		%feature("compactdefaultargs") ElementsOfDomain;
		%feature("autodoc", "	* Returns map of indices of elements registered in mesh.

	:rtype: inline  BRepMesh::MapOfInteger
") ElementsOfDomain;
		inline const BRepMesh::MapOfInteger & ElementsOfDomain ();
		%feature("compactdefaultargs") SubstituteElement;
		%feature("autodoc", "	* Substitutes the element with the given index by new one. @param theIndex index of element to be substituted. @param theNewLink substituting element. returns False in case if new element is already in the structure, True elsewhere.

	:param theIndex:
	:type theIndex: int
	:param theNewElement:
	:type theNewElement: BRepMesh_Triangle &
	:rtype: bool
") SubstituteElement;
		Standard_Boolean SubstituteElement (const Standard_Integer theIndex,const BRepMesh_Triangle & theNewElement);
		%feature("compactdefaultargs") RemoveElement;
		%feature("autodoc", "	* Removes element from the mesh. @param theIndex index of element to be removed.

	:param theIndex:
	:type theIndex: int
	:rtype: None
") RemoveElement;
		void RemoveElement (const Standard_Integer theIndex);
		%feature("compactdefaultargs") ElementNodes;
		%feature("autodoc", "	* Returns indices of nodes forming the given element. @param theElement element which nodes should be retrieved. @param[out] theNodes nodes of the given element.

	:param theElement:
	:type theElement: BRepMesh_Triangle &
	:param :
	:type : int(&theNodes)
	:rtype: None
") ElementNodes;
		void ElementNodes (const BRepMesh_Triangle & theElement,Standard_Integer(&theNodes) [3]);

        %feature("autodoc", "1");
        %extend{
            std::string StatisticsToString() {
            std::stringstream s;
            self->Statistics(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") Allocator;
		%feature("autodoc", "	* Returns memory allocator used by the structure.

	:rtype: inline  Handle_NCollection_IncAllocator
") Allocator;
		Handle_NCollection_IncAllocator Allocator ();
		%feature("compactdefaultargs") Data;
		%feature("autodoc", "	* Gives the data structure for initialization of cell size and tolerance.

	:rtype: inline BRepMesh::HVertexTool
") Data;
		inline BRepMesh::HVertexTool & Data ();
		%feature("compactdefaultargs") ClearDomain;
		%feature("autodoc", "	* Removes all elements.

	:rtype: None
") ClearDomain;
		void ClearDomain ();
		%feature("compactdefaultargs") ClearDeleted;
		%feature("autodoc", "	* Substitutes deleted items by the last one from corresponding map to have only non-deleted elements, links or nodes in the structure.

	:rtype: None
") ClearDeleted;
		void ClearDeleted ();
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
class Handle_BRepMesh_DataStructureOfDelaun : public Handle_Standard_Transient {

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
    BRepMesh_DataStructureOfDelaun* _get_reference() {
    return (BRepMesh_DataStructureOfDelaun*)$self->Access();
    }
};

%extend Handle_BRepMesh_DataStructureOfDelaun {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BRepMesh_DataStructureOfDelaun {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepMesh_Delaun;
class BRepMesh_Delaun {
	public:
		%feature("compactdefaultargs") BRepMesh_Delaun;
		%feature("autodoc", "	* Creates the triangulation with an empty Mesh data structure.

	:param theVertices:
	:type theVertices: BRepMesh::Array1OfVertexOfDelaun &
	:rtype: None
") BRepMesh_Delaun;
		 BRepMesh_Delaun (BRepMesh::Array1OfVertexOfDelaun & theVertices);
		%feature("compactdefaultargs") BRepMesh_Delaun;
		%feature("autodoc", "	* Creates the triangulation with an existent Mesh data structure.

	:param theOldMesh:
	:type theOldMesh: Handle_BRepMesh_DataStructureOfDelaun &
	:param theVertices:
	:type theVertices: BRepMesh::Array1OfVertexOfDelaun &
	:rtype: None
") BRepMesh_Delaun;
		 BRepMesh_Delaun (const Handle_BRepMesh_DataStructureOfDelaun & theOldMesh,BRepMesh::Array1OfVertexOfDelaun & theVertices);
		%feature("compactdefaultargs") BRepMesh_Delaun;
		%feature("autodoc", "	* Creates the triangulation with an existant Mesh data structure.

	:param theOldMesh:
	:type theOldMesh: Handle_BRepMesh_DataStructureOfDelaun &
	:param theVertexIndices:
	:type theVertexIndices: BRepMesh::Array1OfInteger &
	:rtype: None
") BRepMesh_Delaun;
		 BRepMesh_Delaun (const Handle_BRepMesh_DataStructureOfDelaun & theOldMesh,BRepMesh::Array1OfInteger & theVertexIndices);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initializes the triangulation with an array of vertices.

	:param theVertices:
	:type theVertices: BRepMesh::Array1OfVertexOfDelaun &
	:rtype: None
") Init;
		void Init (BRepMesh::Array1OfVertexOfDelaun & theVertices);
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
	:type theVertices: BRepMesh::Array1OfVertexOfDelaun &
	:rtype: None
") AddVertices;
		void AddVertices (BRepMesh::Array1OfVertexOfDelaun & theVertices);
		%feature("compactdefaultargs") UseEdge;
		%feature("autodoc", "	* Modify mesh to use the edge. returns True if done

	:param theEdge:
	:type theEdge: int
	:rtype: bool
") UseEdge;
		Standard_Boolean UseEdge (const Standard_Integer theEdge);
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "	* Gives the Mesh data structure.

	:rtype: inline  Handle_BRepMesh_DataStructureOfDelaun
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
		%feature("compactdefaultargs") Circles;
		%feature("autodoc", "	* Returns tool used to build mesh consistent to Delaunay criteria.

	:rtype: inline  BRepMesh_CircleTool
") Circles;
		inline const BRepMesh_CircleTool & Circles ();
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	* Test is the given triangle contains the given vertex. If theEdgeOn != 0 the vertex lies onto the edge index returned through this parameter.

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


%extend BRepMesh_Delaun {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepMesh_DiscretFactory;
%ignore BRepMesh_DiscretFactory::~BRepMesh_DiscretFactory();
class BRepMesh_DiscretFactory {
	public:
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	* Returns the global factory instance.

	:rtype: BRepMesh_DiscretFactory
") Get;
		static BRepMesh_DiscretFactory & Get ();
		%feature("compactdefaultargs") Names;
		%feature("autodoc", "	* Returns the list of registered meshing algorithms.

	:rtype: inline  TColStd_MapOfAsciiString
") Names;
		inline const TColStd_MapOfAsciiString & Names ();
		%feature("compactdefaultargs") SetDefaultName;
		%feature("autodoc", "	* Setup meshing algorithm by name. Returns True if requested tool is available. On fail Factory will continue to use previous algo.

	:param theName:
	:type theName: TCollection_AsciiString &
	:rtype: bool
") SetDefaultName;
		Standard_Boolean SetDefaultName (const TCollection_AsciiString & theName);
		%feature("compactdefaultargs") DefaultName;
		%feature("autodoc", "	* Returns name for current meshing algorithm.

	:rtype: inline  TCollection_AsciiString
") DefaultName;
		inline const TCollection_AsciiString & DefaultName ();
		%feature("compactdefaultargs") SetFunctionName;
		%feature("autodoc", "	* Advanced function. Changes function name to retrieve from plugin. Returns True if requested tool is available. On fail Factory will continue to use previous algo.

	:param theFuncName:
	:type theFuncName: TCollection_AsciiString &
	:rtype: bool
") SetFunctionName;
		Standard_Boolean SetFunctionName (const TCollection_AsciiString & theFuncName);
		%feature("compactdefaultargs") FunctionName;
		%feature("autodoc", "	* Returns function name that should be exported by plugin.

	:rtype: inline  TCollection_AsciiString
") FunctionName;
		inline const TCollection_AsciiString & FunctionName ();
		%feature("compactdefaultargs") ErrorStatus;
		%feature("autodoc", "	* Returns error status for last meshing algorithm switch.

	:rtype: inline BRepMesh_FactoryError
") ErrorStatus;
		inline BRepMesh_FactoryError ErrorStatus ();
		%feature("compactdefaultargs") SetDefault;
		%feature("autodoc", "	* Setup meshing algorithm that should be created by this Factory. Returns True if requested tool is available. On fail Factory will continue to use previous algo. Call ::ErrorStatus() method to retrieve fault reason.

	:param theName:
	:type theName: TCollection_AsciiString &
	:param theFuncName: default value is 'DISCRETALGO'
	:type theFuncName: TCollection_AsciiString &
	:rtype: bool
") SetDefault;
		Standard_Boolean SetDefault (const TCollection_AsciiString & theName,const TCollection_AsciiString & theFuncName = "DISCRETALGO");
		%feature("compactdefaultargs") Discret;
		%feature("autodoc", "	* Returns triangulation algorithm instance. @param theShape shape to be meshed. @param theLinDeflection linear deflection to be used for meshing. @param theAngDeflection angular deflection to be used for meshing.

	:param theShape:
	:type theShape: TopoDS_Shape &
	:param theLinDeflection:
	:type theLinDeflection: float
	:param theAngDeflection:
	:type theAngDeflection: float
	:rtype: Handle_BRepMesh_DiscretRoot
") Discret;
		Handle_BRepMesh_DiscretRoot Discret (const TopoDS_Shape & theShape,const Standard_Real theLinDeflection,const Standard_Real theAngDeflection);
};


%extend BRepMesh_DiscretFactory {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepMesh_DiscretRoot;
class BRepMesh_DiscretRoot : public Standard_Transient {
	public:
		%feature("compactdefaultargs") SetDeflection;
		%feature("autodoc", "	* Setup linear deflection.

	:param theDeflection:
	:type theDeflection: float
	:rtype: inline void
") SetDeflection;
		inline void SetDeflection (const Standard_Real theDeflection);
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "	* Returns linear deflection.

	:rtype: inline float
") Deflection;
		inline Standard_Real Deflection ();
		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", "	* Setup angular deflection.

	:param theAngle:
	:type theAngle: float
	:rtype: inline void
") SetAngle;
		inline void SetAngle (const Standard_Real theAngle);
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "	* Returns angular deflection.

	:rtype: inline float
") Angle;
		inline Standard_Real Angle ();
		%feature("compactdefaultargs") SetShape;
		%feature("autodoc", "	* Set the shape to triangulate.

	:param theShape:
	:type theShape: TopoDS_Shape &
	:rtype: inline void
") SetShape;
		inline void SetShape (const TopoDS_Shape & theShape);
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	:rtype: inline  TopoDS_Shape
") Shape;
		inline const TopoDS_Shape  Shape ();
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns true if triangualtion was performed and has success.

	:rtype: inline bool
") IsDone;
		inline Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Compute triangulation for set shape.

	:rtype: void
") Perform;
		virtual void Perform ();
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
    BRepMesh_DiscretRoot* _get_reference() {
    return (BRepMesh_DiscretRoot*)$self->Access();
    }
};

%extend Handle_BRepMesh_DiscretRoot {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BRepMesh_DiscretRoot {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepMesh_FastDiscret;
class BRepMesh_FastDiscret : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Build triangulation on the whole shape.

	:param shape:
	:type shape: TopoDS_Shape &
	:rtype: None
") Perform;
		void Perform (const TopoDS_Shape & shape);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Record a face for further processing. returns status flags collected during discretization of boundaries of the given face.

	:param face:
	:type face: TopoDS_Face &
	:rtype: int
") Add;
		Standard_Integer Add (const TopoDS_Face & face);
		%feature("compactdefaultargs") Process;
		%feature("autodoc", "	* Triangulate a face previously recorded for processing by call to Add(). Can be executed in parallel threads.

	:param face:
	:type face: TopoDS_Face &
	:rtype: None
") Process;
		void Process (const TopoDS_Face & face);
		%feature("compactdefaultargs") SetParallel;
		%feature("autodoc", "	* Request algorithm to launch in multiple threads to improve performance (should be supported by plugin).

	:param theInParallel:
	:type theInParallel: bool
	:rtype: inline void
") SetParallel;
		inline void SetParallel (const Standard_Boolean theInParallel);
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "	* Returns the multi-threading usage flag.

	:rtype: inline bool
") IsParallel;
		inline Standard_Boolean IsParallel ();
		%feature("compactdefaultargs") GetDeflection;
		%feature("autodoc", "	* returns the deflection value.

	:rtype: inline float
") GetDeflection;
		inline Standard_Real GetDeflection ();
		%feature("compactdefaultargs") GetAngle;
		%feature("autodoc", "	* returns the deflection value.

	:rtype: inline float
") GetAngle;
		inline Standard_Real GetAngle ();
		%feature("compactdefaultargs") WithShare;
		%feature("autodoc", "	:rtype: inline bool
") WithShare;
		inline Standard_Boolean WithShare ();
		%feature("compactdefaultargs") InShape;
		%feature("autodoc", "	:rtype: inline bool
") InShape;
		inline Standard_Boolean InShape ();
		%feature("compactdefaultargs") ShapeTrigu;
		%feature("autodoc", "	:rtype: inline bool
") ShapeTrigu;
		inline Standard_Boolean ShapeTrigu ();
		%feature("compactdefaultargs") InitSharedFaces;
		%feature("autodoc", "	:param theShape:
	:type theShape: TopoDS_Shape &
	:rtype: None
") InitSharedFaces;
		void InitSharedFaces (const TopoDS_Shape & theShape);
		%feature("compactdefaultargs") SharedFaces;
		%feature("autodoc", "	:rtype: inline  TopTools_IndexedDataMapOfShapeListOfShape
") SharedFaces;
		inline const TopTools_IndexedDataMapOfShapeListOfShape & SharedFaces ();
		%feature("compactdefaultargs") GetFaceAttribute;
		%feature("autodoc", "	* Gives face attribute.

	:param theFace:
	:type theFace: TopoDS_Face &
	:param theAttribute:
	:type theAttribute: Handle_BRepMesh_FaceAttribute &
	:rtype: bool
") GetFaceAttribute;
		Standard_Boolean GetFaceAttribute (const TopoDS_Face & theFace,Handle_BRepMesh_FaceAttribute & theAttribute);
		%feature("compactdefaultargs") RemoveFaceAttribute;
		%feature("autodoc", "	* Remove face attribute as useless to free locate memory.

	:param theFace:
	:type theFace: TopoDS_Face &
	:rtype: None
") RemoveFaceAttribute;
		void RemoveFaceAttribute (const TopoDS_Face & theFace);
		%feature("compactdefaultargs") NbBoundaryPoints;
		%feature("autodoc", "	* Returns number of boundary 3d points.

	:rtype: inline int
") NbBoundaryPoints;
		inline Standard_Integer NbBoundaryPoints ();
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
class Handle_BRepMesh_FastDiscret : public Handle_Standard_Transient {

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
    BRepMesh_FastDiscret* _get_reference() {
    return (BRepMesh_FastDiscret*)$self->Access();
    }
};

%extend Handle_BRepMesh_FastDiscret {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BRepMesh_FastDiscret {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepMesh_FastDiscretFace;
class BRepMesh_FastDiscretFace : public Standard_Transient {
	public:
		%feature("compactdefaultargs") BRepMesh_FastDiscretFace;
		%feature("autodoc", "	* Constructor. @param theAngle deviation angle to be used for surface tessellation. @param isInternalVerticesMode flag enabling/disabling internal vertices mode. @param isControlSurfaceDeflection enables/disables adaptive reconfiguration of mesh.

	:param theAngle:
	:type theAngle: float
	:param theMinSize:
	:type theMinSize: float
	:param isInternalVerticesMode:
	:type isInternalVerticesMode: bool
	:param isControlSurfaceDeflection:
	:type isControlSurfaceDeflection: bool
	:rtype: None
") BRepMesh_FastDiscretFace;
		 BRepMesh_FastDiscretFace (const Standard_Real theAngle,const Standard_Real theMinSize,const Standard_Boolean isInternalVerticesMode,const Standard_Boolean isControlSurfaceDeflection);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param theAttribute:
	:type theAttribute: Handle_BRepMesh_FaceAttribute &
	:rtype: None
") Perform;
		void Perform (const Handle_BRepMesh_FaceAttribute & theAttribute);
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
class Handle_BRepMesh_FastDiscretFace : public Handle_Standard_Transient {

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
    BRepMesh_FastDiscretFace* _get_reference() {
    return (BRepMesh_FastDiscretFace*)$self->Access();
    }
};

%extend Handle_BRepMesh_FastDiscretFace {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BRepMesh_FastDiscretFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepMesh_GeomTool;
class BRepMesh_GeomTool {
	public:
/* public enums */
enum IntFlag {
	NoIntersection = 0,
	Cross = 1,
	EndPointTouch = 2,
	PointOnSegment = 3,
	Glued = 4,
	Same = 5,
};

/* end public enums declaration */

		%feature("compactdefaultargs") AddPoint;
		%feature("autodoc", "	* Adds point to already calculated points (or replaces existing). @param thePoint point to be added. @param theParam parameter on the curve corresponding to the given point. @param theIsReplace if True replaces existing point lying within parameteric tolerance of the given point. returns index of new added point or found with parametric tolerance

	:param thePoint:
	:type thePoint: gp_Pnt
	:param theParam:
	:type theParam: float
	:param theIsReplace: default value is Standard_True
	:type theIsReplace: bool
	:rtype: inline int
") AddPoint;
		inline Standard_Integer AddPoint (const gp_Pnt & thePoint,const Standard_Real theParam,const Standard_Boolean theIsReplace = Standard_True);
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "	* Returns number of discretization points.

	:rtype: inline int
") NbPoints;
		inline Standard_Integer NbPoints ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Gets parameters of discretization point with the given index. @param theIndex index of discretization point. @param theIsoParam parameter on surface to be used as second coordinate of resulting 2d point. @param theParam[out] parameter of the point on the iso curve. @param thePoint[out] discretization point. @param theUV[out] discretization point in parametric space of the surface. returns True on success, False elsewhere.

	:param theIndex:
	:type theIndex: int
	:param theIsoParam:
	:type theIsoParam: float
	:param theParam:
	:type theParam: float &
	:param thePoint:
	:type thePoint: gp_Pnt
	:param theUV:
	:type theUV: gp_Pnt2d
	:rtype: bool
") Value;
		Standard_Boolean Value (const Standard_Integer theIndex,const Standard_Real theIsoParam,Standard_Real &OutValue,gp_Pnt & thePoint,gp_Pnt2d & theUV);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Gets parameters of discretization point with the given index. @param theIndex index of discretization point. @param theSurface surface the curve is lying onto. @param theParam[out] parameter of the point on the curve. @param thePoint[out] discretization point. @param theUV[out] discretization point in parametric space of the surface. returns True on success, False elsewhere.

	:param theIndex:
	:type theIndex: int
	:param theSurface:
	:type theSurface: Handle_BRepAdaptor_HSurface &
	:param theParam:
	:type theParam: float &
	:param thePoint:
	:type thePoint: gp_Pnt
	:param theUV:
	:type theUV: gp_Pnt2d
	:rtype: bool
") Value;
		Standard_Boolean Value (const Standard_Integer theIndex,const Handle_BRepAdaptor_HSurface & theSurface,Standard_Real &OutValue,gp_Pnt & thePoint,gp_Pnt2d & theUV);
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "	* @name static API Computes normal to the given surface at the specified position in parametric space. @param theSurface surface the normal should be found for. @param theParamU U parameter in parametric space of the surface. @param theParamV V parameter in parametric space of the surface. @param[out] thePoint 3d point corresponding to the given parameters. @param[out] theNormal normal vector at the point specified by the parameters. returns False if the normal can not be computed, True elsewhere.

	:param theSurface:
	:type theSurface: Handle_BRepAdaptor_HSurface &
	:param theParamU:
	:type theParamU: float
	:param theParamV:
	:type theParamV: float
	:param thePoint:
	:type thePoint: gp_Pnt
	:param theNormal:
	:type theNormal: gp_Dir
	:rtype: bool
") Normal;
		static Standard_Boolean Normal (const Handle_BRepAdaptor_HSurface & theSurface,const Standard_Real theParamU,const Standard_Real theParamV,gp_Pnt & thePoint,gp_Dir & theNormal);
		%feature("compactdefaultargs") IntLinLin;
		%feature("autodoc", "	* Checks intersection between two lines defined by two points. @param theStartPnt1 start point of first line. @param theEndPnt1 end point of first line. @param theStartPnt2 start point of second line. @param theEndPnt2 end point of second line. @param[out] theIntPnt point of intersection. @param[out] theParamOnSegment parameters of intersection point corresponding to first and second segment. returns status of intersection check.

	:param theStartPnt1:
	:type theStartPnt1: gp_XY
	:param theEndPnt1:
	:type theEndPnt1: gp_XY
	:param theStartPnt2:
	:type theStartPnt2: gp_XY
	:param theEndPnt2:
	:type theEndPnt2: gp_XY
	:param theIntPnt:
	:type theIntPnt: gp_XY
	:param :
	:type : float(&theParamOnSegment)
	:rtype: IntFlag
") IntLinLin;
		static IntFlag IntLinLin (const gp_XY & theStartPnt1,const gp_XY & theEndPnt1,const gp_XY & theStartPnt2,const gp_XY & theEndPnt2,gp_XY & theIntPnt,Standard_Real(&theParamOnSegment) [2]);
		%feature("compactdefaultargs") IntSegSeg;
		%feature("autodoc", "	* Checks intersection between the two segments. Checks that intersection point lies within ranges of both segments. @param theStartPnt1 start point of first segment. @param theEndPnt1 end point of first segment. @param theStartPnt2 start point of second segment. @param theEndPnt2 end point of second segment. @param isConsiderEndPointTouch if True EndPointTouch status will be returned in case if segments are touching by end points, if False returns NoIntersection flag. @param isConsiderPointOnSegment if True PointOnSegment status will be returned in case if end point of one segment lies onto another one, if False returns NoIntersection flag. @param[out] theIntPnt point of intersection. returns status of intersection check.

	:param theStartPnt1:
	:type theStartPnt1: gp_XY
	:param theEndPnt1:
	:type theEndPnt1: gp_XY
	:param theStartPnt2:
	:type theStartPnt2: gp_XY
	:param theEndPnt2:
	:type theEndPnt2: gp_XY
	:param isConsiderEndPointTouch:
	:type isConsiderEndPointTouch: bool
	:param isConsiderPointOnSegment:
	:type isConsiderPointOnSegment: bool
	:param theIntPnt:
	:type theIntPnt: gp_Pnt2d
	:rtype: IntFlag
") IntSegSeg;
		static IntFlag IntSegSeg (const gp_XY & theStartPnt1,const gp_XY & theEndPnt1,const gp_XY & theStartPnt2,const gp_XY & theEndPnt2,const Standard_Boolean isConsiderEndPointTouch,const Standard_Boolean isConsiderPointOnSegment,gp_Pnt2d & theIntPnt);
};


%extend BRepMesh_GeomTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepMesh_IEdgeTool;
class BRepMesh_IEdgeTool : public Standard_Transient {
	public:
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "	* Returns number of tessellation points.

	:rtype: int
") NbPoints;
		Standard_Integer NbPoints ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns parameters of solution with the given index. @param theIndex index of tessellation point. @param theParameter parameters on PCurve corresponded to the solution. @param thePoint tessellation point. @param theUV coordinates of tessellation point in parametric space of face.

	:param theIndex:
	:type theIndex: int
	:param theParameter:
	:type theParameter: float &
	:param thePoint:
	:type thePoint: gp_Pnt
	:param theUV:
	:type theUV: gp_Pnt2d
	:rtype: None
") Value;
		void Value (const Standard_Integer theIndex,Standard_Real &OutValue,gp_Pnt & thePoint,gp_Pnt2d & theUV);
};


%extend BRepMesh_IEdgeTool {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepMesh_IEdgeTool(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepMesh_IEdgeTool::Handle_BRepMesh_IEdgeTool %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BRepMesh_IEdgeTool;
class Handle_BRepMesh_IEdgeTool : public Handle_Standard_Transient {

    public:
        // constructors
        Handle_BRepMesh_IEdgeTool();
        Handle_BRepMesh_IEdgeTool(const Handle_BRepMesh_IEdgeTool &aHandle);
        Handle_BRepMesh_IEdgeTool(const BRepMesh_IEdgeTool *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepMesh_IEdgeTool DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepMesh_IEdgeTool {
    BRepMesh_IEdgeTool* _get_reference() {
    return (BRepMesh_IEdgeTool*)$self->Access();
    }
};

%extend Handle_BRepMesh_IEdgeTool {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BRepMesh_IEdgeTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepMesh_OrientedEdge;
class BRepMesh_OrientedEdge {
	public:
		%feature("compactdefaultargs") BRepMesh_OrientedEdge;
		%feature("autodoc", "	* Default constructor.

	:rtype: None
") BRepMesh_OrientedEdge;
		 BRepMesh_OrientedEdge ();
		%feature("compactdefaultargs") BRepMesh_OrientedEdge;
		%feature("autodoc", "	* Constructs a link between two vertices.

	:param theFirstNode:
	:type theFirstNode: int
	:param theLastNode:
	:type theLastNode: int
	:rtype: None
") BRepMesh_OrientedEdge;
		 BRepMesh_OrientedEdge (const Standard_Integer theFirstNode,const Standard_Integer theLastNode);
		%feature("compactdefaultargs") FirstNode;
		%feature("autodoc", "	* Returns index of first node of the Link.

	:rtype: inline int
") FirstNode;
		inline Standard_Integer FirstNode ();
		%feature("compactdefaultargs") LastNode;
		%feature("autodoc", "	* Returns index of last node of the Link.

	:rtype: inline int
") LastNode;
		inline Standard_Integer LastNode ();
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "	* Returns hash code for this edge. @param theUpper upper index in the container. returns hash code.

	:param theUpper:
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
		%feature("autodoc", "	* Checks this and other edge for equality. @param theOther edge to be checked against this one. @retrun True if edges have the same orientation, False if not.

	:param theOther:
	:type theOther: BRepMesh_OrientedEdge &
	:rtype: inline bool
") IsEqual;
		inline Standard_Boolean IsEqual (const BRepMesh_OrientedEdge & theOther);

        %extend{
            bool __eq_wrapper__(const BRepMesh_OrientedEdge  other) {
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


%extend BRepMesh_OrientedEdge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepMesh_PairOfIndex;
class BRepMesh_PairOfIndex {
	public:
		%feature("compactdefaultargs") BRepMesh_PairOfIndex;
		%feature("autodoc", "	* Default constructor

	:rtype: None
") BRepMesh_PairOfIndex;
		 BRepMesh_PairOfIndex ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clears indices.

	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	* Appends index to the pair.

	:param theIndex:
	:type theIndex: int
	:rtype: inline void
") Append;
		inline void Append (const Standard_Integer theIndex);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	* Prepends index to the pair.

	:param theIndex:
	:type theIndex: int
	:rtype: inline void
") Prepend;
		inline void Prepend (const Standard_Integer theIndex);
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	* Returns is pair is empty.

	:rtype: inline bool
") IsEmpty;
		inline Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	* Returns number of initialized indeces.

	:rtype: inline int
") Extent;
		inline Standard_Integer Extent ();
		%feature("compactdefaultargs") FirstIndex;
		%feature("autodoc", "	* Returns first index of pair.

	:rtype: inline int
") FirstIndex;
		inline Standard_Integer FirstIndex ();
		%feature("compactdefaultargs") LastIndex;
		%feature("autodoc", "	* Returns last index of pair

	:rtype: inline int
") LastIndex;
		inline Standard_Integer LastIndex ();
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "	* Returns index corresponding to the given position in the pair. @param thePairPos position of index in the pair (1 or 2).

	:param thePairPos:
	:type thePairPos: int
	:rtype: inline int
") Index;
		inline Standard_Integer Index (const Standard_Integer thePairPos);
		%feature("compactdefaultargs") SetIndex;
		%feature("autodoc", "	* Sets index corresponding to the given position in the pair. @param thePairPos position of index in the pair (1 or 2). @param theIndex index to be stored.

	:param thePairPos:
	:type thePairPos: int
	:param theIndex:
	:type theIndex: int
	:rtype: inline void
") SetIndex;
		inline void SetIndex (const Standard_Integer thePairPos,const Standard_Integer theIndex);
		%feature("compactdefaultargs") RemoveIndex;
		%feature("autodoc", "	* Remove index from the given position. @param thePairPos position of index in the pair (1 or 2).

	:param thePairPos:
	:type thePairPos: int
	:rtype: inline void
") RemoveIndex;
		inline void RemoveIndex (const Standard_Integer thePairPos);
};


%extend BRepMesh_PairOfIndex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepMesh_PairOfPolygon;
class BRepMesh_PairOfPolygon {
	public:
		%feature("compactdefaultargs") BRepMesh_PairOfPolygon;
		%feature("autodoc", "	* Constructor. Creates empty pair with null fileds.

	:rtype: None
") BRepMesh_PairOfPolygon;
		 BRepMesh_PairOfPolygon ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clears pair handles.

	:rtype: inline void
") Clear;
		inline void Clear ();
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	* Sets the first element of the pair. If last element is empty, also assignes the given polygon to it. @param thePolygon plygon to be set.

	:param thePolygon:
	:type thePolygon: Handle_Poly_PolygonOnTriangulation &
	:rtype: inline void
") Prepend;
		inline void Prepend (const Handle_Poly_PolygonOnTriangulation & thePolygon);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	* Sets the last element of the pair. If first element is empty, also assignes the given polygon to it. @param thePolygon plygon to be set.

	:param thePolygon:
	:type thePolygon: Handle_Poly_PolygonOnTriangulation &
	:rtype: inline void
") Append;
		inline void Append (const Handle_Poly_PolygonOnTriangulation & thePolygon);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	* Returns first polygon on triangulation.

	:rtype: inline  Handle_Poly_PolygonOnTriangulation
") First;
		Handle_Poly_PolygonOnTriangulation First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	* Returns last polygon on triangulation.

	:rtype: inline  Handle_Poly_PolygonOnTriangulation
") Last;
		Handle_Poly_PolygonOnTriangulation Last ();
};


%extend BRepMesh_PairOfPolygon {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepMesh_SelectorOfDataStructureOfDelaun;
class BRepMesh_SelectorOfDataStructureOfDelaun {
	public:
		%feature("compactdefaultargs") BRepMesh_SelectorOfDataStructureOfDelaun;
		%feature("autodoc", "	* Default constructor.

	:rtype: None
") BRepMesh_SelectorOfDataStructureOfDelaun;
		 BRepMesh_SelectorOfDataStructureOfDelaun ();
		%feature("compactdefaultargs") BRepMesh_SelectorOfDataStructureOfDelaun;
		%feature("autodoc", "	* Constructor. Initializes selector by the mesh.

	:param theMesh:
	:type theMesh: Handle_BRepMesh_DataStructureOfDelaun &
	:rtype: None
") BRepMesh_SelectorOfDataStructureOfDelaun;
		 BRepMesh_SelectorOfDataStructureOfDelaun (const Handle_BRepMesh_DataStructureOfDelaun & theMesh);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* Initializes selector by the mesh.

	:param theMesh:
	:type theMesh: Handle_BRepMesh_DataStructureOfDelaun &
	:rtype: None
") Initialize;
		void Initialize (const Handle_BRepMesh_DataStructureOfDelaun & theMesh);
		%feature("compactdefaultargs") NeighboursOf;
		%feature("autodoc", "	* Selects all neighboring elements of the given node.

	:param theNode:
	:type theNode: BRepMesh_Vertex &
	:rtype: None
") NeighboursOf;
		void NeighboursOf (const BRepMesh_Vertex & theNode);
		%feature("compactdefaultargs") NeighboursOfNode;
		%feature("autodoc", "	* Selects all neighboring elements of node with the given index.

	:param theNodeIndex:
	:type theNodeIndex: int
	:rtype: None
") NeighboursOfNode;
		void NeighboursOfNode (const Standard_Integer theNodeIndex);
		%feature("compactdefaultargs") NeighboursOf;
		%feature("autodoc", "	* Selects all neighboring elements of the given link.

	:param theLink:
	:type theLink: BRepMesh_Edge &
	:rtype: None
") NeighboursOf;
		void NeighboursOf (const BRepMesh_Edge & theLink);
		%feature("compactdefaultargs") NeighboursOfLink;
		%feature("autodoc", "	* Selects all neighboring elements of link with the given index.

	:param theLinkIndex:
	:type theLinkIndex: int
	:rtype: None
") NeighboursOfLink;
		void NeighboursOfLink (const Standard_Integer theLinkIndex);
		%feature("compactdefaultargs") NeighboursOf;
		%feature("autodoc", "	* Selects all neighboring elements of the given element.

	:param theElement:
	:type theElement: BRepMesh_Triangle &
	:rtype: None
") NeighboursOf;
		void NeighboursOf (const BRepMesh_Triangle & theElement);
		%feature("compactdefaultargs") NeighboursOfElement;
		%feature("autodoc", "	* Selects all neighboring elements by nodes of the given element.

	:param theElementIndex:
	:type theElementIndex: int
	:rtype: None
") NeighboursOfElement;
		void NeighboursOfElement (const Standard_Integer theElementIndex);
		%feature("compactdefaultargs") NeighboursByEdgeOf;
		%feature("autodoc", "	* Selects all neighboring elements by links of the given element.

	:param theElement:
	:type theElement: BRepMesh_Triangle &
	:rtype: None
") NeighboursByEdgeOf;
		void NeighboursByEdgeOf (const BRepMesh_Triangle & theElement);
		%feature("compactdefaultargs") NeighboursOf;
		%feature("autodoc", "	* Adds a level of neighbours by edge to the selector.

	:param &:
	:type &: BRepMesh_SelectorOfDataStructureOfDelaun
	:rtype: inline void
") NeighboursOf;
		inline void NeighboursOf (const BRepMesh_SelectorOfDataStructureOfDelaun &);
		%feature("compactdefaultargs") AddNeighbours;
		%feature("autodoc", "	* Adds a level of neighbours by edge the selector.

	:rtype: inline void
") AddNeighbours;
		inline void AddNeighbours ();
		%feature("compactdefaultargs") Nodes;
		%feature("autodoc", "	* Returns selected nodes.

	:rtype: inline  BRepMesh::MapOfInteger
") Nodes;
		inline const BRepMesh::MapOfInteger & Nodes ();
		%feature("compactdefaultargs") Links;
		%feature("autodoc", "	* Returns selected links.

	:rtype: inline  BRepMesh::MapOfInteger
") Links;
		inline const BRepMesh::MapOfInteger & Links ();
		%feature("compactdefaultargs") Elements;
		%feature("autodoc", "	* Returns selected elements.

	:rtype: inline  BRepMesh::MapOfInteger
") Elements;
		inline const BRepMesh::MapOfInteger & Elements ();
		%feature("compactdefaultargs") FrontierLinks;
		%feature("autodoc", "	* Gives the list of incices of frontier links.

	:rtype: inline  BRepMesh::MapOfInteger
") FrontierLinks;
		inline const BRepMesh::MapOfInteger & FrontierLinks ();
};


%extend BRepMesh_SelectorOfDataStructureOfDelaun {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class BRepMesh_ShapeTool {
	public:
		%feature("compactdefaultargs") MaxFaceTolerance;
		%feature("autodoc", "	* Returns maximum tolerance of the given face. Considers tolerances of edges and vertices contained in the given face.

	:param theFace:
	:type theFace: TopoDS_Face &
	:rtype: float
") MaxFaceTolerance;
		static Standard_Real MaxFaceTolerance (const TopoDS_Face & theFace);
		%feature("compactdefaultargs") BoxMaxDimension;
		%feature("autodoc", "	* Gets the maximum dimension of the given bounding box. If the given bounding box is void leaves the resulting value unchanged. @param theBox bounding box to be processed. @param theMaxDimension maximum dimension of the given box.

	:param theBox:
	:type theBox: Bnd_Box &
	:param theMaxDimension:
	:type theMaxDimension: float &
	:rtype: void
") BoxMaxDimension;
		static void BoxMaxDimension (const Bnd_Box & theBox,Standard_Real &OutValue);
		%feature("compactdefaultargs") RelativeEdgeDeflection;
		%feature("autodoc", "	* Returns relative deflection for edge with respect to shape size. @param theEdge edge for which relative deflection should be computed. @param theDeflection absolute deflection. @param theMaxShapeSize maximum size of a shape. @param theAdjustmentCoefficient coefficient of adjustment between maximum size of shape and calculated relative deflection. returns relative deflection for the edge.

	:param theEdge:
	:type theEdge: TopoDS_Edge &
	:param theDeflection:
	:type theDeflection: float
	:param theMaxShapeSize:
	:type theMaxShapeSize: float
	:param theAdjustmentCoefficient:
	:type theAdjustmentCoefficient: float &
	:rtype: float
") RelativeEdgeDeflection;
		static Standard_Real RelativeEdgeDeflection (const TopoDS_Edge & theEdge,const Standard_Real theDeflection,const Standard_Real theMaxShapeSize,Standard_Real &OutValue);
		%feature("compactdefaultargs") FindUV;
		%feature("autodoc", "	* Checks 2d representations of 3d point with the given index for equality to avoid duplications. @param theIndexOfPnt3d index of 3d point with which 2d representation should be associated. @param thePnt2d 2d representation of the point with the given index. @param theVertex vertex corresponded to 3d point with the given index. Used to extract vertex tolerance in 3d space. @param theMinDistance minimum distance between vertices regarding which they could be treated as distinct ones. This value is defined by mesher using parameters given by user in connection with shape metrics. @param theFaceAttribute attributes contining data calculated according to face geomtry and define limits of face in parametric space. If defined, will be used instead of surface parameter. @param theLocation2dMap map of 2d representations of 3d points. returns given 2d point in case if 3d poind does not alredy have the similar representation, otherwice 2d point corresponding to existing representation will be returned.

	:param theIndexOfPnt3d:
	:type theIndexOfPnt3d: int
	:param thePnt2d:
	:type thePnt2d: gp_Pnt2d
	:param theVertex:
	:type theVertex: TopoDS_Vertex &
	:param theMinDistance:
	:type theMinDistance: float
	:param theFaceAttribute:
	:type theFaceAttribute: Handle_BRepMesh_FaceAttribute &
	:rtype: gp_XY
") FindUV;
		static gp_XY FindUV (const Standard_Integer theIndexOfPnt3d,const gp_Pnt2d & thePnt2d,const TopoDS_Vertex & theVertex,const Standard_Real theMinDistance,const Handle_BRepMesh_FaceAttribute & theFaceAttribute);
		%feature("compactdefaultargs") AddInFace;
		%feature("autodoc", "	* Stores the given triangulation into the given face. @param theFace face to be updated by triangulation. @param theTriangulation triangulation to be stored into the face.

	:param theFace:
	:type theFace: TopoDS_Face &
	:param theTriangulation:
	:type theTriangulation: Handle_Poly_Triangulation &
	:rtype: void
") AddInFace;
		static void AddInFace (const TopoDS_Face & theFace,Handle_Poly_Triangulation & theTriangulation);
		%feature("compactdefaultargs") NullifyFace;
		%feature("autodoc", "	* Nullifies triangulation stored in the face. @param theFace face to be updated by null triangulation.

	:param theFace:
	:type theFace: TopoDS_Face &
	:rtype: void
") NullifyFace;
		static void NullifyFace (const TopoDS_Face & theFace);
		%feature("compactdefaultargs") NullifyEdge;
		%feature("autodoc", "	* Nullifies polygon on triangulation stored in the edge. @param theEdge edge to be updated by null polygon. @param theTriangulation triangulation the given edge is associated to. @param theLocation face location.

	:param theEdge:
	:type theEdge: TopoDS_Edge &
	:param theTriangulation:
	:type theTriangulation: Handle_Poly_Triangulation &
	:param theLocation:
	:type theLocation: TopLoc_Location &
	:rtype: void
") NullifyEdge;
		static void NullifyEdge (const TopoDS_Edge & theEdge,const Handle_Poly_Triangulation & theTriangulation,const TopLoc_Location & theLocation);
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "	* Updates the given edge by the given tessellated representation. @param theEdge edge to be updated. @param thePolygon tessellated representation of the edge to be stored. @param theTriangulation triangulation the given edge is associated to. @param theLocation face location.

	:param theEdge:
	:type theEdge: TopoDS_Edge &
	:param thePolygon:
	:type thePolygon: Handle_Poly_PolygonOnTriangulation &
	:param theTriangulation:
	:type theTriangulation: Handle_Poly_Triangulation &
	:param theLocation:
	:type theLocation: TopLoc_Location &
	:rtype: void
") UpdateEdge;
		static void UpdateEdge (const TopoDS_Edge & theEdge,const Handle_Poly_PolygonOnTriangulation & thePolygon,const Handle_Poly_Triangulation & theTriangulation,const TopLoc_Location & theLocation);
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "	* Updates the given seam edge by the given tessellated representations. @param theEdge edge to be updated. @param thePolygon1 tessellated representation corresponding to forward direction of the seam edge. @param thePolygon2 tessellated representation corresponding to reversed direction of the seam edge. @param theTriangulation triangulation the given edge is associated to. @param theLocation face location.

	:param theEdge:
	:type theEdge: TopoDS_Edge &
	:param thePolygon1:
	:type thePolygon1: Handle_Poly_PolygonOnTriangulation &
	:param thePolygon2:
	:type thePolygon2: Handle_Poly_PolygonOnTriangulation &
	:param theTriangulation:
	:type theTriangulation: Handle_Poly_Triangulation &
	:param theLocation:
	:type theLocation: TopLoc_Location &
	:rtype: void
") UpdateEdge;
		static void UpdateEdge (const TopoDS_Edge & theEdge,const Handle_Poly_PolygonOnTriangulation & thePolygon1,const Handle_Poly_PolygonOnTriangulation & thePolygon2,const Handle_Poly_Triangulation & theTriangulation,const TopLoc_Location & theLocation);
		%feature("compactdefaultargs") UseLocation;
		%feature("autodoc", "	* Applies location to the given point and return result. @param thePnt point to be transformed. @param theLoc location to be applied.

	:param thePnt:
	:type thePnt: gp_Pnt
	:param theLoc:
	:type theLoc: TopLoc_Location &
	:rtype: gp_Pnt
") UseLocation;
		static gp_Pnt UseLocation (const gp_Pnt & thePnt,const TopLoc_Location & theLoc);
		%feature("compactdefaultargs") IsDegenerated;
		%feature("autodoc", "	* Checks is the given edge degenerated. Checks geometrical parameters in case if IsDegenerated flag is not set. @param theEdge edge to be checked. @param theFace face within which parametric space edge will be checked for geometrical degenerativity.

	:param theEdge:
	:type theEdge: TopoDS_Edge &
	:param theFace:
	:type theFace: TopoDS_Face &
	:rtype: bool
") IsDegenerated;
		static Standard_Boolean IsDegenerated (const TopoDS_Edge & theEdge,const TopoDS_Face & theFace);
};


%extend BRepMesh_ShapeTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepMesh_Triangle;
class BRepMesh_Triangle {
	public:
		%feature("compactdefaultargs") BRepMesh_Triangle;
		%feature("autodoc", "	* Default constructor.

	:rtype: None
") BRepMesh_Triangle;
		 BRepMesh_Triangle ();
		%feature("compactdefaultargs") BRepMesh_Triangle;
		%feature("autodoc", "	* Constructor. @param theEdges array of edges of triangle. @param theOrientations array of edge's orientations. @param theMovability movability of triangle.

	:param Standard_Integer(&theEdges):
	:type Standard_Integer(&theEdges): 
	:param Standard_Boolean(&theOrientations):
	:type Standard_Boolean(&theOrientations): 
	:param theMovability:
	:type theMovability: BRepMesh_DegreeOfFreedom
	:rtype: None
") BRepMesh_Triangle;
		 BRepMesh_Triangle (const Standard_Integer(&theEdges)[3],const Standard_Boolean(&theOrientations)[3],const BRepMesh_DegreeOfFreedom theMovability);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* Initializes the triangle by the given parameters. @param theEdges array of edges of triangle. @param theOrientations array of edge's orientations. @param theMovability movability of triangle.

	:param Standard_Integer(&theEdges):
	:type Standard_Integer(&theEdges): 
	:param Standard_Boolean(&theOrientations):
	:type Standard_Boolean(&theOrientations): 
	:param theMovability:
	:type theMovability: BRepMesh_DegreeOfFreedom
	:rtype: inline void
") Initialize;
		inline void Initialize (const Standard_Integer(&theEdges)[3],const Standard_Boolean(&theOrientations)[3],const BRepMesh_DegreeOfFreedom theMovability);
		%feature("compactdefaultargs") Edges;
		%feature("autodoc", "	* Gets edges with orientations composing the triangle. @param[out] theEdges array edges are stored to. @param[out] theOrientations array orientations are stored to.

	:param :
	:type : int(&theEdges)
	:param :
	:type : bool(&theOrientations)
	:rtype: inline void
") Edges;
		inline void Edges (Standard_Integer(&theEdges) [3],Standard_Boolean(&theOrientations) [3]);
		%feature("compactdefaultargs") Movability;
		%feature("autodoc", "	* Returns movability of the triangle.

	:rtype: inline BRepMesh_DegreeOfFreedom
") Movability;
		inline BRepMesh_DegreeOfFreedom Movability ();
		%feature("compactdefaultargs") SetMovability;
		%feature("autodoc", "	* Sets movability of the triangle.

	:param theMovability:
	:type theMovability: BRepMesh_DegreeOfFreedom
	:rtype: inline void
") SetMovability;
		inline void SetMovability (const BRepMesh_DegreeOfFreedom theMovability);
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "	* Returns hash code for this triangle. @param theUpper upper index in the container. returns hash code.

	:param theUpper:
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
		%feature("autodoc", "	* Checks for equality with another triangle. @param theOther triangle to be checked against this one. returns True if equal, False if not.

	:param theOther:
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


%extend BRepMesh_Triangle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepMesh_Vertex;
class BRepMesh_Vertex {
	public:
		%feature("compactdefaultargs") BRepMesh_Vertex;
		%feature("autodoc", "	* Default constructor

	:rtype: None
") BRepMesh_Vertex;
		 BRepMesh_Vertex ();
		%feature("compactdefaultargs") BRepMesh_Vertex;
		%feature("autodoc", "	* Creates vertex associated with point in 3d space. @param theUV position of vertex in parametric space. @param theLocation3d index of 3d point to be associated with vertex. @param theMovability movability of the vertex.

	:param theUV:
	:type theUV: gp_XY
	:param theLocation3d:
	:type theLocation3d: int
	:param theMovability:
	:type theMovability: BRepMesh_DegreeOfFreedom
	:rtype: None
") BRepMesh_Vertex;
		 BRepMesh_Vertex (const gp_XY & theUV,const Standard_Integer theLocation3d,const BRepMesh_DegreeOfFreedom theMovability);
		%feature("compactdefaultargs") BRepMesh_Vertex;
		%feature("autodoc", "	* Creates vertex without association with point in 3d space. @param theU U position of vertex in parametric space. @param theV V position of vertex in parametric space. @param theMovability movability of the vertex.

	:param theU:
	:type theU: float
	:param theV:
	:type theV: float
	:param theMovability:
	:type theMovability: BRepMesh_DegreeOfFreedom
	:rtype: None
") BRepMesh_Vertex;
		 BRepMesh_Vertex (const Standard_Real theU,const Standard_Real theV,const BRepMesh_DegreeOfFreedom theMovability);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* Initializes vertex associated with point in 3d space. @param theUV position of vertex in parametric space. @param theLocation3d index of 3d point to be associated with vertex. @param theMovability movability of the vertex.

	:param theUV:
	:type theUV: gp_XY
	:param theLocation3d:
	:type theLocation3d: int
	:param theMovability:
	:type theMovability: BRepMesh_DegreeOfFreedom
	:rtype: inline void
") Initialize;
		inline void Initialize (const gp_XY & theUV,const Standard_Integer theLocation3d,const BRepMesh_DegreeOfFreedom theMovability);
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "	* Returns position of the vertex in parametric space.

	:rtype: inline  gp_XY
") Coord;
		inline const gp_XY  Coord ();
		%feature("compactdefaultargs") ChangeCoord;
		%feature("autodoc", "	* Returns position of the vertex in parametric space for modification.

	:rtype: inline gp_XY
") ChangeCoord;
		inline gp_XY  ChangeCoord ();
		%feature("compactdefaultargs") Location3d;
		%feature("autodoc", "	* Returns index of 3d point associated with the vertex.

	:rtype: inline int
") Location3d;
		inline Standard_Integer Location3d ();
		%feature("compactdefaultargs") Movability;
		%feature("autodoc", "	* Returns movability of the vertex.

	:rtype: inline BRepMesh_DegreeOfFreedom
") Movability;
		inline BRepMesh_DegreeOfFreedom Movability ();
		%feature("compactdefaultargs") SetMovability;
		%feature("autodoc", "	* Sets movability of the vertex.

	:param theMovability:
	:type theMovability: BRepMesh_DegreeOfFreedom
	:rtype: inline void
") SetMovability;
		inline void SetMovability (const BRepMesh_DegreeOfFreedom theMovability);
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "	* Returns hash code for this vertex. @param theUpper upper index in the container. returns hash code.

	:param Upper:
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
		%feature("autodoc", "	* Checks for equality with another vertex. @param theOther vertex to be checked against this one. returns True if equal, False if not.

	:param theOther:
	:type theOther: BRepMesh_Vertex &
	:rtype: bool
") IsEqual;
		Standard_Boolean IsEqual (const BRepMesh_Vertex & theOther);

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


%extend BRepMesh_Vertex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepMesh_VertexInspector;
class BRepMesh_VertexInspector : public NCollection_CellFilter_InspectorXY {
	public:
typedef Standard_Integer Target;
		%feature("compactdefaultargs") BRepMesh_VertexInspector;
		%feature("autodoc", "	* Constructor. @param theReservedSize size to be reserved for vector of vertices. @param theAllocator memory allocator to be used by internal collections.

	:param theReservedSize:
	:type theReservedSize: int
	:param theAllocator:
	:type theAllocator: Handle_NCollection_IncAllocator &
	:rtype: None
") BRepMesh_VertexInspector;
		 BRepMesh_VertexInspector (const Standard_Integer theReservedSize,const Handle_NCollection_IncAllocator & theAllocator);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Registers the given vertex. @param theVertex vertex to be registered.

	:param theVertex:
	:type theVertex: BRepMesh_Vertex &
	:rtype: int
") Add;
		Standard_Integer Add (const BRepMesh_Vertex & theVertex);
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "	* Sets the tolerance to be used for identification of coincident vertices equal for both dimensions.

	:param theTolerance:
	:type theTolerance: float
	:rtype: inline void
") SetTolerance;
		inline void SetTolerance (const Standard_Real theTolerance);
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "	* Sets the tolerance to be used for identification of coincident vertices. @param theToleranceX tolerance for X dimension. @param theToleranceY tolerance for Y dimension.

	:param theToleranceX:
	:type theToleranceX: float
	:param theToleranceY:
	:type theToleranceY: float
	:rtype: inline void
") SetTolerance;
		inline void SetTolerance (const Standard_Real theToleranceX,const Standard_Real theToleranceY);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clear inspector's internal data structures.

	:rtype: inline void
") Clear;
		inline void Clear ();
		%feature("compactdefaultargs") Delete;
		%feature("autodoc", "	* Deletes vertex with the given index. @param theIndex index of vertex to be removed.

	:param theIndex:
	:type theIndex: int
	:rtype: inline void
") Delete;
		inline void Delete (const Standard_Integer theIndex);
		%feature("compactdefaultargs") NbVertices;
		%feature("autodoc", "	* Returns number of registered vertices.

	:rtype: inline int
") NbVertices;
		inline Standard_Integer NbVertices ();
		%feature("compactdefaultargs") GetVertex;
		%feature("autodoc", "	* Returns vertex with the given index.

	:param theIndex:
	:type theIndex: int
	:rtype: inline BRepMesh_Vertex
") GetVertex;
		inline BRepMesh_Vertex & GetVertex (Standard_Integer theIndex);
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "	* Set reference point to be checked.

	:param thePoint:
	:type thePoint: gp_XY
	:rtype: inline void
") SetPoint;
		inline void SetPoint (const gp_XY & thePoint);
		%feature("compactdefaultargs") GetCoincidentPoint;
		%feature("autodoc", "	* Returns index of point coinciding with regerence one.

	:rtype: inline int
") GetCoincidentPoint;
		inline Standard_Integer GetCoincidentPoint ();
		%feature("compactdefaultargs") GetListOfDelPoints;
		%feature("autodoc", "	* Returns list with indexes of vertices that have movability attribute equal to BRepMesh_Deleted and can be replaced with another node.

	:rtype: inline  BRepMesh::ListOfInteger
") GetListOfDelPoints;
		inline const BRepMesh::ListOfInteger & GetListOfDelPoints ();
		%feature("compactdefaultargs") Vertices;
		%feature("autodoc", "	* Returns set of mesh vertices.

	:rtype: inline  BRepMesh::HVectorOfVertex
") Vertices;
		inline const BRepMesh::HVectorOfVertex & Vertices ();
		%feature("compactdefaultargs") ChangeVertices;
		%feature("autodoc", "	* Returns set of mesh vertices for modification.

	:rtype: inline BRepMesh::HVectorOfVertex
") ChangeVertices;
		inline BRepMesh::HVectorOfVertex & ChangeVertices ();
		%feature("compactdefaultargs") Inspect;
		%feature("autodoc", "	* Performs inspection of a point with the given index. @param theTargetIndex index of a circle to be checked. returns status of the check.

	:param theTargetIndex:
	:type theTargetIndex: int
	:rtype: NCollection_CellFilter_Action
") Inspect;
		NCollection_CellFilter_Action Inspect (const Standard_Integer theTargetIndex);
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	* Checks indices for equlity.

	:param theIndex:
	:type theIndex: int
	:param theTargetIndex:
	:type theTargetIndex: int
	:rtype: bool
") IsEqual;
		static Standard_Boolean IsEqual (const Standard_Integer theIndex,const Standard_Integer theTargetIndex);
};


%extend BRepMesh_VertexInspector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepMesh_VertexTool;
class BRepMesh_VertexTool {
	public:
		%feature("compactdefaultargs") BRepMesh_VertexTool;
		%feature("autodoc", "	* Constructor. @param theReservedSize size to be reserved for vector of vertices. @param theAllocator memory allocator to be used by internal collections.

	:param theReservedSize:
	:type theReservedSize: int
	:param theAllocator:
	:type theAllocator: Handle_NCollection_IncAllocator &
	:rtype: None
") BRepMesh_VertexTool;
		 BRepMesh_VertexTool (const Standard_Integer theReservedSize,const Handle_NCollection_IncAllocator & theAllocator);
		%feature("compactdefaultargs") SetCellSize;
		%feature("autodoc", "	* Sets new size of cell for cellfilter equal in both directions.

	:param theSize:
	:type theSize: float
	:rtype: None
") SetCellSize;
		void SetCellSize (const Standard_Real theSize);
		%feature("compactdefaultargs") SetCellSize;
		%feature("autodoc", "	* Sets new size of cell for cellfilter. @param theSizeX size for X dimension. @param theSizeY size for Y dimension.

	:param theSizeX:
	:type theSizeX: float
	:param theSizeY:
	:type theSizeY: float
	:rtype: None
") SetCellSize;
		void SetCellSize (const Standard_Real theSizeX,const Standard_Real theSizeY);
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "	* Sets the tolerance to be used for identification of coincident vertices equal for both dimensions.

	:param theTolerance:
	:type theTolerance: float
	:rtype: None
") SetTolerance;
		void SetTolerance (const Standard_Real theTolerance);
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "	* Sets the tolerance to be used for identification of coincident vertices. @param theToleranceX tolerance for X dimension. @param theToleranceY tolerance for Y dimension.

	:param theToleranceX:
	:type theToleranceX: float
	:param theToleranceY:
	:type theToleranceY: float
	:rtype: None
") SetTolerance;
		void SetTolerance (const Standard_Real theToleranceX,const Standard_Real theToleranceY);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds vertex with empty data to the tool. @param theVertex node to be added to the mesh. @param isForceAdd adds the given node to structure without checking on coincidence with other nodes. returns index of the node in the structure.

	:param theVertex:
	:type theVertex: BRepMesh_Vertex &
	:param isForceAdd:
	:type isForceAdd: bool
	:rtype: int
") Add;
		Standard_Integer Add (const BRepMesh_Vertex & theVertex,const Standard_Boolean isForceAdd);
		%feature("compactdefaultargs") Delete;
		%feature("autodoc", "	* Deletes vertex with the given index from the tool.

	:param theIndex:
	:type theIndex: int
	:rtype: None
") Delete;
		void Delete (const Standard_Integer theIndex);
		%feature("compactdefaultargs") Vertices;
		%feature("autodoc", "	* Returns set of mesh vertices.

	:rtype: inline  BRepMesh::HVectorOfVertex
") Vertices;
		inline const BRepMesh::HVectorOfVertex & Vertices ();
		%feature("compactdefaultargs") ChangeVertices;
		%feature("autodoc", "	* Returns set of mesh vertices.

	:rtype: inline BRepMesh::HVectorOfVertex
") ChangeVertices;
		inline BRepMesh::HVectorOfVertex & ChangeVertices ();
		%feature("compactdefaultargs") FindKey;
		%feature("autodoc", "	* Returns vertex by the given index.

	:param theIndex:
	:type theIndex: int
	:rtype: inline  BRepMesh_Vertex
") FindKey;
		inline const BRepMesh_Vertex & FindKey (const Standard_Integer theIndex);
		%feature("compactdefaultargs") FindIndex;
		%feature("autodoc", "	* Returns index of the given vertex.

	:param theVertex:
	:type theVertex: BRepMesh_Vertex &
	:rtype: int
") FindIndex;
		Standard_Integer FindIndex (const BRepMesh_Vertex & theVertex);
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	* Returns a number of vertices.

	:rtype: inline int
") Extent;
		inline Standard_Integer Extent ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	* Returns True when the map contains no keys.

	:rtype: inline bool
") IsEmpty;
		inline Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Substitute;
		%feature("autodoc", "	* Substitutes vertex with the given by the given vertex with attributes. @param theIndex index of vertex to be substituted. @param theVertex replacement vertex.

	:param theIndex:
	:type theIndex: int
	:param theVertex:
	:type theVertex: BRepMesh_Vertex &
	:rtype: None
") Substitute;
		void Substitute (const Standard_Integer theIndex,const BRepMesh_Vertex & theVertex);
		%feature("compactdefaultargs") RemoveLast;
		%feature("autodoc", "	* Remove last node from the structure.

	:rtype: inline void
") RemoveLast;
		inline void RemoveLast ();
		%feature("compactdefaultargs") GetListOfDelNodes;
		%feature("autodoc", "	* Returns the list with indexes of vertices that have movability attribute equal to BRepMesh_Deleted and can be replaced with another node.

	:rtype: inline  BRepMesh::ListOfInteger
") GetListOfDelNodes;
		inline const BRepMesh::ListOfInteger & GetListOfDelNodes ();

        %feature("autodoc", "1");
        %extend{
            std::string StatisticsToString() {
            std::stringstream s;
            self->Statistics(s);
            return s.str();}
        };
        };


%extend BRepMesh_VertexTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepMesh_WireChecker;
class BRepMesh_WireChecker {
	public:
		%feature("compactdefaultargs") BRepMesh_WireChecker;
		%feature("autodoc", "	* Constructor. @param theFace Face to be checked. @param theTolUV Tolerance to be used for calculations in parametric space. @param theEdges Map of edges with associated polygon on triangulation. @param theVertexMap Map of face vertices. @param theStructure Discretized representation of face in parametric space. @param theUmin Lower U boundary of the face in parametric space. @param theUmax Upper U boundary of the face in parametric space. @param theVmin Lower V boundary of the face in parametric space. @param theVmax Upper V boundary of the face in parametric space.

	:param theFace:
	:type theFace: TopoDS_Face &
	:param theTolUV:
	:type theTolUV: float
	:param theEdges:
	:type theEdges: BRepMesh::HDMapOfShapePairOfPolygon &
	:param theVertexMap:
	:type theVertexMap: BRepMesh::HIMapOfInteger &
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
	:param isInParallel:
	:type isInParallel: bool
	:rtype: None
") BRepMesh_WireChecker;
		 BRepMesh_WireChecker (const TopoDS_Face & theFace,const Standard_Real theTolUV,const BRepMesh::HDMapOfShapePairOfPolygon & theEdges,const BRepMesh::HIMapOfInteger & theVertexMap,const Handle_BRepMesh_DataStructureOfDelaun & theStructure,const Standard_Real theUmin,const Standard_Real theUmax,const Standard_Real theVmin,const Standard_Real theVmax,const Standard_Boolean isInParallel);
		%feature("compactdefaultargs") ReCompute;
		%feature("autodoc", "	* Recompute data using parameters passed in constructor. @param[out] theClassifier Classifier to be updated using calculated data.

	:param theClassifier:
	:type theClassifier: BRepMesh::HClassifier &
	:rtype: None
") ReCompute;
		void ReCompute (BRepMesh::HClassifier & theClassifier);
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "	* Returns status of the check.

	:rtype: inline BRepMesh_Status
") Status;
		inline BRepMesh_Status Status ();
};


%extend BRepMesh_WireChecker {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepMesh_Edge;
class BRepMesh_Edge : public BRepMesh_OrientedEdge {
	public:
		%feature("compactdefaultargs") BRepMesh_Edge;
		%feature("autodoc", "	* Default constructor.

	:rtype: None
") BRepMesh_Edge;
		 BRepMesh_Edge ();
		%feature("compactdefaultargs") BRepMesh_Edge;
		%feature("autodoc", "	* Constructs a link between two vertices.

	:param theFirstNode:
	:type theFirstNode: int
	:param theLastNode:
	:type theLastNode: int
	:param theMovability:
	:type theMovability: BRepMesh_DegreeOfFreedom
	:rtype: None
") BRepMesh_Edge;
		 BRepMesh_Edge (const Standard_Integer theFirstNode,const Standard_Integer theLastNode,const BRepMesh_DegreeOfFreedom theMovability);
		%feature("compactdefaultargs") Movability;
		%feature("autodoc", "	* Returns movability flag of the Link.

	:rtype: inline BRepMesh_DegreeOfFreedom
") Movability;
		inline BRepMesh_DegreeOfFreedom Movability ();
		%feature("compactdefaultargs") SetMovability;
		%feature("autodoc", "	* Sets movability flag of the Link. @param theMovability flag to be set.

	:param theMovability:
	:type theMovability: BRepMesh_DegreeOfFreedom
	:rtype: inline void
") SetMovability;
		inline void SetMovability (const BRepMesh_DegreeOfFreedom theMovability);
		%feature("compactdefaultargs") IsSameOrientation;
		%feature("autodoc", "	* Checks if the given edge and this one have the same orientation. @param theOther edge to be checked against this one. etrun True if edges have the same orientation, False if not.

	:param theOther:
	:type theOther: BRepMesh_Edge &
	:rtype: inline bool
") IsSameOrientation;
		inline Standard_Boolean IsSameOrientation (const BRepMesh_Edge & theOther);
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	* Checks for equality with another edge. @param theOther edge to be checked against this one. returns True if equal, False if not.

	:param theOther:
	:type theOther: BRepMesh_Edge &
	:rtype: inline bool
") IsEqual;
		inline Standard_Boolean IsEqual (const BRepMesh_Edge & theOther);

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


%extend BRepMesh_Edge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepMesh_IncrementalMesh;
class BRepMesh_IncrementalMesh : public BRepMesh_DiscretRoot {
	public:
		%feature("compactdefaultargs") BRepMesh_IncrementalMesh;
		%feature("autodoc", "	* @name mesher API Default constructor

	:rtype: None
") BRepMesh_IncrementalMesh;
		 BRepMesh_IncrementalMesh ();
		%feature("compactdefaultargs") BRepMesh_IncrementalMesh;
		%feature("autodoc", "	* Constructor. Automatically calls method Perform. @param theShape shape to be meshed. @param theLinDeflection linear deflection. @param isRelative if True deflection used for discretization of each edge will be <theLinDeflection> * <size of edge>. Deflection used for the faces will be the maximum deflection of their edges. @param theAngDeflection angular deflection. @param isInParallel if True shape will be meshed in parallel.

	:param theShape:
	:type theShape: TopoDS_Shape &
	:param theLinDeflection:
	:type theLinDeflection: float
	:param isRelative: default value is Standard_False
	:type isRelative: bool
	:param theAngDeflection: default value is 0.5
	:type theAngDeflection: float
	:param isInParallel: default value is Standard_False
	:type isInParallel: bool
	:rtype: None
") BRepMesh_IncrementalMesh;
		 BRepMesh_IncrementalMesh (const TopoDS_Shape & theShape,const Standard_Real theLinDeflection,const Standard_Boolean isRelative = Standard_False,const Standard_Real theAngDeflection = 0.5,const Standard_Boolean isInParallel = Standard_False);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Performs meshing ot the shape.

	:rtype: void
") Perform;
		virtual void Perform ();
		%feature("compactdefaultargs") SetRelative;
		%feature("autodoc", "	* @name accessing to parameters. Enables using relative deflection. @param isRelative if True deflection used for discretization of each edge will be <theLinDeflection> * <size of edge>. Deflection used for the faces will be the maximum deflection of their edges.

	:param isRelative:
	:type isRelative: bool
	:rtype: inline void
") SetRelative;
		inline void SetRelative (const Standard_Boolean isRelative);
		%feature("compactdefaultargs") IsRelative;
		%feature("autodoc", "	* Returns relative deflection flag.

	:rtype: inline bool
") IsRelative;
		inline Standard_Boolean IsRelative ();
		%feature("compactdefaultargs") IsModified;
		%feature("autodoc", "	* Returns modified flag.

	:rtype: inline bool
") IsModified;
		inline Standard_Boolean IsModified ();
		%feature("compactdefaultargs") GetStatusFlags;
		%feature("autodoc", "	* Returns accumulated status flags faced during meshing.

	:rtype: inline int
") GetStatusFlags;
		inline Standard_Integer GetStatusFlags ();
		%feature("compactdefaultargs") SetParallel;
		%feature("autodoc", "	* Request algorithm to launch in multiple threads to improve performance.

	:param isInParallel:
	:type isInParallel: bool
	:rtype: inline void
") SetParallel;
		inline void SetParallel (const Standard_Boolean isInParallel);
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "	* Returns the multi-threading usage flag.

	:rtype: inline bool
") IsParallel;
		inline Standard_Boolean IsParallel ();
		%feature("compactdefaultargs") SetMinSize;
		%feature("autodoc", "	* Sets min size parameter.

	:param theMinSize:
	:type theMinSize: float
	:rtype: inline void
") SetMinSize;
		inline void SetMinSize (const Standard_Real theMinSize);
		%feature("compactdefaultargs") GetMinSize;
		%feature("autodoc", "	* Returns min size parameter.

	:rtype: inline float
") GetMinSize;
		inline Standard_Real GetMinSize ();
		%feature("compactdefaultargs") SetInternalVerticesMode;
		%feature("autodoc", "	* Enables/disables internal vertices mode (enabled by default).

	:param isEnabled:
	:type isEnabled: bool
	:rtype: inline void
") SetInternalVerticesMode;
		inline void SetInternalVerticesMode (const Standard_Boolean isEnabled);
		%feature("compactdefaultargs") IsInternalVerticesMode;
		%feature("autodoc", "	* Returns flag indicating is internal vertices mode enabled/disabled.

	:rtype: inline bool
") IsInternalVerticesMode;
		inline Standard_Boolean IsInternalVerticesMode ();
		%feature("compactdefaultargs") SetControlSurfaceDeflection;
		%feature("autodoc", "	* Enables/disables control of deflection of mesh from real surface (enabled by default).

	:param isEnabled:
	:type isEnabled: bool
	:rtype: inline void
") SetControlSurfaceDeflection;
		inline void SetControlSurfaceDeflection (const Standard_Boolean isEnabled);
		%feature("compactdefaultargs") IsControlSurfaceDeflection;
		%feature("autodoc", "	* Returns flag indicating is adaptive reconfiguration of mesh enabled/disabled.

	:rtype: inline bool
") IsControlSurfaceDeflection;
		inline Standard_Boolean IsControlSurfaceDeflection ();
		%feature("compactdefaultargs") Discret;
		%feature("autodoc", "	* @name plugin API Plugin interface for the Mesh Factories. Initializes meshing algorithm with the given parameters. @param theShape shape to be meshed. @param theLinDeflection linear deflection. @param theAngDeflection angular deflection. @param[out] theAlgo pointer to initialized algorithm.

	:param theShape:
	:type theShape: TopoDS_Shape &
	:param theLinDeflection:
	:type theLinDeflection: float
	:param theAngDeflection:
	:type theAngDeflection: float
	:param theAlgo:
	:type theAlgo: BRepMesh_DiscretRoot * &
	:rtype: int
") Discret;
		static Standard_Integer Discret (const TopoDS_Shape & theShape,const Standard_Real theLinDeflection,const Standard_Real theAngDeflection,BRepMesh_DiscretRoot * & theAlgo);
		%feature("compactdefaultargs") IsParallelDefault;
		%feature("autodoc", "	* Returns multi-threading usage flag set by default in Discret() static method (thus applied only to Mesh Factories).

	:rtype: bool
") IsParallelDefault;
		static Standard_Boolean IsParallelDefault ();
		%feature("compactdefaultargs") SetParallelDefault;
		%feature("autodoc", "	* Setup multi-threading usage flag set by default in Discret() static method (thus applied only to Mesh Factories).

	:param isInParallel:
	:type isInParallel: bool
	:rtype: void
") SetParallelDefault;
		static void SetParallelDefault (const Standard_Boolean isInParallel);
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
    BRepMesh_IncrementalMesh* _get_reference() {
    return (BRepMesh_IncrementalMesh*)$self->Access();
    }
};

%extend Handle_BRepMesh_IncrementalMesh {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BRepMesh_IncrementalMesh {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
