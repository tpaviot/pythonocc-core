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

/*
This file was automatically generated using the pythonocc_generator, see
https://github.com/tpaviot/pythonocc-generator.

This file is platform independant, but was generated under the following
conditions:

- operating system : debian Linux 4.15.0-66-generic
- occt version targeted : 7.4.0
*/

%define TOPODSTOSTEPDOCSTRING
"No docstring provided."
%enddef
%module (package="OCC.Core", docstring=TOPODSTOSTEPDOCSTRING) TopoDSToStep

#pragma SWIG nowarn=504,325,503,520,350,351,383,389,394,395, 404

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


%include TopoDSToStep_headers.i

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

%rename(topodstostep) TopoDSToStep;
class TopoDSToStep {
	public:
		%feature("compactdefaultargs") AddResult;
		%feature("autodoc", "	* Adds an entity into the list of results (binders) for shape stored in FinderProcess

	:param FP:
	:type FP: opencascade::handle<Transfer_FinderProcess> &
	:param Shape:
	:type Shape: TopoDS_Shape &
	:param entity:
	:type entity: opencascade::handle<Standard_Transient> &
	:rtype: void
") AddResult;
		static void AddResult (const opencascade::handle<Transfer_FinderProcess> & FP,const TopoDS_Shape & Shape,const opencascade::handle<Standard_Transient> & entity);
		%feature("compactdefaultargs") AddResult;
		%feature("autodoc", "	* Adds all entities recorded in Tool into the map of results (binders) stored in FinderProcess

	:param FP:
	:type FP: opencascade::handle<Transfer_FinderProcess> &
	:param Tool:
	:type Tool: TopoDSToStep_Tool &
	:rtype: void
") AddResult;
		static void AddResult (const opencascade::handle<Transfer_FinderProcess> & FP,const TopoDSToStep_Tool & Tool);
		%feature("compactdefaultargs") DecodeBuilderError;
		%feature("autodoc", "	:param E:
	:type E: TopoDSToStep_BuilderError
	:rtype: opencascade::handle<TCollection_HAsciiString>
") DecodeBuilderError;
		static opencascade::handle<TCollection_HAsciiString> DecodeBuilderError (const TopoDSToStep_BuilderError E);
		%feature("compactdefaultargs") DecodeEdgeError;
		%feature("autodoc", "	:param E:
	:type E: TopoDSToStep_MakeEdgeError
	:rtype: opencascade::handle<TCollection_HAsciiString>
") DecodeEdgeError;
		static opencascade::handle<TCollection_HAsciiString> DecodeEdgeError (const TopoDSToStep_MakeEdgeError E);
		%feature("compactdefaultargs") DecodeFaceError;
		%feature("autodoc", "	:param E:
	:type E: TopoDSToStep_MakeFaceError
	:rtype: opencascade::handle<TCollection_HAsciiString>
") DecodeFaceError;
		static opencascade::handle<TCollection_HAsciiString> DecodeFaceError (const TopoDSToStep_MakeFaceError E);
		%feature("compactdefaultargs") DecodeVertexError;
		%feature("autodoc", "	* Returns a new shape without undirect surfaces.

	:param E:
	:type E: TopoDSToStep_MakeVertexError
	:rtype: opencascade::handle<TCollection_HAsciiString>
") DecodeVertexError;
		static opencascade::handle<TCollection_HAsciiString> DecodeVertexError (const TopoDSToStep_MakeVertexError E);
		%feature("compactdefaultargs") DecodeWireError;
		%feature("autodoc", "	:param E:
	:type E: TopoDSToStep_MakeWireError
	:rtype: opencascade::handle<TCollection_HAsciiString>
") DecodeWireError;
		static opencascade::handle<TCollection_HAsciiString> DecodeWireError (const TopoDSToStep_MakeWireError E);
};


%extend TopoDSToStep {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class TopoDSToStep_FacetedTool {
	public:
		%feature("compactdefaultargs") CheckTopoDSShape;
		%feature("autodoc", "	:param SH:
	:type SH: TopoDS_Shape &
	:rtype: TopoDSToStep_FacetedError
") CheckTopoDSShape;
		static TopoDSToStep_FacetedError CheckTopoDSShape (const TopoDS_Shape & SH);
};


%extend TopoDSToStep_FacetedTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopoDSToStep_Root;
class TopoDSToStep_Root {
	public:
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();

            %feature("autodoc","1");
            %extend {
                Standard_Real GetTolerance() {
                return (Standard_Real) $self->Tolerance();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetTolerance(Standard_Real value ) {
                $self->Tolerance()=value;
                }
            };
            };


%extend TopoDSToStep_Root {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopoDSToStep_Tool;
class TopoDSToStep_Tool {
	public:
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param T:
	:type T: opencascade::handle<StepShape_TopologicalRepresentationItem> &
	:rtype: None
") Bind;
		void Bind (const TopoDS_Shape & S,const opencascade::handle<StepShape_TopologicalRepresentationItem> & T);
		%feature("compactdefaultargs") CurrentEdge;
		%feature("autodoc", "	:rtype: TopoDS_Edge
") CurrentEdge;
		const TopoDS_Edge  CurrentEdge ();
		%feature("compactdefaultargs") CurrentFace;
		%feature("autodoc", "	:rtype: TopoDS_Face
") CurrentFace;
		const TopoDS_Face  CurrentFace ();
		%feature("compactdefaultargs") CurrentShell;
		%feature("autodoc", "	:rtype: TopoDS_Shell
") CurrentShell;
		const TopoDS_Shell  CurrentShell ();
		%feature("compactdefaultargs") CurrentVertex;
		%feature("autodoc", "	:rtype: TopoDS_Vertex
") CurrentVertex;
		const TopoDS_Vertex  CurrentVertex ();
		%feature("compactdefaultargs") CurrentWire;
		%feature("autodoc", "	:rtype: TopoDS_Wire
") CurrentWire;
		const TopoDS_Wire  CurrentWire ();
		%feature("compactdefaultargs") Faceted;
		%feature("autodoc", "	:rtype: bool
") Faceted;
		Standard_Boolean Faceted ();
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: opencascade::handle<StepShape_TopologicalRepresentationItem>
") Find;
		opencascade::handle<StepShape_TopologicalRepresentationItem> Find (const TopoDS_Shape & S);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param M:
	:type M: MoniTool_DataMapOfShapeTransient &
	:param FacetedContext:
	:type FacetedContext: bool
	:rtype: None
") Init;
		void Init (const MoniTool_DataMapOfShapeTransient & M,const Standard_Boolean FacetedContext);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & S);
		%feature("compactdefaultargs") Lowest3DTolerance;
		%feature("autodoc", "	:rtype: float
") Lowest3DTolerance;
		Standard_Real Lowest3DTolerance ();
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "	:rtype: MoniTool_DataMapOfShapeTransient
") Map;
		const MoniTool_DataMapOfShapeTransient & Map ();
		%feature("compactdefaultargs") PCurveMode;
		%feature("autodoc", "	* Returns mode for writing pcurves (initialized by parameter write.surfacecurve.mode)

	:rtype: int
") PCurveMode;
		Standard_Integer PCurveMode ();
		%feature("compactdefaultargs") SetCurrentEdge;
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Edge &
	:rtype: None
") SetCurrentEdge;
		void SetCurrentEdge (const TopoDS_Edge & E);
		%feature("compactdefaultargs") SetCurrentFace;
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") SetCurrentFace;
		void SetCurrentFace (const TopoDS_Face & F);
		%feature("compactdefaultargs") SetCurrentShell;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shell &
	:rtype: None
") SetCurrentShell;
		void SetCurrentShell (const TopoDS_Shell & S);
		%feature("compactdefaultargs") SetCurrentVertex;
		%feature("autodoc", "	:param V:
	:type V: TopoDS_Vertex &
	:rtype: None
") SetCurrentVertex;
		void SetCurrentVertex (const TopoDS_Vertex & V);
		%feature("compactdefaultargs") SetCurrentWire;
		%feature("autodoc", "	:param W:
	:type W: TopoDS_Wire &
	:rtype: None
") SetCurrentWire;
		void SetCurrentWire (const TopoDS_Wire & W);
		%feature("compactdefaultargs") SetSurfaceReversed;
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") SetSurfaceReversed;
		void SetSurfaceReversed (const Standard_Boolean B);
		%feature("compactdefaultargs") SurfaceReversed;
		%feature("autodoc", "	:rtype: bool
") SurfaceReversed;
		Standard_Boolean SurfaceReversed ();
		%feature("compactdefaultargs") TopoDSToStep_Tool;
		%feature("autodoc", "	:rtype: None
") TopoDSToStep_Tool;
		 TopoDSToStep_Tool ();
		%feature("compactdefaultargs") TopoDSToStep_Tool;
		%feature("autodoc", "	:param M:
	:type M: MoniTool_DataMapOfShapeTransient &
	:param FacetedContext:
	:type FacetedContext: bool
	:rtype: None
") TopoDSToStep_Tool;
		 TopoDSToStep_Tool (const MoniTool_DataMapOfShapeTransient & M,const Standard_Boolean FacetedContext);
};


%extend TopoDSToStep_Tool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopoDSToStep_Builder;
class TopoDSToStep_Builder : public TopoDSToStep_Root {
	public:
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	:rtype: TopoDSToStep_BuilderError
") Error;
		TopoDSToStep_BuilderError Error ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param T:
	:type T: TopoDSToStep_Tool &
	:param FP:
	:type FP: opencascade::handle<Transfer_FinderProcess> &
	:rtype: None
") Init;
		void Init (const TopoDS_Shape & S,TopoDSToStep_Tool & T,const opencascade::handle<Transfer_FinderProcess> & FP);
		%feature("compactdefaultargs") TopoDSToStep_Builder;
		%feature("autodoc", "	:rtype: None
") TopoDSToStep_Builder;
		 TopoDSToStep_Builder ();
		%feature("compactdefaultargs") TopoDSToStep_Builder;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param T:
	:type T: TopoDSToStep_Tool &
	:param FP:
	:type FP: opencascade::handle<Transfer_FinderProcess> &
	:rtype: None
") TopoDSToStep_Builder;
		 TopoDSToStep_Builder (const TopoDS_Shape & S,TopoDSToStep_Tool & T,const opencascade::handle<Transfer_FinderProcess> & FP);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: opencascade::handle<StepShape_TopologicalRepresentationItem>
") Value;
		const opencascade::handle<StepShape_TopologicalRepresentationItem> & Value ();
};


%extend TopoDSToStep_Builder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopoDSToStep_MakeBrepWithVoids;
class TopoDSToStep_MakeBrepWithVoids : public TopoDSToStep_Root {
	public:
		%feature("compactdefaultargs") TopoDSToStep_MakeBrepWithVoids;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Solid &
	:param FP:
	:type FP: opencascade::handle<Transfer_FinderProcess> &
	:rtype: None
") TopoDSToStep_MakeBrepWithVoids;
		 TopoDSToStep_MakeBrepWithVoids (const TopoDS_Solid & S,const opencascade::handle<Transfer_FinderProcess> & FP);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: opencascade::handle<StepShape_BrepWithVoids>
") Value;
		const opencascade::handle<StepShape_BrepWithVoids> & Value ();
};


%extend TopoDSToStep_MakeBrepWithVoids {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopoDSToStep_MakeFacetedBrep;
class TopoDSToStep_MakeFacetedBrep : public TopoDSToStep_Root {
	public:
		%feature("compactdefaultargs") TopoDSToStep_MakeFacetedBrep;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shell &
	:param FP:
	:type FP: opencascade::handle<Transfer_FinderProcess> &
	:rtype: None
") TopoDSToStep_MakeFacetedBrep;
		 TopoDSToStep_MakeFacetedBrep (const TopoDS_Shell & S,const opencascade::handle<Transfer_FinderProcess> & FP);
		%feature("compactdefaultargs") TopoDSToStep_MakeFacetedBrep;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Solid &
	:param FP:
	:type FP: opencascade::handle<Transfer_FinderProcess> &
	:rtype: None
") TopoDSToStep_MakeFacetedBrep;
		 TopoDSToStep_MakeFacetedBrep (const TopoDS_Solid & S,const opencascade::handle<Transfer_FinderProcess> & FP);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: opencascade::handle<StepShape_FacetedBrep>
") Value;
		const opencascade::handle<StepShape_FacetedBrep> & Value ();
};


%extend TopoDSToStep_MakeFacetedBrep {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopoDSToStep_MakeFacetedBrepAndBrepWithVoids;
class TopoDSToStep_MakeFacetedBrepAndBrepWithVoids : public TopoDSToStep_Root {
	public:
		%feature("compactdefaultargs") TopoDSToStep_MakeFacetedBrepAndBrepWithVoids;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Solid &
	:param FP:
	:type FP: opencascade::handle<Transfer_FinderProcess> &
	:rtype: None
") TopoDSToStep_MakeFacetedBrepAndBrepWithVoids;
		 TopoDSToStep_MakeFacetedBrepAndBrepWithVoids (const TopoDS_Solid & S,const opencascade::handle<Transfer_FinderProcess> & FP);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: opencascade::handle<StepShape_FacetedBrepAndBrepWithVoids>
") Value;
		const opencascade::handle<StepShape_FacetedBrepAndBrepWithVoids> & Value ();
};


%extend TopoDSToStep_MakeFacetedBrepAndBrepWithVoids {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopoDSToStep_MakeGeometricCurveSet;
class TopoDSToStep_MakeGeometricCurveSet : public TopoDSToStep_Root {
	public:
		%feature("compactdefaultargs") TopoDSToStep_MakeGeometricCurveSet;
		%feature("autodoc", "	:param SH:
	:type SH: TopoDS_Shape &
	:param FP:
	:type FP: opencascade::handle<Transfer_FinderProcess> &
	:rtype: None
") TopoDSToStep_MakeGeometricCurveSet;
		 TopoDSToStep_MakeGeometricCurveSet (const TopoDS_Shape & SH,const opencascade::handle<Transfer_FinderProcess> & FP);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: opencascade::handle<StepShape_GeometricCurveSet>
") Value;
		const opencascade::handle<StepShape_GeometricCurveSet> & Value ();
};


%extend TopoDSToStep_MakeGeometricCurveSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopoDSToStep_MakeManifoldSolidBrep;
class TopoDSToStep_MakeManifoldSolidBrep : public TopoDSToStep_Root {
	public:
		%feature("compactdefaultargs") TopoDSToStep_MakeManifoldSolidBrep;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shell &
	:param FP:
	:type FP: opencascade::handle<Transfer_FinderProcess> &
	:rtype: None
") TopoDSToStep_MakeManifoldSolidBrep;
		 TopoDSToStep_MakeManifoldSolidBrep (const TopoDS_Shell & S,const opencascade::handle<Transfer_FinderProcess> & FP);
		%feature("compactdefaultargs") TopoDSToStep_MakeManifoldSolidBrep;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Solid &
	:param FP:
	:type FP: opencascade::handle<Transfer_FinderProcess> &
	:rtype: None
") TopoDSToStep_MakeManifoldSolidBrep;
		 TopoDSToStep_MakeManifoldSolidBrep (const TopoDS_Solid & S,const opencascade::handle<Transfer_FinderProcess> & FP);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: opencascade::handle<StepShape_ManifoldSolidBrep>
") Value;
		const opencascade::handle<StepShape_ManifoldSolidBrep> & Value ();
};


%extend TopoDSToStep_MakeManifoldSolidBrep {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopoDSToStep_MakeShellBasedSurfaceModel;
class TopoDSToStep_MakeShellBasedSurfaceModel : public TopoDSToStep_Root {
	public:
		%feature("compactdefaultargs") TopoDSToStep_MakeShellBasedSurfaceModel;
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:param FP:
	:type FP: opencascade::handle<Transfer_FinderProcess> &
	:rtype: None
") TopoDSToStep_MakeShellBasedSurfaceModel;
		 TopoDSToStep_MakeShellBasedSurfaceModel (const TopoDS_Face & F,const opencascade::handle<Transfer_FinderProcess> & FP);
		%feature("compactdefaultargs") TopoDSToStep_MakeShellBasedSurfaceModel;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shell &
	:param FP:
	:type FP: opencascade::handle<Transfer_FinderProcess> &
	:rtype: None
") TopoDSToStep_MakeShellBasedSurfaceModel;
		 TopoDSToStep_MakeShellBasedSurfaceModel (const TopoDS_Shell & S,const opencascade::handle<Transfer_FinderProcess> & FP);
		%feature("compactdefaultargs") TopoDSToStep_MakeShellBasedSurfaceModel;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Solid &
	:param FP:
	:type FP: opencascade::handle<Transfer_FinderProcess> &
	:rtype: None
") TopoDSToStep_MakeShellBasedSurfaceModel;
		 TopoDSToStep_MakeShellBasedSurfaceModel (const TopoDS_Solid & S,const opencascade::handle<Transfer_FinderProcess> & FP);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: opencascade::handle<StepShape_ShellBasedSurfaceModel>
") Value;
		const opencascade::handle<StepShape_ShellBasedSurfaceModel> & Value ();
};


%extend TopoDSToStep_MakeShellBasedSurfaceModel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopoDSToStep_MakeStepEdge;
class TopoDSToStep_MakeStepEdge : public TopoDSToStep_Root {
	public:
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	:rtype: TopoDSToStep_MakeEdgeError
") Error;
		TopoDSToStep_MakeEdgeError Error ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Edge &
	:param T:
	:type T: TopoDSToStep_Tool &
	:param FP:
	:type FP: opencascade::handle<Transfer_FinderProcess> &
	:rtype: None
") Init;
		void Init (const TopoDS_Edge & E,TopoDSToStep_Tool & T,const opencascade::handle<Transfer_FinderProcess> & FP);
		%feature("compactdefaultargs") TopoDSToStep_MakeStepEdge;
		%feature("autodoc", "	:rtype: None
") TopoDSToStep_MakeStepEdge;
		 TopoDSToStep_MakeStepEdge ();
		%feature("compactdefaultargs") TopoDSToStep_MakeStepEdge;
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Edge &
	:param T:
	:type T: TopoDSToStep_Tool &
	:param FP:
	:type FP: opencascade::handle<Transfer_FinderProcess> &
	:rtype: None
") TopoDSToStep_MakeStepEdge;
		 TopoDSToStep_MakeStepEdge (const TopoDS_Edge & E,TopoDSToStep_Tool & T,const opencascade::handle<Transfer_FinderProcess> & FP);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: opencascade::handle<StepShape_TopologicalRepresentationItem>
") Value;
		const opencascade::handle<StepShape_TopologicalRepresentationItem> & Value ();
};


%extend TopoDSToStep_MakeStepEdge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopoDSToStep_MakeStepFace;
class TopoDSToStep_MakeStepFace : public TopoDSToStep_Root {
	public:
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	:rtype: TopoDSToStep_MakeFaceError
") Error;
		TopoDSToStep_MakeFaceError Error ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:param T:
	:type T: TopoDSToStep_Tool &
	:param FP:
	:type FP: opencascade::handle<Transfer_FinderProcess> &
	:rtype: None
") Init;
		void Init (const TopoDS_Face & F,TopoDSToStep_Tool & T,const opencascade::handle<Transfer_FinderProcess> & FP);
		%feature("compactdefaultargs") TopoDSToStep_MakeStepFace;
		%feature("autodoc", "	:rtype: None
") TopoDSToStep_MakeStepFace;
		 TopoDSToStep_MakeStepFace ();
		%feature("compactdefaultargs") TopoDSToStep_MakeStepFace;
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:param T:
	:type T: TopoDSToStep_Tool &
	:param FP:
	:type FP: opencascade::handle<Transfer_FinderProcess> &
	:rtype: None
") TopoDSToStep_MakeStepFace;
		 TopoDSToStep_MakeStepFace (const TopoDS_Face & F,TopoDSToStep_Tool & T,const opencascade::handle<Transfer_FinderProcess> & FP);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: opencascade::handle<StepShape_TopologicalRepresentationItem>
") Value;
		const opencascade::handle<StepShape_TopologicalRepresentationItem> & Value ();
};


%extend TopoDSToStep_MakeStepFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopoDSToStep_MakeStepVertex;
class TopoDSToStep_MakeStepVertex : public TopoDSToStep_Root {
	public:
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	:rtype: TopoDSToStep_MakeVertexError
") Error;
		TopoDSToStep_MakeVertexError Error ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: TopoDS_Vertex &
	:param T:
	:type T: TopoDSToStep_Tool &
	:param FP:
	:type FP: opencascade::handle<Transfer_FinderProcess> &
	:rtype: None
") Init;
		void Init (const TopoDS_Vertex & V,TopoDSToStep_Tool & T,const opencascade::handle<Transfer_FinderProcess> & FP);
		%feature("compactdefaultargs") TopoDSToStep_MakeStepVertex;
		%feature("autodoc", "	:rtype: None
") TopoDSToStep_MakeStepVertex;
		 TopoDSToStep_MakeStepVertex ();
		%feature("compactdefaultargs") TopoDSToStep_MakeStepVertex;
		%feature("autodoc", "	:param V:
	:type V: TopoDS_Vertex &
	:param T:
	:type T: TopoDSToStep_Tool &
	:param FP:
	:type FP: opencascade::handle<Transfer_FinderProcess> &
	:rtype: None
") TopoDSToStep_MakeStepVertex;
		 TopoDSToStep_MakeStepVertex (const TopoDS_Vertex & V,TopoDSToStep_Tool & T,const opencascade::handle<Transfer_FinderProcess> & FP);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: opencascade::handle<StepShape_TopologicalRepresentationItem>
") Value;
		const opencascade::handle<StepShape_TopologicalRepresentationItem> & Value ();
};


%extend TopoDSToStep_MakeStepVertex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopoDSToStep_MakeStepWire;
class TopoDSToStep_MakeStepWire : public TopoDSToStep_Root {
	public:
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	:rtype: TopoDSToStep_MakeWireError
") Error;
		TopoDSToStep_MakeWireError Error ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param W:
	:type W: TopoDS_Wire &
	:param T:
	:type T: TopoDSToStep_Tool &
	:param FP:
	:type FP: opencascade::handle<Transfer_FinderProcess> &
	:rtype: None
") Init;
		void Init (const TopoDS_Wire & W,TopoDSToStep_Tool & T,const opencascade::handle<Transfer_FinderProcess> & FP);
		%feature("compactdefaultargs") TopoDSToStep_MakeStepWire;
		%feature("autodoc", "	:rtype: None
") TopoDSToStep_MakeStepWire;
		 TopoDSToStep_MakeStepWire ();
		%feature("compactdefaultargs") TopoDSToStep_MakeStepWire;
		%feature("autodoc", "	:param W:
	:type W: TopoDS_Wire &
	:param T:
	:type T: TopoDSToStep_Tool &
	:param FP:
	:type FP: opencascade::handle<Transfer_FinderProcess> &
	:rtype: None
") TopoDSToStep_MakeStepWire;
		 TopoDSToStep_MakeStepWire (const TopoDS_Wire & W,TopoDSToStep_Tool & T,const opencascade::handle<Transfer_FinderProcess> & FP);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: opencascade::handle<StepShape_TopologicalRepresentationItem>
") Value;
		const opencascade::handle<StepShape_TopologicalRepresentationItem> & Value ();
};


%extend TopoDSToStep_MakeStepWire {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopoDSToStep_WireframeBuilder;
class TopoDSToStep_WireframeBuilder : public TopoDSToStep_Root {
	public:
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	:rtype: TopoDSToStep_BuilderError
") Error;
		TopoDSToStep_BuilderError Error ();
		%feature("compactdefaultargs") GetTrimmedCurveFromEdge;
		%feature("autodoc", "	* Extraction of Trimmed Curves from TopoDS_Edge for the Creation of a GeometricallyBoundedWireframeRepresentation

	:param E:
	:type E: TopoDS_Edge &
	:param F:
	:type F: TopoDS_Face &
	:param M:
	:type M: MoniTool_DataMapOfShapeTransient &
	:param L:
	:type L: opencascade::handle<TColStd_HSequenceOfTransient> &
	:rtype: bool
") GetTrimmedCurveFromEdge;
		Standard_Boolean GetTrimmedCurveFromEdge (const TopoDS_Edge & E,const TopoDS_Face & F,MoniTool_DataMapOfShapeTransient & M,opencascade::handle<TColStd_HSequenceOfTransient> & L);
		%feature("compactdefaultargs") GetTrimmedCurveFromFace;
		%feature("autodoc", "	* Extraction of Trimmed Curves from TopoDS_Face for the Creation of a GeometricallyBoundedWireframeRepresentation

	:param F:
	:type F: TopoDS_Face &
	:param M:
	:type M: MoniTool_DataMapOfShapeTransient &
	:param L:
	:type L: opencascade::handle<TColStd_HSequenceOfTransient> &
	:rtype: bool
") GetTrimmedCurveFromFace;
		Standard_Boolean GetTrimmedCurveFromFace (const TopoDS_Face & F,MoniTool_DataMapOfShapeTransient & M,opencascade::handle<TColStd_HSequenceOfTransient> & L);
		%feature("compactdefaultargs") GetTrimmedCurveFromShape;
		%feature("autodoc", "	* Extraction of Trimmed Curves from any TopoDS_Shape for the Creation of a GeometricallyBoundedWireframeRepresentation

	:param S:
	:type S: TopoDS_Shape &
	:param M:
	:type M: MoniTool_DataMapOfShapeTransient &
	:param L:
	:type L: opencascade::handle<TColStd_HSequenceOfTransient> &
	:rtype: bool
") GetTrimmedCurveFromShape;
		Standard_Boolean GetTrimmedCurveFromShape (const TopoDS_Shape & S,MoniTool_DataMapOfShapeTransient & M,opencascade::handle<TColStd_HSequenceOfTransient> & L);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param T:
	:type T: TopoDSToStep_Tool &
	:param FP:
	:type FP: opencascade::handle<Transfer_FinderProcess> &
	:rtype: None
") Init;
		void Init (const TopoDS_Shape & S,TopoDSToStep_Tool & T,const opencascade::handle<Transfer_FinderProcess> & FP);
		%feature("compactdefaultargs") TopoDSToStep_WireframeBuilder;
		%feature("autodoc", "	:rtype: None
") TopoDSToStep_WireframeBuilder;
		 TopoDSToStep_WireframeBuilder ();
		%feature("compactdefaultargs") TopoDSToStep_WireframeBuilder;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param T:
	:type T: TopoDSToStep_Tool &
	:param FP:
	:type FP: opencascade::handle<Transfer_FinderProcess> &
	:rtype: None
") TopoDSToStep_WireframeBuilder;
		 TopoDSToStep_WireframeBuilder (const TopoDS_Shape & S,TopoDSToStep_Tool & T,const opencascade::handle<Transfer_FinderProcess> & FP);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: opencascade::handle<TColStd_HSequenceOfTransient>
") Value;
		const opencascade::handle<TColStd_HSequenceOfTransient> & Value ();
};


%extend TopoDSToStep_WireframeBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */
