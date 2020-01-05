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
%define TOPODSTOSTEPDOCSTRING
"TopoDSToStep module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_topodstostep.html"
%enddef
%module (package="OCC.Core", docstring=TOPODSTOSTEPDOCSTRING) TopoDSToStep


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
#include<TopoDSToStep_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Transfer_module.hxx>
#include<TopoDS_module.hxx>
#include<TCollection_module.hxx>
#include<StepShape_module.hxx>
#include<MoniTool_module.hxx>
#include<TColStd_module.hxx>
#include<Message_module.hxx>
#include<StepBasic_module.hxx>
#include<StepGeom_module.hxx>
#include<Interface_module.hxx>
#include<StepRepr_module.hxx>
#include<TopLoc_module.hxx>
#include<Transfer_module.hxx>
#include<StepData_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Transfer.i
%import TopoDS.i
%import TCollection.i
%import StepShape.i
%import MoniTool.i
%import TColStd.i
/* public enums */
enum TopoDSToStep_MakeEdgeError {
	TopoDSToStep_EdgeDone = 0,
	TopoDSToStep_NonManifoldEdge = 1,
	TopoDSToStep_EdgeOther = 2,
};

enum TopoDSToStep_BuilderError {
	TopoDSToStep_BuilderDone = 0,
	TopoDSToStep_NoFaceMapped = 1,
	TopoDSToStep_BuilderOther = 2,
};

enum TopoDSToStep_MakeVertexError {
	TopoDSToStep_VertexDone = 0,
	TopoDSToStep_VertexOther = 1,
};

enum TopoDSToStep_MakeWireError {
	TopoDSToStep_WireDone = 0,
	TopoDSToStep_NonManifoldWire = 1,
	TopoDSToStep_WireOther = 2,
};

enum TopoDSToStep_MakeFaceError {
	TopoDSToStep_FaceDone = 0,
	TopoDSToStep_InfiniteFace = 1,
	TopoDSToStep_NonManifoldFace = 2,
	TopoDSToStep_NoWireMapped = 3,
	TopoDSToStep_FaceOther = 4,
};

enum TopoDSToStep_FacetedError {
	TopoDSToStep_FacetedDone = 0,
	TopoDSToStep_SurfaceNotPlane = 1,
	TopoDSToStep_PCurveNotLinear = 2,
};

