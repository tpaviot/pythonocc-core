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
from enum import IntEnum
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

class TopoDSToStep_MakeEdgeError(IntEnum):
	TopoDSToStep_EdgeDone = 0
	TopoDSToStep_NonManifoldEdge = 1
	TopoDSToStep_EdgeOther = 2
TopoDSToStep_EdgeDone = TopoDSToStep_MakeEdgeError.TopoDSToStep_EdgeDone
TopoDSToStep_NonManifoldEdge = TopoDSToStep_MakeEdgeError.TopoDSToStep_NonManifoldEdge
TopoDSToStep_EdgeOther = TopoDSToStep_MakeEdgeError.TopoDSToStep_EdgeOther

class TopoDSToStep_BuilderError(IntEnum):
	TopoDSToStep_BuilderDone = 0
	TopoDSToStep_NoFaceMapped = 1
	TopoDSToStep_BuilderOther = 2
TopoDSToStep_BuilderDone = TopoDSToStep_BuilderError.TopoDSToStep_BuilderDone
TopoDSToStep_NoFaceMapped = TopoDSToStep_BuilderError.TopoDSToStep_NoFaceMapped
TopoDSToStep_BuilderOther = TopoDSToStep_BuilderError.TopoDSToStep_BuilderOther

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

class TopoDSToStep_FacetedError(IntEnum):
	TopoDSToStep_FacetedDone = 0
	TopoDSToStep_SurfaceNotPlane = 1
	TopoDSToStep_PCurveNotLinear = 2
TopoDSToStep_FacetedDone = TopoDSToStep_FacetedError.TopoDSToStep_FacetedDone
TopoDSToStep_SurfaceNotPlane = TopoDSToStep_FacetedError.TopoDSToStep_SurfaceNotPlane
TopoDSToStep_PCurveNotLinear = TopoDSToStep_FacetedError.TopoDSToStep_PCurveNotLinear
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
		/**** md5 signature: 265a377292c857075227a744e6839483 ****/
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
		/**** md5 signature: 5301444b22fb863a3316d6a516f49c32 ****/
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
		/**** md5 signature: 0342c8e00f4efba4a3d46870032bc844 ****/
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
		/**** md5 signature: d63198d1591bffeb37b1572d83e45321 ****/
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
		/**** md5 signature: 6a891849b9b83be7feae031a703a8919 ****/
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
		/**** md5 signature: 34edb2af7b2a3b3f6f0b355a4c0432e6 ****/
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
		/**** md5 signature: af6607bcf028834615ca26b1a46aea9a ****/
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
		/**** md5 signature: edb13426fe37876ca766d7998dd2ab91 ****/
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
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
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
		/**** md5 signature: 69b421d248746ef5136b0bc263150009 ****/
		%feature("compactdefaultargs") TopoDSToStep_Tool;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopoDSToStep_Tool;
		 TopoDSToStep_Tool();

		/****************** TopoDSToStep_Tool ******************/
		/**** md5 signature: 6f1c781c8c807f4736d5a60a23e06f0f ****/
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
		/**** md5 signature: eb1cbb241139dd2f19bed298c1254b86 ****/
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
		/**** md5 signature: 6473dcaed0b12706629a91e3a882496d ****/
		%feature("compactdefaultargs") CurrentEdge;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Edge
") CurrentEdge;
		const TopoDS_Edge CurrentEdge();

		/****************** CurrentFace ******************/
		/**** md5 signature: 9b7c2063b646f1a517c8a771e28bc0fe ****/
		%feature("compactdefaultargs") CurrentFace;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Face
") CurrentFace;
		const TopoDS_Face CurrentFace();

		/****************** CurrentShell ******************/
		/**** md5 signature: e0079df5bd465c2182055f5d485d6c85 ****/
		%feature("compactdefaultargs") CurrentShell;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shell
") CurrentShell;
		const TopoDS_Shell CurrentShell();

		/****************** CurrentVertex ******************/
		/**** md5 signature: b76f05d6c3d7cad0ee0de4c1edcf342b ****/
		%feature("compactdefaultargs") CurrentVertex;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Vertex
") CurrentVertex;
		const TopoDS_Vertex CurrentVertex();

		/****************** CurrentWire ******************/
		/**** md5 signature: fdb7b467060e354bfd3f4d8b2dccc286 ****/
		%feature("compactdefaultargs") CurrentWire;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Wire
