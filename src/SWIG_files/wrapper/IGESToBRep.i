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
/* public enums */
/* end public enums declaration */

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
		%feature("autodoc", "* Returns default AlgoContainer
	:rtype: opencascade::handle<IGESToBRep_AlgoContainer>") AlgoContainer;
		static opencascade::handle<IGESToBRep_AlgoContainer> AlgoContainer ();

		/****************** IGESCurveToSequenceOfIGESCurve ******************/
		%feature("compactdefaultargs") IGESCurveToSequenceOfIGESCurve;
		%feature("autodoc", ":param curve:
	:type curve: IGESData_IGESEntity
	:param sequence:
	:type sequence: TColStd_HSequenceOfTransient
	:rtype: int") IGESCurveToSequenceOfIGESCurve;
		static Standard_Integer IGESCurveToSequenceOfIGESCurve (const opencascade::handle<IGESData_IGESEntity> & curve,opencascade::handle<TColStd_HSequenceOfTransient> & sequence);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Creates and initializes default AlgoContainer.
	:rtype: void") Init;
		static void Init ();

		/****************** IsBRepEntity ******************/
		%feature("compactdefaultargs") IsBRepEntity;
		%feature("autodoc", "* Return True if the IGESEntity can be transfered by TransferBRepEntity. ex: VertexList, EdgeList, Loop, Face, Shell, Manifold Solid BRep Object from IGESSolid : 502, 504, 508, 510, 514, 186.
	:param start:
	:type start: IGESData_IGESEntity
	:rtype: bool") IsBRepEntity;
		static Standard_Boolean IsBRepEntity (const opencascade::handle<IGESData_IGESEntity> & start);

		/****************** IsBasicCurve ******************/
		%feature("compactdefaultargs") IsBasicCurve;
		%feature("autodoc", "* Return True if the IGESEntity can be transfered by TransferBasicCurve. ex: CircularArc, ConicArc, Line, CopiousData, BSplineCurve, SplineCurve... from IGESGeom : 104,110,112,126
	:param start:
	:type start: IGESData_IGESEntity
	:rtype: bool") IsBasicCurve;
		static Standard_Boolean IsBasicCurve (const opencascade::handle<IGESData_IGESEntity> & start);

		/****************** IsBasicSurface ******************/
		%feature("compactdefaultargs") IsBasicSurface;
		%feature("autodoc", "* Return True if the IGESEntity can be transfered by TransferBasicSurface. ex: BSplineSurface, SplineSurface... from IGESGeom : 114,128
	:param start:
	:type start: IGESData_IGESEntity
	:rtype: bool") IsBasicSurface;
		static Standard_Boolean IsBasicSurface (const opencascade::handle<IGESData_IGESEntity> & start);

		/****************** IsCurveAndSurface ******************/
		%feature("compactdefaultargs") IsCurveAndSurface;
		%feature("autodoc", "* Return True if the IGESEntity can be transfered by TransferCurveAndSurface. ex: All IGESEntity from IGESGeom
	:param start:
	:type start: IGESData_IGESEntity
	:rtype: bool") IsCurveAndSurface;
		static Standard_Boolean IsCurveAndSurface (const opencascade::handle<IGESData_IGESEntity> & start);

		/****************** IsTopoCurve ******************/
		%feature("compactdefaultargs") IsTopoCurve;
		%feature("autodoc", "* Return True if the IGESEntity can be transfered by TransferTopoCurve. ex: all Curves from IGESGeom : all basic curves,102,130,142,144
	:param start:
	:type start: IGESData_IGESEntity
	:rtype: bool") IsTopoCurve;
		static Standard_Boolean IsTopoCurve (const opencascade::handle<IGESData_IGESEntity> & start);

		/****************** IsTopoSurface ******************/
		%feature("compactdefaultargs") IsTopoSurface;
		%feature("autodoc", "* Return True if the IGESEntity can be transfered by TransferTopoSurface. ex: All Surfaces from IGESGeom : all basic surfaces,108,118,120,122,141,143
	:param start:
	:type start: IGESData_IGESEntity
	:rtype: bool") IsTopoSurface;
		static Standard_Boolean IsTopoSurface (const opencascade::handle<IGESData_IGESEntity> & start);

		/****************** SetAlgoContainer ******************/
		%feature("compactdefaultargs") SetAlgoContainer;
		%feature("autodoc", "* Sets default AlgoContainer
	:param aContainer:
	:type aContainer: IGESToBRep_AlgoContainer
	:rtype: void") SetAlgoContainer;
		static void SetAlgoContainer (const opencascade::handle<IGESToBRep_AlgoContainer> & aContainer);

		/****************** TransferPCurve ******************/
		%feature("compactdefaultargs") TransferPCurve;
		%feature("autodoc", ":param fromedge:
	:type fromedge: TopoDS_Edge
	:param toedge:
	:type toedge: TopoDS_Edge
	:param face:
	:type face: TopoDS_Face
	:rtype: bool") TransferPCurve;
		static Standard_Boolean TransferPCurve (const TopoDS_Edge & fromedge,const TopoDS_Edge & toedge,const TopoDS_Face & face);

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
		/****************** GetContinuity ******************/
		%feature("compactdefaultargs") GetContinuity;
		%feature("autodoc", "* Return 'thecontinuity'
	:rtype: int") GetContinuity;
		Standard_Integer GetContinuity ();

		/****************** IGESToBRep_Actor ******************/
		%feature("compactdefaultargs") IGESToBRep_Actor;
		%feature("autodoc", ":rtype: None") IGESToBRep_Actor;
		 IGESToBRep_Actor ();

		/****************** Recognize ******************/
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", ":param start:
	:type start: Standard_Transient
	:rtype: bool") Recognize;
		virtual Standard_Boolean Recognize (const opencascade::handle<Standard_Transient> & start);

		/****************** SetContinuity ******************/
		%feature("compactdefaultargs") SetContinuity;
		%feature("autodoc", "* ---Purpose By default continuity = 0 if continuity = 1 : try C1 if continuity = 2 : try C2
	:param continuity: default value is 0
	:type continuity: int
	:rtype: None") SetContinuity;
		void SetContinuity (const Standard_Integer continuity = 0);

		/****************** SetModel ******************/
		%feature("compactdefaultargs") SetModel;
		%feature("autodoc", ":param model:
	:type model: Interface_InterfaceModel
	:rtype: None") SetModel;
		void SetModel (const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** Transfer ******************/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", ":param start:
	:type start: Standard_Transient
	:param TP:
	:type TP: Transfer_TransientProcess
	:rtype: opencascade::handle<Transfer_Binder>") Transfer;
		virtual opencascade::handle<Transfer_Binder> Transfer (const opencascade::handle<Standard_Transient> & start,const opencascade::handle<Transfer_TransientProcess> & TP);

		/****************** UsedTolerance ******************/
		%feature("compactdefaultargs") UsedTolerance;
		%feature("autodoc", "* Returns the tolerance which was actually used, either from the file or from statics
	:rtype: float") UsedTolerance;
		Standard_Real UsedTolerance ();

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") IGESToBRep_AlgoContainer;
		 IGESToBRep_AlgoContainer ();

		/****************** SetToolContainer ******************/
		%feature("compactdefaultargs") SetToolContainer;
		%feature("autodoc", "* Sets ToolContainer
	:param TC:
	:type TC: IGESToBRep_ToolContainer
	:rtype: None") SetToolContainer;
		void SetToolContainer (const opencascade::handle<IGESToBRep_ToolContainer> & TC);

		/****************** ToolContainer ******************/
		%feature("compactdefaultargs") ToolContainer;
		%feature("autodoc", "* Returns ToolContainer
	:rtype: opencascade::handle<IGESToBRep_ToolContainer>") ToolContainer;
		opencascade::handle<IGESToBRep_ToolContainer> ToolContainer ();

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
		/****************** AddShapeResult ******************/
		%feature("compactdefaultargs") AddShapeResult;
		%feature("autodoc", "* set in 'myMap' the result of the transfer of the entity of the IGESEntity start ( type VertexList or EdgeList).
	:param start:
	:type start: IGESData_IGESEntity
	:param result:
	:type result: TopoDS_Shape
	:rtype: None") AddShapeResult;
		void AddShapeResult (const opencascade::handle<IGESData_IGESEntity> & start,const TopoDS_Shape & result);

		/****************** GetContinuity ******************/
		%feature("compactdefaultargs") GetContinuity;
		%feature("autodoc", "* Returns the value of 'myContinuity'
	:rtype: int") GetContinuity;
		Standard_Integer GetContinuity ();

		/****************** GetEpsCoeff ******************/
		%feature("compactdefaultargs") GetEpsCoeff;
		%feature("autodoc", "* Returns the value of 'myEpsCoeff'
	:rtype: float") GetEpsCoeff;
		Standard_Real GetEpsCoeff ();

		/****************** GetEpsGeom ******************/
		%feature("compactdefaultargs") GetEpsGeom;
		%feature("autodoc", "* Returns the value of 'myEpsGeom'
	:rtype: float") GetEpsGeom;
		Standard_Real GetEpsGeom ();

		/****************** GetEpsilon ******************/
		%feature("compactdefaultargs") GetEpsilon;
		%feature("autodoc", "* Returns the value of 'myEps'
	:rtype: float") GetEpsilon;
		Standard_Real GetEpsilon ();

		/****************** GetMaxTol ******************/
		%feature("compactdefaultargs") GetMaxTol;
		%feature("autodoc", "* Returns the value of 'myMaxTol'
	:rtype: float") GetMaxTol;
		Standard_Real GetMaxTol ();

		/****************** GetMinTol ******************/
		%feature("compactdefaultargs") GetMinTol;
		%feature("autodoc", "* Returns the value of 'myMinTol'
	:rtype: float") GetMinTol;
		Standard_Real GetMinTol ();

		/****************** GetModeApprox ******************/
		%feature("compactdefaultargs") GetModeApprox;
		%feature("autodoc", "* Returns the value of 'myModeApprox'
	:rtype: bool") GetModeApprox;
		Standard_Boolean GetModeApprox ();

		/****************** GetModeTransfer ******************/
		%feature("compactdefaultargs") GetModeTransfer;
		%feature("autodoc", "* Returns the value of 'myModeIsTopo'
	:rtype: bool") GetModeTransfer;
		Standard_Boolean GetModeTransfer ();

		/****************** GetModel ******************/
		%feature("compactdefaultargs") GetModel;
		%feature("autodoc", "* Returns the value of 'myModel'
	:rtype: opencascade::handle<IGESData_IGESModel>") GetModel;
		opencascade::handle<IGESData_IGESModel> GetModel ();

		/****************** GetOptimized ******************/
		%feature("compactdefaultargs") GetOptimized;
		%feature("autodoc", "* Returns the value of 'myContIsOpti'
	:rtype: bool") GetOptimized;
		Standard_Boolean GetOptimized ();

		/****************** GetShapeResult ******************/
		%feature("compactdefaultargs") GetShapeResult;
		%feature("autodoc", "* Returns the result of the transfer of the IGESEntity 'start' contained in 'myMap' . (if HasShapeResult is True).
	:param start:
	:type start: IGESData_IGESEntity
	:rtype: TopoDS_Shape") GetShapeResult;
		TopoDS_Shape GetShapeResult (const opencascade::handle<IGESData_IGESEntity> & start);

		/****************** GetShapeResult ******************/
		%feature("compactdefaultargs") GetShapeResult;
		%feature("autodoc", "* Returns the numth result of the IGESEntity start (type VertexList or EdgeList) in 'myMap'. (if NbShapeResult is not null).
	:param start:
	:type start: IGESData_IGESEntity
	:param num:
	:type num: int
	:rtype: TopoDS_Shape") GetShapeResult;
		TopoDS_Shape GetShapeResult (const opencascade::handle<IGESData_IGESEntity> & start,const Standard_Integer num);

		/****************** GetSurfaceCurve ******************/
		%feature("compactdefaultargs") GetSurfaceCurve;
		%feature("autodoc", "* Returns the value of ' mySurfaceCurve' 0 = value in file , 2 = kepp 2d and compute 3d 3 = keep 3d and compute 2d
	:rtype: int") GetSurfaceCurve;
		Standard_Integer GetSurfaceCurve ();

		/****************** GetTransferProcess ******************/
		%feature("compactdefaultargs") GetTransferProcess;
		%feature("autodoc", "* Returns the value of 'myMsgReg'
	:rtype: opencascade::handle<Transfer_TransientProcess>") GetTransferProcess;
		opencascade::handle<Transfer_TransientProcess> GetTransferProcess ();

		/****************** GetUVResolution ******************/
		%feature("compactdefaultargs") GetUVResolution;
		%feature("autodoc", ":rtype: float") GetUVResolution;
		Standard_Real GetUVResolution ();

		/****************** GetUnitFactor ******************/
		%feature("compactdefaultargs") GetUnitFactor;
		%feature("autodoc", "* Returns the value of ' myUnitFactor'
	:rtype: float") GetUnitFactor;
		Standard_Real GetUnitFactor ();

		/****************** HasShapeResult ******************/
		%feature("compactdefaultargs") HasShapeResult;
		%feature("autodoc", "* Returns True if start was already treated and has a result in 'myMap' else returns False.
	:param start:
	:type start: IGESData_IGESEntity
	:rtype: bool") HasShapeResult;
		Standard_Boolean HasShapeResult (const opencascade::handle<IGESData_IGESEntity> & start);

		/****************** IGESToBRep_CurveAndSurface ******************/
		%feature("compactdefaultargs") IGESToBRep_CurveAndSurface;
		%feature("autodoc", "* Creates a tool CurveAndSurface ready to run, with epsilons set to 1.E-04, myModeTopo to True, the optimization of the continuity to False.
	:rtype: None") IGESToBRep_CurveAndSurface;
		 IGESToBRep_CurveAndSurface ();

		/****************** IGESToBRep_CurveAndSurface ******************/
		%feature("compactdefaultargs") IGESToBRep_CurveAndSurface;
		%feature("autodoc", "* Creates a tool CurveAndSurface ready to run and sets its fields as CS's.
	:param CS:
	:type CS: IGESToBRep_CurveAndSurface
	:rtype: None") IGESToBRep_CurveAndSurface;
		 IGESToBRep_CurveAndSurface (const IGESToBRep_CurveAndSurface & CS);

		/****************** IGESToBRep_CurveAndSurface ******************/
		%feature("compactdefaultargs") IGESToBRep_CurveAndSurface;
		%feature("autodoc", "* Creates a tool CurveAndSurface ready to run.
	:param eps:
	:type eps: float
	:param epsGeom:
	:type epsGeom: float
	:param epsCoeff:
	:type epsCoeff: float
	:param mode:
	:type mode: bool
	:param modeapprox:
	:type modeapprox: bool
	:param optimized:
	:type optimized: bool
	:rtype: None") IGESToBRep_CurveAndSurface;
		 IGESToBRep_CurveAndSurface (const Standard_Real eps,const Standard_Real epsGeom,const Standard_Real epsCoeff,const Standard_Boolean mode,const Standard_Boolean modeapprox,const Standard_Boolean optimized);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes the field of the tool CurveAndSurface with default creating values.
	:rtype: None") Init;
		void Init ();

		/****************** NbShapeResult ******************/
		%feature("compactdefaultargs") NbShapeResult;
		%feature("autodoc", "* Returns the number of shapes results contained in 'myMap' for the IGESEntity start ( type VertexList or EdgeList).
	:param start:
	:type start: IGESData_IGESEntity
	:rtype: int") NbShapeResult;
		Standard_Integer NbShapeResult (const opencascade::handle<IGESData_IGESEntity> & start);

		/****************** SendFail ******************/
		%feature("compactdefaultargs") SendFail;
		%feature("autodoc", "* Records a new Fail message
	:param start:
	:type start: IGESData_IGESEntity
	:param amsg:
	:type amsg: Message_Msg
	:rtype: None") SendFail;
		void SendFail (const opencascade::handle<IGESData_IGESEntity> & start,const Message_Msg & amsg);

		/****************** SendMsg ******************/
		%feature("compactdefaultargs") SendMsg;
		%feature("autodoc", "* Records a new Information message from the definition of a Msg (Original+Value)
	:param start:
	:type start: IGESData_IGESEntity
	:param amsg:
	:type amsg: Message_Msg
	:rtype: None") SendMsg;
		void SendMsg (const opencascade::handle<IGESData_IGESEntity> & start,const Message_Msg & amsg);

		/****************** SendWarning ******************/
		%feature("compactdefaultargs") SendWarning;
		%feature("autodoc", "* Records a new Warning message
	:param start:
	:type start: IGESData_IGESEntity
	:param amsg:
	:type amsg: Message_Msg
	:rtype: None") SendWarning;
		void SendWarning (const opencascade::handle<IGESData_IGESEntity> & start,const Message_Msg & amsg);

		/****************** SetContinuity ******************/
		%feature("compactdefaultargs") SetContinuity;
		%feature("autodoc", "* Changes the value of 'myContinuity' if continuity = 0 do nothing else if continuity = 1 try C1 if continuity = 2 try C2
	:param continuity:
	:type continuity: int
	:rtype: None") SetContinuity;
		void SetContinuity (const Standard_Integer continuity);

		/****************** SetEpsCoeff ******************/
		%feature("compactdefaultargs") SetEpsCoeff;
		%feature("autodoc", "* Changes the value of 'myEpsCoeff'
	:param eps:
	:type eps: float
	:rtype: None") SetEpsCoeff;
		void SetEpsCoeff (const Standard_Real eps);

		/****************** SetEpsGeom ******************/
		%feature("compactdefaultargs") SetEpsGeom;
		%feature("autodoc", "* Changes the value of 'myEpsGeom'
	:param eps:
	:type eps: float
	:rtype: None") SetEpsGeom;
		void SetEpsGeom (const Standard_Real eps);

		/****************** SetEpsilon ******************/
		%feature("compactdefaultargs") SetEpsilon;
		%feature("autodoc", "* Changes the value of 'myEps'
	:param eps:
	:type eps: float
	:rtype: None") SetEpsilon;
		void SetEpsilon (const Standard_Real eps);

		/****************** SetMaxTol ******************/
		%feature("compactdefaultargs") SetMaxTol;
		%feature("autodoc", "* Changes the value of 'myMaxTol'
	:param maxtol:
	:type maxtol: float
	:rtype: None") SetMaxTol;
		void SetMaxTol (const Standard_Real maxtol);

		/****************** SetMinTol ******************/
		%feature("compactdefaultargs") SetMinTol;
		%feature("autodoc", "* Changes the value of 'myMinTol'
	:param mintol:
	:type mintol: float
	:rtype: None") SetMinTol;
		void SetMinTol (const Standard_Real mintol);

		/****************** SetModeApprox ******************/
		%feature("compactdefaultargs") SetModeApprox;
		%feature("autodoc", "* Changes the value of 'myModeApprox'
	:param mode:
	:type mode: bool
	:rtype: None") SetModeApprox;
		void SetModeApprox (const Standard_Boolean mode);

		/****************** SetModeTransfer ******************/
		%feature("compactdefaultargs") SetModeTransfer;
		%feature("autodoc", "* Changes the value of 'myModeIsTopo'
	:param mode:
	:type mode: bool
	:rtype: None") SetModeTransfer;
		void SetModeTransfer (const Standard_Boolean mode);

		/****************** SetModel ******************/
		%feature("compactdefaultargs") SetModel;
		%feature("autodoc", "* Set the value of 'myModel'
	:param model:
	:type model: IGESData_IGESModel
	:rtype: None") SetModel;
		void SetModel (const opencascade::handle<IGESData_IGESModel> & model);

		/****************** SetOptimized ******************/
		%feature("compactdefaultargs") SetOptimized;
		%feature("autodoc", "* Changes the value of 'myContIsOpti'
	:param optimized:
	:type optimized: bool
	:rtype: None") SetOptimized;
		void SetOptimized (const Standard_Boolean optimized);

		/****************** SetShapeResult ******************/
		%feature("compactdefaultargs") SetShapeResult;
		%feature("autodoc", "* set in 'myMap' the result of the transfer of the IGESEntity 'start'.
	:param start:
	:type start: IGESData_IGESEntity
	:param result:
	:type result: TopoDS_Shape
	:rtype: None") SetShapeResult;
		void SetShapeResult (const opencascade::handle<IGESData_IGESEntity> & start,const TopoDS_Shape & result);

		/****************** SetSurface ******************/
		%feature("compactdefaultargs") SetSurface;
		%feature("autodoc", ":param theSurface:
	:type theSurface: Geom_Surface
	:rtype: None") SetSurface;
		void SetSurface (const opencascade::handle<Geom_Surface> & theSurface);

		/****************** SetSurfaceCurve ******************/
		%feature("compactdefaultargs") SetSurfaceCurve;
		%feature("autodoc", "* Changes the value of 'mySurfaceCurve'
	:param ival:
	:type ival: int
	:rtype: None") SetSurfaceCurve;
		void SetSurfaceCurve (const Standard_Integer ival);

		/****************** SetTransferProcess ******************/
		%feature("compactdefaultargs") SetTransferProcess;
		%feature("autodoc", "* Set the value of 'myMsgReg'
	:param TP:
	:type TP: Transfer_TransientProcess
	:rtype: None") SetTransferProcess;
		void SetTransferProcess (const opencascade::handle<Transfer_TransientProcess> & TP);

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", ":rtype: opencascade::handle<Geom_Surface>") Surface;
		opencascade::handle<Geom_Surface> Surface ();

		/****************** TransferCurveAndSurface ******************/
		%feature("compactdefaultargs") TransferCurveAndSurface;
		%feature("autodoc", "* Returns the result of the transfert of any IGES Curve or Surface Entity. If the transfer has failed, this member return a NullEntity.
	:param start:
	:type start: IGESData_IGESEntity
	:rtype: TopoDS_Shape") TransferCurveAndSurface;
		TopoDS_Shape TransferCurveAndSurface (const opencascade::handle<IGESData_IGESEntity> & start);

		/****************** TransferGeometry ******************/
		%feature("compactdefaultargs") TransferGeometry;
		%feature("autodoc", "* Returns the result of the transfert the geometry of any IGESEntity. If the transfer has failed, this member return a NullEntity.
	:param start:
	:type start: IGESData_IGESEntity
	:rtype: TopoDS_Shape") TransferGeometry;
		TopoDS_Shape TransferGeometry (const opencascade::handle<IGESData_IGESEntity> & start);

		/****************** UpdateMinMaxTol ******************/
		%feature("compactdefaultargs") UpdateMinMaxTol;
		%feature("autodoc", "* Sets values of 'myMinTol' and 'myMaxTol' as follows myMaxTol = Max ('read.maxprecision.val', myEpsGeom * myUnitFactor) myMinTol = Precision::Confusion() Remark: This method is automatically invoked each time the values of 'myEpsGeom' or 'myUnitFactor' are changed
	:rtype: None") UpdateMinMaxTol;
		void UpdateMinMaxTol ();

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
		/****************** Check ******************/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "* Checks result of translation of IGES boundary entities (types 141, 142 or 508). Checks consistency of 2D and 3D representations and keeps only one if they are inconsistent. <result>: result of translation (returned by Transfer), <checkclosure>: False for 142 without parent 144 entity, otherwise True, <okCurve3d>, <okCurve2d>: those returned by Transfer.
	:param result:
	:type result: bool
	:param checkclosure:
	:type checkclosure: bool
	:param okCurve3d:
	:type okCurve3d: bool
	:param okCurve2d:
	:type okCurve2d: bool
	:rtype: void") Check;
		virtual void Check (const Standard_Boolean result,const Standard_Boolean checkclosure,const Standard_Boolean okCurve3d,const Standard_Boolean okCurve2d);

		/****************** IGESToBRep_IGESBoundary ******************/
		%feature("compactdefaultargs") IGESToBRep_IGESBoundary;
		%feature("autodoc", "* Empty constructor
	:rtype: None") IGESToBRep_IGESBoundary;
		 IGESToBRep_IGESBoundary ();

		/****************** IGESToBRep_IGESBoundary ******************/
		%feature("compactdefaultargs") IGESToBRep_IGESBoundary;
		%feature("autodoc", "* Empty constructor
	:param CS:
	:type CS: IGESToBRep_CurveAndSurface
	:rtype: None") IGESToBRep_IGESBoundary;
		 IGESToBRep_IGESBoundary (const IGESToBRep_CurveAndSurface & CS);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Inits the object with parameters common for all types of IGES boundaries. <CS>: object to be used for retrieving translation parameters and sending messages, <entity>: boundary entity to be processed, <face>, <trans>, <uFact>: as for IGESToBRep_TopoCurve <filepreference>: preferred representation (2 or 3) given in the IGES file
	:param CS:
	:type CS: IGESToBRep_CurveAndSurface
	:param entity:
	:type entity: IGESData_IGESEntity
	:param face:
	:type face: TopoDS_Face
	:param trans:
	:type trans: gp_Trsf2d
	:param uFact:
	:type uFact: float
	:param filepreference:
	:type filepreference: int
	:rtype: None") Init;
		void Init (const IGESToBRep_CurveAndSurface & CS,const opencascade::handle<IGESData_IGESEntity> & entity,const TopoDS_Face & face,const gp_Trsf2d & trans,const Standard_Real uFact,const Standard_Integer filepreference);

		/****************** Transfer ******************/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "* Translates 141 and 142 entities. Returns True if the curve has been successfully translated, otherwise returns False. <okCurve..>: flags that indicate whether corresponding representation has been successfully translated (must be set to True before first call), <curve3d>: model space curve for 142 and current model space curve for 141, <toreverse3d>: False for 142 and current orientation flag for 141, <curves2d>: 1 parameter space curve for 142 or list of them for current model space curves for 141, <number>: 1 for 142 and rank number of model space curve for 141.
	:param okCurve:
	:type okCurve: bool
	:param okCurve3d:
	:type okCurve3d: bool
	:param okCurve2d:
	:type okCurve2d: bool
	:param curve3d:
	:type curve3d: IGESData_IGESEntity
	:param toreverse3d:
	:type toreverse3d: bool
	:param curves2d:
	:type curves2d: IGESData_HArray1OfIGESEntity
	:param number:
	:type number: int
	:rtype: bool") Transfer;
		Standard_Boolean Transfer (Standard_Boolean &OutValue,Standard_Boolean &OutValue,Standard_Boolean &OutValue,const opencascade::handle<IGESData_IGESEntity> & curve3d,const Standard_Boolean toreverse3d,const opencascade::handle<IGESData_HArray1OfIGESEntity> & curves2d,const Standard_Integer number);

		/****************** Transfer ******************/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "* Translates 508 entity. Returns True if the curve has been successfully translated, otherwise returns False. Input object IGESBoundary must be created and initialized before. <okCurve..>: flags that indicate whether corresponding representation has been successfully translated (must be set to True before first call), <curve3d>: result of translation of current edge, <curves2d>: list of parameter space curves for edge, <toreverse2d>: orientation flag of current edge in respect to its model space curve, <number>: rank number of edge, <lsewd>: returns the result of translation of current edge.
	:param okCurve:
	:type okCurve: bool
	:param okCurve3d:
	:type okCurve3d: bool
	:param okCurve2d:
	:type okCurve2d: bool
	:param curve3d:
	:type curve3d: ShapeExtend_WireData
	:param curves2d:
	:type curves2d: IGESData_HArray1OfIGESEntity
	:param toreverse2d:
	:type toreverse2d: bool
	:param number:
	:type number: int
	:param lsewd:
	:type lsewd: ShapeExtend_WireData
	:rtype: bool") Transfer;
		Standard_Boolean Transfer (Standard_Boolean &OutValue,Standard_Boolean &OutValue,Standard_Boolean &OutValue,const opencascade::handle<ShapeExtend_WireData> & curve3d,const opencascade::handle<IGESData_HArray1OfIGESEntity> & curves2d,const Standard_Boolean toreverse2d,const Standard_Integer number,opencascade::handle<ShapeExtend_WireData> & lsewd);

		/****************** WireData ******************/
		%feature("compactdefaultargs") WireData;
		%feature("autodoc", "* Returns the resulting wire
	:rtype: opencascade::handle<ShapeExtend_WireData>") WireData;
		opencascade::handle<ShapeExtend_WireData> WireData ();

		/****************** WireData2d ******************/
		%feature("compactdefaultargs") WireData2d;
		%feature("autodoc", "* Returns the the wire from 2D curves (edges contain pcurves only)
	:rtype: opencascade::handle<ShapeExtend_WireData>") WireData2d;
		opencascade::handle<ShapeExtend_WireData> WireData2d ();

		/****************** WireData3d ******************/
		%feature("compactdefaultargs") WireData3d;
		%feature("autodoc", "* Returns the wire from 3D curves (edges contain 3D curves and may contain pcurves)
	:rtype: opencascade::handle<ShapeExtend_WireData>") WireData3d;
		opencascade::handle<ShapeExtend_WireData> WireData3d ();

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
		/****************** Actor ******************/
		%feature("compactdefaultargs") Actor;
		%feature("autodoc", "* Returns 'theActor'
	:rtype: opencascade::handle<IGESToBRep_Actor>") Actor;
		opencascade::handle<IGESToBRep_Actor> Actor ();

		/****************** Check ******************/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "* Checks the IGES file that was loaded into memory. Displays error messages in the default message file if withprint is true. Returns True if no fail message was found and False if there was at least one fail message.
	:param withprint:
	:type withprint: bool
	:rtype: bool") Check;
		Standard_Boolean Check (const Standard_Boolean withprint);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Clears the results between two translation operations.
	:rtype: None") Clear;
		void Clear ();

		/****************** IGESToBRep_Reader ******************/
		%feature("compactdefaultargs") IGESToBRep_Reader;
		%feature("autodoc", "* Creates a Reader
	:rtype: None") IGESToBRep_Reader;
		 IGESToBRep_Reader ();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* Returns True if the LAST Transfer/TransferRoots was a success
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** LoadFile ******************/
		%feature("compactdefaultargs") LoadFile;
		%feature("autodoc", "* Loads a Model from a file.Returns 0 if success. returns 1 if the file could not be opened, returns -1 if an error occurred while the file was being loaded.
	:param filename:
	:type filename: char *
	:rtype: int") LoadFile;
		Standard_Integer LoadFile (const char * filename);

		/****************** Model ******************/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "* Returns the Model to be worked on.
	:rtype: opencascade::handle<IGESData_IGESModel>") Model;
		opencascade::handle<IGESData_IGESModel> Model ();

		/****************** NbShapes ******************/
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", "* Returns the number of shapes produced by the translation.
	:rtype: int") NbShapes;
		Standard_Integer NbShapes ();

		/****************** OneShape ******************/
		%feature("compactdefaultargs") OneShape;
		%feature("autodoc", "* Returns all of the results in a single shape which is: - a null shape if there are no results, - a shape if there is one result, - a compound containing the resulting shapes if there are several.
	:rtype: TopoDS_Shape") OneShape;
		TopoDS_Shape OneShape ();

		/****************** SetModel ******************/
		%feature("compactdefaultargs") SetModel;
		%feature("autodoc", "* Specifies a Model to work on Also clears the result and Done status, sets TransientProcess
	:param model:
	:type model: IGESData_IGESModel
	:rtype: None") SetModel;
		void SetModel (const opencascade::handle<IGESData_IGESModel> & model);

		/****************** SetTransientProcess ******************/
		%feature("compactdefaultargs") SetTransientProcess;
		%feature("autodoc", "* Allows to set an already defined TransientProcess (to be called after LoadFile or SetModel)
	:param TP:
	:type TP: Transfer_TransientProcess
	:rtype: None") SetTransientProcess;
		void SetTransientProcess (const opencascade::handle<Transfer_TransientProcess> & TP);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "* Returns the num the resulting shape in a translation operation.
	:param num: default value is 1
	:type num: int
	:rtype: TopoDS_Shape") Shape;
		TopoDS_Shape Shape (const Standard_Integer num = 1);

		/****************** Transfer ******************/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "* Transfers an Entity given its rank in the Model (Root or not) Returns True if it is recognized as Geom-Topol. (But it can have failed : see IsDone)
	:param num:
	:type num: int
	:rtype: bool") Transfer;
		Standard_Boolean Transfer (const Standard_Integer num);

		/****************** TransferRoots ******************/
		%feature("compactdefaultargs") TransferRoots;
		%feature("autodoc", "* Translates root entities in an IGES file. Standard_True is the default value and means that only visible root entities are translated. Standard_False translates all of the roots (visible and invisible).
	:param onlyvisible: default value is Standard_True
	:type onlyvisible: bool
	:rtype: None") TransferRoots;
		void TransferRoots (const Standard_Boolean onlyvisible = Standard_True);

		/****************** TransientProcess ******************/
		%feature("compactdefaultargs") TransientProcess;
		%feature("autodoc", "* Returns the TransientProcess
	:rtype: opencascade::handle<Transfer_TransientProcess>") TransientProcess;
		opencascade::handle<Transfer_TransientProcess> TransientProcess ();

		/****************** UsedTolerance ******************/
		%feature("compactdefaultargs") UsedTolerance;
		%feature("autodoc", "* Returns the Tolerance which has been actually used, converted in millimeters (either that from File or that from Session, according the mode)
	:rtype: float") UsedTolerance;
		Standard_Real UsedTolerance ();

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
		/****************** IGESBoundary ******************/
		%feature("compactdefaultargs") IGESBoundary;
		%feature("autodoc", "* Returns IGESToBRep_IGESBoundary
	:rtype: opencascade::handle<IGESToBRep_IGESBoundary>") IGESBoundary;
		virtual opencascade::handle<IGESToBRep_IGESBoundary> IGESBoundary ();

		/****************** IGESToBRep_ToolContainer ******************/
		%feature("compactdefaultargs") IGESToBRep_ToolContainer;
		%feature("autodoc", "* Empty constructor
	:rtype: None") IGESToBRep_ToolContainer;
		 IGESToBRep_ToolContainer ();

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
		%feature("autodoc", "* Creates a tool BRepEntity ready to run, with epsilons set to 1.E-04, TheModeTopo to True, the optimization of the continuity to False.
	:rtype: None") IGESToBRep_BRepEntity;
		 IGESToBRep_BRepEntity ();

		/****************** IGESToBRep_BRepEntity ******************/
		%feature("compactdefaultargs") IGESToBRep_BRepEntity;
		%feature("autodoc", "* Creates a tool BRepEntity ready to run and sets its fields as CS's.
	:param CS:
	:type CS: IGESToBRep_CurveAndSurface
	:rtype: None") IGESToBRep_BRepEntity;
		 IGESToBRep_BRepEntity (const IGESToBRep_CurveAndSurface & CS);

		/****************** IGESToBRep_BRepEntity ******************/
		%feature("compactdefaultargs") IGESToBRep_BRepEntity;
		%feature("autodoc", "* Creates a tool BRepEntity ready to run.
	:param eps:
	:type eps: float
	:param epsGeom:
	:type epsGeom: float
	:param epsCoeff:
	:type epsCoeff: float
	:param mode:
	:type mode: bool
	:param modeapprox:
	:type modeapprox: bool
	:param optimized:
	:type optimized: bool
	:rtype: None") IGESToBRep_BRepEntity;
		 IGESToBRep_BRepEntity (const Standard_Real eps,const Standard_Real epsGeom,const Standard_Real epsCoeff,const Standard_Boolean mode,const Standard_Boolean modeapprox,const Standard_Boolean optimized);

		/****************** TransferBRepEntity ******************/
		%feature("compactdefaultargs") TransferBRepEntity;
		%feature("autodoc", "* Transfer the BRepEntity' : Face, Shell or ManifoldSolid.
	:param start:
	:type start: IGESData_IGESEntity
	:rtype: TopoDS_Shape") TransferBRepEntity;
		TopoDS_Shape TransferBRepEntity (const opencascade::handle<IGESData_IGESEntity> & start);

		/****************** TransferEdge ******************/
		%feature("compactdefaultargs") TransferEdge;
		%feature("autodoc", "* Transfer the entity number 'index' of the EdgeList 'start'.
	:param start:
	:type start: IGESSolid_EdgeList
	:param index:
	:type index: int
	:rtype: TopoDS_Shape") TransferEdge;
		TopoDS_Shape TransferEdge (const opencascade::handle<IGESSolid_EdgeList> & start,const Standard_Integer index);

		/****************** TransferFace ******************/
		%feature("compactdefaultargs") TransferFace;
		%feature("autodoc", "* Transfer the Face Entity
	:param start:
	:type start: IGESSolid_Face
	:rtype: TopoDS_Shape") TransferFace;
		TopoDS_Shape TransferFace (const opencascade::handle<IGESSolid_Face> & start);

		/****************** TransferLoop ******************/
		%feature("compactdefaultargs") TransferLoop;
		%feature("autodoc", "* Transfer the Loop Entity
	:param start:
	:type start: IGESSolid_Loop
	:param Face:
	:type Face: TopoDS_Face
	:param trans:
	:type trans: gp_Trsf2d
	:param uFact:
	:type uFact: float
	:rtype: TopoDS_Shape") TransferLoop;
		TopoDS_Shape TransferLoop (const opencascade::handle<IGESSolid_Loop> & start,const TopoDS_Face & Face,const gp_Trsf2d & trans,const Standard_Real uFact);

		/****************** TransferManifoldSolid ******************/
		%feature("compactdefaultargs") TransferManifoldSolid;
		%feature("autodoc", "* Transfer the ManifoldSolid Entity
	:param start:
	:type start: IGESSolid_ManifoldSolid
	:rtype: TopoDS_Shape") TransferManifoldSolid;
		TopoDS_Shape TransferManifoldSolid (const opencascade::handle<IGESSolid_ManifoldSolid> & start);

		/****************** TransferShell ******************/
		%feature("compactdefaultargs") TransferShell;
		%feature("autodoc", "* Transfer the Shell Entity
	:param start:
	:type start: IGESSolid_Shell
	:rtype: TopoDS_Shape") TransferShell;
		TopoDS_Shape TransferShell (const opencascade::handle<IGESSolid_Shell> & start);

		/****************** TransferVertex ******************/
		%feature("compactdefaultargs") TransferVertex;
		%feature("autodoc", "* Transfer the entity number 'index' of the VertexList 'start'
	:param start:
	:type start: IGESSolid_VertexList
	:param index:
	:type index: int
	:rtype: TopoDS_Vertex") TransferVertex;
		TopoDS_Vertex TransferVertex (const opencascade::handle<IGESSolid_VertexList> & start,const Standard_Integer index);

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
		%feature("autodoc", "* Creates a tool BasicCurve ready to run, with epsilons set to 1.E-04, TheModeTopo to True, the optimization of the continuity to False.
	:rtype: None") IGESToBRep_BasicCurve;
		 IGESToBRep_BasicCurve ();

		/****************** IGESToBRep_BasicCurve ******************/
		%feature("compactdefaultargs") IGESToBRep_BasicCurve;
		%feature("autodoc", "* Creates a tool BasicCurve ready to run and sets its fields as CS's.
	:param CS:
	:type CS: IGESToBRep_CurveAndSurface
	:rtype: None") IGESToBRep_BasicCurve;
		 IGESToBRep_BasicCurve (const IGESToBRep_CurveAndSurface & CS);

		/****************** IGESToBRep_BasicCurve ******************/
		%feature("compactdefaultargs") IGESToBRep_BasicCurve;
		%feature("autodoc", "* Creates a tool BasicCurve ready to run.
	:param eps:
	:type eps: float
	:param epsGeom:
	:type epsGeom: float
	:param epsCoeff:
	:type epsCoeff: float
	:param mode:
	:type mode: bool
	:param modeapprox:
	:type modeapprox: bool
	:param optimized:
	:type optimized: bool
	:rtype: None") IGESToBRep_BasicCurve;
		 IGESToBRep_BasicCurve (const Standard_Real eps,const Standard_Real epsGeom,const Standard_Real epsCoeff,const Standard_Boolean mode,const Standard_Boolean modeapprox,const Standard_Boolean optimized);

		/****************** Transfer2dBSplineCurve ******************/
		%feature("compactdefaultargs") Transfer2dBSplineCurve;
		%feature("autodoc", ":param start:
	:type start: IGESGeom_BSplineCurve
	:rtype: opencascade::handle<Geom2d_Curve>") Transfer2dBSplineCurve;
		opencascade::handle<Geom2d_Curve> Transfer2dBSplineCurve (const opencascade::handle<IGESGeom_BSplineCurve> & start);

		/****************** Transfer2dBasicCurve ******************/
		%feature("compactdefaultargs") Transfer2dBasicCurve;
		%feature("autodoc", "* Transfert a IGESEntity which answer True to the member : IGESToBRep::IsBasicCurve(IGESEntity). The IGESEntity must be a curve UV and its associed TRSF must be planar .If this Entity could not be converted, this member returns a NullEntity.
	:param start:
	:type start: IGESData_IGESEntity
	:rtype: opencascade::handle<Geom2d_Curve>") Transfer2dBasicCurve;
		opencascade::handle<Geom2d_Curve> Transfer2dBasicCurve (const opencascade::handle<IGESData_IGESEntity> & start);

		/****************** Transfer2dCircularArc ******************/
		%feature("compactdefaultargs") Transfer2dCircularArc;
		%feature("autodoc", ":param start:
	:type start: IGESGeom_CircularArc
	:rtype: opencascade::handle<Geom2d_Curve>") Transfer2dCircularArc;
		opencascade::handle<Geom2d_Curve> Transfer2dCircularArc (const opencascade::handle<IGESGeom_CircularArc> & start);

		/****************** Transfer2dConicArc ******************/
		%feature("compactdefaultargs") Transfer2dConicArc;
		%feature("autodoc", ":param start:
	:type start: IGESGeom_ConicArc
	:rtype: opencascade::handle<Geom2d_Curve>") Transfer2dConicArc;
		opencascade::handle<Geom2d_Curve> Transfer2dConicArc (const opencascade::handle<IGESGeom_ConicArc> & start);

		/****************** Transfer2dCopiousData ******************/
		%feature("compactdefaultargs") Transfer2dCopiousData;
		%feature("autodoc", ":param start:
	:type start: IGESGeom_CopiousData
	:rtype: opencascade::handle<Geom2d_BSplineCurve>") Transfer2dCopiousData;
		opencascade::handle<Geom2d_BSplineCurve> Transfer2dCopiousData (const opencascade::handle<IGESGeom_CopiousData> & start);

		/****************** Transfer2dLine ******************/
		%feature("compactdefaultargs") Transfer2dLine;
		%feature("autodoc", ":param start:
	:type start: IGESGeom_Line
	:rtype: opencascade::handle<Geom2d_Curve>") Transfer2dLine;
		opencascade::handle<Geom2d_Curve> Transfer2dLine (const opencascade::handle<IGESGeom_Line> & start);

		/****************** Transfer2dSplineCurve ******************/
		%feature("compactdefaultargs") Transfer2dSplineCurve;
		%feature("autodoc", ":param start:
	:type start: IGESGeom_SplineCurve
	:rtype: opencascade::handle<Geom2d_BSplineCurve>") Transfer2dSplineCurve;
		opencascade::handle<Geom2d_BSplineCurve> Transfer2dSplineCurve (const opencascade::handle<IGESGeom_SplineCurve> & start);

		/****************** TransferBSplineCurve ******************/
		%feature("compactdefaultargs") TransferBSplineCurve;
		%feature("autodoc", ":param start:
	:type start: IGESGeom_BSplineCurve
	:rtype: opencascade::handle<Geom_Curve>") TransferBSplineCurve;
		opencascade::handle<Geom_Curve> TransferBSplineCurve (const opencascade::handle<IGESGeom_BSplineCurve> & start);

		/****************** TransferBasicCurve ******************/
		%feature("compactdefaultargs") TransferBasicCurve;
		%feature("autodoc", "* Transfert a IGESEntity which answer True to the member : IGESToBRep::IsBasicCurve(IGESEntity). If this Entity could not be converted, this member returns a NullEntity.
	:param start:
	:type start: IGESData_IGESEntity
	:rtype: opencascade::handle<Geom_Curve>") TransferBasicCurve;
		opencascade::handle<Geom_Curve> TransferBasicCurve (const opencascade::handle<IGESData_IGESEntity> & start);

		/****************** TransferCircularArc ******************/
		%feature("compactdefaultargs") TransferCircularArc;
		%feature("autodoc", ":param start:
	:type start: IGESGeom_CircularArc
	:rtype: opencascade::handle<Geom_Curve>") TransferCircularArc;
		opencascade::handle<Geom_Curve> TransferCircularArc (const opencascade::handle<IGESGeom_CircularArc> & start);

		/****************** TransferConicArc ******************/
		%feature("compactdefaultargs") TransferConicArc;
		%feature("autodoc", ":param start:
	:type start: IGESGeom_ConicArc
	:rtype: opencascade::handle<Geom_Curve>") TransferConicArc;
		opencascade::handle<Geom_Curve> TransferConicArc (const opencascade::handle<IGESGeom_ConicArc> & start);

		/****************** TransferCopiousData ******************/
		%feature("compactdefaultargs") TransferCopiousData;
		%feature("autodoc", ":param start:
	:type start: IGESGeom_CopiousData
	:rtype: opencascade::handle<Geom_BSplineCurve>") TransferCopiousData;
		opencascade::handle<Geom_BSplineCurve> TransferCopiousData (const opencascade::handle<IGESGeom_CopiousData> & start);

		/****************** TransferLine ******************/
		%feature("compactdefaultargs") TransferLine;
		%feature("autodoc", ":param start:
	:type start: IGESGeom_Line
	:rtype: opencascade::handle<Geom_Curve>") TransferLine;
		opencascade::handle<Geom_Curve> TransferLine (const opencascade::handle<IGESGeom_Line> & start);

		/****************** TransferSplineCurve ******************/
		%feature("compactdefaultargs") TransferSplineCurve;
		%feature("autodoc", ":param start:
	:type start: IGESGeom_SplineCurve
	:rtype: opencascade::handle<Geom_BSplineCurve>") TransferSplineCurve;
		opencascade::handle<Geom_BSplineCurve> TransferSplineCurve (const opencascade::handle<IGESGeom_SplineCurve> & start);

		/****************** TransferTransformation ******************/
		%feature("compactdefaultargs") TransferTransformation;
		%feature("autodoc", ":param start:
	:type start: IGESGeom_TransformationMatrix
	:rtype: opencascade::handle<Geom_Transformation>") TransferTransformation;
		opencascade::handle<Geom_Transformation> TransferTransformation (const opencascade::handle<IGESGeom_TransformationMatrix> & start);

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
		%feature("autodoc", "* Creates a tool BasicSurface ready to run, with epsilons set to 1.E-04, TheModeTopo to True, the optimization of the continuity to False.
	:rtype: None") IGESToBRep_BasicSurface;
		 IGESToBRep_BasicSurface ();

		/****************** IGESToBRep_BasicSurface ******************/
		%feature("compactdefaultargs") IGESToBRep_BasicSurface;
		%feature("autodoc", "* Creates a tool BasicSurface ready to run and sets its fields as CS's.
	:param CS:
	:type CS: IGESToBRep_CurveAndSurface
	:rtype: None") IGESToBRep_BasicSurface;
		 IGESToBRep_BasicSurface (const IGESToBRep_CurveAndSurface & CS);

		/****************** IGESToBRep_BasicSurface ******************/
		%feature("compactdefaultargs") IGESToBRep_BasicSurface;
		%feature("autodoc", "* Creates a tool BasicSurface ready to run.
	:param eps:
	:type eps: float
	:param epsGeom:
	:type epsGeom: float
	:param epsCoeff:
	:type epsCoeff: float
	:param mode:
	:type mode: bool
	:param modeapprox:
	:type modeapprox: bool
	:param optimized:
	:type optimized: bool
	:rtype: None") IGESToBRep_BasicSurface;
		 IGESToBRep_BasicSurface (const Standard_Real eps,const Standard_Real epsGeom,const Standard_Real epsCoeff,const Standard_Boolean mode,const Standard_Boolean modeapprox,const Standard_Boolean optimized);

		/****************** TransferBSplineSurface ******************/
		%feature("compactdefaultargs") TransferBSplineSurface;
		%feature("autodoc", "* Returns BSplineSurface from Geom if the transfer has succeded.
	:param start:
	:type start: IGESGeom_BSplineSurface
	:rtype: opencascade::handle<Geom_BSplineSurface>") TransferBSplineSurface;
		opencascade::handle<Geom_BSplineSurface> TransferBSplineSurface (const opencascade::handle<IGESGeom_BSplineSurface> & start);

		/****************** TransferBasicSurface ******************/
		%feature("compactdefaultargs") TransferBasicSurface;
		%feature("autodoc", "* Returns Surface from Geom if the last transfer has succeded.
	:param start:
	:type start: IGESData_IGESEntity
	:rtype: opencascade::handle<Geom_Surface>") TransferBasicSurface;
		opencascade::handle<Geom_Surface> TransferBasicSurface (const opencascade::handle<IGESData_IGESEntity> & start);

		/****************** TransferPlaneSurface ******************/
		%feature("compactdefaultargs") TransferPlaneSurface;
		%feature("autodoc", "* Returns Plane from Geom if the transfer has succeded.
	:param start:
	:type start: IGESSolid_PlaneSurface
	:rtype: opencascade::handle<Geom_Plane>") TransferPlaneSurface;
		opencascade::handle<Geom_Plane> TransferPlaneSurface (const opencascade::handle<IGESSolid_PlaneSurface> & start);

		/****************** TransferRigthConicalSurface ******************/
		%feature("compactdefaultargs") TransferRigthConicalSurface;
		%feature("autodoc", "* Returns ConicalSurface from Geom if the transfer has succeded.
	:param start:
	:type start: IGESSolid_ConicalSurface
	:rtype: opencascade::handle<Geom_ConicalSurface>") TransferRigthConicalSurface;
		opencascade::handle<Geom_ConicalSurface> TransferRigthConicalSurface (const opencascade::handle<IGESSolid_ConicalSurface> & start);

		/****************** TransferRigthCylindricalSurface ******************/
		%feature("compactdefaultargs") TransferRigthCylindricalSurface;
		%feature("autodoc", "* Returns CylindricalSurface from Geom if the transfer has succeded.
	:param start:
	:type start: IGESSolid_CylindricalSurface
	:rtype: opencascade::handle<Geom_CylindricalSurface>") TransferRigthCylindricalSurface;
		opencascade::handle<Geom_CylindricalSurface> TransferRigthCylindricalSurface (const opencascade::handle<IGESSolid_CylindricalSurface> & start);

		/****************** TransferSphericalSurface ******************/
		%feature("compactdefaultargs") TransferSphericalSurface;
		%feature("autodoc", "* Returns SphericalSurface from Geom if the transfer has succeded.
	:param start:
	:type start: IGESSolid_SphericalSurface
	:rtype: opencascade::handle<Geom_SphericalSurface>") TransferSphericalSurface;
		opencascade::handle<Geom_SphericalSurface> TransferSphericalSurface (const opencascade::handle<IGESSolid_SphericalSurface> & start);

		/****************** TransferSplineSurface ******************/
		%feature("compactdefaultargs") TransferSplineSurface;
		%feature("autodoc", "* Returns BSplineSurface from Geom if the transfer has succeded.
	:param start:
	:type start: IGESGeom_SplineSurface
	:rtype: opencascade::handle<Geom_BSplineSurface>") TransferSplineSurface;
		opencascade::handle<Geom_BSplineSurface> TransferSplineSurface (const opencascade::handle<IGESGeom_SplineSurface> & start);

		/****************** TransferToroidalSurface ******************/
		%feature("compactdefaultargs") TransferToroidalSurface;
		%feature("autodoc", "* Returns SphericalSurface from Geom if the transfer has succeded.
	:param start:
	:type start: IGESSolid_ToroidalSurface
	:rtype: opencascade::handle<Geom_ToroidalSurface>") TransferToroidalSurface;
		opencascade::handle<Geom_ToroidalSurface> TransferToroidalSurface (const opencascade::handle<IGESSolid_ToroidalSurface> & start);

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
		/****************** Approx2dBSplineCurve ******************/
		%feature("compactdefaultargs") Approx2dBSplineCurve;
		%feature("autodoc", ":param start:
	:type start: Geom2d_BSplineCurve
	:rtype: None") Approx2dBSplineCurve;
		void Approx2dBSplineCurve (const opencascade::handle<Geom2d_BSplineCurve> & start);

		/****************** ApproxBSplineCurve ******************/
		%feature("compactdefaultargs") ApproxBSplineCurve;
		%feature("autodoc", ":param start:
	:type start: Geom_BSplineCurve
	:rtype: None") ApproxBSplineCurve;
		void ApproxBSplineCurve (const opencascade::handle<Geom_BSplineCurve> & start);

		/****************** BadCase ******************/
		%feature("compactdefaultargs") BadCase;
		%feature("autodoc", "* Returns TheBadCase flag
	:rtype: bool") BadCase;
		Standard_Boolean BadCase ();

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "* Returns a Curve given its rank, by default the first one (null Curvee if out of range) in 'TheCurves'
	:param num: default value is 1
	:type num: int
	:rtype: opencascade::handle<Geom_Curve>") Curve;
		opencascade::handle<Geom_Curve> Curve (const Standard_Integer num = 1);

		/****************** Curve2d ******************/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "* Returns a Curve given its rank, by default the first one (null Curvee if out of range) in 'TheCurves2d'
	:param num: default value is 1
	:type num: int
	:rtype: opencascade::handle<Geom2d_Curve>") Curve2d;
		opencascade::handle<Geom2d_Curve> Curve2d (const Standard_Integer num = 1);

		/****************** IGESToBRep_TopoCurve ******************/
		%feature("compactdefaultargs") IGESToBRep_TopoCurve;
		%feature("autodoc", "* Creates a tool TopoCurve ready to run, with epsilons set to 1.E-04, TheModeTopo to True, the optimization of the continuity to False.
	:rtype: None") IGESToBRep_TopoCurve;
		 IGESToBRep_TopoCurve ();

		/****************** IGESToBRep_TopoCurve ******************/
		%feature("compactdefaultargs") IGESToBRep_TopoCurve;
		%feature("autodoc", "* Creates a tool TopoCurve ready to run and sets its fields as CS's.
	:param CS:
	:type CS: IGESToBRep_CurveAndSurface
	:rtype: None") IGESToBRep_TopoCurve;
		 IGESToBRep_TopoCurve (const IGESToBRep_CurveAndSurface & CS);

		/****************** IGESToBRep_TopoCurve ******************/
		%feature("compactdefaultargs") IGESToBRep_TopoCurve;
		%feature("autodoc", "* Creates a tool TopoCurve ready to run and sets its fields as CS's.
	:param CS:
	:type CS: IGESToBRep_TopoCurve
	:rtype: None") IGESToBRep_TopoCurve;
		 IGESToBRep_TopoCurve (const IGESToBRep_TopoCurve & CS);

		/****************** IGESToBRep_TopoCurve ******************/
		%feature("compactdefaultargs") IGESToBRep_TopoCurve;
		%feature("autodoc", "* Creates a tool TopoCurve ready to run.
	:param eps:
	:type eps: float
	:param epsGeom:
	:type epsGeom: float
	:param epsCoeff:
	:type epsCoeff: float
	:param mode:
	:type mode: bool
	:param modeapprox:
	:type modeapprox: bool
	:param optimized:
	:type optimized: bool
	:rtype: None") IGESToBRep_TopoCurve;
		 IGESToBRep_TopoCurve (const Standard_Real eps,const Standard_Real epsGeom,const Standard_Real epsCoeff,const Standard_Boolean mode,const Standard_Boolean modeapprox,const Standard_Boolean optimized);

		/****************** NbCurves ******************/
		%feature("compactdefaultargs") NbCurves;
		%feature("autodoc", "* Returns the count of Curves in 'TheCurves'
	:rtype: int") NbCurves;
		Standard_Integer NbCurves ();

		/****************** NbCurves2d ******************/
		%feature("compactdefaultargs") NbCurves2d;
		%feature("autodoc", "* Returns the count of Curves in 'TheCurves2d'
	:rtype: int") NbCurves2d;
		Standard_Integer NbCurves2d ();

		/****************** SetBadCase ******************/
		%feature("compactdefaultargs") SetBadCase;
		%feature("autodoc", "* Sets TheBadCase flag
	:param value:
	:type value: bool
	:rtype: None") SetBadCase;
		void SetBadCase (const Standard_Boolean value);

		/****************** Transfer2dCompositeCurve ******************/
		%feature("compactdefaultargs") Transfer2dCompositeCurve;
		%feature("autodoc", ":param start:
	:type start: IGESGeom_CompositeCurve
	:param face:
	:type face: TopoDS_Face
	:param trans:
	:type trans: gp_Trsf2d
	:param uFact:
	:type uFact: float
	:rtype: TopoDS_Shape") Transfer2dCompositeCurve;
		TopoDS_Shape Transfer2dCompositeCurve (const opencascade::handle<IGESGeom_CompositeCurve> & start,const TopoDS_Face & face,const gp_Trsf2d & trans,const Standard_Real uFact);

		/****************** Transfer2dOffsetCurve ******************/
		%feature("compactdefaultargs") Transfer2dOffsetCurve;
		%feature("autodoc", ":param start:
	:type start: IGESGeom_OffsetCurve
	:param face:
	:type face: TopoDS_Face
	:param trans:
	:type trans: gp_Trsf2d
	:param uFact:
	:type uFact: float
	:rtype: TopoDS_Shape") Transfer2dOffsetCurve;
		TopoDS_Shape Transfer2dOffsetCurve (const opencascade::handle<IGESGeom_OffsetCurve> & start,const TopoDS_Face & face,const gp_Trsf2d & trans,const Standard_Real uFact);

		/****************** Transfer2dPoint ******************/
		%feature("compactdefaultargs") Transfer2dPoint;
		%feature("autodoc", ":param start:
	:type start: IGESGeom_Point
	:rtype: TopoDS_Vertex") Transfer2dPoint;
		TopoDS_Vertex Transfer2dPoint (const opencascade::handle<IGESGeom_Point> & start);

		/****************** Transfer2dTopoBasicCurve ******************/
		%feature("compactdefaultargs") Transfer2dTopoBasicCurve;
		%feature("autodoc", ":param start:
	:type start: IGESData_IGESEntity
	:param face:
	:type face: TopoDS_Face
	:param trans:
	:type trans: gp_Trsf2d
	:param uFact:
	:type uFact: float
	:rtype: TopoDS_Shape") Transfer2dTopoBasicCurve;
		TopoDS_Shape Transfer2dTopoBasicCurve (const opencascade::handle<IGESData_IGESEntity> & start,const TopoDS_Face & face,const gp_Trsf2d & trans,const Standard_Real uFact);

		/****************** Transfer2dTopoCurve ******************/
		%feature("compactdefaultargs") Transfer2dTopoCurve;
		%feature("autodoc", ":param start:
	:type start: IGESData_IGESEntity
	:param face:
	:type face: TopoDS_Face
	:param trans:
	:type trans: gp_Trsf2d
	:param uFact:
	:type uFact: float
	:rtype: TopoDS_Shape") Transfer2dTopoCurve;
		TopoDS_Shape Transfer2dTopoCurve (const opencascade::handle<IGESData_IGESEntity> & start,const TopoDS_Face & face,const gp_Trsf2d & trans,const Standard_Real uFact);

		/****************** TransferBoundary ******************/
		%feature("compactdefaultargs") TransferBoundary;
		%feature("autodoc", ":param start:
	:type start: IGESGeom_Boundary
	:rtype: TopoDS_Shape") TransferBoundary;
		TopoDS_Shape TransferBoundary (const opencascade::handle<IGESGeom_Boundary> & start);

		/****************** TransferBoundaryOnFace ******************/
		%feature("compactdefaultargs") TransferBoundaryOnFace;
		%feature("autodoc", "* Transfers a Boundary directly on a face to trim it.
	:param face:
	:type face: TopoDS_Face
	:param start:
	:type start: IGESGeom_Boundary
	:param trans:
	:type trans: gp_Trsf2d
	:param uFact:
	:type uFact: float
	:rtype: TopoDS_Shape") TransferBoundaryOnFace;
		TopoDS_Shape TransferBoundaryOnFace (TopoDS_Face & face,const opencascade::handle<IGESGeom_Boundary> & start,const gp_Trsf2d & trans,const Standard_Real uFact);

		/****************** TransferCompositeCurve ******************/
		%feature("compactdefaultargs") TransferCompositeCurve;
		%feature("autodoc", ":param start:
	:type start: IGESGeom_CompositeCurve
	:rtype: TopoDS_Shape") TransferCompositeCurve;
		TopoDS_Shape TransferCompositeCurve (const opencascade::handle<IGESGeom_CompositeCurve> & start);

		/****************** TransferCurveOnFace ******************/
		%feature("compactdefaultargs") TransferCurveOnFace;
		%feature("autodoc", "* Transfers a CurveOnSurface directly on a face to trim it. The CurveOnSurface have to be defined Outer or Inner.
	:param face:
	:type face: TopoDS_Face
	:param start:
	:type start: IGESGeom_CurveOnSurface
	:param trans:
	:type trans: gp_Trsf2d
	:param uFact:
	:type uFact: float
	:param IsCurv:
	:type IsCurv: bool
	:rtype: TopoDS_Shape") TransferCurveOnFace;
		TopoDS_Shape TransferCurveOnFace (TopoDS_Face & face,const opencascade::handle<IGESGeom_CurveOnSurface> & start,const gp_Trsf2d & trans,const Standard_Real uFact,const Standard_Boolean IsCurv);

		/****************** TransferCurveOnSurface ******************/
		%feature("compactdefaultargs") TransferCurveOnSurface;
		%feature("autodoc", ":param start:
	:type start: IGESGeom_CurveOnSurface
	:rtype: TopoDS_Shape") TransferCurveOnSurface;
		TopoDS_Shape TransferCurveOnSurface (const opencascade::handle<IGESGeom_CurveOnSurface> & start);

		/****************** TransferOffsetCurve ******************/
		%feature("compactdefaultargs") TransferOffsetCurve;
		%feature("autodoc", ":param start:
	:type start: IGESGeom_OffsetCurve
	:rtype: TopoDS_Shape") TransferOffsetCurve;
		TopoDS_Shape TransferOffsetCurve (const opencascade::handle<IGESGeom_OffsetCurve> & start);

		/****************** TransferPoint ******************/
		%feature("compactdefaultargs") TransferPoint;
		%feature("autodoc", ":param start:
	:type start: IGESGeom_Point
	:rtype: TopoDS_Vertex") TransferPoint;
		TopoDS_Vertex TransferPoint (const opencascade::handle<IGESGeom_Point> & start);

		/****************** TransferTopoBasicCurve ******************/
		%feature("compactdefaultargs") TransferTopoBasicCurve;
		%feature("autodoc", ":param start:
	:type start: IGESData_IGESEntity
	:rtype: TopoDS_Shape") TransferTopoBasicCurve;
		TopoDS_Shape TransferTopoBasicCurve (const opencascade::handle<IGESData_IGESEntity> & start);

		/****************** TransferTopoCurve ******************/
		%feature("compactdefaultargs") TransferTopoCurve;
		%feature("autodoc", ":param start:
	:type start: IGESData_IGESEntity
	:rtype: TopoDS_Shape") TransferTopoCurve;
		TopoDS_Shape TransferTopoCurve (const opencascade::handle<IGESData_IGESEntity> & start);

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
		%feature("autodoc", "* Creates a tool TopoSurface ready to run, with epsilons set to 1.E-04, TheModeTopo to True, the optimization of the continuity to False.
	:rtype: None") IGESToBRep_TopoSurface;
		 IGESToBRep_TopoSurface ();

		/****************** IGESToBRep_TopoSurface ******************/
		%feature("compactdefaultargs") IGESToBRep_TopoSurface;
		%feature("autodoc", "* Creates a tool TopoSurface ready to run and sets its fields as CS's.
	:param CS:
	:type CS: IGESToBRep_CurveAndSurface
	:rtype: None") IGESToBRep_TopoSurface;
		 IGESToBRep_TopoSurface (const IGESToBRep_CurveAndSurface & CS);

		/****************** IGESToBRep_TopoSurface ******************/
		%feature("compactdefaultargs") IGESToBRep_TopoSurface;
		%feature("autodoc", "* Creates a tool TopoSurface ready to run.
	:param eps:
	:type eps: float
	:param epsGeom:
	:type epsGeom: float
	:param epsCoeff:
	:type epsCoeff: float
	:param mode:
	:type mode: bool
	:param modeapprox:
	:type modeapprox: bool
	:param optimized:
	:type optimized: bool
	:rtype: None") IGESToBRep_TopoSurface;
		 IGESToBRep_TopoSurface (const Standard_Real eps,const Standard_Real epsGeom,const Standard_Real epsCoeff,const Standard_Boolean mode,const Standard_Boolean modeapprox,const Standard_Boolean optimized);

		/****************** ParamSurface ******************/
		%feature("compactdefaultargs") ParamSurface;
		%feature("autodoc", ":param start:
	:type start: IGESData_IGESEntity
	:param trans:
	:type trans: gp_Trsf2d
	:param uFact:
	:type uFact: float
	:rtype: TopoDS_Shape") ParamSurface;
		TopoDS_Shape ParamSurface (const opencascade::handle<IGESData_IGESEntity> & start,gp_Trsf2d & trans,Standard_Real &OutValue);

		/****************** TransferBoundedSurface ******************/
		%feature("compactdefaultargs") TransferBoundedSurface;
		%feature("autodoc", ":param start:
	:type start: IGESGeom_BoundedSurface
	:rtype: TopoDS_Shape") TransferBoundedSurface;
		TopoDS_Shape TransferBoundedSurface (const opencascade::handle<IGESGeom_BoundedSurface> & start);

		/****************** TransferOffsetSurface ******************/
		%feature("compactdefaultargs") TransferOffsetSurface;
		%feature("autodoc", ":param start:
	:type start: IGESGeom_OffsetSurface
	:rtype: TopoDS_Shape") TransferOffsetSurface;
		TopoDS_Shape TransferOffsetSurface (const opencascade::handle<IGESGeom_OffsetSurface> & start);

		/****************** TransferPerforate ******************/
		%feature("compactdefaultargs") TransferPerforate;
		%feature("autodoc", ":param start:
	:type start: IGESBasic_SingleParent
	:rtype: TopoDS_Shape") TransferPerforate;
		TopoDS_Shape TransferPerforate (const opencascade::handle<IGESBasic_SingleParent> & start);

		/****************** TransferPlane ******************/
		%feature("compactdefaultargs") TransferPlane;
		%feature("autodoc", ":param start:
	:type start: IGESGeom_Plane
	:rtype: TopoDS_Shape") TransferPlane;
		TopoDS_Shape TransferPlane (const opencascade::handle<IGESGeom_Plane> & start);

		/****************** TransferRuledSurface ******************/
		%feature("compactdefaultargs") TransferRuledSurface;
		%feature("autodoc", ":param start:
	:type start: IGESGeom_RuledSurface
	:rtype: TopoDS_Shape") TransferRuledSurface;
		TopoDS_Shape TransferRuledSurface (const opencascade::handle<IGESGeom_RuledSurface> & start);

		/****************** TransferSurfaceOfRevolution ******************/
		%feature("compactdefaultargs") TransferSurfaceOfRevolution;
		%feature("autodoc", ":param start:
	:type start: IGESGeom_SurfaceOfRevolution
	:rtype: TopoDS_Shape") TransferSurfaceOfRevolution;
		TopoDS_Shape TransferSurfaceOfRevolution (const opencascade::handle<IGESGeom_SurfaceOfRevolution> & start);

		/****************** TransferTabulatedCylinder ******************/
		%feature("compactdefaultargs") TransferTabulatedCylinder;
		%feature("autodoc", ":param start:
	:type start: IGESGeom_TabulatedCylinder
	:rtype: TopoDS_Shape") TransferTabulatedCylinder;
		TopoDS_Shape TransferTabulatedCylinder (const opencascade::handle<IGESGeom_TabulatedCylinder> & start);

		/****************** TransferTopoBasicSurface ******************/
		%feature("compactdefaultargs") TransferTopoBasicSurface;
		%feature("autodoc", ":param start:
	:type start: IGESData_IGESEntity
	:rtype: TopoDS_Shape") TransferTopoBasicSurface;
		TopoDS_Shape TransferTopoBasicSurface (const opencascade::handle<IGESData_IGESEntity> & start);

		/****************** TransferTopoSurface ******************/
		%feature("compactdefaultargs") TransferTopoSurface;
		%feature("autodoc", ":param start:
	:type start: IGESData_IGESEntity
	:rtype: TopoDS_Shape") TransferTopoSurface;
		TopoDS_Shape TransferTopoSurface (const opencascade::handle<IGESData_IGESEntity> & start);

		/****************** TransferTrimmedSurface ******************/
		%feature("compactdefaultargs") TransferTrimmedSurface;
		%feature("autodoc", ":param start:
	:type start: IGESGeom_TrimmedSurface
	:rtype: TopoDS_Shape") TransferTrimmedSurface;
		TopoDS_Shape TransferTrimmedSurface (const opencascade::handle<IGESGeom_TrimmedSurface> & start);

};


%extend IGESToBRep_TopoSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
