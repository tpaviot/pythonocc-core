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

%define IMESHDATADOCSTRING
"IMeshData module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_IMeshData.html"
%enddef
%module (package="OCC.Core", docstring=IMESHDATADOCSTRING) IMeshData

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


%include IMeshData_headers.i

/* public enums */
enum IMeshData_Status {
	IMeshData_NoError = 0,
	IMeshData_OpenWire = 1,
	IMeshData_SelfIntersectingWire = 2,
	IMeshData_Failure = 4,
	IMeshData_ReMesh = 8,
	IMeshData_UnorientedWire = 16,
	IMeshData_TooFewPoints = 32,
	IMeshData_Outdated = 64,
	IMeshData_Reused = 128,
};

/* end public enums declaration */

/* handles */
%wrap_handle(IMeshData_ParametersList)
%wrap_handle(IMeshData_Shape)
%wrap_handle(IMeshData_Curve)
%wrap_handle(IMeshData_Model)
%wrap_handle(IMeshData_PCurve)
%wrap_handle(IMeshData_TessellatedShape)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
typedef IMeshData::IMeshData_Edge * IMeshData::IEdgePtr;
typedef IMeshData::IMeshData_Face * IMeshData::IFacePtr;
typedef opencascade::handle <IMeshData_Edge> IMeshData::IEdgeHandle;
typedef opencascade::handle <IMeshData_Wire> IMeshData::IWireHandle;
typedef opencascade::handle <IMeshData_Face> IMeshData::IFaceHandle;
typedef opencascade::handle <IMeshData_Curve> IMeshData::ICurveHandle;
typedef opencascade::handle <IMeshData_PCurve> IMeshData::IPCurveHandle;
typedef opencascade::handle <ICurveArrayAdaptor> IMeshData::ICurveArrayAdaptorHandle;
typedef IMeshData::NCollection_Shared <NCollection_EBTree <Standard_Integer , Bnd_Box2d>> IMeshData::BndBox2dTree;
typedef IMeshData::NCollection_UBTreeFiller <Standard_Integer , Bnd_Box2d> IMeshData::BndBox2dTreeFiller;
typedef IMeshData::NCollection_Shared <NCollection_Vector <IFaceHandle>> IMeshData::VectorOfIFaceHandles;
typedef IMeshData::NCollection_Shared <NCollection_Vector <IWireHandle>> IMeshData::VectorOfIWireHandles;
typedef IMeshData::NCollection_Shared <NCollection_Vector <IEdgeHandle>> IMeshData::VectorOfIEdgeHandles;
typedef IMeshData::NCollection_Shared <NCollection_Vector <IPCurveHandle>> IMeshData::VectorOfIPCurveHandles;
typedef IMeshData::NCollection_Shared <NCollection_Vector <IEdgePtr>> IMeshData::VectorOfIEdgePtrs;
typedef IMeshData::NCollection_Shared <NCollection_Vector <Standard_Boolean>> IMeshData::VectorOfBoolean;
typedef IMeshData::NCollection_Shared <NCollection_Vector <Standard_Integer>> IMeshData::VectorOfInteger;
typedef IMeshData::NCollection_Shared <NCollection_Vector <TopAbs_Orientation>> IMeshData::VectorOfOrientation;
typedef IMeshData::NCollection_Shared <NCollection_Vector <BRepMesh_Triangle>> IMeshData::VectorOfElements;
typedef IMeshData::NCollection_Shared <NCollection_Vector <BRepMesh_Circle>> IMeshData::VectorOfCircle;
typedef IMeshData::NCollection_Shared <NCollection_Array1 <BRepMesh_Vertex>> IMeshData::Array1OfVertexOfDelaun;
typedef IMeshData::NCollection_Shared <NCollection_Vector <BRepMesh_Vertex>> IMeshData::VectorOfVertex;
typedef IMeshData::NCollection_Shared <NCollection_Sequence <Bnd_B2d>> IMeshData::SequenceOfBndB2d;
typedef IMeshData::NCollection_Shared <NCollection_Sequence <Standard_Integer>> IMeshData::SequenceOfInteger;
typedef IMeshData::NCollection_Shared <NCollection_Sequence <Standard_Real>> IMeshData::SequenceOfReal;
typedef std::deque <gp_Pnt , NCollection_StdAllocator <gp_Pnt>> IMeshData::Model::SequenceOfPnt;
typedef std::deque <gp_Pnt2d , NCollection_StdAllocator <gp_Pnt2d>> IMeshData::Model::SequenceOfPnt2d;
typedef std::deque <Standard_Real , NCollection_StdAllocator <Standard_Real>> IMeshData::Model::SequenceOfReal;
typedef std::deque <Standard_Integer , NCollection_StdAllocator <Standard_Integer>> IMeshData::Model::SequenceOfInteger;
typedef IMeshData::NCollection_Shared <NCollection_List <Standard_Integer>> IMeshData::ListOfInteger;
typedef IMeshData::NCollection_Shared <NCollection_List <gp_Pnt2d>> IMeshData::ListOfPnt2d;
typedef IMeshData::NCollection_Shared <NCollection_List <IPCurveHandle>> IMeshData::ListOfIPCurves;
typedef IMeshData::NCollection_Shared <TColStd_PackedMapOfInteger> IMeshData::MapOfInteger;
typedef IMeshData::TColStd_MapIteratorOfPackedMapOfInteger IMeshData::IteratorOfMapOfInteger;
typedef IMeshData::NCollection_CellFilter <BRepMesh_CircleInspector> IMeshData::CircleCellFilter;
typedef IMeshData::NCollection_CellFilter <BRepMesh_VertexInspector> IMeshData::VertexCellFilter;
typedef IMeshData::NCollection_Shared <NCollection_DataMap <TopoDS_Shape , Standard_Integer , TopTools_ShapeMapHasher>> IMeshData::DMapOfShapeInteger;
typedef IMeshData::NCollection_Shared <NCollection_DataMap <IFacePtr , ListOfInteger , WeakEqual <IMeshData_Face>>> IMeshData::DMapOfIFacePtrsListOfInteger;
typedef IMeshData::NCollection_Shared <NCollection_Map <IEdgePtr , WeakEqual <IMeshData_Edge>>> IMeshData::MapOfIEdgePtr;
typedef IMeshData::NCollection_Shared <NCollection_Map <IFacePtr , WeakEqual <IMeshData_Face>>> IMeshData::MapOfIFacePtr;
typedef IMeshData::NCollection_Shared <NCollection_Map <BRepMesh_OrientedEdge>> IMeshData::MapOfOrientedEdges;
typedef IMeshData::NCollection_Shared <NCollection_Map <Standard_Real>> IMeshData::MapOfReal;
typedef IMeshData::NCollection_Shared <NCollection_IndexedDataMap <IFacePtr , ListOfIPCurves , WeakEqual <IMeshData_Face>>> IMeshData::IDMapOfIFacePtrsListOfIPCurves;
typedef NCollection_Shared <NCollection_DataMap <IFacePtr , opencascade::handle <MapOfIEdgePtr>, WeakEqual <IMeshData_Face>>> IMeshData::DMapOfIFacePtrsMapOfIEdgePtrs;
typedef IMeshData::NCollection_Shared <NCollection_IndexedDataMap <BRepMesh_Edge , BRepMesh_PairOfIndex>> IMeshData::IDMapOfLink;
typedef IMeshData::NCollection_Shared <NCollection_DataMap <Standard_Integer , ListOfInteger>> IMeshData::DMapOfIntegerListOfInteger;
typedef IMeshData::NCollection_Shared <NCollection_DataMap <Standard_Integer , Standard_Integer>> IMeshData::MapOfIntegerInteger;
typedef IMeshData::NCollection_Shared <NCollection_IndexedMap <Standard_Real>> IMeshData::IMapOfReal;
typedef IMeshData::NCollection_Shared <NCollection_Array1 <Standard_Integer>> IMeshData::Array1OfInteger;
/* end typedefs declaration */

