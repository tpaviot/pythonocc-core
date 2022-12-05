/*
Copyright 2008-2022 Thomas Paviot (tpaviot@gmail.com)

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
https://www.opencascade.com/doc/occt-7.6.0/refman/html/package_imeshdata.html"
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
%include ../common/EnumTemplates.i
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
#include<Message_module.hxx>
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

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

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
	IMeshData_UserBreak = 256,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class IMeshData_Status(IntEnum):
	IMeshData_NoError = 0
	IMeshData_OpenWire = 1
	IMeshData_SelfIntersectingWire = 2
	IMeshData_Failure = 4
	IMeshData_ReMesh = 8
	IMeshData_UnorientedWire = 16
	IMeshData_TooFewPoints = 32
	IMeshData_Outdated = 64
	IMeshData_Reused = 128
	IMeshData_UserBreak = 256
IMeshData_NoError = IMeshData_Status.IMeshData_NoError
IMeshData_OpenWire = IMeshData_Status.IMeshData_OpenWire
IMeshData_SelfIntersectingWire = IMeshData_Status.IMeshData_SelfIntersectingWire
IMeshData_Failure = IMeshData_Status.IMeshData_Failure
IMeshData_ReMesh = IMeshData_Status.IMeshData_ReMesh
IMeshData_UnorientedWire = IMeshData_Status.IMeshData_UnorientedWire
IMeshData_TooFewPoints = IMeshData_Status.IMeshData_TooFewPoints
IMeshData_Outdated = IMeshData_Status.IMeshData_Outdated
IMeshData_Reused = IMeshData_Status.IMeshData_Reused
IMeshData_UserBreak = IMeshData_Status.IMeshData_UserBreak
};
/* end python proxy for enums */

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
typedef IMeshData::NCollection_Shared<NCollection_Array1<Standard_Integer>> IMeshData::Array1OfInteger;
typedef IMeshData::NCollection_Shared<NCollection_Array1<BRepMesh_Vertex>> IMeshData::Array1OfVertexOfDelaun;
typedef IMeshData::NCollection_Shared<NCollection_EBTree<Standard_Integer, Bnd_Box2d>> IMeshData::BndBox2dTree;
typedef IMeshData::NCollection_UBTreeFiller<Standard_Integer, Bnd_Box2d> IMeshData::BndBox2dTreeFiller;
typedef IMeshData::NCollection_CellFilter<BRepMesh_CircleInspector> IMeshData::CircleCellFilter;
typedef IMeshData::NCollection_Shared<NCollection_DataMap<IFacePtr, ListOfInteger, WeakEqual<IMeshData_Face>>> IMeshData::DMapOfIFacePtrsListOfInteger;
typedef NCollection_Shared<NCollection_DataMap<IFacePtr, opencascade::handle<MapOfIEdgePtr>, WeakEqual<IMeshData_Face>>> IMeshData::DMapOfIFacePtrsMapOfIEdgePtrs;
typedef IMeshData::NCollection_Shared<NCollection_DataMap<Standard_Integer, ListOfInteger>> IMeshData::DMapOfIntegerListOfInteger;
typedef IMeshData::NCollection_Shared<NCollection_DataMap<TopoDS_Shape, Standard_Integer, TopTools_ShapeMapHasher>> IMeshData::DMapOfShapeInteger;
typedef opencascade::handle<ICurveArrayAdaptor> IMeshData::ICurveArrayAdaptorHandle;
typedef opencascade::handle<IMeshData_Curve> IMeshData::ICurveHandle;
typedef IMeshData::NCollection_Shared<NCollection_IndexedDataMap<IFacePtr, ListOfIPCurves, WeakEqual<IMeshData_Face>>> IMeshData::IDMapOfIFacePtrsListOfIPCurves;
typedef IMeshData::NCollection_Shared<NCollection_IndexedDataMap<BRepMesh_Edge, BRepMesh_PairOfIndex>> IMeshData::IDMapOfLink;
typedef opencascade::handle<IMeshData_Edge> IMeshData::IEdgeHandle;
typedef IMeshData::IMeshData_Edge * IMeshData::IEdgePtr;
typedef opencascade::handle<IMeshData_Face> IMeshData::IFaceHandle;
typedef IMeshData::IMeshData_Face * IMeshData::IFacePtr;
typedef IMeshData::NCollection_Shared<NCollection_IndexedMap<Standard_Real>> IMeshData::IMapOfReal;
typedef opencascade::handle<IMeshData_PCurve> IMeshData::IPCurveHandle;
typedef opencascade::handle<IMeshData_Wire> IMeshData::IWireHandle;
typedef IMeshData::TColStd_MapIteratorOfPackedMapOfInteger IMeshData::IteratorOfMapOfInteger;
typedef IMeshData::NCollection_Shared<NCollection_List<IPCurveHandle>> IMeshData::ListOfIPCurves;
typedef IMeshData::NCollection_Shared<NCollection_List<Standard_Integer>> IMeshData::ListOfInteger;
typedef IMeshData::NCollection_Shared<NCollection_List<gp_Pnt2d>> IMeshData::ListOfPnt2d;
typedef IMeshData::NCollection_Shared<NCollection_Map<IEdgePtr, WeakEqual<IMeshData_Edge>>> IMeshData::MapOfIEdgePtr;
typedef IMeshData::NCollection_Shared<NCollection_Map<IFacePtr, WeakEqual<IMeshData_Face>>> IMeshData::MapOfIFacePtr;
typedef IMeshData::NCollection_Shared<TColStd_PackedMapOfInteger> IMeshData::MapOfInteger;
typedef IMeshData::NCollection_Shared<NCollection_DataMap<Standard_Integer, Standard_Integer>> IMeshData::MapOfIntegerInteger;
typedef IMeshData::NCollection_Shared<NCollection_Map<BRepMesh_OrientedEdge>> IMeshData::MapOfOrientedEdges;
typedef IMeshData::NCollection_Shared<NCollection_Map<Standard_Real>> IMeshData::MapOfReal;
typedef std::deque<Standard_Integer, NCollection_StdAllocator<Standard_Integer>> IMeshData::Model::SequenceOfInteger;
typedef std::deque<gp_Pnt, NCollection_StdAllocator<gp_Pnt>> IMeshData::Model::SequenceOfPnt;
typedef std::deque<gp_Pnt2d, NCollection_StdAllocator<gp_Pnt2d>> IMeshData::Model::SequenceOfPnt2d;
typedef std::deque<Standard_Real, NCollection_StdAllocator<Standard_Real>> IMeshData::Model::SequenceOfReal;
typedef IMeshData::NCollection_Shared<NCollection_Sequence<Bnd_B2d>> IMeshData::SequenceOfBndB2d;
typedef IMeshData::NCollection_Shared<NCollection_Sequence<Standard_Integer>> IMeshData::SequenceOfInteger;
typedef IMeshData::NCollection_Shared<NCollection_Sequence<Standard_Real>> IMeshData::SequenceOfReal;
typedef IMeshData::NCollection_Shared<NCollection_Vector<Standard_Boolean>> IMeshData::VectorOfBoolean;
typedef IMeshData::NCollection_Shared<NCollection_Vector<BRepMesh_Circle>> IMeshData::VectorOfCircle;
typedef IMeshData::NCollection_Shared<NCollection_Vector<BRepMesh_Triangle>> IMeshData::VectorOfElements;
typedef IMeshData::NCollection_Shared<NCollection_Vector<IEdgeHandle>> IMeshData::VectorOfIEdgeHandles;
typedef IMeshData::NCollection_Shared<NCollection_Vector<IEdgePtr>> IMeshData::VectorOfIEdgePtrs;
typedef IMeshData::NCollection_Shared<NCollection_Vector<IFaceHandle>> IMeshData::VectorOfIFaceHandles;
typedef IMeshData::NCollection_Shared<NCollection_Vector<IPCurveHandle>> IMeshData::VectorOfIPCurveHandles;
typedef IMeshData::NCollection_Shared<NCollection_Vector<IWireHandle>> IMeshData::VectorOfIWireHandles;
typedef IMeshData::NCollection_Shared<NCollection_Vector<Standard_Integer>> IMeshData::VectorOfInteger;
typedef IMeshData::NCollection_Shared<NCollection_Vector<TopAbs_Orientation>> IMeshData::VectorOfOrientation;
typedef IMeshData::NCollection_Shared<NCollection_Vector<BRepMesh_Vertex>> IMeshData::VectorOfVertex;
typedef IMeshData::NCollection_CellFilter<BRepMesh_VertexInspector> IMeshData::VertexCellFilter;
/* end typedefs declaration */

