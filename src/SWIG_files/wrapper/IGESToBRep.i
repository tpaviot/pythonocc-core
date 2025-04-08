/*
Copyright 2008-2024 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_igestobrep.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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
#include<DE_module.hxx>
#include<Geom2d_module.hxx>
#include<TColGeom_module.hxx>
#include<TopTools_module.hxx>
#include<MoniTool_module.hxx>
#include<BRep_module.hxx>
#include<TShort_module.hxx>
#include<Poly_module.hxx>
#include<Bnd_module.hxx>
#include<BRep_module.hxx>
#include<Poly_module.hxx>
#include<BRepTools_module.hxx>
#include<TDF_module.hxx>
#include<IFSelect_module.hxx>
#include<TDocStd_module.hxx>
#include<XSControl_module.hxx>
#include<PCDM_module.hxx>
#include<CDF_module.hxx>
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
%import DE.i
%import Geom2d.i

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
		/****** IGESToBRep::AlgoContainer ******/
		/****** md5 signature: feddbf24cdb13433c4110df184cd1f49 ******/
		%feature("compactdefaultargs") AlgoContainer;
		%feature("autodoc", "Return
-------
opencascade::handle<IGESToBRep_AlgoContainer>

Description
-----------
Returns default AlgoContainer.
") AlgoContainer;
		static opencascade::handle<IGESToBRep_AlgoContainer> AlgoContainer();

		/****** IGESToBRep::IGESCurveToSequenceOfIGESCurve ******/
		/****** md5 signature: 65745dc7773939b6a54fc96657302a72 ******/
		%feature("compactdefaultargs") IGESCurveToSequenceOfIGESCurve;
		%feature("autodoc", "
Parameters
----------
curve: IGESData_IGESEntity
sequence: TColStd_HSequenceOfTransient

Return
-------
int

Description
-----------
No available documentation.
") IGESCurveToSequenceOfIGESCurve;
		static Standard_Integer IGESCurveToSequenceOfIGESCurve(const opencascade::handle<IGESData_IGESEntity> & curve, opencascade::handle<TColStd_HSequenceOfTransient> & sequence);

		/****** IGESToBRep::Init ******/
		/****** md5 signature: 342fdccc4643f67c269591c4b6447108 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates and initializes default AlgoContainer.
") Init;
		static void Init();

		/****** IGESToBRep::IsBRepEntity ******/
		/****** md5 signature: 8c2bfa7b35a4b91f6ff083af713cb642 ******/
		%feature("compactdefaultargs") IsBRepEntity;
		%feature("autodoc", "
Parameters
----------
start: IGESData_IGESEntity

Return
-------
bool

Description
-----------
Return True if the IGESEntity can be transferred by TransferBRepEntity. ex: VertexList, EdgeList, Loop, Face, Shell, Manifold Solid BRep Object from IGESSolid: 502, 504, 508, 510, 514, 186.
") IsBRepEntity;
		static Standard_Boolean IsBRepEntity(const opencascade::handle<IGESData_IGESEntity> & start);

		/****** IGESToBRep::IsBasicCurve ******/
		/****** md5 signature: 42ec9ba034e2ab3c6c5dfcfcccd225d2 ******/
		%feature("compactdefaultargs") IsBasicCurve;
		%feature("autodoc", "
Parameters
----------
start: IGESData_IGESEntity

Return
-------
bool

Description
-----------
Return True if the IGESEntity can be transferred by TransferBasicCurve. ex: CircularArc, ConicArc, Line, CopiousData, BSplineCurve, SplineCurve... from IGESGeom: 104,110,112,126.
") IsBasicCurve;
		static Standard_Boolean IsBasicCurve(const opencascade::handle<IGESData_IGESEntity> & start);

		/****** IGESToBRep::IsBasicSurface ******/
		/****** md5 signature: d0dc8dd41529b6d3fef6c4adced6727d ******/
		%feature("compactdefaultargs") IsBasicSurface;
		%feature("autodoc", "
Parameters
----------
start: IGESData_IGESEntity

Return
-------
bool

Description
-----------
Return True if the IGESEntity can be transferred by TransferBasicSurface. ex: BSplineSurface, SplineSurface... from IGESGeom: 114,128.
") IsBasicSurface;
		static Standard_Boolean IsBasicSurface(const opencascade::handle<IGESData_IGESEntity> & start);

		/****** IGESToBRep::IsCurveAndSurface ******/
		/****** md5 signature: b96b33689780417661991af3b76ddee1 ******/
		%feature("compactdefaultargs") IsCurveAndSurface;
		%feature("autodoc", "
Parameters
----------
start: IGESData_IGESEntity

Return
-------
bool

Description
-----------
Return True if the IGESEntity can be transferred by TransferCurveAndSurface. ex: All IGESEntity from IGESGeom.
") IsCurveAndSurface;
		static Standard_Boolean IsCurveAndSurface(const opencascade::handle<IGESData_IGESEntity> & start);

		/****** IGESToBRep::IsTopoCurve ******/
		/****** md5 signature: 8beaa6c0e1d32256ba611244ed46c96d ******/
		%feature("compactdefaultargs") IsTopoCurve;
		%feature("autodoc", "
Parameters
----------
start: IGESData_IGESEntity

Return
-------
bool

Description
-----------
Return True if the IGESEntity can be transferred by TransferTopoCurve. ex: all Curves from IGESGeom: all basic curves,102,130,142,144.
") IsTopoCurve;
		static Standard_Boolean IsTopoCurve(const opencascade::handle<IGESData_IGESEntity> & start);

		/****** IGESToBRep::IsTopoSurface ******/
		/****** md5 signature: 6eadf76f141e5e89c1e625ef86dd94cb ******/
		%feature("compactdefaultargs") IsTopoSurface;
		%feature("autodoc", "
Parameters
----------
start: IGESData_IGESEntity

Return
-------
bool

Description
-----------
Return True if the IGESEntity can be transferred by TransferTopoSurface. ex: All Surfaces from IGESGeom: all basic surfaces,108,118,120,122,141,143.
") IsTopoSurface;
		static Standard_Boolean IsTopoSurface(const opencascade::handle<IGESData_IGESEntity> & start);

		/****** IGESToBRep::SetAlgoContainer ******/
		/****** md5 signature: f97a13ed458b61baca8078e20e31170c ******/
		%feature("compactdefaultargs") SetAlgoContainer;
		%feature("autodoc", "
Parameters
----------
aContainer: IGESToBRep_AlgoContainer

Return
-------
None

Description
-----------
Sets default AlgoContainer.
") SetAlgoContainer;
		static void SetAlgoContainer(const opencascade::handle<IGESToBRep_AlgoContainer> & aContainer);

		/****** IGESToBRep::TransferPCurve ******/
		/****** md5 signature: fb764b640f6c6dda11eb0c634662ae4b ******/
		%feature("compactdefaultargs") TransferPCurve;
		%feature("autodoc", "
Parameters
----------
fromedge: TopoDS_Edge
toedge: TopoDS_Edge
face: TopoDS_Face

Return
-------
bool

Description
-----------
No available documentation.
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
		/****** IGESToBRep_Actor::IGESToBRep_Actor ******/
		/****** md5 signature: fc44d22d9d7d0d075f53ef80b916167c ******/
		%feature("compactdefaultargs") IGESToBRep_Actor;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") IGESToBRep_Actor;
		 IGESToBRep_Actor();

		/****** IGESToBRep_Actor::GetContinuity ******/
		/****** md5 signature: 0b4f25603c1871deb427d405a7545537 ******/
		%feature("compactdefaultargs") GetContinuity;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return 'thecontinuity'.
") GetContinuity;
		Standard_Integer GetContinuity();

		/****** IGESToBRep_Actor::Recognize ******/
		/****** md5 signature: b84cbd6b814e0bcf2e581fe12af7f160 ******/
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", "
Parameters
----------
start: Standard_Transient

Return
-------
bool

Description
-----------
No available documentation.
") Recognize;
		virtual Standard_Boolean Recognize(const opencascade::handle<Standard_Transient> & start);

		/****** IGESToBRep_Actor::SetContinuity ******/
		/****** md5 signature: 470be06f7898b7685d1961bc19ca6a82 ******/
		%feature("compactdefaultargs") SetContinuity;
		%feature("autodoc", "
Parameters
----------
continuity: int (optional, default to 0)

Return
-------
None

Description
-----------
---Purpose By default continuity = 0 if continuity = 1: try C1 if continuity = 2: try C2.
") SetContinuity;
		void SetContinuity(const Standard_Integer continuity = 0);

		/****** IGESToBRep_Actor::SetModel ******/
		/****** md5 signature: 70328a97cec44e457500ce3b002efc49 ******/
		%feature("compactdefaultargs") SetModel;
		%feature("autodoc", "
Parameters
----------
model: Interface_InterfaceModel

Return
-------
None

Description
-----------
No available documentation.
") SetModel;
		void SetModel(const opencascade::handle<Interface_InterfaceModel> & model);

		/****** IGESToBRep_Actor::Transfer ******/
		/****** md5 signature: e4303fa9409798bd20ec402569b65ae8 ******/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "
Parameters
----------
start: Standard_Transient
TP: Transfer_TransientProcess
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
opencascade::handle<Transfer_Binder>

Description
-----------
No available documentation.
") Transfer;
		virtual opencascade::handle<Transfer_Binder> Transfer(const opencascade::handle<Standard_Transient> & start, const opencascade::handle<Transfer_TransientProcess> & TP, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** IGESToBRep_Actor::UsedTolerance ******/
		/****** md5 signature: ff38c5c7287c4c23a2ef8bba63f8adbd ******/
		%feature("compactdefaultargs") UsedTolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the tolerance which was actually used, either from the file or from statics.
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
		/****** IGESToBRep_AlgoContainer::IGESToBRep_AlgoContainer ******/
		/****** md5 signature: e1f94e0db0d22f16fefa382fbf803daf ******/
		%feature("compactdefaultargs") IGESToBRep_AlgoContainer;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") IGESToBRep_AlgoContainer;
		 IGESToBRep_AlgoContainer();

		/****** IGESToBRep_AlgoContainer::SetToolContainer ******/
		/****** md5 signature: 3028abcb0607b848f973e94845232d20 ******/
		%feature("compactdefaultargs") SetToolContainer;
		%feature("autodoc", "
Parameters
----------
TC: IGESToBRep_ToolContainer

Return
-------
None

Description
-----------
Sets ToolContainer.
") SetToolContainer;
		void SetToolContainer(const opencascade::handle<IGESToBRep_ToolContainer> & TC);

		/****** IGESToBRep_AlgoContainer::ToolContainer ******/
		/****** md5 signature: 78fafefe662061a6329898ed8d24eb1d ******/
		%feature("compactdefaultargs") ToolContainer;
		%feature("autodoc", "Return
-------
opencascade::handle<IGESToBRep_ToolContainer>

Description
-----------
Returns ToolContainer.
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
		/****** IGESToBRep_CurveAndSurface::IGESToBRep_CurveAndSurface ******/
		/****** md5 signature: 2ec76a48725808840348b75a0ddab5f4 ******/
		%feature("compactdefaultargs") IGESToBRep_CurveAndSurface;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a tool CurveAndSurface ready to run, with epsilons set to 1.E-04, myModeTopo to True, the optimization of the continuity to False.
") IGESToBRep_CurveAndSurface;
		 IGESToBRep_CurveAndSurface();

		/****** IGESToBRep_CurveAndSurface::IGESToBRep_CurveAndSurface ******/
		/****** md5 signature: 3289f045564ae617fdf61d89466ccf9a ******/
		%feature("compactdefaultargs") IGESToBRep_CurveAndSurface;
		%feature("autodoc", "
Parameters
----------
eps: float
epsGeom: float
epsCoeff: float
mode: bool
modeapprox: bool
optimized: bool

Return
-------
None

Description
-----------
Creates a tool CurveAndSurface ready to run.
") IGESToBRep_CurveAndSurface;
		 IGESToBRep_CurveAndSurface(const Standard_Real eps, const Standard_Real epsGeom, const Standard_Real epsCoeff, const Standard_Boolean mode, const Standard_Boolean modeapprox, const Standard_Boolean optimized);

		/****** IGESToBRep_CurveAndSurface::AddShapeResult ******/
		/****** md5 signature: 275dfa4591cf41b9295dcebd1309477d ******/
		%feature("compactdefaultargs") AddShapeResult;
		%feature("autodoc", "
Parameters
----------
start: IGESData_IGESEntity
result: TopoDS_Shape

Return
-------
None

Description
-----------
set in 'myMap' the result of the transfer of the entity of the IGESEntity start ( type VertexList or EdgeList).
") AddShapeResult;
		void AddShapeResult(const opencascade::handle<IGESData_IGESEntity> & start, const TopoDS_Shape & result);

		/****** IGESToBRep_CurveAndSurface::GetContinuity ******/
		/****** md5 signature: 0b4f25603c1871deb427d405a7545537 ******/
		%feature("compactdefaultargs") GetContinuity;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the value of 'myContinuity'.
") GetContinuity;
		Standard_Integer GetContinuity();

		/****** IGESToBRep_CurveAndSurface::GetEpsCoeff ******/
		/****** md5 signature: c204a956b9d0d3cc698fcb30e25bdaa9 ******/
		%feature("compactdefaultargs") GetEpsCoeff;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the value of 'myEpsCoeff'.
") GetEpsCoeff;
		Standard_Real GetEpsCoeff();

		/****** IGESToBRep_CurveAndSurface::GetEpsGeom ******/
		/****** md5 signature: 9d8b1eb39afec6647761e73d0dd51496 ******/
		%feature("compactdefaultargs") GetEpsGeom;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the value of 'myEpsGeom'.
") GetEpsGeom;
		Standard_Real GetEpsGeom();

		/****** IGESToBRep_CurveAndSurface::GetEpsilon ******/
		/****** md5 signature: ba14a5e7d625b3badf7695ef1b2ba5c0 ******/
		%feature("compactdefaultargs") GetEpsilon;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the value of 'myEps'.
") GetEpsilon;
		Standard_Real GetEpsilon();

		/****** IGESToBRep_CurveAndSurface::GetMaxTol ******/
		/****** md5 signature: 7fc3a4caa1b58b329366bc57a26784b9 ******/
		%feature("compactdefaultargs") GetMaxTol;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the value of 'myMaxTol'.
") GetMaxTol;
		Standard_Real GetMaxTol();

		/****** IGESToBRep_CurveAndSurface::GetMinTol ******/
		/****** md5 signature: 43a94bcf9245d3d5ba9ccae07929c24f ******/
		%feature("compactdefaultargs") GetMinTol;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the value of 'myMinTol'.
") GetMinTol;
		Standard_Real GetMinTol();

		/****** IGESToBRep_CurveAndSurface::GetModeApprox ******/
		/****** md5 signature: 57c1a60849ce01d412739423b3997463 ******/
		%feature("compactdefaultargs") GetModeApprox;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the value of 'myModeApprox'.
") GetModeApprox;
		Standard_Boolean GetModeApprox();

		/****** IGESToBRep_CurveAndSurface::GetModeTransfer ******/
		/****** md5 signature: cae1417d18afbdb49419602577ed1b09 ******/
		%feature("compactdefaultargs") GetModeTransfer;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the value of 'myModeIsTopo'.
") GetModeTransfer;
		Standard_Boolean GetModeTransfer();

		/****** IGESToBRep_CurveAndSurface::GetModel ******/
		/****** md5 signature: 903699a7f01ab7b92813659a6c19f871 ******/
		%feature("compactdefaultargs") GetModel;
		%feature("autodoc", "Return
-------
opencascade::handle<IGESData_IGESModel>

Description
-----------
Returns the value of 'myModel'.
") GetModel;
		opencascade::handle<IGESData_IGESModel> GetModel();

		/****** IGESToBRep_CurveAndSurface::GetOptimized ******/
		/****** md5 signature: 6cc15b4504712321a48092d75ef058cf ******/
		%feature("compactdefaultargs") GetOptimized;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the value of 'myContIsOpti'.
") GetOptimized;
		Standard_Boolean GetOptimized();

		/****** IGESToBRep_CurveAndSurface::GetShapeResult ******/
		/****** md5 signature: 2c0dddc40e78c0b007a111811f6ebae6 ******/
		%feature("compactdefaultargs") GetShapeResult;
		%feature("autodoc", "
Parameters
----------
start: IGESData_IGESEntity

Return
-------
TopoDS_Shape

Description
-----------
Returns the result of the transfer of the IGESEntity 'start' contained in 'myMap' . (if HasShapeResult is True).
") GetShapeResult;
		TopoDS_Shape GetShapeResult(const opencascade::handle<IGESData_IGESEntity> & start);

		/****** IGESToBRep_CurveAndSurface::GetShapeResult ******/
		/****** md5 signature: 0ee811b8d4522d9c2d151ff707425b8d ******/
		%feature("compactdefaultargs") GetShapeResult;
		%feature("autodoc", "
Parameters
----------
start: IGESData_IGESEntity
num: int

Return
-------
TopoDS_Shape

Description
-----------
Returns the numth result of the IGESEntity start (type VertexList or EdgeList) in 'myMap'. (if NbShapeResult is not null).
") GetShapeResult;
		TopoDS_Shape GetShapeResult(const opencascade::handle<IGESData_IGESEntity> & start, const Standard_Integer num);

		/****** IGESToBRep_CurveAndSurface::GetSurfaceCurve ******/
		/****** md5 signature: 245956d7f4e7d4a0983cc2b079dad792 ******/
		%feature("compactdefaultargs") GetSurfaceCurve;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the value of 'mySurfaceCurve' 0 = value in file, 2 = keep 2d and compute 3d, 3 = keep 3d and compute 2d.
") GetSurfaceCurve;
		Standard_Integer GetSurfaceCurve();

		/****** IGESToBRep_CurveAndSurface::GetTransferProcess ******/
		/****** md5 signature: 484ad8a57f2aacc305eaf2d838f8a63f ******/
		%feature("compactdefaultargs") GetTransferProcess;
		%feature("autodoc", "Return
-------
opencascade::handle<Transfer_TransientProcess>

Description
-----------
Returns the value of 'myMsgReg'.
") GetTransferProcess;
		opencascade::handle<Transfer_TransientProcess> GetTransferProcess();

		/****** IGESToBRep_CurveAndSurface::GetUVResolution ******/
		/****** md5 signature: 4c0bd69a9805b0fe0ef7c0cbf6764a46 ******/
		%feature("compactdefaultargs") GetUVResolution;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") GetUVResolution;
		Standard_Real GetUVResolution();

		/****** IGESToBRep_CurveAndSurface::GetUnitFactor ******/
		/****** md5 signature: 1bd8c1322b189bf3e2c3314e8178ff2c ******/
		%feature("compactdefaultargs") GetUnitFactor;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the value of ' myUnitFactor'.
") GetUnitFactor;
		Standard_Real GetUnitFactor();

		/****** IGESToBRep_CurveAndSurface::HasShapeResult ******/
		/****** md5 signature: 9cf61c3441f129b9bcdd0863a06ddb72 ******/
		%feature("compactdefaultargs") HasShapeResult;
		%feature("autodoc", "
Parameters
----------
start: IGESData_IGESEntity

Return
-------
bool

Description
-----------
Returns True if start was already treated and has a result in 'myMap' else returns False.
") HasShapeResult;
		Standard_Boolean HasShapeResult(const opencascade::handle<IGESData_IGESEntity> & start);

		/****** IGESToBRep_CurveAndSurface::Init ******/
		/****** md5 signature: 0de93ef32c53d091768788dca0e281fd ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Return
-------
None

Description
-----------
Initializes the field of the tool CurveAndSurface with default creating values.
") Init;
		void Init();

		/****** IGESToBRep_CurveAndSurface::NbShapeResult ******/
		/****** md5 signature: 4a28dd0824cbd970cbb0482ca2600d07 ******/
		%feature("compactdefaultargs") NbShapeResult;
		%feature("autodoc", "
Parameters
----------
start: IGESData_IGESEntity

Return
-------
int

Description
-----------
Returns the number of shapes results contained in 'myMap' for the IGESEntity start ( type VertexList or EdgeList).
") NbShapeResult;
		Standard_Integer NbShapeResult(const opencascade::handle<IGESData_IGESEntity> & start);

		/****** IGESToBRep_CurveAndSurface::SendFail ******/
		/****** md5 signature: d91bf8a921edee5188c0d2a21dcb288a ******/
		%feature("compactdefaultargs") SendFail;
		%feature("autodoc", "
Parameters
----------
start: IGESData_IGESEntity
amsg: Message_Msg

Return
-------
None

Description
-----------
Records a new Fail message.
") SendFail;
		void SendFail(const opencascade::handle<IGESData_IGESEntity> & start, const Message_Msg & amsg);

		/****** IGESToBRep_CurveAndSurface::SendMsg ******/
		/****** md5 signature: a69268325fa3f73aa7b627f715d61e13 ******/
		%feature("compactdefaultargs") SendMsg;
		%feature("autodoc", "
Parameters
----------
start: IGESData_IGESEntity
amsg: Message_Msg

Return
-------
None

Description
-----------
Records a new Information message from the definition of a Msg (Original+Value).
") SendMsg;
		void SendMsg(const opencascade::handle<IGESData_IGESEntity> & start, const Message_Msg & amsg);

		/****** IGESToBRep_CurveAndSurface::SendWarning ******/
		/****** md5 signature: c4d34cc5fedb748cd665a916797fbfe5 ******/
		%feature("compactdefaultargs") SendWarning;
		%feature("autodoc", "
Parameters
----------
start: IGESData_IGESEntity
amsg: Message_Msg

Return
-------
None

Description
-----------
Records a new Warning message.
") SendWarning;
		void SendWarning(const opencascade::handle<IGESData_IGESEntity> & start, const Message_Msg & amsg);

		/****** IGESToBRep_CurveAndSurface::SetContinuity ******/
		/****** md5 signature: 9187b28bfccce807d514c1d431185e5d ******/
		%feature("compactdefaultargs") SetContinuity;
		%feature("autodoc", "
Parameters
----------
continuity: int

Return
-------
None

Description
-----------
Changes the value of 'myContinuity' if continuity = 0 do nothing else if continuity = 1 try C1 if continuity = 2 try C2.
") SetContinuity;
		void SetContinuity(const Standard_Integer continuity);

		/****** IGESToBRep_CurveAndSurface::SetEpsCoeff ******/
		/****** md5 signature: 0aadb35c43e5a4c71f14be3063a6efc3 ******/
		%feature("compactdefaultargs") SetEpsCoeff;
		%feature("autodoc", "
Parameters
----------
eps: float

Return
-------
None

Description
-----------
Changes the value of 'myEpsCoeff'.
") SetEpsCoeff;
		void SetEpsCoeff(const Standard_Real eps);

		/****** IGESToBRep_CurveAndSurface::SetEpsGeom ******/
		/****** md5 signature: cc2e4e8d49a550d708522faa66bb351d ******/
		%feature("compactdefaultargs") SetEpsGeom;
		%feature("autodoc", "
Parameters
----------
eps: float

Return
-------
None

Description
-----------
Changes the value of 'myEpsGeom'.
") SetEpsGeom;
		void SetEpsGeom(const Standard_Real eps);

		/****** IGESToBRep_CurveAndSurface::SetEpsilon ******/
		/****** md5 signature: d7959f9ce73ddf6898c8522f4f76d8ee ******/
		%feature("compactdefaultargs") SetEpsilon;
		%feature("autodoc", "
Parameters
----------
eps: float

Return
-------
None

Description
-----------
Changes the value of 'myEps'.
") SetEpsilon;
		void SetEpsilon(const Standard_Real eps);

		/****** IGESToBRep_CurveAndSurface::SetMaxTol ******/
		/****** md5 signature: 954fbf5be5bad9962916cfa44f9cf313 ******/
		%feature("compactdefaultargs") SetMaxTol;
		%feature("autodoc", "
Parameters
----------
maxtol: float

Return
-------
None

Description
-----------
Changes the value of 'myMaxTol'.
") SetMaxTol;
		void SetMaxTol(const Standard_Real maxtol);

		/****** IGESToBRep_CurveAndSurface::SetMinTol ******/
		/****** md5 signature: d8e700e8230950a60d86d32faa489e7d ******/
		%feature("compactdefaultargs") SetMinTol;
		%feature("autodoc", "
Parameters
----------
mintol: float

Return
-------
None

Description
-----------
Changes the value of 'myMinTol'.
") SetMinTol;
		void SetMinTol(const Standard_Real mintol);

		/****** IGESToBRep_CurveAndSurface::SetModeApprox ******/
		/****** md5 signature: 7ef6d9de409347aa1041d0c1315e8421 ******/
		%feature("compactdefaultargs") SetModeApprox;
		%feature("autodoc", "
Parameters
----------
mode: bool

Return
-------
None

Description
-----------
Changes the value of 'myModeApprox'.
") SetModeApprox;
		void SetModeApprox(const Standard_Boolean mode);

		/****** IGESToBRep_CurveAndSurface::SetModeTransfer ******/
		/****** md5 signature: a465a6656aef745cafcc53a1111ee4a7 ******/
		%feature("compactdefaultargs") SetModeTransfer;
		%feature("autodoc", "
Parameters
----------
mode: bool

Return
-------
None

Description
-----------
Changes the value of 'myModeIsTopo'.
") SetModeTransfer;
		void SetModeTransfer(const Standard_Boolean mode);

		/****** IGESToBRep_CurveAndSurface::SetModel ******/
		/****** md5 signature: 57ee68a1eb65ee7bf7cf629e19bb0af7 ******/
		%feature("compactdefaultargs") SetModel;
		%feature("autodoc", "
Parameters
----------
model: IGESData_IGESModel

Return
-------
None

Description
-----------
Set the value of 'myModel'.
") SetModel;
		void SetModel(const opencascade::handle<IGESData_IGESModel> & model);

		/****** IGESToBRep_CurveAndSurface::SetOptimized ******/
		/****** md5 signature: 8a8e72b5ec5f0e419be7985230ab37fa ******/
		%feature("compactdefaultargs") SetOptimized;
		%feature("autodoc", "
Parameters
----------
optimized: bool

Return
-------
None

Description
-----------
Changes the value of 'myContIsOpti'.
") SetOptimized;
		void SetOptimized(const Standard_Boolean optimized);

		/****** IGESToBRep_CurveAndSurface::SetShapeResult ******/
		/****** md5 signature: 267d07a0f7a85d681f1f9d0bef937a08 ******/
		%feature("compactdefaultargs") SetShapeResult;
		%feature("autodoc", "
Parameters
----------
start: IGESData_IGESEntity
result: TopoDS_Shape

Return
-------
None

Description
-----------
set in 'myMap' the result of the transfer of the IGESEntity 'start'.
") SetShapeResult;
		void SetShapeResult(const opencascade::handle<IGESData_IGESEntity> & start, const TopoDS_Shape & result);

		/****** IGESToBRep_CurveAndSurface::SetSurface ******/
		/****** md5 signature: 8b3103623aaabd28dc76037a38d35e3b ******/
		%feature("compactdefaultargs") SetSurface;
		%feature("autodoc", "
Parameters
----------
theSurface: Geom_Surface

Return
-------
None

Description
-----------
No available documentation.
") SetSurface;
		void SetSurface(const opencascade::handle<Geom_Surface> & theSurface);

		/****** IGESToBRep_CurveAndSurface::SetSurfaceCurve ******/
		/****** md5 signature: 0afd37178088d8096d3ea47598f1cb96 ******/
		%feature("compactdefaultargs") SetSurfaceCurve;
		%feature("autodoc", "
Parameters
----------
ival: int

Return
-------
None

Description
-----------
Changes the value of 'mySurfaceCurve'.
") SetSurfaceCurve;
		void SetSurfaceCurve(const Standard_Integer ival);

		/****** IGESToBRep_CurveAndSurface::SetTransferProcess ******/
		/****** md5 signature: 45265907d5b7c14270813a8de762d306 ******/
		%feature("compactdefaultargs") SetTransferProcess;
		%feature("autodoc", "
Parameters
----------
TP: Transfer_TransientProcess

Return
-------
None

Description
-----------
Set the value of 'myMsgReg'.
") SetTransferProcess;
		void SetTransferProcess(const opencascade::handle<Transfer_TransientProcess> & TP);

		/****** IGESToBRep_CurveAndSurface::Surface ******/
		/****** md5 signature: 352bd890213763e77e08756c09e1fdcc ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
No available documentation.
") Surface;
		opencascade::handle<Geom_Surface> Surface();

		/****** IGESToBRep_CurveAndSurface::TransferCurveAndSurface ******/
		/****** md5 signature: 95e42d58982889e5208f8cc5c8824a30 ******/
		%feature("compactdefaultargs") TransferCurveAndSurface;
		%feature("autodoc", "
Parameters
----------
start: IGESData_IGESEntity
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
TopoDS_Shape

Description
-----------
Returns the result of the transfert of any IGES Curve or Surface Entity. If the transfer has failed, this member return a NullEntity.
") TransferCurveAndSurface;
		TopoDS_Shape TransferCurveAndSurface(const opencascade::handle<IGESData_IGESEntity> & start, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** IGESToBRep_CurveAndSurface::TransferGeometry ******/
		/****** md5 signature: 41b6a8362a731c45d845644139b0e811 ******/
		%feature("compactdefaultargs") TransferGeometry;
		%feature("autodoc", "
Parameters
----------
start: IGESData_IGESEntity
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
TopoDS_Shape

Description
-----------
Returns the result of the transfert the geometry of any IGESEntity. If the transfer has failed, this member return a NullEntity.
") TransferGeometry;
		TopoDS_Shape TransferGeometry(const opencascade::handle<IGESData_IGESEntity> & start, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** IGESToBRep_CurveAndSurface::UpdateMinMaxTol ******/
		/****** md5 signature: e07c9dafbe1f0852a554a1e076ae56d7 ******/
		%feature("compactdefaultargs") UpdateMinMaxTol;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets values of 'myMinTol' and 'myMaxTol' as follows myMaxTol = Max ('read.maxprecision.val', myEpsGeom * myUnitFactor) myMinTol = Precision::Confusion() Remark: This method is automatically invoked each time the values of 'myEpsGeom' or 'myUnitFactor' are changed.
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
		/****** IGESToBRep_IGESBoundary::IGESToBRep_IGESBoundary ******/
		/****** md5 signature: b90297cbd15aa28a6ce0a3aeef8adc3e ******/
		%feature("compactdefaultargs") IGESToBRep_IGESBoundary;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") IGESToBRep_IGESBoundary;
		 IGESToBRep_IGESBoundary();

		/****** IGESToBRep_IGESBoundary::IGESToBRep_IGESBoundary ******/
		/****** md5 signature: 07f665a8b71df900f28d0fc8c3d09c73 ******/
		%feature("compactdefaultargs") IGESToBRep_IGESBoundary;
		%feature("autodoc", "
Parameters
----------
CS: IGESToBRep_CurveAndSurface

Return
-------
None

Description
-----------
Empty constructor.
") IGESToBRep_IGESBoundary;
		 IGESToBRep_IGESBoundary(const IGESToBRep_CurveAndSurface & CS);

		/****** IGESToBRep_IGESBoundary::Check ******/
		/****** md5 signature: 027657193f5e5111dd7aeaf0088d6b9b ******/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "
Parameters
----------
result: bool
checkclosure: bool
okCurve3d: bool
okCurve2d: bool

Return
-------
None

Description
-----------
Checks result of translation of IGES boundary entities (types 141, 142 or 508). Checks consistency of 2D and 3D representations and keeps only one if they are inconsistent. <result>: result of translation (returned by Transfer), <checkclosure>: False for 142 without parent 144 entity, otherwise True, <okCurve3d>, <okCurve2d>: those returned by Transfer.
") Check;
		virtual void Check(const Standard_Boolean result, const Standard_Boolean checkclosure, const Standard_Boolean okCurve3d, const Standard_Boolean okCurve2d);

		/****** IGESToBRep_IGESBoundary::Init ******/
		/****** md5 signature: 148fc431c88cb36e40549c966cc1a5e5 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
CS: IGESToBRep_CurveAndSurface
entity: IGESData_IGESEntity
face: TopoDS_Face
trans: gp_Trsf2d
uFact: float
filepreference: int

Return
-------
None

Description
-----------
Inits the object with parameters common for all types of IGES boundaries. <CS>: object to be used for retrieving translation parameters and sending messages, <entity>: boundary entity to be processed, <face>, <trans>, <uFact>: as for IGESToBRep_TopoCurve <filepreference>: preferred representation (2 or 3) given in the IGES file.
") Init;
		void Init(const IGESToBRep_CurveAndSurface & CS, const opencascade::handle<IGESData_IGESEntity> & entity, const TopoDS_Face & face, const gp_Trsf2d & trans, const Standard_Real uFact, const Standard_Integer filepreference);

		/****** IGESToBRep_IGESBoundary::Transfer ******/
		/****** md5 signature: 25557cd2dfa0962b0166f6d661b341b3 ******/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "
Parameters
----------
curve3d: IGESData_IGESEntity
toreverse3d: bool
curves2d: IGESData_HArray1OfIGESEntity
number: int

Return
-------
okCurve: bool
okCurve3d: bool
okCurve2d: bool

Description
-----------
Translates 141 and 142 entities. Returns True if the curve has been successfully translated, otherwise returns False. <okCurve..>: flags that indicate whether corresponding representation has been successfully translated (must be set to True before first call), <curve3d>: model space curve for 142 and current model space curve for 141, <toreverse3d>: False for 142 and current orientation flag for 141, <curves2d>: 1 parameter space curve for 142 or list of them for current model space curves for 141, <number>: 1 for 142 and rank number of model space curve for 141.
") Transfer;
		Standard_Boolean Transfer(Standard_Boolean &OutValue, Standard_Boolean &OutValue, Standard_Boolean &OutValue, const opencascade::handle<IGESData_IGESEntity> & curve3d, const Standard_Boolean toreverse3d, const opencascade::handle<IGESData_HArray1OfIGESEntity> & curves2d, const Standard_Integer number);

		/****** IGESToBRep_IGESBoundary::Transfer ******/
		/****** md5 signature: 63bf6e1ebab45a7a19c876f2d6ef2e81 ******/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "
Parameters
----------
curve3d: ShapeExtend_WireData
curves2d: IGESData_HArray1OfIGESEntity
toreverse2d: bool
number: int
lsewd: ShapeExtend_WireData

Return
-------
okCurve: bool
okCurve3d: bool
okCurve2d: bool

Description
-----------
Translates 508 entity. Returns True if the curve has been successfully translated, otherwise returns False. Input object IGESBoundary must be created and initialized before. <okCurve..>: flags that indicate whether corresponding representation has been successfully translated (must be set to True before first call), <curve3d>: result of translation of current edge, <curves2d>: list of parameter space curves for edge, <toreverse2d>: orientation flag of current edge in respect to its model space curve, <number>: rank number of edge, <lsewd>: returns the result of translation of current edge.
") Transfer;
		Standard_Boolean Transfer(Standard_Boolean &OutValue, Standard_Boolean &OutValue, Standard_Boolean &OutValue, const opencascade::handle<ShapeExtend_WireData> & curve3d, const opencascade::handle<IGESData_HArray1OfIGESEntity> & curves2d, const Standard_Boolean toreverse2d, const Standard_Integer number, opencascade::handle<ShapeExtend_WireData> & lsewd);

		/****** IGESToBRep_IGESBoundary::WireData ******/
		/****** md5 signature: 8eebf0143620bf74880205da954b56c6 ******/
		%feature("compactdefaultargs") WireData;
		%feature("autodoc", "Return
-------
opencascade::handle<ShapeExtend_WireData>

Description
-----------
Returns the resulting wire.
") WireData;
		opencascade::handle<ShapeExtend_WireData> WireData();

		/****** IGESToBRep_IGESBoundary::WireData2d ******/
		/****** md5 signature: f13b6c48a5d56ce535e5140fc6c3c4ac ******/
		%feature("compactdefaultargs") WireData2d;
		%feature("autodoc", "Return
-------
opencascade::handle<ShapeExtend_WireData>

Description
-----------
Returns the wire from 2D curves (edges contain pcurves only).
") WireData2d;
		opencascade::handle<ShapeExtend_WireData> WireData2d();

		/****** IGESToBRep_IGESBoundary::WireData3d ******/
		/****** md5 signature: 1489e41fabbf7e3db87e75bc69d714af ******/
		%feature("compactdefaultargs") WireData3d;
		%feature("autodoc", "Return
-------
opencascade::handle<ShapeExtend_WireData>

Description
-----------
Returns the wire from 3D curves (edges contain 3D curves and may contain pcurves).
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
		/****** IGESToBRep_Reader::IGESToBRep_Reader ******/
		/****** md5 signature: 676d0890a7b7b243ad3368dab54548af ******/
		%feature("compactdefaultargs") IGESToBRep_Reader;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a Reader.
") IGESToBRep_Reader;
		 IGESToBRep_Reader();

		/****** IGESToBRep_Reader::Actor ******/
		/****** md5 signature: 5c9d4b5e403375917b4029c880d486d0 ******/
		%feature("compactdefaultargs") Actor;
		%feature("autodoc", "Return
-------
opencascade::handle<IGESToBRep_Actor>

Description
-----------
Returns 'theActor'.
") Actor;
		opencascade::handle<IGESToBRep_Actor> Actor();

		/****** IGESToBRep_Reader::Check ******/
		/****** md5 signature: 7b14bce12a830fb5ee4559367746d91f ******/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "
Parameters
----------
withprint: bool

Return
-------
bool

Description
-----------
Checks the IGES file that was loaded into memory. Displays error messages in the default message file if withprint is true. Returns True if no fail message was found and False if there was at least one fail message.
") Check;
		Standard_Boolean Check(const Standard_Boolean withprint);

		/****** IGESToBRep_Reader::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the results between two translation operations.
") Clear;
		void Clear();

		/****** IGESToBRep_Reader::GetShapeFixParameters ******/
		/****** md5 signature: a0fc3d423114840977f6d586006cd67d ******/
		%feature("compactdefaultargs") GetShapeFixParameters;
		%feature("autodoc", "Return
-------
XSAlgo_ShapeProcessor::ParameterMap

Description
-----------
Returns parameters for shape processing that was set by SetParameters() method. 
Return: the parameters for shape processing. Empty map if no parameters were set.
") GetShapeFixParameters;
		const XSAlgo_ShapeProcessor::ParameterMap & GetShapeFixParameters();

		/****** IGESToBRep_Reader::GetShapeProcessFlags ******/
		/****** md5 signature: 154ac0ed4a5b957edb90a1bb81c83699 ******/
		%feature("compactdefaultargs") GetShapeProcessFlags;
		%feature("autodoc", "Return
-------
ShapeProcess::OperationsFlags

Description
-----------
Returns flags defining operations to be performed on shapes. 
Return: The flags defining operations to be performed on shapes.
") GetShapeProcessFlags;
		const ShapeProcess::OperationsFlags & GetShapeProcessFlags();

		/****** IGESToBRep_Reader::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the LAST Transfer/TransferRoots was a success.
") IsDone;
		Standard_Boolean IsDone();

		/****** IGESToBRep_Reader::LoadFile ******/
		/****** md5 signature: 5af3a407ab114cf12389b88dfb5d215e ******/
		%feature("compactdefaultargs") LoadFile;
		%feature("autodoc", "
Parameters
----------
filename: str

Return
-------
int

Description
-----------
Loads a Model from a file.Returns 0 if success. returns 1 if the file could not be opened, returns -1 if an error occurred while the file was being loaded.
") LoadFile;
		Standard_Integer LoadFile(Standard_CString filename);

		/****** IGESToBRep_Reader::Model ******/
		/****** md5 signature: 4b3130e3b28afba6f0c58ab4875c4253 ******/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Return
-------
opencascade::handle<IGESData_IGESModel>

Description
-----------
Returns the Model to be worked on.
") Model;
		opencascade::handle<IGESData_IGESModel> Model();

		/****** IGESToBRep_Reader::NbShapes ******/
		/****** md5 signature: ea90d1514db96ad18becf0e04a33abf6 ******/
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of shapes produced by the translation.
") NbShapes;
		Standard_Integer NbShapes();

		/****** IGESToBRep_Reader::OneShape ******/
		/****** md5 signature: 1fc1610db08b4eec83d275771d406ea5 ******/
		%feature("compactdefaultargs") OneShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns all of the results in a single shape which is: - a null shape if there are no results, - a shape if there is one result, - a compound containing the resulting shapes if there are several.
") OneShape;
		TopoDS_Shape OneShape();

		/****** IGESToBRep_Reader::SetModel ******/
		/****** md5 signature: 57ee68a1eb65ee7bf7cf629e19bb0af7 ******/
		%feature("compactdefaultargs") SetModel;
		%feature("autodoc", "
Parameters
----------
model: IGESData_IGESModel

Return
-------
None

Description
-----------
Specifies a Model to work on Also clears the result and Done status, sets TransientProcess.
") SetModel;
		void SetModel(const opencascade::handle<IGESData_IGESModel> & model);

		/****** IGESToBRep_Reader::SetShapeFixParameters ******/
		/****** md5 signature: c121f0c1a1bbbaa2d7732f28ec6b14f9 ******/
		%feature("compactdefaultargs") SetShapeFixParameters;
		%feature("autodoc", "
Parameters
----------
theParameters: XSAlgo_ShapeProcessor::ParameterMap

Return
-------
None

Description
-----------
Sets parameters for shape processing. 
Parameter theParameters the parameters for shape processing.
") SetShapeFixParameters;
		void SetShapeFixParameters(const XSAlgo_ShapeProcessor::ParameterMap & theParameters);

		/****** IGESToBRep_Reader::SetShapeFixParameters ******/
		/****** md5 signature: 1db31276bf8a0d249a8011e0955a53e7 ******/
		%feature("compactdefaultargs") SetShapeFixParameters;
		%feature("autodoc", "
Parameters
----------
theParameters: XSAlgo_ShapeProcessor::ParameterMap

Return
-------
None

Description
-----------
Sets parameters for shape processing. Parameters are moved from the input map. 
Parameter theParameters the parameters for shape processing.
") SetShapeFixParameters;
		void SetShapeFixParameters(XSAlgo_ShapeProcessor::ParameterMap & theParameters);

		/****** IGESToBRep_Reader::SetShapeFixParameters ******/
		/****** md5 signature: e895be254466ec0dab7446ab439d8103 ******/
		%feature("compactdefaultargs") SetShapeFixParameters;
		%feature("autodoc", "
Parameters
----------
theParameters: DE_ShapeFixParameters
theAdditionalParameters: XSAlgo_ShapeProcessor::ParameterMap (optional, default to {})

Return
-------
None

Description
-----------
Sets parameters for shape processing. Parameters from @p theParameters are copied to the internal map. Parameters from @p theAdditionalParameters are copied to the internal map if they are not present in @p theParameters. 
Parameter theParameters the parameters for shape processing. 
Parameter theAdditionalParameters the additional parameters for shape processing.
") SetShapeFixParameters;
		void SetShapeFixParameters(const DE_ShapeFixParameters & theParameters, const XSAlgo_ShapeProcessor::ParameterMap & theAdditionalParameters = {});

		/****** IGESToBRep_Reader::SetShapeProcessFlags ******/
		/****** md5 signature: 8994bc61257c564f18dec11d989eee9a ******/
		%feature("compactdefaultargs") SetShapeProcessFlags;
		%feature("autodoc", "
Parameters
----------
theFlags: ShapeProcess::OperationsFlags

Return
-------
None

Description
-----------
Sets flags defining operations to be performed on shapes. 
Parameter theFlags The flags defining operations to be performed on shapes.
") SetShapeProcessFlags;
		void SetShapeProcessFlags(const ShapeProcess::OperationsFlags & theFlags);

		/****** IGESToBRep_Reader::SetTransientProcess ******/
		/****** md5 signature: 9c0acd3b342d08985d434686c53eeecd ******/
		%feature("compactdefaultargs") SetTransientProcess;
		%feature("autodoc", "
Parameters
----------
TP: Transfer_TransientProcess

Return
-------
None

Description
-----------
Allows to set an already defined TransientProcess (to be called after LoadFile or SetModel).
") SetTransientProcess;
		void SetTransientProcess(const opencascade::handle<Transfer_TransientProcess> & TP);

		/****** IGESToBRep_Reader::Shape ******/
		/****** md5 signature: b325565d748ea0ef38fee9bdb447c4a9 ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "
Parameters
----------
num: int (optional, default to 1)

Return
-------
TopoDS_Shape

Description
-----------
Returns the num the resulting shape in a translation operation.
") Shape;
		TopoDS_Shape Shape(const Standard_Integer num = 1);

		/****** IGESToBRep_Reader::Transfer ******/
		/****** md5 signature: aa24b2062db698881310d745b17c7dee ******/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "
Parameters
----------
num: int
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Transfers an Entity given its rank in the Model (Root or not) Returns True if it is recognized as Geom-Topol. (But it can have failed: see IsDone).
") Transfer;
		Standard_Boolean Transfer(const Standard_Integer num, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** IGESToBRep_Reader::TransferRoots ******/
		/****** md5 signature: ddc66dd5a50ae3a9ebd0f4a567a2d699 ******/
		%feature("compactdefaultargs") TransferRoots;
		%feature("autodoc", "
Parameters
----------
onlyvisible: bool (optional, default to Standard_True)
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Translates root entities in an IGES file. Standard_True is the default value and means that only visible root entities are translated. Standard_False translates all of the roots (visible and invisible).
") TransferRoots;
		void TransferRoots(const Standard_Boolean onlyvisible = Standard_True, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** IGESToBRep_Reader::TransientProcess ******/
		/****** md5 signature: cda5aa33365159e82c6213003de44419 ******/
		%feature("compactdefaultargs") TransientProcess;
		%feature("autodoc", "Return
-------
opencascade::handle<Transfer_TransientProcess>

Description
-----------
Returns the TransientProcess.
") TransientProcess;
		opencascade::handle<Transfer_TransientProcess> TransientProcess();

		/****** IGESToBRep_Reader::UsedTolerance ******/
		/****** md5 signature: ff38c5c7287c4c23a2ef8bba63f8adbd ******/
		%feature("compactdefaultargs") UsedTolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the Tolerance which has been actually used, converted in millimeters (either that from File or that from Session, according the mode).
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
		/****** IGESToBRep_ToolContainer::IGESToBRep_ToolContainer ******/
		/****** md5 signature: 72453f26bc02ff130a3542f03ca6dc91 ******/
		%feature("compactdefaultargs") IGESToBRep_ToolContainer;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") IGESToBRep_ToolContainer;
		 IGESToBRep_ToolContainer();

		/****** IGESToBRep_ToolContainer::IGESBoundary ******/
		/****** md5 signature: 2fdb99006a3dfa88ef5ed9cde67cadda ******/
		%feature("compactdefaultargs") IGESBoundary;
		%feature("autodoc", "Return
-------
opencascade::handle<IGESToBRep_IGESBoundary>

Description
-----------
Returns IGESToBRep_IGESBoundary.
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
		/****** IGESToBRep_BRepEntity::IGESToBRep_BRepEntity ******/
		/****** md5 signature: fe1f96121d1dcd57fc16089d8af5178a ******/
		%feature("compactdefaultargs") IGESToBRep_BRepEntity;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a tool BRepEntity ready to run, with epsilons set to 1.E-04, TheModeTopo to True, the optimization of the continuity to False.
") IGESToBRep_BRepEntity;
		 IGESToBRep_BRepEntity();

		/****** IGESToBRep_BRepEntity::IGESToBRep_BRepEntity ******/
		/****** md5 signature: d43a04cf2fe0b8bfd3eaf36701cb2676 ******/
		%feature("compactdefaultargs") IGESToBRep_BRepEntity;
		%feature("autodoc", "
Parameters
----------
CS: IGESToBRep_CurveAndSurface

Return
-------
None

Description
-----------
Creates a tool BRepEntity ready to run and sets its fields as CS's.
") IGESToBRep_BRepEntity;
		 IGESToBRep_BRepEntity(const IGESToBRep_CurveAndSurface & CS);

		/****** IGESToBRep_BRepEntity::IGESToBRep_BRepEntity ******/
		/****** md5 signature: 9263e28b27c52f61a248876fb4480b86 ******/
		%feature("compactdefaultargs") IGESToBRep_BRepEntity;
		%feature("autodoc", "
Parameters
----------
eps: float
epsGeom: float
epsCoeff: float
mode: bool
modeapprox: bool
optimized: bool

Return
-------
None

Description
-----------
Creates a tool BRepEntity ready to run.
") IGESToBRep_BRepEntity;
		 IGESToBRep_BRepEntity(const Standard_Real eps, const Standard_Real epsGeom, const Standard_Real epsCoeff, const Standard_Boolean mode, const Standard_Boolean modeapprox, const Standard_Boolean optimized);

		/****** IGESToBRep_BRepEntity::TransferBRepEntity ******/
		/****** md5 signature: eb1d0f38717858581983b0cd33ed2d11 ******/
		%feature("compactdefaultargs") TransferBRepEntity;
		%feature("autodoc", "
Parameters
----------
start: IGESData_IGESEntity
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
TopoDS_Shape

Description
-----------
Transfer the BRepEntity': Face, Shell or ManifoldSolid.
") TransferBRepEntity;
		TopoDS_Shape TransferBRepEntity(const opencascade::handle<IGESData_IGESEntity> & start, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** IGESToBRep_BRepEntity::TransferEdge ******/
		/****** md5 signature: 3b5e6a2863f17677c7e3f7184aeed45b ******/
		%feature("compactdefaultargs") TransferEdge;
		%feature("autodoc", "
Parameters
----------
start: IGESSolid_EdgeList
index: int

Return
-------
TopoDS_Shape

Description
-----------
Transfer the entity number 'index' of the EdgeList 'start'.
") TransferEdge;
		TopoDS_Shape TransferEdge(const opencascade::handle<IGESSolid_EdgeList> & start, const Standard_Integer index);

		/****** IGESToBRep_BRepEntity::TransferFace ******/
		/****** md5 signature: b0851b2d63f2853ef5f04982570b18c8 ******/
		%feature("compactdefaultargs") TransferFace;
		%feature("autodoc", "
Parameters
----------
start: IGESSolid_Face

Return
-------
TopoDS_Shape

Description
-----------
Transfer the Face Entity.
") TransferFace;
		TopoDS_Shape TransferFace(const opencascade::handle<IGESSolid_Face> & start);

		/****** IGESToBRep_BRepEntity::TransferLoop ******/
		/****** md5 signature: 70d8121d0dce3647362ac210d42a9813 ******/
		%feature("compactdefaultargs") TransferLoop;
		%feature("autodoc", "
Parameters
----------
start: IGESSolid_Loop
Face: TopoDS_Face
trans: gp_Trsf2d
uFact: float

Return
-------
TopoDS_Shape

Description
-----------
Transfer the Loop Entity.
") TransferLoop;
		TopoDS_Shape TransferLoop(const opencascade::handle<IGESSolid_Loop> & start, const TopoDS_Face & Face, const gp_Trsf2d & trans, const Standard_Real uFact);

		/****** IGESToBRep_BRepEntity::TransferManifoldSolid ******/
		/****** md5 signature: 67bda0475d406d16e7fe5d11404ad4ce ******/
		%feature("compactdefaultargs") TransferManifoldSolid;
		%feature("autodoc", "
Parameters
----------
start: IGESSolid_ManifoldSolid
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
TopoDS_Shape

Description
-----------
Transfer the ManifoldSolid Entity.
") TransferManifoldSolid;
		TopoDS_Shape TransferManifoldSolid(const opencascade::handle<IGESSolid_ManifoldSolid> & start, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** IGESToBRep_BRepEntity::TransferShell ******/
		/****** md5 signature: 0b21173235255fb60de48101b4093bfe ******/
		%feature("compactdefaultargs") TransferShell;
		%feature("autodoc", "
Parameters
----------
start: IGESSolid_Shell
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
TopoDS_Shape

Description
-----------
Transfer the Shell Entity.
") TransferShell;
		TopoDS_Shape TransferShell(const opencascade::handle<IGESSolid_Shell> & start, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** IGESToBRep_BRepEntity::TransferVertex ******/
		/****** md5 signature: a93d4f312a0873203e823c7b4949940e ******/
		%feature("compactdefaultargs") TransferVertex;
		%feature("autodoc", "
Parameters
----------
start: IGESSolid_VertexList
index: int

Return
-------
TopoDS_Vertex

Description
-----------
Transfer the entity number 'index' of the VertexList 'start'.
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
		/****** IGESToBRep_BasicCurve::IGESToBRep_BasicCurve ******/
		/****** md5 signature: 68d8978aaf4a5d05029944585f6999ab ******/
		%feature("compactdefaultargs") IGESToBRep_BasicCurve;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a tool BasicCurve ready to run, with epsilons set to 1.E-04, TheModeTopo to True, the optimization of the continuity to False.
") IGESToBRep_BasicCurve;
		 IGESToBRep_BasicCurve();

		/****** IGESToBRep_BasicCurve::IGESToBRep_BasicCurve ******/
		/****** md5 signature: fbe3a0d0ae5f8a9b24a19f0474506314 ******/
		%feature("compactdefaultargs") IGESToBRep_BasicCurve;
		%feature("autodoc", "
Parameters
----------
CS: IGESToBRep_CurveAndSurface

Return
-------
None

Description
-----------
Creates a tool BasicCurve ready to run and sets its fields as CS's.
") IGESToBRep_BasicCurve;
		 IGESToBRep_BasicCurve(const IGESToBRep_CurveAndSurface & CS);

		/****** IGESToBRep_BasicCurve::IGESToBRep_BasicCurve ******/
		/****** md5 signature: bd02aac0862c60a651cc52850058c2c9 ******/
		%feature("compactdefaultargs") IGESToBRep_BasicCurve;
		%feature("autodoc", "
Parameters
----------
eps: float
epsGeom: float
epsCoeff: float
mode: bool
modeapprox: bool
optimized: bool

Return
-------
None

Description
-----------
Creates a tool BasicCurve ready to run.
") IGESToBRep_BasicCurve;
		 IGESToBRep_BasicCurve(const Standard_Real eps, const Standard_Real epsGeom, const Standard_Real epsCoeff, const Standard_Boolean mode, const Standard_Boolean modeapprox, const Standard_Boolean optimized);

		/****** IGESToBRep_BasicCurve::Transfer2dBSplineCurve ******/
		/****** md5 signature: 88875766cbf6aa0ea56b60f173e78a44 ******/
		%feature("compactdefaultargs") Transfer2dBSplineCurve;
		%feature("autodoc", "
Parameters
----------
start: IGESGeom_BSplineCurve

Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
No available documentation.
") Transfer2dBSplineCurve;
		opencascade::handle<Geom2d_Curve> Transfer2dBSplineCurve(const opencascade::handle<IGESGeom_BSplineCurve> & start);

		/****** IGESToBRep_BasicCurve::Transfer2dBasicCurve ******/
		/****** md5 signature: 7ff7d7c34ddfb5c3ff97d7993295b8eb ******/
		%feature("compactdefaultargs") Transfer2dBasicCurve;
		%feature("autodoc", "
Parameters
----------
start: IGESData_IGESEntity

Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
Transfert a IGESEntity which answer True to the member: IGESToBRep::IsBasicCurve(IGESEntity). The IGESEntity must be a curve UV and its associed TRSF must be planar .If this Entity could not be converted, this member returns a NullEntity.
") Transfer2dBasicCurve;
		opencascade::handle<Geom2d_Curve> Transfer2dBasicCurve(const opencascade::handle<IGESData_IGESEntity> & start);

		/****** IGESToBRep_BasicCurve::Transfer2dCircularArc ******/
		/****** md5 signature: 5baf56201a2c8f65a18b8e88b4cd9fe7 ******/
		%feature("compactdefaultargs") Transfer2dCircularArc;
		%feature("autodoc", "
Parameters
----------
start: IGESGeom_CircularArc

Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
No available documentation.
") Transfer2dCircularArc;
		opencascade::handle<Geom2d_Curve> Transfer2dCircularArc(const opencascade::handle<IGESGeom_CircularArc> & start);

		/****** IGESToBRep_BasicCurve::Transfer2dConicArc ******/
		/****** md5 signature: 8144d083508d7482eff38d76bf671173 ******/
		%feature("compactdefaultargs") Transfer2dConicArc;
		%feature("autodoc", "
Parameters
----------
start: IGESGeom_ConicArc

Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
No available documentation.
") Transfer2dConicArc;
		opencascade::handle<Geom2d_Curve> Transfer2dConicArc(const opencascade::handle<IGESGeom_ConicArc> & start);

		/****** IGESToBRep_BasicCurve::Transfer2dCopiousData ******/
		/****** md5 signature: 7d4b8c0dbec52f28a32ed3f713459fda ******/
		%feature("compactdefaultargs") Transfer2dCopiousData;
		%feature("autodoc", "
Parameters
----------
start: IGESGeom_CopiousData

Return
-------
opencascade::handle<Geom2d_BSplineCurve>

Description
-----------
No available documentation.
") Transfer2dCopiousData;
		opencascade::handle<Geom2d_BSplineCurve> Transfer2dCopiousData(const opencascade::handle<IGESGeom_CopiousData> & start);

		/****** IGESToBRep_BasicCurve::Transfer2dLine ******/
		/****** md5 signature: 4a668a5f1a4e7117a2416a5203551949 ******/
		%feature("compactdefaultargs") Transfer2dLine;
		%feature("autodoc", "
Parameters
----------
start: IGESGeom_Line

Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
No available documentation.
") Transfer2dLine;
		opencascade::handle<Geom2d_Curve> Transfer2dLine(const opencascade::handle<IGESGeom_Line> & start);

		/****** IGESToBRep_BasicCurve::Transfer2dSplineCurve ******/
		/****** md5 signature: 0d22fff951d2ee540bb5f3c0c9d00c67 ******/
		%feature("compactdefaultargs") Transfer2dSplineCurve;
		%feature("autodoc", "
Parameters
----------
start: IGESGeom_SplineCurve

Return
-------
opencascade::handle<Geom2d_BSplineCurve>

Description
-----------
No available documentation.
") Transfer2dSplineCurve;
		opencascade::handle<Geom2d_BSplineCurve> Transfer2dSplineCurve(const opencascade::handle<IGESGeom_SplineCurve> & start);

		/****** IGESToBRep_BasicCurve::TransferBSplineCurve ******/
		/****** md5 signature: 6fb9231af9b283d9ffbe2fdfc95331f3 ******/
		%feature("compactdefaultargs") TransferBSplineCurve;
		%feature("autodoc", "
Parameters
----------
start: IGESGeom_BSplineCurve

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
No available documentation.
") TransferBSplineCurve;
		opencascade::handle<Geom_Curve> TransferBSplineCurve(const opencascade::handle<IGESGeom_BSplineCurve> & start);

		/****** IGESToBRep_BasicCurve::TransferBasicCurve ******/
		/****** md5 signature: 9e50ce03cce9305efee92e50d9637baf ******/
		%feature("compactdefaultargs") TransferBasicCurve;
		%feature("autodoc", "
Parameters
----------
start: IGESData_IGESEntity

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Transfert a IGESEntity which answer True to the member: IGESToBRep::IsBasicCurve(IGESEntity). If this Entity could not be converted, this member returns a NullEntity.
") TransferBasicCurve;
		opencascade::handle<Geom_Curve> TransferBasicCurve(const opencascade::handle<IGESData_IGESEntity> & start);

		/****** IGESToBRep_BasicCurve::TransferCircularArc ******/
		/****** md5 signature: 414b2efae96103e11a3dd7e1376cfb8f ******/
		%feature("compactdefaultargs") TransferCircularArc;
		%feature("autodoc", "
Parameters
----------
start: IGESGeom_CircularArc

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
No available documentation.
") TransferCircularArc;
		opencascade::handle<Geom_Curve> TransferCircularArc(const opencascade::handle<IGESGeom_CircularArc> & start);

		/****** IGESToBRep_BasicCurve::TransferConicArc ******/
		/****** md5 signature: 9bf10750695e7b43e1903191373f7207 ******/
		%feature("compactdefaultargs") TransferConicArc;
		%feature("autodoc", "
Parameters
----------
start: IGESGeom_ConicArc

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
No available documentation.
") TransferConicArc;
		opencascade::handle<Geom_Curve> TransferConicArc(const opencascade::handle<IGESGeom_ConicArc> & start);

		/****** IGESToBRep_BasicCurve::TransferCopiousData ******/
		/****** md5 signature: 71ca2f96b9552305e6cda39d32a3cd66 ******/
		%feature("compactdefaultargs") TransferCopiousData;
		%feature("autodoc", "
Parameters
----------
start: IGESGeom_CopiousData

Return
-------
opencascade::handle<Geom_BSplineCurve>

Description
-----------
No available documentation.
") TransferCopiousData;
		opencascade::handle<Geom_BSplineCurve> TransferCopiousData(const opencascade::handle<IGESGeom_CopiousData> & start);

		/****** IGESToBRep_BasicCurve::TransferLine ******/
		/****** md5 signature: f726347aa052dbc9cf0e4f09627f91ac ******/
		%feature("compactdefaultargs") TransferLine;
		%feature("autodoc", "
Parameters
----------
start: IGESGeom_Line

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
No available documentation.
") TransferLine;
		opencascade::handle<Geom_Curve> TransferLine(const opencascade::handle<IGESGeom_Line> & start);

		/****** IGESToBRep_BasicCurve::TransferSplineCurve ******/
		/****** md5 signature: 549f24b93cbd1cf1382beb1e3eecd34a ******/
		%feature("compactdefaultargs") TransferSplineCurve;
		%feature("autodoc", "
Parameters
----------
start: IGESGeom_SplineCurve

Return
-------
opencascade::handle<Geom_BSplineCurve>

Description
-----------
No available documentation.
") TransferSplineCurve;
		opencascade::handle<Geom_BSplineCurve> TransferSplineCurve(const opencascade::handle<IGESGeom_SplineCurve> & start);

		/****** IGESToBRep_BasicCurve::TransferTransformation ******/
		/****** md5 signature: dc16109debdb479862d603db2aa25282 ******/
		%feature("compactdefaultargs") TransferTransformation;
		%feature("autodoc", "
Parameters
----------
start: IGESGeom_TransformationMatrix

Return
-------
opencascade::handle<Geom_Transformation>

Description
-----------
No available documentation.
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
		/****** IGESToBRep_BasicSurface::IGESToBRep_BasicSurface ******/
		/****** md5 signature: aa2bb25222b9eb5b47ef4d4496df17d5 ******/
		%feature("compactdefaultargs") IGESToBRep_BasicSurface;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a tool BasicSurface ready to run, with epsilons set to 1.E-04, TheModeTopo to True, the optimization of the continuity to False.
") IGESToBRep_BasicSurface;
		 IGESToBRep_BasicSurface();

		/****** IGESToBRep_BasicSurface::IGESToBRep_BasicSurface ******/
		/****** md5 signature: fc2e06afe2be787d7bcb05be2085e8bd ******/
		%feature("compactdefaultargs") IGESToBRep_BasicSurface;
		%feature("autodoc", "
Parameters
----------
CS: IGESToBRep_CurveAndSurface

Return
-------
None

Description
-----------
Creates a tool BasicSurface ready to run and sets its fields as CS's.
") IGESToBRep_BasicSurface;
		 IGESToBRep_BasicSurface(const IGESToBRep_CurveAndSurface & CS);

		/****** IGESToBRep_BasicSurface::IGESToBRep_BasicSurface ******/
		/****** md5 signature: d628b2c56c29aa46e003790cbdd5acc5 ******/
		%feature("compactdefaultargs") IGESToBRep_BasicSurface;
		%feature("autodoc", "
Parameters
----------
eps: float
epsGeom: float
epsCoeff: float
mode: bool
modeapprox: bool
optimized: bool

Return
-------
None

Description
-----------
Creates a tool BasicSurface ready to run.
") IGESToBRep_BasicSurface;
		 IGESToBRep_BasicSurface(const Standard_Real eps, const Standard_Real epsGeom, const Standard_Real epsCoeff, const Standard_Boolean mode, const Standard_Boolean modeapprox, const Standard_Boolean optimized);

		/****** IGESToBRep_BasicSurface::TransferBSplineSurface ******/
		/****** md5 signature: 6f986be59ffad8d912ca9bc145330b80 ******/
		%feature("compactdefaultargs") TransferBSplineSurface;
		%feature("autodoc", "
Parameters
----------
start: IGESGeom_BSplineSurface

Return
-------
opencascade::handle<Geom_BSplineSurface>

Description
-----------
Returns BSplineSurface from Geom if the transfer has succeeded.
") TransferBSplineSurface;
		opencascade::handle<Geom_BSplineSurface> TransferBSplineSurface(const opencascade::handle<IGESGeom_BSplineSurface> & start);

		/****** IGESToBRep_BasicSurface::TransferBasicSurface ******/
		/****** md5 signature: d474fcac88568463bac1af7b1b00f5ad ******/
		%feature("compactdefaultargs") TransferBasicSurface;
		%feature("autodoc", "
Parameters
----------
start: IGESData_IGESEntity

Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
Returns Surface from Geom if the last transfer has succeeded.
") TransferBasicSurface;
		opencascade::handle<Geom_Surface> TransferBasicSurface(const opencascade::handle<IGESData_IGESEntity> & start);

		/****** IGESToBRep_BasicSurface::TransferPlaneSurface ******/
		/****** md5 signature: 2dc0fec5d663ef8184fbdedc63835c00 ******/
		%feature("compactdefaultargs") TransferPlaneSurface;
		%feature("autodoc", "
Parameters
----------
start: IGESSolid_PlaneSurface

Return
-------
opencascade::handle<Geom_Plane>

Description
-----------
Returns Plane from Geom if the transfer has succeeded.
") TransferPlaneSurface;
		opencascade::handle<Geom_Plane> TransferPlaneSurface(const opencascade::handle<IGESSolid_PlaneSurface> & start);

		/****** IGESToBRep_BasicSurface::TransferRigthConicalSurface ******/
		/****** md5 signature: ffa494667ebcfc55698bbc74c2df3e62 ******/
		%feature("compactdefaultargs") TransferRigthConicalSurface;
		%feature("autodoc", "
Parameters
----------
start: IGESSolid_ConicalSurface

Return
-------
opencascade::handle<Geom_ConicalSurface>

Description
-----------
Returns ConicalSurface from Geom if the transfer has succeeded.
") TransferRigthConicalSurface;
		opencascade::handle<Geom_ConicalSurface> TransferRigthConicalSurface(const opencascade::handle<IGESSolid_ConicalSurface> & start);

		/****** IGESToBRep_BasicSurface::TransferRigthCylindricalSurface ******/
		/****** md5 signature: 647a61ea89b6e94f7e0ea1b0e3397b1a ******/
		%feature("compactdefaultargs") TransferRigthCylindricalSurface;
		%feature("autodoc", "
Parameters
----------
start: IGESSolid_CylindricalSurface

Return
-------
opencascade::handle<Geom_CylindricalSurface>

Description
-----------
Returns CylindricalSurface from Geom if the transfer has succeeded.
") TransferRigthCylindricalSurface;
		opencascade::handle<Geom_CylindricalSurface> TransferRigthCylindricalSurface(const opencascade::handle<IGESSolid_CylindricalSurface> & start);

		/****** IGESToBRep_BasicSurface::TransferSphericalSurface ******/
		/****** md5 signature: e27706f05b86cf919954067355d7e37a ******/
		%feature("compactdefaultargs") TransferSphericalSurface;
		%feature("autodoc", "
Parameters
----------
start: IGESSolid_SphericalSurface

Return
-------
opencascade::handle<Geom_SphericalSurface>

Description
-----------
Returns SphericalSurface from Geom if the transfer has succeeded.
") TransferSphericalSurface;
		opencascade::handle<Geom_SphericalSurface> TransferSphericalSurface(const opencascade::handle<IGESSolid_SphericalSurface> & start);

		/****** IGESToBRep_BasicSurface::TransferSplineSurface ******/
		/****** md5 signature: 7c60488b9fd6d9d70c76c5657fbec318 ******/
		%feature("compactdefaultargs") TransferSplineSurface;
		%feature("autodoc", "
Parameters
----------
start: IGESGeom_SplineSurface

Return
-------
opencascade::handle<Geom_BSplineSurface>

Description
-----------
Returns BSplineSurface from Geom if the transfer has succeeded.
") TransferSplineSurface;
		opencascade::handle<Geom_BSplineSurface> TransferSplineSurface(const opencascade::handle<IGESGeom_SplineSurface> & start);

		/****** IGESToBRep_BasicSurface::TransferToroidalSurface ******/
		/****** md5 signature: 790209401c0642f4b97f0279a92e4514 ******/
		%feature("compactdefaultargs") TransferToroidalSurface;
		%feature("autodoc", "
Parameters
----------
start: IGESSolid_ToroidalSurface

Return
-------
opencascade::handle<Geom_ToroidalSurface>

Description
-----------
Returns SphericalSurface from Geom if the transfer has succeeded.
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
		/****** IGESToBRep_TopoCurve::IGESToBRep_TopoCurve ******/
		/****** md5 signature: 5905e9d131b1bbbc6c8a8ec087e26bbe ******/
		%feature("compactdefaultargs") IGESToBRep_TopoCurve;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a tool TopoCurve ready to run, with epsilons set to 1.E-04, TheModeTopo to True, the optimization of the continuity to False.
") IGESToBRep_TopoCurve;
		 IGESToBRep_TopoCurve();

		/****** IGESToBRep_TopoCurve::IGESToBRep_TopoCurve ******/
		/****** md5 signature: 9336ae043fe4783641aca5a818befae8 ******/
		%feature("compactdefaultargs") IGESToBRep_TopoCurve;
		%feature("autodoc", "
Parameters
----------
CS: IGESToBRep_CurveAndSurface

Return
-------
None

Description
-----------
Creates a tool TopoCurve ready to run and sets its fields as CS's.
") IGESToBRep_TopoCurve;
		 IGESToBRep_TopoCurve(const IGESToBRep_CurveAndSurface & CS);

		/****** IGESToBRep_TopoCurve::IGESToBRep_TopoCurve ******/
		/****** md5 signature: ba923dda0ad2c4a0d7ea691406bb3b0c ******/
		%feature("compactdefaultargs") IGESToBRep_TopoCurve;
		%feature("autodoc", "
Parameters
----------
CS: IGESToBRep_TopoCurve

Return
-------
None

Description
-----------
Creates a tool TopoCurve ready to run and sets its fields as CS's.
") IGESToBRep_TopoCurve;
		 IGESToBRep_TopoCurve(const IGESToBRep_TopoCurve & CS);

		/****** IGESToBRep_TopoCurve::IGESToBRep_TopoCurve ******/
		/****** md5 signature: 83267c32fead13b314685507e4cbbbcb ******/
		%feature("compactdefaultargs") IGESToBRep_TopoCurve;
		%feature("autodoc", "
Parameters
----------
eps: float
epsGeom: float
epsCoeff: float
mode: bool
modeapprox: bool
optimized: bool

Return
-------
None

Description
-----------
Creates a tool TopoCurve ready to run.
") IGESToBRep_TopoCurve;
		 IGESToBRep_TopoCurve(const Standard_Real eps, const Standard_Real epsGeom, const Standard_Real epsCoeff, const Standard_Boolean mode, const Standard_Boolean modeapprox, const Standard_Boolean optimized);

		/****** IGESToBRep_TopoCurve::Approx2dBSplineCurve ******/
		/****** md5 signature: 1fc20fa25774afe1a271c33f05538dd1 ******/
		%feature("compactdefaultargs") Approx2dBSplineCurve;
		%feature("autodoc", "
Parameters
----------
start: Geom2d_BSplineCurve

Return
-------
None

Description
-----------
No available documentation.
") Approx2dBSplineCurve;
		void Approx2dBSplineCurve(const opencascade::handle<Geom2d_BSplineCurve> & start);

		/****** IGESToBRep_TopoCurve::ApproxBSplineCurve ******/
		/****** md5 signature: 4ebe96fc50f5e914b652028984a1f908 ******/
		%feature("compactdefaultargs") ApproxBSplineCurve;
		%feature("autodoc", "
Parameters
----------
start: Geom_BSplineCurve

Return
-------
None

Description
-----------
No available documentation.
") ApproxBSplineCurve;
		void ApproxBSplineCurve(const opencascade::handle<Geom_BSplineCurve> & start);

		/****** IGESToBRep_TopoCurve::BadCase ******/
		/****** md5 signature: 8bb65c1a2d4633080430d3288721789c ******/
		%feature("compactdefaultargs") BadCase;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns TheBadCase flag.
") BadCase;
		Standard_Boolean BadCase();

		/****** IGESToBRep_TopoCurve::Curve ******/
		/****** md5 signature: d316d2ea9db7b953425d17116942f382 ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "
Parameters
----------
num: int (optional, default to 1)

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Returns a Curve given its rank, by default the first one (null Curvee if out of range) in 'TheCurves'.
") Curve;
		opencascade::handle<Geom_Curve> Curve(const Standard_Integer num = 1);

		/****** IGESToBRep_TopoCurve::Curve2d ******/
		/****** md5 signature: f26a67580b3de0aa28c74c8652e42a0d ******/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "
Parameters
----------
num: int (optional, default to 1)

Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
Returns a Curve given its rank, by default the first one (null Curvee if out of range) in 'TheCurves2d'.
") Curve2d;
		opencascade::handle<Geom2d_Curve> Curve2d(const Standard_Integer num = 1);

		/****** IGESToBRep_TopoCurve::NbCurves ******/
		/****** md5 signature: f7f6dbd981df076443155a5a87b5c223 ******/
		%feature("compactdefaultargs") NbCurves;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of Curves in 'TheCurves'.
") NbCurves;
		Standard_Integer NbCurves();

		/****** IGESToBRep_TopoCurve::NbCurves2d ******/
		/****** md5 signature: 91ae967daa54efe7d38afad4a5698e5b ******/
		%feature("compactdefaultargs") NbCurves2d;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of Curves in 'TheCurves2d'.
") NbCurves2d;
		Standard_Integer NbCurves2d();

		/****** IGESToBRep_TopoCurve::SetBadCase ******/
		/****** md5 signature: d69c1dd781117594f737163beb8e3622 ******/
		%feature("compactdefaultargs") SetBadCase;
		%feature("autodoc", "
Parameters
----------
value: bool

Return
-------
None

Description
-----------
Sets TheBadCase flag.
") SetBadCase;
		void SetBadCase(const Standard_Boolean value);

		/****** IGESToBRep_TopoCurve::Transfer2dCompositeCurve ******/
		/****** md5 signature: 50571025c2f9fba62d153fcb9ddb5daf ******/
		%feature("compactdefaultargs") Transfer2dCompositeCurve;
		%feature("autodoc", "
Parameters
----------
start: IGESGeom_CompositeCurve
face: TopoDS_Face
trans: gp_Trsf2d
uFact: float

Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Transfer2dCompositeCurve;
		TopoDS_Shape Transfer2dCompositeCurve(const opencascade::handle<IGESGeom_CompositeCurve> & start, const TopoDS_Face & face, const gp_Trsf2d & trans, const Standard_Real uFact);

		/****** IGESToBRep_TopoCurve::Transfer2dOffsetCurve ******/
		/****** md5 signature: 9ea4c99db8c34571c2ef39a903cf73d7 ******/
		%feature("compactdefaultargs") Transfer2dOffsetCurve;
		%feature("autodoc", "
Parameters
----------
start: IGESGeom_OffsetCurve
face: TopoDS_Face
trans: gp_Trsf2d
uFact: float

Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Transfer2dOffsetCurve;
		TopoDS_Shape Transfer2dOffsetCurve(const opencascade::handle<IGESGeom_OffsetCurve> & start, const TopoDS_Face & face, const gp_Trsf2d & trans, const Standard_Real uFact);

		/****** IGESToBRep_TopoCurve::Transfer2dPoint ******/
		/****** md5 signature: 8b6a02abc1ea12f9aac834fa5cfef25c ******/
		%feature("compactdefaultargs") Transfer2dPoint;
		%feature("autodoc", "
Parameters
----------
start: IGESGeom_Point

Return
-------
TopoDS_Vertex

Description
-----------
No available documentation.
") Transfer2dPoint;
		TopoDS_Vertex Transfer2dPoint(const opencascade::handle<IGESGeom_Point> & start);

		/****** IGESToBRep_TopoCurve::Transfer2dTopoBasicCurve ******/
		/****** md5 signature: f58ce375e1a9a395360ffc66a55dfbd7 ******/
		%feature("compactdefaultargs") Transfer2dTopoBasicCurve;
		%feature("autodoc", "
Parameters
----------
start: IGESData_IGESEntity
face: TopoDS_Face
trans: gp_Trsf2d
uFact: float

Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Transfer2dTopoBasicCurve;
		TopoDS_Shape Transfer2dTopoBasicCurve(const opencascade::handle<IGESData_IGESEntity> & start, const TopoDS_Face & face, const gp_Trsf2d & trans, const Standard_Real uFact);

		/****** IGESToBRep_TopoCurve::Transfer2dTopoCurve ******/
		/****** md5 signature: cb3566ae78ebb9677e83501e8b4f2370 ******/
		%feature("compactdefaultargs") Transfer2dTopoCurve;
		%feature("autodoc", "
Parameters
----------
start: IGESData_IGESEntity
face: TopoDS_Face
trans: gp_Trsf2d
uFact: float

Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Transfer2dTopoCurve;
		TopoDS_Shape Transfer2dTopoCurve(const opencascade::handle<IGESData_IGESEntity> & start, const TopoDS_Face & face, const gp_Trsf2d & trans, const Standard_Real uFact);

		/****** IGESToBRep_TopoCurve::TransferBoundary ******/
		/****** md5 signature: 87f81e705a30e13f19d5a656c2feb8d1 ******/
		%feature("compactdefaultargs") TransferBoundary;
		%feature("autodoc", "
Parameters
----------
start: IGESGeom_Boundary

Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") TransferBoundary;
		TopoDS_Shape TransferBoundary(const opencascade::handle<IGESGeom_Boundary> & start);

		/****** IGESToBRep_TopoCurve::TransferBoundaryOnFace ******/
		/****** md5 signature: 86ea50d86504a76a142cb4b3d25690a5 ******/
		%feature("compactdefaultargs") TransferBoundaryOnFace;
		%feature("autodoc", "
Parameters
----------
face: TopoDS_Face
start: IGESGeom_Boundary
trans: gp_Trsf2d
uFact: float

Return
-------
TopoDS_Shape

Description
-----------
Transfers a Boundary directly on a face to trim it.
") TransferBoundaryOnFace;
		TopoDS_Shape TransferBoundaryOnFace(TopoDS_Face & face, const opencascade::handle<IGESGeom_Boundary> & start, const gp_Trsf2d & trans, const Standard_Real uFact);

		/****** IGESToBRep_TopoCurve::TransferCompositeCurve ******/
		/****** md5 signature: 02ea0f91402ea059120e0d790cec9c61 ******/
		%feature("compactdefaultargs") TransferCompositeCurve;
		%feature("autodoc", "
Parameters
----------
start: IGESGeom_CompositeCurve

Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") TransferCompositeCurve;
		TopoDS_Shape TransferCompositeCurve(const opencascade::handle<IGESGeom_CompositeCurve> & start);

		/****** IGESToBRep_TopoCurve::TransferCurveOnFace ******/
		/****** md5 signature: 8597142ab2de0e4f72aa727aac30c58f ******/
		%feature("compactdefaultargs") TransferCurveOnFace;
		%feature("autodoc", "
Parameters
----------
face: TopoDS_Face
start: IGESGeom_CurveOnSurface
trans: gp_Trsf2d
uFact: float
IsCurv: bool

Return
-------
TopoDS_Shape

Description
-----------
Transfers a CurveOnSurface directly on a face to trim it. The CurveOnSurface have to be defined Outer or Inner.
") TransferCurveOnFace;
		TopoDS_Shape TransferCurveOnFace(TopoDS_Face & face, const opencascade::handle<IGESGeom_CurveOnSurface> & start, const gp_Trsf2d & trans, const Standard_Real uFact, const Standard_Boolean IsCurv);

		/****** IGESToBRep_TopoCurve::TransferCurveOnSurface ******/
		/****** md5 signature: 822da9dbb534bf8f993399d42a587c44 ******/
		%feature("compactdefaultargs") TransferCurveOnSurface;
		%feature("autodoc", "
Parameters
----------
start: IGESGeom_CurveOnSurface

Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") TransferCurveOnSurface;
		TopoDS_Shape TransferCurveOnSurface(const opencascade::handle<IGESGeom_CurveOnSurface> & start);

		/****** IGESToBRep_TopoCurve::TransferOffsetCurve ******/
		/****** md5 signature: 4980d87d4ba26ce8b0b2f44cc510e1f5 ******/
		%feature("compactdefaultargs") TransferOffsetCurve;
		%feature("autodoc", "
Parameters
----------
start: IGESGeom_OffsetCurve

Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") TransferOffsetCurve;
		TopoDS_Shape TransferOffsetCurve(const opencascade::handle<IGESGeom_OffsetCurve> & start);

		/****** IGESToBRep_TopoCurve::TransferPoint ******/
		/****** md5 signature: b3a00bc4c6242d9ad4758d6e5383d16f ******/
		%feature("compactdefaultargs") TransferPoint;
		%feature("autodoc", "
Parameters
----------
start: IGESGeom_Point

Return
-------
TopoDS_Vertex

Description
-----------
No available documentation.
") TransferPoint;
		TopoDS_Vertex TransferPoint(const opencascade::handle<IGESGeom_Point> & start);

		/****** IGESToBRep_TopoCurve::TransferTopoBasicCurve ******/
		/****** md5 signature: e1895b0c6392eb146ee0ec5248f55490 ******/
		%feature("compactdefaultargs") TransferTopoBasicCurve;
		%feature("autodoc", "
Parameters
----------
start: IGESData_IGESEntity

Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") TransferTopoBasicCurve;
		TopoDS_Shape TransferTopoBasicCurve(const opencascade::handle<IGESData_IGESEntity> & start);

		/****** IGESToBRep_TopoCurve::TransferTopoCurve ******/
		/****** md5 signature: 378732f6e2dddbf6eedd159efb8170dd ******/
		%feature("compactdefaultargs") TransferTopoCurve;
		%feature("autodoc", "
Parameters
----------
start: IGESData_IGESEntity

Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
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
		/****** IGESToBRep_TopoSurface::IGESToBRep_TopoSurface ******/
		/****** md5 signature: bfc36dea9a49886678abd5076f8e15e1 ******/
		%feature("compactdefaultargs") IGESToBRep_TopoSurface;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a tool TopoSurface ready to run, with epsilons set to 1.E-04, TheModeTopo to True, the optimization of the continuity to False.
") IGESToBRep_TopoSurface;
		 IGESToBRep_TopoSurface();

		/****** IGESToBRep_TopoSurface::IGESToBRep_TopoSurface ******/
		/****** md5 signature: 7bdb5756ed223c60394d971ac4bed14e ******/
		%feature("compactdefaultargs") IGESToBRep_TopoSurface;
		%feature("autodoc", "
Parameters
----------
CS: IGESToBRep_CurveAndSurface

Return
-------
None

Description
-----------
Creates a tool TopoSurface ready to run and sets its fields as CS's.
") IGESToBRep_TopoSurface;
		 IGESToBRep_TopoSurface(const IGESToBRep_CurveAndSurface & CS);

		/****** IGESToBRep_TopoSurface::IGESToBRep_TopoSurface ******/
		/****** md5 signature: a845555ae49db6f185495a4d4ba78aa0 ******/
		%feature("compactdefaultargs") IGESToBRep_TopoSurface;
		%feature("autodoc", "
Parameters
----------
eps: float
epsGeom: float
epsCoeff: float
mode: bool
modeapprox: bool
optimized: bool

Return
-------
None

Description
-----------
Creates a tool TopoSurface ready to run.
") IGESToBRep_TopoSurface;
		 IGESToBRep_TopoSurface(const Standard_Real eps, const Standard_Real epsGeom, const Standard_Real epsCoeff, const Standard_Boolean mode, const Standard_Boolean modeapprox, const Standard_Boolean optimized);

		/****** IGESToBRep_TopoSurface::ParamSurface ******/
		/****** md5 signature: b3e4a7c92297ca8291587daef1260389 ******/
		%feature("compactdefaultargs") ParamSurface;
		%feature("autodoc", "
Parameters
----------
start: IGESData_IGESEntity
trans: gp_Trsf2d

Return
-------
uFact: float

Description
-----------
No available documentation.
") ParamSurface;
		TopoDS_Shape ParamSurface(const opencascade::handle<IGESData_IGESEntity> & start, gp_Trsf2d & trans, Standard_Real &OutValue);

		/****** IGESToBRep_TopoSurface::TransferBoundedSurface ******/
		/****** md5 signature: e3ce1095b68cabf9ae4e640c0ef5d57d ******/
		%feature("compactdefaultargs") TransferBoundedSurface;
		%feature("autodoc", "
Parameters
----------
start: IGESGeom_BoundedSurface

Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") TransferBoundedSurface;
		TopoDS_Shape TransferBoundedSurface(const opencascade::handle<IGESGeom_BoundedSurface> & start);

		/****** IGESToBRep_TopoSurface::TransferOffsetSurface ******/
		/****** md5 signature: 83213cd303e7a7262d80105a6aef1f60 ******/
		%feature("compactdefaultargs") TransferOffsetSurface;
		%feature("autodoc", "
Parameters
----------
start: IGESGeom_OffsetSurface

Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") TransferOffsetSurface;
		TopoDS_Shape TransferOffsetSurface(const opencascade::handle<IGESGeom_OffsetSurface> & start);

		/****** IGESToBRep_TopoSurface::TransferPerforate ******/
		/****** md5 signature: 50c686c9068994095b14c9b17147dce7 ******/
		%feature("compactdefaultargs") TransferPerforate;
		%feature("autodoc", "
Parameters
----------
start: IGESBasic_SingleParent

Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") TransferPerforate;
		TopoDS_Shape TransferPerforate(const opencascade::handle<IGESBasic_SingleParent> & start);

		/****** IGESToBRep_TopoSurface::TransferPlane ******/
		/****** md5 signature: 948cfd286972c900b81f7646b557c3f6 ******/
		%feature("compactdefaultargs") TransferPlane;
		%feature("autodoc", "
Parameters
----------
start: IGESGeom_Plane

Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") TransferPlane;
		TopoDS_Shape TransferPlane(const opencascade::handle<IGESGeom_Plane> & start);

		/****** IGESToBRep_TopoSurface::TransferRuledSurface ******/
		/****** md5 signature: 63e377fa91f443109b7c8222635638e3 ******/
		%feature("compactdefaultargs") TransferRuledSurface;
		%feature("autodoc", "
Parameters
----------
start: IGESGeom_RuledSurface

Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") TransferRuledSurface;
		TopoDS_Shape TransferRuledSurface(const opencascade::handle<IGESGeom_RuledSurface> & start);

		/****** IGESToBRep_TopoSurface::TransferSurfaceOfRevolution ******/
		/****** md5 signature: e49e4945d0964d014c9dcc7773ea36d7 ******/
		%feature("compactdefaultargs") TransferSurfaceOfRevolution;
		%feature("autodoc", "
Parameters
----------
start: IGESGeom_SurfaceOfRevolution

Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") TransferSurfaceOfRevolution;
		TopoDS_Shape TransferSurfaceOfRevolution(const opencascade::handle<IGESGeom_SurfaceOfRevolution> & start);

		/****** IGESToBRep_TopoSurface::TransferTabulatedCylinder ******/
		/****** md5 signature: 6483d2a11ee32a152cc9f29fab034ed5 ******/
		%feature("compactdefaultargs") TransferTabulatedCylinder;
		%feature("autodoc", "
Parameters
----------
start: IGESGeom_TabulatedCylinder

Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") TransferTabulatedCylinder;
		TopoDS_Shape TransferTabulatedCylinder(const opencascade::handle<IGESGeom_TabulatedCylinder> & start);

		/****** IGESToBRep_TopoSurface::TransferTopoBasicSurface ******/
		/****** md5 signature: 17f0d1f83ae041d5f27d0e10d172769e ******/
		%feature("compactdefaultargs") TransferTopoBasicSurface;
		%feature("autodoc", "
Parameters
----------
start: IGESData_IGESEntity

Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") TransferTopoBasicSurface;
		TopoDS_Shape TransferTopoBasicSurface(const opencascade::handle<IGESData_IGESEntity> & start);

		/****** IGESToBRep_TopoSurface::TransferTopoSurface ******/
		/****** md5 signature: 3d99942c57af47ffaa5b09461bcfe7de ******/
		%feature("compactdefaultargs") TransferTopoSurface;
		%feature("autodoc", "
Parameters
----------
start: IGESData_IGESEntity

Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") TransferTopoSurface;
		TopoDS_Shape TransferTopoSurface(const opencascade::handle<IGESData_IGESEntity> & start);

		/****** IGESToBRep_TopoSurface::TransferTrimmedSurface ******/
		/****** md5 signature: 4f3609efd12d6cb8fbfb64d2097b849b ******/
		%feature("compactdefaultargs") TransferTrimmedSurface;
		%feature("autodoc", "
Parameters
----------
start: IGESGeom_TrimmedSurface

Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
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
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def igestobrep_AlgoContainer(*args):
	return igestobrep.AlgoContainer(*args)

@deprecated
def igestobrep_IGESCurveToSequenceOfIGESCurve(*args):
	return igestobrep.IGESCurveToSequenceOfIGESCurve(*args)

@deprecated
def igestobrep_Init(*args):
	return igestobrep.Init(*args)

@deprecated
def igestobrep_IsBRepEntity(*args):
	return igestobrep.IsBRepEntity(*args)

@deprecated
def igestobrep_IsBasicCurve(*args):
	return igestobrep.IsBasicCurve(*args)

@deprecated
def igestobrep_IsBasicSurface(*args):
	return igestobrep.IsBasicSurface(*args)

@deprecated
def igestobrep_IsCurveAndSurface(*args):
	return igestobrep.IsCurveAndSurface(*args)

@deprecated
def igestobrep_IsTopoCurve(*args):
	return igestobrep.IsTopoCurve(*args)

@deprecated
def igestobrep_IsTopoSurface(*args):
	return igestobrep.IsTopoSurface(*args)

@deprecated
def igestobrep_SetAlgoContainer(*args):
	return igestobrep.SetAlgoContainer(*args)

@deprecated
def igestobrep_TransferPCurve(*args):
	return igestobrep.TransferPCurve(*args)

}
