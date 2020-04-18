/*
Copyright 2008-2020 Thomas Paviot (tpaviot@gmail.com)

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
%define IGESTOBREPDOCSTRING
"IGESToBRep module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_igestobrep.html"
%enddef
%module (package="OCC.Core", docstring=IGESTOBREPDOCSTRING) IGESToBRep


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
#include<IGESToBRep_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<IGESData_module.hxx>
#include<TColStd_module.hxx>
#include<TopoDS_module.hxx>
#include<Transfer_module.hxx>
#include<Interface_module.hxx>
#include<Message_module.hxx>
#include<Geom_module.hxx>
#include<gp_module.hxx>
#include<ShapeExtend_module.hxx>
#include<Geom2d_module.hxx>
#include<TColGeom_module.hxx>
#include<TopTools_module.hxx>
#include<MoniTool_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import IGESData.i
%import TColStd.i
%import TopoDS.i
%import Transfer.i
%import Interface.i
%import Message.i
%import Geom.i
%import gp.i
%import ShapeExtend.i
%import Geom2d.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
%wrap_handle(IGESToBRep_Actor)
%wrap_handle(IGESToBRep_AlgoContainer)
%wrap_handle(IGESToBRep_IGESBoundary)
%wrap_handle(IGESToBRep_ToolContainer)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/*******************
* class IGESToBRep *
*******************/
%rename(igestobrep) IGESToBRep;
class IGESToBRep {
	public:
		/****************** AlgoContainer ******************/
		%feature("compactdefaultargs") AlgoContainer;
		%feature("autodoc", "Returns default algocontainer.

Returns
-------
opencascade::handle<IGESToBRep_AlgoContainer>
") AlgoContainer;
		static opencascade::handle<IGESToBRep_AlgoContainer> AlgoContainer();

		/****************** IGESCurveToSequenceOfIGESCurve ******************/
		%feature("compactdefaultargs") IGESCurveToSequenceOfIGESCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
curve: IGESData_IGESEntity
sequence: TColStd_HSequenceOfTransient

Returns
-------
int
") IGESCurveToSequenceOfIGESCurve;
		static Standard_Integer IGESCurveToSequenceOfIGESCurve(const opencascade::handle<IGESData_IGESEntity> & curve, opencascade::handle<TColStd_HSequenceOfTransient> & sequence);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Creates and initializes default algocontainer.

Returns
-------
None
") Init;
		static void Init();

		/****************** IsBRepEntity ******************/
		%feature("compactdefaultargs") IsBRepEntity;
		%feature("autodoc", "Return true if the igesentity can be transfered by transferbrepentity. ex: vertexlist, edgelist, loop, face, shell, manifold solid brep object from igessolid : 502, 504, 508, 510, 514, 186.

Parameters
----------
start: IGESData_IGESEntity

Returns
-------
bool
") IsBRepEntity;
		static Standard_Boolean IsBRepEntity(const opencascade::handle<IGESData_IGESEntity> & start);

		/****************** IsBasicCurve ******************/
		%feature("compactdefaultargs") IsBasicCurve;
		%feature("autodoc", "Return true if the igesentity can be transfered by transferbasiccurve. ex: circulararc, conicarc, line, copiousdata, bsplinecurve, splinecurve... from igesgeom : 104,110,112,126.

Parameters
----------
start: IGESData_IGESEntity

Returns
-------
bool
") IsBasicCurve;
		static Standard_Boolean IsBasicCurve(const opencascade::handle<IGESData_IGESEntity> & start);

		/****************** IsBasicSurface ******************/
		%feature("compactdefaultargs") IsBasicSurface;
		%feature("autodoc", "Return true if the igesentity can be transfered by transferbasicsurface. ex: bsplinesurface, splinesurface... from igesgeom : 114,128.

Parameters
----------
start: IGESData_IGESEntity

Returns
-------
bool
") IsBasicSurface;
		static Standard_Boolean IsBasicSurface(const opencascade::handle<IGESData_IGESEntity> & start);

		/****************** IsCurveAndSurface ******************/
		%feature("compactdefaultargs") IsCurveAndSurface;
		%feature("autodoc", "Return true if the igesentity can be transfered by transfercurveandsurface. ex: all igesentity from igesgeom.

Parameters
----------
start: IGESData_IGESEntity

Returns
-------
bool
") IsCurveAndSurface;
		static Standard_Boolean IsCurveAndSurface(const opencascade::handle<IGESData_IGESEntity> & start);

		/****************** IsTopoCurve ******************/
		%feature("compactdefaultargs") IsTopoCurve;
		%feature("autodoc", "Return true if the igesentity can be transfered by transfertopocurve. ex: all curves from igesgeom : all basic curves,102,130,142,144.

Parameters
----------
start: IGESData_IGESEntity

Returns
-------
bool
") IsTopoCurve;
		static Standard_Boolean IsTopoCurve(const opencascade::handle<IGESData_IGESEntity> & start);

		/****************** IsTopoSurface ******************/
		%feature("compactdefaultargs") IsTopoSurface;
		%feature("autodoc", "Return true if the igesentity can be transfered by transfertoposurface. ex: all surfaces from igesgeom : all basic surfaces,108,118,120,122,141,143.

Parameters
----------
start: IGESData_IGESEntity

Returns
-------
bool
") IsTopoSurface;
		static Standard_Boolean IsTopoSurface(const opencascade::handle<IGESData_IGESEntity> & start);

		/****************** SetAlgoContainer ******************/
		%feature("compactdefaultargs") SetAlgoContainer;
		%feature("autodoc", "Sets default algocontainer.

Parameters
----------
aContainer: IGESToBRep_AlgoContainer

Returns
-------
None
") SetAlgoContainer;
		static void SetAlgoContainer(const opencascade::handle<IGESToBRep_AlgoContainer> & aContainer);

		/****************** TransferPCurve ******************/
		%feature("compactdefaultargs") TransferPCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
fromedge: TopoDS_Edge
toedge: TopoDS_Edge
face: TopoDS_Face

Returns
-------
bool
") TransferPCurve;
		static Standard_Boolean TransferPCurve(const TopoDS_Edge & fromedge, const TopoDS_Edge & toedge, const TopoDS_Face & face);

};


%extend IGESToBRep {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class IGESToBRep_Actor *
*************************/
class IGESToBRep_Actor : public Transfer_ActorOfTransientProcess {
	public:
		/****************** IGESToBRep_Actor ******************/
		%feature("compactdefaultargs") IGESToBRep_Actor;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESToBRep_Actor;
		 IGESToBRep_Actor();

		/****************** GetContinuity ******************/
		%feature("compactdefaultargs") GetContinuity;
		%feature("autodoc", "Return 'thecontinuity'.

Returns
-------
int
") GetContinuity;
		Standard_Integer GetContinuity();

		/****************** Recognize ******************/
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: Standard_Transient

Returns
-------
bool
") Recognize;
		virtual Standard_Boolean Recognize(const opencascade::handle<Standard_Transient> & start);

		/****************** SetContinuity ******************/
		%feature("compactdefaultargs") SetContinuity;
		%feature("autodoc", "---purpose by default continuity = 0 if continuity = 1 : try c1 if continuity = 2 : try c2.

Parameters
----------
continuity: int,optional
	default value is 0

Returns
-------
None
") SetContinuity;
		void SetContinuity(const Standard_Integer continuity = 0);

		/****************** SetModel ******************/
		%feature("compactdefaultargs") SetModel;
		%feature("autodoc", "No available documentation.

Parameters
----------
model: Interface_InterfaceModel

Returns
-------
None
") SetModel;
		void SetModel(const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** Transfer ******************/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: Standard_Transient
TP: Transfer_TransientProcess

Returns
-------
opencascade::handle<Transfer_Binder>
") Transfer;
		virtual opencascade::handle<Transfer_Binder> Transfer(const opencascade::handle<Standard_Transient> & start, const opencascade::handle<Transfer_TransientProcess> & TP);

		/****************** UsedTolerance ******************/
		%feature("compactdefaultargs") UsedTolerance;
		%feature("autodoc", "Returns the tolerance which was actually used, either from the file or from statics.

Returns
-------
float
") UsedTolerance;
		Standard_Real UsedTolerance();

};


%make_alias(IGESToBRep_Actor)

%extend IGESToBRep_Actor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class IGESToBRep_AlgoContainer *
*********************************/
class IGESToBRep_AlgoContainer : public Standard_Transient {
	public:
		/****************** IGESToBRep_AlgoContainer ******************/
		%feature("compactdefaultargs") IGESToBRep_AlgoContainer;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") IGESToBRep_AlgoContainer;
		 IGESToBRep_AlgoContainer();

		/****************** SetToolContainer ******************/
		%feature("compactdefaultargs") SetToolContainer;
		%feature("autodoc", "Sets toolcontainer.

Parameters
----------
TC: IGESToBRep_ToolContainer

Returns
-------
None
") SetToolContainer;
		void SetToolContainer(const opencascade::handle<IGESToBRep_ToolContainer> & TC);

		/****************** ToolContainer ******************/
		%feature("compactdefaultargs") ToolContainer;
		%feature("autodoc", "Returns toolcontainer.

Returns
-------
opencascade::handle<IGESToBRep_ToolContainer>
") ToolContainer;
		opencascade::handle<IGESToBRep_ToolContainer> ToolContainer();

};


%make_alias(IGESToBRep_AlgoContainer)

%extend IGESToBRep_AlgoContainer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class IGESToBRep_CurveAndSurface *
***********************************/
class IGESToBRep_CurveAndSurface {
	public:
		/****************** IGESToBRep_CurveAndSurface ******************/
		%feature("compactdefaultargs") IGESToBRep_CurveAndSurface;
		%feature("autodoc", "Creates a tool curveandsurface ready to run, with epsilons set to 1.e-04, mymodetopo to true, the optimization of the continuity to false.

Returns
-------
None
") IGESToBRep_CurveAndSurface;
		 IGESToBRep_CurveAndSurface();

		/****************** IGESToBRep_CurveAndSurface ******************/
		%feature("compactdefaultargs") IGESToBRep_CurveAndSurface;
		%feature("autodoc", "Creates a tool curveandsurface ready to run and sets its fields as cs's.

Parameters
----------
CS: IGESToBRep_CurveAndSurface

Returns
-------
None
") IGESToBRep_CurveAndSurface;
		 IGESToBRep_CurveAndSurface(const IGESToBRep_CurveAndSurface & CS);

		/****************** IGESToBRep_CurveAndSurface ******************/
		%feature("compactdefaultargs") IGESToBRep_CurveAndSurface;
		%feature("autodoc", "Creates a tool curveandsurface ready to run.

Parameters
----------
eps: float
epsGeom: float
epsCoeff: float
mode: bool
modeapprox: bool
optimized: bool

Returns
-------
None
") IGESToBRep_CurveAndSurface;
		 IGESToBRep_CurveAndSurface(const Standard_Real eps, const Standard_Real epsGeom, const Standard_Real epsCoeff, const Standard_Boolean mode, const Standard_Boolean modeapprox, const Standard_Boolean optimized);

		/****************** AddShapeResult ******************/
		%feature("compactdefaultargs") AddShapeResult;
		%feature("autodoc", "Set in 'mymap' the result of the transfer of the entity of the igesentity start ( type vertexlist or edgelist).

Parameters
----------
start: IGESData_IGESEntity
result: TopoDS_Shape

Returns
-------
None
") AddShapeResult;
		void AddShapeResult(const opencascade::handle<IGESData_IGESEntity> & start, const TopoDS_Shape & result);

		/****************** GetContinuity ******************/
		%feature("compactdefaultargs") GetContinuity;
		%feature("autodoc", "Returns the value of 'mycontinuity'.

Returns
-------
int
") GetContinuity;
		Standard_Integer GetContinuity();

		/****************** GetEpsCoeff ******************/
		%feature("compactdefaultargs") GetEpsCoeff;
		%feature("autodoc", "Returns the value of 'myepscoeff'.

Returns
-------
float
") GetEpsCoeff;
		Standard_Real GetEpsCoeff();

		/****************** GetEpsGeom ******************/
		%feature("compactdefaultargs") GetEpsGeom;
		%feature("autodoc", "Returns the value of 'myepsgeom'.

Returns
-------
float
") GetEpsGeom;
		Standard_Real GetEpsGeom();

		/****************** GetEpsilon ******************/
		%feature("compactdefaultargs") GetEpsilon;
		%feature("autodoc", "Returns the value of 'myeps'.

Returns
-------
float
") GetEpsilon;
		Standard_Real GetEpsilon();

		/****************** GetMaxTol ******************/
		%feature("compactdefaultargs") GetMaxTol;
		%feature("autodoc", "Returns the value of 'mymaxtol'.

Returns
-------
float
") GetMaxTol;
		Standard_Real GetMaxTol();

		/****************** GetMinTol ******************/
		%feature("compactdefaultargs") GetMinTol;
		%feature("autodoc", "Returns the value of 'mymintol'.

Returns
-------
float
") GetMinTol;
		Standard_Real GetMinTol();

		/****************** GetModeApprox ******************/
		%feature("compactdefaultargs") GetModeApprox;
		%feature("autodoc", "Returns the value of 'mymodeapprox'.

Returns
-------
bool
") GetModeApprox;
		Standard_Boolean GetModeApprox();

		/****************** GetModeTransfer ******************/
		%feature("compactdefaultargs") GetModeTransfer;
		%feature("autodoc", "Returns the value of 'mymodeistopo'.

Returns
-------
bool
") GetModeTransfer;
		Standard_Boolean GetModeTransfer();

		/****************** GetModel ******************/
		%feature("compactdefaultargs") GetModel;
		%feature("autodoc", "Returns the value of 'mymodel'.

Returns
-------
opencascade::handle<IGESData_IGESModel>
") GetModel;
		opencascade::handle<IGESData_IGESModel> GetModel();

		/****************** GetOptimized ******************/
		%feature("compactdefaultargs") GetOptimized;
		%feature("autodoc", "Returns the value of 'mycontisopti'.

Returns
-------
bool
") GetOptimized;
		Standard_Boolean GetOptimized();

		/****************** GetShapeResult ******************/
		%feature("compactdefaultargs") GetShapeResult;
		%feature("autodoc", "Returns the result of the transfer of the igesentity 'start' contained in 'mymap' . (if hasshaperesult is true).

Parameters
----------
start: IGESData_IGESEntity

Returns
-------
TopoDS_Shape
") GetShapeResult;
		TopoDS_Shape GetShapeResult(const opencascade::handle<IGESData_IGESEntity> & start);

		/****************** GetShapeResult ******************/
		%feature("compactdefaultargs") GetShapeResult;
		%feature("autodoc", "Returns the numth result of the igesentity start (type vertexlist or edgelist) in 'mymap'. (if nbshaperesult is not null).

Parameters
----------
start: IGESData_IGESEntity
num: int

Returns
-------
TopoDS_Shape
") GetShapeResult;
		TopoDS_Shape GetShapeResult(const opencascade::handle<IGESData_IGESEntity> & start, const Standard_Integer num);

		/****************** GetSurfaceCurve ******************/
		%feature("compactdefaultargs") GetSurfaceCurve;
		%feature("autodoc", "Returns the value of ' mysurfacecurve' 0 = value in file , 2 = kepp 2d and compute 3d 3 = keep 3d and compute 2d.

Returns
-------
int
") GetSurfaceCurve;
		Standard_Integer GetSurfaceCurve();

		/****************** GetTransferProcess ******************/
		%feature("compactdefaultargs") GetTransferProcess;
		%feature("autodoc", "Returns the value of 'mymsgreg'.

Returns
-------
opencascade::handle<Transfer_TransientProcess>
") GetTransferProcess;
		opencascade::handle<Transfer_TransientProcess> GetTransferProcess();

		/****************** GetUVResolution ******************/
		%feature("compactdefaultargs") GetUVResolution;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") GetUVResolution;
		Standard_Real GetUVResolution();

		/****************** GetUnitFactor ******************/
		%feature("compactdefaultargs") GetUnitFactor;
		%feature("autodoc", "Returns the value of ' myunitfactor'.

Returns
-------
float
") GetUnitFactor;
		Standard_Real GetUnitFactor();

		/****************** HasShapeResult ******************/
		%feature("compactdefaultargs") HasShapeResult;
		%feature("autodoc", "Returns true if start was already treated and has a result in 'mymap' else returns false.

Parameters
----------
start: IGESData_IGESEntity

Returns
-------
bool
") HasShapeResult;
		Standard_Boolean HasShapeResult(const opencascade::handle<IGESData_IGESEntity> & start);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes the field of the tool curveandsurface with default creating values.

Returns
-------
None
") Init;
		void Init();

		/****************** NbShapeResult ******************/
		%feature("compactdefaultargs") NbShapeResult;
		%feature("autodoc", "Returns the number of shapes results contained in 'mymap' for the igesentity start ( type vertexlist or edgelist).

Parameters
----------
start: IGESData_IGESEntity

Returns
-------
int
") NbShapeResult;
		Standard_Integer NbShapeResult(const opencascade::handle<IGESData_IGESEntity> & start);

		/****************** SendFail ******************/
		%feature("compactdefaultargs") SendFail;
		%feature("autodoc", "Records a new fail message.

Parameters
----------
start: IGESData_IGESEntity
amsg: Message_Msg

Returns
-------
None
") SendFail;
		void SendFail(const opencascade::handle<IGESData_IGESEntity> & start, const Message_Msg & amsg);

		/****************** SendMsg ******************/
		%feature("compactdefaultargs") SendMsg;
		%feature("autodoc", "Records a new information message from the definition of a msg (original+value).

Parameters
----------
start: IGESData_IGESEntity
amsg: Message_Msg

Returns
-------
None
") SendMsg;
		void SendMsg(const opencascade::handle<IGESData_IGESEntity> & start, const Message_Msg & amsg);

		/****************** SendWarning ******************/
		%feature("compactdefaultargs") SendWarning;
		%feature("autodoc", "Records a new warning message.

Parameters
----------
start: IGESData_IGESEntity
amsg: Message_Msg

Returns
-------
None
") SendWarning;
		void SendWarning(const opencascade::handle<IGESData_IGESEntity> & start, const Message_Msg & amsg);

		/****************** SetContinuity ******************/
		%feature("compactdefaultargs") SetContinuity;
		%feature("autodoc", "Changes the value of 'mycontinuity' if continuity = 0 do nothing else if continuity = 1 try c1 if continuity = 2 try c2.

Parameters
----------
continuity: int

Returns
-------
None
") SetContinuity;
		void SetContinuity(const Standard_Integer continuity);

		/****************** SetEpsCoeff ******************/
		%feature("compactdefaultargs") SetEpsCoeff;
		%feature("autodoc", "Changes the value of 'myepscoeff'.

Parameters
----------
eps: float

Returns
-------
None
") SetEpsCoeff;
		void SetEpsCoeff(const Standard_Real eps);

		/****************** SetEpsGeom ******************/
		%feature("compactdefaultargs") SetEpsGeom;
		%feature("autodoc", "Changes the value of 'myepsgeom'.

Parameters
----------
eps: float

Returns
-------
None
") SetEpsGeom;
		void SetEpsGeom(const Standard_Real eps);

		/****************** SetEpsilon ******************/
		%feature("compactdefaultargs") SetEpsilon;
		%feature("autodoc", "Changes the value of 'myeps'.

Parameters
----------
eps: float

Returns
-------
None
") SetEpsilon;
		void SetEpsilon(const Standard_Real eps);

		/****************** SetMaxTol ******************/
		%feature("compactdefaultargs") SetMaxTol;
		%feature("autodoc", "Changes the value of 'mymaxtol'.

Parameters
----------
maxtol: float

Returns
-------
None
") SetMaxTol;
		void SetMaxTol(const Standard_Real maxtol);

		/****************** SetMinTol ******************/
		%feature("compactdefaultargs") SetMinTol;
		%feature("autodoc", "Changes the value of 'mymintol'.

Parameters
----------
mintol: float

Returns
-------
None
") SetMinTol;
		void SetMinTol(const Standard_Real mintol);

		/****************** SetModeApprox ******************/
		%feature("compactdefaultargs") SetModeApprox;
		%feature("autodoc", "Changes the value of 'mymodeapprox'.

Parameters
----------
mode: bool

Returns
-------
None
") SetModeApprox;
		void SetModeApprox(const Standard_Boolean mode);

		/****************** SetModeTransfer ******************/
		%feature("compactdefaultargs") SetModeTransfer;
		%feature("autodoc", "Changes the value of 'mymodeistopo'.

Parameters
----------
mode: bool

Returns
-------
None
") SetModeTransfer;
		void SetModeTransfer(const Standard_Boolean mode);

		/****************** SetModel ******************/
		%feature("compactdefaultargs") SetModel;
		%feature("autodoc", "Set the value of 'mymodel'.

Parameters
----------
model: IGESData_IGESModel

Returns
-------
None
") SetModel;
		void SetModel(const opencascade::handle<IGESData_IGESModel> & model);

		/****************** SetOptimized ******************/
		%feature("compactdefaultargs") SetOptimized;
		%feature("autodoc", "Changes the value of 'mycontisopti'.

Parameters
----------
optimized: bool

Returns
-------
None
") SetOptimized;
		void SetOptimized(const Standard_Boolean optimized);

		/****************** SetShapeResult ******************/
		%feature("compactdefaultargs") SetShapeResult;
		%feature("autodoc", "Set in 'mymap' the result of the transfer of the igesentity 'start'.

Parameters
----------
start: IGESData_IGESEntity
result: TopoDS_Shape

Returns
-------
None
") SetShapeResult;
		void SetShapeResult(const opencascade::handle<IGESData_IGESEntity> & start, const TopoDS_Shape & result);

		/****************** SetSurface ******************/
		%feature("compactdefaultargs") SetSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSurface: Geom_Surface

Returns
-------
None
") SetSurface;
		void SetSurface(const opencascade::handle<Geom_Surface> & theSurface);

		/****************** SetSurfaceCurve ******************/
		%feature("compactdefaultargs") SetSurfaceCurve;
		%feature("autodoc", "Changes the value of 'mysurfacecurve'.

Parameters
----------
ival: int

Returns
-------
None
") SetSurfaceCurve;
		void SetSurfaceCurve(const Standard_Integer ival);

		/****************** SetTransferProcess ******************/
		%feature("compactdefaultargs") SetTransferProcess;
		%feature("autodoc", "Set the value of 'mymsgreg'.

Parameters
----------
TP: Transfer_TransientProcess

Returns
-------
None
") SetTransferProcess;
		void SetTransferProcess(const opencascade::handle<Transfer_TransientProcess> & TP);

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_Surface>
") Surface;
		opencascade::handle<Geom_Surface> Surface();

		/****************** TransferCurveAndSurface ******************/
		%feature("compactdefaultargs") TransferCurveAndSurface;
		%feature("autodoc", "Returns the result of the transfert of any iges curve or surface entity. if the transfer has failed, this member return a nullentity.

Parameters
----------
start: IGESData_IGESEntity

Returns
-------
TopoDS_Shape
") TransferCurveAndSurface;
		TopoDS_Shape TransferCurveAndSurface(const opencascade::handle<IGESData_IGESEntity> & start);

		/****************** TransferGeometry ******************/
		%feature("compactdefaultargs") TransferGeometry;
		%feature("autodoc", "Returns the result of the transfert the geometry of any igesentity. if the transfer has failed, this member return a nullentity.

Parameters
----------
start: IGESData_IGESEntity

Returns
-------
TopoDS_Shape
") TransferGeometry;
		TopoDS_Shape TransferGeometry(const opencascade::handle<IGESData_IGESEntity> & start);

		/****************** UpdateMinMaxTol ******************/
		%feature("compactdefaultargs") UpdateMinMaxTol;
		%feature("autodoc", "Sets values of 'mymintol' and 'mymaxtol' as follows mymaxtol = max ('read.maxprecision.val', myepsgeom * myunitfactor) mymintol = precision::confusion() remark: this method is automatically invoked each time the values of 'myepsgeom' or 'myunitfactor' are changed.

Returns
-------
None
") UpdateMinMaxTol;
		void UpdateMinMaxTol();

};


%extend IGESToBRep_CurveAndSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class IGESToBRep_IGESBoundary *
********************************/
class IGESToBRep_IGESBoundary : public Standard_Transient {
	public:
		/****************** IGESToBRep_IGESBoundary ******************/
		%feature("compactdefaultargs") IGESToBRep_IGESBoundary;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") IGESToBRep_IGESBoundary;
		 IGESToBRep_IGESBoundary();

		/****************** IGESToBRep_IGESBoundary ******************/
		%feature("compactdefaultargs") IGESToBRep_IGESBoundary;
		%feature("autodoc", "Empty constructor.

Parameters
----------
CS: IGESToBRep_CurveAndSurface

Returns
-------
None
") IGESToBRep_IGESBoundary;
		 IGESToBRep_IGESBoundary(const IGESToBRep_CurveAndSurface & CS);

		/****************** Check ******************/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "Checks result of translation of iges boundary entities (types 141, 142 or 508). checks consistency of 2d and 3d representations and keeps only one if they are inconsistent. <result>: result of translation (returned by transfer), <checkclosure>: false for 142 without parent 144 entity, otherwise true, <okcurve3d>, <okcurve2d>: those returned by transfer.

Parameters
----------
result: bool
checkclosure: bool
okCurve3d: bool
okCurve2d: bool

Returns
-------
None
") Check;
		virtual void Check(const Standard_Boolean result, const Standard_Boolean checkclosure, const Standard_Boolean okCurve3d, const Standard_Boolean okCurve2d);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Inits the object with parameters common for all types of iges boundaries. <cs>: object to be used for retrieving translation parameters and sending messages, <entity>: boundary entity to be processed, <face>, <trans>, <ufact>: as for igestobrep_topocurve <filepreference>: preferred representation (2 or 3) given in the iges file.

Parameters
----------
CS: IGESToBRep_CurveAndSurface
entity: IGESData_IGESEntity
face: TopoDS_Face
trans: gp_Trsf2d
uFact: float
filepreference: int

Returns
-------
None
") Init;
		void Init(const IGESToBRep_CurveAndSurface & CS, const opencascade::handle<IGESData_IGESEntity> & entity, const TopoDS_Face & face, const gp_Trsf2d & trans, const Standard_Real uFact, const Standard_Integer filepreference);

		/****************** Transfer ******************/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "Translates 141 and 142 entities. returns true if the curve has been successfully translated, otherwise returns false. <okcurve..>: flags that indicate whether corresponding representation has been successfully translated (must be set to true before first call), <curve3d>: model space curve for 142 and current model space curve for 141, <toreverse3d>: false for 142 and current orientation flag for 141, <curves2d>: 1 parameter space curve for 142 or list of them for current model space curves for 141, <number>: 1 for 142 and rank number of model space curve for 141.

Parameters
----------
curve3d: IGESData_IGESEntity
toreverse3d: bool
curves2d: IGESData_HArray1OfIGESEntity
number: int

Returns
-------
okCurve: bool
okCurve3d: bool
okCurve2d: bool
") Transfer;
		Standard_Boolean Transfer(Standard_Boolean &OutValue, Standard_Boolean &OutValue, Standard_Boolean &OutValue, const opencascade::handle<IGESData_IGESEntity> & curve3d, const Standard_Boolean toreverse3d, const opencascade::handle<IGESData_HArray1OfIGESEntity> & curves2d, const Standard_Integer number);

		/****************** Transfer ******************/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "Translates 508 entity. returns true if the curve has been successfully translated, otherwise returns false. input object igesboundary must be created and initialized before. <okcurve..>: flags that indicate whether corresponding representation has been successfully translated (must be set to true before first call), <curve3d>: result of translation of current edge, <curves2d>: list of parameter space curves for edge, <toreverse2d>: orientation flag of current edge in respect to its model space curve, <number>: rank number of edge, <lsewd>: returns the result of translation of current edge.

Parameters
----------
curve3d: ShapeExtend_WireData
curves2d: IGESData_HArray1OfIGESEntity
toreverse2d: bool
number: int
lsewd: ShapeExtend_WireData

Returns
-------
okCurve: bool
okCurve3d: bool
okCurve2d: bool
") Transfer;
		Standard_Boolean Transfer(Standard_Boolean &OutValue, Standard_Boolean &OutValue, Standard_Boolean &OutValue, const opencascade::handle<ShapeExtend_WireData> & curve3d, const opencascade::handle<IGESData_HArray1OfIGESEntity> & curves2d, const Standard_Boolean toreverse2d, const Standard_Integer number, opencascade::handle<ShapeExtend_WireData> & lsewd);

		/****************** WireData ******************/
		%feature("compactdefaultargs") WireData;
		%feature("autodoc", "Returns the resulting wire.

Returns
-------
opencascade::handle<ShapeExtend_WireData>
") WireData;
		opencascade::handle<ShapeExtend_WireData> WireData();

		/****************** WireData2d ******************/
		%feature("compactdefaultargs") WireData2d;
		%feature("autodoc", "Returns the the wire from 2d curves (edges contain pcurves only).

Returns
-------
opencascade::handle<ShapeExtend_WireData>
") WireData2d;
		opencascade::handle<ShapeExtend_WireData> WireData2d();

		/****************** WireData3d ******************/
		%feature("compactdefaultargs") WireData3d;
		%feature("autodoc", "Returns the wire from 3d curves (edges contain 3d curves and may contain pcurves).

Returns
-------
opencascade::handle<ShapeExtend_WireData>
") WireData3d;
		opencascade::handle<ShapeExtend_WireData> WireData3d();

};


%make_alias(IGESToBRep_IGESBoundary)

%extend IGESToBRep_IGESBoundary {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class IGESToBRep_Reader *
**************************/
class IGESToBRep_Reader {
	public:
		/****************** IGESToBRep_Reader ******************/
		%feature("compactdefaultargs") IGESToBRep_Reader;
		%feature("autodoc", "Creates a reader.

Returns
-------
None
") IGESToBRep_Reader;
		 IGESToBRep_Reader();

		/****************** Actor ******************/
		%feature("compactdefaultargs") Actor;
		%feature("autodoc", "Returns 'theactor'.

Returns
-------
opencascade::handle<IGESToBRep_Actor>
") Actor;
		opencascade::handle<IGESToBRep_Actor> Actor();

		/****************** Check ******************/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "Checks the iges file that was loaded into memory. displays error messages in the default message file if withprint is true. returns true if no fail message was found and false if there was at least one fail message.

Parameters
----------
withprint: bool

Returns
-------
bool
") Check;
		Standard_Boolean Check(const Standard_Boolean withprint);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears the results between two translation operations.

Returns
-------
None
") Clear;
		void Clear();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the last transfer/transferroots was a success.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** LoadFile ******************/
		%feature("compactdefaultargs") LoadFile;
		%feature("autodoc", "Loads a model from a file.returns 0 if success. returns 1 if the file could not be opened, returns -1 if an error occurred while the file was being loaded.

Parameters
----------
filename: char *

Returns
-------
int
") LoadFile;
		Standard_Integer LoadFile(const char * filename);

		/****************** Model ******************/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Returns the model to be worked on.

Returns
-------
opencascade::handle<IGESData_IGESModel>
") Model;
		opencascade::handle<IGESData_IGESModel> Model();

		/****************** NbShapes ******************/
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", "Returns the number of shapes produced by the translation.

Returns
-------
int
") NbShapes;
		Standard_Integer NbShapes();

		/****************** OneShape ******************/
		%feature("compactdefaultargs") OneShape;
		%feature("autodoc", "Returns all of the results in a single shape which is: - a null shape if there are no results, - a shape if there is one result, - a compound containing the resulting shapes if there are several.

Returns
-------
TopoDS_Shape
") OneShape;
		TopoDS_Shape OneShape();

		/****************** SetModel ******************/
		%feature("compactdefaultargs") SetModel;
		%feature("autodoc", "Specifies a model to work on also clears the result and done status, sets transientprocess.

Parameters
----------
model: IGESData_IGESModel

Returns
-------
None
") SetModel;
		void SetModel(const opencascade::handle<IGESData_IGESModel> & model);

		/****************** SetTransientProcess ******************/
		%feature("compactdefaultargs") SetTransientProcess;
		%feature("autodoc", "Allows to set an already defined transientprocess (to be called after loadfile or setmodel).

Parameters
----------
TP: Transfer_TransientProcess

Returns
-------
None
") SetTransientProcess;
		void SetTransientProcess(const opencascade::handle<Transfer_TransientProcess> & TP);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Returns the num the resulting shape in a translation operation.

Parameters
----------
num: int,optional
	default value is 1

Returns
-------
TopoDS_Shape
") Shape;
		TopoDS_Shape Shape(const Standard_Integer num = 1);

		/****************** Transfer ******************/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "Transfers an entity given its rank in the model (root or not) returns true if it is recognized as geom-topol. (but it can have failed : see isdone).

Parameters
----------
num: int

Returns
-------
bool
") Transfer;
		Standard_Boolean Transfer(const Standard_Integer num);

		/****************** TransferRoots ******************/
		%feature("compactdefaultargs") TransferRoots;
		%feature("autodoc", "Translates root entities in an iges file. standard_true is the default value and means that only visible root entities are translated. standard_false translates all of the roots (visible and invisible).

Parameters
----------
onlyvisible: bool,optional
	default value is Standard_True

Returns
-------
None
") TransferRoots;
		void TransferRoots(const Standard_Boolean onlyvisible = Standard_True);

		/****************** TransientProcess ******************/
		%feature("compactdefaultargs") TransientProcess;
		%feature("autodoc", "Returns the transientprocess.

Returns
-------
opencascade::handle<Transfer_TransientProcess>
") TransientProcess;
		opencascade::handle<Transfer_TransientProcess> TransientProcess();

		/****************** UsedTolerance ******************/
		%feature("compactdefaultargs") UsedTolerance;
		%feature("autodoc", "Returns the tolerance which has been actually used, converted in millimeters (either that from file or that from session, according the mode).

Returns
-------
float
") UsedTolerance;
		Standard_Real UsedTolerance();

};


%extend IGESToBRep_Reader {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class IGESToBRep_ToolContainer *
*********************************/
class IGESToBRep_ToolContainer : public Standard_Transient {
	public:
		/****************** IGESToBRep_ToolContainer ******************/
		%feature("compactdefaultargs") IGESToBRep_ToolContainer;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") IGESToBRep_ToolContainer;
		 IGESToBRep_ToolContainer();

		/****************** IGESBoundary ******************/
		%feature("compactdefaultargs") IGESBoundary;
		%feature("autodoc", "Returns igestobrep_igesboundary.

Returns
-------
opencascade::handle<IGESToBRep_IGESBoundary>
") IGESBoundary;
		virtual opencascade::handle<IGESToBRep_IGESBoundary> IGESBoundary();

};


%make_alias(IGESToBRep_ToolContainer)

%extend IGESToBRep_ToolContainer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IGESToBRep_BRepEntity *
******************************/
class IGESToBRep_BRepEntity : public IGESToBRep_CurveAndSurface {
	public:
		/****************** IGESToBRep_BRepEntity ******************/
		%feature("compactdefaultargs") IGESToBRep_BRepEntity;
		%feature("autodoc", "Creates a tool brepentity ready to run, with epsilons set to 1.e-04, themodetopo to true, the optimization of the continuity to false.

Returns
-------
None
") IGESToBRep_BRepEntity;
		 IGESToBRep_BRepEntity();

		/****************** IGESToBRep_BRepEntity ******************/
		%feature("compactdefaultargs") IGESToBRep_BRepEntity;
		%feature("autodoc", "Creates a tool brepentity ready to run and sets its fields as cs's.

Parameters
----------
CS: IGESToBRep_CurveAndSurface

Returns
-------
None
") IGESToBRep_BRepEntity;
		 IGESToBRep_BRepEntity(const IGESToBRep_CurveAndSurface & CS);

		/****************** IGESToBRep_BRepEntity ******************/
		%feature("compactdefaultargs") IGESToBRep_BRepEntity;
		%feature("autodoc", "Creates a tool brepentity ready to run.

Parameters
----------
eps: float
epsGeom: float
epsCoeff: float
mode: bool
modeapprox: bool
optimized: bool

Returns
-------
None
") IGESToBRep_BRepEntity;
		 IGESToBRep_BRepEntity(const Standard_Real eps, const Standard_Real epsGeom, const Standard_Real epsCoeff, const Standard_Boolean mode, const Standard_Boolean modeapprox, const Standard_Boolean optimized);

		/****************** TransferBRepEntity ******************/
		%feature("compactdefaultargs") TransferBRepEntity;
		%feature("autodoc", "Transfer the brepentity' : face, shell or manifoldsolid.

Parameters
----------
start: IGESData_IGESEntity

Returns
-------
TopoDS_Shape
") TransferBRepEntity;
		TopoDS_Shape TransferBRepEntity(const opencascade::handle<IGESData_IGESEntity> & start);

		/****************** TransferEdge ******************/
		%feature("compactdefaultargs") TransferEdge;
		%feature("autodoc", "Transfer the entity number 'index' of the edgelist 'start'.

Parameters
----------
start: IGESSolid_EdgeList
index: int

Returns
-------
TopoDS_Shape
") TransferEdge;
		TopoDS_Shape TransferEdge(const opencascade::handle<IGESSolid_EdgeList> & start, const Standard_Integer index);

		/****************** TransferFace ******************/
		%feature("compactdefaultargs") TransferFace;
		%feature("autodoc", "Transfer the face entity.

Parameters
----------
start: IGESSolid_Face

Returns
-------
TopoDS_Shape
") TransferFace;
		TopoDS_Shape TransferFace(const opencascade::handle<IGESSolid_Face> & start);

		/****************** TransferLoop ******************/
		%feature("compactdefaultargs") TransferLoop;
		%feature("autodoc", "Transfer the loop entity.

Parameters
----------
start: IGESSolid_Loop
Face: TopoDS_Face
trans: gp_Trsf2d
uFact: float

Returns
-------
TopoDS_Shape
") TransferLoop;
		TopoDS_Shape TransferLoop(const opencascade::handle<IGESSolid_Loop> & start, const TopoDS_Face & Face, const gp_Trsf2d & trans, const Standard_Real uFact);

		/****************** TransferManifoldSolid ******************/
		%feature("compactdefaultargs") TransferManifoldSolid;
		%feature("autodoc", "Transfer the manifoldsolid entity.

Parameters
----------
start: IGESSolid_ManifoldSolid

Returns
-------
TopoDS_Shape
") TransferManifoldSolid;
		TopoDS_Shape TransferManifoldSolid(const opencascade::handle<IGESSolid_ManifoldSolid> & start);

		/****************** TransferShell ******************/
		%feature("compactdefaultargs") TransferShell;
		%feature("autodoc", "Transfer the shell entity.

Parameters
----------
start: IGESSolid_Shell

Returns
-------
TopoDS_Shape
") TransferShell;
		TopoDS_Shape TransferShell(const opencascade::handle<IGESSolid_Shell> & start);

		/****************** TransferVertex ******************/
		%feature("compactdefaultargs") TransferVertex;
		%feature("autodoc", "Transfer the entity number 'index' of the vertexlist 'start'.

Parameters
----------
start: IGESSolid_VertexList
index: int

Returns
-------
TopoDS_Vertex
") TransferVertex;
		TopoDS_Vertex TransferVertex(const opencascade::handle<IGESSolid_VertexList> & start, const Standard_Integer index);

};


%extend IGESToBRep_BRepEntity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IGESToBRep_BasicCurve *
******************************/
class IGESToBRep_BasicCurve : public IGESToBRep_CurveAndSurface {
	public:
		/****************** IGESToBRep_BasicCurve ******************/
		%feature("compactdefaultargs") IGESToBRep_BasicCurve;
		%feature("autodoc", "Creates a tool basiccurve ready to run, with epsilons set to 1.e-04, themodetopo to true, the optimization of the continuity to false.

Returns
-------
None
") IGESToBRep_BasicCurve;
		 IGESToBRep_BasicCurve();

		/****************** IGESToBRep_BasicCurve ******************/
		%feature("compactdefaultargs") IGESToBRep_BasicCurve;
		%feature("autodoc", "Creates a tool basiccurve ready to run and sets its fields as cs's.

Parameters
----------
CS: IGESToBRep_CurveAndSurface

Returns
-------
None
") IGESToBRep_BasicCurve;
		 IGESToBRep_BasicCurve(const IGESToBRep_CurveAndSurface & CS);

		/****************** IGESToBRep_BasicCurve ******************/
		%feature("compactdefaultargs") IGESToBRep_BasicCurve;
		%feature("autodoc", "Creates a tool basiccurve ready to run.

Parameters
----------
eps: float
epsGeom: float
epsCoeff: float
mode: bool
modeapprox: bool
optimized: bool

Returns
-------
None
") IGESToBRep_BasicCurve;
		 IGESToBRep_BasicCurve(const Standard_Real eps, const Standard_Real epsGeom, const Standard_Real epsCoeff, const Standard_Boolean mode, const Standard_Boolean modeapprox, const Standard_Boolean optimized);

		/****************** Transfer2dBSplineCurve ******************/
		%feature("compactdefaultargs") Transfer2dBSplineCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: IGESGeom_BSplineCurve

Returns
-------
opencascade::handle<Geom2d_Curve>
") Transfer2dBSplineCurve;
		opencascade::handle<Geom2d_Curve> Transfer2dBSplineCurve(const opencascade::handle<IGESGeom_BSplineCurve> & start);

		/****************** Transfer2dBasicCurve ******************/
		%feature("compactdefaultargs") Transfer2dBasicCurve;
		%feature("autodoc", "Transfert a igesentity which answer true to the member : igestobrep::isbasiccurve(igesentity). the igesentity must be a curve uv and its associed trsf must be planar .if this entity could not be converted, this member returns a nullentity.

Parameters
----------
start: IGESData_IGESEntity

Returns
-------
opencascade::handle<Geom2d_Curve>
") Transfer2dBasicCurve;
		opencascade::handle<Geom2d_Curve> Transfer2dBasicCurve(const opencascade::handle<IGESData_IGESEntity> & start);

		/****************** Transfer2dCircularArc ******************/
		%feature("compactdefaultargs") Transfer2dCircularArc;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: IGESGeom_CircularArc

Returns
-------
opencascade::handle<Geom2d_Curve>
") Transfer2dCircularArc;
		opencascade::handle<Geom2d_Curve> Transfer2dCircularArc(const opencascade::handle<IGESGeom_CircularArc> & start);

		/****************** Transfer2dConicArc ******************/
		%feature("compactdefaultargs") Transfer2dConicArc;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: IGESGeom_ConicArc

Returns
-------
opencascade::handle<Geom2d_Curve>
") Transfer2dConicArc;
		opencascade::handle<Geom2d_Curve> Transfer2dConicArc(const opencascade::handle<IGESGeom_ConicArc> & start);

		/****************** Transfer2dCopiousData ******************/
		%feature("compactdefaultargs") Transfer2dCopiousData;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: IGESGeom_CopiousData

Returns
-------
opencascade::handle<Geom2d_BSplineCurve>
") Transfer2dCopiousData;
		opencascade::handle<Geom2d_BSplineCurve> Transfer2dCopiousData(const opencascade::handle<IGESGeom_CopiousData> & start);

		/****************** Transfer2dLine ******************/
		%feature("compactdefaultargs") Transfer2dLine;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: IGESGeom_Line

Returns
-------
opencascade::handle<Geom2d_Curve>
") Transfer2dLine;
		opencascade::handle<Geom2d_Curve> Transfer2dLine(const opencascade::handle<IGESGeom_Line> & start);

		/****************** Transfer2dSplineCurve ******************/
		%feature("compactdefaultargs") Transfer2dSplineCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: IGESGeom_SplineCurve

Returns
-------
opencascade::handle<Geom2d_BSplineCurve>
") Transfer2dSplineCurve;
		opencascade::handle<Geom2d_BSplineCurve> Transfer2dSplineCurve(const opencascade::handle<IGESGeom_SplineCurve> & start);

		/****************** TransferBSplineCurve ******************/
		%feature("compactdefaultargs") TransferBSplineCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: IGESGeom_BSplineCurve

Returns
-------
opencascade::handle<Geom_Curve>
") TransferBSplineCurve;
		opencascade::handle<Geom_Curve> TransferBSplineCurve(const opencascade::handle<IGESGeom_BSplineCurve> & start);

		/****************** TransferBasicCurve ******************/
		%feature("compactdefaultargs") TransferBasicCurve;
		%feature("autodoc", "Transfert a igesentity which answer true to the member : igestobrep::isbasiccurve(igesentity). if this entity could not be converted, this member returns a nullentity.

Parameters
----------
start: IGESData_IGESEntity

Returns
-------
opencascade::handle<Geom_Curve>
") TransferBasicCurve;
		opencascade::handle<Geom_Curve> TransferBasicCurve(const opencascade::handle<IGESData_IGESEntity> & start);

		/****************** TransferCircularArc ******************/
		%feature("compactdefaultargs") TransferCircularArc;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: IGESGeom_CircularArc

Returns
-------
opencascade::handle<Geom_Curve>
") TransferCircularArc;
		opencascade::handle<Geom_Curve> TransferCircularArc(const opencascade::handle<IGESGeom_CircularArc> & start);

		/****************** TransferConicArc ******************/
		%feature("compactdefaultargs") TransferConicArc;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: IGESGeom_ConicArc

Returns
-------
opencascade::handle<Geom_Curve>
") TransferConicArc;
		opencascade::handle<Geom_Curve> TransferConicArc(const opencascade::handle<IGESGeom_ConicArc> & start);

		/****************** TransferCopiousData ******************/
		%feature("compactdefaultargs") TransferCopiousData;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: IGESGeom_CopiousData

Returns
-------
opencascade::handle<Geom_BSplineCurve>
") TransferCopiousData;
		opencascade::handle<Geom_BSplineCurve> TransferCopiousData(const opencascade::handle<IGESGeom_CopiousData> & start);

		/****************** TransferLine ******************/
		%feature("compactdefaultargs") TransferLine;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: IGESGeom_Line

Returns
-------
opencascade::handle<Geom_Curve>
") TransferLine;
		opencascade::handle<Geom_Curve> TransferLine(const opencascade::handle<IGESGeom_Line> & start);

		/****************** TransferSplineCurve ******************/
		%feature("compactdefaultargs") TransferSplineCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: IGESGeom_SplineCurve

Returns
-------
opencascade::handle<Geom_BSplineCurve>
") TransferSplineCurve;
		opencascade::handle<Geom_BSplineCurve> TransferSplineCurve(const opencascade::handle<IGESGeom_SplineCurve> & start);

		/****************** TransferTransformation ******************/
		%feature("compactdefaultargs") TransferTransformation;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: IGESGeom_TransformationMatrix

Returns
-------
opencascade::handle<Geom_Transformation>
") TransferTransformation;
		opencascade::handle<Geom_Transformation> TransferTransformation(const opencascade::handle<IGESGeom_TransformationMatrix> & start);

};


%extend IGESToBRep_BasicCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class IGESToBRep_BasicSurface *
********************************/
class IGESToBRep_BasicSurface : public IGESToBRep_CurveAndSurface {
	public:
		/****************** IGESToBRep_BasicSurface ******************/
		%feature("compactdefaultargs") IGESToBRep_BasicSurface;
		%feature("autodoc", "Creates a tool basicsurface ready to run, with epsilons set to 1.e-04, themodetopo to true, the optimization of the continuity to false.

Returns
-------
None
") IGESToBRep_BasicSurface;
		 IGESToBRep_BasicSurface();

		/****************** IGESToBRep_BasicSurface ******************/
		%feature("compactdefaultargs") IGESToBRep_BasicSurface;
		%feature("autodoc", "Creates a tool basicsurface ready to run and sets its fields as cs's.

Parameters
----------
CS: IGESToBRep_CurveAndSurface

Returns
-------
None
") IGESToBRep_BasicSurface;
		 IGESToBRep_BasicSurface(const IGESToBRep_CurveAndSurface & CS);

		/****************** IGESToBRep_BasicSurface ******************/
		%feature("compactdefaultargs") IGESToBRep_BasicSurface;
		%feature("autodoc", "Creates a tool basicsurface ready to run.

Parameters
----------
eps: float
epsGeom: float
epsCoeff: float
mode: bool
modeapprox: bool
optimized: bool

Returns
-------
None
") IGESToBRep_BasicSurface;
		 IGESToBRep_BasicSurface(const Standard_Real eps, const Standard_Real epsGeom, const Standard_Real epsCoeff, const Standard_Boolean mode, const Standard_Boolean modeapprox, const Standard_Boolean optimized);

		/****************** TransferBSplineSurface ******************/
		%feature("compactdefaultargs") TransferBSplineSurface;
		%feature("autodoc", "Returns bsplinesurface from geom if the transfer has succeded.

Parameters
----------
start: IGESGeom_BSplineSurface

Returns
-------
opencascade::handle<Geom_BSplineSurface>
") TransferBSplineSurface;
		opencascade::handle<Geom_BSplineSurface> TransferBSplineSurface(const opencascade::handle<IGESGeom_BSplineSurface> & start);

		/****************** TransferBasicSurface ******************/
		%feature("compactdefaultargs") TransferBasicSurface;
		%feature("autodoc", "Returns surface from geom if the last transfer has succeded.

Parameters
----------
start: IGESData_IGESEntity

Returns
-------
opencascade::handle<Geom_Surface>
") TransferBasicSurface;
		opencascade::handle<Geom_Surface> TransferBasicSurface(const opencascade::handle<IGESData_IGESEntity> & start);

		/****************** TransferPlaneSurface ******************/
		%feature("compactdefaultargs") TransferPlaneSurface;
		%feature("autodoc", "Returns plane from geom if the transfer has succeded.

Parameters
----------
start: IGESSolid_PlaneSurface

Returns
-------
opencascade::handle<Geom_Plane>
") TransferPlaneSurface;
		opencascade::handle<Geom_Plane> TransferPlaneSurface(const opencascade::handle<IGESSolid_PlaneSurface> & start);

		/****************** TransferRigthConicalSurface ******************/
		%feature("compactdefaultargs") TransferRigthConicalSurface;
		%feature("autodoc", "Returns conicalsurface from geom if the transfer has succeded.

Parameters
----------
start: IGESSolid_ConicalSurface

Returns
-------
opencascade::handle<Geom_ConicalSurface>
") TransferRigthConicalSurface;
		opencascade::handle<Geom_ConicalSurface> TransferRigthConicalSurface(const opencascade::handle<IGESSolid_ConicalSurface> & start);

		/****************** TransferRigthCylindricalSurface ******************/
		%feature("compactdefaultargs") TransferRigthCylindricalSurface;
		%feature("autodoc", "Returns cylindricalsurface from geom if the transfer has succeded.

Parameters
----------
start: IGESSolid_CylindricalSurface

Returns
-------
opencascade::handle<Geom_CylindricalSurface>
") TransferRigthCylindricalSurface;
		opencascade::handle<Geom_CylindricalSurface> TransferRigthCylindricalSurface(const opencascade::handle<IGESSolid_CylindricalSurface> & start);

		/****************** TransferSphericalSurface ******************/
		%feature("compactdefaultargs") TransferSphericalSurface;
		%feature("autodoc", "Returns sphericalsurface from geom if the transfer has succeded.

Parameters
----------
start: IGESSolid_SphericalSurface

Returns
-------
opencascade::handle<Geom_SphericalSurface>
") TransferSphericalSurface;
		opencascade::handle<Geom_SphericalSurface> TransferSphericalSurface(const opencascade::handle<IGESSolid_SphericalSurface> & start);

		/****************** TransferSplineSurface ******************/
		%feature("compactdefaultargs") TransferSplineSurface;
		%feature("autodoc", "Returns bsplinesurface from geom if the transfer has succeded.

Parameters
----------
start: IGESGeom_SplineSurface

Returns
-------
opencascade::handle<Geom_BSplineSurface>
") TransferSplineSurface;
		opencascade::handle<Geom_BSplineSurface> TransferSplineSurface(const opencascade::handle<IGESGeom_SplineSurface> & start);

		/****************** TransferToroidalSurface ******************/
		%feature("compactdefaultargs") TransferToroidalSurface;
		%feature("autodoc", "Returns sphericalsurface from geom if the transfer has succeded.

Parameters
----------
start: IGESSolid_ToroidalSurface

Returns
-------
opencascade::handle<Geom_ToroidalSurface>
") TransferToroidalSurface;
		opencascade::handle<Geom_ToroidalSurface> TransferToroidalSurface(const opencascade::handle<IGESSolid_ToroidalSurface> & start);

};


%extend IGESToBRep_BasicSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class IGESToBRep_TopoCurve *
*****************************/
class IGESToBRep_TopoCurve : public IGESToBRep_CurveAndSurface {
	public:
		/****************** IGESToBRep_TopoCurve ******************/
		%feature("compactdefaultargs") IGESToBRep_TopoCurve;
		%feature("autodoc", "Creates a tool topocurve ready to run, with epsilons set to 1.e-04, themodetopo to true, the optimization of the continuity to false.

Returns
-------
None
") IGESToBRep_TopoCurve;
		 IGESToBRep_TopoCurve();

		/****************** IGESToBRep_TopoCurve ******************/
		%feature("compactdefaultargs") IGESToBRep_TopoCurve;
		%feature("autodoc", "Creates a tool topocurve ready to run and sets its fields as cs's.

Parameters
----------
CS: IGESToBRep_CurveAndSurface

Returns
-------
None
") IGESToBRep_TopoCurve;
		 IGESToBRep_TopoCurve(const IGESToBRep_CurveAndSurface & CS);

		/****************** IGESToBRep_TopoCurve ******************/
		%feature("compactdefaultargs") IGESToBRep_TopoCurve;
		%feature("autodoc", "Creates a tool topocurve ready to run and sets its fields as cs's.

Parameters
----------
CS: IGESToBRep_TopoCurve

Returns
-------
None
") IGESToBRep_TopoCurve;
		 IGESToBRep_TopoCurve(const IGESToBRep_TopoCurve & CS);

		/****************** IGESToBRep_TopoCurve ******************/
		%feature("compactdefaultargs") IGESToBRep_TopoCurve;
		%feature("autodoc", "Creates a tool topocurve ready to run.

Parameters
----------
eps: float
epsGeom: float
epsCoeff: float
mode: bool
modeapprox: bool
optimized: bool

Returns
-------
None
") IGESToBRep_TopoCurve;
		 IGESToBRep_TopoCurve(const Standard_Real eps, const Standard_Real epsGeom, const Standard_Real epsCoeff, const Standard_Boolean mode, const Standard_Boolean modeapprox, const Standard_Boolean optimized);

		/****************** Approx2dBSplineCurve ******************/
		%feature("compactdefaultargs") Approx2dBSplineCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: Geom2d_BSplineCurve

Returns
-------
None
") Approx2dBSplineCurve;
		void Approx2dBSplineCurve(const opencascade::handle<Geom2d_BSplineCurve> & start);

		/****************** ApproxBSplineCurve ******************/
		%feature("compactdefaultargs") ApproxBSplineCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: Geom_BSplineCurve

Returns
-------
None
") ApproxBSplineCurve;
		void ApproxBSplineCurve(const opencascade::handle<Geom_BSplineCurve> & start);

		/****************** BadCase ******************/
		%feature("compactdefaultargs") BadCase;
		%feature("autodoc", "Returns thebadcase flag.

Returns
-------
bool
") BadCase;
		Standard_Boolean BadCase();

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Returns a curve given its rank, by default the first one (null curvee if out of range) in 'thecurves'.

Parameters
----------
num: int,optional
	default value is 1

Returns
-------
opencascade::handle<Geom_Curve>
") Curve;
		opencascade::handle<Geom_Curve> Curve(const Standard_Integer num = 1);

		/****************** Curve2d ******************/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "Returns a curve given its rank, by default the first one (null curvee if out of range) in 'thecurves2d'.

Parameters
----------
num: int,optional
	default value is 1

Returns
-------
opencascade::handle<Geom2d_Curve>
") Curve2d;
		opencascade::handle<Geom2d_Curve> Curve2d(const Standard_Integer num = 1);

		/****************** NbCurves ******************/
		%feature("compactdefaultargs") NbCurves;
		%feature("autodoc", "Returns the count of curves in 'thecurves'.

Returns
-------
int
") NbCurves;
		Standard_Integer NbCurves();

		/****************** NbCurves2d ******************/
		%feature("compactdefaultargs") NbCurves2d;
		%feature("autodoc", "Returns the count of curves in 'thecurves2d'.

Returns
-------
int
") NbCurves2d;
		Standard_Integer NbCurves2d();

		/****************** SetBadCase ******************/
		%feature("compactdefaultargs") SetBadCase;
		%feature("autodoc", "Sets thebadcase flag.

Parameters
----------
value: bool

Returns
-------
None
") SetBadCase;
		void SetBadCase(const Standard_Boolean value);

		/****************** Transfer2dCompositeCurve ******************/
		%feature("compactdefaultargs") Transfer2dCompositeCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: IGESGeom_CompositeCurve
face: TopoDS_Face
trans: gp_Trsf2d
uFact: float

Returns
-------
TopoDS_Shape
") Transfer2dCompositeCurve;
		TopoDS_Shape Transfer2dCompositeCurve(const opencascade::handle<IGESGeom_CompositeCurve> & start, const TopoDS_Face & face, const gp_Trsf2d & trans, const Standard_Real uFact);

		/****************** Transfer2dOffsetCurve ******************/
		%feature("compactdefaultargs") Transfer2dOffsetCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: IGESGeom_OffsetCurve
face: TopoDS_Face
trans: gp_Trsf2d
uFact: float

Returns
-------
TopoDS_Shape
") Transfer2dOffsetCurve;
		TopoDS_Shape Transfer2dOffsetCurve(const opencascade::handle<IGESGeom_OffsetCurve> & start, const TopoDS_Face & face, const gp_Trsf2d & trans, const Standard_Real uFact);

		/****************** Transfer2dPoint ******************/
		%feature("compactdefaultargs") Transfer2dPoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: IGESGeom_Point

Returns
-------
TopoDS_Vertex
") Transfer2dPoint;
		TopoDS_Vertex Transfer2dPoint(const opencascade::handle<IGESGeom_Point> & start);

		/****************** Transfer2dTopoBasicCurve ******************/
		%feature("compactdefaultargs") Transfer2dTopoBasicCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: IGESData_IGESEntity
face: TopoDS_Face
trans: gp_Trsf2d
uFact: float

Returns
-------
TopoDS_Shape
") Transfer2dTopoBasicCurve;
		TopoDS_Shape Transfer2dTopoBasicCurve(const opencascade::handle<IGESData_IGESEntity> & start, const TopoDS_Face & face, const gp_Trsf2d & trans, const Standard_Real uFact);

		/****************** Transfer2dTopoCurve ******************/
		%feature("compactdefaultargs") Transfer2dTopoCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: IGESData_IGESEntity
face: TopoDS_Face
trans: gp_Trsf2d
uFact: float

Returns
-------
TopoDS_Shape
") Transfer2dTopoCurve;
		TopoDS_Shape Transfer2dTopoCurve(const opencascade::handle<IGESData_IGESEntity> & start, const TopoDS_Face & face, const gp_Trsf2d & trans, const Standard_Real uFact);

		/****************** TransferBoundary ******************/
		%feature("compactdefaultargs") TransferBoundary;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: IGESGeom_Boundary

Returns
-------
TopoDS_Shape
") TransferBoundary;
		TopoDS_Shape TransferBoundary(const opencascade::handle<IGESGeom_Boundary> & start);

		/****************** TransferBoundaryOnFace ******************/
		%feature("compactdefaultargs") TransferBoundaryOnFace;
		%feature("autodoc", "Transfers a boundary directly on a face to trim it.

Parameters
----------
face: TopoDS_Face
start: IGESGeom_Boundary
trans: gp_Trsf2d
uFact: float

Returns
-------
TopoDS_Shape
") TransferBoundaryOnFace;
		TopoDS_Shape TransferBoundaryOnFace(TopoDS_Face & face, const opencascade::handle<IGESGeom_Boundary> & start, const gp_Trsf2d & trans, const Standard_Real uFact);

		/****************** TransferCompositeCurve ******************/
		%feature("compactdefaultargs") TransferCompositeCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: IGESGeom_CompositeCurve

Returns
-------
TopoDS_Shape
") TransferCompositeCurve;
		TopoDS_Shape TransferCompositeCurve(const opencascade::handle<IGESGeom_CompositeCurve> & start);

		/****************** TransferCurveOnFace ******************/
		%feature("compactdefaultargs") TransferCurveOnFace;
		%feature("autodoc", "Transfers a curveonsurface directly on a face to trim it. the curveonsurface have to be defined outer or inner.

Parameters
----------
face: TopoDS_Face
start: IGESGeom_CurveOnSurface
trans: gp_Trsf2d
uFact: float
IsCurv: bool

Returns
-------
TopoDS_Shape
") TransferCurveOnFace;
		TopoDS_Shape TransferCurveOnFace(TopoDS_Face & face, const opencascade::handle<IGESGeom_CurveOnSurface> & start, const gp_Trsf2d & trans, const Standard_Real uFact, const Standard_Boolean IsCurv);

		/****************** TransferCurveOnSurface ******************/
		%feature("compactdefaultargs") TransferCurveOnSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: IGESGeom_CurveOnSurface

Returns
-------
TopoDS_Shape
") TransferCurveOnSurface;
		TopoDS_Shape TransferCurveOnSurface(const opencascade::handle<IGESGeom_CurveOnSurface> & start);

		/****************** TransferOffsetCurve ******************/
		%feature("compactdefaultargs") TransferOffsetCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: IGESGeom_OffsetCurve

Returns
-------
TopoDS_Shape
") TransferOffsetCurve;
		TopoDS_Shape TransferOffsetCurve(const opencascade::handle<IGESGeom_OffsetCurve> & start);

		/****************** TransferPoint ******************/
		%feature("compactdefaultargs") TransferPoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: IGESGeom_Point

Returns
-------
TopoDS_Vertex
") TransferPoint;
		TopoDS_Vertex TransferPoint(const opencascade::handle<IGESGeom_Point> & start);

		/****************** TransferTopoBasicCurve ******************/
		%feature("compactdefaultargs") TransferTopoBasicCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: IGESData_IGESEntity

Returns
-------
TopoDS_Shape
") TransferTopoBasicCurve;
		TopoDS_Shape TransferTopoBasicCurve(const opencascade::handle<IGESData_IGESEntity> & start);

		/****************** TransferTopoCurve ******************/
		%feature("compactdefaultargs") TransferTopoCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: IGESData_IGESEntity

Returns
-------
TopoDS_Shape
") TransferTopoCurve;
		TopoDS_Shape TransferTopoCurve(const opencascade::handle<IGESData_IGESEntity> & start);

};


%extend IGESToBRep_TopoCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class IGESToBRep_TopoSurface *
*******************************/
class IGESToBRep_TopoSurface : public IGESToBRep_CurveAndSurface {
	public:
		/****************** IGESToBRep_TopoSurface ******************/
		%feature("compactdefaultargs") IGESToBRep_TopoSurface;
		%feature("autodoc", "Creates a tool toposurface ready to run, with epsilons set to 1.e-04, themodetopo to true, the optimization of the continuity to false.

Returns
-------
None
") IGESToBRep_TopoSurface;
		 IGESToBRep_TopoSurface();

		/****************** IGESToBRep_TopoSurface ******************/
		%feature("compactdefaultargs") IGESToBRep_TopoSurface;
		%feature("autodoc", "Creates a tool toposurface ready to run and sets its fields as cs's.

Parameters
----------
CS: IGESToBRep_CurveAndSurface

Returns
-------
None
") IGESToBRep_TopoSurface;
		 IGESToBRep_TopoSurface(const IGESToBRep_CurveAndSurface & CS);

		/****************** IGESToBRep_TopoSurface ******************/
		%feature("compactdefaultargs") IGESToBRep_TopoSurface;
		%feature("autodoc", "Creates a tool toposurface ready to run.

Parameters
----------
eps: float
epsGeom: float
epsCoeff: float
mode: bool
modeapprox: bool
optimized: bool

Returns
-------
None
") IGESToBRep_TopoSurface;
		 IGESToBRep_TopoSurface(const Standard_Real eps, const Standard_Real epsGeom, const Standard_Real epsCoeff, const Standard_Boolean mode, const Standard_Boolean modeapprox, const Standard_Boolean optimized);

		/****************** ParamSurface ******************/
		%feature("compactdefaultargs") ParamSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: IGESData_IGESEntity
trans: gp_Trsf2d

Returns
-------
uFact: float
") ParamSurface;
		TopoDS_Shape ParamSurface(const opencascade::handle<IGESData_IGESEntity> & start, gp_Trsf2d & trans, Standard_Real &OutValue);

		/****************** TransferBoundedSurface ******************/
		%feature("compactdefaultargs") TransferBoundedSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: IGESGeom_BoundedSurface

Returns
-------
TopoDS_Shape
") TransferBoundedSurface;
		TopoDS_Shape TransferBoundedSurface(const opencascade::handle<IGESGeom_BoundedSurface> & start);

		/****************** TransferOffsetSurface ******************/
		%feature("compactdefaultargs") TransferOffsetSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: IGESGeom_OffsetSurface

Returns
-------
TopoDS_Shape
") TransferOffsetSurface;
		TopoDS_Shape TransferOffsetSurface(const opencascade::handle<IGESGeom_OffsetSurface> & start);

		/****************** TransferPerforate ******************/
		%feature("compactdefaultargs") TransferPerforate;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: IGESBasic_SingleParent

Returns
-------
TopoDS_Shape
") TransferPerforate;
		TopoDS_Shape TransferPerforate(const opencascade::handle<IGESBasic_SingleParent> & start);

		/****************** TransferPlane ******************/
		%feature("compactdefaultargs") TransferPlane;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: IGESGeom_Plane

Returns
-------
TopoDS_Shape
") TransferPlane;
		TopoDS_Shape TransferPlane(const opencascade::handle<IGESGeom_Plane> & start);

		/****************** TransferRuledSurface ******************/
		%feature("compactdefaultargs") TransferRuledSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: IGESGeom_RuledSurface

Returns
-------
TopoDS_Shape
") TransferRuledSurface;
		TopoDS_Shape TransferRuledSurface(const opencascade::handle<IGESGeom_RuledSurface> & start);

		/****************** TransferSurfaceOfRevolution ******************/
		%feature("compactdefaultargs") TransferSurfaceOfRevolution;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: IGESGeom_SurfaceOfRevolution

Returns
-------
TopoDS_Shape
") TransferSurfaceOfRevolution;
		TopoDS_Shape TransferSurfaceOfRevolution(const opencascade::handle<IGESGeom_SurfaceOfRevolution> & start);

		/****************** TransferTabulatedCylinder ******************/
		%feature("compactdefaultargs") TransferTabulatedCylinder;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: IGESGeom_TabulatedCylinder

Returns
-------
TopoDS_Shape
") TransferTabulatedCylinder;
		TopoDS_Shape TransferTabulatedCylinder(const opencascade::handle<IGESGeom_TabulatedCylinder> & start);

		/****************** TransferTopoBasicSurface ******************/
		%feature("compactdefaultargs") TransferTopoBasicSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: IGESData_IGESEntity

Returns
-------
TopoDS_Shape
") TransferTopoBasicSurface;
		TopoDS_Shape TransferTopoBasicSurface(const opencascade::handle<IGESData_IGESEntity> & start);

		/****************** TransferTopoSurface ******************/
		%feature("compactdefaultargs") TransferTopoSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: IGESData_IGESEntity

Returns
-------
TopoDS_Shape
") TransferTopoSurface;
		TopoDS_Shape TransferTopoSurface(const opencascade::handle<IGESData_IGESEntity> & start);

		/****************** TransferTrimmedSurface ******************/
		%feature("compactdefaultargs") TransferTrimmedSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: IGESGeom_TrimmedSurface

Returns
-------
TopoDS_Shape
") TransferTrimmedSurface;
		TopoDS_Shape TransferTrimmedSurface(const opencascade::handle<IGESGeom_TrimmedSurface> & start);

};


%extend IGESToBRep_TopoSurface {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def TransferPlaneSurface(self):
		pass
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