") CurrentWire;
		const TopoDS_Wire CurrentWire();

		/****************** Faceted ******************/
		/**** md5 signature: 4c45e59cbc651a2e2ad7cb62700facb2 ****/
		%feature("compactdefaultargs") Faceted;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Faceted;
		Standard_Boolean Faceted();

		/****************** Find ******************/
		/**** md5 signature: fec839c5d7aa9ad5bdcc69aa8396a85e ****/
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
		/**** md5 signature: 835b752a8c8ab942f6c034b89cbd8a12 ****/
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
		/**** md5 signature: ee89f312bc91d678b4b798f38c3c5b8b ****/
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
		/**** md5 signature: db16df510866751c4d7e3960781fa6ea ****/
		%feature("compactdefaultargs") Lowest3DTolerance;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Lowest3DTolerance;
		Standard_Real Lowest3DTolerance();

		/****************** Map ******************/
		/**** md5 signature: a867b21d47560eec37b689abf83789b5 ****/
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "No available documentation.

Returns
-------
MoniTool_DataMapOfShapeTransient
") Map;
		const MoniTool_DataMapOfShapeTransient & Map();

		/****************** PCurveMode ******************/
		/**** md5 signature: 6f6886e7cbc38350145db47d723c288a ****/
		%feature("compactdefaultargs") PCurveMode;
		%feature("autodoc", "Returns mode for writing pcurves (initialized by parameter write.surfacecurve.mode).

Returns
-------
int
") PCurveMode;
		Standard_Integer PCurveMode();

		/****************** SetCurrentEdge ******************/
		/**** md5 signature: 047f31a5d0b804722b33adb169db566d ****/
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
		/**** md5 signature: 04be05f0e9f22c367925b75b0c485203 ****/
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
		/**** md5 signature: 5998b1620eb5e26a696837b797dc24f0 ****/
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
		/**** md5 signature: 12e9f8501414d83c69e83a1b8aa39715 ****/
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
		/**** md5 signature: 7f489ee5fe90fdb936f34288eb997bd5 ****/
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
		/**** md5 signature: 0264c8e82a425d98969751ca9ac94ced ****/
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
		/**** md5 signature: e7ee357f0f870d0083593b4587934f46 ****/
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
		/**** md5 signature: ba3125cd525682a469a107e812f6a112 ****/
		%feature("compactdefaultargs") TopoDSToStep_Builder;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopoDSToStep_Builder;
		 TopoDSToStep_Builder();

		/****************** TopoDSToStep_Builder ******************/
		/**** md5 signature: d05d11fac36f48b5b946d43b732f8a1a ****/
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
		/**** md5 signature: 4bfee53f7138b72d517fea79437aa1f7 ****/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDSToStep_BuilderError
") Error;
		TopoDSToStep_BuilderError Error();

		/****************** Init ******************/
		/**** md5 signature: 236fa74366610b421d1df65d77c015d6 ****/
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
		/**** md5 signature: 93f870518e0f3e5d539f05051ca83055 ****/
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
		/**** md5 signature: b3cd070693cf67a1d2b650ddcf9eb519 ****/
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
		/**** md5 signature: d72647c7f4bca2f2e71c4a091a4acc6e ****/
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
		/**** md5 signature: 2d6a1813aa77128caf81b1e973aa9784 ****/
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
		/**** md5 signature: 3184bf8d538101e0eca718fa1684ae0a ****/
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
		/**** md5 signature: b742cde4076883160493264b81367cb7 ****/
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
		/**** md5 signature: 75bbab5f5ba9fbb6a47459df6f3b6de9 ****/
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
		/**** md5 signature: 3c4cb0ca6dbe9c2df0807e20ce2593d1 ****/
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
		/**** md5 signature: 72cd1da69d3ca074730f58b4f2f14bd5 ****/
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
		/**** md5 signature: 332abd683912d69109235089fdd27780 ****/
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
		/**** md5 signature: 92dbabf1a9e929fe8f1e2b201627e1c8 ****/
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
		/**** md5 signature: ab98b00daacf8ff6c2c459044143a87d ****/
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
		/**** md5 signature: 523ad3a36206eb6d9f186b9735aa69ce ****/
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
		/**** md5 signature: 8be51a4f59ec968537eadb6157b9906f ****/
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
		/**** md5 signature: 3b82d457a08021b5724d7a41f56e10d0 ****/
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
		/**** md5 signature: cfa464aa43890ce6b1bbb3c17342b14b ****/
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
		/**** md5 signature: 6c59d3f4bc485bc5dec9fe78343c6060 ****/
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
		/**** md5 signature: 36c0f2efc6dc30c43c18120fc479e746 ****/
		%feature("compactdefaultargs") TopoDSToStep_MakeStepEdge;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopoDSToStep_MakeStepEdge;
		 TopoDSToStep_MakeStepEdge();

		/****************** TopoDSToStep_MakeStepEdge ******************/
		/**** md5 signature: a39125a413ec41755a363d879a8f0534 ****/
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
		/**** md5 signature: 3de3a6694f58a58e3a3e5adfdbafb765 ****/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDSToStep_MakeEdgeError
") Error;
		TopoDSToStep_MakeEdgeError Error();

		/****************** Init ******************/
		/**** md5 signature: f1ac96afd47aa7b57554a5fdb0e07a04 ****/
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
		/**** md5 signature: 93f870518e0f3e5d539f05051ca83055 ****/
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
		/**** md5 signature: e982a12321855185ca84bf5eaad31a82 ****/
		%feature("compactdefaultargs") TopoDSToStep_MakeStepFace;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopoDSToStep_MakeStepFace;
		 TopoDSToStep_MakeStepFace();

		/****************** TopoDSToStep_MakeStepFace ******************/
		/**** md5 signature: 65bc010557ee0d07db3f21b56417dff1 ****/
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
		/**** md5 signature: e3364d5908c1cf929d202ef4509a97dc ****/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDSToStep_MakeFaceError
") Error;
		TopoDSToStep_MakeFaceError Error();

		/****************** Init ******************/
		/**** md5 signature: 786570d4b2152681661393d014009b7b ****/
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
		/**** md5 signature: 93f870518e0f3e5d539f05051ca83055 ****/
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
		/**** md5 signature: 2d9100717760db97a5d91e7569892b43 ****/
		%feature("compactdefaultargs") TopoDSToStep_MakeStepVertex;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopoDSToStep_MakeStepVertex;
		 TopoDSToStep_MakeStepVertex();

		/****************** TopoDSToStep_MakeStepVertex ******************/
		/**** md5 signature: 9b8bdb395fbc5875f2eaa2830adf88c8 ****/
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
		/**** md5 signature: 01ce425bb82586f8b90b0514f5864328 ****/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDSToStep_MakeVertexError
") Error;
		TopoDSToStep_MakeVertexError Error();

		/****************** Init ******************/
		/**** md5 signature: 6656698d804601e37132b6d4bdbb1c42 ****/
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
		/**** md5 signature: 93f870518e0f3e5d539f05051ca83055 ****/
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
		/**** md5 signature: 437953f5ff4d389f2dc44e5862f32e04 ****/
		%feature("compactdefaultargs") TopoDSToStep_MakeStepWire;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopoDSToStep_MakeStepWire;
		 TopoDSToStep_MakeStepWire();

		/****************** TopoDSToStep_MakeStepWire ******************/
		/**** md5 signature: 41c4c680a9d0ba385246c188730c5d8c ****/
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
		/**** md5 signature: 870bd4bf61bd025eb0957624f231f6d7 ****/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDSToStep_MakeWireError
") Error;
		TopoDSToStep_MakeWireError Error();

		/****************** Init ******************/
		/**** md5 signature: a293a361a76cc01c0b19dbd0b768f171 ****/
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
		/**** md5 signature: 93f870518e0f3e5d539f05051ca83055 ****/
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
		/**** md5 signature: 486f7717e47769c630fabcfb21472cdd ****/
		%feature("compactdefaultargs") TopoDSToStep_WireframeBuilder;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopoDSToStep_WireframeBuilder;
		 TopoDSToStep_WireframeBuilder();

		/****************** TopoDSToStep_WireframeBuilder ******************/
		/**** md5 signature: 3f0a2f5b7ccca706abbb5e2b959c8111 ****/
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
		/**** md5 signature: 4bfee53f7138b72d517fea79437aa1f7 ****/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDSToStep_BuilderError
") Error;
		TopoDSToStep_BuilderError Error();

		/****************** GetTrimmedCurveFromEdge ******************/
		/**** md5 signature: 25ceb842dff6400231f9b3b62d553ca9 ****/
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
		/**** md5 signature: 91bc0d27e93e716d15ab6cc5d874a868 ****/
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
		/**** md5 signature: 5b16ba33e10780cccba38a3b7c8c01e0 ****/
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
		/**** md5 signature: 236fa74366610b421d1df65d77c015d6 ****/
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
		/**** md5 signature: a3f32410191ccadbf4addae27fce695d ****/
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
