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
		/**** md5 signature: feddbf24cdb13433c4110df184cd1f49 ****/
		%feature("compactdefaultargs") AlgoContainer;
		%feature("autodoc", "Returns default algocontainer.

Returns
-------
opencascade::handle<IGESToBRep_AlgoContainer>
") AlgoContainer;
		static opencascade::handle<IGESToBRep_AlgoContainer> AlgoContainer();

		/****************** IGESCurveToSequenceOfIGESCurve ******************/
		/**** md5 signature: 65745dc7773939b6a54fc96657302a72 ****/
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
		/**** md5 signature: 342fdccc4643f67c269591c4b6447108 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Creates and initializes default algocontainer.

Returns
-------
None
") Init;
		static void Init();

		/****************** IsBRepEntity ******************/
		/**** md5 signature: 8c2bfa7b35a4b91f6ff083af713cb642 ****/
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
		/**** md5 signature: 42ec9ba034e2ab3c6c5dfcfcccd225d2 ****/
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
		/**** md5 signature: d0dc8dd41529b6d3fef6c4adced6727d ****/
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
		/**** md5 signature: b96b33689780417661991af3b76ddee1 ****/
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
		/**** md5 signature: 8beaa6c0e1d32256ba611244ed46c96d ****/
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
		/**** md5 signature: 6eadf76f141e5e89c1e625ef86dd94cb ****/
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
		/**** md5 signature: f97a13ed458b61baca8078e20e31170c ****/
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
		/**** md5 signature: fb764b640f6c6dda11eb0c634662ae4b ****/
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
		/**** md5 signature: fc44d22d9d7d0d075f53ef80b916167c ****/
		%feature("compactdefaultargs") IGESToBRep_Actor;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESToBRep_Actor;
		 IGESToBRep_Actor();

		/****************** GetContinuity ******************/
		/**** md5 signature: 0b4f25603c1871deb427d405a7545537 ****/
		%feature("compactdefaultargs") GetContinuity;
		%feature("autodoc", "Return 'thecontinuity'.

Returns
-------
int
") GetContinuity;
		Standard_Integer GetContinuity();

		/****************** Recognize ******************/
		/**** md5 signature: b84cbd6b814e0bcf2e581fe12af7f160 ****/
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
		/**** md5 signature: 470be06f7898b7685d1961bc19ca6a82 ****/
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
		/**** md5 signature: 70328a97cec44e457500ce3b002efc49 ****/
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
		/**** md5 signature: d3a576f6c6d265b51c604b4f3e7b52c0 ****/
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
		/**** md5 signature: ff38c5c7287c4c23a2ef8bba63f8adbd ****/
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
		/**** md5 signature: e1f94e0db0d22f16fefa382fbf803daf ****/
		%feature("compactdefaultargs") IGESToBRep_AlgoContainer;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") IGESToBRep_AlgoContainer;
		 IGESToBRep_AlgoContainer();

		/****************** SetToolContainer ******************/
		/**** md5 signature: 3028abcb0607b848f973e94845232d20 ****/
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
		/**** md5 signature: 78fafefe662061a6329898ed8d24eb1d ****/
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
		/**** md5 signature: 2ec76a48725808840348b75a0ddab5f4 ****/
		%feature("compactdefaultargs") IGESToBRep_CurveAndSurface;
		%feature("autodoc", "Creates a tool curveandsurface ready to run, with epsilons set to 1.e-04, mymodetopo to true, the optimization of the continuity to false.

Returns
-------
None
") IGESToBRep_CurveAndSurface;
		 IGESToBRep_CurveAndSurface();

		/****************** IGESToBRep_CurveAndSurface ******************/
		/**** md5 signature: 25a63dcc0d3168d39324604dfdc37c7f ****/
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
		/**** md5 signature: 3289f045564ae617fdf61d89466ccf9a ****/
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
		/**** md5 signature: 275dfa4591cf41b9295dcebd1309477d ****/
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
		/**** md5 signature: 0b4f25603c1871deb427d405a7545537 ****/
		%feature("compactdefaultargs") GetContinuity;
		%feature("autodoc", "Returns the value of 'mycontinuity'.

Returns
-------
int
") GetContinuity;
		Standard_Integer GetContinuity();

		/****************** GetEpsCoeff ******************/
		/**** md5 signature: c204a956b9d0d3cc698fcb30e25bdaa9 ****/
		%feature("compactdefaultargs") GetEpsCoeff;
		%feature("autodoc", "Returns the value of 'myepscoeff'.

Returns
-------
float
") GetEpsCoeff;
		Standard_Real GetEpsCoeff();

		/****************** GetEpsGeom ******************/
		/**** md5 signature: 9d8b1eb39afec6647761e73d0dd51496 ****/
		%feature("compactdefaultargs") GetEpsGeom;
		%feature("autodoc", "Returns the value of 'myepsgeom'.

Returns
-------
float
") GetEpsGeom;
		Standard_Real GetEpsGeom();

		/****************** GetEpsilon ******************/
		/**** md5 signature: ba14a5e7d625b3badf7695ef1b2ba5c0 ****/
		%feature("compactdefaultargs") GetEpsilon;
		%feature("autodoc", "Returns the value of 'myeps'.

Returns
-------
float
") GetEpsilon;
		Standard_Real GetEpsilon();

		/****************** GetMaxTol ******************/
		/**** md5 signature: 7fc3a4caa1b58b329366bc57a26784b9 ****/
		%feature("compactdefaultargs") GetMaxTol;
		%feature("autodoc", "Returns the value of 'mymaxtol'.

Returns
-------
float
") GetMaxTol;
		Standard_Real GetMaxTol();

		/****************** GetMinTol ******************/
		/**** md5 signature: 43a94bcf9245d3d5ba9ccae07929c24f ****/
		%feature("compactdefaultargs") GetMinTol;
		%feature("autodoc", "Returns the value of 'mymintol'.

Returns
-------
float
") GetMinTol;
		Standard_Real GetMinTol();

		/****************** GetModeApprox ******************/
		/**** md5 signature: 57c1a60849ce01d412739423b3997463 ****/
		%feature("compactdefaultargs") GetModeApprox;
		%feature("autodoc", "Returns the value of 'mymodeapprox'.

Returns
-------
bool
") GetModeApprox;
		Standard_Boolean GetModeApprox();

		/****************** GetModeTransfer ******************/
		/**** md5 signature: cae1417d18afbdb49419602577ed1b09 ****/
		%feature("compactdefaultargs") GetModeTransfer;
		%feature("autodoc", "Returns the value of 'mymodeistopo'.

Returns
-------
bool
") GetModeTransfer;
		Standard_Boolean GetModeTransfer();

		/****************** GetModel ******************/
		/**** md5 signature: 903699a7f01ab7b92813659a6c19f871 ****/
		%feature("compactdefaultargs") GetModel;
		%feature("autodoc", "Returns the value of 'mymodel'.

Returns
-------
opencascade::handle<IGESData_IGESModel>
") GetModel;
		opencascade::handle<IGESData_IGESModel> GetModel();

		/****************** GetOptimized ******************/
		/**** md5 signature: 6cc15b4504712321a48092d75ef058cf ****/
		%feature("compactdefaultargs") GetOptimized;
		%feature("autodoc", "Returns the value of 'mycontisopti'.

Returns
-------
bool
") GetOptimized;
		Standard_Boolean GetOptimized();

		/****************** GetShapeResult ******************/
		/**** md5 signature: 2c0dddc40e78c0b007a111811f6ebae6 ****/
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
		/**** md5 signature: 0ee811b8d4522d9c2d151ff707425b8d ****/
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
		/**** md5 signature: 245956d7f4e7d4a0983cc2b079dad792 ****/
		%feature("compactdefaultargs") GetSurfaceCurve;
		%feature("autodoc", "Returns the value of ' mysurfacecurve' 0 = value in file , 2 = kepp 2d and compute 3d 3 = keep 3d and compute 2d.

Returns
-------
int
") GetSurfaceCurve;
		Standard_Integer GetSurfaceCurve();

		/****************** GetTransferProcess ******************/
		/**** md5 signature: 484ad8a57f2aacc305eaf2d838f8a63f ****/
		%feature("compactdefaultargs") GetTransferProcess;
		%feature("autodoc", "Returns the value of 'mymsgreg'.

Returns
-------
opencascade::handle<Transfer_TransientProcess>
") GetTransferProcess;
		opencascade::handle<Transfer_TransientProcess> GetTransferProcess();

		/****************** GetUVResolution ******************/
		/**** md5 signature: 4c0bd69a9805b0fe0ef7c0cbf6764a46 ****/
		%feature("compactdefaultargs") GetUVResolution;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") GetUVResolution;
		Standard_Real GetUVResolution();

		/****************** GetUnitFactor ******************/
		/**** md5 signature: 1bd8c1322b189bf3e2c3314e8178ff2c ****/
		%feature("compactdefaultargs") GetUnitFactor;
		%feature("autodoc", "Returns the value of ' myunitfactor'.

Returns
-------
float
") GetUnitFactor;
		Standard_Real GetUnitFactor();

		/****************** HasShapeResult ******************/
		/**** md5 signature: 9cf61c3441f129b9bcdd0863a06ddb72 ****/
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
		/**** md5 signature: 0de93ef32c53d091768788dca0e281fd ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes the field of the tool curveandsurface with default creating values.

Returns
-------
None
") Init;
		void Init();

		/****************** NbShapeResult ******************/
		/**** md5 signature: 4a28dd0824cbd970cbb0482ca2600d07 ****/
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
		/**** md5 signature: d91bf8a921edee5188c0d2a21dcb288a ****/
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
		/**** md5 signature: a69268325fa3f73aa7b627f715d61e13 ****/
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
		/**** md5 signature: c4d34cc5fedb748cd665a916797fbfe5 ****/
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
		/**** md5 signature: 9187b28bfccce807d514c1d431185e5d ****/
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
		/**** md5 signature: 0aadb35c43e5a4c71f14be3063a6efc3 ****/
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
		/**** md5 signature: cc2e4e8d49a550d708522faa66bb351d ****/
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
		/**** md5 signature: d7959f9ce73ddf6898c8522f4f76d8ee ****/
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
		/**** md5 signature: 954fbf5be5bad9962916cfa44f9cf313 ****/
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
		/**** md5 signature: d8e700e8230950a60d86d32faa489e7d ****/
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
		/**** md5 signature: 7ef6d9de409347aa1041d0c1315e8421 ****/
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
		/**** md5 signature: a465a6656aef745cafcc53a1111ee4a7 ****/
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
		/**** md5 signature: 57ee68a1eb65ee7bf7cf629e19bb0af7 ****/
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
		/**** md5 signature: 8a8e72b5ec5f0e419be7985230ab37fa ****/
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
		/**** md5 signature: 267d07a0f7a85d681f1f9d0bef937a08 ****/
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
		/**** md5 signature: 8b3103623aaabd28dc76037a38d35e3b ****/
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
		/**** md5 signature: 0afd37178088d8096d3ea47598f1cb96 ****/
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
		/**** md5 signature: 45265907d5b7c14270813a8de762d306 ****/
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
		/**** md5 signature: 352bd890213763e77e08756c09e1fdcc ****/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_Surface>
") Surface;
		opencascade::handle<Geom_Surface> Surface();

		/****************** TransferCurveAndSurface ******************/
		/**** md5 signature: 25777c4404f1eeed12c0604f14b70581 ****/
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
		/**** md5 signature: 41cb2025439518e73f2b4e8123a5b583 ****/
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
		/**** md5 signature: e07c9dafbe1f0852a554a1e076ae56d7 ****/
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
		/**** md5 signature: b90297cbd15aa28a6ce0a3aeef8adc3e ****/
		%feature("compactdefaultargs") IGESToBRep_IGESBoundary;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") IGESToBRep_IGESBoundary;
		 IGESToBRep_IGESBoundary();

		/****************** IGESToBRep_IGESBoundary ******************/
		/**** md5 signature: 07f665a8b71df900f28d0fc8c3d09c73 ****/
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
		/**** md5 signature: 027657193f5e5111dd7aeaf0088d6b9b ****/
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
		/**** md5 signature: 148fc431c88cb36e40549c966cc1a5e5 ****/
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
		/**** md5 signature: 25557cd2dfa0962b0166f6d661b341b3 ****/
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
		/**** md5 signature: 63bf6e1ebab45a7a19c876f2d6ef2e81 ****/
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
		/**** md5 signature: 8eebf0143620bf74880205da954b56c6 ****/
		%feature("compactdefaultargs") WireData;
		%feature("autodoc", "Returns the resulting wire.

Returns
-------
opencascade::handle<ShapeExtend_WireData>
") WireData;
		opencascade::handle<ShapeExtend_WireData> WireData();

		/****************** WireData2d ******************/
		/**** md5 signature: f13b6c48a5d56ce535e5140fc6c3c4ac ****/
		%feature("compactdefaultargs") WireData2d;
		%feature("autodoc", "Returns the the wire from 2d curves (edges contain pcurves only).

Returns
-------
opencascade::handle<ShapeExtend_WireData>
") WireData2d;
		opencascade::handle<ShapeExtend_WireData> WireData2d();

		/****************** WireData3d ******************/
		/**** md5 signature: 1489e41fabbf7e3db87e75bc69d714af ****/
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
		/**** md5 signature: 676d0890a7b7b243ad3368dab54548af ****/
		%feature("compactdefaultargs") IGESToBRep_Reader;
		%feature("autodoc", "Creates a reader.

Returns
-------
None
") IGESToBRep_Reader;
		 IGESToBRep_Reader();

		/****************** Actor ******************/
		/**** md5 signature: 5c9d4b5e403375917b4029c880d486d0 ****/
		%feature("compactdefaultargs") Actor;
		%feature("autodoc", "Returns 'theactor'.

Returns
-------
opencascade::handle<IGESToBRep_Actor>
") Actor;
		opencascade::handle<IGESToBRep_Actor> Actor();

		/****************** Check ******************/
		/**** md5 signature: 7b14bce12a830fb5ee4559367746d91f ****/
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
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears the results between two translation operations.

Returns
-------
None
") Clear;
		void Clear();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the last transfer/transferroots was a success.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** LoadFile ******************/
		/**** md5 signature: 5af3a407ab114cf12389b88dfb5d215e ****/
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
		/**** md5 signature: 4b3130e3b28afba6f0c58ab4875c4253 ****/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Returns the model to be worked on.

Returns
-------
opencascade::handle<IGESData_IGESModel>
") Model;
		opencascade::handle<IGESData_IGESModel> Model();

		/****************** NbShapes ******************/
		/**** md5 signature: ea90d1514db96ad18becf0e04a33abf6 ****/
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", "Returns the number of shapes produced by the translation.

Returns
-------
int
") NbShapes;
		Standard_Integer NbShapes();

		/****************** OneShape ******************/
		/**** md5 signature: 1fc1610db08b4eec83d275771d406ea5 ****/
		%feature("compactdefaultargs") OneShape;
		%feature("autodoc", "Returns all of the results in a single shape which is: - a null shape if there are no results, - a shape if there is one result, - a compound containing the resulting shapes if there are several.

Returns
-------
TopoDS_Shape
") OneShape;
		TopoDS_Shape OneShape();

		/****************** SetModel ******************/
		/**** md5 signature: 57ee68a1eb65ee7bf7cf629e19bb0af7 ****/
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
		/**** md5 signature: 9c0acd3b342d08985d434686c53eeecd ****/
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
		/**** md5 signature: b325565d748ea0ef38fee9bdb447c4a9 ****/
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
		/**** md5 signature: 6d47b9605ccb70e3833586a3aeea50b5 ****/
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
		/**** md5 signature: 990690dc2ffdd58e186d305e110e445b ****/
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
		/**** md5 signature: cda5aa33365159e82c6213003de44419 ****/
		%feature("compactdefaultargs") TransientProcess;
		%feature("autodoc", "Returns the transientprocess.

Returns
-------
opencascade::handle<Transfer_TransientProcess>
") TransientProcess;
		opencascade::handle<Transfer_TransientProcess> TransientProcess();

		/****************** UsedTolerance ******************/
		/**** md5 signature: ff38c5c7287c4c23a2ef8bba63f8adbd ****/
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
		/**** md5 signature: 72453f26bc02ff130a3542f03ca6dc91 ****/
		%feature("compactdefaultargs") IGESToBRep_ToolContainer;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") IGESToBRep_ToolContainer;
		 IGESToBRep_ToolContainer();

		/****************** IGESBoundary ******************/
		/**** md5 signature: 2fdb99006a3dfa88ef5ed9cde67cadda ****/
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
		/**** md5 signature: fe1f96121d1dcd57fc16089d8af5178a ****/
		%feature("compactdefaultargs") IGESToBRep_BRepEntity;
		%feature("autodoc", "Creates a tool brepentity ready to run, with epsilons set to 1.e-04, themodetopo to true, the optimization of the continuity to false.

Returns
-------
None
") IGESToBRep_BRepEntity;
		 IGESToBRep_BRepEntity();

		/****************** IGESToBRep_BRepEntity ******************/
		/**** md5 signature: d43a04cf2fe0b8bfd3eaf36701cb2676 ****/
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
		/**** md5 signature: 9263e28b27c52f61a248876fb4480b86 ****/
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
		/**** md5 signature: 32c64ac6073af830c90bc5d7cb352a6a ****/
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
		/**** md5 signature: 3b5e6a2863f17677c7e3f7184aeed45b ****/
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
		/**** md5 signature: b0851b2d63f2853ef5f04982570b18c8 ****/
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
		/**** md5 signature: 70d8121d0dce3647362ac210d42a9813 ****/
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
		/**** md5 signature: d632752f1963e95849afe0fe178fec9d ****/
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
		/**** md5 signature: f86289f89929f0a5a4a5a0d97d2ca06e ****/
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
		/**** md5 signature: a93d4f312a0873203e823c7b4949940e ****/
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
		/**** md5 signature: 68d8978aaf4a5d05029944585f6999ab ****/
		%feature("compactdefaultargs") IGESToBRep_BasicCurve;
		%feature("autodoc", "Creates a tool basiccurve ready to run, with epsilons set to 1.e-04, themodetopo to true, the optimization of the continuity to false.

Returns
-------
None
") IGESToBRep_BasicCurve;
		 IGESToBRep_BasicCurve();

		/****************** IGESToBRep_BasicCurve ******************/
		/**** md5 signature: fbe3a0d0ae5f8a9b24a19f0474506314 ****/
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
		/**** md5 signature: bd02aac0862c60a651cc52850058c2c9 ****/
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
		/**** md5 signature: 88875766cbf6aa0ea56b60f173e78a44 ****/
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
		/**** md5 signature: 7ff7d7c34ddfb5c3ff97d7993295b8eb ****/
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
		/**** md5 signature: 5baf56201a2c8f65a18b8e88b4cd9fe7 ****/
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
		/**** md5 signature: 8144d083508d7482eff38d76bf671173 ****/
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
		/**** md5 signature: 7d4b8c0dbec52f28a32ed3f713459fda ****/
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
		/**** md5 signature: 4a668a5f1a4e7117a2416a5203551949 ****/
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
		/**** md5 signature: 0d22fff951d2ee540bb5f3c0c9d00c67 ****/
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
		/**** md5 signature: 6fb9231af9b283d9ffbe2fdfc95331f3 ****/
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
		/**** md5 signature: 9e50ce03cce9305efee92e50d9637baf ****/
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
		/**** md5 signature: 414b2efae96103e11a3dd7e1376cfb8f ****/
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
		/**** md5 signature: 9bf10750695e7b43e1903191373f7207 ****/
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
		/**** md5 signature: 71ca2f96b9552305e6cda39d32a3cd66 ****/
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
		/**** md5 signature: f726347aa052dbc9cf0e4f09627f91ac ****/
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
		/**** md5 signature: 549f24b93cbd1cf1382beb1e3eecd34a ****/
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
		/**** md5 signature: dc16109debdb479862d603db2aa25282 ****/
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
		/**** md5 signature: aa2bb25222b9eb5b47ef4d4496df17d5 ****/
		%feature("compactdefaultargs") IGESToBRep_BasicSurface;
		%feature("autodoc", "Creates a tool basicsurface ready to run, with epsilons set to 1.e-04, themodetopo to true, the optimization of the continuity to false.

Returns
-------
None
") IGESToBRep_BasicSurface;
		 IGESToBRep_BasicSurface();

		/****************** IGESToBRep_BasicSurface ******************/
		/**** md5 signature: fc2e06afe2be787d7bcb05be2085e8bd ****/
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
		/**** md5 signature: d628b2c56c29aa46e003790cbdd5acc5 ****/
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
		/**** md5 signature: 6f986be59ffad8d912ca9bc145330b80 ****/
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
		/**** md5 signature: d474fcac88568463bac1af7b1b00f5ad ****/
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
		/**** md5 signature: 2dc0fec5d663ef8184fbdedc63835c00 ****/
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
		/**** md5 signature: ffa494667ebcfc55698bbc74c2df3e62 ****/
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
		/**** md5 signature: 647a61ea89b6e94f7e0ea1b0e3397b1a ****/
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
		/**** md5 signature: e27706f05b86cf919954067355d7e37a ****/
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
		/**** md5 signature: 7c60488b9fd6d9d70c76c5657fbec318 ****/
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
		/**** md5 signature: 790209401c0642f4b97f0279a92e4514 ****/
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
		/**** md5 signature: 5905e9d131b1bbbc6c8a8ec087e26bbe ****/
		%feature("compactdefaultargs") IGESToBRep_TopoCurve;
		%feature("autodoc", "Creates a tool topocurve ready to run, with epsilons set to 1.e-04, themodetopo to true, the optimization of the continuity to false.

Returns
-------
None
") IGESToBRep_TopoCurve;
		 IGESToBRep_TopoCurve();

		/****************** IGESToBRep_TopoCurve ******************/
		/**** md5 signature: 9336ae043fe4783641aca5a818befae8 ****/
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
		/**** md5 signature: ba923dda0ad2c4a0d7ea691406bb3b0c ****/
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
		/**** md5 signature: 83267c32fead13b314685507e4cbbbcb ****/
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
		/**** md5 signature: 1fc20fa25774afe1a271c33f05538dd1 ****/
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
		/**** md5 signature: 4ebe96fc50f5e914b652028984a1f908 ****/
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
		/**** md5 signature: 8bb65c1a2d4633080430d3288721789c ****/
		%feature("compactdefaultargs") BadCase;
		%feature("autodoc", "Returns thebadcase flag.

Returns
-------
bool
") BadCase;
		Standard_Boolean BadCase();

		/****************** Curve ******************/
		/**** md5 signature: d316d2ea9db7b953425d17116942f382 ****/
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
		/**** md5 signature: f26a67580b3de0aa28c74c8652e42a0d ****/
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
		/**** md5 signature: f7f6dbd981df076443155a5a87b5c223 ****/
		%feature("compactdefaultargs") NbCurves;
		%feature("autodoc", "Returns the count of curves in 'thecurves'.

Returns
-------
int
") NbCurves;
		Standard_Integer NbCurves();

		/****************** NbCurves2d ******************/
		/**** md5 signature: 91ae967daa54efe7d38afad4a5698e5b ****/
		%feature("compactdefaultargs") NbCurves2d;
		%feature("autodoc", "Returns the count of curves in 'thecurves2d'.

Returns
-------
int
") NbCurves2d;
		Standard_Integer NbCurves2d();

		/****************** SetBadCase ******************/
		/**** md5 signature: d69c1dd781117594f737163beb8e3622 ****/
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
		/**** md5 signature: 50571025c2f9fba62d153fcb9ddb5daf ****/
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
		/**** md5 signature: 9ea4c99db8c34571c2ef39a903cf73d7 ****/
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
		/**** md5 signature: 8b6a02abc1ea12f9aac834fa5cfef25c ****/
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
		/**** md5 signature: f58ce375e1a9a395360ffc66a55dfbd7 ****/
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
		/**** md5 signature: cb3566ae78ebb9677e83501e8b4f2370 ****/
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
		/**** md5 signature: 87f81e705a30e13f19d5a656c2feb8d1 ****/
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
		/**** md5 signature: 86ea50d86504a76a142cb4b3d25690a5 ****/
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
		/**** md5 signature: 02ea0f91402ea059120e0d790cec9c61 ****/
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
		/**** md5 signature: 8597142ab2de0e4f72aa727aac30c58f ****/
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
		/**** md5 signature: 822da9dbb534bf8f993399d42a587c44 ****/
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
		/**** md5 signature: 4980d87d4ba26ce8b0b2f44cc510e1f5 ****/
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
		/**** md5 signature: b3a00bc4c6242d9ad4758d6e5383d16f ****/
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
		/**** md5 signature: e1895b0c6392eb146ee0ec5248f55490 ****/
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
		/**** md5 signature: 378732f6e2dddbf6eedd159efb8170dd ****/
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
		/**** md5 signature: bfc36dea9a49886678abd5076f8e15e1 ****/
		%feature("compactdefaultargs") IGESToBRep_TopoSurface;
		%feature("autodoc", "Creates a tool toposurface ready to run, with epsilons set to 1.e-04, themodetopo to true, the optimization of the continuity to false.

Returns
-------
None
") IGESToBRep_TopoSurface;
		 IGESToBRep_TopoSurface();

		/****************** IGESToBRep_TopoSurface ******************/
		/**** md5 signature: 7bdb5756ed223c60394d971ac4bed14e ****/
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
		/**** md5 signature: a845555ae49db6f185495a4d4ba78aa0 ****/
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
		/**** md5 signature: b3e4a7c92297ca8291587daef1260389 ****/
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
		/**** md5 signature: e3ce1095b68cabf9ae4e640c0ef5d57d ****/
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
		/**** md5 signature: 83213cd303e7a7262d80105a6aef1f60 ****/
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
		/**** md5 signature: 50c686c9068994095b14c9b17147dce7 ****/
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
		/**** md5 signature: 948cfd286972c900b81f7646b557c3f6 ****/
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
		/**** md5 signature: 63e377fa91f443109b7c8222635638e3 ****/
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
		/**** md5 signature: e49e4945d0964d014c9dcc7773ea36d7 ****/
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
		/**** md5 signature: 6483d2a11ee32a152cc9f29fab034ed5 ****/
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
		/**** md5 signature: 17f0d1f83ae041d5f27d0e10d172769e ****/
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
		/**** md5 signature: 3d99942c57af47ffaa5b09461bcfe7de ****/
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
		/**** md5 signature: 4f3609efd12d6cb8fbfb64d2097b849b ****/
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
