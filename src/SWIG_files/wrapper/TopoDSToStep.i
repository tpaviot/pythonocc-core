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
#include<MoniTool_module.hxx>
#include<StepShape_module.hxx>
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
%import MoniTool.i
%import StepShape.i
%import TColStd.i

%pythoncode {
from OCC.Core.Exception import *
};

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

/* python proy classes for enums */
%pythoncode {

class TopoDSToStep_MakeEdgeError:
	TopoDSToStep_EdgeDone = 0
	TopoDSToStep_NonManifoldEdge = 1
	TopoDSToStep_EdgeOther = 2

class TopoDSToStep_BuilderError:
	TopoDSToStep_BuilderDone = 0
	TopoDSToStep_NoFaceMapped = 1
	TopoDSToStep_BuilderOther = 2

class TopoDSToStep_MakeVertexError:
	TopoDSToStep_VertexDone = 0
	TopoDSToStep_VertexOther = 1

class TopoDSToStep_MakeWireError:
	TopoDSToStep_WireDone = 0
	TopoDSToStep_NonManifoldWire = 1
	TopoDSToStep_WireOther = 2

class TopoDSToStep_MakeFaceError:
	TopoDSToStep_FaceDone = 0
	TopoDSToStep_InfiniteFace = 1
	TopoDSToStep_NonManifoldFace = 2
	TopoDSToStep_NoWireMapped = 3
	TopoDSToStep_FaceOther = 4

class TopoDSToStep_FacetedError:
	TopoDSToStep_FacetedDone = 0
	TopoDSToStep_SurfaceNotPlane = 1
	TopoDSToStep_PCurveNotLinear = 2
};
/* end python proxy for enums */

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
		%feature("autodoc", "Adds an entity into the list of results (binders) for shape stored in finderprocess.

Parameters
----------
FP: Transfer_FinderProcess
Shape: TopoDS_Shape
entity: Standard_Transient

Returns
-------
None
") AddResult;
		static void AddResult(const opencascade::handle<Transfer_FinderProcess> & FP, const TopoDS_Shape & Shape, const opencascade::handle<Standard_Transient> & entity);

		/****************** AddResult ******************/
		%feature("compactdefaultargs") AddResult;
		%feature("autodoc", "Adds all entities recorded in tool into the map of results (binders) stored in finderprocess.

Parameters
----------
FP: Transfer_FinderProcess
Tool: TopoDSToStep_Tool

Returns
-------
None
") AddResult;
		static void AddResult(const opencascade::handle<Transfer_FinderProcess> & FP, const TopoDSToStep_Tool & Tool);

		/****************** DecodeBuilderError ******************/
		%feature("compactdefaultargs") DecodeBuilderError;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDSToStep_BuilderError

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") DecodeBuilderError;
		static opencascade::handle<TCollection_HAsciiString> DecodeBuilderError(const TopoDSToStep_BuilderError E);

		/****************** DecodeEdgeError ******************/
		%feature("compactdefaultargs") DecodeEdgeError;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDSToStep_MakeEdgeError

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") DecodeEdgeError;
		static opencascade::handle<TCollection_HAsciiString> DecodeEdgeError(const TopoDSToStep_MakeEdgeError E);

		/****************** DecodeFaceError ******************/
		%feature("compactdefaultargs") DecodeFaceError;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDSToStep_MakeFaceError

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") DecodeFaceError;
		static opencascade::handle<TCollection_HAsciiString> DecodeFaceError(const TopoDSToStep_MakeFaceError E);

		/****************** DecodeVertexError ******************/
		%feature("compactdefaultargs") DecodeVertexError;
		%feature("autodoc", "Returns a new shape without undirect surfaces.

Parameters
----------
E: TopoDSToStep_MakeVertexError

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") DecodeVertexError;
		static opencascade::handle<TCollection_HAsciiString> DecodeVertexError(const TopoDSToStep_MakeVertexError E);

		/****************** DecodeWireError ******************/
		%feature("compactdefaultargs") DecodeWireError;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDSToStep_MakeWireError

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") DecodeWireError;
		static opencascade::handle<TCollection_HAsciiString> DecodeWireError(const TopoDSToStep_MakeWireError E);

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
		%feature("autodoc", "No available documentation.

Parameters
----------
SH: TopoDS_Shape

Returns
-------
TopoDSToStep_FacetedError
") CheckTopoDSShape;
		static TopoDSToStep_FacetedError CheckTopoDSShape(const TopoDS_Shape & SH);

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
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();


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
		/****************** TopoDSToStep_Tool ******************/
		%feature("compactdefaultargs") TopoDSToStep_Tool;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopoDSToStep_Tool;
		 TopoDSToStep_Tool();

		/****************** TopoDSToStep_Tool ******************/
		%feature("compactdefaultargs") TopoDSToStep_Tool;
		%feature("autodoc", "No available documentation.

Parameters
----------
M: MoniTool_DataMapOfShapeTransient
FacetedContext: bool

Returns
-------
None
") TopoDSToStep_Tool;
		 TopoDSToStep_Tool(const MoniTool_DataMapOfShapeTransient & M, const Standard_Boolean FacetedContext);

		/****************** Bind ******************/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
T: StepShape_TopologicalRepresentationItem

Returns
-------
None
") Bind;
		void Bind(const TopoDS_Shape & S, const opencascade::handle<StepShape_TopologicalRepresentationItem> & T);

		/****************** CurrentEdge ******************/
		%feature("compactdefaultargs") CurrentEdge;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Edge
") CurrentEdge;
		const TopoDS_Edge CurrentEdge();

		/****************** CurrentFace ******************/
		%feature("compactdefaultargs") CurrentFace;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Face
") CurrentFace;
		const TopoDS_Face CurrentFace();

		/****************** CurrentShell ******************/
		%feature("compactdefaultargs") CurrentShell;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shell
") CurrentShell;
		const TopoDS_Shell CurrentShell();

		/****************** CurrentVertex ******************/
		%feature("compactdefaultargs") CurrentVertex;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Vertex
") CurrentVertex;
		const TopoDS_Vertex CurrentVertex();

		/****************** CurrentWire ******************/
		%feature("compactdefaultargs") CurrentWire;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Wire
") CurrentWire;
		const TopoDS_Wire CurrentWire();

		/****************** Faceted ******************/
		%feature("compactdefaultargs") Faceted;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Faceted;
		Standard_Boolean Faceted();

		/****************** Find ******************/
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
opencascade::handle<StepShape_TopologicalRepresentationItem>
") Find;
		opencascade::handle<StepShape_TopologicalRepresentationItem> Find(const TopoDS_Shape & S);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
M: MoniTool_DataMapOfShapeTransient
FacetedContext: bool

Returns
-------
None
") Init;
		void Init(const MoniTool_DataMapOfShapeTransient & M, const Standard_Boolean FacetedContext);

		/****************** IsBound ******************/
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
bool
") IsBound;
		Standard_Boolean IsBound(const TopoDS_Shape & S);

		/****************** Lowest3DTolerance ******************/
		%feature("compactdefaultargs") Lowest3DTolerance;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Lowest3DTolerance;
		Standard_Real Lowest3DTolerance();

		/****************** Map ******************/
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "No available documentation.

Returns
-------
MoniTool_DataMapOfShapeTransient
") Map;
		const MoniTool_DataMapOfShapeTransient & Map();

		/****************** PCurveMode ******************/
		%feature("compactdefaultargs") PCurveMode;
		%feature("autodoc", "Returns mode for writing pcurves (initialized by parameter write.surfacecurve.mode).

Returns
-------
int
") PCurveMode;
		Standard_Integer PCurveMode();

		/****************** SetCurrentEdge ******************/
		%feature("compactdefaultargs") SetCurrentEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Edge

Returns
-------
None
") SetCurrentEdge;
		void SetCurrentEdge(const TopoDS_Edge & E);

		/****************** SetCurrentFace ******************/
		%feature("compactdefaultargs") SetCurrentFace;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Face

Returns
-------
None
") SetCurrentFace;
		void SetCurrentFace(const TopoDS_Face & F);

		/****************** SetCurrentShell ******************/
		%feature("compactdefaultargs") SetCurrentShell;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shell

Returns
-------
None
") SetCurrentShell;
		void SetCurrentShell(const TopoDS_Shell & S);

		/****************** SetCurrentVertex ******************/
		%feature("compactdefaultargs") SetCurrentVertex;
		%feature("autodoc", "No available documentation.

Parameters
----------
V: TopoDS_Vertex

Returns
-------
None
") SetCurrentVertex;
		void SetCurrentVertex(const TopoDS_Vertex & V);

		/****************** SetCurrentWire ******************/
		%feature("compactdefaultargs") SetCurrentWire;
		%feature("autodoc", "No available documentation.

Parameters
----------
W: TopoDS_Wire

Returns
-------
None
") SetCurrentWire;
		void SetCurrentWire(const TopoDS_Wire & W);

		/****************** SetSurfaceReversed ******************/
		%feature("compactdefaultargs") SetSurfaceReversed;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: bool

Returns
-------
None
") SetSurfaceReversed;
		void SetSurfaceReversed(const Standard_Boolean B);

		/****************** SurfaceReversed ******************/
		%feature("compactdefaultargs") SurfaceReversed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") SurfaceReversed;
		Standard_Boolean SurfaceReversed();

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
		/****************** TopoDSToStep_Builder ******************/
		%feature("compactdefaultargs") TopoDSToStep_Builder;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopoDSToStep_Builder;
		 TopoDSToStep_Builder();

		/****************** TopoDSToStep_Builder ******************/
		%feature("compactdefaultargs") TopoDSToStep_Builder;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
T: TopoDSToStep_Tool
FP: Transfer_FinderProcess

Returns
-------
None
") TopoDSToStep_Builder;
		 TopoDSToStep_Builder(const TopoDS_Shape & S, TopoDSToStep_Tool & T, const opencascade::handle<Transfer_FinderProcess> & FP);

		/****************** Error ******************/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDSToStep_BuilderError
") Error;
		TopoDSToStep_BuilderError Error();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
T: TopoDSToStep_Tool
FP: Transfer_FinderProcess

Returns
-------
None
") Init;
		void Init(const TopoDS_Shape & S, TopoDSToStep_Tool & T, const opencascade::handle<Transfer_FinderProcess> & FP);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_TopologicalRepresentationItem>
") Value;
		const opencascade::handle<StepShape_TopologicalRepresentationItem> & Value();

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
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Solid
FP: Transfer_FinderProcess

Returns
-------
None
") TopoDSToStep_MakeBrepWithVoids;
		 TopoDSToStep_MakeBrepWithVoids(const TopoDS_Solid & S, const opencascade::handle<Transfer_FinderProcess> & FP);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_BrepWithVoids>
") Value;
		const opencascade::handle<StepShape_BrepWithVoids> & Value();

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
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shell
FP: Transfer_FinderProcess

Returns
-------
None
") TopoDSToStep_MakeFacetedBrep;
		 TopoDSToStep_MakeFacetedBrep(const TopoDS_Shell & S, const opencascade::handle<Transfer_FinderProcess> & FP);

		/****************** TopoDSToStep_MakeFacetedBrep ******************/
		%feature("compactdefaultargs") TopoDSToStep_MakeFacetedBrep;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Solid
FP: Transfer_FinderProcess

Returns
-------
None
") TopoDSToStep_MakeFacetedBrep;
		 TopoDSToStep_MakeFacetedBrep(const TopoDS_Solid & S, const opencascade::handle<Transfer_FinderProcess> & FP);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_FacetedBrep>
") Value;
		const opencascade::handle<StepShape_FacetedBrep> & Value();

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
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Solid
FP: Transfer_FinderProcess

Returns
-------
None
") TopoDSToStep_MakeFacetedBrepAndBrepWithVoids;
		 TopoDSToStep_MakeFacetedBrepAndBrepWithVoids(const TopoDS_Solid & S, const opencascade::handle<Transfer_FinderProcess> & FP);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_FacetedBrepAndBrepWithVoids>
") Value;
		const opencascade::handle<StepShape_FacetedBrepAndBrepWithVoids> & Value();

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
		%feature("autodoc", "No available documentation.

Parameters
----------
SH: TopoDS_Shape
FP: Transfer_FinderProcess

Returns
-------
None
") TopoDSToStep_MakeGeometricCurveSet;
		 TopoDSToStep_MakeGeometricCurveSet(const TopoDS_Shape & SH, const opencascade::handle<Transfer_FinderProcess> & FP);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_GeometricCurveSet>
") Value;
		const opencascade::handle<StepShape_GeometricCurveSet> & Value();

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
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shell
FP: Transfer_FinderProcess

Returns
-------
None
") TopoDSToStep_MakeManifoldSolidBrep;
		 TopoDSToStep_MakeManifoldSolidBrep(const TopoDS_Shell & S, const opencascade::handle<Transfer_FinderProcess> & FP);

		/****************** TopoDSToStep_MakeManifoldSolidBrep ******************/
		%feature("compactdefaultargs") TopoDSToStep_MakeManifoldSolidBrep;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Solid
FP: Transfer_FinderProcess

Returns
-------
None
") TopoDSToStep_MakeManifoldSolidBrep;
		 TopoDSToStep_MakeManifoldSolidBrep(const TopoDS_Solid & S, const opencascade::handle<Transfer_FinderProcess> & FP);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_ManifoldSolidBrep>
") Value;
		const opencascade::handle<StepShape_ManifoldSolidBrep> & Value();

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
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Face
FP: Transfer_FinderProcess

Returns
-------
None
") TopoDSToStep_MakeShellBasedSurfaceModel;
		 TopoDSToStep_MakeShellBasedSurfaceModel(const TopoDS_Face & F, const opencascade::handle<Transfer_FinderProcess> & FP);

		/****************** TopoDSToStep_MakeShellBasedSurfaceModel ******************/
		%feature("compactdefaultargs") TopoDSToStep_MakeShellBasedSurfaceModel;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shell
FP: Transfer_FinderProcess

Returns
-------
None
") TopoDSToStep_MakeShellBasedSurfaceModel;
		 TopoDSToStep_MakeShellBasedSurfaceModel(const TopoDS_Shell & S, const opencascade::handle<Transfer_FinderProcess> & FP);

		/****************** TopoDSToStep_MakeShellBasedSurfaceModel ******************/
		%feature("compactdefaultargs") TopoDSToStep_MakeShellBasedSurfaceModel;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Solid
FP: Transfer_FinderProcess

Returns
-------
None
") TopoDSToStep_MakeShellBasedSurfaceModel;
		 TopoDSToStep_MakeShellBasedSurfaceModel(const TopoDS_Solid & S, const opencascade::handle<Transfer_FinderProcess> & FP);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_ShellBasedSurfaceModel>
") Value;
		const opencascade::handle<StepShape_ShellBasedSurfaceModel> & Value();

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
		/****************** TopoDSToStep_MakeStepEdge ******************/
		%feature("compactdefaultargs") TopoDSToStep_MakeStepEdge;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopoDSToStep_MakeStepEdge;
		 TopoDSToStep_MakeStepEdge();

		/****************** TopoDSToStep_MakeStepEdge ******************/
		%feature("compactdefaultargs") TopoDSToStep_MakeStepEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Edge
T: TopoDSToStep_Tool
FP: Transfer_FinderProcess

Returns
-------
None
") TopoDSToStep_MakeStepEdge;
		 TopoDSToStep_MakeStepEdge(const TopoDS_Edge & E, TopoDSToStep_Tool & T, const opencascade::handle<Transfer_FinderProcess> & FP);

		/****************** Error ******************/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDSToStep_MakeEdgeError
") Error;
		TopoDSToStep_MakeEdgeError Error();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Edge
T: TopoDSToStep_Tool
FP: Transfer_FinderProcess

Returns
-------
None
") Init;
		void Init(const TopoDS_Edge & E, TopoDSToStep_Tool & T, const opencascade::handle<Transfer_FinderProcess> & FP);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_TopologicalRepresentationItem>
") Value;
		const opencascade::handle<StepShape_TopologicalRepresentationItem> & Value();

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
		/****************** TopoDSToStep_MakeStepFace ******************/
		%feature("compactdefaultargs") TopoDSToStep_MakeStepFace;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopoDSToStep_MakeStepFace;
		 TopoDSToStep_MakeStepFace();

		/****************** TopoDSToStep_MakeStepFace ******************/
		%feature("compactdefaultargs") TopoDSToStep_MakeStepFace;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Face
T: TopoDSToStep_Tool
FP: Transfer_FinderProcess

Returns
-------
None
") TopoDSToStep_MakeStepFace;
		 TopoDSToStep_MakeStepFace(const TopoDS_Face & F, TopoDSToStep_Tool & T, const opencascade::handle<Transfer_FinderProcess> & FP);

		/****************** Error ******************/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDSToStep_MakeFaceError
") Error;
		TopoDSToStep_MakeFaceError Error();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Face
T: TopoDSToStep_Tool
FP: Transfer_FinderProcess

Returns
-------
None
") Init;
		void Init(const TopoDS_Face & F, TopoDSToStep_Tool & T, const opencascade::handle<Transfer_FinderProcess> & FP);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_TopologicalRepresentationItem>
") Value;
		const opencascade::handle<StepShape_TopologicalRepresentationItem> & Value();

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
		/****************** TopoDSToStep_MakeStepVertex ******************/
		%feature("compactdefaultargs") TopoDSToStep_MakeStepVertex;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopoDSToStep_MakeStepVertex;
		 TopoDSToStep_MakeStepVertex();

		/****************** TopoDSToStep_MakeStepVertex ******************/
		%feature("compactdefaultargs") TopoDSToStep_MakeStepVertex;
		%feature("autodoc", "No available documentation.

Parameters
----------
V: TopoDS_Vertex
T: TopoDSToStep_Tool
FP: Transfer_FinderProcess

Returns
-------
None
") TopoDSToStep_MakeStepVertex;
		 TopoDSToStep_MakeStepVertex(const TopoDS_Vertex & V, TopoDSToStep_Tool & T, const opencascade::handle<Transfer_FinderProcess> & FP);

		/****************** Error ******************/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDSToStep_MakeVertexError
") Error;
		TopoDSToStep_MakeVertexError Error();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
V: TopoDS_Vertex
T: TopoDSToStep_Tool
FP: Transfer_FinderProcess

Returns
-------
None
") Init;
		void Init(const TopoDS_Vertex & V, TopoDSToStep_Tool & T, const opencascade::handle<Transfer_FinderProcess> & FP);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_TopologicalRepresentationItem>
") Value;
		const opencascade::handle<StepShape_TopologicalRepresentationItem> & Value();

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
		/****************** TopoDSToStep_MakeStepWire ******************/
		%feature("compactdefaultargs") TopoDSToStep_MakeStepWire;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopoDSToStep_MakeStepWire;
		 TopoDSToStep_MakeStepWire();

		/****************** TopoDSToStep_MakeStepWire ******************/
		%feature("compactdefaultargs") TopoDSToStep_MakeStepWire;
		%feature("autodoc", "No available documentation.

Parameters
----------
W: TopoDS_Wire
T: TopoDSToStep_Tool
FP: Transfer_FinderProcess

Returns
-------
None
") TopoDSToStep_MakeStepWire;
		 TopoDSToStep_MakeStepWire(const TopoDS_Wire & W, TopoDSToStep_Tool & T, const opencascade::handle<Transfer_FinderProcess> & FP);

		/****************** Error ******************/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDSToStep_MakeWireError
") Error;
		TopoDSToStep_MakeWireError Error();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
W: TopoDS_Wire
T: TopoDSToStep_Tool
FP: Transfer_FinderProcess

Returns
-------
None
") Init;
		void Init(const TopoDS_Wire & W, TopoDSToStep_Tool & T, const opencascade::handle<Transfer_FinderProcess> & FP);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_TopologicalRepresentationItem>
") Value;
		const opencascade::handle<StepShape_TopologicalRepresentationItem> & Value();

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
		/****************** TopoDSToStep_WireframeBuilder ******************/
		%feature("compactdefaultargs") TopoDSToStep_WireframeBuilder;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopoDSToStep_WireframeBuilder;
		 TopoDSToStep_WireframeBuilder();

		/****************** TopoDSToStep_WireframeBuilder ******************/
		%feature("compactdefaultargs") TopoDSToStep_WireframeBuilder;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
T: TopoDSToStep_Tool
FP: Transfer_FinderProcess

Returns
-------
None
") TopoDSToStep_WireframeBuilder;
		 TopoDSToStep_WireframeBuilder(const TopoDS_Shape & S, TopoDSToStep_Tool & T, const opencascade::handle<Transfer_FinderProcess> & FP);

		/****************** Error ******************/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDSToStep_BuilderError
") Error;
		TopoDSToStep_BuilderError Error();

		/****************** GetTrimmedCurveFromEdge ******************/
		%feature("compactdefaultargs") GetTrimmedCurveFromEdge;
		%feature("autodoc", "Extraction of trimmed curves from topods_edge for the creation of a geometricallyboundedwireframerepresentation.

Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face
M: MoniTool_DataMapOfShapeTransient
L: TColStd_HSequenceOfTransient

Returns
-------
bool
") GetTrimmedCurveFromEdge;
		Standard_Boolean GetTrimmedCurveFromEdge(const TopoDS_Edge & E, const TopoDS_Face & F, MoniTool_DataMapOfShapeTransient & M, opencascade::handle<TColStd_HSequenceOfTransient> & L);

		/****************** GetTrimmedCurveFromFace ******************/
		%feature("compactdefaultargs") GetTrimmedCurveFromFace;
		%feature("autodoc", "Extraction of trimmed curves from topods_face for the creation of a geometricallyboundedwireframerepresentation.

Parameters
----------
F: TopoDS_Face
M: MoniTool_DataMapOfShapeTransient
L: TColStd_HSequenceOfTransient

Returns
-------
bool
") GetTrimmedCurveFromFace;
		Standard_Boolean GetTrimmedCurveFromFace(const TopoDS_Face & F, MoniTool_DataMapOfShapeTransient & M, opencascade::handle<TColStd_HSequenceOfTransient> & L);

		/****************** GetTrimmedCurveFromShape ******************/
		%feature("compactdefaultargs") GetTrimmedCurveFromShape;
		%feature("autodoc", "Extraction of trimmed curves from any topods_shape for the creation of a geometricallyboundedwireframerepresentation.

Parameters
----------
S: TopoDS_Shape
M: MoniTool_DataMapOfShapeTransient
L: TColStd_HSequenceOfTransient

Returns
-------
bool
") GetTrimmedCurveFromShape;
		Standard_Boolean GetTrimmedCurveFromShape(const TopoDS_Shape & S, MoniTool_DataMapOfShapeTransient & M, opencascade::handle<TColStd_HSequenceOfTransient> & L);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
T: TopoDSToStep_Tool
FP: Transfer_FinderProcess

Returns
-------
None
") Init;
		void Init(const TopoDS_Shape & S, TopoDSToStep_Tool & T, const opencascade::handle<Transfer_FinderProcess> & FP);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HSequenceOfTransient>
") Value;
		const opencascade::handle<TColStd_HSequenceOfTransient> & Value();

};


%extend TopoDSToStep_WireframeBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