/* end public enums declaration */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/*********************
* class TopoDSToStep *
*********************/
%rename(topodstostep) TopoDSToStep;
class TopoDSToStep {
	public:
		/****************** AddResult ******************/
		%feature("compactdefaultargs") AddResult;
		%feature("autodoc", "* Adds an entity into the list of results (binders) for shape stored in FinderProcess
	:param FP:
	:type FP: Transfer_FinderProcess
	:param Shape:
	:type Shape: TopoDS_Shape
	:param entity:
	:type entity: Standard_Transient
	:rtype: void") AddResult;
		static void AddResult (const opencascade::handle<Transfer_FinderProcess> & FP,const TopoDS_Shape & Shape,const opencascade::handle<Standard_Transient> & entity);

		/****************** AddResult ******************/
		%feature("compactdefaultargs") AddResult;
		%feature("autodoc", "* Adds all entities recorded in Tool into the map of results (binders) stored in FinderProcess
	:param FP:
	:type FP: Transfer_FinderProcess
	:param Tool:
	:type Tool: TopoDSToStep_Tool
	:rtype: void") AddResult;
		static void AddResult (const opencascade::handle<Transfer_FinderProcess> & FP,const TopoDSToStep_Tool & Tool);

		/****************** DecodeBuilderError ******************/
		%feature("compactdefaultargs") DecodeBuilderError;
		%feature("autodoc", ":param E:
	:type E: TopoDSToStep_BuilderError
	:rtype: opencascade::handle<TCollection_HAsciiString>") DecodeBuilderError;
		static opencascade::handle<TCollection_HAsciiString> DecodeBuilderError (const TopoDSToStep_BuilderError E);

		/****************** DecodeEdgeError ******************/
		%feature("compactdefaultargs") DecodeEdgeError;
		%feature("autodoc", ":param E:
	:type E: TopoDSToStep_MakeEdgeError
	:rtype: opencascade::handle<TCollection_HAsciiString>") DecodeEdgeError;
		static opencascade::handle<TCollection_HAsciiString> DecodeEdgeError (const TopoDSToStep_MakeEdgeError E);

		/****************** DecodeFaceError ******************/
		%feature("compactdefaultargs") DecodeFaceError;
		%feature("autodoc", ":param E:
	:type E: TopoDSToStep_MakeFaceError
	:rtype: opencascade::handle<TCollection_HAsciiString>") DecodeFaceError;
		static opencascade::handle<TCollection_HAsciiString> DecodeFaceError (const TopoDSToStep_MakeFaceError E);

		/****************** DecodeVertexError ******************/
		%feature("compactdefaultargs") DecodeVertexError;
		%feature("autodoc", "* Returns a new shape without undirect surfaces.
	:param E:
	:type E: TopoDSToStep_MakeVertexError
	:rtype: opencascade::handle<TCollection_HAsciiString>") DecodeVertexError;
		static opencascade::handle<TCollection_HAsciiString> DecodeVertexError (const TopoDSToStep_MakeVertexError E);

		/****************** DecodeWireError ******************/
		%feature("compactdefaultargs") DecodeWireError;
		%feature("autodoc", ":param E:
	:type E: TopoDSToStep_MakeWireError
	:rtype: opencascade::handle<TCollection_HAsciiString>") DecodeWireError;
		static opencascade::handle<TCollection_HAsciiString> DecodeWireError (const TopoDSToStep_MakeWireError E);

};


%extend TopoDSToStep {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class TopoDSToStep_FacetedTool *
*********************************/
class TopoDSToStep_FacetedTool {
	public:
		/****************** CheckTopoDSShape ******************/
		%feature("compactdefaultargs") CheckTopoDSShape;
		%feature("autodoc", ":param SH:
	:type SH: TopoDS_Shape
	:rtype: TopoDSToStep_FacetedError") CheckTopoDSShape;
		static TopoDSToStep_FacetedError CheckTopoDSShape (const TopoDS_Shape & SH);

};


%extend TopoDSToStep_FacetedTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class TopoDSToStep_Root *
**************************/
%nodefaultctor TopoDSToStep_Root;
class TopoDSToStep_Root {
	public:
		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", ":rtype: bool") IsDone;
		Standard_Boolean IsDone ();


        %feature("autodoc","1");
        %extend {
            Standard_Real GetTolerance() {
            return (Standard_Real) $self->Tolerance();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetTolerance(Standard_Real value) {
            $self->Tolerance()=value;
            }
        };
};


%extend TopoDSToStep_Root {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class TopoDSToStep_Tool *
**************************/
class TopoDSToStep_Tool {
	public:
		/****************** Bind ******************/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param T:
	:type T: StepShape_TopologicalRepresentationItem
	:rtype: None") Bind;
		void Bind (const TopoDS_Shape & S,const opencascade::handle<StepShape_TopologicalRepresentationItem> & T);

		/****************** CurrentEdge ******************/
		%feature("compactdefaultargs") CurrentEdge;
		%feature("autodoc", ":rtype: TopoDS_Edge") CurrentEdge;
		const TopoDS_Edge  CurrentEdge ();

		/****************** CurrentFace ******************/
		%feature("compactdefaultargs") CurrentFace;
		%feature("autodoc", ":rtype: TopoDS_Face") CurrentFace;
		const TopoDS_Face  CurrentFace ();

		/****************** CurrentShell ******************/
		%feature("compactdefaultargs") CurrentShell;
		%feature("autodoc", ":rtype: TopoDS_Shell") CurrentShell;
		const TopoDS_Shell  CurrentShell ();

		/****************** CurrentVertex ******************/
		%feature("compactdefaultargs") CurrentVertex;
		%feature("autodoc", ":rtype: TopoDS_Vertex") CurrentVertex;
		const TopoDS_Vertex  CurrentVertex ();

		/****************** CurrentWire ******************/
		%feature("compactdefaultargs") CurrentWire;
		%feature("autodoc", ":rtype: TopoDS_Wire") CurrentWire;
		const TopoDS_Wire  CurrentWire ();

		/****************** Faceted ******************/
		%feature("compactdefaultargs") Faceted;
		%feature("autodoc", ":rtype: bool") Faceted;
		Standard_Boolean Faceted ();

		/****************** Find ******************/
		%feature("compactdefaultargs") Find;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: opencascade::handle<StepShape_TopologicalRepresentationItem>") Find;
		opencascade::handle<StepShape_TopologicalRepresentationItem> Find (const TopoDS_Shape & S);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param M:
	:type M: MoniTool_DataMapOfShapeTransient
	:param FacetedContext:
	:type FacetedContext: bool
	:rtype: None") Init;
		void Init (const MoniTool_DataMapOfShapeTransient & M,const Standard_Boolean FacetedContext);

		/****************** IsBound ******************/
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: bool") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & S);

		/****************** Lowest3DTolerance ******************/
		%feature("compactdefaultargs") Lowest3DTolerance;
		%feature("autodoc", ":rtype: float") Lowest3DTolerance;
		Standard_Real Lowest3DTolerance ();

		/****************** Map ******************/
		%feature("compactdefaultargs") Map;
		%feature("autodoc", ":rtype: MoniTool_DataMapOfShapeTransient") Map;
		const MoniTool_DataMapOfShapeTransient & Map ();

		/****************** PCurveMode ******************/
		%feature("compactdefaultargs") PCurveMode;
		%feature("autodoc", "* Returns mode for writing pcurves (initialized by parameter write.surfacecurve.mode)
	:rtype: int") PCurveMode;
		Standard_Integer PCurveMode ();

		/****************** SetCurrentEdge ******************/
		%feature("compactdefaultargs") SetCurrentEdge;
		%feature("autodoc", ":param E:
	:type E: TopoDS_Edge
	:rtype: None") SetCurrentEdge;
		void SetCurrentEdge (const TopoDS_Edge & E);

		/****************** SetCurrentFace ******************/
		%feature("compactdefaultargs") SetCurrentFace;
		%feature("autodoc", ":param F:
	:type F: TopoDS_Face
	:rtype: None") SetCurrentFace;
		void SetCurrentFace (const TopoDS_Face & F);

		/****************** SetCurrentShell ******************/
		%feature("compactdefaultargs") SetCurrentShell;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shell
	:rtype: None") SetCurrentShell;
		void SetCurrentShell (const TopoDS_Shell & S);

		/****************** SetCurrentVertex ******************/
		%feature("compactdefaultargs") SetCurrentVertex;
		%feature("autodoc", ":param V:
	:type V: TopoDS_Vertex
	:rtype: None") SetCurrentVertex;
		void SetCurrentVertex (const TopoDS_Vertex & V);

		/****************** SetCurrentWire ******************/
		%feature("compactdefaultargs") SetCurrentWire;
		%feature("autodoc", ":param W:
	:type W: TopoDS_Wire
	:rtype: None") SetCurrentWire;
		void SetCurrentWire (const TopoDS_Wire & W);

		/****************** SetSurfaceReversed ******************/
		%feature("compactdefaultargs") SetSurfaceReversed;
		%feature("autodoc", ":param B:
	:type B: bool
	:rtype: None") SetSurfaceReversed;
		void SetSurfaceReversed (const Standard_Boolean B);

		/****************** SurfaceReversed ******************/
		%feature("compactdefaultargs") SurfaceReversed;
		%feature("autodoc", ":rtype: bool") SurfaceReversed;
		Standard_Boolean SurfaceReversed ();

		/****************** TopoDSToStep_Tool ******************/
		%feature("compactdefaultargs") TopoDSToStep_Tool;
		%feature("autodoc", ":rtype: None") TopoDSToStep_Tool;
		 TopoDSToStep_Tool ();

		/****************** TopoDSToStep_Tool ******************/
		%feature("compactdefaultargs") TopoDSToStep_Tool;
		%feature("autodoc", ":param M:
	:type M: MoniTool_DataMapOfShapeTransient
	:param FacetedContext:
	:type FacetedContext: bool
	:rtype: None") TopoDSToStep_Tool;
		 TopoDSToStep_Tool (const MoniTool_DataMapOfShapeTransient & M,const Standard_Boolean FacetedContext);

};


%extend TopoDSToStep_Tool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class TopoDSToStep_Builder *
*****************************/
class TopoDSToStep_Builder : public TopoDSToStep_Root {
	public:
		/****************** Error ******************/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", ":rtype: TopoDSToStep_BuilderError") Error;
		TopoDSToStep_BuilderError Error ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param T:
	:type T: TopoDSToStep_Tool
	:param FP:
	:type FP: Transfer_FinderProcess
	:rtype: None") Init;
		void Init (const TopoDS_Shape & S,TopoDSToStep_Tool & T,const opencascade::handle<Transfer_FinderProcess> & FP);

		/****************** TopoDSToStep_Builder ******************/
		%feature("compactdefaultargs") TopoDSToStep_Builder;
		%feature("autodoc", ":rtype: None") TopoDSToStep_Builder;
		 TopoDSToStep_Builder ();

		/****************** TopoDSToStep_Builder ******************/
		%feature("compactdefaultargs") TopoDSToStep_Builder;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param T:
	:type T: TopoDSToStep_Tool
	:param FP:
	:type FP: Transfer_FinderProcess
	:rtype: None") TopoDSToStep_Builder;
		 TopoDSToStep_Builder (const TopoDS_Shape & S,TopoDSToStep_Tool & T,const opencascade::handle<Transfer_FinderProcess> & FP);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":rtype: opencascade::handle<StepShape_TopologicalRepresentationItem>") Value;
		const opencascade::handle<StepShape_TopologicalRepresentationItem> & Value ();

};


%extend TopoDSToStep_Builder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class TopoDSToStep_MakeBrepWithVoids *
***************************************/
class TopoDSToStep_MakeBrepWithVoids : public TopoDSToStep_Root {
	public:
		/****************** TopoDSToStep_MakeBrepWithVoids ******************/
		%feature("compactdefaultargs") TopoDSToStep_MakeBrepWithVoids;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Solid
	:param FP:
	:type FP: Transfer_FinderProcess
	:rtype: None") TopoDSToStep_MakeBrepWithVoids;
		 TopoDSToStep_MakeBrepWithVoids (const TopoDS_Solid & S,const opencascade::handle<Transfer_FinderProcess> & FP);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":rtype: opencascade::handle<StepShape_BrepWithVoids>") Value;
		const opencascade::handle<StepShape_BrepWithVoids> & Value ();

};


%extend TopoDSToStep_MakeBrepWithVoids {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class TopoDSToStep_MakeFacetedBrep *
*************************************/
class TopoDSToStep_MakeFacetedBrep : public TopoDSToStep_Root {
	public:
		/****************** TopoDSToStep_MakeFacetedBrep ******************/
		%feature("compactdefaultargs") TopoDSToStep_MakeFacetedBrep;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shell
	:param FP:
	:type FP: Transfer_FinderProcess
	:rtype: None") TopoDSToStep_MakeFacetedBrep;
		 TopoDSToStep_MakeFacetedBrep (const TopoDS_Shell & S,const opencascade::handle<Transfer_FinderProcess> & FP);

		/****************** TopoDSToStep_MakeFacetedBrep ******************/
		%feature("compactdefaultargs") TopoDSToStep_MakeFacetedBrep;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Solid
	:param FP:
	:type FP: Transfer_FinderProcess
	:rtype: None") TopoDSToStep_MakeFacetedBrep;
		 TopoDSToStep_MakeFacetedBrep (const TopoDS_Solid & S,const opencascade::handle<Transfer_FinderProcess> & FP);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":rtype: opencascade::handle<StepShape_FacetedBrep>") Value;
		const opencascade::handle<StepShape_FacetedBrep> & Value ();

};


%extend TopoDSToStep_MakeFacetedBrep {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************************
* class TopoDSToStep_MakeFacetedBrepAndBrepWithVoids *
*****************************************************/
class TopoDSToStep_MakeFacetedBrepAndBrepWithVoids : public TopoDSToStep_Root {
	public:
		/****************** TopoDSToStep_MakeFacetedBrepAndBrepWithVoids ******************/
		%feature("compactdefaultargs") TopoDSToStep_MakeFacetedBrepAndBrepWithVoids;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Solid
	:param FP:
	:type FP: Transfer_FinderProcess
	:rtype: None") TopoDSToStep_MakeFacetedBrepAndBrepWithVoids;
		 TopoDSToStep_MakeFacetedBrepAndBrepWithVoids (const TopoDS_Solid & S,const opencascade::handle<Transfer_FinderProcess> & FP);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":rtype: opencascade::handle<StepShape_FacetedBrepAndBrepWithVoids>") Value;
		const opencascade::handle<StepShape_FacetedBrepAndBrepWithVoids> & Value ();

};


%extend TopoDSToStep_MakeFacetedBrepAndBrepWithVoids {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class TopoDSToStep_MakeGeometricCurveSet *
*******************************************/
class TopoDSToStep_MakeGeometricCurveSet : public TopoDSToStep_Root {
	public:
		/****************** TopoDSToStep_MakeGeometricCurveSet ******************/
		%feature("compactdefaultargs") TopoDSToStep_MakeGeometricCurveSet;
		%feature("autodoc", ":param SH:
	:type SH: TopoDS_Shape
	:param FP:
	:type FP: Transfer_FinderProcess
	:rtype: None") TopoDSToStep_MakeGeometricCurveSet;
		 TopoDSToStep_MakeGeometricCurveSet (const TopoDS_Shape & SH,const opencascade::handle<Transfer_FinderProcess> & FP);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":rtype: opencascade::handle<StepShape_GeometricCurveSet>") Value;
		const opencascade::handle<StepShape_GeometricCurveSet> & Value ();

};


%extend TopoDSToStep_MakeGeometricCurveSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class TopoDSToStep_MakeManifoldSolidBrep *
*******************************************/
class TopoDSToStep_MakeManifoldSolidBrep : public TopoDSToStep_Root {
	public:
		/****************** TopoDSToStep_MakeManifoldSolidBrep ******************/
		%feature("compactdefaultargs") TopoDSToStep_MakeManifoldSolidBrep;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shell
	:param FP:
	:type FP: Transfer_FinderProcess
	:rtype: None") TopoDSToStep_MakeManifoldSolidBrep;
		 TopoDSToStep_MakeManifoldSolidBrep (const TopoDS_Shell & S,const opencascade::handle<Transfer_FinderProcess> & FP);

		/****************** TopoDSToStep_MakeManifoldSolidBrep ******************/
		%feature("compactdefaultargs") TopoDSToStep_MakeManifoldSolidBrep;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Solid
	:param FP:
	:type FP: Transfer_FinderProcess
	:rtype: None") TopoDSToStep_MakeManifoldSolidBrep;
		 TopoDSToStep_MakeManifoldSolidBrep (const TopoDS_Solid & S,const opencascade::handle<Transfer_FinderProcess> & FP);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":rtype: opencascade::handle<StepShape_ManifoldSolidBrep>") Value;
		const opencascade::handle<StepShape_ManifoldSolidBrep> & Value ();

};


%extend TopoDSToStep_MakeManifoldSolidBrep {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************
* class TopoDSToStep_MakeShellBasedSurfaceModel *
************************************************/
class TopoDSToStep_MakeShellBasedSurfaceModel : public TopoDSToStep_Root {
	public:
		/****************** TopoDSToStep_MakeShellBasedSurfaceModel ******************/
		%feature("compactdefaultargs") TopoDSToStep_MakeShellBasedSurfaceModel;
		%feature("autodoc", ":param F:
	:type F: TopoDS_Face
	:param FP:
	:type FP: Transfer_FinderProcess
	:rtype: None") TopoDSToStep_MakeShellBasedSurfaceModel;
		 TopoDSToStep_MakeShellBasedSurfaceModel (const TopoDS_Face & F,const opencascade::handle<Transfer_FinderProcess> & FP);

		/****************** TopoDSToStep_MakeShellBasedSurfaceModel ******************/
		%feature("compactdefaultargs") TopoDSToStep_MakeShellBasedSurfaceModel;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shell
	:param FP:
	:type FP: Transfer_FinderProcess
	:rtype: None") TopoDSToStep_MakeShellBasedSurfaceModel;
		 TopoDSToStep_MakeShellBasedSurfaceModel (const TopoDS_Shell & S,const opencascade::handle<Transfer_FinderProcess> & FP);

		/****************** TopoDSToStep_MakeShellBasedSurfaceModel ******************/
		%feature("compactdefaultargs") TopoDSToStep_MakeShellBasedSurfaceModel;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Solid
	:param FP:
	:type FP: Transfer_FinderProcess
	:rtype: None") TopoDSToStep_MakeShellBasedSurfaceModel;
		 TopoDSToStep_MakeShellBasedSurfaceModel (const TopoDS_Solid & S,const opencascade::handle<Transfer_FinderProcess> & FP);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":rtype: opencascade::handle<StepShape_ShellBasedSurfaceModel>") Value;
		const opencascade::handle<StepShape_ShellBasedSurfaceModel> & Value ();

};


%extend TopoDSToStep_MakeShellBasedSurfaceModel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class TopoDSToStep_MakeStepEdge *
**********************************/
class TopoDSToStep_MakeStepEdge : public TopoDSToStep_Root {
	public:
		/****************** Error ******************/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", ":rtype: TopoDSToStep_MakeEdgeError") Error;
		TopoDSToStep_MakeEdgeError Error ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param E:
	:type E: TopoDS_Edge
	:param T:
	:type T: TopoDSToStep_Tool
	:param FP:
	:type FP: Transfer_FinderProcess
	:rtype: None") Init;
		void Init (const TopoDS_Edge & E,TopoDSToStep_Tool & T,const opencascade::handle<Transfer_FinderProcess> & FP);

		/****************** TopoDSToStep_MakeStepEdge ******************/
		%feature("compactdefaultargs") TopoDSToStep_MakeStepEdge;
		%feature("autodoc", ":rtype: None") TopoDSToStep_MakeStepEdge;
		 TopoDSToStep_MakeStepEdge ();

		/****************** TopoDSToStep_MakeStepEdge ******************/
		%feature("compactdefaultargs") TopoDSToStep_MakeStepEdge;
		%feature("autodoc", ":param E:
	:type E: TopoDS_Edge
	:param T:
	:type T: TopoDSToStep_Tool
	:param FP:
	:type FP: Transfer_FinderProcess
	:rtype: None") TopoDSToStep_MakeStepEdge;
		 TopoDSToStep_MakeStepEdge (const TopoDS_Edge & E,TopoDSToStep_Tool & T,const opencascade::handle<Transfer_FinderProcess> & FP);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":rtype: opencascade::handle<StepShape_TopologicalRepresentationItem>") Value;
		const opencascade::handle<StepShape_TopologicalRepresentationItem> & Value ();

};


%extend TopoDSToStep_MakeStepEdge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class TopoDSToStep_MakeStepFace *
**********************************/
class TopoDSToStep_MakeStepFace : public TopoDSToStep_Root {
	public:
		/****************** Error ******************/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", ":rtype: TopoDSToStep_MakeFaceError") Error;
		TopoDSToStep_MakeFaceError Error ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param F:
	:type F: TopoDS_Face
	:param T:
	:type T: TopoDSToStep_Tool
	:param FP:
	:type FP: Transfer_FinderProcess
	:rtype: None") Init;
		void Init (const TopoDS_Face & F,TopoDSToStep_Tool & T,const opencascade::handle<Transfer_FinderProcess> & FP);

		/****************** TopoDSToStep_MakeStepFace ******************/
		%feature("compactdefaultargs") TopoDSToStep_MakeStepFace;
		%feature("autodoc", ":rtype: None") TopoDSToStep_MakeStepFace;
		 TopoDSToStep_MakeStepFace ();

		/****************** TopoDSToStep_MakeStepFace ******************/
		%feature("compactdefaultargs") TopoDSToStep_MakeStepFace;
		%feature("autodoc", ":param F:
	:type F: TopoDS_Face
	:param T:
	:type T: TopoDSToStep_Tool
	:param FP:
	:type FP: Transfer_FinderProcess
	:rtype: None") TopoDSToStep_MakeStepFace;
		 TopoDSToStep_MakeStepFace (const TopoDS_Face & F,TopoDSToStep_Tool & T,const opencascade::handle<Transfer_FinderProcess> & FP);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":rtype: opencascade::handle<StepShape_TopologicalRepresentationItem>") Value;
		const opencascade::handle<StepShape_TopologicalRepresentationItem> & Value ();

};


%extend TopoDSToStep_MakeStepFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class TopoDSToStep_MakeStepVertex *
************************************/
class TopoDSToStep_MakeStepVertex : public TopoDSToStep_Root {
	public:
		/****************** Error ******************/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", ":rtype: TopoDSToStep_MakeVertexError") Error;
		TopoDSToStep_MakeVertexError Error ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param V:
	:type V: TopoDS_Vertex
	:param T:
	:type T: TopoDSToStep_Tool
	:param FP:
	:type FP: Transfer_FinderProcess
	:rtype: None") Init;
		void Init (const TopoDS_Vertex & V,TopoDSToStep_Tool & T,const opencascade::handle<Transfer_FinderProcess> & FP);

		/****************** TopoDSToStep_MakeStepVertex ******************/
		%feature("compactdefaultargs") TopoDSToStep_MakeStepVertex;
		%feature("autodoc", ":rtype: None") TopoDSToStep_MakeStepVertex;
		 TopoDSToStep_MakeStepVertex ();

		/****************** TopoDSToStep_MakeStepVertex ******************/
		%feature("compactdefaultargs") TopoDSToStep_MakeStepVertex;
		%feature("autodoc", ":param V:
	:type V: TopoDS_Vertex
	:param T:
	:type T: TopoDSToStep_Tool
	:param FP:
	:type FP: Transfer_FinderProcess
	:rtype: None") TopoDSToStep_MakeStepVertex;
		 TopoDSToStep_MakeStepVertex (const TopoDS_Vertex & V,TopoDSToStep_Tool & T,const opencascade::handle<Transfer_FinderProcess> & FP);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":rtype: opencascade::handle<StepShape_TopologicalRepresentationItem>") Value;
		const opencascade::handle<StepShape_TopologicalRepresentationItem> & Value ();

};


%extend TopoDSToStep_MakeStepVertex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class TopoDSToStep_MakeStepWire *
**********************************/
class TopoDSToStep_MakeStepWire : public TopoDSToStep_Root {
	public:
		/****************** Error ******************/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", ":rtype: TopoDSToStep_MakeWireError") Error;
		TopoDSToStep_MakeWireError Error ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param W:
	:type W: TopoDS_Wire
	:param T:
	:type T: TopoDSToStep_Tool
	:param FP:
	:type FP: Transfer_FinderProcess
	:rtype: None") Init;
		void Init (const TopoDS_Wire & W,TopoDSToStep_Tool & T,const opencascade::handle<Transfer_FinderProcess> & FP);

		/****************** TopoDSToStep_MakeStepWire ******************/
		%feature("compactdefaultargs") TopoDSToStep_MakeStepWire;
		%feature("autodoc", ":rtype: None") TopoDSToStep_MakeStepWire;
		 TopoDSToStep_MakeStepWire ();

		/****************** TopoDSToStep_MakeStepWire ******************/
		%feature("compactdefaultargs") TopoDSToStep_MakeStepWire;
		%feature("autodoc", ":param W:
	:type W: TopoDS_Wire
	:param T:
	:type T: TopoDSToStep_Tool
	:param FP:
	:type FP: Transfer_FinderProcess
	:rtype: None") TopoDSToStep_MakeStepWire;
		 TopoDSToStep_MakeStepWire (const TopoDS_Wire & W,TopoDSToStep_Tool & T,const opencascade::handle<Transfer_FinderProcess> & FP);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":rtype: opencascade::handle<StepShape_TopologicalRepresentationItem>") Value;
		const opencascade::handle<StepShape_TopologicalRepresentationItem> & Value ();

};


%extend TopoDSToStep_MakeStepWire {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class TopoDSToStep_WireframeBuilder *
**************************************/
class TopoDSToStep_WireframeBuilder : public TopoDSToStep_Root {
	public:
		/****************** Error ******************/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", ":rtype: TopoDSToStep_BuilderError") Error;
		TopoDSToStep_BuilderError Error ();

		/****************** GetTrimmedCurveFromEdge ******************/
		%feature("compactdefaultargs") GetTrimmedCurveFromEdge;
		%feature("autodoc", "* Extraction of Trimmed Curves from TopoDS_Edge for the Creation of a GeometricallyBoundedWireframeRepresentation
	:param E:
	:type E: TopoDS_Edge
	:param F:
	:type F: TopoDS_Face
	:param M:
	:type M: MoniTool_DataMapOfShapeTransient
	:param L:
	:type L: TColStd_HSequenceOfTransient
	:rtype: bool") GetTrimmedCurveFromEdge;
		Standard_Boolean GetTrimmedCurveFromEdge (const TopoDS_Edge & E,const TopoDS_Face & F,MoniTool_DataMapOfShapeTransient & M,opencascade::handle<TColStd_HSequenceOfTransient> & L);

		/****************** GetTrimmedCurveFromFace ******************/
		%feature("compactdefaultargs") GetTrimmedCurveFromFace;
		%feature("autodoc", "* Extraction of Trimmed Curves from TopoDS_Face for the Creation of a GeometricallyBoundedWireframeRepresentation
	:param F:
	:type F: TopoDS_Face
	:param M:
	:type M: MoniTool_DataMapOfShapeTransient
	:param L:
	:type L: TColStd_HSequenceOfTransient
	:rtype: bool") GetTrimmedCurveFromFace;
		Standard_Boolean GetTrimmedCurveFromFace (const TopoDS_Face & F,MoniTool_DataMapOfShapeTransient & M,opencascade::handle<TColStd_HSequenceOfTransient> & L);

		/****************** GetTrimmedCurveFromShape ******************/
		%feature("compactdefaultargs") GetTrimmedCurveFromShape;
		%feature("autodoc", "* Extraction of Trimmed Curves from any TopoDS_Shape for the Creation of a GeometricallyBoundedWireframeRepresentation
	:param S:
	:type S: TopoDS_Shape
	:param M:
	:type M: MoniTool_DataMapOfShapeTransient
	:param L:
	:type L: TColStd_HSequenceOfTransient
	:rtype: bool") GetTrimmedCurveFromShape;
		Standard_Boolean GetTrimmedCurveFromShape (const TopoDS_Shape & S,MoniTool_DataMapOfShapeTransient & M,opencascade::handle<TColStd_HSequenceOfTransient> & L);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param T:
	:type T: TopoDSToStep_Tool
	:param FP:
	:type FP: Transfer_FinderProcess
	:rtype: None") Init;
		void Init (const TopoDS_Shape & S,TopoDSToStep_Tool & T,const opencascade::handle<Transfer_FinderProcess> & FP);

		/****************** TopoDSToStep_WireframeBuilder ******************/
		%feature("compactdefaultargs") TopoDSToStep_WireframeBuilder;
		%feature("autodoc", ":rtype: None") TopoDSToStep_WireframeBuilder;
		 TopoDSToStep_WireframeBuilder ();

		/****************** TopoDSToStep_WireframeBuilder ******************/
		%feature("compactdefaultargs") TopoDSToStep_WireframeBuilder;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param T:
	:type T: TopoDSToStep_Tool
	:param FP:
	:type FP: Transfer_FinderProcess
	:rtype: None") TopoDSToStep_WireframeBuilder;
		 TopoDSToStep_WireframeBuilder (const TopoDS_Shape & S,TopoDSToStep_Tool & T,const opencascade::handle<Transfer_FinderProcess> & FP);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":rtype: opencascade::handle<TColStd_HSequenceOfTransient>") Value;
		const opencascade::handle<TColStd_HSequenceOfTransient> & Value ();

};


%extend TopoDSToStep_WireframeBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