/*********************************
* class IMeshData_ParametersList *
*********************************/
%nodefaultctor IMeshData_ParametersList;
class IMeshData_ParametersList : public Standard_Transient {
	public:
		/****************** Clear ******************/
		/**** md5 signature: 76128b4cd59a4714b01eef74c8bbf698 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears parameters list.

Parameters
----------
isKeepEndPoints: bool

Returns
-------
None
") Clear;
		virtual void Clear(const Standard_Boolean isKeepEndPoints);

		/****************** GetParameter ******************/
		/**** md5 signature: f579351081cccfb74c499004bd169361 ****/
		%feature("compactdefaultargs") GetParameter;
		%feature("autodoc", "Returns parameter with the given index.

Parameters
----------
theIndex: int

Returns
-------
float
") GetParameter;
		virtual Standard_Real & GetParameter(const Standard_Integer theIndex);

		/****************** ParametersNb ******************/
		/**** md5 signature: d388d80c3832a8d74e3cf9e542735cc7 ****/
		%feature("compactdefaultargs") ParametersNb;
		%feature("autodoc", "Returns number of parameters.

Returns
-------
int
") ParametersNb;
		virtual Standard_Integer ParametersNb();

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
		/**** md5 signature: 7c167c51f2939d15d5bfddc807114b00 ****/
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "Returns shape assigned to discrete shape.

Returns
-------
TopoDS_Shape
") GetShape;
		const TopoDS_Shape GetShape();

		/****************** SetShape ******************/
		/**** md5 signature: 927e2ebe2fb5354dfb3da3c53e512cad ****/
		%feature("compactdefaultargs") SetShape;
		%feature("autodoc", "Assigns shape to discrete shape.

Parameters
----------
theShape: TopoDS_Shape

Returns
-------
None
") SetShape;
		void SetShape(const TopoDS_Shape & theShape);

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
		/**** md5 signature: 7d15643f2c76eca4b62d993d51557874 ****/
		%feature("compactdefaultargs") GetStatusMask;
		%feature("autodoc", "Returns complete status mask.

Returns
-------
int
") GetStatusMask;
		Standard_Integer GetStatusMask();

		/****************** IsEqual ******************/
		/**** md5 signature: 4fc9c78268da42576064f7448cf95e8d ****/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Returns true in case if status is strictly equal to the given value.

Parameters
----------
theValue: IMeshData_Status

Returns
-------
bool
") IsEqual;
		Standard_Boolean IsEqual(const IMeshData_Status theValue);

		/****************** IsSet ******************/
		/**** md5 signature: 6ff5daa51b58e262fe6095b9f0fa977d ****/
		%feature("compactdefaultargs") IsSet;
		%feature("autodoc", "Returns true in case if status is set.

Parameters
----------
theValue: IMeshData_Status

Returns
-------
bool
") IsSet;
		Standard_Boolean IsSet(const IMeshData_Status theValue);

		/****************** SetStatus ******************/
		/**** md5 signature: f4d4d2482716ca06203d8549ddfa7c63 ****/
		%feature("compactdefaultargs") SetStatus;
		%feature("autodoc", "Adds status to status flags of a face.

Parameters
----------
theValue: IMeshData_Status

Returns
-------
None
") SetStatus;
		void SetStatus(const IMeshData_Status theValue);

		/****************** UnsetStatus ******************/
		/**** md5 signature: de7b95c089f91b5ad9ddd18ae64896d5 ****/
		%feature("compactdefaultargs") UnsetStatus;
		%feature("autodoc", "Adds status to status flags of a face.

Parameters
----------
theValue: IMeshData_Status

Returns
-------
None
") UnsetStatus;
		void UnsetStatus(const IMeshData_Status theValue);

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
		/**** md5 signature: bca93cbb38e2d9870ae50fe6830c58e7 ****/
		%feature("compactdefaultargs") AddPoint;
		%feature("autodoc", "Adds new discretization point to curve.

Parameters
----------
thePoint: gp_Pnt
theParamOnCurve: float

Returns
-------
None
") AddPoint;
		virtual void AddPoint(const gp_Pnt & thePoint, const Standard_Real theParamOnCurve);

		/****************** GetPoint ******************/
		/**** md5 signature: adbbc6b98f8dcb27048b901e77b12158 ****/
		%feature("compactdefaultargs") GetPoint;
		%feature("autodoc", "Returns discretization point with the given index.

Parameters
----------
theIndex: int

Returns
-------
gp_Pnt
") GetPoint;
		virtual gp_Pnt GetPoint(const Standard_Integer theIndex);

		/****************** InsertPoint ******************/
		/**** md5 signature: 7fd0c400d992111e00c3b902fdba0651 ****/
		%feature("compactdefaultargs") InsertPoint;
		%feature("autodoc", "Inserts new discretization point at the given position.

Parameters
----------
thePosition: int
thePoint: gp_Pnt
theParamOnPCurve: float

Returns
-------
None
") InsertPoint;
		virtual void InsertPoint(const Standard_Integer thePosition, const gp_Pnt & thePoint, const Standard_Real theParamOnPCurve);

		/****************** RemovePoint ******************/
		/**** md5 signature: fa4c88674a800b9f28ef7acfeee95442 ****/
		%feature("compactdefaultargs") RemovePoint;
		%feature("autodoc", "Removes point with the given index.

Parameters
----------
theIndex: int

Returns
-------
None
") RemovePoint;
		virtual void RemovePoint(const Standard_Integer theIndex);

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
		/**** md5 signature: 01920c37eaec6db67cac2acfa67136aa ****/
		%feature("compactdefaultargs") AddEdge;
		%feature("autodoc", "Adds new edge to shape model.

Parameters
----------
theEdge: TopoDS_Edge

Returns
-------
IMeshData::IEdgeHandle
") AddEdge;
		virtual const IMeshData::IEdgeHandle & AddEdge(const TopoDS_Edge & theEdge);

		/****************** AddFace ******************/
		/**** md5 signature: c4be613059cf41461e95669f2be9d90b ****/
		%feature("compactdefaultargs") AddFace;
		%feature("autodoc", "Adds new face to shape model.

Parameters
----------
theFace: TopoDS_Face

Returns
-------
IMeshData::IFaceHandle
") AddFace;
		virtual const IMeshData::IFaceHandle & AddFace(const TopoDS_Face & theFace);

		/****************** EdgesNb ******************/
		/**** md5 signature: 1c7107132880548a5db1c7d1c8156b7c ****/
		%feature("compactdefaultargs") EdgesNb;
		%feature("autodoc", "Returns number of edges in discrete model.

Returns
-------
int
") EdgesNb;
		virtual Standard_Integer EdgesNb();

		/****************** FacesNb ******************/
		/**** md5 signature: 8ec98a20a6285215ff8eed6fd0526b0a ****/
		%feature("compactdefaultargs") FacesNb;
		%feature("autodoc", "Returns number of faces in discrete model.

Returns
-------
int
") FacesNb;
		virtual Standard_Integer FacesNb();

		/****************** GetEdge ******************/
		/**** md5 signature: 504f027b675b8f08bfacffe68cd96dba ****/
		%feature("compactdefaultargs") GetEdge;
		%feature("autodoc", "Gets model's edge with the given index.

Parameters
----------
theIndex: int

Returns
-------
IMeshData::IEdgeHandle
") GetEdge;
		virtual const IMeshData::IEdgeHandle & GetEdge(const Standard_Integer theIndex);

		/****************** GetFace ******************/
		/**** md5 signature: c1ca2883efa2f5e3b2ad682cf06e78d4 ****/
		%feature("compactdefaultargs") GetFace;
		%feature("autodoc", "Gets model's face with the given index.

Parameters
----------
theIndex: int

Returns
-------
IMeshData::IFaceHandle
") GetFace;
		virtual const IMeshData::IFaceHandle & GetFace(const Standard_Integer theIndex);

		/****************** GetMaxSize ******************/
		/**** md5 signature: f623abacdcde13ad797426c8e932ca2f ****/
		%feature("compactdefaultargs") GetMaxSize;
		%feature("autodoc", "Returns maximum size of shape model.

Returns
-------
float
") GetMaxSize;
		virtual Standard_Real GetMaxSize();

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
		/**** md5 signature: 5a4fad028b10d117cd56d8ae8b009e96 ****/
		%feature("compactdefaultargs") AddPoint;
		%feature("autodoc", "Adds new discretization point to pcurve.

Parameters
----------
thePoint: gp_Pnt2d
theParamOnPCurve: float

Returns
-------
None
") AddPoint;
		virtual void AddPoint(const gp_Pnt2d & thePoint, const Standard_Real theParamOnPCurve);

		/****************** GetFace ******************/
		/**** md5 signature: 4f1b350bd99a4402f45b2e057307925d ****/
		%feature("compactdefaultargs") GetFace;
		%feature("autodoc", "Returns discrete face pcurve is associated to.

Returns
-------
IMeshData::IFacePtr
") GetFace;
		const IMeshData::IFacePtr & GetFace();

		/****************** GetIndex ******************/
		/**** md5 signature: 1c3492fc7c15cc7fe04f24a5fd3fc6d0 ****/
		%feature("compactdefaultargs") GetIndex;
		%feature("autodoc", "Returns index in mesh corresponded to discretization point with the given index.

Parameters
----------
theIndex: int

Returns
-------
int
") GetIndex;
		virtual Standard_Integer & GetIndex(const Standard_Integer theIndex);

		/****************** GetOrientation ******************/
		/**** md5 signature: 4fe26a5f2998c36ea335a2490f9de399 ****/
		%feature("compactdefaultargs") GetOrientation;
		%feature("autodoc", "Returns orientation of the edge associated with current pcurve.

Returns
-------
TopAbs_Orientation
") GetOrientation;
		TopAbs_Orientation GetOrientation();

		/****************** GetPoint ******************/
		/**** md5 signature: 28bedae95464456c3766c3ef63bc5e3e ****/
		%feature("compactdefaultargs") GetPoint;
		%feature("autodoc", "Returns discretization point with the given index.

Parameters
----------
theIndex: int

Returns
-------
gp_Pnt2d
") GetPoint;
		virtual gp_Pnt2d GetPoint(const Standard_Integer theIndex);

		/****************** InsertPoint ******************/
		/**** md5 signature: 0eba2284b19d1c294ffbc17a1cd3cfb5 ****/
		%feature("compactdefaultargs") InsertPoint;
		%feature("autodoc", "Inserts new discretization point at the given position.

Parameters
----------
thePosition: int
thePoint: gp_Pnt2d
theParamOnPCurve: float

Returns
-------
None
") InsertPoint;
		virtual void InsertPoint(const Standard_Integer thePosition, const gp_Pnt2d & thePoint, const Standard_Real theParamOnPCurve);

		/****************** IsForward ******************/
		/**** md5 signature: 5d580a30a155081f38ff462134dd09e9 ****/
		%feature("compactdefaultargs") IsForward;
		%feature("autodoc", "Returns forward flag of this pcurve.

Returns
-------
bool
") IsForward;
		Standard_Boolean IsForward();

		/****************** IsInternal ******************/
		/**** md5 signature: 612ac76fb537acb721d879a2c910a7cb ****/
		%feature("compactdefaultargs") IsInternal;
		%feature("autodoc", "Returns internal flag of this pcurve.

Returns
-------
bool
") IsInternal;
		Standard_Boolean IsInternal();

		/****************** RemovePoint ******************/
		/**** md5 signature: fa4c88674a800b9f28ef7acfeee95442 ****/
		%feature("compactdefaultargs") RemovePoint;
		%feature("autodoc", "Removes point with the given index.

Parameters
----------
theIndex: int

Returns
-------
None
") RemovePoint;
		virtual void RemovePoint(const Standard_Integer theIndex);

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
		/**** md5 signature: e3b25dade98beae1e2c323b9948cdd89 ****/
		%feature("compactdefaultargs") GetDeflection;
		%feature("autodoc", "Gets deflection value for the discrete model.

Returns
-------
float
") GetDeflection;
		Standard_Real GetDeflection();

		/****************** SetDeflection ******************/
		/**** md5 signature: 03443ca3e2f27d9683e99c126a0738ef ****/
		%feature("compactdefaultargs") SetDeflection;
		%feature("autodoc", "Sets deflection value for the discrete model.

Parameters
----------
theValue: float

Returns
-------
None
") SetDeflection;
		void SetDeflection(const Standard_Real theValue);

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
		/**** md5 signature: 758b136331ab322e1c5c1f2790107535 ****/
		%feature("compactdefaultargs") AddPCurve;
		%feature("autodoc", "Adds discrete pcurve for the specified discrete face.

Parameters
----------
theDFace: IMeshData::IFacePtr
theOrientation: TopAbs_Orientation

Returns
-------
IMeshData::IPCurveHandle
") AddPCurve;
		virtual const IMeshData::IPCurveHandle & AddPCurve(const IMeshData::IFacePtr & theDFace, const TopAbs_Orientation theOrientation);

		/****************** Clear ******************/
		/**** md5 signature: ad9c9c46f2d5dcba0434153969fd3853 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears curve and all pcurves assigned to the edge from discretization.

Parameters
----------
isKeepEndPoints: bool

Returns
-------
None
") Clear;
		void Clear(const Standard_Boolean isKeepEndPoints);

		/****************** GetAngularDeflection ******************/
		/**** md5 signature: 1a86af905db96ad195d5d29bf17ca179 ****/
		%feature("compactdefaultargs") GetAngularDeflection;
		%feature("autodoc", "Gets value of angular deflection for the discrete model.

Returns
-------
float
") GetAngularDeflection;
		Standard_Real GetAngularDeflection();

		/****************** GetCurve ******************/
		/**** md5 signature: f29256664be39cb7e866ae349d49b366 ****/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "Returns 3d curve associated with current edge.

Returns
-------
IMeshData::ICurveHandle
") GetCurve;
		const IMeshData::ICurveHandle & GetCurve();

		/****************** GetDegenerated ******************/
		/**** md5 signature: 6af080d4196d23a38e41ee2a54e037a8 ****/
		%feature("compactdefaultargs") GetDegenerated;
		%feature("autodoc", "Returns degenerative flag. by default equals to flag stored in topological shape.

Returns
-------
bool
") GetDegenerated;
		Standard_Boolean GetDegenerated();

		/****************** GetEdge ******************/
		/**** md5 signature: 1804f9ef3f569f37fa54e4f95bb45a93 ****/
		%feature("compactdefaultargs") GetEdge;
		%feature("autodoc", "Returns topods_edge attached to model.

Returns
-------
TopoDS_Edge
") GetEdge;
		const TopoDS_Edge GetEdge();

		/****************** GetPCurve ******************/
		/**** md5 signature: d3ae021531e10d4484bf379d4d94c5d9 ****/
		%feature("compactdefaultargs") GetPCurve;
		%feature("autodoc", "Returns pcurve for the specified discrete face.

Parameters
----------
theDFace: IMeshData::IFacePtr
theOrientation: TopAbs_Orientation

Returns
-------
IMeshData::IPCurveHandle
") GetPCurve;
		virtual const IMeshData::IPCurveHandle & GetPCurve(const IMeshData::IFacePtr & theDFace, const TopAbs_Orientation theOrientation);

		/****************** GetPCurve ******************/
		/**** md5 signature: 6734b6ef219f8b326c14b5d29699b4aa ****/
		%feature("compactdefaultargs") GetPCurve;
		%feature("autodoc", "Returns pcurve with the given index.

Parameters
----------
theIndex: int

Returns
-------
IMeshData::IPCurveHandle
") GetPCurve;
		virtual const IMeshData::IPCurveHandle & GetPCurve(const Standard_Integer theIndex);

		/****************** GetSameParam ******************/
		/**** md5 signature: 2e33942b755b5337e15e6f47f768a210 ****/
		%feature("compactdefaultargs") GetSameParam;
		%feature("autodoc", "Returns same param flag. by default equals to flag stored in topological shape.

Returns
-------
bool
") GetSameParam;
		Standard_Boolean GetSameParam();

		/****************** GetSameRange ******************/
		/**** md5 signature: 694a542d9b91e51b6f957d126811c1f0 ****/
		%feature("compactdefaultargs") GetSameRange;
		%feature("autodoc", "Returns same range flag. by default equals to flag stored in topological shape.

Returns
-------
bool
") GetSameRange;
		Standard_Boolean GetSameRange();

		/****************** IsFree ******************/
		/**** md5 signature: 030d0329e4c2c099b2b42fcdc09ce7fd ****/
		%feature("compactdefaultargs") IsFree;
		%feature("autodoc", "Returns true in case if the edge is free one, i.e. it does not have pcurves.

Returns
-------
bool
") IsFree;
		Standard_Boolean IsFree();

		/****************** PCurvesNb ******************/
		/**** md5 signature: ce81633df5063398a274f8793a164022 ****/
		%feature("compactdefaultargs") PCurvesNb;
		%feature("autodoc", "Returns number of pcurves assigned to current edge.

Returns
-------
int
") PCurvesNb;
		virtual Standard_Integer PCurvesNb();

		/****************** SetAngularDeflection ******************/
		/**** md5 signature: 7ce4aa9545ae23ef875a6c78fbed8989 ****/
		%feature("compactdefaultargs") SetAngularDeflection;
		%feature("autodoc", "Sets value of angular deflection for the discrete model.

Parameters
----------
theValue: float

Returns
-------
None
") SetAngularDeflection;
		void SetAngularDeflection(const Standard_Real theValue);

		/****************** SetCurve ******************/
		/**** md5 signature: bbcd5010cd121d4e7af4b563560bf665 ****/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "Sets 3d curve associated with current edge.

Parameters
----------
theCurve: IMeshData::ICurveHandle

Returns
-------
None
") SetCurve;
		void SetCurve(const IMeshData::ICurveHandle & theCurve);

		/****************** SetDegenerated ******************/
		/**** md5 signature: 263b38c4d29a0296d1b3914e06fbd74e ****/
		%feature("compactdefaultargs") SetDegenerated;
		%feature("autodoc", "Updates degenerative flag.

Parameters
----------
theValue: bool

Returns
-------
None
") SetDegenerated;
		void SetDegenerated(const Standard_Boolean theValue);

		/****************** SetSameParam ******************/
		/**** md5 signature: a884f27f253c395064b5fc0614fe33f1 ****/
		%feature("compactdefaultargs") SetSameParam;
		%feature("autodoc", "Updates same param flag.

Parameters
----------
theValue: bool

Returns
-------
None
") SetSameParam;
		void SetSameParam(const Standard_Boolean theValue);

		/****************** SetSameRange ******************/
		/**** md5 signature: e130fbe492f87fb5da52f6bc509a1a70 ****/
		%feature("compactdefaultargs") SetSameRange;
		%feature("autodoc", "Updates same range flag.

Parameters
----------
theValue: bool

Returns
-------
None
") SetSameRange;
		void SetSameRange(const Standard_Boolean theValue);

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
		/**** md5 signature: 6f071d6bab9d9d5a4cbbe817eaf6a534 ****/
		%feature("compactdefaultargs") AddWire;
		%feature("autodoc", "Adds wire to discrete model of face.

Parameters
----------
theWire: TopoDS_Wire
theEdgeNb: int,optional
	default value is 0

Returns
-------
IMeshData::IWireHandle
") AddWire;
		virtual const IMeshData::IWireHandle & AddWire(const TopoDS_Wire & theWire, const Standard_Integer theEdgeNb = 0);

		/****************** GetFace ******************/
		/**** md5 signature: 24f906fe04f44088d93eb51a09d709c8 ****/
		%feature("compactdefaultargs") GetFace;
		%feature("autodoc", "Returns topods_face attached to model.

Returns
-------
TopoDS_Face
") GetFace;
		const TopoDS_Face GetFace();

		/****************** GetSurface ******************/
		/**** md5 signature: 6aa03522ab6b1d17fd10abc283bef0d7 ****/
		%feature("compactdefaultargs") GetSurface;
		%feature("autodoc", "Returns face's surface.

Returns
-------
opencascade::handle<BRepAdaptor_Surface>
") GetSurface;
		const opencascade::handle<BRepAdaptor_Surface> & GetSurface();

		/****************** GetWire ******************/
		/**** md5 signature: 8966cf070b277a5ac868ac689054052e ****/
		%feature("compactdefaultargs") GetWire;
		%feature("autodoc", "Returns discrete edge with the given index.

Parameters
----------
theIndex: int

Returns
-------
IMeshData::IWireHandle
") GetWire;
		virtual const IMeshData::IWireHandle & GetWire(const Standard_Integer theIndex);

		/****************** IsValid ******************/
		/**** md5 signature: 7d115ff85bb657b98ab8790006673845 ****/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Returns whether the face discrete model is valid.

Returns
-------
bool
") IsValid;
		Standard_Boolean IsValid();

		/****************** WiresNb ******************/
		/**** md5 signature: 57b6eaa69cf203a99203ef5ddd783f96 ****/
		%feature("compactdefaultargs") WiresNb;
		%feature("autodoc", "Returns number of wires.

Returns
-------
int
") WiresNb;
		virtual Standard_Integer WiresNb();

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
		/**** md5 signature: d0cf0874c8c2ddc8ce78af38016cb035 ****/
		%feature("compactdefaultargs") AddEdge;
		%feature("autodoc", "Adds new discrete edge with specified orientation to wire chain. returns index of added edge in wire chain.

Parameters
----------
theDEdge: IMeshData::IEdgePtr
theOrientation: TopAbs_Orientation

Returns
-------
int
") AddEdge;
		virtual Standard_Integer AddEdge(const IMeshData::IEdgePtr & theDEdge, const TopAbs_Orientation theOrientation);

		/****************** EdgesNb ******************/
		/**** md5 signature: 1c7107132880548a5db1c7d1c8156b7c ****/
		%feature("compactdefaultargs") EdgesNb;
		%feature("autodoc", "Returns number of edges.

Returns
-------
int
") EdgesNb;
		virtual Standard_Integer EdgesNb();

		/****************** GetEdge ******************/
		/**** md5 signature: a23f3d873347b83107f8122e91366db5 ****/
		%feature("compactdefaultargs") GetEdge;
		%feature("autodoc", "Returns discrete edge with the given index.

Parameters
----------
theIndex: int

Returns
-------
IMeshData::IEdgePtr
") GetEdge;
		virtual const IMeshData::IEdgePtr & GetEdge(const Standard_Integer theIndex);

		/****************** GetEdgeOrientation ******************/
		/**** md5 signature: e42a22c0c71e7ec5cb4c2cda6b8d2900 ****/
		%feature("compactdefaultargs") GetEdgeOrientation;
		%feature("autodoc", "Returns true if orientation of discrete edge with the given index is forward.

Parameters
----------
theIndex: int

Returns
-------
TopAbs_Orientation
") GetEdgeOrientation;
		virtual TopAbs_Orientation GetEdgeOrientation(const Standard_Integer theIndex);

		/****************** GetWire ******************/
		/**** md5 signature: 78b8c237eca7dfa575d850efd839e1c4 ****/
		%feature("compactdefaultargs") GetWire;
		%feature("autodoc", "Returns topods_face attached to model.

Returns
-------
TopoDS_Wire
") GetWire;
		const TopoDS_Wire GetWire();

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
/* class aliases */
%pythoncode {
}
