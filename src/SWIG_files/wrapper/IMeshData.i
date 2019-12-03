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
%define IMESHDATADOCSTRING
"IMeshData module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_imeshdata.html"
%enddef
%module (package="OCC.Core", docstring=IMESHDATADOCSTRING) IMeshData


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
#include<IMeshData_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TopoDS_module.hxx>
#include<gp_module.hxx>
#include<TopAbs_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<Geom2dAdaptor_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Adaptor2d_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TopoDS.i
%import gp.i
%import TopAbs.i
%import BRepAdaptor.i
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
%wrap_handle(IMeshData_Edge)
%wrap_handle(IMeshData_Face)
%wrap_handle(IMeshData_Wire)
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

/*********************************
* class IMeshData_ParametersList *
*********************************/
%nodefaultctor IMeshData_ParametersList;
class IMeshData_ParametersList : public Standard_Transient {
	public:
		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Clears parameters list.
	:param isKeepEndPoints:
	:type isKeepEndPoints: bool
	:rtype: void") Clear;
		virtual void Clear (const Standard_Boolean isKeepEndPoints);

		/****************** GetParameter ******************/
		%feature("compactdefaultargs") GetParameter;
		%feature("autodoc", "* Returns parameter with the given index.
	:param theIndex:
	:type theIndex: int
	:rtype: float") GetParameter;
		virtual Standard_Real & GetParameter (const Standard_Integer theIndex);

		/****************** ParametersNb ******************/
		%feature("compactdefaultargs") ParametersNb;
		%feature("autodoc", "* Returns number of parameters.
	:rtype: int") ParametersNb;
		virtual Standard_Integer ParametersNb ();

};


%make_alias(IMeshData_ParametersList)

%extend IMeshData_ParametersList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class IMeshData_Shape *
************************/
%nodefaultctor IMeshData_Shape;
class IMeshData_Shape : public Standard_Transient {
	public:
		/****************** GetShape ******************/
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "* Returns shape assigned to discrete shape.
	:rtype: TopoDS_Shape") GetShape;
		const TopoDS_Shape  GetShape ();

		/****************** SetShape ******************/
		%feature("compactdefaultargs") SetShape;
		%feature("autodoc", "* Assigns shape to discrete shape.
	:param theShape:
	:type theShape: TopoDS_Shape
	:rtype: inline void") SetShape;
		inline void SetShape (const TopoDS_Shape & theShape);

};


%make_alias(IMeshData_Shape)

%extend IMeshData_Shape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IMeshData_StatusOwner *
******************************/
%nodefaultctor IMeshData_StatusOwner;
class IMeshData_StatusOwner {
	public:
		/****************** GetStatusMask ******************/
		%feature("compactdefaultargs") GetStatusMask;
		%feature("autodoc", "* Returns complete status mask.
	:rtype: inline int") GetStatusMask;
		inline Standard_Integer GetStatusMask ();

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "* Returns true in case if status is strictly equal to the given value.
	:param theValue:
	:type theValue: IMeshData_Status
	:rtype: inline bool") IsEqual;
		inline Standard_Boolean IsEqual (const IMeshData_Status theValue);

		/****************** IsSet ******************/
		%feature("compactdefaultargs") IsSet;
		%feature("autodoc", "* Returns true in case if status is set.
	:param theValue:
	:type theValue: IMeshData_Status
	:rtype: inline bool") IsSet;
		inline Standard_Boolean IsSet (const IMeshData_Status theValue);

		/****************** SetStatus ******************/
		%feature("compactdefaultargs") SetStatus;
		%feature("autodoc", "* Adds status to status flags of a face.
	:param theValue:
	:type theValue: IMeshData_Status
	:rtype: inline void") SetStatus;
		inline void SetStatus (const IMeshData_Status theValue);

		/****************** UnsetStatus ******************/
		%feature("compactdefaultargs") UnsetStatus;
		%feature("autodoc", "* Adds status to status flags of a face.
	:param theValue:
	:type theValue: IMeshData_Status
	:rtype: inline void") UnsetStatus;
		inline void UnsetStatus (const IMeshData_Status theValue);

};


%extend IMeshData_StatusOwner {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************
* class WeakEqual *
******************/
/************************
* class IMeshData_Curve *
************************/
%nodefaultctor IMeshData_Curve;
class IMeshData_Curve : public IMeshData_ParametersList {
	public:
		/****************** AddPoint ******************/
		%feature("compactdefaultargs") AddPoint;
		%feature("autodoc", "* Adds new discretization point to curve.
	:param thePoint:
	:type thePoint: gp_Pnt
	:param theParamOnCurve:
	:type theParamOnCurve: float
	:rtype: void") AddPoint;
		virtual void AddPoint (const gp_Pnt & thePoint,const Standard_Real theParamOnCurve);

		/****************** GetPoint ******************/
		%feature("compactdefaultargs") GetPoint;
		%feature("autodoc", "* Returns discretization point with the given index.
	:param theIndex:
	:type theIndex: int
	:rtype: gp_Pnt") GetPoint;
		virtual gp_Pnt  GetPoint (const Standard_Integer theIndex);

		/****************** InsertPoint ******************/
		%feature("compactdefaultargs") InsertPoint;
		%feature("autodoc", "* Inserts new discretization point at the given position.
	:param thePosition:
	:type thePosition: int
	:param thePoint:
	:type thePoint: gp_Pnt
	:param theParamOnPCurve:
	:type theParamOnPCurve: float
	:rtype: void") InsertPoint;
		virtual void InsertPoint (const Standard_Integer thePosition,const gp_Pnt & thePoint,const Standard_Real theParamOnPCurve);

		/****************** RemovePoint ******************/
		%feature("compactdefaultargs") RemovePoint;
		%feature("autodoc", "* Removes point with the given index.
	:param theIndex:
	:type theIndex: int
	:rtype: void") RemovePoint;
		virtual void RemovePoint (const Standard_Integer theIndex);

};


%make_alias(IMeshData_Curve)

%extend IMeshData_Curve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class IMeshData_Model *
************************/
%nodefaultctor IMeshData_Model;
class IMeshData_Model : public IMeshData_Shape {
	public:
		/****************** AddEdge ******************/
		%feature("compactdefaultargs") AddEdge;
		%feature("autodoc", "* Adds new edge to shape model.
	:param theEdge:
	:type theEdge: TopoDS_Edge
	:rtype: IMeshData::IEdgeHandle") AddEdge;
		virtual const IMeshData::IEdgeHandle & AddEdge (const TopoDS_Edge & theEdge);

		/****************** AddFace ******************/
		%feature("compactdefaultargs") AddFace;
		%feature("autodoc", "* Adds new face to shape model.
	:param theFace:
	:type theFace: TopoDS_Face
	:rtype: IMeshData::IFaceHandle") AddFace;
		virtual const IMeshData::IFaceHandle & AddFace (const TopoDS_Face & theFace);

		/****************** EdgesNb ******************/
		%feature("compactdefaultargs") EdgesNb;
		%feature("autodoc", "* @name discrete edges Returns number of edges in discrete model.
	:rtype: int") EdgesNb;
		virtual Standard_Integer EdgesNb ();

		/****************** FacesNb ******************/
		%feature("compactdefaultargs") FacesNb;
		%feature("autodoc", "* @name discrete faces Returns number of faces in discrete model.
	:rtype: int") FacesNb;
		virtual Standard_Integer FacesNb ();

		/****************** GetEdge ******************/
		%feature("compactdefaultargs") GetEdge;
		%feature("autodoc", "* Gets model's edge with the given index.
	:param theIndex:
	:type theIndex: int
	:rtype: IMeshData::IEdgeHandle") GetEdge;
		virtual const IMeshData::IEdgeHandle & GetEdge (const Standard_Integer theIndex);

		/****************** GetFace ******************/
		%feature("compactdefaultargs") GetFace;
		%feature("autodoc", "* Gets model's face with the given index.
	:param theIndex:
	:type theIndex: int
	:rtype: IMeshData::IFaceHandle") GetFace;
		virtual const IMeshData::IFaceHandle & GetFace (const Standard_Integer theIndex);

		/****************** GetMaxSize ******************/
		%feature("compactdefaultargs") GetMaxSize;
		%feature("autodoc", "* Returns maximum size of shape model.
	:rtype: float") GetMaxSize;
		virtual Standard_Real GetMaxSize ();

};


%make_alias(IMeshData_Model)

%extend IMeshData_Model {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class IMeshData_PCurve *
*************************/
%nodefaultctor IMeshData_PCurve;
class IMeshData_PCurve : public IMeshData_ParametersList {
	public:
		/****************** AddPoint ******************/
		%feature("compactdefaultargs") AddPoint;
		%feature("autodoc", "* Adds new discretization point to pcurve.
	:param thePoint:
	:type thePoint: gp_Pnt2d
	:param theParamOnPCurve:
	:type theParamOnPCurve: float
	:rtype: void") AddPoint;
		virtual void AddPoint (const gp_Pnt2d & thePoint,const Standard_Real theParamOnPCurve);

		/****************** GetFace ******************/
		%feature("compactdefaultargs") GetFace;
		%feature("autodoc", "* Returns discrete face pcurve is associated to.
	:rtype: inline  IMeshData::IFacePtr") GetFace;
		inline const IMeshData::IFacePtr & GetFace ();

		/****************** GetIndex ******************/
		%feature("compactdefaultargs") GetIndex;
		%feature("autodoc", "* Returns index in mesh corresponded to discretization point with the given index.
	:param theIndex:
	:type theIndex: int
	:rtype: int") GetIndex;
		virtual Standard_Integer & GetIndex (const Standard_Integer theIndex);

		/****************** GetOrientation ******************/
		%feature("compactdefaultargs") GetOrientation;
		%feature("autodoc", "* Returns orientation of the edge associated with current pcurve.
	:rtype: inline TopAbs_Orientation") GetOrientation;
		inline TopAbs_Orientation GetOrientation ();

		/****************** GetPoint ******************/
		%feature("compactdefaultargs") GetPoint;
		%feature("autodoc", "* Returns discretization point with the given index.
	:param theIndex:
	:type theIndex: int
	:rtype: gp_Pnt2d") GetPoint;
		virtual gp_Pnt2d  GetPoint (const Standard_Integer theIndex);

		/****************** InsertPoint ******************/
		%feature("compactdefaultargs") InsertPoint;
		%feature("autodoc", "* Inserts new discretization point at the given position.
	:param thePosition:
	:type thePosition: int
	:param thePoint:
	:type thePoint: gp_Pnt2d
	:param theParamOnPCurve:
	:type theParamOnPCurve: float
	:rtype: void") InsertPoint;
		virtual void InsertPoint (const Standard_Integer thePosition,const gp_Pnt2d & thePoint,const Standard_Real theParamOnPCurve);

		/****************** IsForward ******************/
		%feature("compactdefaultargs") IsForward;
		%feature("autodoc", "* Returns forward flag of this pcurve.
	:rtype: inline bool") IsForward;
		inline Standard_Boolean IsForward ();

		/****************** IsInternal ******************/
		%feature("compactdefaultargs") IsInternal;
		%feature("autodoc", "* Returns internal flag of this pcurve.
	:rtype: inline bool") IsInternal;
		inline Standard_Boolean IsInternal ();

		/****************** RemovePoint ******************/
		%feature("compactdefaultargs") RemovePoint;
		%feature("autodoc", "* Removes point with the given index.
	:param theIndex:
	:type theIndex: int
	:rtype: void") RemovePoint;
		virtual void RemovePoint (const Standard_Integer theIndex);

};


%make_alias(IMeshData_PCurve)

%extend IMeshData_PCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class IMeshData_TessellatedShape *
***********************************/
%nodefaultctor IMeshData_TessellatedShape;
class IMeshData_TessellatedShape : public IMeshData_Shape {
	public:
		/****************** GetDeflection ******************/
		%feature("compactdefaultargs") GetDeflection;
		%feature("autodoc", "* Gets deflection value for the discrete model.
	:rtype: inline float") GetDeflection;
		inline Standard_Real GetDeflection ();

		/****************** SetDeflection ******************/
		%feature("compactdefaultargs") SetDeflection;
		%feature("autodoc", "* Sets deflection value for the discrete model.
	:param theValue:
	:type theValue: float
	:rtype: inline void") SetDeflection;
		inline void SetDeflection (const Standard_Real theValue);

};


%make_alias(IMeshData_TessellatedShape)

%extend IMeshData_TessellatedShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class IMeshData_Edge *
***********************/
%nodefaultctor IMeshData_Edge;
class IMeshData_Edge : public IMeshData_TessellatedShape, public IMeshData_StatusOwner {
	public:
		/****************** AddPCurve ******************/
		%feature("compactdefaultargs") AddPCurve;
		%feature("autodoc", "* Adds discrete pcurve for the specifed discrete face.
	:param theDFace:
	:type theDFace: IMeshData::IFacePtr
	:param theOrientation:
	:type theOrientation: TopAbs_Orientation
	:rtype: IMeshData::IPCurveHandle") AddPCurve;
		virtual const IMeshData::IPCurveHandle & AddPCurve (const IMeshData::IFacePtr & theDFace,const TopAbs_Orientation theOrientation);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Clears curve and all pcurves assigned to the edge from discretization.
	:param isKeepEndPoints:
	:type isKeepEndPoints: bool
	:rtype: inline void") Clear;
		inline void Clear (const Standard_Boolean isKeepEndPoints);

		/****************** GetAngularDeflection ******************/
		%feature("compactdefaultargs") GetAngularDeflection;
		%feature("autodoc", "* Gets value of angular deflection for the discrete model.
	:rtype: inline float") GetAngularDeflection;
		inline Standard_Real GetAngularDeflection ();

		/****************** GetCurve ******************/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "* Returns 3d curve associated with current edge.
	:rtype: inline  IMeshData::ICurveHandle") GetCurve;
		inline const IMeshData::ICurveHandle & GetCurve ();

		/****************** GetDegenerated ******************/
		%feature("compactdefaultargs") GetDegenerated;
		%feature("autodoc", "* Returns degenerative flag. By default equals to flag stored in topological shape.
	:rtype: inline bool") GetDegenerated;
		inline Standard_Boolean GetDegenerated ();

		/****************** GetEdge ******************/
		%feature("compactdefaultargs") GetEdge;
		%feature("autodoc", "* Returns TopoDS_Edge attached to model.
	:rtype: inline  TopoDS_Edge") GetEdge;
		inline const TopoDS_Edge  GetEdge ();

		/****************** GetPCurve ******************/
		%feature("compactdefaultargs") GetPCurve;
		%feature("autodoc", "* Returns pcurve for the specified discrete face.
	:param theDFace:
	:type theDFace: IMeshData::IFacePtr
	:param theOrientation:
	:type theOrientation: TopAbs_Orientation
	:rtype: IMeshData::IPCurveHandle") GetPCurve;
		virtual const IMeshData::IPCurveHandle & GetPCurve (const IMeshData::IFacePtr & theDFace,const TopAbs_Orientation theOrientation);

		/****************** GetPCurve ******************/
		%feature("compactdefaultargs") GetPCurve;
		%feature("autodoc", "* Returns pcurve with the given index.
	:param theIndex:
	:type theIndex: int
	:rtype: IMeshData::IPCurveHandle") GetPCurve;
		virtual const IMeshData::IPCurveHandle & GetPCurve (const Standard_Integer theIndex);

		/****************** GetSameParam ******************/
		%feature("compactdefaultargs") GetSameParam;
		%feature("autodoc", "* Returns same param flag. By default equals to flag stored in topological shape.
	:rtype: inline bool") GetSameParam;
		inline Standard_Boolean GetSameParam ();

		/****************** GetSameRange ******************/
		%feature("compactdefaultargs") GetSameRange;
		%feature("autodoc", "* Returns same range flag. By default equals to flag stored in topological shape.
	:rtype: inline bool") GetSameRange;
		inline Standard_Boolean GetSameRange ();

		/****************** IsFree ******************/
		%feature("compactdefaultargs") IsFree;
		%feature("autodoc", "* Returns true in case if the edge is free one, i.e. it does not have pcurves.
	:rtype: inline bool") IsFree;
		inline Standard_Boolean IsFree ();

		/****************** PCurvesNb ******************/
		%feature("compactdefaultargs") PCurvesNb;
		%feature("autodoc", "* Returns number of pcurves assigned to current edge.
	:rtype: int") PCurvesNb;
		virtual Standard_Integer PCurvesNb ();

		/****************** SetAngularDeflection ******************/
		%feature("compactdefaultargs") SetAngularDeflection;
		%feature("autodoc", "* Sets value of angular deflection for the discrete model.
	:param theValue:
	:type theValue: float
	:rtype: inline void") SetAngularDeflection;
		inline void SetAngularDeflection (const Standard_Real theValue);

		/****************** SetCurve ******************/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "* Sets 3d curve associated with current edge.
	:param theCurve:
	:type theCurve: IMeshData::ICurveHandle
	:rtype: inline void") SetCurve;
		inline void SetCurve (const IMeshData::ICurveHandle & theCurve);

		/****************** SetDegenerated ******************/
		%feature("compactdefaultargs") SetDegenerated;
		%feature("autodoc", "* Updates degenerative flag.
	:param theValue:
	:type theValue: bool
	:rtype: inline void") SetDegenerated;
		inline void SetDegenerated (const Standard_Boolean theValue);

		/****************** SetSameParam ******************/
		%feature("compactdefaultargs") SetSameParam;
		%feature("autodoc", "* Updates same param flag.
	:param theValue:
	:type theValue: bool
	:rtype: inline void") SetSameParam;
		inline void SetSameParam (const Standard_Boolean theValue);

		/****************** SetSameRange ******************/
		%feature("compactdefaultargs") SetSameRange;
		%feature("autodoc", "* Updates same range flag.
	:param theValue:
	:type theValue: bool
	:rtype: inline void") SetSameRange;
		inline void SetSameRange (const Standard_Boolean theValue);

};


%make_alias(IMeshData_Edge)

%extend IMeshData_Edge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class IMeshData_Face *
***********************/
%nodefaultctor IMeshData_Face;
class IMeshData_Face : public IMeshData_TessellatedShape, public IMeshData_StatusOwner {
	public:
		/****************** AddWire ******************/
		%feature("compactdefaultargs") AddWire;
		%feature("autodoc", "* Adds wire to discrete model of face.
	:param theWire:
	:type theWire: TopoDS_Wire
	:param theEdgeNb: default value is 0
	:type theEdgeNb: int
	:rtype: IMeshData::IWireHandle") AddWire;
		virtual const IMeshData::IWireHandle & AddWire (const TopoDS_Wire & theWire,const Standard_Integer theEdgeNb = 0);

		/****************** GetFace ******************/
		%feature("compactdefaultargs") GetFace;
		%feature("autodoc", "* Returns TopoDS_Face attached to model.
	:rtype: inline  TopoDS_Face") GetFace;
		inline const TopoDS_Face  GetFace ();

		/****************** GetSurface ******************/
		%feature("compactdefaultargs") GetSurface;
		%feature("autodoc", "* Returns face's surface.
	:rtype: inline  opencascade::handle<BRepAdaptor_HSurface>") GetSurface;
		inline const opencascade::handle<BRepAdaptor_HSurface> & GetSurface ();

		/****************** GetWire ******************/
		%feature("compactdefaultargs") GetWire;
		%feature("autodoc", "* Returns discrete edge with the given index.
	:param theIndex:
	:type theIndex: int
	:rtype: IMeshData::IWireHandle") GetWire;
		virtual const IMeshData::IWireHandle & GetWire (const Standard_Integer theIndex);

		/****************** IsValid ******************/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "* Returns whether the face discrete model is valid.
	:rtype: inline bool") IsValid;
		inline Standard_Boolean IsValid ();

		/****************** WiresNb ******************/
		%feature("compactdefaultargs") WiresNb;
		%feature("autodoc", "* Returns number of wires.
	:rtype: int") WiresNb;
		virtual Standard_Integer WiresNb ();

};


%make_alias(IMeshData_Face)

%extend IMeshData_Face {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class IMeshData_Wire *
***********************/
%nodefaultctor IMeshData_Wire;
class IMeshData_Wire : public IMeshData_TessellatedShape, public IMeshData_StatusOwner {
	public:
		/****************** AddEdge ******************/
		%feature("compactdefaultargs") AddEdge;
		%feature("autodoc", "* Adds new discrete edge with specified orientation to wire chain. returns index of added edge in wire chain.
	:param theDEdge:
	:type theDEdge: IMeshData::IEdgePtr
	:param theOrientation:
	:type theOrientation: TopAbs_Orientation
	:rtype: int") AddEdge;
		virtual Standard_Integer AddEdge (const IMeshData::IEdgePtr & theDEdge,const TopAbs_Orientation theOrientation);

		/****************** EdgesNb ******************/
		%feature("compactdefaultargs") EdgesNb;
		%feature("autodoc", "* Returns number of edges.
	:rtype: int") EdgesNb;
		virtual Standard_Integer EdgesNb ();

		/****************** GetEdge ******************/
		%feature("compactdefaultargs") GetEdge;
		%feature("autodoc", "* Returns discrete edge with the given index.
	:param theIndex:
	:type theIndex: int
	:rtype: IMeshData::IEdgePtr") GetEdge;
		virtual const IMeshData::IEdgePtr & GetEdge (const Standard_Integer theIndex);

		/****************** GetEdgeOrientation ******************/
		%feature("compactdefaultargs") GetEdgeOrientation;
		%feature("autodoc", "* Returns True if orientation of discrete edge with the given index is forward.
	:param theIndex:
	:type theIndex: int
	:rtype: TopAbs_Orientation") GetEdgeOrientation;
		virtual TopAbs_Orientation GetEdgeOrientation (const Standard_Integer theIndex);

		/****************** GetWire ******************/
		%feature("compactdefaultargs") GetWire;
		%feature("autodoc", "* Returns TopoDS_Face attached to model.
	:rtype: inline  TopoDS_Wire") GetWire;
		inline const TopoDS_Wire  GetWire ();

};


%make_alias(IMeshData_Wire)

%extend IMeshData_Wire {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
