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
%define BREPTOIGESDOCSTRING
"BRepToIGES module, see official documentation at
https://www.opencascade.com/doc/occt-7.6.0/refman/html/package_breptoiges.html"
%enddef
%module (package="OCC.Core", docstring=BREPTOIGESDOCSTRING) BRepToIGES


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
#include<BRepToIGES_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TopoDS_module.hxx>
#include<IGESData_module.hxx>
#include<Transfer_module.hxx>
#include<Message_module.hxx>
#include<TopTools_module.hxx>
#include<Geom_module.hxx>
#include<TopLoc_module.hxx>
#include<gp_module.hxx>
#include<MoniTool_module.hxx>
#include<Message_module.hxx>
#include<Interface_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TopoDS.i
%import IGESData.i
%import Transfer.i
%import Message.i
%import TopTools.i
%import Geom.i
%import TopLoc.i
%import gp.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/****************************
* class BRepToIGES_BREntity *
****************************/
class BRepToIGES_BREntity {
	public:
		/****************** BRepToIGES_BREntity ******************/
		/**** md5 signature: b9be04743bd01659a32f96151539f869 ****/
		%feature("compactdefaultargs") BRepToIGES_BREntity;
		%feature("autodoc", "Creates a tool brentity.

Returns
-------
None
") BRepToIGES_BREntity;
		 BRepToIGES_BREntity();

		/****************** AddFail ******************/
		/**** md5 signature: 86b61c44c0912cac3071f72a3c39b02a ****/
		%feature("compactdefaultargs") AddFail;
		%feature("autodoc", "Records a new fail message.

Parameters
----------
start: TopoDS_Shape
amess: str

Returns
-------
None
") AddFail;
		void AddFail(const TopoDS_Shape & start, Standard_CString amess);

		/****************** AddFail ******************/
		/**** md5 signature: 6b49fbe0416a25d1fe0afed481d698a1 ****/
		%feature("compactdefaultargs") AddFail;
		%feature("autodoc", "Records a new fail message.

Parameters
----------
start: Standard_Transient
amess: str

Returns
-------
None
") AddFail;
		void AddFail(const opencascade::handle<Standard_Transient> & start, Standard_CString amess);

		/****************** AddWarning ******************/
		/**** md5 signature: 2b5942e4a0cb6381d01c3e73b2473aa1 ****/
		%feature("compactdefaultargs") AddWarning;
		%feature("autodoc", "Records a new warning message.

Parameters
----------
start: TopoDS_Shape
amess: str

Returns
-------
None
") AddWarning;
		void AddWarning(const TopoDS_Shape & start, Standard_CString amess);

		/****************** AddWarning ******************/
		/**** md5 signature: 6ae32aeea2b295e81b647209ae55cb77 ****/
		%feature("compactdefaultargs") AddWarning;
		%feature("autodoc", "Records a new warning message.

Parameters
----------
start: Standard_Transient
amess: str

Returns
-------
None
") AddWarning;
		void AddWarning(const opencascade::handle<Standard_Transient> & start, Standard_CString amess);

		/****************** GetConvertSurfaceMode ******************/
		/**** md5 signature: 605a700b41bd17a54646fc044117a4d9 ****/
		%feature("compactdefaultargs") GetConvertSurfaceMode;
		%feature("autodoc", "Returns mode for conversion of surfaces (value of parameter write.convertsurface.mode).

Returns
-------
bool
") GetConvertSurfaceMode;
		Standard_Boolean GetConvertSurfaceMode();

		/****************** GetModel ******************/
		/**** md5 signature: 903699a7f01ab7b92813659a6c19f871 ****/
		%feature("compactdefaultargs") GetModel;
		%feature("autodoc", "Returns the value of 'themodel'.

Returns
-------
opencascade::handle<IGESData_IGESModel>
") GetModel;
		opencascade::handle<IGESData_IGESModel> GetModel();

		/****************** GetPCurveMode ******************/
		/**** md5 signature: 7ac82e714115e762f01162fc38213001 ****/
		%feature("compactdefaultargs") GetPCurveMode;
		%feature("autodoc", "Returns mode for writing pcurves (value of parameter write.surfacecurve.mode).

Returns
-------
bool
") GetPCurveMode;
		Standard_Boolean GetPCurveMode();

		/****************** GetShapeResult ******************/
		/**** md5 signature: 4900d0e087af4d296714061255247760 ****/
		%feature("compactdefaultargs") GetShapeResult;
		%feature("autodoc", "Returns the result of the transfer of the shape 'start' contained in 'themap' . (if hasshaperesult is true).

Parameters
----------
start: TopoDS_Shape

Returns
-------
opencascade::handle<Standard_Transient>
") GetShapeResult;
		opencascade::handle<Standard_Transient> GetShapeResult(const TopoDS_Shape & start);

		/****************** GetShapeResult ******************/
		/**** md5 signature: 8d83d7c0cbf2c118b35b8efc3124441e ****/
		%feature("compactdefaultargs") GetShapeResult;
		%feature("autodoc", "Returns the result of the transfer of the transient 'start' contained in 'themap' . (if hasshaperesult is true).

Parameters
----------
start: Standard_Transient

Returns
-------
opencascade::handle<Standard_Transient>
") GetShapeResult;
		opencascade::handle<Standard_Transient> GetShapeResult(const opencascade::handle<Standard_Transient> & start);

		/****************** GetTransferProcess ******************/
		/**** md5 signature: 4f3dbe27608746adc64d22aab2f5d0ba ****/
		%feature("compactdefaultargs") GetTransferProcess;
		%feature("autodoc", "Returns the value of 'themap'.

Returns
-------
opencascade::handle<Transfer_FinderProcess>
") GetTransferProcess;
		opencascade::handle<Transfer_FinderProcess> GetTransferProcess();

		/****************** GetUnit ******************/
		/**** md5 signature: 039a57c9f6b7a42814266e23014d7f99 ****/
		%feature("compactdefaultargs") GetUnit;
		%feature("autodoc", "Returns the value of the unitflag of the header of the model in meters.

Returns
-------
float
") GetUnit;
		Standard_Real GetUnit();

		/****************** HasShapeResult ******************/
		/**** md5 signature: f73ef740c093a540387ac8046c3698c1 ****/
		%feature("compactdefaultargs") HasShapeResult;
		%feature("autodoc", "Returns true if start was already treated and has a result in 'themap' else returns false.

Parameters
----------
start: TopoDS_Shape

Returns
-------
bool
") HasShapeResult;
		Standard_Boolean HasShapeResult(const TopoDS_Shape & start);

		/****************** HasShapeResult ******************/
		/**** md5 signature: ad604d32586116b554b21559f60e7c8a ****/
		%feature("compactdefaultargs") HasShapeResult;
		%feature("autodoc", "Returns true if start was already treated and has a result in 'themap' else returns false.

Parameters
----------
start: Standard_Transient

Returns
-------
bool
") HasShapeResult;
		Standard_Boolean HasShapeResult(const opencascade::handle<Standard_Transient> & start);

		/****************** Init ******************/
		/**** md5 signature: 0de93ef32c53d091768788dca0e281fd ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes the field of the tool brentity with default creating values.

Returns
-------
None
") Init;
		void Init();

		/****************** SetModel ******************/
		/**** md5 signature: 57ee68a1eb65ee7bf7cf629e19bb0af7 ****/
		%feature("compactdefaultargs") SetModel;
		%feature("autodoc", "Set the value of 'themodel'.

Parameters
----------
model: IGESData_IGESModel

Returns
-------
None
") SetModel;
		void SetModel(const opencascade::handle<IGESData_IGESModel> & model);

		/****************** SetShapeResult ******************/
		/**** md5 signature: 3296abc0706cc6cb1a892c01f98d1a0c ****/
		%feature("compactdefaultargs") SetShapeResult;
		%feature("autodoc", "Set in 'themap' the result of the transfer of the shape 'start'.

Parameters
----------
start: TopoDS_Shape
result: Standard_Transient

Returns
-------
None
") SetShapeResult;
		void SetShapeResult(const TopoDS_Shape & start, const opencascade::handle<Standard_Transient> & result);

		/****************** SetShapeResult ******************/
		/**** md5 signature: 0293cc0b8e1a49a2f6eb817e6575fcbf ****/
		%feature("compactdefaultargs") SetShapeResult;
		%feature("autodoc", "Set in 'themap' the result of the transfer of the transient 'start'.

Parameters
----------
start: Standard_Transient
result: Standard_Transient

Returns
-------
None
") SetShapeResult;
		void SetShapeResult(const opencascade::handle<Standard_Transient> & start, const opencascade::handle<Standard_Transient> & result);

		/****************** SetTransferProcess ******************/
		/**** md5 signature: d3990f617130a892c65b9425da836174 ****/
		%feature("compactdefaultargs") SetTransferProcess;
		%feature("autodoc", "Set the value of 'themap'.

Parameters
----------
TP: Transfer_FinderProcess

Returns
-------
None
") SetTransferProcess;
		void SetTransferProcess(const opencascade::handle<Transfer_FinderProcess> & TP);

		/****************** TransferShape ******************/
		/**** md5 signature: f412a53f3c7c3f9815252debbffd6b1f ****/
		%feature("compactdefaultargs") TransferShape;
		%feature("autodoc", "Returns the result of the transfert of any shape if the transfer has failed, this member return a nullentity.

Parameters
----------
start: TopoDS_Shape
theProgress: Message_ProgressRange,optional
	default value is Message_ProgressRange()

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") TransferShape;
		virtual opencascade::handle<IGESData_IGESEntity> TransferShape(const TopoDS_Shape & start, const Message_ProgressRange & theProgress = Message_ProgressRange());

};


%extend BRepToIGES_BREntity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class BRepToIGES_BRShell *
***************************/
class BRepToIGES_BRShell : public BRepToIGES_BREntity {
	public:
		/****************** BRepToIGES_BRShell ******************/
		/**** md5 signature: a3adac5f3f29d33de3d0e475d161d3b0 ****/
		%feature("compactdefaultargs") BRepToIGES_BRShell;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepToIGES_BRShell;
		 BRepToIGES_BRShell();

		/****************** BRepToIGES_BRShell ******************/
		/**** md5 signature: f2cf15974ec9eba3737bd3662a935110 ****/
		%feature("compactdefaultargs") BRepToIGES_BRShell;
		%feature("autodoc", "No available documentation.

Parameters
----------
BR: BRepToIGES_BREntity

Returns
-------
None
") BRepToIGES_BRShell;
		 BRepToIGES_BRShell(const BRepToIGES_BREntity & BR);

		/****************** TransferFace ******************/
		/**** md5 signature: b8073577a8f49d15f8252aa5dc817660 ****/
		%feature("compactdefaultargs") TransferFace;
		%feature("autodoc", "Transfert a face entity from topods to iges if this entity could not be converted, this member returns a nullentity.

Parameters
----------
start: TopoDS_Face
theProgress: Message_ProgressRange,optional
	default value is Message_ProgressRange()

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") TransferFace;
		opencascade::handle<IGESData_IGESEntity> TransferFace(const TopoDS_Face & start, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****************** TransferShell ******************/
		/**** md5 signature: e737aeb30a45781fac747de9929c619b ****/
		%feature("compactdefaultargs") TransferShell;
		%feature("autodoc", "Transfert an shape entity from topods to iges this entity must be a face or a shell. if this entity could not be converted, this member returns a nullentity.

Parameters
----------
start: TopoDS_Shape
theProgress: Message_ProgressRange,optional
	default value is Message_ProgressRange()

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") TransferShell;
		opencascade::handle<IGESData_IGESEntity> TransferShell(const TopoDS_Shape & start, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****************** TransferShell ******************/
		/**** md5 signature: 02de8e9c84a4062653972ec979013186 ****/
		%feature("compactdefaultargs") TransferShell;
		%feature("autodoc", "Transfert an shell entity from topods to iges if this entity could not be converted, this member returns a nullentity.

Parameters
----------
start: TopoDS_Shell
theProgress: Message_ProgressRange,optional
	default value is Message_ProgressRange()

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") TransferShell;
		opencascade::handle<IGESData_IGESEntity> TransferShell(const TopoDS_Shell & start, const Message_ProgressRange & theProgress = Message_ProgressRange());

};


%extend BRepToIGES_BRShell {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class BRepToIGES_BRSolid *
***************************/
class BRepToIGES_BRSolid : public BRepToIGES_BREntity {
	public:
		/****************** BRepToIGES_BRSolid ******************/
		/**** md5 signature: eec8e903c9f75d582fed486542389e3f ****/
		%feature("compactdefaultargs") BRepToIGES_BRSolid;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepToIGES_BRSolid;
		 BRepToIGES_BRSolid();

		/****************** BRepToIGES_BRSolid ******************/
		/**** md5 signature: e53a8aa7b7ce789c1d11a2bbd7d2e070 ****/
		%feature("compactdefaultargs") BRepToIGES_BRSolid;
		%feature("autodoc", "No available documentation.

Parameters
----------
BR: BRepToIGES_BREntity

Returns
-------
None
") BRepToIGES_BRSolid;
		 BRepToIGES_BRSolid(const BRepToIGES_BREntity & BR);

		/****************** TransferCompSolid ******************/
		/**** md5 signature: 40785b5d35a62debe69fca1bc3364330 ****/
		%feature("compactdefaultargs") TransferCompSolid;
		%feature("autodoc", "Transfert an compsolid entity from topods to iges if this entity could not be converted, this member returns a nullentity.

Parameters
----------
start: TopoDS_CompSolid
theProgress: Message_ProgressRange,optional
	default value is Message_ProgressRange()

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") TransferCompSolid;
		opencascade::handle<IGESData_IGESEntity> TransferCompSolid(const TopoDS_CompSolid & start, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****************** TransferCompound ******************/
		/**** md5 signature: 84815d201dd7ab7dafb870ef423d829f ****/
		%feature("compactdefaultargs") TransferCompound;
		%feature("autodoc", "Transfert a compound entity from topods to iges if this entity could not be converted, this member returns a nullentity.

Parameters
----------
start: TopoDS_Compound
theProgress: Message_ProgressRange,optional
	default value is Message_ProgressRange()

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") TransferCompound;
		opencascade::handle<IGESData_IGESEntity> TransferCompound(const TopoDS_Compound & start, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****************** TransferSolid ******************/
		/**** md5 signature: 38fec2a92a106bd928b084bfa2cd7019 ****/
		%feature("compactdefaultargs") TransferSolid;
		%feature("autodoc", "Transfert a shape entity from topods to iges this entity must be a solid or a compsolid or a compound. if this entity could not be converted, this member returns a nullentity.

Parameters
----------
start: TopoDS_Shape
theProgress: Message_ProgressRange,optional
	default value is Message_ProgressRange()

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") TransferSolid;
		opencascade::handle<IGESData_IGESEntity> TransferSolid(const TopoDS_Shape & start, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****************** TransferSolid ******************/
		/**** md5 signature: eb38acc4b5bc267d7ec38595e0e78a53 ****/
		%feature("compactdefaultargs") TransferSolid;
		%feature("autodoc", "Transfert a solid entity from topods to iges if this entity could not be converted, this member returns a nullentity.

Parameters
----------
start: TopoDS_Solid
theProgress: Message_ProgressRange,optional
	default value is Message_ProgressRange()

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") TransferSolid;
		opencascade::handle<IGESData_IGESEntity> TransferSolid(const TopoDS_Solid & start, const Message_ProgressRange & theProgress = Message_ProgressRange());

};


%extend BRepToIGES_BRSolid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class BRepToIGES_BRWire *
**************************/
class BRepToIGES_BRWire : public BRepToIGES_BREntity {
	public:
		/****************** BRepToIGES_BRWire ******************/
		/**** md5 signature: 9d0665299445c3d8851249e6259d2ce9 ****/
		%feature("compactdefaultargs") BRepToIGES_BRWire;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepToIGES_BRWire;
		 BRepToIGES_BRWire();

		/****************** BRepToIGES_BRWire ******************/
		/**** md5 signature: 8e72d5f0f9ad5710082a0c84eaf7f8f0 ****/
		%feature("compactdefaultargs") BRepToIGES_BRWire;
		%feature("autodoc", "No available documentation.

Parameters
----------
BR: BRepToIGES_BREntity

Returns
-------
None
") BRepToIGES_BRWire;
		 BRepToIGES_BRWire(const BRepToIGES_BREntity & BR);

		/****************** TransferEdge ******************/
		/**** md5 signature: f5fa237fc039cb3da8b6071d68f064af ****/
		%feature("compactdefaultargs") TransferEdge;
		%feature("autodoc", "Transfert an edge 3d entity from topods to iges if edge is reversed and isbrepmode is false 3d edge curve is reversed @param[in] theedge input edge to transfer @param[in] theoriginmap shapemap contains the original shapes. should be empty if face is not reversed @param[in] theisbrepmode indicates if write mode is brep returns iges entity or null if could not be converted.

Parameters
----------
theEdge: TopoDS_Edge
theOriginMap: TopTools_DataMapOfShapeShape
theIsBRepMode: bool

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") TransferEdge;
		opencascade::handle<IGESData_IGESEntity> TransferEdge(const TopoDS_Edge & theEdge, const TopTools_DataMapOfShapeShape & theOriginMap, const Standard_Boolean theIsBRepMode);

		/****************** TransferEdge ******************/
		/**** md5 signature: 0d452d4ef6a4294cf4f738a6c062044e ****/
		%feature("compactdefaultargs") TransferEdge;
		%feature("autodoc", "Transfert an edge 2d entity on a face from topods to iges @param[in] theedge input edge to transfer @param[in] theface input face to get the surface and uv coordinates from it @param[in] theoriginmap shapemap contains the original shapes. should be empty if face is not reversed @param[in] thelength input surface length @param[in] theisbrepmode indicates if write mode is brep returns iges entity or null if could not be converted.

Parameters
----------
theEdge: TopoDS_Edge
theFace: TopoDS_Face
theOriginMap: TopTools_DataMapOfShapeShape
theLength: float
theIsBRepMode: bool

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") TransferEdge;
		opencascade::handle<IGESData_IGESEntity> TransferEdge(const TopoDS_Edge & theEdge, const TopoDS_Face & theFace, const TopTools_DataMapOfShapeShape & theOriginMap, const Standard_Real theLength, const Standard_Boolean theIsBRepMode);

		/****************** TransferVertex ******************/
		/**** md5 signature: 57b7850549ccec5346bddf170b85c788 ****/
		%feature("compactdefaultargs") TransferVertex;
		%feature("autodoc", "Transfert a vertex entity from topods to iges if this entity could not be converted, this member returns a nullentity.

Parameters
----------
myvertex: TopoDS_Vertex

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") TransferVertex;
		opencascade::handle<IGESData_IGESEntity> TransferVertex(const TopoDS_Vertex & myvertex);

		/****************** TransferVertex ******************/
		/**** md5 signature: f3aba4c723554df10a1ee2bd249cd459 ****/
		%feature("compactdefaultargs") TransferVertex;
		%feature("autodoc", "Transfert a vertex entity on an edge from topods to iges returns the parameter of myvertex on myedge. if this entity could not be converted, this member returns a nullentity.

Parameters
----------
myvertex: TopoDS_Vertex
myedge: TopoDS_Edge

Returns
-------
parameter: float
") TransferVertex;
		opencascade::handle<IGESData_IGESEntity> TransferVertex(const TopoDS_Vertex & myvertex, const TopoDS_Edge & myedge, Standard_Real &OutValue);

		/****************** TransferVertex ******************/
		/**** md5 signature: 3b564c71ab4480b5f80e6e92ba13faf5 ****/
		%feature("compactdefaultargs") TransferVertex;
		%feature("autodoc", "Transfert a vertex entity of an edge on a face from topods to iges returns the parameter of myvertex on the pcurve of myedge on myface if this entity could not be converted, this member returns a nullentity.

Parameters
----------
myvertex: TopoDS_Vertex
myedge: TopoDS_Edge
myface: TopoDS_Face

Returns
-------
parameter: float
") TransferVertex;
		opencascade::handle<IGESData_IGESEntity> TransferVertex(const TopoDS_Vertex & myvertex, const TopoDS_Edge & myedge, const TopoDS_Face & myface, Standard_Real &OutValue);

		/****************** TransferVertex ******************/
		/**** md5 signature: fb9d2dd03629f6db3d4006b1ab8857f3 ****/
		%feature("compactdefaultargs") TransferVertex;
		%feature("autodoc", "Transfert a vertex entity of an edge on a surface from topods to iges returns the parameter of myvertex on the pcurve of myedge on mysurface if this entity could not be converted, this member returns a nullentity.

Parameters
----------
myvertex: TopoDS_Vertex
myedge: TopoDS_Edge
mysurface: Geom_Surface
myloc: TopLoc_Location

Returns
-------
parameter: float
") TransferVertex;
		opencascade::handle<IGESData_IGESEntity> TransferVertex(const TopoDS_Vertex & myvertex, const TopoDS_Edge & myedge, const opencascade::handle<Geom_Surface> & mysurface, const TopLoc_Location & myloc, Standard_Real &OutValue);

		/****************** TransferVertex ******************/
		/**** md5 signature: 0135e619d23e1976ca6adba716ef505e ****/
		%feature("compactdefaultargs") TransferVertex;
		%feature("autodoc", "Transfert a vertex entity on a face from topods to iges returns the parameters of myvertex on myface if this entity could not be converted, this member returns a nullentity.

Parameters
----------
myvertex: TopoDS_Vertex
myface: TopoDS_Face
mypoint: gp_Pnt2d

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") TransferVertex;
		opencascade::handle<IGESData_IGESEntity> TransferVertex(const TopoDS_Vertex & myvertex, const TopoDS_Face & myface, gp_Pnt2d & mypoint);

		/****************** TransferWire ******************/
		/**** md5 signature: 5f6228b4539551319b6dc70510dda6a8 ****/
		%feature("compactdefaultargs") TransferWire;
		%feature("autodoc", "Transfert a shape entity from topods to iges this entity must be a vertex or an edge or a wire. if this entity could not be converted, this member returns a nullentity.

Parameters
----------
start: TopoDS_Shape

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") TransferWire;
		opencascade::handle<IGESData_IGESEntity> TransferWire(const TopoDS_Shape & start);

		/****************** TransferWire ******************/
		/**** md5 signature: da785d2a257f25a07b504481d0293ef3 ****/
		%feature("compactdefaultargs") TransferWire;
		%feature("autodoc", "Transfert a wire entity from topods to iges if this entity could not be converted, this member returns a nullentity.

Parameters
----------
mywire: TopoDS_Wire

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") TransferWire;
		opencascade::handle<IGESData_IGESEntity> TransferWire(const TopoDS_Wire & mywire);

		/****************** TransferWire ******************/
		/**** md5 signature: 02d5bc382ec5202d9bf19b64011be09d ****/
		%feature("compactdefaultargs") TransferWire;
		%feature("autodoc", "Transfert a wire entity from topods to iges. @param[in] thewire input wire @param[in] theface input face @param[in] theoriginmap shapemap contains the original shapes. should be empty if face is not reversed @param[in] thecurve2d input curve 2d @param[in] thelength input surface length returns iges entity (the curve associated to mywire in the parametric space of myface) or null if could not be converted.

Parameters
----------
theWire: TopoDS_Wire
theFace: TopoDS_Face
theOriginMap: TopTools_DataMapOfShapeShape
theCurve2d: IGESData_IGESEntity
theLength: float

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") TransferWire;
		opencascade::handle<IGESData_IGESEntity> TransferWire(const TopoDS_Wire & theWire, const TopoDS_Face & theFace, const TopTools_DataMapOfShapeShape & theOriginMap, opencascade::handle<IGESData_IGESEntity> & theCurve2d, const Standard_Real theLength);

};


%extend BRepToIGES_BRWire {
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