%nodefaultctor IMeshData_ParametersList;
class IMeshData_ParametersList : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clears parameters list.

	:param isKeepEndPoints:
	:type isKeepEndPoints: bool
	:rtype: void
") Clear;
		virtual void Clear (const Standard_Boolean isKeepEndPoints);
		%feature("compactdefaultargs") GetParameter;
		%feature("autodoc", "	* Returns parameter with the given index.

	:param theIndex:
	:type theIndex: int
	:rtype: float
") GetParameter;
		virtual Standard_Real & GetParameter (const Standard_Integer theIndex);
		%feature("compactdefaultargs") ParametersNb;
		%feature("autodoc", "	* Returns number of parameters.

	:rtype: int
") ParametersNb;
		virtual Standard_Integer ParametersNb ();
};


%make_alias(IMeshData_ParametersList)

%extend IMeshData_ParametersList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IMeshData_Shape;
class IMeshData_Shape : public Standard_Transient {
	public:
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "	* Returns shape assigned to discrete shape.

	:rtype: TopoDS_Shape
") GetShape;
		const TopoDS_Shape  GetShape ();
		%feature("compactdefaultargs") SetShape;
		%feature("autodoc", "	* Assigns shape to discrete shape.

	:param theShape:
	:type theShape: TopoDS_Shape &
	:rtype: inline void
") SetShape;
		inline void SetShape (const TopoDS_Shape & theShape);
};


%make_alias(IMeshData_Shape)

%extend IMeshData_Shape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IMeshData_StatusOwner;
class IMeshData_StatusOwner {
	public:
		%feature("compactdefaultargs") GetStatusMask;
		%feature("autodoc", "	* Returns complete status mask.

	:rtype: inline int
") GetStatusMask;
		inline Standard_Integer GetStatusMask ();
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	* Returns true in case if status is strictly equal to the given value.

	:param theValue:
	:type theValue: IMeshData_Status
	:rtype: inline bool
") IsEqual;
		inline Standard_Boolean IsEqual (const IMeshData_Status theValue);
		%feature("compactdefaultargs") IsSet;
		%feature("autodoc", "	* Returns true in case if status is set.

	:param theValue:
	:type theValue: IMeshData_Status
	:rtype: inline bool
") IsSet;
		inline Standard_Boolean IsSet (const IMeshData_Status theValue);
		%feature("compactdefaultargs") SetStatus;
		%feature("autodoc", "	* Adds status to status flags of a face.

	:param theValue:
	:type theValue: IMeshData_Status
	:rtype: inline void
") SetStatus;
		inline void SetStatus (const IMeshData_Status theValue);
		%feature("compactdefaultargs") UnsetStatus;
		%feature("autodoc", "	* Adds status to status flags of a face.

	:param theValue:
	:type theValue: IMeshData_Status
	:rtype: inline void
") UnsetStatus;
		inline void UnsetStatus (const IMeshData_Status theValue);
};


%extend IMeshData_StatusOwner {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IMeshData_Curve;
class IMeshData_Curve : public IMeshData_ParametersList {
	public:
		%feature("compactdefaultargs") AddPoint;
		%feature("autodoc", "	* Adds new discretization point to curve.

	:param thePoint:
	:type thePoint: gp_Pnt
	:param theParamOnCurve:
	:type theParamOnCurve: float
	:rtype: void
") AddPoint;
		virtual void AddPoint (const gp_Pnt & thePoint,const Standard_Real theParamOnCurve);
		%feature("compactdefaultargs") GetPoint;
		%feature("autodoc", "	* Returns discretization point with the given index.

	:param theIndex:
	:type theIndex: int
	:rtype: gp_Pnt
") GetPoint;
		virtual gp_Pnt  GetPoint (const Standard_Integer theIndex);
		%feature("compactdefaultargs") InsertPoint;
		%feature("autodoc", "	* Inserts new discretization point at the given position.

	:param thePosition:
	:type thePosition: int
	:param thePoint:
	:type thePoint: gp_Pnt
	:param theParamOnPCurve:
	:type theParamOnPCurve: float
	:rtype: void
") InsertPoint;
		virtual void InsertPoint (const Standard_Integer thePosition,const gp_Pnt & thePoint,const Standard_Real theParamOnPCurve);
		%feature("compactdefaultargs") RemovePoint;
		%feature("autodoc", "	* Removes point with the given index.

	:param theIndex:
	:type theIndex: int
	:rtype: void
") RemovePoint;
		virtual void RemovePoint (const Standard_Integer theIndex);
};


%make_alias(IMeshData_Curve)

%extend IMeshData_Curve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IMeshData_Model;
class IMeshData_Model : public IMeshData_Shape {
	public:
		%feature("compactdefaultargs") AddEdge;
		%feature("autodoc", "	* Adds new edge to shape model.

	:param theEdge:
	:type theEdge: TopoDS_Edge &
	:rtype: IMeshData::IEdgeHandle
") AddEdge;
		virtual const IMeshData::IEdgeHandle & AddEdge (const TopoDS_Edge & theEdge);
		%feature("compactdefaultargs") AddFace;
		%feature("autodoc", "	* Adds new face to shape model.

	:param theFace:
	:type theFace: TopoDS_Face &
	:rtype: IMeshData::IFaceHandle
") AddFace;
		virtual const IMeshData::IFaceHandle & AddFace (const TopoDS_Face & theFace);
		%feature("compactdefaultargs") EdgesNb;
		%feature("autodoc", "	* @name discrete edges Returns number of edges in discrete model.

	:rtype: int
") EdgesNb;
		virtual Standard_Integer EdgesNb ();
		%feature("compactdefaultargs") FacesNb;
		%feature("autodoc", "	* @name discrete faces Returns number of faces in discrete model.

	:rtype: int
") FacesNb;
		virtual Standard_Integer FacesNb ();
		%feature("compactdefaultargs") GetEdge;
		%feature("autodoc", "	* Gets model's edge with the given index.

	:param theIndex:
	:type theIndex: int
	:rtype: IMeshData::IEdgeHandle
") GetEdge;
		virtual const IMeshData::IEdgeHandle & GetEdge (const Standard_Integer theIndex);
		%feature("compactdefaultargs") GetFace;
		%feature("autodoc", "	* Gets model's face with the given index.

	:param theIndex:
	:type theIndex: int
	:rtype: IMeshData::IFaceHandle
") GetFace;
		virtual const IMeshData::IFaceHandle & GetFace (const Standard_Integer theIndex);
		%feature("compactdefaultargs") GetMaxSize;
		%feature("autodoc", "	* Returns maximum size of shape model.

	:rtype: float
") GetMaxSize;
		virtual Standard_Real GetMaxSize ();
};


%make_alias(IMeshData_Model)

%extend IMeshData_Model {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IMeshData_PCurve;
class IMeshData_PCurve : public IMeshData_ParametersList {
	public:
		%feature("compactdefaultargs") AddPoint;
		%feature("autodoc", "	* Adds new discretization point to pcurve.

	:param thePoint:
	:type thePoint: gp_Pnt2d
	:param theParamOnPCurve:
	:type theParamOnPCurve: float
	:rtype: void
") AddPoint;
		virtual void AddPoint (const gp_Pnt2d & thePoint,const Standard_Real theParamOnPCurve);
		%feature("compactdefaultargs") GetFace;
		%feature("autodoc", "	* Returns discrete face pcurve is associated to.

	:rtype: inline  IMeshData::IFacePtr
") GetFace;
		inline const IMeshData::IFacePtr & GetFace ();
		%feature("compactdefaultargs") GetIndex;
		%feature("autodoc", "	* Returns index in mesh corresponded to discretization point with the given index.

	:param theIndex:
	:type theIndex: int
	:rtype: int
") GetIndex;
		virtual Standard_Integer & GetIndex (const Standard_Integer theIndex);
		%feature("compactdefaultargs") GetOrientation;
		%feature("autodoc", "	* Returns orientation of the edge associated with current pcurve.

	:rtype: inline TopAbs_Orientation
") GetOrientation;
		inline TopAbs_Orientation GetOrientation ();
		%feature("compactdefaultargs") GetPoint;
		%feature("autodoc", "	* Returns discretization point with the given index.

	:param theIndex:
	:type theIndex: int
	:rtype: gp_Pnt2d
") GetPoint;
		virtual gp_Pnt2d  GetPoint (const Standard_Integer theIndex);
		%feature("compactdefaultargs") InsertPoint;
		%feature("autodoc", "	* Inserts new discretization point at the given position.

	:param thePosition:
	:type thePosition: int
	:param thePoint:
	:type thePoint: gp_Pnt2d
	:param theParamOnPCurve:
	:type theParamOnPCurve: float
	:rtype: void
") InsertPoint;
		virtual void InsertPoint (const Standard_Integer thePosition,const gp_Pnt2d & thePoint,const Standard_Real theParamOnPCurve);
		%feature("compactdefaultargs") IsForward;
		%feature("autodoc", "	* Returns forward flag of this pcurve.

	:rtype: inline bool
") IsForward;
		inline Standard_Boolean IsForward ();
		%feature("compactdefaultargs") IsInternal;
		%feature("autodoc", "	* Returns internal flag of this pcurve.

	:rtype: inline bool
") IsInternal;
		inline Standard_Boolean IsInternal ();
		%feature("compactdefaultargs") RemovePoint;
		%feature("autodoc", "	* Removes point with the given index.

	:param theIndex:
	:type theIndex: int
	:rtype: void
") RemovePoint;
		virtual void RemovePoint (const Standard_Integer theIndex);
};


%make_alias(IMeshData_PCurve)

%extend IMeshData_PCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IMeshData_TessellatedShape;
class IMeshData_TessellatedShape : public IMeshData_Shape {
	public:
		%feature("compactdefaultargs") GetDeflection;
		%feature("autodoc", "	* Gets deflection value for the discrete model.

	:rtype: inline float
") GetDeflection;
		inline Standard_Real GetDeflection ();
		%feature("compactdefaultargs") SetDeflection;
		%feature("autodoc", "	* Sets deflection value for the discrete model.

	:param theValue:
	:type theValue: float
	:rtype: inline void
") SetDeflection;
		inline void SetDeflection (const Standard_Real theValue);
};


%make_alias(IMeshData_TessellatedShape)

%extend IMeshData_TessellatedShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */
