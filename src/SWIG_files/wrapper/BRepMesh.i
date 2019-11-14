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

/*
This file was automatically generated using the pythonocc_generator, see
https://github.com/tpaviot/pythonocc-generator.

This file is platform independant, but was generated under the following
conditions:

- operating system : debian Linux 4.15.0-66-generic
- occt version targeted : 7.4.0
*/

%define BREPMESHDOCSTRING
"BRepMesh module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_BRepMesh.html"
%enddef
%module (package="OCC.Core", docstring=BREPMESHDOCSTRING) BRepMesh

#pragma SWIG nowarn=504,325,503,520,350,351,383,389,394,395, 404

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
#include<BRepMesh_Delaun.hxx>
#include<BRepMesh_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<IMeshTools_module.hxx>
#include<gp_module.hxx>
#include<TopAbs_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<TopoDS_module.hxx>
#include<TCollection_module.hxx>
#include<TColStd_module.hxx>
#include<GeomAbs_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Poly_module.hxx>
#include<Bnd_module.hxx>
#include<TopLoc_module.hxx>
#include<Geom2d_module.hxx>
#include<Geom_module.hxx>
#include<IMeshData_module.hxx>
#include<TShort_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Geom2dAdaptor_module.hxx>
#include<Message_module.hxx>
#include<Adaptor2d_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<Geom_module.hxx>
#include<TopLoc_module.hxx>
#include<Geom2d_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import IMeshTools.i
%import gp.i
%import TopAbs.i
%import BRepAdaptor.i
%import TopoDS.i
%import TCollection.i
%import TColStd.i
%import GeomAbs.i
%import Adaptor3d.i
%import Poly.i
%import Bnd.i
%import TopLoc.i
%import Geom2d.i
%import Geom.i
%import IMeshData.i
/* public enums */
enum BRepMesh_FactoryError {
	BRepMesh_FE_NOERROR = 0,
	BRepMesh_FE_LIBRARYNOTFOUND = 1,
	BRepMesh_FE_FUNCTIONNOTFOUND = 2,
	BRepMesh_FE_CANNOTCREATEALGO = 3,
};

enum BRepMesh_DegreeOfFreedom {
	BRepMesh_Free = 0,
	BRepMesh_InVolume = 1,
	BRepMesh_OnSurface = 2,
	BRepMesh_OnCurve = 3,
	BRepMesh_Fixed = 4,
	BRepMesh_Frontier = 5,
	BRepMesh_Deleted = 6,
};

/* end public enums declaration */

/* handles */
%wrap_handle(BRepMesh_Classifier)
%wrap_handle(BRepMesh_DataStructureOfDelaun)
%wrap_handle(BRepMesh_Deflection)
%wrap_handle(BRepMesh_DiscretRoot)
%wrap_handle(BRepMesh_FaceChecker)
%wrap_handle(BRepMesh_MeshTool)
%wrap_handle(BRepMesh_SelectorOfDataStructureOfDelaun)
%wrap_handle(BRepMesh_ShapeTool)
%wrap_handle(BRepMesh_VertexTool)
%wrap_handle(BRepMesh_IncrementalMesh)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
typedef Standard_Integer ( * BRepMesh_PluginEntryType ) ( const TopoDS_Shape & theShape , const Standard_Real theLinDeflection , const Standard_Real theAngDeflection , BRepMesh_DiscretRoot * & theMeshAlgoInstance );
typedef IMeshTools_Parameters Parameters;
/* end typedefs declaration */

%nodefaultctor BRepMesh_BaseMeshAlgo;
class BRepMesh_BaseMeshAlgo : public IMeshTools_MeshAlgo {
	public:
typedef NCollection_Shared <NCollection_Vector <gp_Pnt>> VectorOfPnt;
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Performs processing of the given face.

	:param theDFace:
	:type theDFace: IMeshData::IFaceHandle &
	:param theParameters:
	:type theParameters: IMeshTools_Parameters &
	:rtype: void
") Perform;
		virtual void Perform (const IMeshData::IFaceHandle & theDFace,const IMeshTools_Parameters & theParameters);
};


%extend BRepMesh_BaseMeshAlgo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
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
	:type theAllocator: opencascade::handle<NCollection_IncAllocator> &
	:rtype: None
") BRepMesh_CircleInspector;
		 BRepMesh_CircleInspector (const Standard_Real theTolerance,const Standard_Integer theReservedSize,const opencascade::handle<NCollection_IncAllocator> & theAllocator);
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	* Adds the circle to vector of circles at the given position. @param theIndex position of circle in the vector. @param theCircle circle to be added.

	:param theIndex:
	:type theIndex: int
	:param theCircle:
	:type theCircle: BRepMesh_Circle &
	:rtype: inline void
") Bind;
		inline void Bind (const Standard_Integer theIndex,const BRepMesh_Circle & theCircle);
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "	* Returns circle with the given index. @param theIndex index of circle. returns circle with the given index.

	:param theIndex:
	:type theIndex: int
	:rtype: inline BRepMesh_Circle
") Circle;
		inline BRepMesh_Circle & Circle (const Standard_Integer theIndex);
		%feature("compactdefaultargs") Circles;
		%feature("autodoc", "	* Resutns vector of registered circles.

	:rtype: inline  IMeshData::VectorOfCircle
") Circles;
		inline const IMeshData::VectorOfCircle & Circles ();
		%feature("compactdefaultargs") GetShotCircles;
		%feature("autodoc", "	* Returns list of circles shot by the reference point.

	:rtype: inline IMeshData::ListOfInteger
") GetShotCircles;
		inline IMeshData::ListOfInteger & GetShotCircles ();
		%feature("compactdefaultargs") Inspect;
		%feature("autodoc", "	* Performs inspection of a circle with the given index. @param theTargetIndex index of a circle to be checked. returns status of the check.

	:param theTargetIndex:
	:type theTargetIndex: int
	:rtype: inline NCollection_CellFilter_Action
") Inspect;
		inline NCollection_CellFilter_Action Inspect (const Standard_Integer theTargetIndex);
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	* Checks indices for equlity.

	:param theIndex:
	:type theIndex: int
	:param theTargetIndex:
	:type theTargetIndex: int
	:rtype: bool
") IsEqual;
		static Standard_Boolean IsEqual (const Standard_Integer theIndex,const Standard_Integer theTargetIndex);
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "	* Set reference point to be checked. @param thePoint bullet point.

	:param thePoint:
	:type thePoint: gp_XY
	:rtype: inline void
") SetPoint;
		inline void SetPoint (const gp_XY & thePoint);
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
	:type theAllocator: opencascade::handle<NCollection_IncAllocator> &
	:rtype: None
") BRepMesh_CircleTool;
		 BRepMesh_CircleTool (const opencascade::handle<NCollection_IncAllocator> & theAllocator);
		%feature("compactdefaultargs") BRepMesh_CircleTool;
		%feature("autodoc", "	* Constructor. @param theReservedSize size to be reserved for vector of circles. @param theAllocator memory allocator to be used by internal structures.

	:param theReservedSize:
	:type theReservedSize: int
	:param theAllocator:
	:type theAllocator: opencascade::handle<NCollection_IncAllocator> &
	:rtype: None
") BRepMesh_CircleTool;
		 BRepMesh_CircleTool (const Standard_Integer theReservedSize,const opencascade::handle<NCollection_IncAllocator> & theAllocator);
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	* Binds the circle to the tool. @param theIndex index a circle should be bound with. @param theCircle circle to be bound.

	:param theIndex:
	:type theIndex: int
	:param theCircle:
	:type theCircle: gp_Circ2d
	:rtype: None
") Bind;
		void Bind (const Standard_Integer theIndex,const gp_Circ2d & theCircle);
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
		%feature("compactdefaultargs") Delete;
		%feature("autodoc", "	* Deletes a circle from the tool. @param theIndex index of a circle to be removed.

	:param theIndex:
	:type theIndex: int
	:rtype: None
") Delete;
		void Delete (const Standard_Integer theIndex);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initializes the tool. @param theReservedSize size to be reserved for vector of circles.

	:param Standard_Integer:
	:type Standard_Integer: 
	:rtype: inline void
") Init;
		inline void Init (const Standard_Integer);
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	* Retruns true if cell filter contains no circle.

	:rtype: inline bool
") IsEmpty;
		inline Standard_Boolean IsEmpty ();
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
		%feature("compactdefaultargs") MocBind;
		%feature("autodoc", "	* Binds implicit zero circle. @param theIndex index a zero circle should be bound with.

	:param theIndex:
	:type theIndex: int
	:rtype: None
") MocBind;
		void MocBind (const Standard_Integer theIndex);
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "	* Select the circles shot by the given point. @param thePoint bullet point.

	:param thePoint:
	:type thePoint: gp_XY
	:rtype: IMeshData::ListOfInteger
") Select;
		IMeshData::ListOfInteger & Select (const gp_XY & thePoint);
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
};


%extend BRepMesh_CircleTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepMesh_Classifier;
class BRepMesh_Classifier : public Standard_Transient {
	public:
		%feature("compactdefaultargs") BRepMesh_Classifier;
		%feature("autodoc", "	* Constructor.

	:rtype: None
") BRepMesh_Classifier;
		 BRepMesh_Classifier ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Performs classification of the given point regarding to face internals. @param thePoint Point in parametric space to be classified. returns TopAbs_IN if point lies within face boundaries and TopAbs_OUT elsewhere.

	:param thePoint:
	:type thePoint: gp_Pnt2d
	:rtype: TopAbs_State
") Perform;
		TopAbs_State Perform (const gp_Pnt2d & thePoint);
		%feature("compactdefaultargs") RegisterWire;
		%feature("autodoc", "	* Registers wire specified by sequence of points for further classification of points. @param theWire Wire to be registered. Specified by sequence of points. @param theTolUV Tolerance to be used for calculations in parametric space. @param theUmin Lower U boundary of the face in parametric space. @param theUmax Upper U boundary of the face in parametric space. @param theVmin Lower V boundary of the face in parametric space. @param theVmax Upper V boundary of the face in parametric space.

	:param theWire:
	:type theWire: NCollection_Sequence< gp_Pnt2d *>
	:param theTolUV:
	:type theTolUV: std::pair<float, float> &
	:param theRangeU:
	:type theRangeU: std::pair<float, float> &
	:param theRangeV:
	:type theRangeV: std::pair<float, float> &
	:rtype: None
") RegisterWire;
		void RegisterWire (const NCollection_Sequence<const gp_Pnt2d *> & theWire,const std::pair<Standard_Real, Standard_Real> & theTolUV,const std::pair<Standard_Real, Standard_Real> & theRangeU,const std::pair<Standard_Real, Standard_Real> & theRangeV);
};


%make_alias(BRepMesh_Classifier)

%extend BRepMesh_Classifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepMesh_Context;
class BRepMesh_Context : public IMeshTools_Context {
	public:
		%feature("compactdefaultargs") BRepMesh_Context;
		%feature("autodoc", "	* Constructor.

	:rtype: None
") BRepMesh_Context;
		 BRepMesh_Context ();
};


%extend BRepMesh_Context {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepMesh_CurveTessellator;
class BRepMesh_CurveTessellator : public IMeshTools_CurveTessellator {
	public:
		%feature("compactdefaultargs") BRepMesh_CurveTessellator;
		%feature("autodoc", "	* Constructor.

	:param theEdge:
	:type theEdge: IMeshData::IEdgeHandle &
	:param theParameters:
	:type theParameters: IMeshTools_Parameters &
	:rtype: None
") BRepMesh_CurveTessellator;
		 BRepMesh_CurveTessellator (const IMeshData::IEdgeHandle & theEdge,const IMeshTools_Parameters & theParameters);
		%feature("compactdefaultargs") BRepMesh_CurveTessellator;
		%feature("autodoc", "	* Constructor.

	:param theEdge:
	:type theEdge: IMeshData::IEdgeHandle &
	:param theOrientation:
	:type theOrientation: TopAbs_Orientation
	:param theFace:
	:type theFace: IMeshData::IFaceHandle &
	:param theParameters:
	:type theParameters: IMeshTools_Parameters &
	:rtype: None
") BRepMesh_CurveTessellator;
		 BRepMesh_CurveTessellator (const IMeshData::IEdgeHandle & theEdge,const TopAbs_Orientation theOrientation,const IMeshData::IFaceHandle & theFace,const IMeshTools_Parameters & theParameters);
		%feature("compactdefaultargs") PointsNb;
		%feature("autodoc", "	* Returns number of tessellation points.

	:rtype: int
") PointsNb;
		virtual Standard_Integer PointsNb ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns parameters of solution with the given index. @param theIndex index of tessellation point. @param theParameter parameters on PCurve corresponded to the solution. @param thePoint tessellation point. returns True in case of valid result, false elewhere.

	:param theIndex:
	:type theIndex: int
	:param thePoint:
	:type thePoint: gp_Pnt
	:param theParameter:
	:type theParameter: float &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const Standard_Integer theIndex,gp_Pnt & thePoint,Standard_Real &OutValue);
};


%extend BRepMesh_CurveTessellator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepMesh_DataStructureOfDelaun;
class BRepMesh_DataStructureOfDelaun : public Standard_Transient {
	public:
		%feature("compactdefaultargs") AddElement;
		%feature("autodoc", "	* Adds element to the mesh if it is not already in the mesh. @param theElement element to be added to the mesh. returns index of the element in the structure.

	:param theElement:
	:type theElement: BRepMesh_Triangle &
	:rtype: int
") AddElement;
		Standard_Integer AddElement (const BRepMesh_Triangle & theElement);
		%feature("compactdefaultargs") AddLink;
		%feature("autodoc", "	* Adds link to the mesh if it is not already in the mesh. @param theLink link to be added to the mesh. returns index of the link in the structure.

	:param theLink:
	:type theLink: BRepMesh_Edge &
	:rtype: int
") AddLink;
		Standard_Integer AddLink (const BRepMesh_Edge & theLink);
		%feature("compactdefaultargs") AddNode;
		%feature("autodoc", "	* Adds node to the mesh if it is not already in the mesh. @param theNode node to be added to the mesh. @param isForceAdd adds the given node to structure without checking on coincidence with other nodes. returns index of the node in the structure.

	:param theNode:
	:type theNode: BRepMesh_Vertex &
	:param isForceAdd: default value is Standard_False
	:type isForceAdd: bool
	:rtype: int
") AddNode;
		Standard_Integer AddNode (const BRepMesh_Vertex & theNode,const Standard_Boolean isForceAdd = Standard_False);
		%feature("compactdefaultargs") Allocator;
		%feature("autodoc", "	* Returns memory allocator used by the structure.

	:rtype: inline  opencascade::handle<NCollection_IncAllocator>
") Allocator;
		inline const opencascade::handle<NCollection_IncAllocator> & Allocator ();
		%feature("compactdefaultargs") BRepMesh_DataStructureOfDelaun;
		%feature("autodoc", "	* Constructor. @param theAllocator memory allocator to be used by internal structures. @param theReservedNodeSize presumed number of nodes in this mesh.

	:param theAllocator:
	:type theAllocator: opencascade::handle<NCollection_IncAllocator> &
	:param theReservedNodeSize: default value is 100
	:type theReservedNodeSize: int
	:rtype: None
") BRepMesh_DataStructureOfDelaun;
		 BRepMesh_DataStructureOfDelaun (const opencascade::handle<NCollection_IncAllocator> & theAllocator,const Standard_Integer theReservedNodeSize = 100);
		%feature("compactdefaultargs") ClearDeleted;
		%feature("autodoc", "	* Substitutes deleted items by the last one from corresponding map to have only non-deleted elements, links or nodes in the structure.

	:rtype: None
") ClearDeleted;
		void ClearDeleted ();
		%feature("compactdefaultargs") ClearDomain;
		%feature("autodoc", "	* Removes all elements.

	:rtype: None
") ClearDomain;
		void ClearDomain ();
		%feature("compactdefaultargs") Data;
		%feature("autodoc", "	* Gives the data structure for initialization of cell size and tolerance.

	:rtype: inline  opencascade::handle<BRepMesh_VertexTool>
") Data;
		inline const opencascade::handle<BRepMesh_VertexTool> & Data ();
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	:param theFileNameStr:
	:type theFileNameStr: char *
	:rtype: None
") Dump;
		void Dump (const char * theFileNameStr);
		%feature("compactdefaultargs") ElementNodes;
		%feature("autodoc", "	* Returns indices of nodes forming the given element. @param theElement element which nodes should be retrieved. @param[out] theNodes nodes of the given element.

	:param theElement:
	:type theElement: BRepMesh_Triangle &
	:param ):
	:type ): int ( & theNodes
	:rtype: None
") ElementNodes;
		void ElementNodes (const BRepMesh_Triangle & theElement,Standard_Integer ( & theNodes )[3]);
		%feature("compactdefaultargs") ElementsConnectedTo;
		%feature("autodoc", "	* Returns indices of elements conected to the link with the given index. @param theLinkIndex index of link whose data should be retrieved. returns indices of elements conected to the link.

	:param theLinkIndex:
	:type theLinkIndex: int
	:rtype: BRepMesh_PairOfIndex
") ElementsConnectedTo;
		const BRepMesh_PairOfIndex & ElementsConnectedTo (const Standard_Integer theLinkIndex);
		%feature("compactdefaultargs") ElementsOfDomain;
		%feature("autodoc", "	* Returns map of indices of elements registered in mesh.

	:rtype: inline  IMeshData::MapOfInteger
") ElementsOfDomain;
		inline const IMeshData::MapOfInteger & ElementsOfDomain ();
		%feature("compactdefaultargs") GetElement;
		%feature("autodoc", "	* Get element by the index. @param theIndex index of an element. returns element with the given index.

	:param theIndex:
	:type theIndex: int
	:rtype: BRepMesh_Triangle
") GetElement;
		const BRepMesh_Triangle & GetElement (const Standard_Integer theIndex);
		%feature("compactdefaultargs") GetLink;
		%feature("autodoc", "	* Get link by the index. @param theIndex index of a link. returns link with the given index.

	:param theIndex:
	:type theIndex: int
	:rtype: BRepMesh_Edge
") GetLink;
		const BRepMesh_Edge & GetLink (const Standard_Integer theIndex);
		%feature("compactdefaultargs") GetNode;
		%feature("autodoc", "	* Get node by the index. @param theIndex index of a node. returns node with the given index.

	:param theIndex:
	:type theIndex: int
	:rtype: inline  BRepMesh_Vertex
") GetNode;
		inline const BRepMesh_Vertex & GetNode (const Standard_Integer theIndex);
		%feature("compactdefaultargs") IndexOf;
		%feature("autodoc", "	* Finds the index of the given node. @param theNode node to find. returns index of the given element of zero if node is not in the mesh.

	:param theNode:
	:type theNode: BRepMesh_Vertex &
	:rtype: int
") IndexOf;
		Standard_Integer IndexOf (const BRepMesh_Vertex & theNode);
		%feature("compactdefaultargs") IndexOf;
		%feature("autodoc", "	* Finds the index of the given link. @param theLink link to find. returns index of the given element of zero if link is not in the mesh.

	:param theLink:
	:type theLink: BRepMesh_Edge &
	:rtype: int
") IndexOf;
		Standard_Integer IndexOf (const BRepMesh_Edge & theLink);
		%feature("compactdefaultargs") LinksConnectedTo;
		%feature("autodoc", "	* Get list of links attached to the node with the given index. @param theIndex index of node whose links should be retrieved. returns list of links attached to the node.

	:param theIndex:
	:type theIndex: int
	:rtype: inline  IMeshData::ListOfInteger
") LinksConnectedTo;
		inline const IMeshData::ListOfInteger & LinksConnectedTo (const Standard_Integer theIndex);
		%feature("compactdefaultargs") LinksOfDomain;
		%feature("autodoc", "	* Returns map of indices of links registered in mesh.

	:rtype: inline  IMeshData::MapOfInteger
") LinksOfDomain;
		inline const IMeshData::MapOfInteger & LinksOfDomain ();
		%feature("compactdefaultargs") NbElements;
		%feature("autodoc", "	* @name API for accessing mesh elements. Returns number of links.

	:rtype: inline int
") NbElements;
		inline Standard_Integer NbElements ();
		%feature("compactdefaultargs") NbLinks;
		%feature("autodoc", "	* @name API for accessing mesh links. Returns number of links.

	:rtype: inline int
") NbLinks;
		inline Standard_Integer NbLinks ();
		%feature("compactdefaultargs") NbNodes;
		%feature("autodoc", "	* @name API for accessing mesh nodes. Returns number of nodes.

	:rtype: inline int
") NbNodes;
		inline Standard_Integer NbNodes ();
		%feature("compactdefaultargs") RemoveElement;
		%feature("autodoc", "	* Removes element from the mesh. @param theIndex index of element to be removed.

	:param theIndex:
	:type theIndex: int
	:rtype: None
") RemoveElement;
		void RemoveElement (const Standard_Integer theIndex);
		%feature("compactdefaultargs") RemoveLink;
		%feature("autodoc", "	* Removes link from the mesh in case if it has no connected elements and its type is Free. @param theIndex index of link to be removed. @param isForce if True link will be removed even if movability is not Free.

	:param theIndex:
	:type theIndex: int
	:param isForce: default value is Standard_False
	:type isForce: bool
	:rtype: None
") RemoveLink;
		void RemoveLink (const Standard_Integer theIndex,const Standard_Boolean isForce = Standard_False);
		%feature("compactdefaultargs") RemoveNode;
		%feature("autodoc", "	* Removes node from the mesh in case if it has no connected links and its type is Free. @param theIndex index of node to be removed. @param isForce if True node will be removed even if movability is not Free.

	:param theIndex:
	:type theIndex: int
	:param isForce: default value is Standard_False
	:type isForce: bool
	:rtype: None
") RemoveNode;
		void RemoveNode (const Standard_Integer theIndex,const Standard_Boolean isForce = Standard_False);

        %feature("autodoc", "1");
        %extend{
            std::string StatisticsToString() {
            std::stringstream s;
            self->Statistics(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") SubstituteElement;
		%feature("autodoc", "	* Substitutes the element with the given index by new one. @param theIndex index of element to be substituted. @param theNewLink substituting element. returns False in case if new element is already in the structure, True elsewhere.

	:param theIndex:
	:type theIndex: int
	:param theNewElement:
	:type theNewElement: BRepMesh_Triangle &
	:rtype: bool
") SubstituteElement;
		Standard_Boolean SubstituteElement (const Standard_Integer theIndex,const BRepMesh_Triangle & theNewElement);
		%feature("compactdefaultargs") SubstituteLink;
		%feature("autodoc", "	* Substitutes the link with the given index by new one. @param theIndex index of link to be substituted. @param theNewLink substituting link. returns False in case if new link is already in the structure, True elsewhere.

	:param theIndex:
	:type theIndex: int
	:param theNewLink:
	:type theNewLink: BRepMesh_Edge &
	:rtype: bool
") SubstituteLink;
		Standard_Boolean SubstituteLink (const Standard_Integer theIndex,const BRepMesh_Edge & theNewLink);
		%feature("compactdefaultargs") SubstituteNode;
		%feature("autodoc", "	* Substitutes the node with the given index by new one. @param theIndex index of node to be substituted. @param theNewNode substituting node. returns False in case if new node is already in the structure, True elsewhere.

	:param theIndex:
	:type theIndex: int
	:param theNewNode:
	:type theNewNode: BRepMesh_Vertex &
	:rtype: bool
") SubstituteNode;
		Standard_Boolean SubstituteNode (const Standard_Integer theIndex,const BRepMesh_Vertex & theNewNode);
};


%make_alias(BRepMesh_DataStructureOfDelaun)

%extend BRepMesh_DataStructureOfDelaun {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepMesh_DefaultRangeSplitter;
class BRepMesh_DefaultRangeSplitter {
	public:
		%feature("compactdefaultargs") AddPoint;
		%feature("autodoc", "	* Registers border point.

	:param thePoint:
	:type thePoint: gp_Pnt2d
	:rtype: void
") AddPoint;
		virtual void AddPoint (const gp_Pnt2d & thePoint);
		%feature("compactdefaultargs") AdjustRange;
		%feature("autodoc", "	* Updates discrete range of surface according to its geometric range.

	:rtype: void
") AdjustRange;
		virtual void AdjustRange ();
		%feature("compactdefaultargs") BRepMesh_DefaultRangeSplitter;
		%feature("autodoc", "	* Constructor.

	:rtype: None
") BRepMesh_DefaultRangeSplitter;
		 BRepMesh_DefaultRangeSplitter ();
		%feature("compactdefaultargs") GetDFace;
		%feature("autodoc", "	* Returns face model.

	:rtype: inline  IMeshData::IFaceHandle
") GetDFace;
		inline const IMeshData::IFaceHandle & GetDFace ();
		%feature("compactdefaultargs") GetDelta;
		%feature("autodoc", "	* Returns delta.

	:rtype: inline  std::pair<float, float>
") GetDelta;
		inline const std::pair<Standard_Real, Standard_Real> & GetDelta ();
		%feature("compactdefaultargs") GetRangeU;
		%feature("autodoc", "	* Returns U range.

	:rtype: inline  std::pair<float, float>
") GetRangeU;
		inline const std::pair<Standard_Real, Standard_Real> & GetRangeU ();
		%feature("compactdefaultargs") GetRangeV;
		%feature("autodoc", "	* Returns V range.

	:rtype: inline  std::pair<float, float>
") GetRangeV;
		inline const std::pair<Standard_Real, Standard_Real> & GetRangeV ();
		%feature("compactdefaultargs") GetSurface;
		%feature("autodoc", "	* Returns surface.

	:rtype: inline  opencascade::handle<BRepAdaptor_HSurface>
") GetSurface;
		inline const opencascade::handle<BRepAdaptor_HSurface> & GetSurface ();
		%feature("compactdefaultargs") GetToleranceUV;
		%feature("autodoc", "	:rtype: inline  std::pair<float, float>
") GetToleranceUV;
		inline const std::pair<Standard_Real, Standard_Real> & GetToleranceUV ();
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "	* Returns True if computed range is valid.

	:rtype: bool
") IsValid;
		virtual Standard_Boolean IsValid ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns point in 3d space corresponded to the given point defined in parameteric space of surface.

	:param thePoint2d:
	:type thePoint2d: gp_Pnt2d
	:rtype: inline gp_Pnt
") Point;
		inline gp_Pnt Point (const gp_Pnt2d & thePoint2d);
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "	* Resets this splitter. Must be called before first use.

	:param theDFace:
	:type theDFace: IMeshData::IFaceHandle &
	:param theParameters:
	:type theParameters: IMeshTools_Parameters &
	:rtype: void
") Reset;
		virtual void Reset (const IMeshData::IFaceHandle & theDFace,const IMeshTools_Parameters & theParameters);
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "	* Scales the given point from real parametric space to face basis and otherwise. @param thePoint point to be scaled. @param isToFaceBasis if True converts point to face basis, otherwise performs reverse conversion. returns scaled point.

	:param thePoint:
	:type thePoint: gp_Pnt2d
	:param isToFaceBasis:
	:type isToFaceBasis: bool
	:rtype: gp_Pnt2d
") Scale;
		gp_Pnt2d Scale (const gp_Pnt2d & thePoint,const Standard_Boolean isToFaceBasis);
};


%extend BRepMesh_DefaultRangeSplitter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepMesh_Deflection;
class BRepMesh_Deflection : public Standard_Transient {
	public:
		%feature("compactdefaultargs") ComputeAbsoluteDeflection;
		%feature("autodoc", "	* Returns absolute deflection for theShape with respect to the relative deflection and theMaxShapeSize. @param theShape shape for that the deflection should be computed. @param theRelativeDeflection relative deflection. @param theMaxShapeSize maximum size of the whole shape. returns absolute deflection for the shape.

	:param theShape:
	:type theShape: TopoDS_Shape &
	:param theRelativeDeflection:
	:type theRelativeDeflection: float
	:param theMaxShapeSize:
	:type theMaxShapeSize: float
	:rtype: float
") ComputeAbsoluteDeflection;
		static Standard_Real ComputeAbsoluteDeflection (const TopoDS_Shape & theShape,const Standard_Real theRelativeDeflection,const Standard_Real theMaxShapeSize);
		%feature("compactdefaultargs") ComputeDeflection;
		%feature("autodoc", "	* Computes and updates deflection of the given discrete edge.

	:param theDEdge:
	:type theDEdge: IMeshData::IEdgeHandle &
	:param theMaxShapeSize:
	:type theMaxShapeSize: float
	:param theParameters:
	:type theParameters: IMeshTools_Parameters &
	:rtype: void
") ComputeDeflection;
		static void ComputeDeflection (const IMeshData::IEdgeHandle & theDEdge,const Standard_Real theMaxShapeSize,const IMeshTools_Parameters & theParameters);
		%feature("compactdefaultargs") ComputeDeflection;
		%feature("autodoc", "	* Computes and updates deflection of the given discrete wire.

	:param theDWire:
	:type theDWire: IMeshData::IWireHandle &
	:param theParameters:
	:type theParameters: IMeshTools_Parameters &
	:rtype: void
") ComputeDeflection;
		static void ComputeDeflection (const IMeshData::IWireHandle & theDWire,const IMeshTools_Parameters & theParameters);
		%feature("compactdefaultargs") ComputeDeflection;
		%feature("autodoc", "	* Computes and updates deflection of the given discrete face.

	:param theDFace:
	:type theDFace: IMeshData::IFaceHandle &
	:param theParameters:
	:type theParameters: IMeshTools_Parameters &
	:rtype: void
") ComputeDeflection;
		static void ComputeDeflection (const IMeshData::IFaceHandle & theDFace,const IMeshTools_Parameters & theParameters);
};


%make_alias(BRepMesh_Deflection)

%extend BRepMesh_Deflection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepMesh_Delaun;
class BRepMesh_Delaun {
	public:
		%feature("compactdefaultargs") AddVertices;
		%feature("autodoc", "	* Adds some vertices into the triangulation.

	:param theVerticesIndices:
	:type theVerticesIndices: IMeshData::VectorOfInteger &
	:rtype: None
") AddVertices;
		void AddVertices (IMeshData::VectorOfInteger & theVerticesIndices);
		%feature("compactdefaultargs") BRepMesh_Delaun;
		%feature("autodoc", "	* Creates instance of triangulator, but do not run the algorithm automatically.

	:param theOldMesh:
	:type theOldMesh: opencascade::handle<BRepMesh_DataStructureOfDelaun> &
	:param theCellsCountU:
	:type theCellsCountU: int
	:param theCellsCountV:
	:type theCellsCountV: int
	:param isFillCircles:
	:type isFillCircles: bool
	:rtype: None
") BRepMesh_Delaun;
		 BRepMesh_Delaun (const opencascade::handle<BRepMesh_DataStructureOfDelaun> & theOldMesh,const Standard_Integer theCellsCountU,const Standard_Integer theCellsCountV,const Standard_Boolean isFillCircles);
		%feature("compactdefaultargs") BRepMesh_Delaun;
		%feature("autodoc", "	* Creates the triangulation with an empty Mesh data structure.

	:param theVertices:
	:type theVertices: IMeshData::Array1OfVertexOfDelaun &
	:rtype: None
") BRepMesh_Delaun;
		 BRepMesh_Delaun (IMeshData::Array1OfVertexOfDelaun & theVertices);
		%feature("compactdefaultargs") BRepMesh_Delaun;
		%feature("autodoc", "	* Creates the triangulation with an existent Mesh data structure.

	:param theOldMesh:
	:type theOldMesh: opencascade::handle<BRepMesh_DataStructureOfDelaun> &
	:param theVertices:
	:type theVertices: IMeshData::Array1OfVertexOfDelaun &
	:rtype: None
") BRepMesh_Delaun;
		 BRepMesh_Delaun (const opencascade::handle<BRepMesh_DataStructureOfDelaun> & theOldMesh,IMeshData::Array1OfVertexOfDelaun & theVertices);
		%feature("compactdefaultargs") BRepMesh_Delaun;
		%feature("autodoc", "	* Creates the triangulation with an existant Mesh data structure.

	:param theOldMesh:
	:type theOldMesh: opencascade::handle<BRepMesh_DataStructureOfDelaun> &
	:param theVertexIndices:
	:type theVertexIndices: IMeshData::VectorOfInteger &
	:rtype: None
") BRepMesh_Delaun;
		 BRepMesh_Delaun (const opencascade::handle<BRepMesh_DataStructureOfDelaun> & theOldMesh,IMeshData::VectorOfInteger & theVertexIndices);
		%feature("compactdefaultargs") BRepMesh_Delaun;
		%feature("autodoc", "	* Creates the triangulation with an existant Mesh data structure.

	:param theOldMesh:
	:type theOldMesh: opencascade::handle<BRepMesh_DataStructureOfDelaun> &
	:param theVertexIndices:
	:type theVertexIndices: IMeshData::VectorOfInteger &
	:param theCellsCountU:
	:type theCellsCountU: int
	:param theCellsCountV:
	:type theCellsCountV: int
	:rtype: None
") BRepMesh_Delaun;
		 BRepMesh_Delaun (const opencascade::handle<BRepMesh_DataStructureOfDelaun> & theOldMesh,IMeshData::VectorOfInteger & theVertexIndices,const Standard_Integer theCellsCountU,const Standard_Integer theCellsCountV);
		%feature("compactdefaultargs") Circles;
		%feature("autodoc", "	* Returns tool used to build mesh consistent to Delaunay criteria.

	:rtype: inline  BRepMesh_CircleTool
") Circles;
		inline const BRepMesh_CircleTool & Circles ();
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	* Test is the given triangle contains the given vertex. @param theSqTolerance square tolerance to check closeness to some edge @param theEdgeOn If it is != 0 the vertex lies onto the edge index returned through this parameter.

	:param theTriangleId:
	:type theTriangleId: int
	:param theVertex:
	:type theVertex: BRepMesh_Vertex &
	:param theSqTolerance:
	:type theSqTolerance: float
	:param theEdgeOn:
	:type theEdgeOn: int &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Standard_Integer theTriangleId,const BRepMesh_Vertex & theVertex,const Standard_Real theSqTolerance,Standard_Integer &OutValue);
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
		%feature("compactdefaultargs") GetVertex;
		%feature("autodoc", "	* Gives vertex with the given index

	:param theIndex:
	:type theIndex: int
	:rtype: inline  BRepMesh_Vertex
") GetVertex;
		inline const BRepMesh_Vertex & GetVertex (const Standard_Integer theIndex);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initializes the triangulation with an array of vertices.

	:param theVertices:
	:type theVertices: IMeshData::Array1OfVertexOfDelaun &
	:rtype: None
") Init;
		void Init (IMeshData::Array1OfVertexOfDelaun & theVertices);
		%feature("compactdefaultargs") InitCirclesTool;
		%feature("autodoc", "	* Forces initialization of circles cell filter using working structure.

	:param theCellsCountU:
	:type theCellsCountU: int
	:param theCellsCountV:
	:type theCellsCountV: int
	:rtype: None
") InitCirclesTool;
		void InitCirclesTool (const Standard_Integer theCellsCountU,const Standard_Integer theCellsCountV);
		%feature("compactdefaultargs") RemoveVertex;
		%feature("autodoc", "	* Removes a vertex from the triangulation.

	:param theVertex:
	:type theVertex: BRepMesh_Vertex &
	:rtype: None
") RemoveVertex;
		void RemoveVertex (const BRepMesh_Vertex & theVertex);
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "	* Gives the Mesh data structure.

	:rtype: inline  opencascade::handle<BRepMesh_DataStructureOfDelaun>
") Result;
		inline const opencascade::handle<BRepMesh_DataStructureOfDelaun> & Result ();
		%feature("compactdefaultargs") UseEdge;
		%feature("autodoc", "	* Modify mesh to use the edge. returns True if done

	:param theEdge:
	:type theEdge: int
	:rtype: bool
") UseEdge;
		Standard_Boolean UseEdge (const Standard_Integer theEdge);
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
		%feature("compactdefaultargs") DefaultName;
		%feature("autodoc", "	* Returns name for current meshing algorithm.

	:rtype: inline  TCollection_AsciiString
") DefaultName;
		inline const TCollection_AsciiString & DefaultName ();
		%feature("compactdefaultargs") Discret;
		%feature("autodoc", "	* Returns triangulation algorithm instance. @param theShape shape to be meshed. @param theLinDeflection linear deflection to be used for meshing. @param theAngDeflection angular deflection to be used for meshing.

	:param theShape:
	:type theShape: TopoDS_Shape &
	:param theLinDeflection:
	:type theLinDeflection: float
	:param theAngDeflection:
	:type theAngDeflection: float
	:rtype: opencascade::handle<BRepMesh_DiscretRoot>
") Discret;
		opencascade::handle<BRepMesh_DiscretRoot> Discret (const TopoDS_Shape & theShape,const Standard_Real theLinDeflection,const Standard_Real theAngDeflection);
		%feature("compactdefaultargs") ErrorStatus;
		%feature("autodoc", "	* Returns error status for last meshing algorithm switch.

	:rtype: inline BRepMesh_FactoryError
") ErrorStatus;
		inline BRepMesh_FactoryError ErrorStatus ();
		%feature("compactdefaultargs") FunctionName;
		%feature("autodoc", "	* Returns function name that should be exported by plugin.

	:rtype: inline  TCollection_AsciiString
") FunctionName;
		inline const TCollection_AsciiString & FunctionName ();
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
		%feature("compactdefaultargs") SetDefault;
		%feature("autodoc", "	* Setup meshing algorithm that should be created by this Factory. Returns True if requested tool is available. On fail Factory will continue to use previous algo. Call ::ErrorStatus() method to retrieve fault reason.

	:param theName:
	:type theName: TCollection_AsciiString &
	:param theFuncName: default value is 'DISCRETALGO'
	:type theFuncName: TCollection_AsciiString &
	:rtype: bool
") SetDefault;
		Standard_Boolean SetDefault (const TCollection_AsciiString & theName,const TCollection_AsciiString & theFuncName = "DISCRETALGO");
		%feature("compactdefaultargs") SetDefaultName;
		%feature("autodoc", "	* Setup meshing algorithm by name. Returns True if requested tool is available. On fail Factory will continue to use previous algo.

	:param theName:
	:type theName: TCollection_AsciiString &
	:rtype: bool
") SetDefaultName;
		Standard_Boolean SetDefaultName (const TCollection_AsciiString & theName);
		%feature("compactdefaultargs") SetFunctionName;
		%feature("autodoc", "	* Advanced function. Changes function name to retrieve from plugin. Returns True if requested tool is available. On fail Factory will continue to use previous algo.

	:param theFuncName:
	:type theFuncName: TCollection_AsciiString &
	:rtype: bool
") SetFunctionName;
		Standard_Boolean SetFunctionName (const TCollection_AsciiString & theFuncName);
};


%extend BRepMesh_DiscretFactory {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepMesh_DiscretRoot;
class BRepMesh_DiscretRoot : public Standard_Transient {
	public:
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns true if triangualtion was performed and has success.

	:rtype: inline bool
") IsDone;
		inline Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Compute triangulation for set shape.

	:rtype: None
") Perform;
		void Perform ();
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
};


%make_alias(BRepMesh_DiscretRoot)

%extend BRepMesh_DiscretRoot {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepMesh_EdgeDiscret;
class BRepMesh_EdgeDiscret : public IMeshTools_ModelAlgo {
	public:
		%feature("compactdefaultargs") BRepMesh_EdgeDiscret;
		%feature("autodoc", "	* Constructor.

	:rtype: None
") BRepMesh_EdgeDiscret;
		 BRepMesh_EdgeDiscret ();
		%feature("compactdefaultargs") CreateEdgeTessellationExtractor;
		%feature("autodoc", "	* Creates instance of tessellation extractor.

	:param theDEdge:
	:type theDEdge: IMeshData::IEdgeHandle &
	:param theDFace:
	:type theDFace: IMeshData::IFaceHandle &
	:rtype: opencascade::handle<IMeshTools_CurveTessellator>
") CreateEdgeTessellationExtractor;
		static opencascade::handle<IMeshTools_CurveTessellator> CreateEdgeTessellationExtractor (const IMeshData::IEdgeHandle & theDEdge,const IMeshData::IFaceHandle & theDFace);
		%feature("compactdefaultargs") CreateEdgeTessellator;
		%feature("autodoc", "	* Creates instance of free edge tessellator.

	:param theDEdge:
	:type theDEdge: IMeshData::IEdgeHandle &
	:param theParameters:
	:type theParameters: IMeshTools_Parameters &
	:rtype: opencascade::handle<IMeshTools_CurveTessellator>
") CreateEdgeTessellator;
		static opencascade::handle<IMeshTools_CurveTessellator> CreateEdgeTessellator (const IMeshData::IEdgeHandle & theDEdge,const IMeshTools_Parameters & theParameters);
		%feature("compactdefaultargs") CreateEdgeTessellator;
		%feature("autodoc", "	* Creates instance of edge tessellator.

	:param theDEdge:
	:type theDEdge: IMeshData::IEdgeHandle &
	:param theOrientation:
	:type theOrientation: TopAbs_Orientation
	:param theDFace:
	:type theDFace: IMeshData::IFaceHandle &
	:param theParameters:
	:type theParameters: IMeshTools_Parameters &
	:rtype: opencascade::handle<IMeshTools_CurveTessellator>
") CreateEdgeTessellator;
		static opencascade::handle<IMeshTools_CurveTessellator> CreateEdgeTessellator (const IMeshData::IEdgeHandle & theDEdge,const TopAbs_Orientation theOrientation,const IMeshData::IFaceHandle & theDFace,const IMeshTools_Parameters & theParameters);
		%feature("compactdefaultargs") Tessellate2d;
		%feature("autodoc", "	* Updates 2d discrete edge model using tessellation of 3D curve.

	:param theDEdge:
	:type theDEdge: IMeshData::IEdgeHandle &
	:param theUpdateEnds:
	:type theUpdateEnds: bool
	:rtype: void
") Tessellate2d;
		static void Tessellate2d (const IMeshData::IEdgeHandle & theDEdge,const Standard_Boolean theUpdateEnds);
		%feature("compactdefaultargs") Tessellate3d;
		%feature("autodoc", "	* Updates 3d discrete edge model using the given tessellation tool.

	:param theDEdge:
	:type theDEdge: IMeshData::IEdgeHandle &
	:param theTessellator:
	:type theTessellator: opencascade::handle<IMeshTools_CurveTessellator> &
	:param theUpdateEnds:
	:type theUpdateEnds: bool
	:rtype: void
") Tessellate3d;
		static void Tessellate3d (const IMeshData::IEdgeHandle & theDEdge,const opencascade::handle<IMeshTools_CurveTessellator> & theTessellator,const Standard_Boolean theUpdateEnds);
};


%extend BRepMesh_EdgeDiscret {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepMesh_FaceChecker;
class BRepMesh_FaceChecker : public Standard_Transient {
	public:
typedef NCollection_Shared <NCollection_Vector <Segment>> Segments;
typedef NCollection_Shared <NCollection_Array1 <opencascade::handle <Segments>>> ArrayOfSegments;
		class Segment {};
		%feature("compactdefaultargs") BRepMesh_FaceChecker;
		%feature("autodoc", "	* Default constructor

	:param theFace:
	:type theFace: IMeshData::IFaceHandle &
	:param theParameters:
	:type theParameters: IMeshTools_Parameters &
	:rtype: None
") BRepMesh_FaceChecker;
		 BRepMesh_FaceChecker (const IMeshData::IFaceHandle & theFace,const IMeshTools_Parameters & theParameters);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Performs check wires of the face for intersections. returns True if there is no intersection, False elsewhere.

	:rtype: bool
") Perform;
		Standard_Boolean Perform ();
};


%make_alias(BRepMesh_FaceChecker)

%extend BRepMesh_FaceChecker {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepMesh_FaceDiscret;
class BRepMesh_FaceDiscret : public IMeshTools_ModelAlgo {
	public:
		%feature("compactdefaultargs") BRepMesh_FaceDiscret;
		%feature("autodoc", "	* Constructor.

	:param theAlgoFactory:
	:type theAlgoFactory: opencascade::handle<IMeshTools_MeshAlgoFactory> &
	:rtype: None
") BRepMesh_FaceDiscret;
		 BRepMesh_FaceDiscret (const opencascade::handle<IMeshTools_MeshAlgoFactory> & theAlgoFactory);
};


%extend BRepMesh_FaceDiscret {
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
		%feature("compactdefaultargs") BRepMesh_GeomTool;
		%feature("autodoc", "	* Constructor. Initiates discretization of the given geometric curve. @param theCurve curve to be discretized. @param theFirstParam first parameter of the curve. @param theLastParam last parameter of the curve. @param theLinDeflection linear deflection. @param theAngDeflection angular deflection. @param theMinPointsNb minimum nuber of points to be produced.

	:param theCurve:
	:type theCurve: BRepAdaptor_Curve &
	:param theFirstParam:
	:type theFirstParam: float
	:param theLastParam:
	:type theLastParam: float
	:param theLinDeflection:
	:type theLinDeflection: float
	:param theAngDeflection:
	:type theAngDeflection: float
	:param theMinPointsNb: default value is 2
	:type theMinPointsNb: int
	:param theMinSize: default value is Precision::Confusion()
	:type theMinSize: float
	:rtype: None
") BRepMesh_GeomTool;
		 BRepMesh_GeomTool (const BRepAdaptor_Curve & theCurve,const Standard_Real theFirstParam,const Standard_Real theLastParam,const Standard_Real theLinDeflection,const Standard_Real theAngDeflection,const Standard_Integer theMinPointsNb = 2,const Standard_Real theMinSize = Precision::Confusion());
		%feature("compactdefaultargs") BRepMesh_GeomTool;
		%feature("autodoc", "	* Constructor. Initiates discretization of geometric curve corresponding to iso curve of the given surface. @param theSurface surface the iso curve to be taken from. @param theIsoType type of iso curve to be used, U or V. @param theParamIso parameter on the surface specifying the iso curve. @param theFirstParam first parameter of the curve. @param theLastParam last parameter of the curve. @param theLinDeflection linear deflection. @param theAngDeflection angular deflection. @param theMinPointsNb minimum nuber of points to be produced.

	:param theSurface:
	:type theSurface: opencascade::handle<BRepAdaptor_HSurface> &
	:param theIsoType:
	:type theIsoType: GeomAbs_IsoType
	:param theParamIso:
	:type theParamIso: float
	:param theFirstParam:
	:type theFirstParam: float
	:param theLastParam:
	:type theLastParam: float
	:param theLinDeflection:
	:type theLinDeflection: float
	:param theAngDeflection:
	:type theAngDeflection: float
	:param theMinPointsNb: default value is 2
	:type theMinPointsNb: int
	:param theMinSize: default value is Precision::Confusion()
	:type theMinSize: float
	:rtype: None
") BRepMesh_GeomTool;
		 BRepMesh_GeomTool (const opencascade::handle<BRepAdaptor_HSurface> & theSurface,const GeomAbs_IsoType theIsoType,const Standard_Real theParamIso,const Standard_Real theFirstParam,const Standard_Real theLastParam,const Standard_Real theLinDeflection,const Standard_Real theAngDeflection,const Standard_Integer theMinPointsNb = 2,const Standard_Real theMinSize = Precision::Confusion());
		%feature("compactdefaultargs") CellsCount;
		%feature("autodoc", "	:param theSurface:
	:type theSurface: opencascade::handle<Adaptor3d_HSurface> &
	:param theVerticesNb:
	:type theVerticesNb: int
	:param theDeflection:
	:type theDeflection: float
	:param theRangeSplitter:
	:type theRangeSplitter: BRepMesh_DefaultRangeSplitter *
	:rtype: std::pair<int, int>
") CellsCount;
		static std::pair<Standard_Integer, Standard_Integer> CellsCount (const opencascade::handle<Adaptor3d_HSurface> & theSurface,const Standard_Integer theVerticesNb,const Standard_Real theDeflection,const BRepMesh_DefaultRangeSplitter * theRangeSplitter);
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "	* Returns number of discretization points.

	:rtype: inline int
") NbPoints;
		inline Standard_Integer NbPoints ();
		%feature("compactdefaultargs") SquareDeflectionOfSegment;
		%feature("autodoc", "	* Compute deflection of the given segment.

	:param theFirstPoint:
	:type theFirstPoint: gp_Pnt
	:param theLastPoint:
	:type theLastPoint: gp_Pnt
	:param theMidPoint:
	:type theMidPoint: gp_Pnt
	:rtype: float
") SquareDeflectionOfSegment;
		static Standard_Real SquareDeflectionOfSegment (const gp_Pnt & theFirstPoint,const gp_Pnt & theLastPoint,const gp_Pnt & theMidPoint);
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
	:type theSurface: opencascade::handle<BRepAdaptor_HSurface> &
	:param theParam:
	:type theParam: float &
	:param thePoint:
	:type thePoint: gp_Pnt
	:param theUV:
	:type theUV: gp_Pnt2d
	:rtype: bool
") Value;
		Standard_Boolean Value (const Standard_Integer theIndex,const opencascade::handle<BRepAdaptor_HSurface> & theSurface,Standard_Real &OutValue,gp_Pnt & thePoint,gp_Pnt2d & theUV);
};


%extend BRepMesh_GeomTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepMesh_MeshAlgoFactory;
class BRepMesh_MeshAlgoFactory : public IMeshTools_MeshAlgoFactory {
	public:
		%feature("compactdefaultargs") BRepMesh_MeshAlgoFactory;
		%feature("autodoc", "	* Constructor.

	:rtype: None
") BRepMesh_MeshAlgoFactory;
		 BRepMesh_MeshAlgoFactory ();
		%feature("compactdefaultargs") GetAlgo;
		%feature("autodoc", "	* Creates instance of meshing algorithm for the given type of surface.

	:param theSurfaceType:
	:type theSurfaceType: GeomAbs_SurfaceType
	:param theParameters:
	:type theParameters: IMeshTools_Parameters &
	:rtype: opencascade::handle<IMeshTools_MeshAlgo>
") GetAlgo;
		virtual opencascade::handle<IMeshTools_MeshAlgo> GetAlgo (const GeomAbs_SurfaceType theSurfaceType,const IMeshTools_Parameters & theParameters);
};


%extend BRepMesh_MeshAlgoFactory {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepMesh_MeshTool;
class BRepMesh_MeshTool : public Standard_Transient {
	public:
		class NodeClassifier {};
		%feature("compactdefaultargs") AddAndLegalizeTriangle;
		%feature("autodoc", "	* Adds new triangle with specified nodes to mesh. Legalizes triangle in case if it violates circle criteria.

	:param thePoint1:
	:type thePoint1: int
	:param thePoint2:
	:type thePoint2: int
	:param thePoint3:
	:type thePoint3: int
	:rtype: inline void
") AddAndLegalizeTriangle;
		inline void AddAndLegalizeTriangle (const Standard_Integer thePoint1,const Standard_Integer thePoint2,const Standard_Integer thePoint3);
		%feature("compactdefaultargs") AddLink;
		%feature("autodoc", "	* Adds new link to mesh. Updates link index and link orientaion parameters.

	:param theFirstNode:
	:type theFirstNode: int
	:param theLastNode:
	:type theLastNode: int
	:param theLinkIndex:
	:type theLinkIndex: int &
	:param theLinkOri:
	:type theLinkOri: bool
	:rtype: inline void
") AddLink;
		inline void AddLink (const Standard_Integer theFirstNode,const Standard_Integer theLastNode,Standard_Integer &OutValue,Standard_Boolean &OutValue);
		%feature("compactdefaultargs") AddTriangle;
		%feature("autodoc", "	* Adds new triangle with specified nodes to mesh.

	:param thePoint1:
	:type thePoint1: int
	:param thePoint2:
	:type thePoint2: int
	:param thePoint3:
	:type thePoint3: int
	:param ):
	:type ): int ( & theEdges
	:rtype: inline void
") AddTriangle;
		inline void AddTriangle (const Standard_Integer thePoint1,const Standard_Integer thePoint2,const Standard_Integer thePoint3,Standard_Integer ( & theEdges )[3]);
		%feature("compactdefaultargs") BRepMesh_MeshTool;
		%feature("autodoc", "	* Constructor. Initializes tool by the given data structure.

	:param theStructure:
	:type theStructure: opencascade::handle<BRepMesh_DataStructureOfDelaun> &
	:rtype: None
") BRepMesh_MeshTool;
		 BRepMesh_MeshTool (const opencascade::handle<BRepMesh_DataStructureOfDelaun> & theStructure);
		%feature("compactdefaultargs") CleanFrontierLinks;
		%feature("autodoc", "	* Cleans frontier links from triangles to the right.

	:rtype: None
") CleanFrontierLinks;
		void CleanFrontierLinks ();
		%feature("compactdefaultargs") EraseFreeLinks;
		%feature("autodoc", "	* Erases all links that have no elements connected to them.

	:rtype: None
") EraseFreeLinks;
		void EraseFreeLinks ();
		%feature("compactdefaultargs") EraseFreeLinks;
		%feature("autodoc", "	* Erases links from the specified map that have no elements connected to them.

	:param theLinks:
	:type theLinks: IMeshData::MapOfIntegerInteger &
	:rtype: None
") EraseFreeLinks;
		void EraseFreeLinks (const IMeshData::MapOfIntegerInteger & theLinks);
		%feature("compactdefaultargs") EraseItemsConnectedTo;
		%feature("autodoc", "	* Erases all elements connected to the specified artificial node. In addition, erases the artificial node itself.

	:param theNodeIndex:
	:type theNodeIndex: int
	:rtype: None
") EraseItemsConnectedTo;
		void EraseItemsConnectedTo (const Standard_Integer theNodeIndex);
		%feature("compactdefaultargs") EraseTriangle;
		%feature("autodoc", "	* Erases triangle with the given index and adds the free edges into the map. When an edge is suppressed more than one time it is destroyed.

	:param theTriangleIndex:
	:type theTriangleIndex: int
	:param theLoopEdges:
	:type theLoopEdges: IMeshData::MapOfIntegerInteger &
	:rtype: None
") EraseTriangle;
		void EraseTriangle (const Standard_Integer theTriangleIndex,IMeshData::MapOfIntegerInteger & theLoopEdges);
		%feature("compactdefaultargs") GetStructure;
		%feature("autodoc", "	* Returns data structure manipulated by this tool.

	:rtype: inline  opencascade::handle<BRepMesh_DataStructureOfDelaun>
") GetStructure;
		inline const opencascade::handle<BRepMesh_DataStructureOfDelaun> & GetStructure ();
		%feature("compactdefaultargs") Legalize;
		%feature("autodoc", "	* Performs legalization of triangles connected to the specified link.

	:param theLinkIndex:
	:type theLinkIndex: int
	:rtype: None
") Legalize;
		void Legalize (const Standard_Integer theLinkIndex);
};


%make_alias(BRepMesh_MeshTool)

%extend BRepMesh_MeshTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepMesh_ModelBuilder;
class BRepMesh_ModelBuilder : public IMeshTools_ModelBuilder {
	public:
		%feature("compactdefaultargs") BRepMesh_ModelBuilder;
		%feature("autodoc", "	* Constructor.

	:rtype: None
") BRepMesh_ModelBuilder;
		 BRepMesh_ModelBuilder ();
};


%extend BRepMesh_ModelBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepMesh_ModelHealer;
class BRepMesh_ModelHealer : public IMeshTools_ModelAlgo {
	public:
		%feature("compactdefaultargs") BRepMesh_ModelHealer;
		%feature("autodoc", "	* Constructor.

	:rtype: None
") BRepMesh_ModelHealer;
		 BRepMesh_ModelHealer ();
};


%extend BRepMesh_ModelHealer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepMesh_ModelPostProcessor;
class BRepMesh_ModelPostProcessor : public IMeshTools_ModelAlgo {
	public:
		%feature("compactdefaultargs") BRepMesh_ModelPostProcessor;
		%feature("autodoc", "	* Constructor.

	:rtype: None
") BRepMesh_ModelPostProcessor;
		 BRepMesh_ModelPostProcessor ();
};


%extend BRepMesh_ModelPostProcessor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepMesh_ModelPreProcessor;
class BRepMesh_ModelPreProcessor : public IMeshTools_ModelAlgo {
	public:
		%feature("compactdefaultargs") BRepMesh_ModelPreProcessor;
		%feature("autodoc", "	* Constructor.

	:rtype: None
") BRepMesh_ModelPreProcessor;
		 BRepMesh_ModelPreProcessor ();
};


%extend BRepMesh_ModelPreProcessor {
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
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "	* Computes a hash code for this oriented edge, in the range [1, theUpperBound] @param theUpperBound the upper bound of the range a computing hash code must be within returns a computed hash code, in the range [1, theUpperBound]

	:param theUpperBound:
	:type theUpperBound: int
	:rtype: inline int
") HashCode;
		inline Standard_Integer HashCode (const Standard_Integer theUpperBound);

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
		%feature("compactdefaultargs") LastNode;
		%feature("autodoc", "	* Returns index of last node of the Link.

	:rtype: inline int
") LastNode;
		inline Standard_Integer LastNode ();

        %extend{
            bool __eq_wrapper__(const BRepMesh_OrientedEdge  other) {
            if (*self==other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __eq__(self, right):
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
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	* Appends index to the pair.

	:param theIndex:
	:type theIndex: int
	:rtype: inline void
") Append;
		inline void Append (const Standard_Integer theIndex);
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
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "	* Returns index corresponding to the given position in the pair. @param thePairPos position of index in the pair (1 or 2).

	:param thePairPos:
	:type thePairPos: int
	:rtype: inline int
") Index;
		inline Standard_Integer Index (const Standard_Integer thePairPos);
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	* Returns is pair is empty.

	:rtype: inline bool
") IsEmpty;
		inline Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") LastIndex;
		%feature("autodoc", "	* Returns last index of pair

	:rtype: inline int
") LastIndex;
		inline Standard_Integer LastIndex ();
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	* Prepends index to the pair.

	:param theIndex:
	:type theIndex: int
	:rtype: inline void
") Prepend;
		inline void Prepend (const Standard_Integer theIndex);
		%feature("compactdefaultargs") RemoveIndex;
		%feature("autodoc", "	* Remove index from the given position. @param thePairPos position of index in the pair (1 or 2).

	:param thePairPos:
	:type thePairPos: int
	:rtype: inline void
") RemoveIndex;
		inline void RemoveIndex (const Standard_Integer thePairPos);
		%feature("compactdefaultargs") SetIndex;
		%feature("autodoc", "	* Sets index corresponding to the given position in the pair. @param thePairPos position of index in the pair (1 or 2). @param theIndex index to be stored.

	:param thePairPos:
	:type thePairPos: int
	:param theIndex:
	:type theIndex: int
	:rtype: inline void
") SetIndex;
		inline void SetIndex (const Standard_Integer thePairPos,const Standard_Integer theIndex);
};


%extend BRepMesh_PairOfIndex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepMesh_SelectorOfDataStructureOfDelaun;
class BRepMesh_SelectorOfDataStructureOfDelaun : public Standard_Transient {
	public:
		%feature("compactdefaultargs") AddNeighbours;
		%feature("autodoc", "	* Adds a level of neighbours by edge the selector.

	:rtype: inline void
") AddNeighbours;
		inline void AddNeighbours ();
		%feature("compactdefaultargs") BRepMesh_SelectorOfDataStructureOfDelaun;
		%feature("autodoc", "	* Default constructor.

	:rtype: None
") BRepMesh_SelectorOfDataStructureOfDelaun;
		 BRepMesh_SelectorOfDataStructureOfDelaun ();
		%feature("compactdefaultargs") BRepMesh_SelectorOfDataStructureOfDelaun;
		%feature("autodoc", "	* Constructor. Initializes selector by the mesh.

	:param theMesh:
	:type theMesh: opencascade::handle<BRepMesh_DataStructureOfDelaun> &
	:rtype: None
") BRepMesh_SelectorOfDataStructureOfDelaun;
		 BRepMesh_SelectorOfDataStructureOfDelaun (const opencascade::handle<BRepMesh_DataStructureOfDelaun> & theMesh);
		%feature("compactdefaultargs") Elements;
		%feature("autodoc", "	* Returns selected elements.

	:rtype: inline  IMeshData::MapOfInteger
") Elements;
		inline const IMeshData::MapOfInteger & Elements ();
		%feature("compactdefaultargs") FrontierLinks;
		%feature("autodoc", "	* Gives the list of incices of frontier links.

	:rtype: inline  IMeshData::MapOfInteger
") FrontierLinks;
		inline const IMeshData::MapOfInteger & FrontierLinks ();
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* Initializes selector by the mesh.

	:param theMesh:
	:type theMesh: opencascade::handle<BRepMesh_DataStructureOfDelaun> &
	:rtype: None
") Initialize;
		void Initialize (const opencascade::handle<BRepMesh_DataStructureOfDelaun> & theMesh);
		%feature("compactdefaultargs") Links;
		%feature("autodoc", "	* Returns selected links.

	:rtype: inline  IMeshData::MapOfInteger
") Links;
		inline const IMeshData::MapOfInteger & Links ();
		%feature("compactdefaultargs") NeighboursByEdgeOf;
		%feature("autodoc", "	* Selects all neighboring elements by links of the given element.

	:param theElement:
	:type theElement: BRepMesh_Triangle &
	:rtype: None
") NeighboursByEdgeOf;
		void NeighboursByEdgeOf (const BRepMesh_Triangle & theElement);
		%feature("compactdefaultargs") NeighboursOf;
		%feature("autodoc", "	* Selects all neighboring elements of the given node.

	:param theNode:
	:type theNode: BRepMesh_Vertex &
	:rtype: None
") NeighboursOf;
		void NeighboursOf (const BRepMesh_Vertex & theNode);
		%feature("compactdefaultargs") NeighboursOf;
		%feature("autodoc", "	* Selects all neighboring elements of the given link.

	:param theLink:
	:type theLink: BRepMesh_Edge &
	:rtype: None
") NeighboursOf;
		void NeighboursOf (const BRepMesh_Edge & theLink);
		%feature("compactdefaultargs") NeighboursOf;
		%feature("autodoc", "	* Selects all neighboring elements of the given element.

	:param theElement:
	:type theElement: BRepMesh_Triangle &
	:rtype: None
") NeighboursOf;
		void NeighboursOf (const BRepMesh_Triangle & theElement);
		%feature("compactdefaultargs") NeighboursOf;
		%feature("autodoc", "	* Adds a level of neighbours by edge to the selector.

	:param &:
	:type &: BRepMesh_SelectorOfDataStructureOfDelaun
	:rtype: inline void
") NeighboursOf;
		inline void NeighboursOf (const BRepMesh_SelectorOfDataStructureOfDelaun &);
		%feature("compactdefaultargs") NeighboursOfElement;
		%feature("autodoc", "	* Selects all neighboring elements by nodes of the given element.

	:param theElementIndex:
	:type theElementIndex: int
	:rtype: None
") NeighboursOfElement;
		void NeighboursOfElement (const Standard_Integer theElementIndex);
		%feature("compactdefaultargs") NeighboursOfLink;
		%feature("autodoc", "	* Selects all neighboring elements of link with the given index.

	:param theLinkIndex:
	:type theLinkIndex: int
	:rtype: None
") NeighboursOfLink;
		void NeighboursOfLink (const Standard_Integer theLinkIndex);
		%feature("compactdefaultargs") NeighboursOfNode;
		%feature("autodoc", "	* Selects all neighboring elements of node with the given index.

	:param theNodeIndex:
	:type theNodeIndex: int
	:rtype: None
") NeighboursOfNode;
		void NeighboursOfNode (const Standard_Integer theNodeIndex);
		%feature("compactdefaultargs") Nodes;
		%feature("autodoc", "	* Returns selected nodes.

	:rtype: inline  IMeshData::MapOfInteger
") Nodes;
		inline const IMeshData::MapOfInteger & Nodes ();
};


%make_alias(BRepMesh_SelectorOfDataStructureOfDelaun)

%extend BRepMesh_SelectorOfDataStructureOfDelaun {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepMesh_ShapeTool;
class BRepMesh_ShapeTool : public Standard_Transient {
	public:
		%feature("compactdefaultargs") AddInFace;
		%feature("autodoc", "	* Stores the given triangulation into the given face. @param theFace face to be updated by triangulation. @param theTriangulation triangulation to be stored into the face.

	:param theFace:
	:type theFace: TopoDS_Face &
	:param theTriangulation:
	:type theTriangulation: opencascade::handle<Poly_Triangulation> &
	:rtype: void
") AddInFace;
		static void AddInFace (const TopoDS_Face & theFace,opencascade::handle<Poly_Triangulation> & theTriangulation);
		%feature("compactdefaultargs") BoxMaxDimension;
		%feature("autodoc", "	* Gets the maximum dimension of the given bounding box. If the given bounding box is void leaves the resulting value unchanged. @param theBox bounding box to be processed. @param theMaxDimension maximum dimension of the given box.

	:param theBox:
	:type theBox: Bnd_Box &
	:param theMaxDimension:
	:type theMaxDimension: float &
	:rtype: void
") BoxMaxDimension;
		static void BoxMaxDimension (const Bnd_Box & theBox,Standard_Real &OutValue);
		%feature("compactdefaultargs") CheckAndUpdateFlags;
		%feature("autodoc", "	* Checks same parameter, same range and degenerativity attributes using geometrical data of the given edge and updates edge model by computed parameters in case of worst case - it can drop flags same parameter and same range to False but never to True if it is already set to False. In contrary, it can also drop degenerated flag to True, but never to False if it is already set to True.

	:param theEdge:
	:type theEdge: IMeshData::IEdgeHandle &
	:param thePCurve:
	:type thePCurve: IMeshData::IPCurveHandle &
	:rtype: void
") CheckAndUpdateFlags;
		static void CheckAndUpdateFlags (const IMeshData::IEdgeHandle & theEdge,const IMeshData::IPCurveHandle & thePCurve);
		%feature("compactdefaultargs") MaxFaceTolerance;
		%feature("autodoc", "	* Returns maximum tolerance of the given face. Considers tolerances of edges and vertices contained in the given face.

	:param theFace:
	:type theFace: TopoDS_Face &
	:rtype: float
") MaxFaceTolerance;
		static Standard_Real MaxFaceTolerance (const TopoDS_Face & theFace);
		%feature("compactdefaultargs") NullifyEdge;
		%feature("autodoc", "	* Nullifies polygon on triangulation stored in the edge. @param theEdge edge to be updated by null polygon. @param theTriangulation triangulation the given edge is associated to. @param theLocation face location.

	:param theEdge:
	:type theEdge: TopoDS_Edge &
	:param theTriangulation:
	:type theTriangulation: opencascade::handle<Poly_Triangulation> &
	:param theLocation:
	:type theLocation: TopLoc_Location &
	:rtype: void
") NullifyEdge;
		static void NullifyEdge (const TopoDS_Edge & theEdge,const opencascade::handle<Poly_Triangulation> & theTriangulation,const TopLoc_Location & theLocation);
		%feature("compactdefaultargs") NullifyEdge;
		%feature("autodoc", "	* Nullifies 3d polygon stored in the edge. @param theEdge edge to be updated by null polygon. @param theLocation face location.

	:param theEdge:
	:type theEdge: TopoDS_Edge &
	:param theLocation:
	:type theLocation: TopLoc_Location &
	:rtype: void
") NullifyEdge;
		static void NullifyEdge (const TopoDS_Edge & theEdge,const TopLoc_Location & theLocation);
		%feature("compactdefaultargs") NullifyFace;
		%feature("autodoc", "	* Nullifies triangulation stored in the face. @param theFace face to be updated by null triangulation.

	:param theFace:
	:type theFace: TopoDS_Face &
	:rtype: void
") NullifyFace;
		static void NullifyFace (const TopoDS_Face & theFace);
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "	* Gets the parametric range of the given edge on the given face.

	:param theEdge:
	:type theEdge: TopoDS_Edge &
	:param theFace:
	:type theFace: TopoDS_Face &
	:param thePCurve:
	:type thePCurve: opencascade::handle<Geom2d_Curve> &
	:param theFirstParam:
	:type theFirstParam: float &
	:param theLastParam:
	:type theLastParam: float &
	:param isConsiderOrientation: default value is Standard_False
	:type isConsiderOrientation: bool
	:rtype: bool
") Range;
		static Standard_Boolean Range (const TopoDS_Edge & theEdge,const TopoDS_Face & theFace,opencascade::handle<Geom2d_Curve> & thePCurve,Standard_Real &OutValue,Standard_Real &OutValue,const Standard_Boolean isConsiderOrientation = Standard_False);
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "	* Gets the 3d range of the given edge.

	:param theEdge:
	:type theEdge: TopoDS_Edge &
	:param theCurve:
	:type theCurve: opencascade::handle<Geom_Curve> &
	:param theFirstParam:
	:type theFirstParam: float &
	:param theLastParam:
	:type theLastParam: float &
	:param isConsiderOrientation: default value is Standard_False
	:type isConsiderOrientation: bool
	:rtype: bool
") Range;
		static Standard_Boolean Range (const TopoDS_Edge & theEdge,opencascade::handle<Geom_Curve> & theCurve,Standard_Real &OutValue,Standard_Real &OutValue,const Standard_Boolean isConsiderOrientation = Standard_False);
		%feature("compactdefaultargs") UVPoints;
		%feature("autodoc", "	* Gets the strict UV locations of the extremities of the edge using pcurve.

	:param theEdge:
	:type theEdge: TopoDS_Edge &
	:param theFace:
	:type theFace: TopoDS_Face &
	:param theFirstPoint2d:
	:type theFirstPoint2d: gp_Pnt2d
	:param theLastPoint2d:
	:type theLastPoint2d: gp_Pnt2d
	:param isConsiderOrientation: default value is Standard_False
	:type isConsiderOrientation: bool
	:rtype: bool
") UVPoints;
		static Standard_Boolean UVPoints (const TopoDS_Edge & theEdge,const TopoDS_Face & theFace,gp_Pnt2d & theFirstPoint2d,gp_Pnt2d & theLastPoint2d,const Standard_Boolean isConsiderOrientation = Standard_False);
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "	* Updates the given edge by the given tessellated representation. @param theEdge edge to be updated. @param thePolygon tessellated representation of the edge to be stored. @param theTriangulation triangulation the given edge is associated to. @param theLocation face location.

	:param theEdge:
	:type theEdge: TopoDS_Edge &
	:param thePolygon:
	:type thePolygon: opencascade::handle<Poly_PolygonOnTriangulation> &
	:param theTriangulation:
	:type theTriangulation: opencascade::handle<Poly_Triangulation> &
	:param theLocation:
	:type theLocation: TopLoc_Location &
	:rtype: void
") UpdateEdge;
		static void UpdateEdge (const TopoDS_Edge & theEdge,const opencascade::handle<Poly_PolygonOnTriangulation> & thePolygon,const opencascade::handle<Poly_Triangulation> & theTriangulation,const TopLoc_Location & theLocation);
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "	* Updates the given edge by the given tessellated representation. @param theEdge edge to be updated. @param thePolygon tessellated representation of the edge to be stored.

	:param theEdge:
	:type theEdge: TopoDS_Edge &
	:param thePolygon:
	:type thePolygon: opencascade::handle<Poly_Polygon3D> &
	:rtype: void
") UpdateEdge;
		static void UpdateEdge (const TopoDS_Edge & theEdge,const opencascade::handle<Poly_Polygon3D> & thePolygon);
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "	* Updates the given seam edge by the given tessellated representations. @param theEdge edge to be updated. @param thePolygon1 tessellated representation corresponding to forward direction of the seam edge. @param thePolygon2 tessellated representation corresponding to reversed direction of the seam edge. @param theTriangulation triangulation the given edge is associated to. @param theLocation face location.

	:param theEdge:
	:type theEdge: TopoDS_Edge &
	:param thePolygon1:
	:type thePolygon1: opencascade::handle<Poly_PolygonOnTriangulation> &
	:param thePolygon2:
	:type thePolygon2: opencascade::handle<Poly_PolygonOnTriangulation> &
	:param theTriangulation:
	:type theTriangulation: opencascade::handle<Poly_Triangulation> &
	:param theLocation:
	:type theLocation: TopLoc_Location &
	:rtype: void
") UpdateEdge;
		static void UpdateEdge (const TopoDS_Edge & theEdge,const opencascade::handle<Poly_PolygonOnTriangulation> & thePolygon1,const opencascade::handle<Poly_PolygonOnTriangulation> & thePolygon2,const opencascade::handle<Poly_Triangulation> & theTriangulation,const TopLoc_Location & theLocation);
		%feature("compactdefaultargs") UseLocation;
		%feature("autodoc", "	* Applies location to the given point and return result. @param thePnt point to be transformed. @param theLoc location to be applied.

	:param thePnt:
	:type thePnt: gp_Pnt
	:param theLoc:
	:type theLoc: TopLoc_Location &
	:rtype: gp_Pnt
") UseLocation;
		static gp_Pnt UseLocation (const gp_Pnt & thePnt,const TopLoc_Location & theLoc);
};


%make_alias(BRepMesh_ShapeTool)

%extend BRepMesh_ShapeTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepMesh_ShapeVisitor;
class BRepMesh_ShapeVisitor : public IMeshTools_ShapeVisitor {
	public:
		%feature("compactdefaultargs") BRepMesh_ShapeVisitor;
		%feature("autodoc", "	* Constructor.

	:param theModel:
	:type theModel: opencascade::handle<IMeshData_Model> &
	:rtype: None
") BRepMesh_ShapeVisitor;
		 BRepMesh_ShapeVisitor (const opencascade::handle<IMeshData_Model> & theModel);
		%feature("compactdefaultargs") Visit;
		%feature("autodoc", "	* Handles TopoDS_Face object.

	:param theFace:
	:type theFace: TopoDS_Face &
	:rtype: void
") Visit;
		virtual void Visit (const TopoDS_Face & theFace);
		%feature("compactdefaultargs") Visit;
		%feature("autodoc", "	* Handles TopoDS_Edge object.

	:param theEdge:
	:type theEdge: TopoDS_Edge &
	:rtype: void
") Visit;
		virtual void Visit (const TopoDS_Edge & theEdge);
};


%extend BRepMesh_ShapeVisitor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepMesh_Triangle;
class BRepMesh_Triangle {
	public:
		int myEdges[3];
		bool myOrientations[3];
		BRepMesh_DegreeOfFreedom myMovability;
		%feature("compactdefaultargs") BRepMesh_Triangle;
		%feature("autodoc", "	* Default constructor.

	:rtype: None
") BRepMesh_Triangle;
		 BRepMesh_Triangle ();
		%feature("compactdefaultargs") BRepMesh_Triangle;
		%feature("autodoc", "	* Constructor. @param theEdges array of edges of triangle. @param theOrientations array of edge's orientations. @param theMovability movability of triangle.

	:param ):
	:type ): int ( & theEdges
	:param ):
	:type ): bool ( & theOrientations
	:param theMovability:
	:type theMovability: BRepMesh_DegreeOfFreedom
	:rtype: None
") BRepMesh_Triangle;
		 BRepMesh_Triangle (const Standard_Integer ( & theEdges )[3],const Standard_Boolean ( & theOrientations )[3],const BRepMesh_DegreeOfFreedom theMovability);
		%feature("compactdefaultargs") Edges;
		%feature("autodoc", "	* Gets edges with orientations composing the triangle. @param[out] theEdges array edges are stored to. @param[out] theOrientations array orientations are stored to.

	:param ):
	:type ): int ( & theEdges
	:param ):
	:type ): bool ( & theOrientations
	:rtype: inline void
") Edges;
		inline void Edges (Standard_Integer ( & theEdges )[3],Standard_Boolean ( & theOrientations )[3]);
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "	* Computes a hash code for this triangle, in the range [1, theUpperBound] @param theUpperBound the upper bound of the range a computing hash code must be within returns a computed hash code, in the range [1, theUpperBound]

	:param theUpperBound:
	:type theUpperBound: int
	:rtype: inline int
") HashCode;
		inline Standard_Integer HashCode (const Standard_Integer theUpperBound);

        %extend {
            Standard_Integer __hash__() {
            return $self->HashCode(2147483647);
            }
        };
        		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* Initializes the triangle by the given parameters. @param theEdges array of edges of triangle. @param theOrientations array of edge's orientations. @param theMovability movability of triangle.

	:param ):
	:type ): int ( & theEdges
	:param ):
	:type ): bool ( & theOrientations
	:param theMovability:
	:type theMovability: BRepMesh_DegreeOfFreedom
	:rtype: inline void
") Initialize;
		inline void Initialize (const Standard_Integer ( & theEdges )[3],const Standard_Boolean ( & theOrientations )[3],const BRepMesh_DegreeOfFreedom theMovability);
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	* Checks for equality with another triangle. @param theOther triangle to be checked against this one. returns True if equal, False if not.

	:param theOther:
	:type theOther: BRepMesh_Triangle &
	:rtype: inline bool
") IsEqual;
		inline Standard_Boolean IsEqual (const BRepMesh_Triangle & theOther);
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

        %extend{
            bool __eq_wrapper__(const BRepMesh_Triangle  other) {
            if (*self==other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __eq__(self, right):
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
		%feature("compactdefaultargs") ChangeCoord;
		%feature("autodoc", "	* Returns position of the vertex in parametric space for modification.

	:rtype: inline gp_XY
") ChangeCoord;
		inline gp_XY  ChangeCoord ();
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "	* Returns position of the vertex in parametric space.

	:rtype: inline  gp_XY
") Coord;
		inline const gp_XY  Coord ();
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "	* Computes a hash code for this vertex, in the range [1, theUpperBound] @param theUpperBound the upper bound of the range a computing hash code must be within returns a computed hash code, in the range [1, theUpperBound]

	:param theUpperBound:
	:type theUpperBound: int
	:rtype: inline int
") HashCode;
		inline Standard_Integer HashCode (const Standard_Integer theUpperBound);

        %extend {
            Standard_Integer __hash__() {
            return $self->HashCode(2147483647);
            }
        };
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
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	* Checks for equality with another vertex. @param theOther vertex to be checked against this one. returns True if equal, False if not.

	:param theOther:
	:type theOther: BRepMesh_Vertex &
	:rtype: inline bool
") IsEqual;
		inline Standard_Boolean IsEqual (const BRepMesh_Vertex & theOther);
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

        %extend{
            bool __eq_wrapper__(const BRepMesh_Vertex  other) {
            if (*self==other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __eq__(self, right):
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
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Registers the given vertex. @param theVertex vertex to be registered.

	:param theVertex:
	:type theVertex: BRepMesh_Vertex &
	:rtype: int
") Add;
		Standard_Integer Add (const BRepMesh_Vertex & theVertex);
		%feature("compactdefaultargs") BRepMesh_VertexInspector;
		%feature("autodoc", "	* Constructor. @param theAllocator memory allocator to be used by internal collections.

	:param theAllocator:
	:type theAllocator: opencascade::handle<NCollection_IncAllocator> &
	:rtype: None
") BRepMesh_VertexInspector;
		 BRepMesh_VertexInspector (const opencascade::handle<NCollection_IncAllocator> & theAllocator);
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
		%feature("compactdefaultargs") GetCoincidentPoint;
		%feature("autodoc", "	* Returns index of point coinciding with regerence one.

	:rtype: inline int
") GetCoincidentPoint;
		inline Standard_Integer GetCoincidentPoint ();
		%feature("compactdefaultargs") GetListOfDelPoints;
		%feature("autodoc", "	* Returns list with indexes of vertices that have movability attribute equal to BRepMesh_Deleted and can be replaced with another node.

	:rtype: inline  IMeshData::ListOfInteger
") GetListOfDelPoints;
		inline const IMeshData::ListOfInteger & GetListOfDelPoints ();
		%feature("compactdefaultargs") GetVertex;
		%feature("autodoc", "	* Returns vertex with the given index.

	:param theIndex:
	:type theIndex: int
	:rtype: inline BRepMesh_Vertex
") GetVertex;
		inline BRepMesh_Vertex & GetVertex (Standard_Integer theIndex);
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
		%feature("compactdefaultargs") NbVertices;
		%feature("autodoc", "	* Returns number of registered vertices.

	:rtype: inline int
") NbVertices;
		inline Standard_Integer NbVertices ();
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "	* Set reference point to be checked.

	:param thePoint:
	:type thePoint: gp_XY
	:rtype: inline void
") SetPoint;
		inline void SetPoint (const gp_XY & thePoint);
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
};


%extend BRepMesh_VertexInspector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepMesh_VertexTool;
class BRepMesh_VertexTool : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds vertex with empty data to the tool. @param theVertex node to be added to the mesh. @param isForceAdd adds the given node to structure without checking on coincidence with other nodes. returns index of the node in the structure.

	:param theVertex:
	:type theVertex: BRepMesh_Vertex &
	:param isForceAdd:
	:type isForceAdd: bool
	:rtype: int
") Add;
		Standard_Integer Add (const BRepMesh_Vertex & theVertex,const Standard_Boolean isForceAdd);
		%feature("compactdefaultargs") BRepMesh_VertexTool;
		%feature("autodoc", "	* Constructor. @param theAllocator memory allocator to be used by internal collections.

	:param theAllocator:
	:type theAllocator: opencascade::handle<NCollection_IncAllocator> &
	:rtype: None
") BRepMesh_VertexTool;
		 BRepMesh_VertexTool (const opencascade::handle<NCollection_IncAllocator> & theAllocator);
		%feature("compactdefaultargs") DeleteVertex;
		%feature("autodoc", "	* Deletes vertex with the given index from the tool.

	:param theIndex:
	:type theIndex: int
	:rtype: None
") DeleteVertex;
		void DeleteVertex (const Standard_Integer theIndex);
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	* Returns a number of vertices.

	:rtype: inline int
") Extent;
		inline Standard_Integer Extent ();
		%feature("compactdefaultargs") FindIndex;
		%feature("autodoc", "	* Returns index of the given vertex.

	:param theVertex:
	:type theVertex: BRepMesh_Vertex &
	:rtype: int
") FindIndex;
		Standard_Integer FindIndex (const BRepMesh_Vertex & theVertex);
		%feature("compactdefaultargs") FindKey;
		%feature("autodoc", "	* Returns vertex by the given index.

	:param theIndex:
	:type theIndex: int
	:rtype: inline  BRepMesh_Vertex
") FindKey;
		inline const BRepMesh_Vertex & FindKey (const Standard_Integer theIndex);
		%feature("compactdefaultargs") GetListOfDelNodes;
		%feature("autodoc", "	* Returns the list with indexes of vertices that have movability attribute equal to BRepMesh_Deleted and can be replaced with another node.

	:rtype: inline  IMeshData::ListOfInteger
") GetListOfDelNodes;
		inline const IMeshData::ListOfInteger & GetListOfDelNodes ();
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "	* Gets the tolerance to be used for identification of coincident vertices. @param theToleranceX tolerance for X dimension. @param theToleranceY tolerance for Y dimension.

	:param theToleranceX:
	:type theToleranceX: float &
	:param theToleranceY:
	:type theToleranceY: float &
	:rtype: None
") GetTolerance;
		void GetTolerance (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	* Returns True when the map contains no keys.

	:rtype: inline bool
") IsEmpty;
		inline Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") RemoveLast;
		%feature("autodoc", "	* Remove last node from the structure.

	:rtype: inline void
") RemoveLast;
		inline void RemoveLast ();
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

        %feature("autodoc", "1");
        %extend{
            std::string StatisticsToString() {
            std::stringstream s;
            self->Statistics(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") Substitute;
		%feature("autodoc", "	* Substitutes vertex with the given by the given vertex with attributes. @param theIndex index of vertex to be substituted. @param theVertex replacement vertex.

	:param theIndex:
	:type theIndex: int
	:param theVertex:
	:type theVertex: BRepMesh_Vertex &
	:rtype: None
") Substitute;
		void Substitute (const Standard_Integer theIndex,const BRepMesh_Vertex & theVertex);
};


%make_alias(BRepMesh_VertexTool)

%extend BRepMesh_VertexTool {
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
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	* Checks for equality with another edge. @param theOther edge to be checked against this one. returns True if equal, False if not.

	:param theOther:
	:type theOther: BRepMesh_Edge &
	:rtype: inline bool
") IsEqual;
		inline Standard_Boolean IsEqual (const BRepMesh_Edge & theOther);
		%feature("compactdefaultargs") IsSameOrientation;
		%feature("autodoc", "	* Checks if the given edge and this one have the same orientation. @param theOther edge to be checked against this one. etrun True if edges have the same orientation, False if not.

	:param theOther:
	:type theOther: BRepMesh_Edge &
	:rtype: inline bool
") IsSameOrientation;
		inline Standard_Boolean IsSameOrientation (const BRepMesh_Edge & theOther);
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

        %extend{
            bool __eq_wrapper__(const BRepMesh_Edge  other) {
            if (*self==other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __eq__(self, right):
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
		%feature("compactdefaultargs") BRepMesh_IncrementalMesh;
		%feature("autodoc", "	* Constructor. Automatically calls method Perform. @param theShape shape to be meshed. @param theParameters - parameters of meshing

	:param theShape:
	:type theShape: TopoDS_Shape &
	:param theParameters:
	:type theParameters: IMeshTools_Parameters &
	:rtype: None
") BRepMesh_IncrementalMesh;
		 BRepMesh_IncrementalMesh (const TopoDS_Shape & theShape,const IMeshTools_Parameters & theParameters);
		%feature("compactdefaultargs") ChangeParameters;
		%feature("autodoc", "	* Returns modifiable meshing parameters

	:rtype: inline IMeshTools_Parameters
") ChangeParameters;
		inline IMeshTools_Parameters & ChangeParameters ();
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
		%feature("compactdefaultargs") GetStatusFlags;
		%feature("autodoc", "	* Returns accumulated status flags faced during meshing.

	:rtype: inline int
") GetStatusFlags;
		inline Standard_Integer GetStatusFlags ();
		%feature("compactdefaultargs") IsModified;
		%feature("autodoc", "	* Returns modified flag.

	:rtype: inline bool
") IsModified;
		inline Standard_Boolean IsModified ();
		%feature("compactdefaultargs") IsParallelDefault;
		%feature("autodoc", "	* Returns multi-threading usage flag set by default in Discret() static method (thus applied only to Mesh Factories).

	:rtype: bool
") IsParallelDefault;
		static Standard_Boolean IsParallelDefault ();
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "	* @name accessing to parameters. Returns meshing parameters

	:rtype: inline  IMeshTools_Parameters
") Parameters;
		inline const IMeshTools_Parameters & Parameters ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Performs meshing ot the shape.

	:rtype: void
") Perform;
		virtual void Perform ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Performs meshing using custom context;

	:param theContext:
	:type theContext: opencascade::handle<IMeshTools_Context> &
	:rtype: None
") Perform;
		void Perform (const opencascade::handle<IMeshTools_Context> & theContext);
		%feature("compactdefaultargs") SetParallelDefault;
		%feature("autodoc", "	* Setup multi-threading usage flag set by default in Discret() static method (thus applied only to Mesh Factories).

	:param isInParallel:
	:type isInParallel: bool
	:rtype: void
") SetParallelDefault;
		static void SetParallelDefault (const Standard_Boolean isInParallel);
};


%make_alias(BRepMesh_IncrementalMesh)

%extend BRepMesh_IncrementalMesh {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepMesh_DelaunayBaseMeshAlgo;
class BRepMesh_DelaunayBaseMeshAlgo : public BRepMesh_ConstrainedBaseMeshAlgo {
	public:
		%feature("compactdefaultargs") BRepMesh_DelaunayBaseMeshAlgo;
		%feature("autodoc", "	* Constructor.

	:rtype: None
") BRepMesh_DelaunayBaseMeshAlgo;
		 BRepMesh_DelaunayBaseMeshAlgo ();
};


%extend BRepMesh_DelaunayBaseMeshAlgo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */
