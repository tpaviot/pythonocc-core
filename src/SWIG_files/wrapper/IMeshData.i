/*
Copyright 2008-2026 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_imeshdata.html"
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
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


%{
#include<IMeshData_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TColStd_module.hxx>
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
%import TColStd.i
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
typedef IMeshData::NCollection_Shared<NCollection_Array1<int>> IMeshData::Array1OfInteger;
typedef IMeshData::NCollection_Shared<NCollection_Array1<BRepMesh_Vertex>> IMeshData::Array1OfVertexOfDelaun;
typedef IMeshData::NCollection_Shared<NCollection_EBTree<int, Bnd_Box2d>> IMeshData::BndBox2dTree;
typedef IMeshData::NCollection_UBTreeFiller<int, Bnd_Box2d> IMeshData::BndBox2dTreeFiller;
typedef IMeshData::NCollection_CellFilter<BRepMesh_CircleInspector> IMeshData::CircleCellFilter;
typedef IMeshData::NCollection_Shared<NCollection_DataMap<IFacePtr, ListOfInteger>> IMeshData::DMapOfIFacePtrsListOfInteger;
typedef NCollection_Shared<NCollection_DataMap<IFacePtr, opencascade::handle<MapOfIEdgePtr>>> IMeshData::DMapOfIFacePtrsMapOfIEdgePtrs;
typedef IMeshData::NCollection_Shared<NCollection_DataMap<int, ListOfInteger>> IMeshData::DMapOfIntegerListOfInteger;
typedef IMeshData::NCollection_Shared<NCollection_DataMap<TopoDS_Shape, int, TopTools_ShapeMapHasher>> IMeshData::DMapOfShapeInteger;
typedef opencascade::handle<ICurveArrayAdaptor> IMeshData::ICurveArrayAdaptorHandle;
typedef opencascade::handle<IMeshData_Curve> IMeshData::ICurveHandle;
typedef IMeshData::NCollection_Shared<NCollection_IndexedDataMap<IFacePtr, ListOfIPCurves>> IMeshData::IDMapOfIFacePtrsListOfIPCurves;
typedef IMeshData::NCollection_Shared<NCollection_IndexedDataMap<BRepMesh_Edge, BRepMesh_PairOfIndex>> IMeshData::IDMapOfLink;
typedef opencascade::handle<IMeshData_Edge> IMeshData::IEdgeHandle;
typedef opencascade::handle<IMeshData_Face> IMeshData::IFaceHandle;
typedef IMeshData::NCollection_Shared<NCollection_IndexedMap<double>> IMeshData::IMapOfReal;
typedef opencascade::handle<IMeshData_PCurve> IMeshData::IPCurveHandle;
typedef opencascade::handle<IMeshData_Wire> IMeshData::IWireHandle;
typedef TColStd_PackedMapOfInteger::Iterator IMeshData::IteratorOfMapOfInteger;
typedef IMeshData::NCollection_Shared<NCollection_List<IPCurveHandle>> IMeshData::ListOfIPCurves;
typedef IMeshData::NCollection_Shared<NCollection_List<int>> IMeshData::ListOfInteger;
typedef IMeshData::NCollection_Shared<NCollection_List<gp_Pnt2d>> IMeshData::ListOfPnt2d;
typedef IMeshData::NCollection_Shared<NCollection_Map<IEdgePtr>> IMeshData::MapOfIEdgePtr;
typedef IMeshData::NCollection_Shared<NCollection_Map<IFacePtr>> IMeshData::MapOfIFacePtr;
typedef IMeshData::NCollection_Shared<TColStd_PackedMapOfInteger> IMeshData::MapOfInteger;
typedef IMeshData::NCollection_Shared<NCollection_DataMap<int, bool>> IMeshData::MapOfIntegerInteger;
typedef IMeshData::NCollection_Shared<NCollection_Map<BRepMesh_OrientedEdge>> IMeshData::MapOfOrientedEdges;
typedef IMeshData::NCollection_Shared<NCollection_Map<double>> IMeshData::MapOfReal;
typedef std::deque<int, NCollection_OccAllocator<int>> IMeshData::Model::SequenceOfInteger;
typedef std::deque<gp_Pnt, NCollection_OccAllocator<gp_Pnt>> IMeshData::Model::SequenceOfPnt;
typedef std::deque<gp_Pnt2d, NCollection_OccAllocator<gp_Pnt2d>> IMeshData::Model::SequenceOfPnt2d;
typedef std::deque<double, NCollection_OccAllocator<double>> IMeshData::Model::SequenceOfReal;
typedef IMeshData::NCollection_Shared<NCollection_Sequence<Bnd_B2d>> IMeshData::SequenceOfBndB2d;
typedef IMeshData::NCollection_Shared<NCollection_Sequence<int>> IMeshData::SequenceOfInteger;
typedef IMeshData::NCollection_Shared<NCollection_Sequence<double>> IMeshData::SequenceOfReal;
typedef IMeshData::NCollection_Shared<NCollection_DynamicArray<bool>> IMeshData::VectorOfBoolean;
typedef IMeshData::NCollection_Shared<NCollection_DynamicArray<BRepMesh_Circle>> IMeshData::VectorOfCircle;
typedef IMeshData::NCollection_Shared<NCollection_DynamicArray<BRepMesh_Triangle>> IMeshData::VectorOfElements;
typedef IMeshData::NCollection_Shared<NCollection_DynamicArray<IEdgeHandle>> IMeshData::VectorOfIEdgeHandles;
typedef IMeshData::NCollection_Shared<NCollection_DynamicArray<IEdgePtr>> IMeshData::VectorOfIEdgePtrs;
typedef IMeshData::NCollection_Shared<NCollection_DynamicArray<IFaceHandle>> IMeshData::VectorOfIFaceHandles;
typedef IMeshData::NCollection_Shared<NCollection_DynamicArray<IPCurveHandle>> IMeshData::VectorOfIPCurveHandles;
typedef IMeshData::NCollection_Shared<NCollection_DynamicArray<IWireHandle>> IMeshData::VectorOfIWireHandles;
typedef IMeshData::NCollection_Shared<NCollection_DynamicArray<int>> IMeshData::VectorOfInteger;
typedef IMeshData::NCollection_Shared<NCollection_DynamicArray<TopAbs_Orientation>> IMeshData::VectorOfOrientation;
typedef IMeshData::NCollection_Shared<NCollection_DynamicArray<BRepMesh_Vertex>> IMeshData::VectorOfVertex;
typedef IMeshData::NCollection_CellFilter<BRepMesh_VertexInspector> IMeshData::VertexCellFilter;
/* end typedefs declaration */

/*********************************
* class IMeshData_ParametersList *
*********************************/
%nodefaultctor IMeshData_ParametersList;
class IMeshData_ParametersList : public Standard_Transient {
	public:
		/****** IMeshData_ParametersList::Clear ******/
		/****** md5 signature: c249c8544c1c0515d81aaa0e75408ec5 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "
Parameters
----------
isKeepEndPoints: bool

Return
-------
None

Description
-----------
Clears parameters list.
") Clear;
		virtual void Clear(const bool isKeepEndPoints);

		/****** IMeshData_ParametersList::GetParameter ******/
		/****** md5 signature: e9e1504692e0b19f5db72951cadf23ff ******/
		%feature("compactdefaultargs") GetParameter;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
double

Description
-----------
Returns parameter with the given index.
") GetParameter;
		virtual double & GetParameter(const int theIndex);

		/****** IMeshData_ParametersList::ParametersNb ******/
		/****** md5 signature: 14716c84c5d98aa75d8b8285ae89a2eb ******/
		%feature("compactdefaultargs") ParametersNb;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of parameters.
") ParametersNb;
		virtual int ParametersNb();

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
		/****** IMeshData_Shape::GetShape ******/
		/****** md5 signature: 7c167c51f2939d15d5bfddc807114b00 ******/
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns shape assigned to discrete shape.
") GetShape;
		const TopoDS_Shape GetShape();

		/****** IMeshData_Shape::SetShape ******/
		/****** md5 signature: 927e2ebe2fb5354dfb3da3c53e512cad ******/
		%feature("compactdefaultargs") SetShape;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
None

Description
-----------
Assigns shape to discrete shape.
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
		/****** IMeshData_StatusOwner::GetStatusMask ******/
		/****** md5 signature: 7060d9e2d5b0d4ef20dc43764bea8ae9 ******/
		%feature("compactdefaultargs") GetStatusMask;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns complete status mask.
") GetStatusMask;
		int GetStatusMask();

