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
%define TOPODSTOSTEPDOCSTRING
"TopoDSToStep module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_topodstostep.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


%{
#include<StepData_Factors.hxx>
#include<TopoDSToStep_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Transfer_module.hxx>
#include<TopoDS_module.hxx>
#include<TCollection_module.hxx>
#include<StepData_module.hxx>
#include<MoniTool_module.hxx>
#include<StepShape_module.hxx>
#include<Message_module.hxx>
#include<StepVisual_module.hxx>
#include<TColStd_module.hxx>
#include<Message_module.hxx>
#include<StepBasic_module.hxx>
#include<StepGeom_module.hxx>
#include<Interface_module.hxx>
#include<StepRepr_module.hxx>
#include<TopLoc_module.hxx>
#include<Transfer_module.hxx>
#include<StepData_module.hxx>
#include<Resource_module.hxx>
#include<TDF_module.hxx>
#include<Geom2d_module.hxx>
#include<TDocStd_module.hxx>
#include<TopTools_module.hxx>
#include<IFSelect_module.hxx>
#include<Geom_module.hxx>
#include<XSControl_module.hxx>
#include<PCDM_module.hxx>
#include<CDF_module.hxx>
#include<DE_module.hxx>
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
%import StepData.i
%import MoniTool.i
%import StepShape.i
%import Message.i
%import StepVisual.i
%import TColStd.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum TopoDSToStep_BuilderError {
	TopoDSToStep_BuilderDone = 0,
	TopoDSToStep_NoFaceMapped = 1,
	TopoDSToStep_BuilderOther = 2,
};

enum TopoDSToStep_FacetedError {
	TopoDSToStep_FacetedDone = 0,
	TopoDSToStep_SurfaceNotPlane = 1,
	TopoDSToStep_PCurveNotLinear = 2,
};

enum TopoDSToStep_MakeEdgeError {
	TopoDSToStep_EdgeDone = 0,
	TopoDSToStep_NonManifoldEdge = 1,
	TopoDSToStep_EdgeOther = 2,
};

enum TopoDSToStep_MakeFaceError {
	TopoDSToStep_FaceDone = 0,
	TopoDSToStep_InfiniteFace = 1,
	TopoDSToStep_NonManifoldFace = 2,
	TopoDSToStep_NoWireMapped = 3,
	TopoDSToStep_FaceOther = 4,
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

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class TopoDSToStep_BuilderError(IntEnum):
	TopoDSToStep_BuilderDone = 0
	TopoDSToStep_NoFaceMapped = 1
	TopoDSToStep_BuilderOther = 2
TopoDSToStep_BuilderDone = TopoDSToStep_BuilderError.TopoDSToStep_BuilderDone
TopoDSToStep_NoFaceMapped = TopoDSToStep_BuilderError.TopoDSToStep_NoFaceMapped
TopoDSToStep_BuilderOther = TopoDSToStep_BuilderError.TopoDSToStep_BuilderOther

class TopoDSToStep_FacetedError(IntEnum):
	TopoDSToStep_FacetedDone = 0
	TopoDSToStep_SurfaceNotPlane = 1
	TopoDSToStep_PCurveNotLinear = 2
TopoDSToStep_FacetedDone = TopoDSToStep_FacetedError.TopoDSToStep_FacetedDone
TopoDSToStep_SurfaceNotPlane = TopoDSToStep_FacetedError.TopoDSToStep_SurfaceNotPlane
TopoDSToStep_PCurveNotLinear = TopoDSToStep_FacetedError.TopoDSToStep_PCurveNotLinear

class TopoDSToStep_MakeEdgeError(IntEnum):
	TopoDSToStep_EdgeDone = 0
	TopoDSToStep_NonManifoldEdge = 1
	TopoDSToStep_EdgeOther = 2
TopoDSToStep_EdgeDone = TopoDSToStep_MakeEdgeError.TopoDSToStep_EdgeDone
TopoDSToStep_NonManifoldEdge = TopoDSToStep_MakeEdgeError.TopoDSToStep_NonManifoldEdge
TopoDSToStep_EdgeOther = TopoDSToStep_MakeEdgeError.TopoDSToStep_EdgeOther

class TopoDSToStep_MakeFaceError(IntEnum):
	TopoDSToStep_FaceDone = 0
	TopoDSToStep_InfiniteFace = 1
	TopoDSToStep_NonManifoldFace = 2
	TopoDSToStep_NoWireMapped = 3
	TopoDSToStep_FaceOther = 4
TopoDSToStep_FaceDone = TopoDSToStep_MakeFaceError.TopoDSToStep_FaceDone
TopoDSToStep_InfiniteFace = TopoDSToStep_MakeFaceError.TopoDSToStep_InfiniteFace
TopoDSToStep_NonManifoldFace = TopoDSToStep_MakeFaceError.TopoDSToStep_NonManifoldFace
TopoDSToStep_NoWireMapped = TopoDSToStep_MakeFaceError.TopoDSToStep_NoWireMapped
TopoDSToStep_FaceOther = TopoDSToStep_MakeFaceError.TopoDSToStep_FaceOther

class TopoDSToStep_MakeVertexError(IntEnum):
	TopoDSToStep_VertexDone = 0
	TopoDSToStep_VertexOther = 1
TopoDSToStep_VertexDone = TopoDSToStep_MakeVertexError.TopoDSToStep_VertexDone
TopoDSToStep_VertexOther = TopoDSToStep_MakeVertexError.TopoDSToStep_VertexOther

class TopoDSToStep_MakeWireError(IntEnum):
	TopoDSToStep_WireDone = 0
	TopoDSToStep_NonManifoldWire = 1
	TopoDSToStep_WireOther = 2
TopoDSToStep_WireDone = TopoDSToStep_MakeWireError.TopoDSToStep_WireDone
TopoDSToStep_NonManifoldWire = TopoDSToStep_MakeWireError.TopoDSToStep_NonManifoldWire
TopoDSToStep_WireOther = TopoDSToStep_MakeWireError.TopoDSToStep_WireOther
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
		/****** TopoDSToStep::AddResult ******/
		/****** md5 signature: 265a377292c857075227a744e6839483 ******/
		%feature("compactdefaultargs") AddResult;
		%feature("autodoc", "
Parameters
----------
FP: Transfer_FinderProcess
Shape: TopoDS_Shape
entity: Standard_Transient

Return
-------
None

Description
-----------
Adds an entity into the list of results (binders) for shape stored in FinderProcess.
") AddResult;
		static void AddResult(const opencascade::handle<Transfer_FinderProcess> & FP, const TopoDS_Shape & Shape, const opencascade::handle<Standard_Transient> & entity);

		/****** TopoDSToStep::AddResult ******/
		/****** md5 signature: 5301444b22fb863a3316d6a516f49c32 ******/
		%feature("compactdefaultargs") AddResult;
		%feature("autodoc", "
Parameters
----------
FP: Transfer_FinderProcess
Tool: TopoDSToStep_Tool

Return
-------
None

Description
-----------
Adds all entities recorded in Tool into the map of results (binders) stored in FinderProcess.
") AddResult;
		static void AddResult(const opencascade::handle<Transfer_FinderProcess> & FP, const TopoDSToStep_Tool & Tool);

		/****** TopoDSToStep::DecodeBuilderError ******/
		/****** md5 signature: 0342c8e00f4efba4a3d46870032bc844 ******/
		%feature("compactdefaultargs") DecodeBuilderError;
		%feature("autodoc", "
Parameters
----------
E: TopoDSToStep_BuilderError

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") DecodeBuilderError;
		static opencascade::handle<TCollection_HAsciiString> DecodeBuilderError(const TopoDSToStep_BuilderError E);

		/****** TopoDSToStep::DecodeEdgeError ******/
		/****** md5 signature: d63198d1591bffeb37b1572d83e45321 ******/
		%feature("compactdefaultargs") DecodeEdgeError;
		%feature("autodoc", "
Parameters
----------
E: TopoDSToStep_MakeEdgeError

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") DecodeEdgeError;
		static opencascade::handle<TCollection_HAsciiString> DecodeEdgeError(const TopoDSToStep_MakeEdgeError E);

		/****** TopoDSToStep::DecodeFaceError ******/
		/****** md5 signature: 6a891849b9b83be7feae031a703a8919 ******/
		%feature("compactdefaultargs") DecodeFaceError;
		%feature("autodoc", "
Parameters
----------
E: TopoDSToStep_MakeFaceError

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") DecodeFaceError;
		static opencascade::handle<TCollection_HAsciiString> DecodeFaceError(const TopoDSToStep_MakeFaceError E);

		/****** TopoDSToStep::DecodeVertexError ******/
		/****** md5 signature: 34edb2af7b2a3b3f6f0b355a4c0432e6 ******/
		%feature("compactdefaultargs") DecodeVertexError;
		%feature("autodoc", "
Parameters
----------
E: TopoDSToStep_MakeVertexError

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns a new shape without undirect surfaces.
") DecodeVertexError;
		static opencascade::handle<TCollection_HAsciiString> DecodeVertexError(const TopoDSToStep_MakeVertexError E);

		/****** TopoDSToStep::DecodeWireError ******/
		/****** md5 signature: af6607bcf028834615ca26b1a46aea9a ******/
		%feature("compactdefaultargs") DecodeWireError;
		%feature("autodoc", "
Parameters
----------
E: TopoDSToStep_MakeWireError

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
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
		/****** TopoDSToStep_FacetedTool::CheckTopoDSShape ******/
		/****** md5 signature: edb13426fe37876ca766d7998dd2ab91 ******/
		%feature("compactdefaultargs") CheckTopoDSShape;
		%feature("autodoc", "
Parameters
----------
SH: TopoDS_Shape

Return
-------
TopoDSToStep_FacetedError

Description
-----------
No available documentation.
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
		/****** TopoDSToStep_Root::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
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
		/****** TopoDSToStep_Tool::TopoDSToStep_Tool ******/
		/****** md5 signature: c8e45a54558a45b2a9396a9e545ea6d7 ******/
		%feature("compactdefaultargs") TopoDSToStep_Tool;
		%feature("autodoc", "
Parameters
----------
theModel: StepData_StepModel

Return
-------
None

Description
-----------
No available documentation.
") TopoDSToStep_Tool;
		 TopoDSToStep_Tool(const opencascade::handle<StepData_StepModel> & theModel);

		/****** TopoDSToStep_Tool::TopoDSToStep_Tool ******/
		/****** md5 signature: eb0d6ed8b950ed0b2643c2614fc7d25b ******/
		%feature("compactdefaultargs") TopoDSToStep_Tool;
		%feature("autodoc", "
Parameters
----------
M: MoniTool_DataMapOfShapeTransient
FacetedContext: bool
theSurfCurveMode: int

Return
-------
None

Description
-----------
No available documentation.
") TopoDSToStep_Tool;
		 TopoDSToStep_Tool(const MoniTool_DataMapOfShapeTransient & M, const Standard_Boolean FacetedContext, Standard_Integer theSurfCurveMode);

		/****** TopoDSToStep_Tool::Bind ******/
		/****** md5 signature: eb1cbb241139dd2f19bed298c1254b86 ******/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
T: StepShape_TopologicalRepresentationItem

Return
-------
None

Description
-----------
No available documentation.
") Bind;
		void Bind(const TopoDS_Shape & S, const opencascade::handle<StepShape_TopologicalRepresentationItem> & T);

		/****** TopoDSToStep_Tool::CurrentEdge ******/
		/****** md5 signature: 6473dcaed0b12706629a91e3a882496d ******/
		%feature("compactdefaultargs") CurrentEdge;
		%feature("autodoc", "Return
-------
TopoDS_Edge

Description
-----------
No available documentation.
") CurrentEdge;
		const TopoDS_Edge CurrentEdge();

		/****** TopoDSToStep_Tool::CurrentFace ******/
		/****** md5 signature: 9b7c2063b646f1a517c8a771e28bc0fe ******/
		%feature("compactdefaultargs") CurrentFace;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
No available documentation.
") CurrentFace;
		const TopoDS_Face CurrentFace();

		/****** TopoDSToStep_Tool::CurrentShell ******/
		/****** md5 signature: e0079df5bd465c2182055f5d485d6c85 ******/
		%feature("compactdefaultargs") CurrentShell;
		%feature("autodoc", "Return
-------
TopoDS_Shell

Description
-----------
No available documentation.
") CurrentShell;
		const TopoDS_Shell CurrentShell();

		/****** TopoDSToStep_Tool::CurrentVertex ******/
		/****** md5 signature: b76f05d6c3d7cad0ee0de4c1edcf342b ******/
		%feature("compactdefaultargs") CurrentVertex;
		%feature("autodoc", "Return
-------
TopoDS_Vertex

Description
-----------
No available documentation.
") CurrentVertex;
		const TopoDS_Vertex CurrentVertex();

		/****** TopoDSToStep_Tool::CurrentWire ******/
		/****** md5 signature: fdb7b467060e354bfd3f4d8b2dccc286 ******/
		%feature("compactdefaultargs") CurrentWire;
		%feature("autodoc", "Return
-------
TopoDS_Wire

Description
-----------
No available documentation.
") CurrentWire;
		const TopoDS_Wire CurrentWire();

		/****** TopoDSToStep_Tool::Faceted ******/
		/****** md5 signature: 4c45e59cbc651a2e2ad7cb62700facb2 ******/
		%feature("compactdefaultargs") Faceted;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Faceted;
		Standard_Boolean Faceted();

		/****** TopoDSToStep_Tool::Find ******/
		/****** md5 signature: fec839c5d7aa9ad5bdcc69aa8396a85e ******/
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
opencascade::handle<StepShape_TopologicalRepresentationItem>

Description
-----------
No available documentation.
") Find;
		opencascade::handle<StepShape_TopologicalRepresentationItem> Find(const TopoDS_Shape & S);

		/****** TopoDSToStep_Tool::Init ******/
		/****** md5 signature: 0542c18be98bceb8d2bae5f657727c08 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
M: MoniTool_DataMapOfShapeTransient
FacetedContext: bool
theSurfCurveMode: int

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const MoniTool_DataMapOfShapeTransient & M, const Standard_Boolean FacetedContext, Standard_Integer theSurfCurveMode);

		/****** TopoDSToStep_Tool::IsBound ******/
		/****** md5 signature: ee89f312bc91d678b4b798f38c3c5b8b ******/
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
bool

Description
-----------
No available documentation.
") IsBound;
		Standard_Boolean IsBound(const TopoDS_Shape & S);

		/****** TopoDSToStep_Tool::Lowest3DTolerance ******/
		/****** md5 signature: db16df510866751c4d7e3960781fa6ea ******/
		%feature("compactdefaultargs") Lowest3DTolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Lowest3DTolerance;
		Standard_Real Lowest3DTolerance();

		/****** TopoDSToStep_Tool::Map ******/
		/****** md5 signature: a867b21d47560eec37b689abf83789b5 ******/
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "Return
-------
MoniTool_DataMapOfShapeTransient

Description
-----------
No available documentation.
") Map;
		const MoniTool_DataMapOfShapeTransient & Map();

		/****** TopoDSToStep_Tool::PCurveMode ******/
		/****** md5 signature: 6f6886e7cbc38350145db47d723c288a ******/
		%feature("compactdefaultargs") PCurveMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns mode for writing pcurves (initialized by parameter write.surfacecurve.mode).
") PCurveMode;
		Standard_Integer PCurveMode();

		/****** TopoDSToStep_Tool::SetCurrentEdge ******/
		/****** md5 signature: 047f31a5d0b804722b33adb169db566d ******/
		%feature("compactdefaultargs") SetCurrentEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
None

Description
-----------
No available documentation.
") SetCurrentEdge;
		void SetCurrentEdge(const TopoDS_Edge & E);

		/****** TopoDSToStep_Tool::SetCurrentFace ******/
		/****** md5 signature: 04be05f0e9f22c367925b75b0c485203 ******/
		%feature("compactdefaultargs") SetCurrentFace;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
None

Description
-----------
No available documentation.
") SetCurrentFace;
		void SetCurrentFace(const TopoDS_Face & F);

		/****** TopoDSToStep_Tool::SetCurrentShell ******/
		/****** md5 signature: 5998b1620eb5e26a696837b797dc24f0 ******/
		%feature("compactdefaultargs") SetCurrentShell;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shell

Return
-------
None

Description
-----------
No available documentation.
") SetCurrentShell;
		void SetCurrentShell(const TopoDS_Shell & S);

		/****** TopoDSToStep_Tool::SetCurrentVertex ******/
		/****** md5 signature: 12e9f8501414d83c69e83a1b8aa39715 ******/
		%feature("compactdefaultargs") SetCurrentVertex;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex

Return
-------
None

Description
-----------
No available documentation.
") SetCurrentVertex;
		void SetCurrentVertex(const TopoDS_Vertex & V);

		/****** TopoDSToStep_Tool::SetCurrentWire ******/
		/****** md5 signature: 7f489ee5fe90fdb936f34288eb997bd5 ******/
		%feature("compactdefaultargs") SetCurrentWire;
		%feature("autodoc", "
Parameters
----------
W: TopoDS_Wire

Return
-------
None

Description
-----------
No available documentation.
") SetCurrentWire;
		void SetCurrentWire(const TopoDS_Wire & W);

		/****** TopoDSToStep_Tool::SetSurfaceReversed ******/
		/****** md5 signature: 0264c8e82a425d98969751ca9ac94ced ******/
		%feature("compactdefaultargs") SetSurfaceReversed;
		%feature("autodoc", "
Parameters
----------
B: bool

Return
-------
None

Description
-----------
No available documentation.
") SetSurfaceReversed;
		void SetSurfaceReversed(const Standard_Boolean B);

		/****** TopoDSToStep_Tool::SurfaceReversed ******/
		/****** md5 signature: e7ee357f0f870d0083593b4587934f46 ******/
		%feature("compactdefaultargs") SurfaceReversed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
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
		/****** TopoDSToStep_Builder::TopoDSToStep_Builder ******/
		/****** md5 signature: ba3125cd525682a469a107e812f6a112 ******/
		%feature("compactdefaultargs") TopoDSToStep_Builder;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopoDSToStep_Builder;
		 TopoDSToStep_Builder();

		/****** TopoDSToStep_Builder::TopoDSToStep_Builder ******/
		/****** md5 signature: cdc7cfb21bd32a65161eebcf41b22e3b ******/
		%feature("compactdefaultargs") TopoDSToStep_Builder;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
T: TopoDSToStep_Tool
FP: Transfer_FinderProcess
theTessellatedGeomParam: int
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
No available documentation.
") TopoDSToStep_Builder;
		 TopoDSToStep_Builder(const TopoDS_Shape & S, TopoDSToStep_Tool & T, const opencascade::handle<Transfer_FinderProcess> & FP, const Standard_Integer theTessellatedGeomParam, const StepData_Factors & theLocalFactors = StepData_Factors(), const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** TopoDSToStep_Builder::Error ******/
		/****** md5 signature: 4bfee53f7138b72d517fea79437aa1f7 ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Return
-------
TopoDSToStep_BuilderError

Description
-----------
No available documentation.
") Error;
		TopoDSToStep_BuilderError Error();

		/****** TopoDSToStep_Builder::Init ******/
		/****** md5 signature: d228a304671904895c6d1357dfc5c0d0 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
T: TopoDSToStep_Tool
FP: Transfer_FinderProcess
theTessellatedGeomParam: int
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TopoDS_Shape & S, TopoDSToStep_Tool & T, const opencascade::handle<Transfer_FinderProcess> & FP, const Standard_Integer theTessellatedGeomParam, const StepData_Factors & theLocalFactors = StepData_Factors(), const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** TopoDSToStep_Builder::TessellatedValue ******/
		/****** md5 signature: 154b00c76f3b8e8ab68ed5498da15f8b ******/
		%feature("compactdefaultargs") TessellatedValue;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_TessellatedItem>

Description
-----------
No available documentation.
") TessellatedValue;
		const opencascade::handle<StepVisual_TessellatedItem> & TessellatedValue();

		/****** TopoDSToStep_Builder::Value ******/
		/****** md5 signature: 93f870518e0f3e5d539f05051ca83055 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<StepShape_TopologicalRepresentationItem>

Description
-----------
No available documentation.
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
		/****** TopoDSToStep_MakeBrepWithVoids::TopoDSToStep_MakeBrepWithVoids ******/
		/****** md5 signature: a0851ebc9b82f8e99ce050d50d46ceea ******/
		%feature("compactdefaultargs") TopoDSToStep_MakeBrepWithVoids;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Solid
FP: Transfer_FinderProcess
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
No available documentation.
") TopoDSToStep_MakeBrepWithVoids;
		 TopoDSToStep_MakeBrepWithVoids(const TopoDS_Solid & S, const opencascade::handle<Transfer_FinderProcess> & FP, const StepData_Factors & theLocalFactors = StepData_Factors(), const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** TopoDSToStep_MakeBrepWithVoids::TessellatedValue ******/
		/****** md5 signature: 154b00c76f3b8e8ab68ed5498da15f8b ******/
		%feature("compactdefaultargs") TessellatedValue;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_TessellatedItem>

Description
-----------
No available documentation.
") TessellatedValue;
		const opencascade::handle<StepVisual_TessellatedItem> & TessellatedValue();

		/****** TopoDSToStep_MakeBrepWithVoids::Value ******/
		/****** md5 signature: d72647c7f4bca2f2e71c4a091a4acc6e ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<StepShape_BrepWithVoids>

Description
-----------
No available documentation.
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
		/****** TopoDSToStep_MakeFacetedBrep::TopoDSToStep_MakeFacetedBrep ******/
		/****** md5 signature: 6fa85019619728882132ddbe2886ed8b ******/
		%feature("compactdefaultargs") TopoDSToStep_MakeFacetedBrep;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shell
FP: Transfer_FinderProcess
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
No available documentation.
") TopoDSToStep_MakeFacetedBrep;
		 TopoDSToStep_MakeFacetedBrep(const TopoDS_Shell & S, const opencascade::handle<Transfer_FinderProcess> & FP, const StepData_Factors & theLocalFactors = StepData_Factors(), const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** TopoDSToStep_MakeFacetedBrep::TopoDSToStep_MakeFacetedBrep ******/
		/****** md5 signature: b81f67cd008a503f3a3c29805199460b ******/
		%feature("compactdefaultargs") TopoDSToStep_MakeFacetedBrep;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Solid
FP: Transfer_FinderProcess
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
No available documentation.
") TopoDSToStep_MakeFacetedBrep;
		 TopoDSToStep_MakeFacetedBrep(const TopoDS_Solid & S, const opencascade::handle<Transfer_FinderProcess> & FP, const StepData_Factors & theLocalFactors = StepData_Factors(), const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** TopoDSToStep_MakeFacetedBrep::TessellatedValue ******/
		/****** md5 signature: 154b00c76f3b8e8ab68ed5498da15f8b ******/
		%feature("compactdefaultargs") TessellatedValue;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_TessellatedItem>

Description
-----------
No available documentation.
") TessellatedValue;
		const opencascade::handle<StepVisual_TessellatedItem> & TessellatedValue();

		/****** TopoDSToStep_MakeFacetedBrep::Value ******/
		/****** md5 signature: b742cde4076883160493264b81367cb7 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<StepShape_FacetedBrep>

Description
-----------
No available documentation.
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
		/****** TopoDSToStep_MakeFacetedBrepAndBrepWithVoids::TopoDSToStep_MakeFacetedBrepAndBrepWithVoids ******/
		/****** md5 signature: 964464541084350ff8fc276d0e3b7794 ******/
		%feature("compactdefaultargs") TopoDSToStep_MakeFacetedBrepAndBrepWithVoids;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Solid
FP: Transfer_FinderProcess
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
No available documentation.
") TopoDSToStep_MakeFacetedBrepAndBrepWithVoids;
		 TopoDSToStep_MakeFacetedBrepAndBrepWithVoids(const TopoDS_Solid & S, const opencascade::handle<Transfer_FinderProcess> & FP, const StepData_Factors & theLocalFactors = StepData_Factors(), const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** TopoDSToStep_MakeFacetedBrepAndBrepWithVoids::TessellatedValue ******/
		/****** md5 signature: 154b00c76f3b8e8ab68ed5498da15f8b ******/
		%feature("compactdefaultargs") TessellatedValue;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_TessellatedItem>

Description
-----------
No available documentation.
") TessellatedValue;
		const opencascade::handle<StepVisual_TessellatedItem> & TessellatedValue();

		/****** TopoDSToStep_MakeFacetedBrepAndBrepWithVoids::Value ******/
		/****** md5 signature: 3c4cb0ca6dbe9c2df0807e20ce2593d1 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<StepShape_FacetedBrepAndBrepWithVoids>

Description
-----------
No available documentation.
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
		/****** TopoDSToStep_MakeGeometricCurveSet::TopoDSToStep_MakeGeometricCurveSet ******/
		/****** md5 signature: aa38f6d4459da99eeb12fa263bc51801 ******/
		%feature("compactdefaultargs") TopoDSToStep_MakeGeometricCurveSet;
		%feature("autodoc", "
Parameters
----------
SH: TopoDS_Shape
FP: Transfer_FinderProcess
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())

Return
-------
None

Description
-----------
No available documentation.
") TopoDSToStep_MakeGeometricCurveSet;
		 TopoDSToStep_MakeGeometricCurveSet(const TopoDS_Shape & SH, const opencascade::handle<Transfer_FinderProcess> & FP, const StepData_Factors & theLocalFactors = StepData_Factors());

		/****** TopoDSToStep_MakeGeometricCurveSet::Value ******/
		/****** md5 signature: 332abd683912d69109235089fdd27780 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<StepShape_GeometricCurveSet>

Description
-----------
No available documentation.
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
		/****** TopoDSToStep_MakeManifoldSolidBrep::TopoDSToStep_MakeManifoldSolidBrep ******/
		/****** md5 signature: 0245db766101b4f28113dfd7638acd7a ******/
		%feature("compactdefaultargs") TopoDSToStep_MakeManifoldSolidBrep;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shell
FP: Transfer_FinderProcess
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
No available documentation.
") TopoDSToStep_MakeManifoldSolidBrep;
		 TopoDSToStep_MakeManifoldSolidBrep(const TopoDS_Shell & S, const opencascade::handle<Transfer_FinderProcess> & FP, const StepData_Factors & theLocalFactors = StepData_Factors(), const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** TopoDSToStep_MakeManifoldSolidBrep::TopoDSToStep_MakeManifoldSolidBrep ******/
		/****** md5 signature: c589a608701b67eb54a5f1048c3ae2d6 ******/
		%feature("compactdefaultargs") TopoDSToStep_MakeManifoldSolidBrep;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Solid
FP: Transfer_FinderProcess
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
No available documentation.
") TopoDSToStep_MakeManifoldSolidBrep;
		 TopoDSToStep_MakeManifoldSolidBrep(const TopoDS_Solid & S, const opencascade::handle<Transfer_FinderProcess> & FP, const StepData_Factors & theLocalFactors = StepData_Factors(), const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** TopoDSToStep_MakeManifoldSolidBrep::TessellatedValue ******/
		/****** md5 signature: 154b00c76f3b8e8ab68ed5498da15f8b ******/
		%feature("compactdefaultargs") TessellatedValue;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_TessellatedItem>

Description
-----------
No available documentation.
") TessellatedValue;
		const opencascade::handle<StepVisual_TessellatedItem> & TessellatedValue();

		/****** TopoDSToStep_MakeManifoldSolidBrep::Value ******/
		/****** md5 signature: 523ad3a36206eb6d9f186b9735aa69ce ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<StepShape_ManifoldSolidBrep>

Description
-----------
No available documentation.
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
		/****** TopoDSToStep_MakeShellBasedSurfaceModel::TopoDSToStep_MakeShellBasedSurfaceModel ******/
		/****** md5 signature: a9d85c4a5b1ab87db67a371b48765aef ******/
		%feature("compactdefaultargs") TopoDSToStep_MakeShellBasedSurfaceModel;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
FP: Transfer_FinderProcess
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
No available documentation.
") TopoDSToStep_MakeShellBasedSurfaceModel;
		 TopoDSToStep_MakeShellBasedSurfaceModel(const TopoDS_Face & F, const opencascade::handle<Transfer_FinderProcess> & FP, const StepData_Factors & theLocalFactors = StepData_Factors(), const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** TopoDSToStep_MakeShellBasedSurfaceModel::TopoDSToStep_MakeShellBasedSurfaceModel ******/
		/****** md5 signature: 9c0a5e3b85a781e690109e9c0a3f2446 ******/
		%feature("compactdefaultargs") TopoDSToStep_MakeShellBasedSurfaceModel;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shell
FP: Transfer_FinderProcess
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
No available documentation.
") TopoDSToStep_MakeShellBasedSurfaceModel;
		 TopoDSToStep_MakeShellBasedSurfaceModel(const TopoDS_Shell & S, const opencascade::handle<Transfer_FinderProcess> & FP, const StepData_Factors & theLocalFactors = StepData_Factors(), const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** TopoDSToStep_MakeShellBasedSurfaceModel::TopoDSToStep_MakeShellBasedSurfaceModel ******/
		/****** md5 signature: bbf70bec252bc13bd383064ae05564ac ******/
		%feature("compactdefaultargs") TopoDSToStep_MakeShellBasedSurfaceModel;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Solid
FP: Transfer_FinderProcess
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
No available documentation.
") TopoDSToStep_MakeShellBasedSurfaceModel;
		 TopoDSToStep_MakeShellBasedSurfaceModel(const TopoDS_Solid & S, const opencascade::handle<Transfer_FinderProcess> & FP, const StepData_Factors & theLocalFactors = StepData_Factors(), const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** TopoDSToStep_MakeShellBasedSurfaceModel::TessellatedValue ******/
		/****** md5 signature: 154b00c76f3b8e8ab68ed5498da15f8b ******/
		%feature("compactdefaultargs") TessellatedValue;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_TessellatedItem>

Description
-----------
No available documentation.
") TessellatedValue;
		const opencascade::handle<StepVisual_TessellatedItem> & TessellatedValue();

		/****** TopoDSToStep_MakeShellBasedSurfaceModel::Value ******/
		/****** md5 signature: 6c59d3f4bc485bc5dec9fe78343c6060 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<StepShape_ShellBasedSurfaceModel>

Description
-----------
No available documentation.
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
		/****** TopoDSToStep_MakeStepEdge::TopoDSToStep_MakeStepEdge ******/
		/****** md5 signature: 36c0f2efc6dc30c43c18120fc479e746 ******/
		%feature("compactdefaultargs") TopoDSToStep_MakeStepEdge;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopoDSToStep_MakeStepEdge;
		 TopoDSToStep_MakeStepEdge();

		/****** TopoDSToStep_MakeStepEdge::TopoDSToStep_MakeStepEdge ******/
		/****** md5 signature: 32171a3fde70658681d86b0ae285b191 ******/
		%feature("compactdefaultargs") TopoDSToStep_MakeStepEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
T: TopoDSToStep_Tool
FP: Transfer_FinderProcess
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())

Return
-------
None

Description
-----------
No available documentation.
") TopoDSToStep_MakeStepEdge;
		 TopoDSToStep_MakeStepEdge(const TopoDS_Edge & E, TopoDSToStep_Tool & T, const opencascade::handle<Transfer_FinderProcess> & FP, const StepData_Factors & theLocalFactors = StepData_Factors());

		/****** TopoDSToStep_MakeStepEdge::Error ******/
		/****** md5 signature: 3de3a6694f58a58e3a3e5adfdbafb765 ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Return
-------
TopoDSToStep_MakeEdgeError

Description
-----------
No available documentation.
") Error;
		TopoDSToStep_MakeEdgeError Error();

		/****** TopoDSToStep_MakeStepEdge::Init ******/
		/****** md5 signature: b5e63091b65ea6332d775e43a4c95e9d ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
T: TopoDSToStep_Tool
FP: Transfer_FinderProcess
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TopoDS_Edge & E, TopoDSToStep_Tool & T, const opencascade::handle<Transfer_FinderProcess> & FP, const StepData_Factors & theLocalFactors = StepData_Factors());

		/****** TopoDSToStep_MakeStepEdge::Value ******/
		/****** md5 signature: 93f870518e0f3e5d539f05051ca83055 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<StepShape_TopologicalRepresentationItem>

Description
-----------
No available documentation.
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
		/****** TopoDSToStep_MakeStepFace::TopoDSToStep_MakeStepFace ******/
		/****** md5 signature: e982a12321855185ca84bf5eaad31a82 ******/
		%feature("compactdefaultargs") TopoDSToStep_MakeStepFace;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopoDSToStep_MakeStepFace;
		 TopoDSToStep_MakeStepFace();

		/****** TopoDSToStep_MakeStepFace::TopoDSToStep_MakeStepFace ******/
		/****** md5 signature: f91f3d0db9d0960bbc2f4642720e4d51 ******/
		%feature("compactdefaultargs") TopoDSToStep_MakeStepFace;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
T: TopoDSToStep_Tool
FP: Transfer_FinderProcess
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())

Return
-------
None

Description
-----------
No available documentation.
") TopoDSToStep_MakeStepFace;
		 TopoDSToStep_MakeStepFace(const TopoDS_Face & F, TopoDSToStep_Tool & T, const opencascade::handle<Transfer_FinderProcess> & FP, const StepData_Factors & theLocalFactors = StepData_Factors());

		/****** TopoDSToStep_MakeStepFace::Error ******/
		/****** md5 signature: e3364d5908c1cf929d202ef4509a97dc ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Return
-------
TopoDSToStep_MakeFaceError

Description
-----------
No available documentation.
") Error;
		TopoDSToStep_MakeFaceError Error();

		/****** TopoDSToStep_MakeStepFace::Init ******/
		/****** md5 signature: d427e8d24adfd49aa231da34bfd6e466 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
T: TopoDSToStep_Tool
FP: Transfer_FinderProcess
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TopoDS_Face & F, TopoDSToStep_Tool & T, const opencascade::handle<Transfer_FinderProcess> & FP, const StepData_Factors & theLocalFactors = StepData_Factors());

		/****** TopoDSToStep_MakeStepFace::Value ******/
		/****** md5 signature: 93f870518e0f3e5d539f05051ca83055 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<StepShape_TopologicalRepresentationItem>

Description
-----------
No available documentation.
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
		/****** TopoDSToStep_MakeStepVertex::TopoDSToStep_MakeStepVertex ******/
		/****** md5 signature: 2d9100717760db97a5d91e7569892b43 ******/
		%feature("compactdefaultargs") TopoDSToStep_MakeStepVertex;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopoDSToStep_MakeStepVertex;
		 TopoDSToStep_MakeStepVertex();

		/****** TopoDSToStep_MakeStepVertex::TopoDSToStep_MakeStepVertex ******/
		/****** md5 signature: 870e4565e192e8ad00070bc468e425ae ******/
		%feature("compactdefaultargs") TopoDSToStep_MakeStepVertex;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
T: TopoDSToStep_Tool
FP: Transfer_FinderProcess
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())

Return
-------
None

Description
-----------
No available documentation.
") TopoDSToStep_MakeStepVertex;
		 TopoDSToStep_MakeStepVertex(const TopoDS_Vertex & V, TopoDSToStep_Tool & T, const opencascade::handle<Transfer_FinderProcess> & FP, const StepData_Factors & theLocalFactors = StepData_Factors());

		/****** TopoDSToStep_MakeStepVertex::Error ******/
		/****** md5 signature: 01ce425bb82586f8b90b0514f5864328 ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Return
-------
TopoDSToStep_MakeVertexError

Description
-----------
No available documentation.
") Error;
		TopoDSToStep_MakeVertexError Error();

		/****** TopoDSToStep_MakeStepVertex::Init ******/
		/****** md5 signature: b0e7109e2e74a67d5741e4806b9444b1 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
T: TopoDSToStep_Tool
FP: Transfer_FinderProcess
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TopoDS_Vertex & V, TopoDSToStep_Tool & T, const opencascade::handle<Transfer_FinderProcess> & FP, const StepData_Factors & theLocalFactors = StepData_Factors());

		/****** TopoDSToStep_MakeStepVertex::Value ******/
		/****** md5 signature: 93f870518e0f3e5d539f05051ca83055 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<StepShape_TopologicalRepresentationItem>

Description
-----------
No available documentation.
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
		/****** TopoDSToStep_MakeStepWire::TopoDSToStep_MakeStepWire ******/
		/****** md5 signature: 437953f5ff4d389f2dc44e5862f32e04 ******/
		%feature("compactdefaultargs") TopoDSToStep_MakeStepWire;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopoDSToStep_MakeStepWire;
		 TopoDSToStep_MakeStepWire();

		/****** TopoDSToStep_MakeStepWire::TopoDSToStep_MakeStepWire ******/
		/****** md5 signature: 51b1fd530fa063a306112bf4840a2ff5 ******/
		%feature("compactdefaultargs") TopoDSToStep_MakeStepWire;
		%feature("autodoc", "
Parameters
----------
W: TopoDS_Wire
T: TopoDSToStep_Tool
FP: Transfer_FinderProcess
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())

Return
-------
None

Description
-----------
No available documentation.
") TopoDSToStep_MakeStepWire;
		 TopoDSToStep_MakeStepWire(const TopoDS_Wire & W, TopoDSToStep_Tool & T, const opencascade::handle<Transfer_FinderProcess> & FP, const StepData_Factors & theLocalFactors = StepData_Factors());

		/****** TopoDSToStep_MakeStepWire::Error ******/
		/****** md5 signature: 870bd4bf61bd025eb0957624f231f6d7 ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Return
-------
TopoDSToStep_MakeWireError

Description
-----------
No available documentation.
") Error;
		TopoDSToStep_MakeWireError Error();

		/****** TopoDSToStep_MakeStepWire::Init ******/
		/****** md5 signature: 7efcca4325a90405a59f98ff15203186 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
W: TopoDS_Wire
T: TopoDSToStep_Tool
FP: Transfer_FinderProcess
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TopoDS_Wire & W, TopoDSToStep_Tool & T, const opencascade::handle<Transfer_FinderProcess> & FP, const StepData_Factors & theLocalFactors = StepData_Factors());

		/****** TopoDSToStep_MakeStepWire::Value ******/
		/****** md5 signature: 93f870518e0f3e5d539f05051ca83055 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<StepShape_TopologicalRepresentationItem>

Description
-----------
No available documentation.
") Value;
		const opencascade::handle<StepShape_TopologicalRepresentationItem> & Value();

};


%extend TopoDSToStep_MakeStepWire {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class TopoDSToStep_MakeTessellatedItem *
*****************************************/
class TopoDSToStep_MakeTessellatedItem : public TopoDSToStep_Root {
	public:
		/****** TopoDSToStep_MakeTessellatedItem::TopoDSToStep_MakeTessellatedItem ******/
		/****** md5 signature: 7f4bc4ee3ac4628d994cdd508a007609 ******/
		%feature("compactdefaultargs") TopoDSToStep_MakeTessellatedItem;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopoDSToStep_MakeTessellatedItem;
		 TopoDSToStep_MakeTessellatedItem();

		/****** TopoDSToStep_MakeTessellatedItem::TopoDSToStep_MakeTessellatedItem ******/
		/****** md5 signature: c0e2031dfe6f587809c1bee4acd37fb6 ******/
		%feature("compactdefaultargs") TopoDSToStep_MakeTessellatedItem;
		%feature("autodoc", "
Parameters
----------
theFace: TopoDS_Face
theTool: TopoDSToStep_Tool
theFP: Transfer_FinderProcess
theToPreferSurfaceSet: bool
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
No available documentation.
") TopoDSToStep_MakeTessellatedItem;
		 TopoDSToStep_MakeTessellatedItem(const TopoDS_Face & theFace, TopoDSToStep_Tool & theTool, const opencascade::handle<Transfer_FinderProcess> & theFP, const Standard_Boolean theToPreferSurfaceSet, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** TopoDSToStep_MakeTessellatedItem::TopoDSToStep_MakeTessellatedItem ******/
		/****** md5 signature: 2941c27543604aed6e4746372c79c163 ******/
		%feature("compactdefaultargs") TopoDSToStep_MakeTessellatedItem;
		%feature("autodoc", "
Parameters
----------
theShell: TopoDS_Shell
theTool: TopoDSToStep_Tool
theFP: Transfer_FinderProcess
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
No available documentation.
") TopoDSToStep_MakeTessellatedItem;
		 TopoDSToStep_MakeTessellatedItem(const TopoDS_Shell & theShell, TopoDSToStep_Tool & theTool, const opencascade::handle<Transfer_FinderProcess> & theFP, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** TopoDSToStep_MakeTessellatedItem::Init ******/
		/****** md5 signature: 168e8e05b69b7c87ef5a634d0928818b ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theFace: TopoDS_Face
theTool: TopoDSToStep_Tool
theFP: Transfer_FinderProcess
theToPreferSurfaceSet: bool
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TopoDS_Face & theFace, TopoDSToStep_Tool & theTool, const opencascade::handle<Transfer_FinderProcess> & theFP, const Standard_Boolean theToPreferSurfaceSet, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** TopoDSToStep_MakeTessellatedItem::Init ******/
		/****** md5 signature: 781e28edc1a038cd335bb888b804cc0a ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theShell: TopoDS_Shell
theTool: TopoDSToStep_Tool
theFP: Transfer_FinderProcess
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TopoDS_Shell & theShell, TopoDSToStep_Tool & theTool, const opencascade::handle<Transfer_FinderProcess> & theFP, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** TopoDSToStep_MakeTessellatedItem::Value ******/
		/****** md5 signature: 6c52dba76720ae1e573bfb8cddd551c1 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_TessellatedItem>

Description
-----------
No available documentation.
") Value;
		const opencascade::handle<StepVisual_TessellatedItem> & Value();

};


%extend TopoDSToStep_MakeTessellatedItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class TopoDSToStep_WireframeBuilder *
**************************************/
class TopoDSToStep_WireframeBuilder : public TopoDSToStep_Root {
	public:
		/****** TopoDSToStep_WireframeBuilder::TopoDSToStep_WireframeBuilder ******/
		/****** md5 signature: 486f7717e47769c630fabcfb21472cdd ******/
		%feature("compactdefaultargs") TopoDSToStep_WireframeBuilder;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopoDSToStep_WireframeBuilder;
		 TopoDSToStep_WireframeBuilder();

		/****** TopoDSToStep_WireframeBuilder::TopoDSToStep_WireframeBuilder ******/
		/****** md5 signature: 77f3368f9763012d5ceee7840611dfd8 ******/
		%feature("compactdefaultargs") TopoDSToStep_WireframeBuilder;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
T: TopoDSToStep_Tool
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())

Return
-------
None

Description
-----------
No available documentation.
") TopoDSToStep_WireframeBuilder;
		 TopoDSToStep_WireframeBuilder(const TopoDS_Shape & S, TopoDSToStep_Tool & T, const StepData_Factors & theLocalFactors = StepData_Factors());

		/****** TopoDSToStep_WireframeBuilder::Error ******/
		/****** md5 signature: 4bfee53f7138b72d517fea79437aa1f7 ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Return
-------
TopoDSToStep_BuilderError

Description
-----------
No available documentation.
") Error;
		TopoDSToStep_BuilderError Error();

		/****** TopoDSToStep_WireframeBuilder::GetTrimmedCurveFromEdge ******/
		/****** md5 signature: db00877b50a9db4366f5dfb773d5cf4e ******/
		%feature("compactdefaultargs") GetTrimmedCurveFromEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face
M: MoniTool_DataMapOfShapeTransient
L: TColStd_HSequenceOfTransient
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())

Return
-------
bool

Description
-----------
Extraction of Trimmed Curves from TopoDS_Edge for the Creation of a GeometricallyBoundedWireframeRepresentation.
") GetTrimmedCurveFromEdge;
		Standard_Boolean GetTrimmedCurveFromEdge(const TopoDS_Edge & E, const TopoDS_Face & F, MoniTool_DataMapOfShapeTransient & M, opencascade::handle<TColStd_HSequenceOfTransient> & L, const StepData_Factors & theLocalFactors = StepData_Factors());

		/****** TopoDSToStep_WireframeBuilder::GetTrimmedCurveFromFace ******/
		/****** md5 signature: 9fc93853cd751fffe38d34bdc6b55ccd ******/
		%feature("compactdefaultargs") GetTrimmedCurveFromFace;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
M: MoniTool_DataMapOfShapeTransient
L: TColStd_HSequenceOfTransient
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())

Return
-------
bool

Description
-----------
Extraction of Trimmed Curves from TopoDS_Face for the Creation of a GeometricallyBoundedWireframeRepresentation.
") GetTrimmedCurveFromFace;
		Standard_Boolean GetTrimmedCurveFromFace(const TopoDS_Face & F, MoniTool_DataMapOfShapeTransient & M, opencascade::handle<TColStd_HSequenceOfTransient> & L, const StepData_Factors & theLocalFactors = StepData_Factors());

		/****** TopoDSToStep_WireframeBuilder::GetTrimmedCurveFromShape ******/
		/****** md5 signature: 717a9b2adce329e3b53b4719ccf9656b ******/
		%feature("compactdefaultargs") GetTrimmedCurveFromShape;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
M: MoniTool_DataMapOfShapeTransient
L: TColStd_HSequenceOfTransient
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())

Return
-------
bool

Description
-----------
Extraction of Trimmed Curves from any TopoDS_Shape for the Creation of a GeometricallyBoundedWireframeRepresentation.
") GetTrimmedCurveFromShape;
		Standard_Boolean GetTrimmedCurveFromShape(const TopoDS_Shape & S, MoniTool_DataMapOfShapeTransient & M, opencascade::handle<TColStd_HSequenceOfTransient> & L, const StepData_Factors & theLocalFactors = StepData_Factors());

		/****** TopoDSToStep_WireframeBuilder::Init ******/
		/****** md5 signature: f86f9d8f84df9d0070571c7e6a1d34f8 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
T: TopoDSToStep_Tool
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TopoDS_Shape & S, TopoDSToStep_Tool & T, const StepData_Factors & theLocalFactors = StepData_Factors());

		/****** TopoDSToStep_WireframeBuilder::Value ******/
		/****** md5 signature: a3f32410191ccadbf4addae27fce695d ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HSequenceOfTransient>

Description
-----------
No available documentation.
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
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def topodstostep_AddResult(*args):
	return topodstostep.AddResult(*args)

@deprecated
def topodstostep_AddResult(*args):
	return topodstostep.AddResult(*args)

@deprecated
def topodstostep_DecodeBuilderError(*args):
	return topodstostep.DecodeBuilderError(*args)

@deprecated
def topodstostep_DecodeEdgeError(*args):
	return topodstostep.DecodeEdgeError(*args)

@deprecated
def topodstostep_DecodeFaceError(*args):
	return topodstostep.DecodeFaceError(*args)

@deprecated
def topodstostep_DecodeVertexError(*args):
	return topodstostep.DecodeVertexError(*args)

@deprecated
def topodstostep_DecodeWireError(*args):
	return topodstostep.DecodeWireError(*args)

@deprecated
def TopoDSToStep_FacetedTool_CheckTopoDSShape(*args):
	return TopoDSToStep_FacetedTool.CheckTopoDSShape(*args)

}