		/****** IMeshData_StatusOwner::IsEqual ******/
		/****** md5 signature: 29054a5b6aa4167d0c9b1a2c1309858b ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
theValue: IMeshData_Status

Return
-------
bool

Description
-----------
Returns true in case if status is strictly equal to the given value.
") IsEqual;
		bool IsEqual(const IMeshData_Status theValue);

		/****** IMeshData_StatusOwner::IsSet ******/
		/****** md5 signature: 2ae42a24dcf5d05af05c741a1da65bbd ******/
		%feature("compactdefaultargs") IsSet;
		%feature("autodoc", "
Parameters
----------
theValue: IMeshData_Status

Return
-------
bool

Description
-----------
Returns true in case if status is set.
") IsSet;
		bool IsSet(const IMeshData_Status theValue);

		/****** IMeshData_StatusOwner::SetStatus ******/
		/****** md5 signature: f4d4d2482716ca06203d8549ddfa7c63 ******/
		%feature("compactdefaultargs") SetStatus;
		%feature("autodoc", "
Parameters
----------
theValue: IMeshData_Status

Return
-------
None

Description
-----------
Adds status to status flags of a face.
") SetStatus;
		void SetStatus(const IMeshData_Status theValue);

		/****** IMeshData_StatusOwner::UnsetStatus ******/
		/****** md5 signature: de7b95c089f91b5ad9ddd18ae64896d5 ******/
		%feature("compactdefaultargs") UnsetStatus;
		%feature("autodoc", "
Parameters
----------
theValue: IMeshData_Status

Return
-------
None

Description
-----------
Adds status to status flags of a face.
") UnsetStatus;
		void UnsetStatus(const IMeshData_Status theValue);

};


%extend IMeshData_StatusOwner {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class IMeshData_Curve *
************************/
%nodefaultctor IMeshData_Curve;
class IMeshData_Curve : public IMeshData_ParametersList {
	public:
		/****** IMeshData_Curve::AddPoint ******/
		/****** md5 signature: 9691298fd12cd276153416d062402773 ******/
		%feature("compactdefaultargs") AddPoint;
		%feature("autodoc", "
Parameters
----------
thePoint: gp_Pnt
theParamOnCurve: double

Return
-------
None

Description
-----------
Adds new discretization point to curve.
") AddPoint;
		virtual void AddPoint(const gp_Pnt & thePoint, const double theParamOnCurve);

		/****** IMeshData_Curve::GetPoint ******/
		/****** md5 signature: 35c266dd6ab157b0960b213afc50421c ******/
		%feature("compactdefaultargs") GetPoint;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
gp_Pnt

Description
-----------
Returns discretization point with the given index.
") GetPoint;
		virtual gp_Pnt GetPoint(const int theIndex);

		/****** IMeshData_Curve::InsertPoint ******/
		/****** md5 signature: a2fbb39c79604d17f5f476edb8361559 ******/
		%feature("compactdefaultargs") InsertPoint;
		%feature("autodoc", "
Parameters
----------
thePosition: int
thePoint: gp_Pnt
theParamOnPCurve: double

Return
-------
None

Description
-----------
Inserts new discretization point at the given position.
") InsertPoint;
		virtual void InsertPoint(const int thePosition, const gp_Pnt & thePoint, const double theParamOnPCurve);

		/****** IMeshData_Curve::RemovePoint ******/
		/****** md5 signature: f8036e45d7f00c19d9238a6a3e59e914 ******/
		%feature("compactdefaultargs") RemovePoint;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
None

Description
-----------
Removes point with the given index.
") RemovePoint;
		virtual void RemovePoint(const int theIndex);

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
		/****** IMeshData_Model::AddEdge ******/
		/****** md5 signature: 01920c37eaec6db67cac2acfa67136aa ******/
		%feature("compactdefaultargs") AddEdge;
		%feature("autodoc", "
Parameters
----------
theEdge: TopoDS_Edge

Return
-------
IMeshData::IEdgeHandle

Description
-----------
Adds new edge to shape model.
") AddEdge;
		virtual const IMeshData::IEdgeHandle & AddEdge(const TopoDS_Edge & theEdge);

		/****** IMeshData_Model::AddFace ******/
		/****** md5 signature: c4be613059cf41461e95669f2be9d90b ******/
		%feature("compactdefaultargs") AddFace;
		%feature("autodoc", "
Parameters
----------
theFace: TopoDS_Face

Return
-------
IMeshData::IFaceHandle

Description
-----------
Adds new face to shape model.
") AddFace;
		virtual const IMeshData::IFaceHandle & AddFace(const TopoDS_Face & theFace);

		/****** IMeshData_Model::EdgesNb ******/
		/****** md5 signature: 307ee765c4b2fd8db73dc655656a36be ******/
		%feature("compactdefaultargs") EdgesNb;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of edges in discrete model.
") EdgesNb;
		virtual int EdgesNb();

		/****** IMeshData_Model::FacesNb ******/
		/****** md5 signature: 292d7d4ba58062ded9181bd4f12c280c ******/
		%feature("compactdefaultargs") FacesNb;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of faces in discrete model.
") FacesNb;
		virtual int FacesNb();

		/****** IMeshData_Model::GetEdge ******/
		/****** md5 signature: bfd0027c41a630fd5552fd0b901dc201 ******/
		%feature("compactdefaultargs") GetEdge;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
IMeshData::IEdgeHandle

Description
-----------
Gets model's edge with the given index.
") GetEdge;
		virtual const IMeshData::IEdgeHandle & GetEdge(const int theIndex);

		/****** IMeshData_Model::GetFace ******/
		/****** md5 signature: 5b865bc207c6f83963bc1c569a253130 ******/
		%feature("compactdefaultargs") GetFace;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
IMeshData::IFaceHandle

Description
-----------
Gets model's face with the given index.
") GetFace;
		virtual const IMeshData::IFaceHandle & GetFace(const int theIndex);

		/****** IMeshData_Model::GetMaxSize ******/
		/****** md5 signature: 1bab4848c7ec7bd6d935f34056c88668 ******/
		%feature("compactdefaultargs") GetMaxSize;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns maximum size of shape model.
") GetMaxSize;
		virtual double GetMaxSize();

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
		/****** IMeshData_PCurve::AddPoint ******/
		/****** md5 signature: a9716509272bed1e4ead7bae3ff8a998 ******/
		%feature("compactdefaultargs") AddPoint;
		%feature("autodoc", "
Parameters
----------
thePoint: gp_Pnt2d
theParamOnPCurve: double

Return
-------
None

Description
-----------
Adds new discretization point to pcurve.
") AddPoint;
		virtual void AddPoint(const gp_Pnt2d & thePoint, const double theParamOnPCurve);

		/****** IMeshData_PCurve::GetFace ******/
		/****** md5 signature: 4f1b350bd99a4402f45b2e057307925d ******/
		%feature("compactdefaultargs") GetFace;
		%feature("autodoc", "Return
-------
IMeshData::IFacePtr

Description
-----------
Returns discrete face pcurve is associated to.
") GetFace;
		const IMeshData::IFacePtr & GetFace();

		/****** IMeshData_PCurve::GetIndex ******/
		/****** md5 signature: ae3865fa5701a72518699f46cb623f54 ******/
		%feature("compactdefaultargs") GetIndex;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
int

Description
-----------
Returns index in mesh corresponded to discretization point with the given index.
") GetIndex;
		virtual int & GetIndex(const int theIndex);

		/****** IMeshData_PCurve::GetOrientation ******/
		/****** md5 signature: 4fe26a5f2998c36ea335a2490f9de399 ******/
		%feature("compactdefaultargs") GetOrientation;
		%feature("autodoc", "Return
-------
TopAbs_Orientation

Description
-----------
Returns orientation of the edge associated with current pcurve.
") GetOrientation;
		TopAbs_Orientation GetOrientation();

		/****** IMeshData_PCurve::GetPoint ******/
		/****** md5 signature: 1418a8059e38a7a854a7871f65cf5782 ******/
		%feature("compactdefaultargs") GetPoint;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
gp_Pnt2d

Description
-----------
Returns discretization point with the given index.
") GetPoint;
		virtual gp_Pnt2d GetPoint(const int theIndex);

		/****** IMeshData_PCurve::InsertPoint ******/
		/****** md5 signature: 71e6ac46cf0ec64a92aefe5bac742441 ******/
		%feature("compactdefaultargs") InsertPoint;
		%feature("autodoc", "
Parameters
----------
thePosition: int
thePoint: gp_Pnt2d
theParamOnPCurve: double

Return
-------
None

Description
-----------
Inserts new discretization point at the given position.
") InsertPoint;
		virtual void InsertPoint(const int thePosition, const gp_Pnt2d & thePoint, const double theParamOnPCurve);

		/****** IMeshData_PCurve::IsForward ******/
		/****** md5 signature: e3a8d9e03089d5cc5eda2ed0e62649cf ******/
		%feature("compactdefaultargs") IsForward;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns forward flag of this pcurve.
") IsForward;
		bool IsForward();

		/****** IMeshData_PCurve::IsInternal ******/
		/****** md5 signature: 9d053478d40b00ca2abdfc63abdd2464 ******/
		%feature("compactdefaultargs") IsInternal;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns internal flag of this pcurve.
") IsInternal;
		bool IsInternal();

		/****** IMeshData_PCurve::RemovePoint ******/
		/****** md5 signature: f8036e45d7f00c19d9238a6a3e59e914 ******/
		%feature("compactdefaultargs") RemovePoint;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
None

Description
-----------
Removes point with the given index.
") RemovePoint;
		virtual void RemovePoint(const int theIndex);

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
		/****** IMeshData_TessellatedShape::GetDeflection ******/
		/****** md5 signature: 2eb00dd90ba56f3ec0921befddd8f686 ******/
		%feature("compactdefaultargs") GetDeflection;
		%feature("autodoc", "Return
-------
double

Description
-----------
Gets deflection value for the discrete model.
") GetDeflection;
		double GetDeflection();

		/****** IMeshData_TessellatedShape::SetDeflection ******/
		/****** md5 signature: 2a60ca718cccafecdab9b45738de0afb ******/
		%feature("compactdefaultargs") SetDeflection;
		%feature("autodoc", "
Parameters
----------
theValue: double

Return
-------
None

Description
-----------
Sets deflection value for the discrete model.
") SetDeflection;
		void SetDeflection(const double theValue);

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
		/****** IMeshData_Edge::AddPCurve ******/
		/****** md5 signature: 758b136331ab322e1c5c1f2790107535 ******/
		%feature("compactdefaultargs") AddPCurve;
		%feature("autodoc", "
Parameters
----------
theDFace: IMeshData::IFacePtr
theOrientation: TopAbs_Orientation

Return
-------
IMeshData::IPCurveHandle

Description
-----------
Adds discrete pcurve for the specified discrete face.
") AddPCurve;
		virtual IMeshData::IPCurveHandle AddPCurve(const IMeshData::IFacePtr & theDFace, const TopAbs_Orientation theOrientation);

		/****** IMeshData_Edge::Clear ******/
		/****** md5 signature: d62e3ca20a71baad2ffa1cd1367091b1 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "
Parameters
----------
isKeepEndPoints: bool

Return
-------
None

Description
-----------
Clears curve and all pcurves assigned to the edge from discretization.
") Clear;
		void Clear(const bool isKeepEndPoints);

		/****** IMeshData_Edge::GetAngularDeflection ******/
		/****** md5 signature: 54e177c38682bc20a04a467001027091 ******/
		%feature("compactdefaultargs") GetAngularDeflection;
		%feature("autodoc", "Return
-------
double

Description
-----------
Gets value of angular deflection for the discrete model.
") GetAngularDeflection;
		double GetAngularDeflection();

		/****** IMeshData_Edge::GetCurve ******/
		/****** md5 signature: f29256664be39cb7e866ae349d49b366 ******/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "Return
-------
IMeshData::ICurveHandle

Description
-----------
Returns 3d curve associated with current edge.
") GetCurve;
		IMeshData::ICurveHandle GetCurve();

		/****** IMeshData_Edge::GetDegenerated ******/
		/****** md5 signature: 561651b6a5ed63461a4075f571e73182 ******/
		%feature("compactdefaultargs") GetDegenerated;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns degenerative flag. By default equals to flag stored in topological shape.
") GetDegenerated;
		bool GetDegenerated();

		/****** IMeshData_Edge::GetEdge ******/
		/****** md5 signature: 1804f9ef3f569f37fa54e4f95bb45a93 ******/
		%feature("compactdefaultargs") GetEdge;
		%feature("autodoc", "Return
-------
TopoDS_Edge

Description
-----------
Returns TopoDS_Edge attached to model.
") GetEdge;
		const TopoDS_Edge GetEdge();

		/****** IMeshData_Edge::GetPCurve ******/
		/****** md5 signature: d3ae021531e10d4484bf379d4d94c5d9 ******/
		%feature("compactdefaultargs") GetPCurve;
		%feature("autodoc", "
Parameters
----------
theDFace: IMeshData::IFacePtr
theOrientation: TopAbs_Orientation

Return
-------
IMeshData::IPCurveHandle

Description
-----------
Returns pcurve for the specified discrete face.
") GetPCurve;
		virtual IMeshData::IPCurveHandle GetPCurve(const IMeshData::IFacePtr & theDFace, const TopAbs_Orientation theOrientation);

		/****** IMeshData_Edge::GetPCurve ******/
		/****** md5 signature: 4e3c3eb4414d90c6d7f4b5bd957b43e5 ******/
		%feature("compactdefaultargs") GetPCurve;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
IMeshData::IPCurveHandle

Description
-----------
Returns pcurve with the given index.
") GetPCurve;
		virtual IMeshData::IPCurveHandle GetPCurve(const int theIndex);

		/****** IMeshData_Edge::GetPCurves ******/
		/****** md5 signature: 13f44a6377148db15f21a05eb7df9ecd ******/
		%feature("compactdefaultargs") GetPCurves;
		%feature("autodoc", "
Parameters
----------
theDFace: IMeshData::IFacePtr

Return
-------
IMeshData::ListOfInteger

Description
-----------
Returns an array of pcurves indices for the specified discrete face.
") GetPCurves;
		virtual const IMeshData::ListOfInteger & GetPCurves(const IMeshData::IFacePtr & theDFace);

		/****** IMeshData_Edge::GetSameParam ******/
		/****** md5 signature: d840ee618c94bb24f50bbbec51a63a8c ******/
		%feature("compactdefaultargs") GetSameParam;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns same param flag. By default equals to flag stored in topological shape.
") GetSameParam;
		bool GetSameParam();

		/****** IMeshData_Edge::GetSameRange ******/
		/****** md5 signature: e52fc586190c2773ae6f291ceac46ca3 ******/
		%feature("compactdefaultargs") GetSameRange;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns same range flag. By default equals to flag stored in topological shape.
") GetSameRange;
		bool GetSameRange();

		/****** IMeshData_Edge::IsFree ******/
		/****** md5 signature: ebf47a08122843bba49573265bce81c4 ******/
		%feature("compactdefaultargs") IsFree;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true in case if the edge is free one, i.e. it does not have pcurves.
") IsFree;
		bool IsFree();

		/****** IMeshData_Edge::PCurvesNb ******/
		/****** md5 signature: 49b304b9ed3857277b32077340429ab8 ******/
		%feature("compactdefaultargs") PCurvesNb;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of pcurves assigned to current edge.
") PCurvesNb;
		virtual int PCurvesNb();

		/****** IMeshData_Edge::SetAngularDeflection ******/
		/****** md5 signature: 281e225922b220cf11d1c1ac384e66f2 ******/
		%feature("compactdefaultargs") SetAngularDeflection;
		%feature("autodoc", "
Parameters
----------
theValue: double

Return
-------
None

Description
-----------
Sets value of angular deflection for the discrete model.
") SetAngularDeflection;
		void SetAngularDeflection(const double theValue);

		/****** IMeshData_Edge::SetCurve ******/
		/****** md5 signature: bbcd5010cd121d4e7af4b563560bf665 ******/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "
Parameters
----------
theCurve: IMeshData::ICurveHandle

Return
-------
None

Description
-----------
Sets 3d curve associated with current edge.
") SetCurve;
		void SetCurve(const IMeshData::ICurveHandle & theCurve);

		/****** IMeshData_Edge::SetDegenerated ******/
		/****** md5 signature: e43b0a87a70154542adf2e110c2fa411 ******/
		%feature("compactdefaultargs") SetDegenerated;
		%feature("autodoc", "
Parameters
----------
theValue: bool

Return
-------
None

Description
-----------
Updates degenerative flag.
") SetDegenerated;
		void SetDegenerated(const bool theValue);

		/****** IMeshData_Edge::SetSameParam ******/
		/****** md5 signature: 7fef517cc1178bb0c470042971f0bb35 ******/
		%feature("compactdefaultargs") SetSameParam;
		%feature("autodoc", "
Parameters
----------
theValue: bool

Return
-------
None

Description
-----------
Updates same param flag.
") SetSameParam;
		void SetSameParam(const bool theValue);

		/****** IMeshData_Edge::SetSameRange ******/
		/****** md5 signature: 248e8602298ffef4ae93f272590efd80 ******/
		%feature("compactdefaultargs") SetSameRange;
		%feature("autodoc", "
Parameters
----------
theValue: bool

Return
-------
None

Description
-----------
Updates same range flag.
") SetSameRange;
		void SetSameRange(const bool theValue);

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
		/****** IMeshData_Face::AddWire ******/
		/****** md5 signature: 8d67b4812493dac234aa05e20b14ed17 ******/
		%feature("compactdefaultargs") AddWire;
		%feature("autodoc", "
Parameters
----------
theWire: TopoDS_Wire
theEdgeNb: int (optional, default to 0)

Return
-------
IMeshData::IWireHandle

Description
-----------
Adds wire to discrete model of face.
") AddWire;
		virtual const IMeshData::IWireHandle & AddWire(const TopoDS_Wire & theWire, const int theEdgeNb = 0);

		/****** IMeshData_Face::GetFace ******/
		/****** md5 signature: 24f906fe04f44088d93eb51a09d709c8 ******/
		%feature("compactdefaultargs") GetFace;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
Returns TopoDS_Face attached to model.
") GetFace;
		const TopoDS_Face GetFace();

		/****** IMeshData_Face::GetSurface ******/
		/****** md5 signature: 6aa03522ab6b1d17fd10abc283bef0d7 ******/
		%feature("compactdefaultargs") GetSurface;
		%feature("autodoc", "Return
-------
opencascade::handle<BRepAdaptor_Surface>

Description
-----------
Returns face's surface.
") GetSurface;
		const opencascade::handle<BRepAdaptor_Surface> & GetSurface();

		/****** IMeshData_Face::GetWire ******/
		/****** md5 signature: 7f9c6e2cd391e07ce3b9c777e707c8b1 ******/
		%feature("compactdefaultargs") GetWire;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
IMeshData::IWireHandle

Description
-----------
Returns discrete edge with the given index.
") GetWire;
		virtual const IMeshData::IWireHandle & GetWire(const int theIndex);

		/****** IMeshData_Face::IsValid ******/
		/****** md5 signature: 735088818cf24ebe0ebc7005a507da69 ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns whether the face discrete model is valid.
") IsValid;
		bool IsValid();

		/****** IMeshData_Face::WiresNb ******/
		/****** md5 signature: ee1be5fecaedd0a04dcc1ca76bcfe0b9 ******/
		%feature("compactdefaultargs") WiresNb;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of wires.
") WiresNb;
		virtual int WiresNb();

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
		/****** IMeshData_Wire::AddEdge ******/
		/****** md5 signature: 68877f7eb573dcc258b5d76905e7a0e9 ******/
		%feature("compactdefaultargs") AddEdge;
		%feature("autodoc", "
Parameters
----------
theDEdge: IMeshData::IEdgePtr
theOrientation: TopAbs_Orientation

Return
-------
int

Description
-----------
Adds new discrete edge with specified orientation to wire chain. 
Return: index of added edge in wire chain.
") AddEdge;
		virtual int AddEdge(const IMeshData::IEdgePtr & theDEdge, const TopAbs_Orientation theOrientation);

		/****** IMeshData_Wire::EdgesNb ******/
		/****** md5 signature: 307ee765c4b2fd8db73dc655656a36be ******/
		%feature("compactdefaultargs") EdgesNb;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of edges.
") EdgesNb;
		virtual int EdgesNb();

		/****** IMeshData_Wire::GetEdge ******/
		/****** md5 signature: ff1af0e17629e9acd95279f9d492ff77 ******/
		%feature("compactdefaultargs") GetEdge;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
IMeshData::IEdgePtr

Description
-----------
Returns discrete edge with the given index.
") GetEdge;
		virtual const IMeshData::IEdgePtr & GetEdge(const int theIndex);

		/****** IMeshData_Wire::GetEdgeOrientation ******/
		/****** md5 signature: b8e2b2d1522a326e53c48f1d9aa6f05b ******/
		%feature("compactdefaultargs") GetEdgeOrientation;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
TopAbs_Orientation

Description
-----------
Returns True if orientation of discrete edge with the given index is forward.
") GetEdgeOrientation;
		virtual TopAbs_Orientation GetEdgeOrientation(const int theIndex);

		/****** IMeshData_Wire::GetWire ******/
		/****** md5 signature: 78b8c237eca7dfa575d850efd839e1c4 ******/
		%feature("compactdefaultargs") GetWire;
		%feature("autodoc", "Return
-------
TopoDS_Wire

Description
-----------
Returns TopoDS_Face attached to model.
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
