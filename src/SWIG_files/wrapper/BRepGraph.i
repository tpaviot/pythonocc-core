/*
Copyright 2008-2026 Thomas Paviot (tpaviot@gmail.com)

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
%define BREPGRAPHDOCSTRING
"BRepGraph module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_brepgraph.html"
%enddef
%module (package="OCC.Core", docstring=BREPGRAPHDOCSTRING) BRepGraph


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
#include<BRepGraph_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TCollection_module.hxx>
#include<TopLoc_module.hxx>
#include<TopAbs_module.hxx>
#include<Geom2d_module.hxx>
#include<Poly_module.hxx>
#include<Geom_module.hxx>
#include<gp_module.hxx>
#include<TopoDS_module.hxx>
#include<BRepTools_module.hxx>
#include<Geom2dAdaptor_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<Adaptor3d_module.hxx>
#include<TopoDS_module.hxx>
#include<TopLoc_module.hxx>
#include<TopAbs_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<Poly_module.hxx>
#include<gp_module.hxx>
#include<TCollection_module.hxx>
#include<TopTools_module.hxx>
#include<BRepTools_module.hxx>
#include<BRep_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Geom2dAdaptor_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<TShort_module.hxx>
#include<Bnd_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
#include<OSD_module.hxx>
// nested classes wrapped as top level classes
typedef BRepGraph_CacheMesh::EntryStamp BRepGraph_CacheMesh_EntryStamp;
typedef BRepGraph_CacheMesh::FaceMeshEntry BRepGraph_CacheMesh_FaceMeshEntry;
typedef BRepGraph_CacheMesh::CoEdgeMeshEntry BRepGraph_CacheMesh_CoEdgeMeshEntry;
typedef BRepGraph_CacheMesh::EdgeMeshEntry BRepGraph_CacheMesh_EdgeMeshEntry;
typedef BRepGraph_CacheMesh::DirtySet BRepGraph_CacheMesh_DirtySet;
typedef BRepGraph_CacheMesh::SlotState BRepGraph_CacheMesh_SlotState;
typedef BRepGraph_CacheMesh::Driver BRepGraph_CacheMesh_Driver;
typedef BRepGraph_ChildExplorer::Config BRepGraph_ChildExplorer_Config;
typedef BRepGraph_Compact::Options BRepGraph_Compact_Options;
typedef BRepGraph_Compact::Result BRepGraph_Compact_Result;
typedef BRepGraph_Deduplicate::Options BRepGraph_Deduplicate_Options;
typedef BRepGraph_Deduplicate::Result BRepGraph_Deduplicate_Result;
typedef BRepGraph::EditorView BRepGraph_EditorView;
typedef BRepGraph::EditorView::VertexOps BRepGraph_EditorView_VertexOps;
typedef BRepGraph::EditorView::EdgeOps BRepGraph_EditorView_EdgeOps;
typedef BRepGraph::EditorView::CoEdgeOps BRepGraph_EditorView_CoEdgeOps;
typedef BRepGraph::EditorView::WireOps BRepGraph_EditorView_WireOps;
typedef BRepGraph::EditorView::FaceOps BRepGraph_EditorView_FaceOps;
typedef BRepGraph::EditorView::ShellOps BRepGraph_EditorView_ShellOps;
typedef BRepGraph::EditorView::SolidOps BRepGraph_EditorView_SolidOps;
typedef BRepGraph::EditorView::CompoundOps BRepGraph_EditorView_CompoundOps;
typedef BRepGraph::EditorView::CompSolidOps BRepGraph_EditorView_CompSolidOps;
typedef BRepGraph::EditorView::ProductOps BRepGraph_EditorView_ProductOps;
typedef BRepGraph::EditorView::OccurrenceOps BRepGraph_EditorView_OccurrenceOps;
typedef BRepGraph::EditorView::GenOps BRepGraph_EditorView_GenOps;
typedef BRepGraph::EditorView::BoundaryIssue BRepGraph_EditorView_BoundaryIssue;
typedef BRepGraph_LayerDeferred::Representation BRepGraph_LayerDeferred_Representation;
typedef BRepGraph_LayerDeferred::Entry BRepGraph_LayerDeferred_Entry;
typedef BRepGraph_LayerDeferred::Entry::RepresentationStorage BRepGraph_LayerDeferred_Entry_RepresentationStorage;
typedef BRepGraph_LayerHistory::Event BRepGraph_LayerHistory_Event;
typedef BRepGraph_LayerLock::ScopedOwnerEdit BRepGraph_LayerLock_ScopedOwnerEdit;
typedef BRepGraph_LayerParametric::AddResult BRepGraph_LayerParametric_AddResult;
typedef BRepGraph_LayerTopoSupplement::Entry BRepGraph_LayerTopoSupplement_Entry;
typedef BRepGraph::MeshView BRepGraph_MeshView;
typedef BRepGraph::MeshView::CacheView BRepGraph_MeshView_CacheView;
typedef BRepGraph::MeshView::CacheView::FaceOps BRepGraph_MeshView_CacheView_FaceOps;
typedef BRepGraph::MeshView::CacheView::EdgeOps BRepGraph_MeshView_CacheView_EdgeOps;
typedef BRepGraph::MeshView::CacheView::CoEdgeOps BRepGraph_MeshView_CacheView_CoEdgeOps;
typedef BRepGraph::MeshView::PersistentView BRepGraph_MeshView_PersistentView;
typedef BRepGraph::MeshView::PersistentView::FaceOps BRepGraph_MeshView_PersistentView_FaceOps;
typedef BRepGraph::MeshView::PersistentView::EdgeOps BRepGraph_MeshView_PersistentView_EdgeOps;
typedef BRepGraph::MeshView::PersistentView::CoEdgeOps BRepGraph_MeshView_PersistentView_CoEdgeOps;
typedef BRepGraph::MeshView::EffectiveView BRepGraph_MeshView_EffectiveView;
typedef BRepGraph::MeshView::EffectiveView::FaceOps BRepGraph_MeshView_EffectiveView_FaceOps;
typedef BRepGraph::MeshView::EffectiveView::EdgeOps BRepGraph_MeshView_EffectiveView_EdgeOps;
typedef BRepGraph::MeshView::EffectiveView::CoEdgeOps BRepGraph_MeshView_EffectiveView_CoEdgeOps;
typedef BRepGraph::MeshView::EditorView BRepGraph_MeshView_EditorView;
typedef BRepGraph::MeshView::EditorView::FaceOps BRepGraph_MeshView_EditorView_FaceOps;
typedef BRepGraph::MeshView::EditorView::EdgeOps BRepGraph_MeshView_EditorView_EdgeOps;
typedef BRepGraph::MeshView::EditorView::CoEdgeOps BRepGraph_MeshView_EditorView_CoEdgeOps;
typedef BRepGraph::MeshView::PolyOps BRepGraph_MeshView_PolyOps;
typedef BRepGraph_ParallelPolicy::Workload BRepGraph_ParallelPolicy_Workload;
typedef BRepGraph_ParentExplorer::Config BRepGraph_ParentExplorer_Config;
typedef BRepGraph::RefsView BRepGraph_RefsView;
typedef BRepGraph::RefsView::ShellOps BRepGraph_RefsView_ShellOps;
typedef BRepGraph::RefsView::FaceOps BRepGraph_RefsView_FaceOps;
typedef BRepGraph::RefsView::WireOps BRepGraph_RefsView_WireOps;
typedef BRepGraph::RefsView::VertexOps BRepGraph_RefsView_VertexOps;
typedef BRepGraph::RefsView::SolidOps BRepGraph_RefsView_SolidOps;
typedef BRepGraph::RefsView::ChildOps BRepGraph_RefsView_ChildOps;
typedef BRepGraph::RefsView::OccurrenceOps BRepGraph_RefsView_OccurrenceOps;
typedef BRepGraph::RefsView::GenOps BRepGraph_RefsView_GenOps;
typedef BRepGraph::ShapesView BRepGraph_ShapesView;
typedef BRepGraph::ShapesView::Options BRepGraph_ShapesView_Options;
typedef BRepGraph::ShapesView::Result BRepGraph_ShapesView_Result;
typedef BRepGraph_Tool::Vertex BRepGraph_Tool_Vertex;
typedef BRepGraph_Tool::Edge BRepGraph_Tool_Edge;
typedef BRepGraph_Tool::CoEdge BRepGraph_Tool_CoEdge;
typedef BRepGraph_Tool::Face BRepGraph_Tool_Face;
typedef BRepGraph_Tool::Wire BRepGraph_Tool_Wire;
typedef BRepGraph_Tool::Shell BRepGraph_Tool_Shell;
typedef BRepGraph::TopoView BRepGraph_TopoView;
typedef BRepGraph::TopoView::FaceOps BRepGraph_TopoView_FaceOps;
typedef BRepGraph::TopoView::EdgeOps BRepGraph_TopoView_EdgeOps;
typedef BRepGraph::TopoView::VertexOps BRepGraph_TopoView_VertexOps;
typedef BRepGraph::TopoView::WireOps BRepGraph_TopoView_WireOps;
typedef BRepGraph::TopoView::ShellOps BRepGraph_TopoView_ShellOps;
typedef BRepGraph::TopoView::SolidOps BRepGraph_TopoView_SolidOps;
typedef BRepGraph::TopoView::CoEdgeOps BRepGraph_TopoView_CoEdgeOps;
typedef BRepGraph::TopoView::CompoundOps BRepGraph_TopoView_CompoundOps;
typedef BRepGraph::TopoView::CompSolidOps BRepGraph_TopoView_CompSolidOps;
typedef BRepGraph::TopoView::ProductOps BRepGraph_TopoView_ProductOps;
typedef BRepGraph::TopoView::OccurrenceOps BRepGraph_TopoView_OccurrenceOps;
typedef BRepGraph::TopoView::GenOps BRepGraph_TopoView_GenOps;
typedef BRepGraph::TopoView::GeometryOps BRepGraph_TopoView_GeometryOps;
typedef BRepGraph::UIDsView BRepGraph_UIDsView;
typedef BRepGraph_UsagePath::Step BRepGraph_UsagePath_Step;
typedef BRepGraph_Validate::Issue BRepGraph_Validate_Issue;
typedef BRepGraph_Validate::Result BRepGraph_Validate_Result;
typedef BRepGraph_Validate::Options BRepGraph_Validate_Options;
%};
%import Standard.i
%import NCollection.i
%import TCollection.i
%import TopLoc.i
%import TopAbs.i
%import Geom2d.i
%import Poly.i
%import Geom.i
%import gp.i
%import TopoDS.i
%import BRepTools.i
%import Geom2dAdaptor.i
%import GeomAdaptor.i
%import Adaptor3d.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

%include <stdint.i>
/* public enums */
/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
%wrap_handle(BRepGraph_Cache)
%wrap_handle(BRepGraph_Layer)
%wrap_handle(BRepGraph_CacheDerivedState)
%wrap_handle(BRepGraph_LayerHistory)
%wrap_handle(BRepGraph_LayerLock)
%wrap_handle(BRepGraph_LayerParametric)
/* end handles declaration */

/* templates */
%include "BRepGraph_Iterator.hxx";
%template(BRepGraph_CoEdgeIterator) BRepGraph_Iterator<BRepGraphInc::CoEdgeDef>;
%template(BRepGraph_CompSolidIterator) BRepGraph_Iterator<BRepGraphInc::CompSolidDef>;
%template(BRepGraph_CompoundIterator) BRepGraph_Iterator<BRepGraphInc::CompoundDef>;
%template(BRepGraph_EdgeIterator) BRepGraph_Iterator<BRepGraphInc::EdgeDef>;
%template(BRepGraph_FaceIterator) BRepGraph_Iterator<BRepGraphInc::FaceDef>;
%template(BRepGraph_FullCoEdgeIterator) BRepGraph_Iterator<BRepGraphInc::CoEdgeDef,true>;
%template(BRepGraph_FullCompSolidIterator) BRepGraph_Iterator<BRepGraphInc::CompSolidDef,true>;
%template(BRepGraph_FullCompoundIterator) BRepGraph_Iterator<BRepGraphInc::CompoundDef,true>;
%template(BRepGraph_FullEdgeIterator) BRepGraph_Iterator<BRepGraphInc::EdgeDef,true>;
%template(BRepGraph_FullFaceIterator) BRepGraph_Iterator<BRepGraphInc::FaceDef,true>;
%template(BRepGraph_FullOccurrenceIterator) BRepGraph_Iterator<BRepGraphInc::OccurrenceDef,true>;
%template(BRepGraph_FullProductIterator) BRepGraph_Iterator<BRepGraphInc::ProductDef,true>;
%template(BRepGraph_FullShellIterator) BRepGraph_Iterator<BRepGraphInc::ShellDef,true>;
%template(BRepGraph_FullSolidIterator) BRepGraph_Iterator<BRepGraphInc::SolidDef,true>;
%template(BRepGraph_FullVertexIterator) BRepGraph_Iterator<BRepGraphInc::VertexDef,true>;
%template(BRepGraph_FullWireIterator) BRepGraph_Iterator<BRepGraphInc::WireDef,true>;
%template(BRepGraph_OccurrenceIterator) BRepGraph_Iterator<BRepGraphInc::OccurrenceDef>;
%template(BRepGraph_ProductIterator) BRepGraph_Iterator<BRepGraphInc::ProductDef>;
%template(BRepGraph_ShellIterator) BRepGraph_Iterator<BRepGraphInc::ShellDef>;
%template(BRepGraph_SolidIterator) BRepGraph_Iterator<BRepGraphInc::SolidDef>;
%template(BRepGraph_VertexIterator) BRepGraph_Iterator<BRepGraphInc::VertexDef>;
%template(BRepGraph_WireIterator) BRepGraph_Iterator<BRepGraphInc::WireDef>;
/* end templates declaration */

/* typedefs */
typedef BRepGraph_Iterator<BRepGraphInc::CoEdgeDef> BRepGraph_CoEdgeIterator;
typedef BRepGraph_Iterator<BRepGraphInc::CompSolidDef> BRepGraph_CompSolidIterator;
typedef BRepGraph_Iterator<BRepGraphInc::CompoundDef> BRepGraph_CompoundIterator;
typedef BRepGraph_DefsIterator::DefsVertexOfEdge BRepGraph_DefsVertexOfEdge;
typedef BRepGraph_Iterator<BRepGraphInc::EdgeDef> BRepGraph_EdgeIterator;
typedef BRepGraph_Iterator<BRepGraphInc::FaceDef> BRepGraph_FaceIterator;
typedef BRepGraph_Iterator<BRepGraphInc::CoEdgeDef, true> BRepGraph_FullCoEdgeIterator;
typedef BRepGraph_Iterator<BRepGraphInc::CompSolidDef, true> BRepGraph_FullCompSolidIterator;
typedef BRepGraph_Iterator<BRepGraphInc::CompoundDef, true> BRepGraph_FullCompoundIterator;
typedef BRepGraph_Iterator<BRepGraphInc::EdgeDef, true> BRepGraph_FullEdgeIterator;
typedef BRepGraph_Iterator<BRepGraphInc::FaceDef, true> BRepGraph_FullFaceIterator;
typedef BRepGraph_Iterator<BRepGraphInc::OccurrenceDef, true> BRepGraph_FullOccurrenceIterator;
typedef BRepGraph_Iterator<BRepGraphInc::ProductDef, true> BRepGraph_FullProductIterator;
typedef BRepGraph_Iterator<BRepGraphInc::ShellDef, true> BRepGraph_FullShellIterator;
typedef BRepGraph_Iterator<BRepGraphInc::SolidDef, true> BRepGraph_FullSolidIterator;
typedef BRepGraph_Iterator<BRepGraphInc::VertexDef, true> BRepGraph_FullVertexIterator;
typedef BRepGraph_Iterator<BRepGraphInc::WireDef, true> BRepGraph_FullWireIterator;
typedef BRepGraph_Iterator<BRepGraphInc::OccurrenceDef> BRepGraph_OccurrenceIterator;
typedef BRepGraph_Iterator<BRepGraphInc::ProductDef> BRepGraph_ProductIterator;
typedef BRepGraph_RefsIterator::RefsVertexOfEdge BRepGraph_RefsVertexOfEdge;
typedef BRepGraph_Iterator<BRepGraphInc::ShellDef> BRepGraph_ShellIterator;
typedef BRepGraph_Iterator<BRepGraphInc::SolidDef> BRepGraph_SolidIterator;
typedef BRepGraph_Iterator<BRepGraphInc::VertexDef> BRepGraph_VertexIterator;
typedef BRepGraph_Iterator<BRepGraphInc::WireDef> BRepGraph_WireIterator;
/* end typedefs declaration */

/******************
* class BRepGraph *
******************/
%rename(brepgraph) BRepGraph;
class BRepGraph {
	public:
		/****** BRepGraph::BRepGraph ******/
		/****** md5 signature: 5294632abc80a096b95b563b39c46af6 ******/
		%feature("compactdefaultargs") BRepGraph;
		%feature("autodoc", "Return
-------
None

Description
-----------
Default constructor. Creates an empty graph with default allocator.
") BRepGraph;
		 BRepGraph();

		/****** BRepGraph::Allocator ******/
		/****** md5 signature: 16ec5fa9c8407823fdb0339c9f1d453e ******/
		%feature("compactdefaultargs") Allocator;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_BaseAllocator>

Description
-----------
Return the current allocator.
") Allocator;
		const opencascade::handle<NCollection_BaseAllocator> & Allocator();

		/****** BRepGraph::CacheRegistry ******/
		/****** md5 signature: 011b51df99b0a51e4efe74c9982c805f ******/
		%feature("compactdefaultargs") CacheRegistry;
		%feature("autodoc", "Return
-------
BRepGraph_CacheRegistry

Description
-----------
Access registered graph cache services. 
Return: cache registry for managing typed transient cache services.
") CacheRegistry;
		BRepGraph_CacheRegistry & CacheRegistry();

		/****** BRepGraph::CacheRegistry ******/
		/****** md5 signature: 2eaaccd6f00454434636886f43c07fcb ******/
		%feature("compactdefaultargs") CacheRegistry;
		%feature("autodoc", "Return
-------
BRepGraph_CacheRegistry

Description
-----------
Access registered graph cache services (const). 
Return: cache registry for managing typed transient cache services.
") CacheRegistry;
		const BRepGraph_CacheRegistry & CacheRegistry();

		/****** BRepGraph::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reset the graph to an empty state. Increments generation and regenerates the graph GUID.
") Clear;
		void Clear();

		/****** BRepGraph::Editor ******/
		/****** md5 signature: 50db99220d7992703437cd2224cc199f ******/
		%feature("compactdefaultargs") Editor;
		%feature("autodoc", "Return
-------
BRepGraph_EditorView

Description
-----------
Access programmatic graph construction and mutation.
") Editor;
		BRepGraph_EditorView & Editor();

		/****** BRepGraph::Editor ******/
		/****** md5 signature: 884ac1c407a72c13028b6a598a239f0f ******/
		%feature("compactdefaultargs") Editor;
		%feature("autodoc", "Return
-------
BRepGraph_EditorView

Description
-----------
Const access to editor-specific state queries. Exposes IsDeferredMode() and ValidateMutationBoundary() on a const graph. All structural mutation methods require the non-const Editor() overload.
") Editor;
		const BRepGraph_EditorView & Editor();

		/****** BRepGraph::IsEmpty ******/
		/****** md5 signature: 03c43b1186186edcd7d757f16ac1f505 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true when the graph contains no topology definitions.
") IsEmpty;
		bool IsEmpty();

		/****** BRepGraph::IsNull ******/
		/****** md5 signature: 370fd86ee2c01f99c6467d71c10dec0c ******/
		%feature("compactdefaultargs") IsNull;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true when this wrapper does not reference graph data.
") IsNull;
		bool IsNull();

		/****** BRepGraph::IsValid ******/
		/****** md5 signature: b72c8c0a5ae7006f707e3300ce93be11 ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true when this wrapper references graph data.
") IsValid;
		bool IsValid();

		/****** BRepGraph::LayerRegistry ******/
		/****** md5 signature: 8b9cce2a7d93157a478c73c73917362a ******/
		%feature("compactdefaultargs") LayerRegistry;
		%feature("autodoc", "Return
-------
BRepGraph_LayerRegistry

Description
-----------
Access registered graph layers. 
Return: layer registry for managing attribute layers.
") LayerRegistry;
		BRepGraph_LayerRegistry & LayerRegistry();

		/****** BRepGraph::LayerRegistry ******/
		/****** md5 signature: 8daa42851eeb8c680fc938eee97fcd12 ******/
		%feature("compactdefaultargs") LayerRegistry;
		%feature("autodoc", "Return
-------
BRepGraph_LayerRegistry

Description
-----------
Access registered graph layers (const). 
Return: layer registry for managing attribute layers.
") LayerRegistry;
		const BRepGraph_LayerRegistry & LayerRegistry();

		/****** BRepGraph::Mesh ******/
		/****** md5 signature: f76c2cd8c228be0eccb42d560c674156 ******/
		%feature("compactdefaultargs") Mesh;
		%feature("autodoc", "Return
-------
BRepGraph_MeshView

Description
-----------
Access mesh data with explicit Cache()/Persistent() sub-views and Editor() for cache mutations. Persistent rep creation lives on Editor().Edges(), Editor().CoEdges(), Editor().Faces() (since reps back the topology defs). 
Return: read-only mesh view.
") Mesh;
		const BRepGraph_MeshView & Mesh();

		/****** BRepGraph::Mesh ******/
		/****** md5 signature: db8fcd4344294b8dbd63e5df80011a3c ******/
		%feature("compactdefaultargs") Mesh;
		%feature("autodoc", "Return
-------
BRepGraph_MeshView

Description
-----------
Non-const access to mesh view (required to call Editor() sub-view for cache mutations). 
Return: mutable mesh view.
") Mesh;
		BRepGraph_MeshView & Mesh();

		/****** BRepGraph::Refs ******/
		/****** md5 signature: fc7c248b33353e981eec6816b75e32ed ******/
		%feature("compactdefaultargs") Refs;
		%feature("autodoc", "Return
-------
BRepGraph_RefsView

Description
-----------
Access reference entries and their UIDs.
") Refs;
		const BRepGraph_RefsView & Refs();

		/****** BRepGraph::RootProductIds ******/
		/****** md5 signature: 308af27805bb4b7b039fcb63bbb41fa0 ******/
		%feature("compactdefaultargs") RootProductIds;
		%feature("autodoc", "Return
-------
NCollection_LinearVector<BRepGraph_ProductId>

Description
-----------
Return root product identifiers (products not referenced by any active occurrence). Maintained incrementally by Editor/EditorView mutations. Returns empty vector if the graph has not been built.
") RootProductIds;
		const NCollection_LinearVector<BRepGraph_ProductId> & RootProductIds();

		/****** BRepGraph::Shapes ******/
		/****** md5 signature: fe943296c359ca0edb823474ec717ef6 ******/
		%feature("compactdefaultargs") Shapes;
		%feature("autodoc", "Return
-------
BRepGraph_ShapesView

Description
-----------
Access cached and fresh shape reconstruction.
") Shapes;
		BRepGraph_ShapesView & Shapes();

		/****** BRepGraph::Shapes ******/
		/****** md5 signature: 9af81490df04224cee558bf00445fe45 ******/
		%feature("compactdefaultargs") Shapes;
		%feature("autodoc", "Return
-------
BRepGraph_ShapesView

Description
-----------
Access shape ingestion, cached shape reconstruction and fresh shape reconstruction.
") Shapes;
		const BRepGraph_ShapesView & Shapes();

		/****** BRepGraph::Topo ******/
		/****** md5 signature: 5203ac42f657d5abaa5af2695a36e79a ******/
		%feature("compactdefaultargs") Topo;
		%feature("autodoc", "Return
-------
BRepGraph_TopoView

Description
-----------
Access topology definitions, representation access, adjacency queries, raw Product/Occurrence definition storage, and assembly classification.
") Topo;
		const BRepGraph_TopoView & Topo();

		/****** BRepGraph::UIDs ******/
		/****** md5 signature: 4ce09f545b0ba98491d7ec42f1766f1a ******/
		%feature("compactdefaultargs") UIDs;
		%feature("autodoc", "Return
-------
BRepGraph_UIDsView

Description
-----------
Access unique identifiers.
") UIDs;
		const BRepGraph_UIDsView & UIDs();

		/****** BRepGraph::ValidateRelations ******/
		/****** md5 signature: c6dbcfab7c7d1f1bd64bb9a144b68692 ******/
		%feature("compactdefaultargs") ValidateRelations;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Verify relation consistency against entity / reference-entry tables. Intended for debug builds and regression tests of incremental mutation paths. 
Return: true when every stored relation matches its endpoints.
") ValidateRelations;
		bool ValidateRelations();

};


%extend BRepGraph {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class BRepGraph_Cache *
************************/
%nodefaultctor BRepGraph_Cache;
class BRepGraph_Cache : public Standard_Transient {
	public:
		/****** BRepGraph_Cache::Clear ******/
		/****** md5 signature: e00f9fe269a9dd9a3c0be43461191431 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clear all transient data owned by this cache.
") Clear;
		virtual void Clear();

		/****** BRepGraph_Cache::CopyFreshTo ******/
		/****** md5 signature: dfcb995833997fb29eef235e75d60a68 ******/
		%feature("compactdefaultargs") CopyFreshTo;
		%feature("autodoc", "
Parameters
----------
theCopy: BRepGraph_CopyRemap

Return
-------
None

Description
-----------
Copy fresh, remappable cache data into the target graph described by the remap. Default implementation copies nothing.
") CopyFreshTo;
		virtual void CopyFreshTo(const BRepGraph_CopyRemap & theCopy);

		/****** BRepGraph_Cache::ID ******/
		/****** md5 signature: e94b659c9e9f7b7f43797fc28e2b97f9 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Cache service identity, unique within a graph registry.
") ID;
		virtual const Standard_GUID & ID();

		/****** BRepGraph_Cache::Name ******/
		/****** md5 signature: 5fd48d13d17a8de0cb1f2b03a41c32b1 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Cache service display name.
") Name;
		virtual const TCollection_AsciiString & Name();

};


%make_alias(BRepGraph_Cache)

%extend BRepGraph_Cache {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class BRepGraph_CacheIterator *
********************************/
class BRepGraph_CacheIterator {
	public:
		/****** BRepGraph_CacheIterator::BRepGraph_CacheIterator ******/
		/****** md5 signature: e70a266328868f11728a41e61d4f541c ******/
		%feature("compactdefaultargs") BRepGraph_CacheIterator;
		%feature("autodoc", "
Parameters
----------
theRegistry: BRepGraph_CacheRegistry

Return
-------
None

Description
-----------
Construct an iterator over all cache families in the registry.
") BRepGraph_CacheIterator;
		 BRepGraph_CacheIterator(const BRepGraph_CacheRegistry & theRegistry);

		/****** BRepGraph_CacheIterator::More ******/
		/****** md5 signature: 0a7b505ff53e438121f2c208f8ae7ce8 ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if the iterator has a current element.
") More;
		bool More();

		/****** BRepGraph_CacheIterator::NbCaches ******/
		/****** md5 signature: c2e13617f9e06b9e1f436ae555d8c1e6 ******/
		%feature("compactdefaultargs") NbCaches;
		%feature("autodoc", "Return
-------
uint32_t

Description
-----------
Number of cache families in the registry.
") NbCaches;
		uint32_t NbCaches();

		/****** BRepGraph_CacheIterator::Next ******/
		/****** md5 signature: 1201a55f750036045cd397a65f07fc7d ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
Advance to the next cache family.
") Next;
		void Next();

		/****** BRepGraph_CacheIterator::Slot ******/
		/****** md5 signature: 873f9fbb83797a87e273432c9d9916f1 ******/
		%feature("compactdefaultargs") Slot;
		%feature("autodoc", "Return
-------
uint32_t

Description
-----------
Return the current slot index in the registry.
") Slot;
		uint32_t Slot();

		/****** BRepGraph_CacheIterator::Value ******/
		/****** md5 signature: 750b598431e8c1da789168c7b5342635 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<BRepGraph_Cache>

Description
-----------
Return the current cache family descriptor.
") Value;
		opencascade::handle<BRepGraph_Cache> Value();

		/****** BRepGraph_CacheIterator::begin ******/
		/****** md5 signature: 4c1131f0e8880c618d9d093cdbc203f6 ******/
		%feature("compactdefaultargs") begin;
		%feature("autodoc", "Return
-------
NCollection_ForwardRangeIterator<BRepGraph_CacheIterator >

Description
-----------
STL range-for support.
") begin;
		NCollection_ForwardRangeIterator<BRepGraph_CacheIterator > begin();

		/****** BRepGraph_CacheIterator::end ******/
		/****** md5 signature: 4edef9faa595e2b9527109cc32e6ec32 ******/
		%feature("compactdefaultargs") end;
		%feature("autodoc", "Return
-------
NCollection_ForwardRangeSentinel

Description
-----------
Sentinel marking end of iteration.
") end;
		NCollection_ForwardRangeSentinel end();

};


%extend BRepGraph_CacheIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class BRepGraph_CacheMesh_CoEdgeMeshEntry *
********************************************/
/*************************************
* class BRepGraph_CacheMesh_DirtySet *
*************************************/
/***********************************
* class BRepGraph_CacheMesh_Driver *
***********************************/
/******************************************
* class BRepGraph_CacheMesh_EdgeMeshEntry *
******************************************/
/***************************************
* class BRepGraph_CacheMesh_EntryStamp *
***************************************/
/******************************************
* class BRepGraph_CacheMesh_FaceMeshEntry *
******************************************/
/**************************************
* class BRepGraph_CacheMesh_SlotState *
**************************************/
/********************************
* class BRepGraph_CacheRegistry *
********************************/
class BRepGraph_CacheRegistry {
	public:
		/****** BRepGraph_CacheRegistry::BRepGraph_CacheRegistry ******/
		/****** md5 signature: 1e3385b6270cbb6933387697bcf843d2 ******/
		%feature("compactdefaultargs") BRepGraph_CacheRegistry;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepGraph_CacheRegistry;
		 BRepGraph_CacheRegistry();

		/****** BRepGraph_CacheRegistry::Cache ******/
		/****** md5 signature: 5d805908b37dba169931cb99d65e1065 ******/
		%feature("compactdefaultargs") Cache;
		%feature("autodoc", "
Parameters
----------
theSlot: uint32_t

Return
-------
opencascade::handle<BRepGraph_Cache>

Description
-----------
Return cache service by graph-local slot, or null handle if the slot is out of range. 
Input parameter: theSlot graph-local cache slot.
") Cache;
		opencascade::handle<BRepGraph_Cache> Cache(uint32_t theSlot);

		/****** BRepGraph_CacheRegistry::CacheIter ******/
		/****** md5 signature: 4809aa1d63888c48ecd213fbdd682cf3 ******/
		%feature("compactdefaultargs") CacheIter;
		%feature("autodoc", "Return
-------
BRepGraph_CacheIterator

Description
-----------
Iterate registered cache services.
") CacheIter;
		BRepGraph_CacheIterator CacheIter();

		/****** BRepGraph_CacheRegistry::Clear ******/
		/****** md5 signature: 949606ffd2e0c7658c523174852fdfdf ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Unregister all cache services.
") Clear;
		void Clear();

		/****** BRepGraph_CacheRegistry::ClearAll ******/
		/****** md5 signature: fad2d413f5353ec6395d85f6b0ec87a2 ******/
		%feature("compactdefaultargs") ClearAll;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clear data in all registered cache services.
") ClearAll;
		void ClearAll();

		/****** BRepGraph_CacheRegistry::CopyFreshCachesTo ******/
		/****** md5 signature: 996b760e7dc1c107b94ecc8f6d6c7ab0 ******/
		%feature("compactdefaultargs") CopyFreshCachesTo;
		%feature("autodoc", "
Parameters
----------
theTargetGraph: BRepGraph
theItemRemap: NCollection_FlatDataMap<BRepGraph_ItemId, BRepGraph_ItemId>
theMode: BRepGraph_CopyRemap::Mode

Return
-------
None

Description
-----------
Ask registered cache services to copy fresh, remappable data into the target graph.
") CopyFreshCachesTo;
		void CopyFreshCachesTo(BRepGraph & theTargetGraph, const NCollection_FlatDataMap<BRepGraph_ItemId, BRepGraph_ItemId> & theItemRemap, const BRepGraph_CopyRemap::Mode theMode);

		/****** BRepGraph_CacheRegistry::CopyFreshCachesTo ******/
		/****** md5 signature: 6c8f698af34bc0392206963be4591130 ******/
		%feature("compactdefaultargs") CopyFreshCachesTo;
		%feature("autodoc", "
Parameters
----------
theTargetGraph: BRepGraph
theMappingKind: BRepGraph_CopyRemap::MappingKind
theMode: BRepGraph_CopyRemap::Mode

Return
-------
None

Description
-----------
Ask registered cache services to copy fresh data using identity mapping.
") CopyFreshCachesTo;
		void CopyFreshCachesTo(BRepGraph & theTargetGraph, BRepGraph_CopyRemap::MappingKind theMappingKind, BRepGraph_CopyRemap::Mode theMode);

		/****** BRepGraph_CacheRegistry::FindCache ******/
		/****** md5 signature: d0209d15ab2859fde0e70dc81743bcc4 ******/
		%feature("compactdefaultargs") FindCache;
		%feature("autodoc", "
Parameters
----------
theGUID: Standard_GUID

Return
-------
opencascade::handle<BRepGraph_Cache>

Description
-----------
Find a cache service by GUID. 
Input parameter: theGUID cache identity 
Return: cache service, or null handle if not found.
") FindCache;
		opencascade::handle<BRepGraph_Cache> FindCache(const Standard_GUID & theGUID);

		/****** BRepGraph_CacheRegistry::FindSlot ******/
		/****** md5 signature: 841c1a945ab83fe22a22fa37f373d1c4 ******/
		%feature("compactdefaultargs") FindSlot;
		%feature("autodoc", "
Parameters
----------
theGUID: Standard_GUID
theSlot: uint32_t

Return
-------
bool

Description
-----------
Return current graph-local slot for a GUID. 
Input parameter: theGUID cache family identity @param[out] theSlot graph-local slot index 
Return: true if the cache service is registered.
") FindSlot;
		bool FindSlot(const Standard_GUID & theGUID, uint32_t & theSlot);

		/****** BRepGraph_CacheRegistry::FindSlot ******/
		/****** md5 signature: f66ecf7e4b8434b986967e59d164552d ******/
		%feature("compactdefaultargs") FindSlot;
		%feature("autodoc", "
Parameters
----------
theCache: BRepGraph_Cache
theSlot: uint32_t

Return
-------
bool

Description
-----------
Return current graph-local slot for a cache service. 
Input parameter: theCache cache service @param[out] theSlot graph-local slot index 
Return: true if the cache service is registered.
") FindSlot;
		bool FindSlot(const opencascade::handle<BRepGraph_Cache> & theCache, uint32_t & theSlot);

		/****** BRepGraph_CacheRegistry::NbCaches ******/
		/****** md5 signature: c2e13617f9e06b9e1f436ae555d8c1e6 ******/
		%feature("compactdefaultargs") NbCaches;
		%feature("autodoc", "Return
-------
uint32_t

Description
-----------
Number of registered cache services.
") NbCaches;
		uint32_t NbCaches();

		/****** BRepGraph_CacheRegistry::Register ******/
		/****** md5 signature: d9634dcd44ab54c4c39204c3ae10edb9 ******/
		%feature("compactdefaultargs") Register;
		%feature("autodoc", "
Parameters
----------
theCache: BRepGraph_Cache

Return
-------
uint32_t

Description
-----------
Register a cache service. Short form used by graph-local cache operations. 
Input parameter: theCache cache service 
Return: graph-local slot index.
") Register;
		uint32_t Register(const opencascade::handle<BRepGraph_Cache> & theCache);

		/****** BRepGraph_CacheRegistry::RegisterCache ******/
		/****** md5 signature: 34895d7392adf6c41a6d373f6bead744 ******/
		%feature("compactdefaultargs") RegisterCache;
		%feature("autodoc", "
Parameters
----------
theCache: BRepGraph_Cache

Return
-------
uint32_t

Description
-----------
Register a cache service. Replaces an existing cache with the same GUID. 
Input parameter: theCache cache service 
Return: graph-local slot index.
") RegisterCache;
		uint32_t RegisterCache(const opencascade::handle<BRepGraph_Cache> & theCache);

		/****** BRepGraph_CacheRegistry::UnregisterCache ******/
		/****** md5 signature: 04686456ac3411267dc745b59cb0ac80 ******/
		%feature("compactdefaultargs") UnregisterCache;
		%feature("autodoc", "
Parameters
----------
theGUID: Standard_GUID

Return
-------
None

Description
-----------
Remove a cache service by GUID. 
Input parameter: theGUID cache identity.
") UnregisterCache;
		void UnregisterCache(const Standard_GUID & theGUID);

};


%extend BRepGraph_CacheRegistry {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class BRepGraph_ChildExplorer *
********************************/
class BRepGraph_ChildExplorer {
	public:
/* public enums */
enum class LinkKind {
	None = 0,
	Reference = 1,
	Structural = 2,
};

enum class TraversalMode {
	Recursive = 0,
	DirectChildren = 1,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class LinkKind(IntEnum):
	None_ = 0
	Reference = 1
	Structural = 2
None_ = LinkKind.None_
Reference = LinkKind.Reference
Structural = LinkKind.Structural

class TraversalMode(IntEnum):
	Recursive = 0
	DirectChildren = 1
Recursive = TraversalMode.Recursive
DirectChildren = TraversalMode.DirectChildren
};
/* end python proxy for enums */

		/****** BRepGraph_ChildExplorer::BRepGraph_ChildExplorer ******/
		/****** md5 signature: 74414fdb28d742353e2d31f6cc85f588 ******/
		%feature("compactdefaultargs") BRepGraph_ChildExplorer;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theRoot: BRepGraph_NodeId
theConfig: BRepGraph_ChildExplorer_Config

Return
-------
None

Description
-----------
Preferred long-term constructor: all tuning knobs in `Config`. 
Input parameter: theGraph graph to walk 
Input parameter: theRoot root node where the walk begins 
Input parameter: theConfig traversal configuration (mode, target kind, avoid kind, etc.).
") BRepGraph_ChildExplorer;
		 BRepGraph_ChildExplorer(const BRepGraph & theGraph, const BRepGraph_NodeId theRoot, BRepGraph_ChildExplorer_Config theConfig);

		/****** BRepGraph_ChildExplorer::BRepGraph_ChildExplorer ******/
		/****** md5 signature: 63203dcce3a133dc1bd40b53232b5710 ******/
		%feature("compactdefaultargs") BRepGraph_ChildExplorer;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theRoot: BRepGraph_NodeId

Return
-------
None

Description
-----------
Explore all descendants of the root node using recursive traversal. 
Input parameter: theGraph graph to walk 
Input parameter: theRoot root node where the walk begins.
") BRepGraph_ChildExplorer;
		 BRepGraph_ChildExplorer(const BRepGraph & theGraph, const BRepGraph_NodeId theRoot);

		/****** BRepGraph_ChildExplorer::BRepGraph_ChildExplorer ******/
		/****** md5 signature: 7cd386efdfaaf773605e3915e555b26b ******/
		%feature("compactdefaultargs") BRepGraph_ChildExplorer;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theRoot: BRepGraph_NodeId
theMode: TraversalMode

Return
-------
None

Description
-----------
Explore descendants of the root node using the given traversal mode. 
Input parameter: theGraph graph to walk 
Input parameter: theRoot root node where the walk begins 
Input parameter: theMode traversal strategy (recursive or direct children).
") BRepGraph_ChildExplorer;
		 BRepGraph_ChildExplorer(const BRepGraph & theGraph, const BRepGraph_NodeId theRoot, TraversalMode theMode);

		/****** BRepGraph_ChildExplorer::BRepGraph_ChildExplorer ******/
		/****** md5 signature: 64f52c572a64099237c68eb8cc320577 ******/
		%feature("compactdefaultargs") BRepGraph_ChildExplorer;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theRoot: BRepGraph_NodeId
theAvoidKind: std::optional<BRepGraph_NodeId::Kind>
theEmitAvoidKind: bool
theMode: TraversalMode (optional, default to TraversalMode::Recursive)

Return
-------
None

Description
-----------
Explore descendants while pruning branches at the avoid kind. 
Input parameter: theGraph graph to walk 
Input parameter: theRoot root node where the walk begins 
Input parameter: theAvoidKind node kind to avoid descending into 
Input parameter: theEmitAvoidKind if true, emit matching avoid-kind nodes once before skipping 
Input parameter: theMode traversal strategy.
") BRepGraph_ChildExplorer;
		 BRepGraph_ChildExplorer(const BRepGraph & theGraph, const BRepGraph_NodeId theRoot, const std::optional<BRepGraph_NodeId::Kind> & theAvoidKind, bool theEmitAvoidKind, TraversalMode theMode = TraversalMode::Recursive);

		/****** BRepGraph_ChildExplorer::BRepGraph_ChildExplorer ******/
		/****** md5 signature: 17e1b072bcab571345ffb2c099c14963 ******/
		%feature("compactdefaultargs") BRepGraph_ChildExplorer;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theRoot: BRepGraph_NodeId
theTargetKind: BRepGraph_NodeId::Kind

Return
-------
None

Description
-----------
Explore only descendants of the given target kind. 
Input parameter: theGraph graph to walk 
Input parameter: theRoot root node where the walk begins 
Input parameter: theTargetKind kind of nodes to emit.
") BRepGraph_ChildExplorer;
		 BRepGraph_ChildExplorer(const BRepGraph & theGraph, const BRepGraph_NodeId theRoot, BRepGraph_NodeId::Kind theTargetKind);

		/****** BRepGraph_ChildExplorer::BRepGraph_ChildExplorer ******/
		/****** md5 signature: 6fd69cbcf5b7ccaca77cb53cf36e587c ******/
		%feature("compactdefaultargs") BRepGraph_ChildExplorer;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theRoot: BRepGraph_NodeId
theTargetKind: BRepGraph_NodeId::Kind
theMode: TraversalMode

Return
-------
None

Description
-----------
Explore only descendants of the given target kind using the given traversal mode. 
Input parameter: theGraph graph to walk 
Input parameter: theRoot root node where the walk begins 
Input parameter: theTargetKind kind of nodes to emit 
Input parameter: theMode traversal strategy.
") BRepGraph_ChildExplorer;
		 BRepGraph_ChildExplorer(const BRepGraph & theGraph, const BRepGraph_NodeId theRoot, BRepGraph_NodeId::Kind theTargetKind, TraversalMode theMode);

		/****** BRepGraph_ChildExplorer::BRepGraph_ChildExplorer ******/
		/****** md5 signature: 24f98e16b1bdee55d999ba3c937e7bf7 ******/
		%feature("compactdefaultargs") BRepGraph_ChildExplorer;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theRoot: BRepGraph_NodeId
theTargetKind: BRepGraph_NodeId::Kind
theAvoidKind: std::optional<BRepGraph_NodeId::Kind>
theEmitAvoidKind: bool
theMode: TraversalMode (optional, default to TraversalMode::Recursive)

Return
-------
None

Description
-----------
Explore descendants of the given target kind while pruning branches at the avoid kind. 
Input parameter: theGraph graph to walk 
Input parameter: theRoot root node where the walk begins 
Input parameter: theTargetKind kind of nodes to emit 
Input parameter: theAvoidKind node kind to avoid descending into 
Input parameter: theEmitAvoidKind if true, emit matching avoid-kind nodes once before skipping 
Input parameter: theMode traversal strategy.
") BRepGraph_ChildExplorer;
		 BRepGraph_ChildExplorer(const BRepGraph & theGraph, const BRepGraph_NodeId theRoot, BRepGraph_NodeId::Kind theTargetKind, const std::optional<BRepGraph_NodeId::Kind> & theAvoidKind, bool theEmitAvoidKind, TraversalMode theMode = TraversalMode::Recursive);

		/****** BRepGraph_ChildExplorer::BRepGraph_ChildExplorer ******/
		/****** md5 signature: 1de199962a2b648f29f04f2bfb1a01a1 ******/
		%feature("compactdefaultargs") BRepGraph_ChildExplorer;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theProduct: BRepGraph_ProductId
theTargetKind: BRepGraph_NodeId::Kind

Return
-------
None

Description
-----------
Explore only descendants of the given target kind starting from a product. 
Input parameter: theGraph graph to walk 
Input parameter: theProduct product whose occurrences and topology are explored 
Input parameter: theTargetKind kind of nodes to emit.
") BRepGraph_ChildExplorer;
		 BRepGraph_ChildExplorer(const BRepGraph & theGraph, const BRepGraph_ProductId theProduct, BRepGraph_NodeId::Kind theTargetKind);

		/****** BRepGraph_ChildExplorer::BRepGraph_ChildExplorer ******/
		/****** md5 signature: 6d8426b9478b93e1210b2d1f6e14245e ******/
		%feature("compactdefaultargs") BRepGraph_ChildExplorer;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theProduct: BRepGraph_ProductId
theTargetKind: BRepGraph_NodeId::Kind
theMode: TraversalMode

Return
-------
None

Description
-----------
Explore only descendants of the given target kind starting from a product, using the given traversal mode. 
Input parameter: theGraph graph to walk 
Input parameter: theProduct product whose occurrences and topology are explored 
Input parameter: theTargetKind kind of nodes to emit 
Input parameter: theMode traversal strategy.
") BRepGraph_ChildExplorer;
		 BRepGraph_ChildExplorer(const BRepGraph & theGraph, const BRepGraph_ProductId theProduct, BRepGraph_NodeId::Kind theTargetKind, TraversalMode theMode);

		/****** BRepGraph_ChildExplorer::BRepGraph_ChildExplorer ******/
		/****** md5 signature: f786394ae68c9da7a362d938a3f97c0b ******/
		%feature("compactdefaultargs") BRepGraph_ChildExplorer;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theRoot: BRepGraph_NodeId
theTargetKind: BRepGraph_NodeId::Kind
theCumLoc: bool
theCumOri: bool
theMode: TraversalMode (optional, default to TraversalMode::Recursive)

Return
-------
None

Description
-----------
Explore only descendants of the given target kind with explicit location/orientation control. 
Input parameter: theGraph graph to walk 
Input parameter: theRoot root node where the walk begins 
Input parameter: theTargetKind kind of nodes to emit 
Input parameter: theCumLoc if true, accumulate location down the walk 
Input parameter: theCumOri if true, accumulate orientation down the walk 
Input parameter: theMode traversal strategy.
") BRepGraph_ChildExplorer;
		 BRepGraph_ChildExplorer(const BRepGraph & theGraph, const BRepGraph_NodeId theRoot, BRepGraph_NodeId::Kind theTargetKind, bool theCumLoc, bool theCumOri, TraversalMode theMode = TraversalMode::Recursive);

		/****** BRepGraph_ChildExplorer::BRepGraph_ChildExplorer ******/
		/****** md5 signature: 64bf7e0206ea2216f58329494d31cb47 ******/
		%feature("compactdefaultargs") BRepGraph_ChildExplorer;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theProduct: BRepGraph_ProductId
theTargetKind: BRepGraph_NodeId::Kind
theCumLoc: bool
theCumOri: bool
theMode: TraversalMode (optional, default to TraversalMode::Recursive)

Return
-------
None

Description
-----------
Explore only descendants of the given target kind starting from a product, with explicit location/orientation control. 
Input parameter: theGraph graph to walk 
Input parameter: theProduct product whose occurrences and topology are explored 
Input parameter: theTargetKind kind of nodes to emit 
Input parameter: theCumLoc if true, accumulate location down the walk 
Input parameter: theCumOri if true, accumulate orientation down the walk 
Input parameter: theMode traversal strategy.
") BRepGraph_ChildExplorer;
		 BRepGraph_ChildExplorer(const BRepGraph & theGraph, const BRepGraph_ProductId theProduct, BRepGraph_NodeId::Kind theTargetKind, bool theCumLoc, bool theCumOri, TraversalMode theMode = TraversalMode::Recursive);

		/****** BRepGraph_ChildExplorer::BRepGraph_ChildExplorer ******/
		/****** md5 signature: a395ee28f6dbef1fd53f5f0f940bd09a ******/
		%feature("compactdefaultargs") BRepGraph_ChildExplorer;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theRoot: BRepGraph_NodeId
theTargetKind: BRepGraph_NodeId::Kind
theStartLoc: TopLoc_Location
theStartOri: TopAbs_Orientation
theMode: TraversalMode (optional, default to TraversalMode::DirectChildren)

Return
-------
None

Description
-----------
Explore only descendants of the given target kind with an explicit initial transform. 
Input parameter: theGraph graph to walk 
Input parameter: theRoot root node where the walk begins 
Input parameter: theTargetKind kind of nodes to emit 
Input parameter: theStartLoc initial accumulated location 
Input parameter: theStartOri initial accumulated orientation 
Input parameter: theMode traversal strategy.
") BRepGraph_ChildExplorer;
		 BRepGraph_ChildExplorer(const BRepGraph & theGraph, const BRepGraph_NodeId theRoot, BRepGraph_NodeId::Kind theTargetKind, const TopLoc_Location & theStartLoc, TopAbs_Orientation theStartOri, TraversalMode theMode = TraversalMode::DirectChildren);

		/****** BRepGraph_ChildExplorer::Current ******/
		/****** md5 signature: 82e23e0bb00d40826e239467ede4a6af ******/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "Return
-------
BRepGraphInc::NodeInstance

Description
-----------
Current matching descendant node with accumulated location and orientation.
") Current;
		BRepGraphInc::NodeInstance Current();

		/****** BRepGraph_ChildExplorer::CurrentLinkKind ******/
		/****** md5 signature: 6e64e5844ac211e45d10eea0279c29d8 ******/
		%feature("compactdefaultargs") CurrentLinkKind;
		%feature("autodoc", "Return
-------
BRepGraph_ChildExplorer::LinkKind

Description
-----------
Returns how Current() is linked from CurrentParent().
") CurrentLinkKind;
		BRepGraph_ChildExplorer::LinkKind CurrentLinkKind();

		/****** BRepGraph_ChildExplorer::CurrentParent ******/
		/****** md5 signature: 44ed135d624302be6be88f4c27441057 ******/
		%feature("compactdefaultargs") CurrentParent;
		%feature("autodoc", "Return
-------
BRepGraph_NodeId

Description
-----------
Returns the immediate parent of Current() in the explored path. Returns invalid NodeId when Current() is the root/self match.
") CurrentParent;
		BRepGraph_NodeId CurrentParent();

		/****** BRepGraph_ChildExplorer::CurrentRef ******/
		/****** md5 signature: 2da38ffd2d61464229ac29ede4921e7c ******/
		%feature("compactdefaultargs") CurrentRef;
		%feature("autodoc", "Return
-------
BRepGraph_RefId

Description
-----------
Returns the exact parent-owned RefId for Current(), when the current step is represented by a reference entry. Returns invalid RefId for structural links without a dedicated ref entry such as CoEdge->Edge, Occurrence->Product/topology-root.
") CurrentRef;
		BRepGraph_RefId CurrentRef();

		/****** BRepGraph_ChildExplorer::CurrentUsagePath ******/
		/****** md5 signature: 354024a50b93a20e6c83a113037d0c7f ******/
		%feature("compactdefaultargs") CurrentUsagePath;
		%feature("autodoc", "Return
-------
BRepGraph_UsagePath

Description
-----------
Returns the explicit concrete traversal path from the explorer root to Current().
") CurrentUsagePath;
		BRepGraph_UsagePath CurrentUsagePath();

		/****** BRepGraph_ChildExplorer::Depth ******/
		/****** md5 signature: 1618c972d9c03bf6d2fefff40c6834de ******/
		%feature("compactdefaultargs") Depth;
		%feature("autodoc", "Return
-------
int

Description
-----------
Number of valid ancestor frames currently on the stack (excluding the sentinel below the root). O(1); avoids the O(depth^2) NodeAt(i) walk used to compute container priority in selection-mode building.
") Depth;
		int Depth();

		/****** BRepGraph_ChildExplorer::GetConfig ******/
		/****** md5 signature: 4fd244f59b28336c2db6aa049f5f1c3e ******/
		%feature("compactdefaultargs") GetConfig;
		%feature("autodoc", "Return
-------
BRepGraph_ChildExplorer_Config

Description
-----------
Returns the traversal configuration this explorer was constructed with. Read-only - configuration is fixed for the lifetime of the explorer.
") GetConfig;
		const BRepGraph_ChildExplorer_Config & GetConfig();

		/****** BRepGraph_ChildExplorer::LocationAt ******/
		/****** md5 signature: 73f5c3cd93c30010f0ffdbd5ee775b64 ******/
		%feature("compactdefaultargs") LocationAt;
		%feature("autodoc", "
Parameters
----------
theLevel: int

Return
-------
TopLoc_Location

Description
-----------
Returns the accumulated location at the given stack level. 
Input parameter: theLevel zero-based stack depth (0 = root) 
Return: accumulated location at the specified level.
") LocationAt;
		TopLoc_Location LocationAt(const int theLevel);

		/****** BRepGraph_ChildExplorer::LocationOf ******/
		/****** md5 signature: 3fa2137f1c02e1b6eb5fc01baac21919 ******/
		%feature("compactdefaultargs") LocationOf;
		%feature("autodoc", "
Parameters
----------
theKind: BRepGraph_NodeId::Kind

Return
-------
TopLoc_Location

Description
-----------
Returns the accumulated location at the most recent ancestor of the given kind. 
Input parameter: theKind node kind to search for in the ancestor chain 
Return: accumulated location at the matching ancestor.
") LocationOf;
		TopLoc_Location LocationOf(const BRepGraph_NodeId::Kind theKind);

		/****** BRepGraph_ChildExplorer::More ******/
		/****** md5 signature: 0a7b505ff53e438121f2c208f8ae7ce8 ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if another matching descendant is available.
") More;
		bool More();

		/****** BRepGraph_ChildExplorer::Next ******/
		/****** md5 signature: f35c0df5f1d7c877986db18081404532 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
Advance to the next matching descendant.
") Next;
		void Next();

		/****** BRepGraph_ChildExplorer::NodeAt ******/
		/****** md5 signature: cf45ed68cee193590babf8aa34d23848 ******/
		%feature("compactdefaultargs") NodeAt;
		%feature("autodoc", "
Parameters
----------
theLevel: int

Return
-------
BRepGraph_NodeId

Description
-----------
Returns the node id at the given stack level. 
Input parameter: theLevel zero-based stack depth (0 = root) 
Return: node id at the specified level.
") NodeAt;
		BRepGraph_NodeId NodeAt(const int theLevel);

		/****** BRepGraph_ChildExplorer::NodeOf ******/
		/****** md5 signature: c036470ad42fb20ec335bf598a1e8a4d ******/
		%feature("compactdefaultargs") NodeOf;
		%feature("autodoc", "
Parameters
----------
theKind: BRepGraph_NodeId::Kind

Return
-------
BRepGraph_NodeId

Description
-----------
Returns the node id of the most recent ancestor of the given kind. 
Input parameter: theKind node kind to search for in the ancestor chain 
Return: node id of the matching ancestor.
") NodeOf;
		BRepGraph_NodeId NodeOf(const BRepGraph_NodeId::Kind theKind);

		/****** BRepGraph_ChildExplorer::begin ******/
		/****** md5 signature: 48eed9eb53448477beb75c8e4aacb842 ******/
		%feature("compactdefaultargs") begin;
		%feature("autodoc", "Return
-------
NCollection_ForwardRangeIterator<BRepGraph_ChildExplorer >

Description
-----------
Returns an STL-compatible iterator for range-based for loops.
") begin;
		NCollection_ForwardRangeIterator<BRepGraph_ChildExplorer > begin();

		/****** BRepGraph_ChildExplorer::end ******/
		/****** md5 signature: 4edef9faa595e2b9527109cc32e6ec32 ******/
		%feature("compactdefaultargs") end;
		%feature("autodoc", "Return
-------
NCollection_ForwardRangeSentinel

Description
-----------
Returns a sentinel marking the end of iteration.
") end;
		NCollection_ForwardRangeSentinel end();

};


%extend BRepGraph_ChildExplorer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class BRepGraph_ChildExplorer_Config *
***************************************/
class BRepGraph_ChildExplorer_Config {
	public:
		BRepGraph_ChildExplorer::TraversalMode Mode;
		bool EmitAvoidKind;
		bool AccumulateLocation;
		bool AccumulateOrientation;
		TopLoc_Location StartLoc;
		TopAbs_Orientation StartOri;
};


%extend BRepGraph_ChildExplorer_Config {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class BRepGraph_ChildRefId *
*****************************/
class BRepGraph_ChildRefId {
	public:
		uint32_t Index;
		/****** BRepGraph_ChildRefId::BRepGraph_ChildRefId ******/
		/****** md5 signature: 4311b88151facb04e31a8f94c612d63e ******/
		%feature("compactdefaultargs") BRepGraph_ChildRefId;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepGraph_ChildRefId;
		 BRepGraph_ChildRefId();

		/****** BRepGraph_ChildRefId::BRepGraph_ChildRefId ******/
		/****** md5 signature: 718adffe00b7c66230abfc0915fac1a6 ******/
		%feature("compactdefaultargs") BRepGraph_ChildRefId;
		%feature("autodoc", "
Parameters
----------
theIdx: uint32_t

Return
-------
None

Description
-----------
No available documentation.
") BRepGraph_ChildRefId;
		 BRepGraph_ChildRefId(const uint32_t theIdx);

		/****** BRepGraph_ChildRefId::BRepGraph_ChildRefId ******/
		/****** md5 signature: 7e80a924fe12a8fa6b68aba27507a9ea ******/
		%feature("compactdefaultargs") BRepGraph_ChildRefId;
		%feature("autodoc", "
Parameters
----------
theRefId: BRepGraph_RefId

Return
-------
None

Description
-----------
Construct from an untyped reference id of the same kind.
") BRepGraph_ChildRefId;
		 BRepGraph_ChildRefId(const BRepGraph_RefId theRefId);

		/****** BRepGraph_ChildRefId::FromRefId ******/
		/****** md5 signature: 2c83b1a5f2a415c6daf522ac4df93236 ******/
		%feature("compactdefaultargs") FromRefId;
		%feature("autodoc", "
Parameters
----------
theRefId: BRepGraph_RefId

Return
-------
BRepGraph_ChildRefId

Description
-----------
No available documentation.
") FromRefId;
		static BRepGraph_ChildRefId FromRefId(const BRepGraph_RefId theRefId);

		/****** BRepGraph_ChildRefId::Invalid ******/
		/****** md5 signature: 19622d4f1c44c5c7e384ccc5986fb8d8 ******/
		%feature("compactdefaultargs") Invalid;
		%feature("autodoc", "Return
-------
BRepGraph_ChildRefId

Description
-----------
Invalid sentinel id.
") Invalid;
		static BRepGraph_ChildRefId Invalid();

		/****** BRepGraph_ChildRefId::IsOwned ******/
		/****** md5 signature: 82162d9fddf9bcd26161cc7f9c342a8b ******/
		%feature("compactdefaultargs") IsOwned;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph

Return
-------
bool

Description
-----------
Return true if this reference entry has an active owner in the given graph.
") IsOwned;
		bool IsOwned(const BRepGraph & theGraph);

		/****** BRepGraph_ChildRefId::IsRemoved ******/
		/****** md5 signature: 75ed1923a75d2c35c92a9683349c6622 ******/
		%feature("compactdefaultargs") IsRemoved;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph

Return
-------
bool

Description
-----------
Return true if this reference entry has been soft-removed in the given graph.
") IsRemoved;
		bool IsRemoved(const BRepGraph & theGraph);

		/****** BRepGraph_ChildRefId::IsValid ******/
		/****** md5 signature: 735088818cf24ebe0ebc7005a507da69 ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsValid;
		bool IsValid();

		/****** BRepGraph_ChildRefId::IsValid ******/
		/****** md5 signature: 294f20297d740c99df23b64d8041b57c ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "
Parameters
----------
theMaxCount: uint32_t

Return
-------
bool

Description
-----------
True if this id points to an allocated slot within [0, theMaxCount). UINT32_MAX (invalid sentinel) always fails this check for any realistic count.
") IsValid;
		bool IsValid(const uint32_t theMaxCount);

		/****** BRepGraph_ChildRefId::Start ******/
		/****** md5 signature: fc9e9cfb659953f8d767f808052e7c04 ******/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "Return
-------
BRepGraph_ChildRefId

Description
-----------
First valid id in a dense per-kind sequence.
") Start;
		static BRepGraph_ChildRefId Start();


%extend{
    bool __ne_wrapper__(BRepGraph_ChildRefId other) {
        if (*self!=other) return true;
        else return false;
    }
}
%pythoncode {
def __ne__(self, right):
    try:
        return self.__ne_wrapper__(right)
    except:
        return True
}

%extend{
    bool __ne_wrapper__(const BRepGraph_RefId other) {
        if (*self!=other) return true;
        else return false;
    }
}
%pythoncode {
def __ne__(self, right):
    try:
        return self.__ne_wrapper__(right)
    except:
        return True
}
		/****** BRepGraph_ChildRefId::operator + ******/
		/****** md5 signature: c69f1fde8a4abf6a73054fa1db2c1fe3 ******/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "
Parameters
----------
theOffset: uint32_t

Return
-------
BRepGraph_ChildRefId

Description
-----------
Advance by offset.
") operator +;
		BRepGraph_ChildRefId operator +(const uint32_t theOffset);

		/****** BRepGraph_ChildRefId::operator - ******/
		/****** md5 signature: 05213caff5555da9f8d7e29a9b6a1930 ******/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "
Parameters
----------
theOffset: uint32_t

Return
-------
BRepGraph_ChildRefId

Description
-----------
Retreat by offset.
") operator -;
		BRepGraph_ChildRefId operator -(const uint32_t theOffset);


%extend{
    bool __eq_wrapper__(BRepGraph_ChildRefId other) {
        if (*self==other) return true;
        else return false;
    }
}
%pythoncode {
def __eq__(self, right):
    try:
        return self.__eq_wrapper__(right)
    except:
        return False
}

%extend{
    bool __eq_wrapper__(const BRepGraph_RefId other) {
        if (*self==other) return true;
        else return false;
    }
}
%pythoncode {
def __eq__(self, right):
    try:
        return self.__eq_wrapper__(right)
    except:
        return False
}
};


%extend BRepGraph_ChildRefId {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class BRepGraph_CoEdgeId *
***************************/
class BRepGraph_CoEdgeId {
	public:
		uint32_t Index;
		/****** BRepGraph_CoEdgeId::BRepGraph_CoEdgeId ******/
		/****** md5 signature: 4311b88151facb04e31a8f94c612d63e ******/
		%feature("compactdefaultargs") BRepGraph_CoEdgeId;
		%feature("autodoc", "Return
-------
None

Description
-----------
Default: invalid (Index = UINT32_MAX).
") BRepGraph_CoEdgeId;
		 BRepGraph_CoEdgeId();

		/****** BRepGraph_CoEdgeId::BRepGraph_CoEdgeId ******/
		/****** md5 signature: 718adffe00b7c66230abfc0915fac1a6 ******/
		%feature("compactdefaultargs") BRepGraph_CoEdgeId;
		%feature("autodoc", "
Parameters
----------
theIdx: uint32_t

Return
-------
None

Description
-----------
Construct from index.
") BRepGraph_CoEdgeId;
		 BRepGraph_CoEdgeId(const uint32_t theIdx);

		/****** BRepGraph_CoEdgeId::BRepGraph_CoEdgeId ******/
		/****** md5 signature: 06f9543631732e963a42611acebb8a88 ******/
		%feature("compactdefaultargs") BRepGraph_CoEdgeId;
		%feature("autodoc", "
Parameters
----------
theId: BRepGraph_NodeId

Return
-------
None

Description
-----------
Construct from an untyped node id of the same kind.
") BRepGraph_CoEdgeId;
		 BRepGraph_CoEdgeId(const BRepGraph_NodeId theId);

		/****** BRepGraph_CoEdgeId::FromNodeId ******/
		/****** md5 signature: 446894b9c1847edab23d1c81f8aa599c ******/
		%feature("compactdefaultargs") FromNodeId;
		%feature("autodoc", "
Parameters
----------
theId: BRepGraph_NodeId

Return
-------
BRepGraph_CoEdgeId

Description
-----------
Explicit conversion from untyped NodeId. Asserts that the Kind matches in debug builds. 
Input parameter: theId untyped NodeId to convert.
") FromNodeId;
		static BRepGraph_CoEdgeId FromNodeId(const BRepGraph_NodeId theId);

		/****** BRepGraph_CoEdgeId::Invalid ******/
		/****** md5 signature: 19622d4f1c44c5c7e384ccc5986fb8d8 ******/
		%feature("compactdefaultargs") Invalid;
		%feature("autodoc", "Return
-------
BRepGraph_CoEdgeId

Description
-----------
Invalid sentinel id.
") Invalid;
		static BRepGraph_CoEdgeId Invalid();

		/****** BRepGraph_CoEdgeId::IsOwned ******/
		/****** md5 signature: 82162d9fddf9bcd26161cc7f9c342a8b ******/
		%feature("compactdefaultargs") IsOwned;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph

Return
-------
bool

Description
-----------
Return true if this node has an active owner in the given graph.
") IsOwned;
		bool IsOwned(const BRepGraph & theGraph);

		/****** BRepGraph_CoEdgeId::IsRemoved ******/
		/****** md5 signature: 75ed1923a75d2c35c92a9683349c6622 ******/
		%feature("compactdefaultargs") IsRemoved;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph

Return
-------
bool

Description
-----------
Return true if this node has been soft-removed in the given graph.
") IsRemoved;
		bool IsRemoved(const BRepGraph & theGraph);

		/****** BRepGraph_CoEdgeId::IsValid ******/
		/****** md5 signature: 735088818cf24ebe0ebc7005a507da69 ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if this id points to an allocated node slot.
") IsValid;
		bool IsValid();

		/****** BRepGraph_CoEdgeId::IsValid ******/
		/****** md5 signature: 294f20297d740c99df23b64d8041b57c ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "
Parameters
----------
theMaxCount: uint32_t

Return
-------
bool

Description
-----------
True if this id points to an allocated slot within [0, theMaxCount). UINT32_MAX (invalid sentinel) always fails this check for any realistic count.
") IsValid;
		bool IsValid(const uint32_t theMaxCount);

		/****** BRepGraph_CoEdgeId::Start ******/
		/****** md5 signature: fc9e9cfb659953f8d767f808052e7c04 ******/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "Return
-------
BRepGraph_CoEdgeId

Description
-----------
First valid id in a dense per-kind sequence.
") Start;
		static BRepGraph_CoEdgeId Start();


%extend{
    bool __ne_wrapper__(BRepGraph_CoEdgeId other) {
        if (*self!=other) return true;
        else return false;
    }
}
%pythoncode {
def __ne__(self, right):
    try:
        return self.__ne_wrapper__(right)
    except:
        return True
}

%extend{
    bool __ne_wrapper__(const BRepGraph_NodeId other) {
        if (*self!=other) return true;
        else return false;
    }
}
%pythoncode {
def __ne__(self, right):
    try:
        return self.__ne_wrapper__(right)
    except:
        return True
}
		/****** BRepGraph_CoEdgeId::operator + ******/
		/****** md5 signature: c69f1fde8a4abf6a73054fa1db2c1fe3 ******/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "
Parameters
----------
theOffset: uint32_t

Return
-------
BRepGraph_CoEdgeId

Description
-----------
Advance by offset.
") operator +;
		BRepGraph_CoEdgeId operator +(const uint32_t theOffset);

		/****** BRepGraph_CoEdgeId::operator - ******/
		/****** md5 signature: 05213caff5555da9f8d7e29a9b6a1930 ******/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "
Parameters
----------
theOffset: uint32_t

Return
-------
BRepGraph_CoEdgeId

Description
-----------
Retreat by offset.
") operator -;
		BRepGraph_CoEdgeId operator -(const uint32_t theOffset);


%extend{
    bool __eq_wrapper__(BRepGraph_CoEdgeId other) {
        if (*self==other) return true;
        else return false;
    }
}
%pythoncode {
def __eq__(self, right):
    try:
        return self.__eq_wrapper__(right)
    except:
        return False
}

%extend{
    bool __eq_wrapper__(const BRepGraph_NodeId other) {
        if (*self==other) return true;
        else return false;
    }
}
%pythoncode {
def __eq__(self, right):
    try:
        return self.__eq_wrapper__(right)
    except:
        return False
}
};


%extend BRepGraph_CoEdgeId {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class BRepGraph_CompSolidId *
******************************/
class BRepGraph_CompSolidId {
	public:
		uint32_t Index;
		/****** BRepGraph_CompSolidId::BRepGraph_CompSolidId ******/
		/****** md5 signature: 4311b88151facb04e31a8f94c612d63e ******/
		%feature("compactdefaultargs") BRepGraph_CompSolidId;
		%feature("autodoc", "Return
-------
None

Description
-----------
Default: invalid (Index = UINT32_MAX).
") BRepGraph_CompSolidId;
		 BRepGraph_CompSolidId();

		/****** BRepGraph_CompSolidId::BRepGraph_CompSolidId ******/
		/****** md5 signature: 718adffe00b7c66230abfc0915fac1a6 ******/
		%feature("compactdefaultargs") BRepGraph_CompSolidId;
		%feature("autodoc", "
Parameters
----------
theIdx: uint32_t

Return
-------
None

Description
-----------
Construct from index.
") BRepGraph_CompSolidId;
		 BRepGraph_CompSolidId(const uint32_t theIdx);

		/****** BRepGraph_CompSolidId::BRepGraph_CompSolidId ******/
		/****** md5 signature: 06f9543631732e963a42611acebb8a88 ******/
		%feature("compactdefaultargs") BRepGraph_CompSolidId;
		%feature("autodoc", "
Parameters
----------
theId: BRepGraph_NodeId

Return
-------
None

Description
-----------
Construct from an untyped node id of the same kind.
") BRepGraph_CompSolidId;
		 BRepGraph_CompSolidId(const BRepGraph_NodeId theId);

		/****** BRepGraph_CompSolidId::FromNodeId ******/
		/****** md5 signature: 446894b9c1847edab23d1c81f8aa599c ******/
		%feature("compactdefaultargs") FromNodeId;
		%feature("autodoc", "
Parameters
----------
theId: BRepGraph_NodeId

Return
-------
BRepGraph_CompSolidId

Description
-----------
Explicit conversion from untyped NodeId. Asserts that the Kind matches in debug builds. 
Input parameter: theId untyped NodeId to convert.
") FromNodeId;
		static BRepGraph_CompSolidId FromNodeId(const BRepGraph_NodeId theId);

		/****** BRepGraph_CompSolidId::Invalid ******/
		/****** md5 signature: 19622d4f1c44c5c7e384ccc5986fb8d8 ******/
		%feature("compactdefaultargs") Invalid;
		%feature("autodoc", "Return
-------
BRepGraph_CompSolidId

Description
-----------
Invalid sentinel id.
") Invalid;
		static BRepGraph_CompSolidId Invalid();

		/****** BRepGraph_CompSolidId::IsOwned ******/
		/****** md5 signature: 82162d9fddf9bcd26161cc7f9c342a8b ******/
		%feature("compactdefaultargs") IsOwned;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph

Return
-------
bool

Description
-----------
Return true if this node has an active owner in the given graph.
") IsOwned;
		bool IsOwned(const BRepGraph & theGraph);

		/****** BRepGraph_CompSolidId::IsRemoved ******/
		/****** md5 signature: 75ed1923a75d2c35c92a9683349c6622 ******/
		%feature("compactdefaultargs") IsRemoved;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph

Return
-------
bool

Description
-----------
Return true if this node has been soft-removed in the given graph.
") IsRemoved;
		bool IsRemoved(const BRepGraph & theGraph);

		/****** BRepGraph_CompSolidId::IsValid ******/
		/****** md5 signature: 735088818cf24ebe0ebc7005a507da69 ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if this id points to an allocated node slot.
") IsValid;
		bool IsValid();

		/****** BRepGraph_CompSolidId::IsValid ******/
		/****** md5 signature: 294f20297d740c99df23b64d8041b57c ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "
Parameters
----------
theMaxCount: uint32_t

Return
-------
bool

Description
-----------
True if this id points to an allocated slot within [0, theMaxCount). UINT32_MAX (invalid sentinel) always fails this check for any realistic count.
") IsValid;
		bool IsValid(const uint32_t theMaxCount);

		/****** BRepGraph_CompSolidId::Start ******/
		/****** md5 signature: fc9e9cfb659953f8d767f808052e7c04 ******/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "Return
-------
BRepGraph_CompSolidId

Description
-----------
First valid id in a dense per-kind sequence.
") Start;
		static BRepGraph_CompSolidId Start();


%extend{
    bool __ne_wrapper__(BRepGraph_CompSolidId other) {
        if (*self!=other) return true;
        else return false;
    }
}
%pythoncode {
def __ne__(self, right):
    try:
        return self.__ne_wrapper__(right)
    except:
        return True
}

%extend{
    bool __ne_wrapper__(const BRepGraph_NodeId other) {
        if (*self!=other) return true;
        else return false;
    }
}
%pythoncode {
def __ne__(self, right):
    try:
        return self.__ne_wrapper__(right)
    except:
        return True
}
		/****** BRepGraph_CompSolidId::operator + ******/
		/****** md5 signature: c69f1fde8a4abf6a73054fa1db2c1fe3 ******/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "
Parameters
----------
theOffset: uint32_t

Return
-------
BRepGraph_CompSolidId

Description
-----------
Advance by offset.
") operator +;
		BRepGraph_CompSolidId operator +(const uint32_t theOffset);

		/****** BRepGraph_CompSolidId::operator - ******/
		/****** md5 signature: 05213caff5555da9f8d7e29a9b6a1930 ******/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "
Parameters
----------
theOffset: uint32_t

Return
-------
BRepGraph_CompSolidId

Description
-----------
Retreat by offset.
") operator -;
		BRepGraph_CompSolidId operator -(const uint32_t theOffset);


%extend{
    bool __eq_wrapper__(BRepGraph_CompSolidId other) {
        if (*self==other) return true;
        else return false;
    }
}
%pythoncode {
def __eq__(self, right):
    try:
        return self.__eq_wrapper__(right)
    except:
        return False
}

%extend{
    bool __eq_wrapper__(const BRepGraph_NodeId other) {
        if (*self==other) return true;
        else return false;
    }
}
%pythoncode {
def __eq__(self, right):
    try:
        return self.__eq_wrapper__(right)
    except:
        return False
}
};


%extend BRepGraph_CompSolidId {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class BRepGraph_Compact *
**************************/
%nodefaultctor BRepGraph_Compact;
class BRepGraph_Compact {
	public:
		/****** BRepGraph_Compact::Perform ******/
		/****** md5 signature: 8874b63bcf0e28f3e9f789398ae0c81f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph

Return
-------
BRepGraph_Compact_Result

Description
-----------
Run compaction with default options. @param[in,out] theGraph graph to compact 
Return: compaction statistics.
") Perform;
		static BRepGraph_Compact_Result Perform(BRepGraph & theGraph);

		/****** BRepGraph_Compact::Perform ******/
		/****** md5 signature: 4134ea3ed844a846b2e5fcb8ec2c7cfe ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theOptions: BRepGraph_Compact_Options

Return
-------
BRepGraph_Compact_Result

Description
-----------
Run compaction with specified options. @param[in,out] theGraph graph to compact 
Input parameter: theOptions compaction configuration 
Return: compaction statistics.
") Perform;
		static BRepGraph_Compact_Result Perform(BRepGraph & theGraph, BRepGraph_Compact_Options theOptions);

};


%extend BRepGraph_Compact {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class BRepGraph_Compact_Options *
**********************************/
class BRepGraph_Compact_Options {
	public:
/* public enums */
enum class CachePolicy {
	Drop = 0,
	CopyFresh = 1,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class CachePolicy(IntEnum):
	Drop = 0
	CopyFresh = 1
Drop = CachePolicy.Drop
CopyFresh = CachePolicy.CopyFresh
};
/* end python proxy for enums */

		bool HistoryMode;
		CachePolicy CacheMode;
};


%extend BRepGraph_Compact_Options {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class BRepGraph_Compact_Result *
*********************************/
class BRepGraph_Compact_Result {
	public:
		uint32_t NbRemovedVertices;
		uint32_t NbRemovedEdges;
		uint32_t NbRemovedWires;
		uint32_t NbRemovedFaces;
		uint32_t NbRemovedShells;
		uint32_t NbRemovedSolids;
		uint32_t NbRemovedCompounds;
		uint32_t NbRemovedCompSolids;
		uint32_t NbRemovedSurfaces;
		uint32_t NbRemovedCurves;
		uint32_t NbNodesBefore;
		uint32_t NbNodesAfter;
		uint32_t NbUnmappedActiveDefs;
};


%extend BRepGraph_Compact_Result {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class BRepGraph_CompoundId *
*****************************/
class BRepGraph_CompoundId {
	public:
		uint32_t Index;
		/****** BRepGraph_CompoundId::BRepGraph_CompoundId ******/
		/****** md5 signature: 4311b88151facb04e31a8f94c612d63e ******/
		%feature("compactdefaultargs") BRepGraph_CompoundId;
		%feature("autodoc", "Return
-------
None

Description
-----------
Default: invalid (Index = UINT32_MAX).
") BRepGraph_CompoundId;
		 BRepGraph_CompoundId();

		/****** BRepGraph_CompoundId::BRepGraph_CompoundId ******/
		/****** md5 signature: 718adffe00b7c66230abfc0915fac1a6 ******/
		%feature("compactdefaultargs") BRepGraph_CompoundId;
		%feature("autodoc", "
Parameters
----------
theIdx: uint32_t

Return
-------
None

Description
-----------
Construct from index.
") BRepGraph_CompoundId;
		 BRepGraph_CompoundId(const uint32_t theIdx);

		/****** BRepGraph_CompoundId::BRepGraph_CompoundId ******/
		/****** md5 signature: 06f9543631732e963a42611acebb8a88 ******/
		%feature("compactdefaultargs") BRepGraph_CompoundId;
		%feature("autodoc", "
Parameters
----------
theId: BRepGraph_NodeId

Return
-------
None

Description
-----------
Construct from an untyped node id of the same kind.
") BRepGraph_CompoundId;
		 BRepGraph_CompoundId(const BRepGraph_NodeId theId);

		/****** BRepGraph_CompoundId::FromNodeId ******/
		/****** md5 signature: 446894b9c1847edab23d1c81f8aa599c ******/
		%feature("compactdefaultargs") FromNodeId;
		%feature("autodoc", "
Parameters
----------
theId: BRepGraph_NodeId

Return
-------
BRepGraph_CompoundId

Description
-----------
Explicit conversion from untyped NodeId. Asserts that the Kind matches in debug builds. 
Input parameter: theId untyped NodeId to convert.
") FromNodeId;
		static BRepGraph_CompoundId FromNodeId(const BRepGraph_NodeId theId);

		/****** BRepGraph_CompoundId::Invalid ******/
		/****** md5 signature: 19622d4f1c44c5c7e384ccc5986fb8d8 ******/
		%feature("compactdefaultargs") Invalid;
		%feature("autodoc", "Return
-------
BRepGraph_CompoundId

Description
-----------
Invalid sentinel id.
") Invalid;
		static BRepGraph_CompoundId Invalid();

		/****** BRepGraph_CompoundId::IsOwned ******/
		/****** md5 signature: 82162d9fddf9bcd26161cc7f9c342a8b ******/
		%feature("compactdefaultargs") IsOwned;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph

Return
-------
bool

Description
-----------
Return true if this node has an active owner in the given graph.
") IsOwned;
		bool IsOwned(const BRepGraph & theGraph);

		/****** BRepGraph_CompoundId::IsRemoved ******/
		/****** md5 signature: 75ed1923a75d2c35c92a9683349c6622 ******/
		%feature("compactdefaultargs") IsRemoved;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph

Return
-------
bool

Description
-----------
Return true if this node has been soft-removed in the given graph.
") IsRemoved;
		bool IsRemoved(const BRepGraph & theGraph);

		/****** BRepGraph_CompoundId::IsValid ******/
		/****** md5 signature: 735088818cf24ebe0ebc7005a507da69 ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if this id points to an allocated node slot.
") IsValid;
		bool IsValid();

		/****** BRepGraph_CompoundId::IsValid ******/
		/****** md5 signature: 294f20297d740c99df23b64d8041b57c ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "
Parameters
----------
theMaxCount: uint32_t

Return
-------
bool

Description
-----------
True if this id points to an allocated slot within [0, theMaxCount). UINT32_MAX (invalid sentinel) always fails this check for any realistic count.
") IsValid;
		bool IsValid(const uint32_t theMaxCount);

		/****** BRepGraph_CompoundId::Start ******/
		/****** md5 signature: fc9e9cfb659953f8d767f808052e7c04 ******/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "Return
-------
BRepGraph_CompoundId

Description
-----------
First valid id in a dense per-kind sequence.
") Start;
		static BRepGraph_CompoundId Start();


%extend{
    bool __ne_wrapper__(BRepGraph_CompoundId other) {
        if (*self!=other) return true;
        else return false;
    }
}
%pythoncode {
def __ne__(self, right):
    try:
        return self.__ne_wrapper__(right)
    except:
        return True
}

%extend{
    bool __ne_wrapper__(const BRepGraph_NodeId other) {
        if (*self!=other) return true;
        else return false;
    }
}
%pythoncode {
def __ne__(self, right):
    try:
        return self.__ne_wrapper__(right)
    except:
        return True
}
		/****** BRepGraph_CompoundId::operator + ******/
		/****** md5 signature: c69f1fde8a4abf6a73054fa1db2c1fe3 ******/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "
Parameters
----------
theOffset: uint32_t

Return
-------
BRepGraph_CompoundId

Description
-----------
Advance by offset.
") operator +;
		BRepGraph_CompoundId operator +(const uint32_t theOffset);

		/****** BRepGraph_CompoundId::operator - ******/
		/****** md5 signature: 05213caff5555da9f8d7e29a9b6a1930 ******/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "
Parameters
----------
theOffset: uint32_t

Return
-------
BRepGraph_CompoundId

Description
-----------
Retreat by offset.
") operator -;
		BRepGraph_CompoundId operator -(const uint32_t theOffset);


%extend{
    bool __eq_wrapper__(BRepGraph_CompoundId other) {
        if (*self==other) return true;
        else return false;
    }
}
%pythoncode {
def __eq__(self, right):
    try:
        return self.__eq_wrapper__(right)
    except:
        return False
}

%extend{
    bool __eq_wrapper__(const BRepGraph_NodeId other) {
        if (*self==other) return true;
        else return false;
    }
}
%pythoncode {
def __eq__(self, right):
    try:
        return self.__eq_wrapper__(right)
    except:
        return False
}
};


%extend BRepGraph_CompoundId {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class BRepGraph_Copy *
***********************/
%nodefaultctor BRepGraph_Copy;
class BRepGraph_Copy {
	public:
/* public enums */
enum class GeomPolicy {
	Copy = 0,
	Share = 1,
	Drop = 2,
};

enum class MeshPolicy {
	Copy = 0,
	Share = 1,
	Drop = 2,
};

enum class CachePolicy {
	Drop = 0,
	CopyFresh = 1,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class GeomPolicy(IntEnum):
	Copy = 0
	Share = 1
	Drop = 2
Copy = GeomPolicy.Copy
Share = GeomPolicy.Share
Drop = GeomPolicy.Drop

class MeshPolicy(IntEnum):
	Copy = 0
	Share = 1
	Drop = 2
Copy = MeshPolicy.Copy
Share = MeshPolicy.Share
Drop = MeshPolicy.Drop

class CachePolicy(IntEnum):
	Drop = 0
	CopyFresh = 1
Drop = CachePolicy.Drop
CopyFresh = CachePolicy.CopyFresh
};
/* end python proxy for enums */

		/****** BRepGraph_Copy::CopyNode ******/
		/****** md5 signature: de1e67378b9e57e1bfb5b3bd522bd946 ******/
		%feature("compactdefaultargs") CopyNode;
		%feature("autodoc", "
Parameters
----------
theSourceGraph: BRepGraph
theTargetGraph: BRepGraph
theNodeId: BRepGraph_NodeId
theGeomPolicy: GeomPolicy (optional, default to GeomPolicy::Copy)
theMeshPolicy: MeshPolicy (optional, default to MeshPolicy::Copy)
theCachePolicy: CachePolicy (optional, default to CachePolicy::Drop)

Return
-------
BRepGraph_NodeId

Description
-----------
Copy a single node sub-graph of any kind (Face, Shell, Solid, Wire, Edge, Vertex, etc.). The target graph receives the specified node and all entities it references. //! External copy (theSourceGraph != theTargetGraph): New entities are appended to theTargetGraph. Entities already present in theTargetGraph are reused (not duplicated). //! Self-copy (theSourceGraph == theTargetGraph): The specified sub-graph is duplicated with new entity IDs within the same graph. Shared dependencies (vertices, edges referenced from outside the sub-graph) are preserved as-is. //! 
Input parameter: theSourceGraph a pre-built BRepGraph @param[in,out] theTargetGraph destination graph (may already contain data) 
Input parameter: theNodeId node identifier (any kind) 
Input parameter: theGeomPolicy geometry handle policy (default: Copy) 
Input parameter: theMeshPolicy mesh data policy (default: Copy) 
Return: the mapped root NodeId in theTargetGraph, or invalid NodeId on failure.
") CopyNode;
		static BRepGraph_NodeId CopyNode(const BRepGraph & theSourceGraph, BRepGraph & theTargetGraph, const BRepGraph_NodeId theNodeId, GeomPolicy theGeomPolicy = GeomPolicy::Copy, MeshPolicy theMeshPolicy = MeshPolicy::Copy, CachePolicy theCachePolicy = CachePolicy::Drop);

		/****** BRepGraph_Copy::Perform ******/
		/****** md5 signature: a72d4a7d3812a8e2a3e2702a515e5bb8 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theSourceGraph: BRepGraph
theTargetGraph: BRepGraph
theGeomPolicy: GeomPolicy (optional, default to GeomPolicy::Copy)
theMeshPolicy: MeshPolicy (optional, default to MeshPolicy::Copy)
theCachePolicy: CachePolicy (optional, default to CachePolicy::Drop)

Return
-------
bool

Description
-----------
Copy the entire source graph into the target graph. //! Self-copy (theSourceGraph == theTargetGraph): Identity no-op, returns true immediately. //! External copy to empty target (theTargetGraph.IsEmpty()): Uses identity-mapped fast path (old index == new index). //! External copy to non-empty target: Uses explicit mapping; IDs in theTargetGraph will differ from theSourceGraph. Entities from theSourceGraph are appended to theTargetGraph. //! 
Input parameter: theSourceGraph a pre-built BRepGraph (must not be empty) @param[in,out] theTargetGraph destination graph (may already contain data) 
Input parameter: theGeomPolicy geometry handle policy (default: Copy) 
Input parameter: theMeshPolicy mesh data policy (default: Copy) 
Return: true on success, false on failure (empty source).
") Perform;
		static bool Perform(const BRepGraph & theSourceGraph, BRepGraph & theTargetGraph, GeomPolicy theGeomPolicy = GeomPolicy::Copy, MeshPolicy theMeshPolicy = MeshPolicy::Copy, CachePolicy theCachePolicy = CachePolicy::Drop);

};


%extend BRepGraph_Copy {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class BRepGraph_CopyRemap *
****************************/
%nodefaultctor BRepGraph_CopyRemap;
class BRepGraph_CopyRemap {
	public:
/* public enums */
enum class Mode {
	Copy = 0,
	Compact = 1,
};

enum class MappingKind {
	Explicit = 0,
	Identity = 1,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class Mode(IntEnum):
	Copy = 0
	Compact = 1
Copy = Mode.Copy
Compact = Mode.Compact

class MappingKind(IntEnum):
	Explicit = 0
	Identity = 1
Explicit = MappingKind.Explicit
Identity = MappingKind.Identity
};
/* end python proxy for enums */

		/****** BRepGraph_CopyRemap::CopyMode ******/
		/****** md5 signature: 9d1d01c9c1b0aa3d356779b621ecc5e9 ******/
		%feature("compactdefaultargs") CopyMode;
		%feature("autodoc", "Return
-------
BRepGraph_CopyRemap::Mode

Description
-----------
Migration mode of this context.
") CopyMode;
		BRepGraph_CopyRemap::Mode CopyMode();

		/****** BRepGraph_CopyRemap::HasTargetItem ******/
		/****** md5 signature: 0c1a7e0d12bb6e3d0fbbffc9c22bbaf8 ******/
		%feature("compactdefaultargs") HasTargetItem;
		%feature("autodoc", "
Parameters
----------
theSourceItem: BRepGraph_ItemId

Return
-------
bool

Description
-----------
Return true if the source item has a valid copied target item.
") HasTargetItem;
		bool HasTargetItem(const BRepGraph_ItemId theSourceItem);

		/****** BRepGraph_CopyRemap::IsCompact ******/
		/****** md5 signature: 3a91bf195792e79f8a01de947e774b30 ******/
		%feature("compactdefaultargs") IsCompact;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if this is a compaction migration (not a full copy).
") IsCompact;
		bool IsCompact();

		/****** BRepGraph_CopyRemap::Items ******/
		/****** md5 signature: 45d499bf065ac41af22250852f0f621e ******/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "Return
-------
NCollection_FlatDataMap<BRepGraph_ItemId, BRepGraph_ItemId >

Description
-----------
Source item id -> target item id map for copied definitions, refs, and reps.
") Items;
		const NCollection_FlatDataMap<BRepGraph_ItemId, BRepGraph_ItemId > & Items();

		/****** BRepGraph_CopyRemap::SourceGraph ******/
		/****** md5 signature: 7b8ab824afca617df2eb044998dfaf8e ******/
		%feature("compactdefaultargs") SourceGraph;
		%feature("autodoc", "Return
-------
BRepGraph

Description
-----------
Source graph the copied layer is attached to.
") SourceGraph;
		const BRepGraph & SourceGraph();

		/****** BRepGraph_CopyRemap::SourceUID ******/
		/****** md5 signature: befb57fbd61606980ba10cdf9d93dcc2 ******/
		%feature("compactdefaultargs") SourceUID;
		%feature("autodoc", "
Parameters
----------
theSourceItem: BRepGraph_ItemId

Return
-------
BRepGraph_ItemUID

Description
-----------
Return source UID for a source item.
") SourceUID;
		BRepGraph_ItemUID SourceUID(const BRepGraph_ItemId theSourceItem);

		/****** BRepGraph_CopyRemap::TargetGraph ******/
		/****** md5 signature: bf8f0640a7b993adb9c9b4c77dc4a2bb ******/
		%feature("compactdefaultargs") TargetGraph;
		%feature("autodoc", "Return
-------
BRepGraph

Description
-----------
Target graph whose structural contents have already been copied.
") TargetGraph;
		BRepGraph & TargetGraph();

		/****** BRepGraph_CopyRemap::TargetGraphConst ******/
		/****** md5 signature: 5030100530d1318ebabd7cb87795c485 ******/
		%feature("compactdefaultargs") TargetGraphConst;
		%feature("autodoc", "Return
-------
BRepGraph

Description
-----------
Target graph as const.
") TargetGraphConst;
		const BRepGraph & TargetGraphConst();

		/****** BRepGraph_CopyRemap::TargetItem ******/
		/****** md5 signature: 2c1900e8da1a3cd0fcd582e1c10c33a9 ******/
		%feature("compactdefaultargs") TargetItem;
		%feature("autodoc", "
Parameters
----------
theSourceItem: BRepGraph_ItemId

Return
-------
BRepGraph_ItemId

Description
-----------
Return the target item for a source item, or an invalid item if not copied.
") TargetItem;
		BRepGraph_ItemId TargetItem(const BRepGraph_ItemId theSourceItem);

		/****** BRepGraph_CopyRemap::TargetItemOrInvalid ******/
		/****** md5 signature: 6989466378291fefb0b78970872753ce ******/
		%feature("compactdefaultargs") TargetItemOrInvalid;
		%feature("autodoc", "
Parameters
----------
theSourceItem: BRepGraph_ItemId

Return
-------
BRepGraph_ItemId

Description
-----------
Return the target item for a source item, or an invalid item id.
") TargetItemOrInvalid;
		BRepGraph_ItemId TargetItemOrInvalid(const BRepGraph_ItemId theSourceItem);

		/****** BRepGraph_CopyRemap::TargetUID ******/
		/****** md5 signature: 3bc0452cef7572c3cfedf9e7b1a54b72 ******/
		%feature("compactdefaultargs") TargetUID;
		%feature("autodoc", "
Parameters
----------
theTargetItem: BRepGraph_ItemId

Return
-------
BRepGraph_ItemUID

Description
-----------
Return target UID for a target item.
") TargetUID;
		BRepGraph_ItemUID TargetUID(const BRepGraph_ItemId theTargetItem);

		/****** BRepGraph_CopyRemap::TargetUIDFromSource ******/
		/****** md5 signature: f73cf03b65f9ff4cfd6b6c01be343569 ******/
		%feature("compactdefaultargs") TargetUIDFromSource;
		%feature("autodoc", "
Parameters
----------
theSourceItem: BRepGraph_ItemId

Return
-------
BRepGraph_ItemUID

Description
-----------
Return target UID for a source item by source->target remap.
") TargetUIDFromSource;
		BRepGraph_ItemUID TargetUIDFromSource(const BRepGraph_ItemId theSourceItem);

};


%extend BRepGraph_CopyRemap {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def BRepGraph_CopyRemap(self):
		pass
	}
};

/***********************
* class BRepGraph_Data *
***********************/
/******************************
* class BRepGraph_Deduplicate *
******************************/
%nodefaultctor BRepGraph_Deduplicate;
class BRepGraph_Deduplicate {
	public:
		/****** BRepGraph_Deduplicate::Perform ******/
		/****** md5 signature: 8874b63bcf0e28f3e9f789398ae0c81f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph

Return
-------
BRepGraph_Deduplicate_Result

Description
-----------
Run deduplication on a built graph. @param[in,out] theGraph graph to update 
Return: dedup statistics.
") Perform;
		static BRepGraph_Deduplicate_Result Perform(BRepGraph & theGraph);

		/****** BRepGraph_Deduplicate::Perform ******/
		/****** md5 signature: 4134ea3ed844a846b2e5fcb8ec2c7cfe ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theOptions: BRepGraph_Deduplicate_Options

Return
-------
BRepGraph_Deduplicate_Result

Description
-----------
Run deduplication on a built graph. @param[in,out] theGraph graph to update 
Input parameter: theOptions dedup configuration 
Return: dedup statistics.
") Perform;
		static BRepGraph_Deduplicate_Result Perform(BRepGraph & theGraph, BRepGraph_Deduplicate_Options theOptions);

};


%extend BRepGraph_Deduplicate {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class BRepGraph_Deduplicate_Options *
**************************************/
class BRepGraph_Deduplicate_Options {
	public:
		bool AnalyzeOnly;
		bool HistoryMode;
		bool MergeEntitiesWhenSafe;
		double CompTolerance;
		double HashTolerance;
};


%extend BRepGraph_Deduplicate_Options {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class BRepGraph_Deduplicate_Result *
*************************************/
class BRepGraph_Deduplicate_Result {
	public:
		uint32_t NbCanonicalSurfaces;
		uint32_t NbCanonicalCurves;
		uint32_t NbSurfaceRewrites;
		uint32_t NbCurveRewrites;
		uint32_t NbNullifiedSurfaces;
		uint32_t NbNullifiedCurves;
		uint32_t NbHistoryRecords;
		bool IsEntityMergeApplied;
		uint32_t NbMergedVertices;
		uint32_t NbMergedEdges;
		uint32_t NbMergedWires;
		uint32_t NbMergedFaces;
		uint32_t NbReorderedWires;
		uint32_t NbToleranceOrderedWires;
		uint32_t NbPartialOrderedWires;
};


%extend BRepGraph_Deduplicate_Result {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class BRepGraph_DeferredScope *
********************************/
class BRepGraph_DeferredScope {
	public:
		/****** BRepGraph_DeferredScope::BRepGraph_DeferredScope ******/
		/****** md5 signature: d5907983bd1db393bd92d287dda40cc2 ******/
		%feature("compactdefaultargs") BRepGraph_DeferredScope;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph

Return
-------
None

Description
-----------
Begin deferred invalidation if not already active.
") BRepGraph_DeferredScope;
		 BRepGraph_DeferredScope(BRepGraph & theGraph);

};


%extend BRepGraph_DeferredScope {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class BRepGraph_EdgeId *
*************************/
class BRepGraph_EdgeId {
	public:
		uint32_t Index;
		/****** BRepGraph_EdgeId::BRepGraph_EdgeId ******/
		/****** md5 signature: 4311b88151facb04e31a8f94c612d63e ******/
		%feature("compactdefaultargs") BRepGraph_EdgeId;
		%feature("autodoc", "Return
-------
None

Description
-----------
Default: invalid (Index = UINT32_MAX).
") BRepGraph_EdgeId;
		 BRepGraph_EdgeId();

		/****** BRepGraph_EdgeId::BRepGraph_EdgeId ******/
		/****** md5 signature: 718adffe00b7c66230abfc0915fac1a6 ******/
		%feature("compactdefaultargs") BRepGraph_EdgeId;
		%feature("autodoc", "
Parameters
----------
theIdx: uint32_t

Return
-------
None

Description
-----------
Construct from index.
") BRepGraph_EdgeId;
		 BRepGraph_EdgeId(const uint32_t theIdx);

		/****** BRepGraph_EdgeId::BRepGraph_EdgeId ******/
		/****** md5 signature: 06f9543631732e963a42611acebb8a88 ******/
		%feature("compactdefaultargs") BRepGraph_EdgeId;
		%feature("autodoc", "
Parameters
----------
theId: BRepGraph_NodeId

Return
-------
None

Description
-----------
Construct from an untyped node id of the same kind.
") BRepGraph_EdgeId;
		 BRepGraph_EdgeId(const BRepGraph_NodeId theId);

		/****** BRepGraph_EdgeId::FromNodeId ******/
		/****** md5 signature: 446894b9c1847edab23d1c81f8aa599c ******/
		%feature("compactdefaultargs") FromNodeId;
		%feature("autodoc", "
Parameters
----------
theId: BRepGraph_NodeId

Return
-------
BRepGraph_EdgeId

Description
-----------
Explicit conversion from untyped NodeId. Asserts that the Kind matches in debug builds. 
Input parameter: theId untyped NodeId to convert.
") FromNodeId;
		static BRepGraph_EdgeId FromNodeId(const BRepGraph_NodeId theId);

		/****** BRepGraph_EdgeId::Invalid ******/
		/****** md5 signature: 19622d4f1c44c5c7e384ccc5986fb8d8 ******/
		%feature("compactdefaultargs") Invalid;
		%feature("autodoc", "Return
-------
BRepGraph_EdgeId

Description
-----------
Invalid sentinel id.
") Invalid;
		static BRepGraph_EdgeId Invalid();

		/****** BRepGraph_EdgeId::IsOwned ******/
		/****** md5 signature: 82162d9fddf9bcd26161cc7f9c342a8b ******/
		%feature("compactdefaultargs") IsOwned;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph

Return
-------
bool

Description
-----------
Return true if this node has an active owner in the given graph.
") IsOwned;
		bool IsOwned(const BRepGraph & theGraph);

		/****** BRepGraph_EdgeId::IsRemoved ******/
		/****** md5 signature: 75ed1923a75d2c35c92a9683349c6622 ******/
		%feature("compactdefaultargs") IsRemoved;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph

Return
-------
bool

Description
-----------
Return true if this node has been soft-removed in the given graph.
") IsRemoved;
		bool IsRemoved(const BRepGraph & theGraph);

		/****** BRepGraph_EdgeId::IsValid ******/
		/****** md5 signature: 735088818cf24ebe0ebc7005a507da69 ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if this id points to an allocated node slot.
") IsValid;
		bool IsValid();

		/****** BRepGraph_EdgeId::IsValid ******/
		/****** md5 signature: 294f20297d740c99df23b64d8041b57c ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "
Parameters
----------
theMaxCount: uint32_t

Return
-------
bool

Description
-----------
True if this id points to an allocated slot within [0, theMaxCount). UINT32_MAX (invalid sentinel) always fails this check for any realistic count.
") IsValid;
		bool IsValid(const uint32_t theMaxCount);

		/****** BRepGraph_EdgeId::Start ******/
		/****** md5 signature: fc9e9cfb659953f8d767f808052e7c04 ******/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "Return
-------
BRepGraph_EdgeId

Description
-----------
First valid id in a dense per-kind sequence.
") Start;
		static BRepGraph_EdgeId Start();


%extend{
    bool __ne_wrapper__(BRepGraph_EdgeId other) {
        if (*self!=other) return true;
        else return false;
    }
}
%pythoncode {
def __ne__(self, right):
    try:
        return self.__ne_wrapper__(right)
    except:
        return True
}

%extend{
    bool __ne_wrapper__(const BRepGraph_NodeId other) {
        if (*self!=other) return true;
        else return false;
    }
}
%pythoncode {
def __ne__(self, right):
    try:
        return self.__ne_wrapper__(right)
    except:
        return True
}
		/****** BRepGraph_EdgeId::operator + ******/
		/****** md5 signature: c69f1fde8a4abf6a73054fa1db2c1fe3 ******/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "
Parameters
----------
theOffset: uint32_t

Return
-------
BRepGraph_EdgeId

Description
-----------
Advance by offset.
") operator +;
		BRepGraph_EdgeId operator +(const uint32_t theOffset);

		/****** BRepGraph_EdgeId::operator - ******/
		/****** md5 signature: 05213caff5555da9f8d7e29a9b6a1930 ******/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "
Parameters
----------
theOffset: uint32_t

Return
-------
BRepGraph_EdgeId

Description
-----------
Retreat by offset.
") operator -;
		BRepGraph_EdgeId operator -(const uint32_t theOffset);


%extend{
    bool __eq_wrapper__(BRepGraph_EdgeId other) {
        if (*self==other) return true;
        else return false;
    }
}
%pythoncode {
def __eq__(self, right):
    try:
        return self.__eq_wrapper__(right)
    except:
        return False
}

%extend{
    bool __eq_wrapper__(const BRepGraph_NodeId other) {
        if (*self==other) return true;
        else return false;
    }
}
%pythoncode {
def __eq__(self, right):
    try:
        return self.__eq_wrapper__(right)
    except:
        return False
}
};


%extend BRepGraph_EdgeId {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class BRepGraph_EditorView *
*****************************/
%nodefaultctor BRepGraph_EditorView;
class BRepGraph_EditorView {
	public:
		/****** BRepGraph_EditorView::BeginDeferredInvalidation ******/
		/****** md5 signature: bc244267aa237f0de8eca12ce6c4cd25 ******/
		%feature("compactdefaultargs") BeginDeferredInvalidation;
		%feature("autodoc", "Return
-------
None

Description
-----------
Begin deferred invalidation mode. While active, markModified() only increments OwnGen + SubtreeGen and appends to the deferred list - without acquiring the shape-cache mutex or propagating upward. Call EndDeferredInvalidation() to batch-flush all accumulated changes. Intended for batch mutation loops (SameParameter, Sewing) where many entities are modified sequentially and upward propagation should be deferred until all mutations are complete. Prefer BRepGraph_DeferredScope RAII guard. @warning Deferred mode batches invalidation only; it does NOT serialize the mutation body. Callers must guarantee exclusive Editor() structural edit access for the whole deferred scope; concurrent Editor().Mut*() usage still requires external synchronization around the surrounding batch.
") BeginDeferredInvalidation;
		void BeginDeferredInvalidation();

		/****** BRepGraph_EditorView::CoEdges ******/
		/****** md5 signature: 803664c09b60324b561c1f3f8bff47fc ******/
		%feature("compactdefaultargs") CoEdges;
		%feature("autodoc", "Return
-------
BRepGraph_EditorView_CoEdgeOps

Description
-----------
Return coedge and PCurve operations.
") CoEdges;
		BRepGraph_EditorView_CoEdgeOps & CoEdges();

		/****** BRepGraph_EditorView::CommitMutation ******/
		/****** md5 signature: 320c863baaf3ee77537b237b1a73be54 ******/
		%feature("compactdefaultargs") CommitMutation;
		%feature("autodoc", "Return
-------
None

Description
-----------
Finalize a batch of mutations. Validates relation consistency and asserts active entity counts match actual entity state. Call this after manual batch mutation loops, or rely on BRepGraph_DeferredScope to call it automatically at scope exit.
") CommitMutation;
		void CommitMutation();

		/****** BRepGraph_EditorView::CompSolids ******/
		/****** md5 signature: b76b2a8621734a9a4abafb08d0274217 ******/
		%feature("compactdefaultargs") CompSolids;
		%feature("autodoc", "Return
-------
BRepGraph_EditorView_CompSolidOps

Description
-----------
Return compsolid creation and editing operations.
") CompSolids;
		BRepGraph_EditorView_CompSolidOps & CompSolids();

		/****** BRepGraph_EditorView::Compounds ******/
		/****** md5 signature: f18ddc4d1d11251e5e0e1af5fbb6ddf6 ******/
		%feature("compactdefaultargs") Compounds;
		%feature("autodoc", "Return
-------
BRepGraph_EditorView_CompoundOps

Description
-----------
Return compound creation and editing operations.
") Compounds;
		BRepGraph_EditorView_CompoundOps & Compounds();

		/****** BRepGraph_EditorView::Edges ******/
		/****** md5 signature: a37c07cff8f86d953e0c59c7db39016d ******/
		%feature("compactdefaultargs") Edges;
		%feature("autodoc", "Return
-------
BRepGraph_EditorView_EdgeOps

Description
-----------
Return edge creation and editing operations.
") Edges;
		BRepGraph_EditorView_EdgeOps & Edges();

		/****** BRepGraph_EditorView::EndDeferredInvalidation ******/
		/****** md5 signature: 5005a0b850329d72f76d79e6e1cd58a4 ******/
		%feature("compactdefaultargs") EndDeferredInvalidation;
		%feature("autodoc", "Return
-------
None

Description
-----------
End deferred invalidation mode and batch-flush: propagates SubtreeGen upward for all modified entities from the deferred list. Shape cache entries are validated lazily via SubtreeGen comparison.
") EndDeferredInvalidation;
		void EndDeferredInvalidation();

		/****** BRepGraph_EditorView::Faces ******/
		/****** md5 signature: 6c8c47fadeb2a3b6bd24a20584a4e537 ******/
		%feature("compactdefaultargs") Faces;
		%feature("autodoc", "Return
-------
BRepGraph_EditorView_FaceOps

Description
-----------
Return face creation and editing operations.
") Faces;
		BRepGraph_EditorView_FaceOps & Faces();

		/****** BRepGraph_EditorView::Gen ******/
		/****** md5 signature: ffad28982aa1aaa9998a7d8ee0fd5b09 ******/
		%feature("compactdefaultargs") Gen;
		%feature("autodoc", "Return
-------
BRepGraph_EditorView_GenOps

Description
-----------
Return generic node, reference, and representation removal operations.
") Gen;
		BRepGraph_EditorView_GenOps & Gen();

		/****** BRepGraph_EditorView::IsDeferredMode ******/
		/****** md5 signature: 60556e0178f61cbd525553b93d974cba ******/
		%feature("compactdefaultargs") IsDeferredMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Check if deferred invalidation mode is currently active. @note This is a state flag only. It does not imply mutation ownership or synchronization guarantees.
") IsDeferredMode;
		bool IsDeferredMode();

		/****** BRepGraph_EditorView::Occurrences ******/
		/****** md5 signature: bd041d773d4e53909a487ba33309547f ******/
		%feature("compactdefaultargs") Occurrences;
		%feature("autodoc", "Return
-------
BRepGraph_EditorView_OccurrenceOps

Description
-----------
Return occurrence mutation operations.
") Occurrences;
		BRepGraph_EditorView_OccurrenceOps & Occurrences();

		/****** BRepGraph_EditorView::Products ******/
		/****** md5 signature: 72c7a66b26c0cd2841b26302d4c8634d ******/
		%feature("compactdefaultargs") Products;
		%feature("autodoc", "Return
-------
BRepGraph_EditorView_ProductOps

Description
-----------
Return product and assembly creation and editing operations.
") Products;
		BRepGraph_EditorView_ProductOps & Products();

		/****** BRepGraph_EditorView::Shells ******/
		/****** md5 signature: adaf5c133152781c9b368abb9ccba869 ******/
		%feature("compactdefaultargs") Shells;
		%feature("autodoc", "Return
-------
BRepGraph_EditorView_ShellOps

Description
-----------
Return shell creation and editing operations.
") Shells;
		BRepGraph_EditorView_ShellOps & Shells();

		/****** BRepGraph_EditorView::Solids ******/
		/****** md5 signature: d0bb5ac2e41ee9eb056847cedfaad11e ******/
		%feature("compactdefaultargs") Solids;
		%feature("autodoc", "Return
-------
BRepGraph_EditorView_SolidOps

Description
-----------
Return solid creation and editing operations.
") Solids;
		BRepGraph_EditorView_SolidOps & Solids();

		/****** BRepGraph_EditorView::Supplement ******/
		/****** md5 signature: 1c9fd3716eb256be1a0cb5d28880b31a ******/
		%feature("compactdefaultargs") Supplement;
		%feature("autodoc", "Return
-------
BRepGraph_SupplementEditor

Description
-----------
Return runtime supplement attachment operations.
") Supplement;
		BRepGraph_SupplementEditor Supplement();

		/****** BRepGraph_EditorView::ValidateMutationBoundary ******/
		/****** md5 signature: 8eddc3f02c91271f09e522b356e0ecd3 ******/
		%feature("compactdefaultargs") ValidateMutationBoundary;
		%feature("autodoc", "
Parameters
----------
theIssues: NCollection_LinearVector<BRepGraph_EditorView_BoundaryIssue> * (optional, default to nullptr)

Return
-------
bool

Description
-----------
Validate lightweight mutation-boundary invariants. @param[out] theIssues optional destination for detailed issues 
Return: true if no issues were found.
") ValidateMutationBoundary;
		bool ValidateMutationBoundary(NCollection_LinearVector<BRepGraph_EditorView_BoundaryIssue> * const theIssues = nullptr);

		/****** BRepGraph_EditorView::Vertices ******/
		/****** md5 signature: 2cb470a0f5ba253d7f96a08bd80e699a ******/
		%feature("compactdefaultargs") Vertices;
		%feature("autodoc", "Return
-------
BRepGraph_EditorView_VertexOps

Description
-----------
Return vertex creation operations.
") Vertices;
		BRepGraph_EditorView_VertexOps & Vertices();

		/****** BRepGraph_EditorView::Wires ******/
		/****** md5 signature: 7d1213ea85a7ee4f08642a4b893d1ff1 ******/
		%feature("compactdefaultargs") Wires;
		%feature("autodoc", "Return
-------
BRepGraph_EditorView_WireOps

Description
-----------
Return wire creation and editing operations.
") Wires;
		BRepGraph_EditorView_WireOps & Wires();

};


%extend BRepGraph_EditorView {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class BRepGraph_EditorView_BoundaryIssue *
*******************************************/
class BRepGraph_EditorView_BoundaryIssue {
	public:
		BRepGraph_NodeId NodeId;
		TCollection_AsciiString Description;
};


%extend BRepGraph_EditorView_BoundaryIssue {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class BRepGraph_EditorView_CoEdgeOps *
***************************************/
%nodefaultctor BRepGraph_EditorView_CoEdgeOps;
class BRepGraph_EditorView_CoEdgeOps {
	public:
		/****** BRepGraph_EditorView_CoEdgeOps::Add ******/
		/****** md5 signature: 0d6509304df30ef865241f5feddf6d87 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theEdge: BRepGraph_EdgeId
theOrientation: BRepGraphInc::ParityOrientation

Return
-------
BRepGraph_CoEdgeId

Description
-----------
Create a new CoEdge entity linking an edge with an orientation. The CoEdge is free-floating (no parent wire); bind it to a wire via WireOps::Add(). 
Input parameter: theEdge typed edge definition identifier 
Input parameter: theOrientation orientation of the edge in the wire 
Return: typed coedge identifier, or invalid if the edge is invalid.
") Add;
		BRepGraph_CoEdgeId Add(const BRepGraph_EdgeId theEdge, const BRepGraphInc::ParityOrientation theOrientation);

		/****** BRepGraph_EditorView_CoEdgeOps::Add ******/
		/****** md5 signature: aea863ad6cab002eef93275c400f57d7 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theEdgeEntity: BRepGraph_EdgeId
theFaceEntity: BRepGraph_FaceId
theCurve2d: Geom2d_Curve
theFirst: double
theLast: double
theEdgeOrientation: BRepGraphInc::ParityOrientation (optional, default to TopAbs_FORWARD)

Return
-------
BRepGraph_CoEdgeId

Description
-----------
Create a new CoEdge entity with a PCurve for a given edge-face pair. Creates a new CoEdge entity with Curve2DRep and updates relation tables. This always appends a new CoEdge entry for the edge-face pair; callers should avoid duplicate creation unless multiple bindings are intentional for the modeled topology. For editing an already identified CoEdge inside a larger mutation sequence, use CoEdges().SetPCurve(). 
Input parameter: theEdgeEntity typed edge definition identifier 
Input parameter: theFaceEntity typed face definition identifier 
Input parameter: theCurve2d 2D curve geometry 
Input parameter: theFirst  first curve parameter 
Input parameter: theLast last curve parameter 
Input parameter: theEdgeOrientation edge orientation on the face 
Return: typed coedge identifier, or invalid if inputs are not active.
") Add;
		BRepGraph_CoEdgeId Add(const BRepGraph_EdgeId theEdgeEntity, const BRepGraph_FaceId theFaceEntity, const opencascade::handle<Geom2d_Curve> & theCurve2d, const double theFirst, const double theLast, const BRepGraphInc::ParityOrientation theEdgeOrientation = TopAbs_FORWARD);

		/****** BRepGraph_EditorView_CoEdgeOps::ClearPCurve ******/
		/****** md5 signature: 9860446f1d9a2e6b89fac3e5752cc46f ******/
		%feature("compactdefaultargs") ClearPCurve;
		%feature("autodoc", "
Parameters
----------
theCoEdge: BRepGraph_CoEdgeId

Return
-------
None

Description
-----------
Clear the PCurve on a coedge. 
Input parameter: theCoEdge coedge definition identifier.
") ClearPCurve;
		void ClearPCurve(const BRepGraph_CoEdgeId theCoEdge);

		/****** BRepGraph_EditorView_CoEdgeOps::ResetPCurveBinding ******/
		/****** md5 signature: d142107a09aa8ed9363abc87c20d83cf ******/
		%feature("compactdefaultargs") ResetPCurveBinding;
		%feature("autodoc", "
Parameters
----------
theCoEdge: BRepGraph_CoEdgeId

Return
-------
None

Description
-----------
Drop face-bound parametric representation (PCurve, param range, continuity, UVs) while keeping structural links - used when the owning face is removed.
") ResetPCurveBinding;
		void ResetPCurveBinding(const BRepGraph_CoEdgeId theCoEdge);

		/****** BRepGraph_EditorView_CoEdgeOps::ResetPCurveBinding ******/
		/****** md5 signature: 746729326bd6c6a069eed589fd39ed7c ******/
		%feature("compactdefaultargs") ResetPCurveBinding;
		%feature("autodoc", "
Parameters
----------
theMut: BRepGraph_MutGuard<BRepGraphInc::CoEdgeDef>

Return
-------
None

Description
-----------
No available documentation.
") ResetPCurveBinding;
		void ResetPCurveBinding(BRepGraph_MutGuard<BRepGraphInc::CoEdgeDef> & theMut);

		/****** BRepGraph_EditorView_CoEdgeOps::SetChildEdgeId ******/
		/****** md5 signature: 2bf2bd5ceab2f3e7ef1a3fe1a5928d35 ******/
		%feature("compactdefaultargs") SetChildEdgeId;
		%feature("autodoc", "
Parameters
----------
theCoEdge: BRepGraph_CoEdgeId
theEdge: BRepGraph_EdgeId

Return
-------
None

Description
-----------
Rewire a coedge to a different child edge and rebind edge parent/use relations.
") SetChildEdgeId;
		void SetChildEdgeId(const BRepGraph_CoEdgeId theCoEdge, const BRepGraph_EdgeId theEdge);

		/****** BRepGraph_EditorView_CoEdgeOps::SetChildEdgeId ******/
		/****** md5 signature: 961b59d51a34facaca0508e05dddc438 ******/
		%feature("compactdefaultargs") SetChildEdgeId;
		%feature("autodoc", "
Parameters
----------
theMut: BRepGraph_MutGuard<BRepGraphInc::CoEdgeDef>
theEdge: BRepGraph_EdgeId

Return
-------
None

Description
-----------
No available documentation.
") SetChildEdgeId;
		void SetChildEdgeId(BRepGraph_MutGuard<BRepGraphInc::CoEdgeDef> & theMut, const BRepGraph_EdgeId theEdge);

		/****** BRepGraph_EditorView_CoEdgeOps::SetFaceId ******/
		/****** md5 signature: 109311c2edecbfacfa501abb82ea2623 ******/
		%feature("compactdefaultargs") SetFaceId;
		%feature("autodoc", "
Parameters
----------
theCoEdge: BRepGraph_CoEdgeId
theFace: BRepGraph_FaceId

Return
-------
None

Description
-----------
Rewire a coedge to a different owning face and rebind edge-to-face relations.
") SetFaceId;
		void SetFaceId(const BRepGraph_CoEdgeId theCoEdge, const BRepGraph_FaceId theFace);

		/****** BRepGraph_EditorView_CoEdgeOps::SetFaceId ******/
		/****** md5 signature: 747e973708848924f65fb2286831e43c ******/
		%feature("compactdefaultargs") SetFaceId;
		%feature("autodoc", "
Parameters
----------
theMut: BRepGraph_MutGuard<BRepGraphInc::CoEdgeDef>
theFace: BRepGraph_FaceId

Return
-------
None

Description
-----------
No available documentation.
") SetFaceId;
		void SetFaceId(BRepGraph_MutGuard<BRepGraphInc::CoEdgeDef> & theMut, const BRepGraph_FaceId theFace);

		/****** BRepGraph_EditorView_CoEdgeOps::SetOrientation ******/
		/****** md5 signature: d5641495bded57af240ea26f39257c1d ******/
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "
Parameters
----------
theCoEdge: BRepGraph_CoEdgeId
theOrientation: BRepGraphInc::ParityOrientation

Return
-------
None

Description
-----------
Set the orientation of a coedge definition.
") SetOrientation;
		void SetOrientation(const BRepGraph_CoEdgeId theCoEdge, const BRepGraphInc::ParityOrientation theOrientation);

		/****** BRepGraph_EditorView_CoEdgeOps::SetOrientation ******/
		/****** md5 signature: a8558250192f0afd4a4d2ae7a2665f0f ******/
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "
Parameters
----------
theMut: BRepGraph_MutGuard<BRepGraphInc::CoEdgeDef>
theOrientation: BRepGraphInc::ParityOrientation

Return
-------
None

Description
-----------
No available documentation.
") SetOrientation;
		void SetOrientation(BRepGraph_MutGuard<BRepGraphInc::CoEdgeDef> & theMut, const BRepGraphInc::ParityOrientation theOrientation);

		/****** BRepGraph_EditorView_CoEdgeOps::SetPCurve ******/
		/****** md5 signature: a21e234134e680601646d0abf229e8ab ******/
		%feature("compactdefaultargs") SetPCurve;
		%feature("autodoc", "
Parameters
----------
theCoEdge: BRepGraph_CoEdgeId
theCurve2d: Geom2d_Curve

Return
-------
None

Description
-----------
Assign or clear the PCurve bound to an existing coedge. Creates a new Curve2DRep for non-null curves and stores its id on the coedge. Pass a null handle to clear the stored PCurve binding. 
Input parameter: theCoEdge typed coedge identifier to update 
Input parameter: theCurve2d new 2D curve geometry, or null to clear.
") SetPCurve;
		void SetPCurve(const BRepGraph_CoEdgeId theCoEdge, const opencascade::handle<Geom2d_Curve> & theCurve2d);

		/****** BRepGraph_EditorView_CoEdgeOps::SetPCurve ******/
		/****** md5 signature: 85cb5bfbd778fc40193eaf050c3ace19 ******/
		%feature("compactdefaultargs") SetPCurve;
		%feature("autodoc", "
Parameters
----------
theCoEdge: BRepGraph_CoEdgeId
theCurve2d: Geom2d_Curve
theFirst: double
theLast: double

Return
-------
None

Description
-----------
Set the PCurve on a coedge. Creates an owned CoEdgeCurve2DRep record. 
Input parameter: theCoEdge coedge definition identifier 
Input parameter: theCurve2d 2D curve geometry (must not be null) 
Input parameter: theFirst first curve parameter 
Input parameter: theLast last curve parameter.
") SetPCurve;
		void SetPCurve(const BRepGraph_CoEdgeId theCoEdge, const opencascade::handle<Geom2d_Curve> & theCurve2d, const double theFirst, const double theLast);

		/****** BRepGraph_EditorView_CoEdgeOps::SetParamRange ******/
		/****** md5 signature: 413d398cf3896d0c7513fe05d96e11a4 ******/
		%feature("compactdefaultargs") SetParamRange;
		%feature("autodoc", "
Parameters
----------
theCoEdge: BRepGraph_CoEdgeId
theFirst: double
theLast: double

Return
-------
None

Description
-----------
Set the parametric range of a coedge definition and fire immediate notification. 
Input parameter: theCoEdge typed coedge definition identifier 
Input parameter: theFirst new first parameter value 
Input parameter: theLast new last parameter value.
") SetParamRange;
		void SetParamRange(const BRepGraph_CoEdgeId theCoEdge, double theFirst, double theLast);

		/****** BRepGraph_EditorView_CoEdgeOps::SetParamRange ******/
		/****** md5 signature: 289b1f81b5de5bd28019cc796fe8d441 ******/
		%feature("compactdefaultargs") SetParamRange;
		%feature("autodoc", "
Parameters
----------
theMut: BRepGraph_MutGuard<BRepGraphInc::CoEdgeDef>
theFirst: double
theLast: double

Return
-------
None

Description
-----------
Set the parametric range of a coedge definition inside a batched mutation scope. 
Input parameter: theMut active mutable coedge guard 
Input parameter: theFirst new first parameter value 
Input parameter: theLast new last parameter value.
") SetParamRange;
		void SetParamRange(BRepGraph_MutGuard<BRepGraphInc::CoEdgeDef> & theMut, double theFirst, double theLast);

		/****** BRepGraph_EditorView_CoEdgeOps::SetPersistentPolygon2D ******/
		/****** md5 signature: f94a03555d4de9589b5d8f15f2a10f95 ******/
		%feature("compactdefaultargs") SetPersistentPolygon2D;
		%feature("autodoc", "
Parameters
----------
theCoEdge: BRepGraph_CoEdgeId
thePolygon: Poly_Polygon2D

Return
-------
None

Description
-----------
Set the persistent 2D polygon on a coedge. 
Input parameter: theCoEdge coedge definition identifier 
Input parameter: thePolygon 2D polygon (must not be null).
") SetPersistentPolygon2D;
		void SetPersistentPolygon2D(const BRepGraph_CoEdgeId theCoEdge, const opencascade::handle<Poly_Polygon2D> & thePolygon);

		/****** BRepGraph_EditorView_CoEdgeOps::SetPersistentPolygonOnTri ******/
		/****** md5 signature: 6fc57731344ccca3fa748d4821f09c55 ******/
		%feature("compactdefaultargs") SetPersistentPolygonOnTri;
		%feature("autodoc", "
Parameters
----------
theCoEdge: BRepGraph_CoEdgeId
thePolygon: Poly_PolygonOnTriangulation

Return
-------
None

Description
-----------
Set the persistent polygon-on-triangulation on a coedge. The triangulation is resolved via CoEdgeDef.FaceId -> FaceDef.TriangulationRepId. 
Input parameter: theCoEdge coedge definition identifier 
Input parameter: thePolygon polygon-on-triangulation (must not be null).
") SetPersistentPolygonOnTri;
		void SetPersistentPolygonOnTri(const BRepGraph_CoEdgeId theCoEdge, const opencascade::handle<Poly_PolygonOnTriangulation> & thePolygon);

};


%extend BRepGraph_EditorView_CoEdgeOps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class BRepGraph_EditorView_CompSolidOps *
******************************************/
%nodefaultctor BRepGraph_EditorView_CompSolidOps;
class BRepGraph_EditorView_CompSolidOps {
	public:
		/****** BRepGraph_EditorView_CompSolidOps::Add ******/
		/****** md5 signature: fc9bb8db98b1018283b355d539baf409 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theSolidEntities: NCollection_Array1<BRepGraph_SolidId>

Return
-------
BRepGraph_CompSolidId

Description
-----------
Add a compsolid entity with ordered solid usages. 
Input parameter: theSolidEntities typed child solid identifiers 
Return: typed compsolid definition identifier.
") Add;
		BRepGraph_CompSolidId Add(const NCollection_Array1<BRepGraph_SolidId> & theSolidEntities);

		/****** BRepGraph_EditorView_CompSolidOps::Append ******/
		/****** md5 signature: 09beffa237571d67098647949d477fb8 ******/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "
Parameters
----------
theCompSolidEntity: BRepGraph_CompSolidId
theSolidEntity: BRepGraph_SolidId
theOri: BRepGraphInc::ParityOrientation (optional, default to TopAbs_FORWARD)

Return
-------
BRepGraph_SolidRefId

Description
-----------
Append a single solid to an existing compsolid definition. 
Input parameter: theCompSolidEntity typed compsolid definition identifier 
Input parameter: theSolidEntity typed solid definition identifier 
Input parameter: theOri orientation of the solid in the compsolid 
Return: typed solid reference identifier, or invalid if inputs are not active.
") Append;
		BRepGraph_SolidRefId Append(const BRepGraph_CompSolidId theCompSolidEntity, const BRepGraph_SolidId theSolidEntity, const BRepGraphInc::ParityOrientation theOri = TopAbs_FORWARD);

		/****** BRepGraph_EditorView_CompSolidOps::Append ******/
		/****** md5 signature: 7df07d935959451920ed9179630a5b5e ******/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "
Parameters
----------
theCompSolidEntity: BRepGraph_CompSolidId
theSolidIds: NCollection_Array1<BRepGraph_SolidId>
theOrientations: NCollection_Array1<BRepGraphInc::ParityOrientation> (optional, default to NCollection_Array1<BRepGraphInc::ParityOrientation>())

Return
-------
NCollection_Array1<BRepGraph_SolidRefId >

Description
-----------
Batch-append multiple solids to an existing compsolid definition. Two-pass: validates all inputs first, then links all. 
Input parameter: theCompSolidEntity typed compsolid definition identifier 
Input parameter: theSolidIds solid definition identifiers to append 
Input parameter: theOrientations optional parity orientations (empty = all FORWARD) 
Return: array of created solid reference ids, empty on validation failure.
") Append;
		NCollection_Array1<BRepGraph_SolidRefId > Append(const BRepGraph_CompSolidId theCompSolidEntity, const NCollection_Array1<BRepGraph_SolidId> & theSolidIds, const NCollection_Array1<BRepGraphInc::ParityOrientation> & theOrientations = NCollection_Array1<BRepGraphInc::ParityOrientation>());

		/****** BRepGraph_EditorView_CompSolidOps::RemoveSolid ******/
		/****** md5 signature: b623821d809d57625ae69c23a3a6a537 ******/
		%feature("compactdefaultargs") RemoveSolid;
		%feature("autodoc", "
Parameters
----------
theCompChildSolidId: BRepGraph_CompSolidId
theSolidRefId: BRepGraph_SolidRefId

Return
-------
bool

Description
-----------
Detach one exact solid ref from a compsolid definition. Use BRepGraph_RefsSolidOfCompSolid::CurrentId() when removing from a compsolid iterator. The method removes the exact SolidRef entry, erases it from the compsolid's ordered ref sequence, updates relation tables, and prunes the Solid subtree when it has no other active usages. 
Input parameter: theCompChildSolidId compsolid definition identifier 
Input parameter: theSolidRefId exact compsolid-owned solid reference identifier 
Return: true if the active compsolid-owned usage was removed.
") RemoveSolid;
		bool RemoveSolid(const BRepGraph_CompSolidId theCompChildSolidId, const BRepGraph_SolidRefId theSolidRefId);

		/****** BRepGraph_EditorView_CompSolidOps::RemoveSolids ******/
		/****** md5 signature: d42e41156e2ede12fc590c7a7bbdafff ******/
		%feature("compactdefaultargs") RemoveSolids;
		%feature("autodoc", "
Parameters
----------
theCompSolidId: BRepGraph_CompSolidId
theSolidRefs: NCollection_Array1<BRepGraph_SolidRefId>

Return
-------
bool

Description
-----------
Batch-remove multiple solid refs from a compsolid definition. All-or-nothing: validates all inputs first, then removes all. 
Input parameter: theCompSolidId compsolid definition identifier 
Input parameter: theSolidRefs solid reference identifiers to remove 
Return: true if all refs were successfully removed.
") RemoveSolids;
		bool RemoveSolids(const BRepGraph_CompSolidId theCompSolidId, const NCollection_Array1<BRepGraph_SolidRefId> & theSolidRefs);

		/****** BRepGraph_EditorView_CompSolidOps::ReplaceSolid ******/
		/****** md5 signature: 4262fc249f7c958d566f6e22c8eb0ece ******/
		%feature("compactdefaultargs") ReplaceSolid;
		%feature("autodoc", "
Parameters
----------
theSolidRef: BRepGraph_SolidRefId
theNewSolid: BRepGraph_SolidId

Return
-------
None

Description
-----------
Replace the solid of an existing solid reference in a compsolid. Delegates to Solids().SetRefChildSolidId(). 
Input parameter: theSolidRef typed solid reference identifier 
Input parameter: theNewSolid new solid definition identifier.
") ReplaceSolid;
		void ReplaceSolid(const BRepGraph_SolidRefId theSolidRef, const BRepGraph_SolidId theNewSolid);

};


%extend BRepGraph_EditorView_CompSolidOps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class BRepGraph_EditorView_CompoundOps *
*****************************************/
%nodefaultctor BRepGraph_EditorView_CompoundOps;
class BRepGraph_EditorView_CompoundOps {
	public:
		/****** BRepGraph_EditorView_CompoundOps::Add ******/
		/****** md5 signature: 206280996873cf9f104676b2d8cf4cec ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theChildEntities: NCollection_Array1<BRepGraph_NodeId>

Return
-------
BRepGraph_CompoundId

Description
-----------
Add a compound entity with ordered child usages. 
Input parameter: theChildEntities child node identifiers 
Return: typed compound definition identifier.
") Add;
		BRepGraph_CompoundId Add(const NCollection_Array1<BRepGraph_NodeId> & theChildEntities);

		/****** BRepGraph_EditorView_CompoundOps::Append ******/
		/****** md5 signature: ee43156d1999ba7e210c5f235ff90a38 ******/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "
Parameters
----------
theCompoundEntity: BRepGraph_CompoundId
theChildEntity: BRepGraph_NodeId
theOri: BRepGraphInc::ParityOrientation (optional, default to TopAbs_FORWARD)

Return
-------
BRepGraph_ChildRefId

Description
-----------
Append a single child to an existing compound definition. 
Input parameter: theCompoundEntity typed compound definition identifier 
Input parameter: theChildEntity typed child topology definition identifier 
Input parameter: theOri orientation of the child in the compound 
Return: typed child reference identifier, or invalid if inputs are not active.
") Append;
		BRepGraph_ChildRefId Append(const BRepGraph_CompoundId theCompoundEntity, const BRepGraph_NodeId theChildEntity, const BRepGraphInc::ParityOrientation theOri = TopAbs_FORWARD);

		/****** BRepGraph_EditorView_CompoundOps::Append ******/
		/****** md5 signature: d101af33d74c18a0135c555d3571300b ******/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "
Parameters
----------
theCompoundEntity: BRepGraph_CompoundId
theChildIds: NCollection_Array1<BRepGraph_NodeId>
theOrientations: NCollection_Array1<BRepGraphInc::ParityOrientation> (optional, default to NCollection_Array1<BRepGraphInc::ParityOrientation>())

Return
-------
NCollection_Array1<BRepGraph_ChildRefId >

Description
-----------
Batch-append multiple children to an existing compound definition. Two-pass: validates all inputs first, then links all. 
Input parameter: theCompoundEntity typed compound definition identifier 
Input parameter: theChildIds child node identifiers to append 
Input parameter: theOrientations optional parity orientations (empty = all FORWARD) 
Return: array of created child reference ids, empty on validation failure.
") Append;
		NCollection_Array1<BRepGraph_ChildRefId > Append(const BRepGraph_CompoundId theCompoundEntity, const NCollection_Array1<BRepGraph_NodeId> & theChildIds, const NCollection_Array1<BRepGraphInc::ParityOrientation> & theOrientations = NCollection_Array1<BRepGraphInc::ParityOrientation>());

		/****** BRepGraph_EditorView_CompoundOps::RemoveChild ******/
		/****** md5 signature: 26bbb5f6580b04a2c3f521dd8c78fb83 ******/
		%feature("compactdefaultargs") RemoveChild;
		%feature("autodoc", "
Parameters
----------
theCompoundDefId: BRepGraph_CompoundId
theChildRefId: BRepGraph_ChildRefId

Return
-------
bool

Description
-----------
Detach one exact child ref from a compound definition. Use BRepGraph_RefsChildOfParent::CurrentId() when removing from a compound iterator. The method removes the exact ChildRef entry, erases it from the compound's ordered ref sequence, updates relation tables, and prunes the child subtree when it has no other active usages. 
Input parameter: theCompoundDefId compound definition identifier 
Input parameter: theChildRefId exact compound-owned child reference identifier 
Return: true if the active compound-owned usage was removed.
") RemoveChild;
		bool RemoveChild(const BRepGraph_CompoundId theCompoundDefId, const BRepGraph_ChildRefId theChildRefId);

		/****** BRepGraph_EditorView_CompoundOps::RemoveChildren ******/
		/****** md5 signature: 3a0a7221b73aa4bec9c71f332c168a1f ******/
		%feature("compactdefaultargs") RemoveChildren;
		%feature("autodoc", "
Parameters
----------
theCompoundId: BRepGraph_CompoundId
theChildRefs: NCollection_Array1<BRepGraph_ChildRefId>

Return
-------
bool

Description
-----------
Batch-remove multiple child refs from a compound definition. All-or-nothing: validates all inputs first, then removes all. 
Input parameter: theCompoundId compound definition identifier 
Input parameter: theChildRefs child reference identifiers to remove 
Return: true if all refs were successfully removed.
") RemoveChildren;
		bool RemoveChildren(const BRepGraph_CompoundId theCompoundId, const NCollection_Array1<BRepGraph_ChildRefId> & theChildRefs);

		/****** BRepGraph_EditorView_CompoundOps::ReplaceChild ******/
		/****** md5 signature: 722501f99a7444a8fe901d33a2e839b1 ******/
		%feature("compactdefaultargs") ReplaceChild;
		%feature("autodoc", "
Parameters
----------
theChildRef: BRepGraph_ChildRefId
theNewChild: BRepGraph_NodeId

Return
-------
None

Description
-----------
Replace the child node of an existing child reference in a compound. Delegates to Gen().SetChildRefChildNodeId(). 
Input parameter: theChildRef typed child reference identifier 
Input parameter: theNewChild new child node identifier.
") ReplaceChild;
		void ReplaceChild(const BRepGraph_ChildRefId theChildRef, const BRepGraph_NodeId theNewChild);

};


%extend BRepGraph_EditorView_CompoundOps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class BRepGraph_EditorView_EdgeOps *
*************************************/
%nodefaultctor BRepGraph_EditorView_EdgeOps;
class BRepGraph_EditorView_EdgeOps {
	public:
		/****** BRepGraph_EditorView_EdgeOps::Add ******/
		/****** md5 signature: e81fe9d5195992f4d776ffb56652afa7 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theStartVtx: BRepGraph_VertexId
theEndVtx: BRepGraph_VertexId
theCurve: Geom_Curve
theFirst: double
theLast: double
theTolerance: double

Return
-------
BRepGraph_EdgeId

Description
-----------
Add an edge definition to the graph. 
Input parameter: theStartVtx typed start vertex definition identifier 
Input parameter: theEndVtx typed end vertex definition identifier 
Input parameter: theCurve 3D curve (may be null for degenerate edges) 
Input parameter: theFirst first curve parameter 
Input parameter: theLast last curve parameter 
Input parameter: theTolerance edge tolerance 
Return: typed edge definition identifier, or invalid if either referenced vertex id is out of range or removed.
") Add;
		BRepGraph_EdgeId Add(const BRepGraph_VertexId theStartVtx, const BRepGraph_VertexId theEndVtx, const opencascade::handle<Geom_Curve> & theCurve, const double theFirst, const double theLast, const double theTolerance);

		/****** BRepGraph_EditorView_EdgeOps::ClearCurve ******/
		/****** md5 signature: 3af8bc91dc929f686907d22e6a73936e ******/
		%feature("compactdefaultargs") ClearCurve;
		%feature("autodoc", "
Parameters
----------
theEdge: BRepGraph_EdgeId

Return
-------
None

Description
-----------
Clear the 3D curve on an edge. Removes the owned use record binding. 
Input parameter: theEdge edge definition identifier.
") ClearCurve;
		void ClearCurve(const BRepGraph_EdgeId theEdge);

		/****** BRepGraph_EditorView_EdgeOps::ClearPersistentPolygon3D ******/
		/****** md5 signature: 05cbf5ee49d015da0404cfcf3b70f905 ******/
		%feature("compactdefaultargs") ClearPersistentPolygon3D;
		%feature("autodoc", "
Parameters
----------
theEdge: BRepGraph_EdgeId

Return
-------
None

Description
-----------
Clear the persistent 3D polygon on an edge. 
Input parameter: theEdge edge definition identifier.
") ClearPersistentPolygon3D;
		void ClearPersistentPolygon3D(const BRepGraph_EdgeId theEdge);

		/****** BRepGraph_EditorView_EdgeOps::RemoveVertex ******/
		/****** md5 signature: b7180e1a3eb556f1e3316cb51866e221 ******/
		%feature("compactdefaultargs") RemoveVertex;
		%feature("autodoc", "
Parameters
----------
theChildEdgeId: BRepGraph_EdgeId
theVertexRefId: BRepGraph_VertexRefId

Return
-------
bool

Description
-----------
Detach one exact edge-owned vertex ref from an edge definition. Supports only the persisted boundary slots (StartVertexRefId / EndVertexRefId). Supplemental direct-vertex usages are stored in BRepGraph_LayerTopoSupplement and are not removed through this API. 
Input parameter: theChildEdgeId edge definition identifier 
Input parameter: theVertexRefId exact edge-owned vertex reference identifier 
Return: true if the active edge-owned usage was removed.
") RemoveVertex;
		bool RemoveVertex(const BRepGraph_EdgeId theChildEdgeId, const BRepGraph_VertexRefId theVertexRefId);

		/****** BRepGraph_EditorView_EdgeOps::ReplaceVertex ******/
		/****** md5 signature: 755f2c88b94e55fbe33f621899352756 ******/
		%feature("compactdefaultargs") ReplaceVertex;
		%feature("autodoc", "
Parameters
----------
theChildEdgeId: BRepGraph_EdgeId
theOldVertexRefId: BRepGraph_VertexRefId
theNewChildVertexId: BRepGraph_VertexId

Return
-------
BRepGraph_VertexRefId

Description
-----------
Remap one edge-owned vertex reference to point at a different vertex definition, preserving the existing orientation and local location. Intended for boundary-vertex substitution without a full edge rebuild (e.g. stitching shared endpoints after a ShapeFix pass). 
Input parameter: theChildEdgeId edge owning the vertex reference 
Input parameter: theOldVertexRefId exact boundary vertex reference to remap 
Input parameter: theNewChildVertexId replacement vertex definition 
Return: typed id of the newly created vertex reference, or invalid if any input was inactive or the old ref did not belong to this edge.
") ReplaceVertex;
		BRepGraph_VertexRefId ReplaceVertex(const BRepGraph_EdgeId theChildEdgeId, const BRepGraph_VertexRefId theOldVertexRefId, const BRepGraph_VertexId theNewChildVertexId);

		/****** BRepGraph_EditorView_EdgeOps::Reverse ******/
		/****** md5 signature: ed3d64b69ee95c4d49ce0d30fdc4592c ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "
Parameters
----------
theEdge: BRepGraph_EdgeId

Return
-------
None

Description
-----------
Reverse the edge: swap StartVertexRefId and EndVertexRefId. Used by healing/sewing when a caller wants the edge's boundary order flipped. Does not alter the parametric range (callers needing reparametrization should follow up with SetParamRange). 
Input parameter: theEdge edge definition identifier.
") Reverse;
		void Reverse(const BRepGraph_EdgeId theEdge);

		/****** BRepGraph_EditorView_EdgeOps::SetCurve ******/
		/****** md5 signature: 338a715ebd06f5e5493c9db5c3cc1661 ******/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "
Parameters
----------
theEdge: BRepGraph_EdgeId
theCurve: Geom_Curve
theFirst: double
theLast: double

Return
-------
None

Description
-----------
Set the 3D curve on an edge. Creates an owned EdgeCurve3DRep record and an associated Curve3DRep for edge geometry access. 
Input parameter: theEdge edge definition identifier 
Input parameter: theCurve 3D curve geometry (must not be null) 
Input parameter: theFirst first curve parameter 
Input parameter: theLast last curve parameter.
") SetCurve;
		void SetCurve(const BRepGraph_EdgeId theEdge, const opencascade::handle<Geom_Curve> & theCurve, const double theFirst, const double theLast);

		/****** BRepGraph_EditorView_EdgeOps::SetEndVertexRefId ******/
		/****** md5 signature: e5cecc66926aef047d7c037a19a75132 ******/
		%feature("compactdefaultargs") SetEndVertexRefId;
		%feature("autodoc", "
Parameters
----------
theEdge: BRepGraph_EdgeId
theVertexRef: BRepGraph_VertexRefId

Return
-------
None

Description
-----------
Set the end vertex-ref id and rebind the vertex-to-edge relation.
") SetEndVertexRefId;
		void SetEndVertexRefId(const BRepGraph_EdgeId theEdge, const BRepGraph_VertexRefId theVertexRef);

		/****** BRepGraph_EditorView_EdgeOps::SetEndVertexRefId ******/
		/****** md5 signature: 8972c08f4a8aeecec112f6c1ab673c76 ******/
		%feature("compactdefaultargs") SetEndVertexRefId;
		%feature("autodoc", "
Parameters
----------
theMut: BRepGraph_MutGuard<BRepGraphInc::EdgeDef>
theVertexRef: BRepGraph_VertexRefId

Return
-------
None

Description
-----------
No available documentation.
") SetEndVertexRefId;
		void SetEndVertexRefId(BRepGraph_MutGuard<BRepGraphInc::EdgeDef> & theMut, const BRepGraph_VertexRefId theVertexRef);

		/****** BRepGraph_EditorView_EdgeOps::SetParamRange ******/
		/****** md5 signature: f4043f31e16ecc0e3fa4fee331cc5b16 ******/
		%feature("compactdefaultargs") SetParamRange;
		%feature("autodoc", "
Parameters
----------
theEdge: BRepGraph_EdgeId
theFirst: double
theLast: double

Return
-------
None

Description
-----------
Set the parametric range of an edge definition.
") SetParamRange;
		void SetParamRange(const BRepGraph_EdgeId theEdge, const double theFirst, const double theLast);

		/****** BRepGraph_EditorView_EdgeOps::SetParamRange ******/
		/****** md5 signature: c2974080093d1dde61a8ee26355efbe7 ******/
		%feature("compactdefaultargs") SetParamRange;
		%feature("autodoc", "
Parameters
----------
theMut: BRepGraph_MutGuard<BRepGraphInc::EdgeDef>
theFirst: double
theLast: double

Return
-------
None

Description
-----------
No available documentation.
") SetParamRange;
		void SetParamRange(BRepGraph_MutGuard<BRepGraphInc::EdgeDef> & theMut, const double theFirst, const double theLast);

		/****** BRepGraph_EditorView_EdgeOps::SetPersistentPolygon3D ******/
		/****** md5 signature: 0703477c42d043ef11cd8a4ca60eec6b ******/
		%feature("compactdefaultargs") SetPersistentPolygon3D;
		%feature("autodoc", "
Parameters
----------
theEdge: BRepGraph_EdgeId
thePolygon: Poly_Polygon3D

Return
-------
None

Description
-----------
Set the persistent 3D polygon on an edge. Creates an owned EdgePolygon3DRep record. 
Input parameter: theEdge edge definition identifier 
Input parameter: thePolygon 3D polygon (must not be null).
") SetPersistentPolygon3D;
		void SetPersistentPolygon3D(const BRepGraph_EdgeId theEdge, const opencascade::handle<Poly_Polygon3D> & thePolygon);

		/****** BRepGraph_EditorView_EdgeOps::SetStartVertexRefId ******/
		/****** md5 signature: f1165d79f9da3e6cd4c8645a8674c5f5 ******/
		%feature("compactdefaultargs") SetStartVertexRefId;
		%feature("autodoc", "
Parameters
----------
theEdge: BRepGraph_EdgeId
theVertexRef: BRepGraph_VertexRefId

Return
-------
None

Description
-----------
Set the start vertex-ref id and rebind the vertex-to-edge relation.
") SetStartVertexRefId;
		void SetStartVertexRefId(const BRepGraph_EdgeId theEdge, const BRepGraph_VertexRefId theVertexRef);

		/****** BRepGraph_EditorView_EdgeOps::SetStartVertexRefId ******/
		/****** md5 signature: d9adaca7ed4432f275677985c038bfab ******/
		%feature("compactdefaultargs") SetStartVertexRefId;
		%feature("autodoc", "
Parameters
----------
theMut: BRepGraph_MutGuard<BRepGraphInc::EdgeDef>
theVertexRef: BRepGraph_VertexRefId

Return
-------
None

Description
-----------
No available documentation.
") SetStartVertexRefId;
		void SetStartVertexRefId(BRepGraph_MutGuard<BRepGraphInc::EdgeDef> & theMut, const BRepGraph_VertexRefId theVertexRef);

		/****** BRepGraph_EditorView_EdgeOps::SetTolerance ******/
		/****** md5 signature: b818861539c47dd915854d38875029ad ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
theEdge: BRepGraph_EdgeId
theTolerance: double

Return
-------
None

Description
-----------
Set the tolerance of an edge definition and fire immediate notification. 
Input parameter: theEdge typed edge definition identifier 
Input parameter: theTolerance new tolerance value.
") SetTolerance;
		void SetTolerance(const BRepGraph_EdgeId theEdge, double theTolerance);

		/****** BRepGraph_EditorView_EdgeOps::SetTolerance ******/
		/****** md5 signature: cedd243e4154152565c1fade52c2b6bf ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
theMut: BRepGraph_MutGuard<BRepGraphInc::EdgeDef>
theTolerance: double

Return
-------
None

Description
-----------
Set the tolerance of an edge definition inside a batched mutation scope. 
Input parameter: theMut active mutable edge guard 
Input parameter: theTolerance new tolerance value.
") SetTolerance;
		void SetTolerance(BRepGraph_MutGuard<BRepGraphInc::EdgeDef> & theMut, double theTolerance);

		/****** BRepGraph_EditorView_EdgeOps::Split ******/
		/****** md5 signature: 5dfa94fa2dafa71a80ed00dd1f9adca1 ******/
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "
Parameters
----------
theEdgeEntity: BRepGraph_EdgeId
theSplitVertex: BRepGraph_VertexId
theSplitParam: double
theSubA: BRepGraph_EdgeId
theSubB: BRepGraph_EdgeId

Return
-------
None

Description
-----------
Split a single edge definition at a vertex and 3D-curve parameter. Creates two new EdgeDef slots, splits all PCurve nodes at the corresponding 2D parameter, and updates every wire that contained the original edge. 
Input parameter: theEdgeEntity edge to split (must not be degenerate) 
Input parameter: theSplitVertex vertex definition at the split point (already in graph) 
Input parameter: theSplitParam parameter on the 3D curve at the split point @param[out] theSubA sub-edge: StartVertex -> SplitVertex @param[out] theSubB sub-edge: SplitVertex -> EndVertex.
") Split;
		void Split(const BRepGraph_EdgeId theEdgeEntity, const BRepGraph_VertexId theSplitVertex, const double theSplitParam, BRepGraph_EdgeId & theSubA, BRepGraph_EdgeId & theSubB);

};


%extend BRepGraph_EditorView_EdgeOps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class BRepGraph_EditorView_FaceOps *
*************************************/
%nodefaultctor BRepGraph_EditorView_FaceOps;
class BRepGraph_EditorView_FaceOps {
	public:
		/****** BRepGraph_EditorView_FaceOps::Add ******/
		/****** md5 signature: a9ca1ee65544aad8df3062410996492b ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theSurface: Geom_Surface
theOuterWire: BRepGraph_WireId
theInnerWires: NCollection_Array1<BRepGraph_WireId>
theTolerance: double

Return
-------
BRepGraph_FaceId

Description
-----------
Add a face definition to the graph. 
Input parameter: theSurface surface geometry 
Input parameter: theOuterWire typed outer wire definition identifier 
Input parameter: theInnerWires typed inner wire definition identifiers 
Input parameter: theTolerance face tolerance 
Return: typed face definition identifier, or invalid if any referenced wire id is out of range or removed.
") Add;
		BRepGraph_FaceId Add(const opencascade::handle<Geom_Surface> & theSurface, const BRepGraph_WireId theOuterWire, const NCollection_Array1<BRepGraph_WireId> & theInnerWires, const double theTolerance);

		/****** BRepGraph_EditorView_FaceOps::Append ******/
		/****** md5 signature: 6a8b39902c7cb2f83af1c3941a70cbfb ******/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "
Parameters
----------
theFaceEntity: BRepGraph_FaceId
theWireEntity: BRepGraph_WireId
theOri: BRepGraphInc::ParityOrientation (optional, default to TopAbs_FORWARD)

Return
-------
BRepGraph_WireRefId

Description
-----------
Append a wire usage to an existing face definition. 
Input parameter: theFaceEntity typed face definition identifier 
Input parameter: theWireEntity typed wire definition identifier 
Input parameter: theOri orientation of the wire usage on the face 
Return: typed wire reference identifier, or invalid if inputs are not active.
") Append;
		BRepGraph_WireRefId Append(const BRepGraph_FaceId theFaceEntity, const BRepGraph_WireId theWireEntity, const BRepGraphInc::ParityOrientation theOri = TopAbs_FORWARD);

		/****** BRepGraph_EditorView_FaceOps::ClearPersistentTriangulation ******/
		/****** md5 signature: 6ea9490179592615d0c18bccbdc06d6f ******/
		%feature("compactdefaultargs") ClearPersistentTriangulation;
		%feature("autodoc", "
Parameters
----------
theFace: BRepGraph_FaceId

Return
-------
None

Description
-----------
Clear the persistent triangulation on a face. 
Input parameter: theFace face definition identifier.
") ClearPersistentTriangulation;
		void ClearPersistentTriangulation(const BRepGraph_FaceId theFace);

		/****** BRepGraph_EditorView_FaceOps::ClearSurface ******/
		/****** md5 signature: d03263f7e42bd8b6f4b3b952556f211e ******/
		%feature("compactdefaultargs") ClearSurface;
		%feature("autodoc", "
Parameters
----------
theFace: BRepGraph_FaceId

Return
-------
None

Description
-----------
Clear the surface on a face. Removes the owned use record binding. 
Input parameter: theFace face definition identifier.
") ClearSurface;
		void ClearSurface(const BRepGraph_FaceId theFace);

		/****** BRepGraph_EditorView_FaceOps::RemoveWire ******/
		/****** md5 signature: f13126749e42c0d36e1ef7e1158ae72d ******/
		%feature("compactdefaultargs") RemoveWire;
		%feature("autodoc", "
Parameters
----------
theFaceId: BRepGraph_FaceId
theWireRefId: BRepGraph_WireRefId

Return
-------
bool

Description
-----------
Detach one exact wire ref from a face definition. Use BRepGraph_RefsWireOfFace::CurrentId() when removing from a face iterator. The method removes the exact WireRef entry, erases it from the face's ordered ref sequence, updates relation tables, and prunes the Wire subtree when it has no other active usages. 
Input parameter: theFaceId face definition identifier 
Input parameter: theWireRefId exact face-owned wire reference identifier 
Return: true if the active face-owned usage was removed.
") RemoveWire;
		bool RemoveWire(const BRepGraph_FaceId theFaceId, const BRepGraph_WireRefId theWireRefId);

		/****** BRepGraph_EditorView_FaceOps::SetPersistentTriangulation ******/
		/****** md5 signature: 3ecbd0954ebb42fc22c1f926c5a0460c ******/
		%feature("compactdefaultargs") SetPersistentTriangulation;
		%feature("autodoc", "
Parameters
----------
theFace: BRepGraph_FaceId
theTriangulation: Poly_Triangulation

Return
-------
None

Description
-----------
Set the persistent triangulation on a face. Creates an owned FaceTriangulationRep record. Also creates a TriangulationRep for backward compatibility. 
Input parameter: theFace face definition identifier 
Input parameter: theTriangulation triangulation mesh (must not be null).
") SetPersistentTriangulation;
		void SetPersistentTriangulation(const BRepGraph_FaceId theFace, const opencascade::handle<Poly_Triangulation> & theTriangulation);

		/****** BRepGraph_EditorView_FaceOps::SetRefFaceId ******/
		/****** md5 signature: c8766a6dcac8862e033896316cd078fa ******/
		%feature("compactdefaultargs") SetRefFaceId;
		%feature("autodoc", "
Parameters
----------
theFaceRef: BRepGraph_FaceRefId
theFace: BRepGraph_FaceId

Return
-------
None

Description
-----------
Rewire a face reference to a different face def (rebinds FaceToShells if parent is Shell).
") SetRefFaceId;
		void SetRefFaceId(const BRepGraph_FaceRefId theFaceRef, const BRepGraph_FaceId theFace);

		/****** BRepGraph_EditorView_FaceOps::SetRefFaceId ******/
		/****** md5 signature: 82c48909ee92ab377b5c7bfa776c2e0f ******/
		%feature("compactdefaultargs") SetRefFaceId;
		%feature("autodoc", "
Parameters
----------
theMut: BRepGraph_MutGuard<BRepGraphInc::FaceRef>
theFace: BRepGraph_FaceId

Return
-------
None

Description
-----------
No available documentation.
") SetRefFaceId;
		void SetRefFaceId(BRepGraph_MutGuard<BRepGraphInc::FaceRef> & theMut, const BRepGraph_FaceId theFace);

		/****** BRepGraph_EditorView_FaceOps::SetRefOrientation ******/
		/****** md5 signature: 2fff4e85c0b905460086999e75b91a24 ******/
		%feature("compactdefaultargs") SetRefOrientation;
		%feature("autodoc", "
Parameters
----------
theFaceRef: BRepGraph_FaceRefId
theOrientation: BRepGraphInc::ParityOrientation

Return
-------
None

Description
-----------
Set the orientation of a face reference and fire immediate notification. 
Input parameter: theFaceRef typed face reference identifier 
Input parameter: theOrientation new orientation value.
") SetRefOrientation;
		void SetRefOrientation(const BRepGraph_FaceRefId theFaceRef, BRepGraphInc::ParityOrientation theOrientation);

		/****** BRepGraph_EditorView_FaceOps::SetRefOrientation ******/
		/****** md5 signature: fe42760f91d6912c498fc2f839788147 ******/
		%feature("compactdefaultargs") SetRefOrientation;
		%feature("autodoc", "
Parameters
----------
theMut: BRepGraph_MutGuard<BRepGraphInc::FaceRef>
theOrientation: BRepGraphInc::ParityOrientation

Return
-------
None

Description
-----------
Set the orientation of a face reference inside a batched mutation scope. 
Input parameter: theMut active mutable face reference guard 
Input parameter: theOrientation new orientation value.
") SetRefOrientation;
		void SetRefOrientation(BRepGraph_MutGuard<BRepGraphInc::FaceRef> & theMut, BRepGraphInc::ParityOrientation theOrientation);

		/****** BRepGraph_EditorView_FaceOps::SetSurface ******/
		/****** md5 signature: 93faea613a43deaad8fdb57a09352e4b ******/
		%feature("compactdefaultargs") SetSurface;
		%feature("autodoc", "
Parameters
----------
theFace: BRepGraph_FaceId
theSurface: Geom_Surface

Return
-------
None

Description
-----------
Set the surface on a face. Creates an owned FaceSurfaceRep record and an associated SurfaceRep for face geometry access. 
Input parameter: theFace face definition identifier 
Input parameter: theSurface surface geometry (must not be null).
") SetSurface;
		void SetSurface(const BRepGraph_FaceId theFace, const opencascade::handle<Geom_Surface> & theSurface);

		/****** BRepGraph_EditorView_FaceOps::SetTolerance ******/
		/****** md5 signature: f1c34fcc7d1e6fe4d6d677f1bca2ffcc ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
theFace: BRepGraph_FaceId
theTolerance: double

Return
-------
None

Description
-----------
Set the tolerance of a face definition and fire immediate notification. 
Input parameter: theFace typed face definition identifier 
Input parameter: theTolerance new tolerance value.
") SetTolerance;
		void SetTolerance(const BRepGraph_FaceId theFace, double theTolerance);

		/****** BRepGraph_EditorView_FaceOps::SetTolerance ******/
		/****** md5 signature: f9002ad7c1f88cb02ccfb0e46d2f9324 ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
theMut: BRepGraph_MutGuard<BRepGraphInc::FaceDef>
theTolerance: double

Return
-------
None

Description
-----------
Set the tolerance of a face definition inside a batched mutation scope. 
Input parameter: theMut active mutable face guard 
Input parameter: theTolerance new tolerance value.
") SetTolerance;
		void SetTolerance(BRepGraph_MutGuard<BRepGraphInc::FaceDef> & theMut, double theTolerance);

};


%extend BRepGraph_EditorView_FaceOps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class BRepGraph_EditorView_GenOps *
************************************/
%nodefaultctor BRepGraph_EditorView_GenOps;
class BRepGraph_EditorView_GenOps {
	public:
		/****** BRepGraph_EditorView_GenOps::CleanupRemovedReferences ******/
		/****** md5 signature: d876dfe3385a10a018f74b679010b27a ******/
		%feature("compactdefaultargs") CleanupRemovedReferences;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clean up forward references to removed nodes in relation tables and references. After one or more RemoveNode calls, other entities may still hold stale child references pointing to removed nodes. This method marks those stale references as removed, detaches them from parent arrays, and updates relation entries for consistency. @post ValidateRelations() passes.
") CleanupRemovedReferences;
		void CleanupRemovedReferences();

		/****** BRepGraph_EditorView_GenOps::RemoveNode ******/
		/****** md5 signature: f5a917efe88f6bf66ebb84d081900a46 ******/
		%feature("compactdefaultargs") RemoveNode;
		%feature("autodoc", "
Parameters
----------
theNode: BRepGraph_NodeId

Return
-------
None

Description
-----------
Mark a node as removed (soft deletion). 
Input parameter: theNode node to remove.
") RemoveNode;
		void RemoveNode(const BRepGraph_NodeId theNode);

		/****** BRepGraph_EditorView_GenOps::RemoveRef ******/
		/****** md5 signature: 1eb67e8bce0aebfd3884cb3d2eb2c49c ******/
		%feature("compactdefaultargs") RemoveRef;
		%feature("autodoc", "
Parameters
----------
theRef: BRepGraph_RefId

Return
-------
bool

Description
-----------
Mark a reference entry as removed (soft deletion). This is the builder-level API for detaching a child usage from its parent without removing the referenced definition itself. Invalid or already-removed ids are ignored. 
Input parameter: theRef reference entry to remove 
Return: true if the reference transitioned from active to removed.
") RemoveRef;
		bool RemoveRef(const BRepGraph_RefId theRef);

		/****** BRepGraph_EditorView_GenOps::RemoveRef ******/
		/****** md5 signature: 8443cf42965626e569f70cd123352f45 ******/
		%feature("compactdefaultargs") RemoveRef;
		%feature("autodoc", "
Parameters
----------
theParent: BRepGraph_NodeId
theRef: BRepGraph_RefId
theToPruneOrphanedChild: bool

Return
-------
bool

Description
-----------
Mark an exact parent-owned reference entry as removed (soft deletion). This overload validates that the reference really belongs to the supplied parent and can optionally prune the child subtree when the removed usage was the last active parent usage of that child definition. Use this overload for UI/path-driven detach operations where the parent context is part of the user's selection. 
Input parameter: theParent  expected owning parent of the reference usage 
Input parameter: theRef  reference entry to remove 
Input parameter: theToPruneOrphanedChild if true, remove the referenced child subtree when no active parent usages remain after detachment 
Return: true if the reference transitioned from active to removed.
") RemoveRef;
		bool RemoveRef(const BRepGraph_NodeId theParent, const BRepGraph_RefId theRef, const bool theToPruneOrphanedChild);

		/****** BRepGraph_EditorView_GenOps::RemoveSubgraph ******/
		/****** md5 signature: 1d7317f9005e8329be92b715f863c4fe ******/
		%feature("compactdefaultargs") RemoveSubgraph;
		%feature("autodoc", "
Parameters
----------
theNode: BRepGraph_NodeId

Return
-------
None

Description
-----------
Mark a node and all its descendants as removed (cascading soft deletion). 
Input parameter: theNode root node to remove.
") RemoveSubgraph;
		void RemoveSubgraph(const BRepGraph_NodeId theNode);

		/****** BRepGraph_EditorView_GenOps::ReplaceNode ******/
		/****** md5 signature: 25c0bf1eb1363f4493ab88dda59d7fdf ******/
		%feature("compactdefaultargs") ReplaceNode;
		%feature("autodoc", "
Parameters
----------
theNode: BRepGraph_NodeId
theReplacement: BRepGraph_NodeId

Return
-------
None

Description
-----------
Replace a node by another active node and mark the old node as removed. For Edge nodes: all CoEdges referencing the removed edge are reparented to the replacement edge (ChildEdgeId updated, relation entries rebound). This prevents orphaned CoEdges that would disappear from CoEdgesOfEdge() queries. If the replacement is active, layers receive OnNodeReplaced(theNode, theReplacement) for structural data migration. If the replacement is invalid or inactive, the operation falls back to OnNodeRemoved(theNode), matching pure deletion. Semantic history records are not inferred here; algorithms should record operation-specific history. 
Input parameter: theNode node to remove 
Input parameter: theReplacement node that replaces theNode.
") ReplaceNode;
		void ReplaceNode(const BRepGraph_NodeId theNode, const BRepGraph_NodeId theReplacement);

		/****** BRepGraph_EditorView_GenOps::SetChildRefChildNodeId ******/
		/****** md5 signature: 1a70a1cca19b64abf6abc7078293b57e ******/
		%feature("compactdefaultargs") SetChildRefChildNodeId;
		%feature("autodoc", "
Parameters
----------
theChildRef: BRepGraph_ChildRefId
theChild: BRepGraph_NodeId

Return
-------
None

Description
-----------
Rewire a child reference to a different child def (rebinds CompoundsOf<Kind>).
") SetChildRefChildNodeId;
		void SetChildRefChildNodeId(const BRepGraph_ChildRefId theChildRef, const BRepGraph_NodeId theChild);

		/****** BRepGraph_EditorView_GenOps::SetChildRefChildNodeId ******/
		/****** md5 signature: 7ec257ae137353ddbf298e5ab0328a60 ******/
		%feature("compactdefaultargs") SetChildRefChildNodeId;
		%feature("autodoc", "
Parameters
----------
theMut: BRepGraph_MutGuard<BRepGraphInc::ChildRef>
theChild: BRepGraph_NodeId

Return
-------
None

Description
-----------
No available documentation.
") SetChildRefChildNodeId;
		void SetChildRefChildNodeId(BRepGraph_MutGuard<BRepGraphInc::ChildRef> & theMut, const BRepGraph_NodeId theChild);

		/****** BRepGraph_EditorView_GenOps::SetChildRefLocalLocation ******/
		/****** md5 signature: ba442cc836a6716a84c083c3f5cf6198 ******/
		%feature("compactdefaultargs") SetChildRefLocalLocation;
		%feature("autodoc", "
Parameters
----------
theChildRef: BRepGraph_ChildRefId
theLoc: TopLoc_Location

Return
-------
None

Description
-----------
Set the local location of a child reference and fire immediate notification. 
Input parameter: theChildRef typed child reference identifier 
Input parameter: theLoc new local location.
") SetChildRefLocalLocation;
		void SetChildRefLocalLocation(const BRepGraph_ChildRefId theChildRef, const TopLoc_Location & theLoc);

		/****** BRepGraph_EditorView_GenOps::SetChildRefLocalLocation ******/
		/****** md5 signature: 823d8914013398630d58e59cc2b007fa ******/
		%feature("compactdefaultargs") SetChildRefLocalLocation;
		%feature("autodoc", "
Parameters
----------
theMut: BRepGraph_MutGuard<BRepGraphInc::ChildRef>
theLoc: TopLoc_Location

Return
-------
None

Description
-----------
Set the local location of a child reference inside a batched mutation scope. 
Input parameter: theMut active mutable child reference guard 
Input parameter: theLoc new local location.
") SetChildRefLocalLocation;
		void SetChildRefLocalLocation(BRepGraph_MutGuard<BRepGraphInc::ChildRef> & theMut, const TopLoc_Location & theLoc);

		/****** BRepGraph_EditorView_GenOps::SetChildRefOrientation ******/
		/****** md5 signature: 6d6e107a0bd9377d2fc23d9a9eb1f501 ******/
		%feature("compactdefaultargs") SetChildRefOrientation;
		%feature("autodoc", "
Parameters
----------
theChildRef: BRepGraph_ChildRefId
theOrientation: BRepGraphInc::ParityOrientation

Return
-------
None

Description
-----------
Set the orientation of a child reference.
") SetChildRefOrientation;
		void SetChildRefOrientation(const BRepGraph_ChildRefId theChildRef, const BRepGraphInc::ParityOrientation theOrientation);

		/****** BRepGraph_EditorView_GenOps::SetChildRefOrientation ******/
		/****** md5 signature: b05304de12d77d2e054d12ae6b8e353d ******/
		%feature("compactdefaultargs") SetChildRefOrientation;
		%feature("autodoc", "
Parameters
----------
theMut: BRepGraph_MutGuard<BRepGraphInc::ChildRef>
theOrientation: BRepGraphInc::ParityOrientation

Return
-------
None

Description
-----------
Set the orientation inside a batched mutation scope.
") SetChildRefOrientation;
		void SetChildRefOrientation(BRepGraph_MutGuard<BRepGraphInc::ChildRef> & theMut, const BRepGraphInc::ParityOrientation theOrientation);

};


%extend BRepGraph_EditorView_GenOps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class BRepGraph_EditorView_OccurrenceOps *
*******************************************/
%nodefaultctor BRepGraph_EditorView_OccurrenceOps;
class BRepGraph_EditorView_OccurrenceOps {
	public:
		/****** BRepGraph_EditorView_OccurrenceOps::SetChildNodeId ******/
		/****** md5 signature: 78b373a90e52eacdc3f7b67a5516b242 ******/
		%feature("compactdefaultargs") SetChildNodeId;
		%feature("autodoc", "
Parameters
----------
theOccurrence: BRepGraph_OccurrenceId
theChildNodeId: BRepGraph_NodeId

Return
-------
None

Description
-----------
Set the child node referenced by an occurrence definition. Invalid or removed occurrence ids are ignored. The child must be an active topology node or an active Product; invalid, removed, and Occurrence child ids are ignored.
") SetChildNodeId;
		void SetChildNodeId(const BRepGraph_OccurrenceId theOccurrence, const BRepGraph_NodeId theChildNodeId);

		/****** BRepGraph_EditorView_OccurrenceOps::SetChildNodeId ******/
		/****** md5 signature: ee69bd1cb3c945080ad3f273e54735f9 ******/
		%feature("compactdefaultargs") SetChildNodeId;
		%feature("autodoc", "
Parameters
----------
theMut: BRepGraph_MutGuard<BRepGraphInc::OccurrenceDef>
theChildNodeId: BRepGraph_NodeId

Return
-------
None

Description
-----------
Set the child node id inside a batched mutation scope. Invalid, removed, and Occurrence child ids are ignored.
") SetChildNodeId;
		void SetChildNodeId(BRepGraph_MutGuard<BRepGraphInc::OccurrenceDef> & theMut, const BRepGraph_NodeId theChildNodeId);

		/****** BRepGraph_EditorView_OccurrenceOps::SetRefChildOccurrenceId ******/
		/****** md5 signature: 8466596e545a53527b4d7138d549b00d ******/
		%feature("compactdefaultargs") SetRefChildOccurrenceId;
		%feature("autodoc", "
Parameters
----------
theOccurrenceRef: BRepGraph_OccurrenceRefId
theOccurrence: BRepGraph_OccurrenceId

Return
-------
None

Description
-----------
Rewire an occurrence reference to a different occurrence def (rebinds ProductToOccurrences).
") SetRefChildOccurrenceId;
		void SetRefChildOccurrenceId(const BRepGraph_OccurrenceRefId theOccurrenceRef, const BRepGraph_OccurrenceId theOccurrence);

		/****** BRepGraph_EditorView_OccurrenceOps::SetRefChildOccurrenceId ******/
		/****** md5 signature: 24dff44e431827e3293b29cd87fda7d1 ******/
		%feature("compactdefaultargs") SetRefChildOccurrenceId;
		%feature("autodoc", "
Parameters
----------
theMut: BRepGraph_MutGuard<BRepGraphInc::OccurrenceRef>
theOccurrence: BRepGraph_OccurrenceId

Return
-------
None

Description
-----------
No available documentation.
") SetRefChildOccurrenceId;
		void SetRefChildOccurrenceId(BRepGraph_MutGuard<BRepGraphInc::OccurrenceRef> & theMut, const BRepGraph_OccurrenceId theOccurrence);

		/****** BRepGraph_EditorView_OccurrenceOps::SetRefLocalLocation ******/
		/****** md5 signature: 9d2b921c72f298169574c92387284667 ******/
		%feature("compactdefaultargs") SetRefLocalLocation;
		%feature("autodoc", "
Parameters
----------
theOccurrenceRef: BRepGraph_OccurrenceRefId
theLoc: TopLoc_Location

Return
-------
None

Description
-----------
Set the local location of an occurrence reference and fire immediate notification. 
Input parameter: theOccurrenceRef typed occurrence reference identifier 
Input parameter: theLoc  new local location.
") SetRefLocalLocation;
		void SetRefLocalLocation(const BRepGraph_OccurrenceRefId theOccurrenceRef, const TopLoc_Location & theLoc);

		/****** BRepGraph_EditorView_OccurrenceOps::SetRefLocalLocation ******/
		/****** md5 signature: 4f0b7c571de11b9feea1d9fb76d52687 ******/
		%feature("compactdefaultargs") SetRefLocalLocation;
		%feature("autodoc", "
Parameters
----------
theMut: BRepGraph_MutGuard<BRepGraphInc::OccurrenceRef>
theLoc: TopLoc_Location

Return
-------
None

Description
-----------
Set the local location of an occurrence reference inside a batched mutation scope. 
Input parameter: theMut active mutable occurrence reference guard 
Input parameter: theLoc new local location.
") SetRefLocalLocation;
		void SetRefLocalLocation(BRepGraph_MutGuard<BRepGraphInc::OccurrenceRef> & theMut, const TopLoc_Location & theLoc);

};


%extend BRepGraph_EditorView_OccurrenceOps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class BRepGraph_EditorView_ProductOps *
****************************************/
%nodefaultctor BRepGraph_EditorView_ProductOps;
class BRepGraph_EditorView_ProductOps {
	public:
		/****** BRepGraph_EditorView_ProductOps::Add ******/
		/****** md5 signature: 037527c4c4558566b3212f455fe35cc3 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theShapeRoot: BRepGraph_NodeId
thePlacement: TopLoc_Location (optional, default to TopLoc_Location())

Return
-------
BRepGraph_ProductId

Description
-----------
Create a Product wrapping an existing topology root via an Occurrence. The product is NOT added to document roots; call AppendDocumentRoot() explicitly when this Product is a document root. 
Input parameter: theShapeRoot root topology NodeId for the part 
Input parameter: thePlacement local placement stored on the root OccurrenceRef 
Return: typed product definition identifier, or invalid if the root is not an active topology definition node.
") Add;
		BRepGraph_ProductId Add(const BRepGraph_NodeId theShapeRoot, const TopLoc_Location & thePlacement = TopLoc_Location());

		/****** BRepGraph_EditorView_ProductOps::Add ******/
		/****** md5 signature: 80474e4ecaca1ddbf1a011e6bd693885 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Return
-------
BRepGraph_ProductId

Description
-----------
Create an empty Product with no direct shape root; can later own child occurrences. The product is NOT added to document roots; call AppendDocumentRoot() explicitly when this Product is a document root. 
Return: typed product definition identifier.
") Add;
		BRepGraph_ProductId Add();

		/****** BRepGraph_EditorView_ProductOps::Append ******/
		/****** md5 signature: 77491b31dfb26e10ea9c2c9b73aa9db1 ******/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "
Parameters
----------
theParentProduct: BRepGraph_ProductId
theReferencedProduct: BRepGraph_ProductId
thePlacement: TopLoc_Location
theParentOccurrence: BRepGraph_OccurrenceId (optional, default to BRepGraph_OccurrenceId())
theOutOccurrenceRefId: BRepGraph_OccurrenceRefId * (optional, default to nullptr)

Return
-------
BRepGraph_OccurrenceId

Description
-----------
Append two existing Products via a fresh Occurrence. 
Input parameter: theParentProduct typed parent product identifier 
Input parameter: theReferencedProduct typed child product identifier being instantiated 
Input parameter: thePlacement  local placement relative to parent 
Input parameter: theParentOccurrence optional placing occurrence (nested assembly chains) @param[out] theOutOccurrenceRefId optional out: typed ref id of the inserted OccurrenceRef 
Return: typed occurrence definition identifier, or invalid if the chain is not active.
") Append;
		BRepGraph_OccurrenceId Append(const BRepGraph_ProductId theParentProduct, const BRepGraph_ProductId theReferencedProduct, const TopLoc_Location & thePlacement, const BRepGraph_OccurrenceId theParentOccurrence = BRepGraph_OccurrenceId(), BRepGraph_OccurrenceRefId * theOutOccurrenceRefId = nullptr);

		/****** BRepGraph_EditorView_ProductOps::Append ******/
		/****** md5 signature: aa122760ac5a1f45d7b26e62e7406d92 ******/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "
Parameters
----------
theParentProduct: BRepGraph_ProductId
theChildProducts: NCollection_Array1<BRepGraph_ProductId>
thePlacements: NCollection_Array1<TopLoc_Location>

Return
-------
NCollection_Array1<BRepGraph_OccurrenceRefId >

Description
-----------
Batch-append multiple child products to a parent product via fresh Occurrences. Two-pass: validates all inputs first, then links all. 
Input parameter: theParentProduct typed parent product identifier 
Input parameter: theChildProducts child product identifiers to instantiate 
Input parameter: thePlacements local placements per child (must match child count) 
Return: array of created occurrence reference ids, empty on validation failure.
") Append;
		NCollection_Array1<BRepGraph_OccurrenceRefId > Append(const BRepGraph_ProductId theParentProduct, const NCollection_Array1<BRepGraph_ProductId> & theChildProducts, const NCollection_Array1<TopLoc_Location> & thePlacements);

		/****** BRepGraph_EditorView_ProductOps::AppendDocumentRoot ******/
		/****** md5 signature: 409a8ac1447bf267231b97f5c36c6081 ******/
		%feature("compactdefaultargs") AppendDocumentRoot;
		%feature("autodoc", "
Parameters
----------
theProductId: BRepGraph_ProductId

Return
-------
None

Description
-----------
Add an active Product to document roots if it is not already listed.
") AppendDocumentRoot;
		void AppendDocumentRoot(const BRepGraph_ProductId theProductId);

		/****** BRepGraph_EditorView_ProductOps::RemoveOccurrence ******/
		/****** md5 signature: b749068df81dedf0d0cfbf8f950bd7aa ******/
		%feature("compactdefaultargs") RemoveOccurrence;
		%feature("autodoc", "
Parameters
----------
theProductDefId: BRepGraph_ProductId
theOccurrenceRefId: BRepGraph_OccurrenceRefId

Return
-------
bool

Description
-----------
Detach one exact occurrence ref from a product definition. Use BRepGraph_RefsOccurrenceOfProduct::CurrentId() when removing from a product iterator. The method removes the exact OccurrenceRef entry, erases it from the product's ordered ref sequence, updates relation tables, and prunes the occurrence subtree when it has no other active usages. 
Input parameter: theProductDefId product definition identifier 
Input parameter: theOccurrenceRefId exact product-owned occurrence reference identifier 
Return: true if the active product-owned usage was removed.
") RemoveOccurrence;
		bool RemoveOccurrence(const BRepGraph_ProductId theProductDefId, const BRepGraph_OccurrenceRefId theOccurrenceRefId);

		/****** BRepGraph_EditorView_ProductOps::RemoveOccurrences ******/
		/****** md5 signature: 97522fc16eeffadceca2cefbcb427ad0 ******/
		%feature("compactdefaultargs") RemoveOccurrences;
		%feature("autodoc", "
Parameters
----------
theProductId: BRepGraph_ProductId
theOccurrenceRefs: NCollection_Array1<BRepGraph_OccurrenceRefId>

Return
-------
bool

Description
-----------
Batch-remove multiple occurrence refs from a product definition. All-or-nothing: validates all inputs first, then removes all. 
Input parameter: theProductId product definition identifier 
Input parameter: theOccurrenceRefs occurrence reference identifiers to remove 
Return: true if all refs were successfully removed.
") RemoveOccurrences;
		bool RemoveOccurrences(const BRepGraph_ProductId theProductId, const NCollection_Array1<BRepGraph_OccurrenceRefId> & theOccurrenceRefs);

		/****** BRepGraph_EditorView_ProductOps::RemoveShapeRoot ******/
		/****** md5 signature: b17c694525dd0a14f237dbab4a46a3bb ******/
		%feature("compactdefaultargs") RemoveShapeRoot;
		%feature("autodoc", "
Parameters
----------
theProductDefId: BRepGraph_ProductId

Return
-------
bool

Description
-----------
Detach the scalar shape-root ownership from a product definition. If no other active product owns the same topology root afterward, the root subgraph is pruned as orphaned. The product loses its direct shape root; it is no longer a part, and it only remains an assembly if it still owns active child occurrences. 
Input parameter: theProductDefId product definition identifier 
Return: true if an active shape root was detached.
") RemoveShapeRoot;
		bool RemoveShapeRoot(const BRepGraph_ProductId theProductDefId);

};


%extend BRepGraph_EditorView_ProductOps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class BRepGraph_EditorView_ShellOps *
**************************************/
%nodefaultctor BRepGraph_EditorView_ShellOps;
class BRepGraph_EditorView_ShellOps {
	public:
		/****** BRepGraph_EditorView_ShellOps::Add ******/
		/****** md5 signature: 02edc13610f7298636cc6b78dfa8c1fd ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Return
-------
BRepGraph_ShellId

Description
-----------
Add an empty shell definition to the graph. 
Return: typed shell definition identifier.
") Add;
		BRepGraph_ShellId Add();

		/****** BRepGraph_EditorView_ShellOps::Append ******/
		/****** md5 signature: 1be4deaee3009c6e6857e6c2c3ee569c ******/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "
Parameters
----------
theShellEntity: BRepGraph_ShellId
theFaceEntity: BRepGraph_FaceId
theOri: BRepGraphInc::ParityOrientation (optional, default to TopAbs_FORWARD)

Return
-------
BRepGraph_FaceRefId

Description
-----------
Append a face to a shell. Appends FaceRef and stores its FaceRefId in shell FaceRefIds. 
Input parameter: theShellEntity typed shell definition identifier 
Input parameter: theFaceEntity typed face definition identifier 
Input parameter: theOri orientation of the face in the shell 
Return: typed face reference identifier, or invalid if inputs are not active.
") Append;
		BRepGraph_FaceRefId Append(const BRepGraph_ShellId theShellEntity, const BRepGraph_FaceId theFaceEntity, const BRepGraphInc::ParityOrientation theOri = TopAbs_FORWARD);

		/****** BRepGraph_EditorView_ShellOps::Append ******/
		/****** md5 signature: 43a73b6af93b759d4825da942ad1c326 ******/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "
Parameters
----------
theShellEntity: BRepGraph_ShellId
theFaceIds: NCollection_Array1<BRepGraph_FaceId>
theOrientations: NCollection_Array1<BRepGraphInc::ParityOrientation> (optional, default to NCollection_Array1<BRepGraphInc::ParityOrientation>())

Return
-------
NCollection_Array1<BRepGraph_FaceRefId >

Description
-----------
Batch-append multiple faces to a shell. Two-pass: validates all inputs first, then links all. 
Input parameter: theShellEntity typed shell definition identifier 
Input parameter: theFaceIds face definition identifiers to append 
Input parameter: theOrientations optional parity orientations (empty = all FORWARD) 
Return: array of created face reference ids, empty on validation failure.
") Append;
		NCollection_Array1<BRepGraph_FaceRefId > Append(const BRepGraph_ShellId theShellEntity, const NCollection_Array1<BRepGraph_FaceId> & theFaceIds, const NCollection_Array1<BRepGraphInc::ParityOrientation> & theOrientations = NCollection_Array1<BRepGraphInc::ParityOrientation>());

		/****** BRepGraph_EditorView_ShellOps::RemoveFace ******/
		/****** md5 signature: 19bedeaea73345f6437c7762e10f1177 ******/
		%feature("compactdefaultargs") RemoveFace;
		%feature("autodoc", "
Parameters
----------
theChildShellId: BRepGraph_ShellId
theFaceRefId: BRepGraph_FaceRefId

Return
-------
bool

Description
-----------
Detach one exact face ref from a shell definition. Use BRepGraph_RefsFaceOfShell::CurrentId() when removing from a shell iterator. The method removes the exact FaceRef entry, erases it from the shell's ordered ref sequence, updates relation tables, and prunes the Face subtree when it has no other active usages. 
Input parameter: theChildShellId shell definition identifier 
Input parameter: theFaceRefId exact shell-owned face reference identifier 
Return: true if the active shell-owned usage was removed.
") RemoveFace;
		bool RemoveFace(const BRepGraph_ShellId theChildShellId, const BRepGraph_FaceRefId theFaceRefId);

		/****** BRepGraph_EditorView_ShellOps::RemoveFaces ******/
		/****** md5 signature: b8760eb6b3cf07458f94198a5a2d4f18 ******/
		%feature("compactdefaultargs") RemoveFaces;
		%feature("autodoc", "
Parameters
----------
theShellId: BRepGraph_ShellId
theFaceRefs: NCollection_Array1<BRepGraph_FaceRefId>

Return
-------
bool

Description
-----------
Batch-remove multiple face refs from a shell definition. All-or-nothing: validates all inputs first, then removes all. 
Input parameter: theShellId shell definition identifier 
Input parameter: theFaceRefs face reference identifiers to remove 
Return: true if all refs were successfully removed.
") RemoveFaces;
		bool RemoveFaces(const BRepGraph_ShellId theShellId, const NCollection_Array1<BRepGraph_FaceRefId> & theFaceRefs);

		/****** BRepGraph_EditorView_ShellOps::SetRefChildShellId ******/
		/****** md5 signature: 5d45bb871b407b5567c1e34be776f0da ******/
		%feature("compactdefaultargs") SetRefChildShellId;
		%feature("autodoc", "
Parameters
----------
theShellRef: BRepGraph_ShellRefId
theShell: BRepGraph_ShellId

Return
-------
None

Description
-----------
Rewire a shell reference to a different shell def (rebinds ShellToSolid if parent is Solid).
") SetRefChildShellId;
		void SetRefChildShellId(const BRepGraph_ShellRefId theShellRef, const BRepGraph_ShellId theShell);

		/****** BRepGraph_EditorView_ShellOps::SetRefChildShellId ******/
		/****** md5 signature: 83b9def6ebf1c59aebb20467e0af85bf ******/
		%feature("compactdefaultargs") SetRefChildShellId;
		%feature("autodoc", "
Parameters
----------
theMut: BRepGraph_MutGuard<BRepGraphInc::ShellRef>
theShell: BRepGraph_ShellId

Return
-------
None

Description
-----------
No available documentation.
") SetRefChildShellId;
		void SetRefChildShellId(BRepGraph_MutGuard<BRepGraphInc::ShellRef> & theMut, const BRepGraph_ShellId theShell);

		/****** BRepGraph_EditorView_ShellOps::SetRefOrientation ******/
		/****** md5 signature: f699261e8120e0753091b22a9acc5a6b ******/
		%feature("compactdefaultargs") SetRefOrientation;
		%feature("autodoc", "
Parameters
----------
theShellRef: BRepGraph_ShellRefId
theOrientation: BRepGraphInc::ParityOrientation

Return
-------
None

Description
-----------
Set the orientation of a shell reference.
") SetRefOrientation;
		void SetRefOrientation(const BRepGraph_ShellRefId theShellRef, const BRepGraphInc::ParityOrientation theOrientation);

		/****** BRepGraph_EditorView_ShellOps::SetRefOrientation ******/
		/****** md5 signature: 7088b985249f9e042c7063231d140bff ******/
		%feature("compactdefaultargs") SetRefOrientation;
		%feature("autodoc", "
Parameters
----------
theMut: BRepGraph_MutGuard<BRepGraphInc::ShellRef>
theOrientation: BRepGraphInc::ParityOrientation

Return
-------
None

Description
-----------
Set the orientation inside a batched mutation scope.
") SetRefOrientation;
		void SetRefOrientation(BRepGraph_MutGuard<BRepGraphInc::ShellRef> & theMut, const BRepGraphInc::ParityOrientation theOrientation);

};


%extend BRepGraph_EditorView_ShellOps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class BRepGraph_EditorView_SolidOps *
**************************************/
%nodefaultctor BRepGraph_EditorView_SolidOps;
class BRepGraph_EditorView_SolidOps {
	public:
		/****** BRepGraph_EditorView_SolidOps::Add ******/
		/****** md5 signature: 6e74eb1770bc680b730539d1c617f257 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Return
-------
BRepGraph_SolidId

Description
-----------
Add an empty solid definition to the graph. 
Return: typed solid definition identifier.
") Add;
		BRepGraph_SolidId Add();

		/****** BRepGraph_EditorView_SolidOps::Append ******/
		/****** md5 signature: 828f4909aa177b9b96198d60b635c045 ******/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "
Parameters
----------
theSolidEntity: BRepGraph_SolidId
theShellEntity: BRepGraph_ShellId
theOri: BRepGraphInc::ParityOrientation (optional, default to TopAbs_FORWARD)

Return
-------
BRepGraph_ShellRefId

Description
-----------
Append a shell to a solid. Appends ShellRef and stores its ShellRefId in solid ShellRefIds. 
Input parameter: theSolidEntity typed solid definition identifier 
Input parameter: theShellEntity typed shell definition identifier 
Input parameter: theOri orientation of the shell in the solid 
Return: typed shell reference identifier, or invalid if inputs are not active.
") Append;
		BRepGraph_ShellRefId Append(const BRepGraph_SolidId theSolidEntity, const BRepGraph_ShellId theShellEntity, const BRepGraphInc::ParityOrientation theOri = TopAbs_FORWARD);

		/****** BRepGraph_EditorView_SolidOps::Append ******/
		/****** md5 signature: 160ebcce8361a9afadc55e26fad447c8 ******/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "
Parameters
----------
theSolidEntity: BRepGraph_SolidId
theShellIds: NCollection_Array1<BRepGraph_ShellId>
theOrientations: NCollection_Array1<BRepGraphInc::ParityOrientation> (optional, default to NCollection_Array1<BRepGraphInc::ParityOrientation>())

Return
-------
NCollection_Array1<BRepGraph_ShellRefId >

Description
-----------
Batch-append multiple shells to a solid. Two-pass: validates all inputs first, then links all. 
Input parameter: theSolidEntity typed solid definition identifier 
Input parameter: theShellIds shell definition identifiers to append 
Input parameter: theOrientations optional parity orientations (empty = all FORWARD) 
Return: array of created shell reference ids, empty on validation failure.
") Append;
		NCollection_Array1<BRepGraph_ShellRefId > Append(const BRepGraph_SolidId theSolidEntity, const NCollection_Array1<BRepGraph_ShellId> & theShellIds, const NCollection_Array1<BRepGraphInc::ParityOrientation> & theOrientations = NCollection_Array1<BRepGraphInc::ParityOrientation>());

		/****** BRepGraph_EditorView_SolidOps::RemoveShell ******/
		/****** md5 signature: 4d3efd8f572e272170ea1c6ef9606892 ******/
		%feature("compactdefaultargs") RemoveShell;
		%feature("autodoc", "
Parameters
----------
theChildSolidId: BRepGraph_SolidId
theShellRefId: BRepGraph_ShellRefId

Return
-------
bool

Description
-----------
Detach one exact shell ref from a solid definition. Use BRepGraph_RefsShellOfSolid::CurrentId() when removing from a solid iterator. The method removes the exact ShellRef entry, erases it from the solid's ordered ref sequence, updates relation tables, and prunes the Shell subtree when it has no other active usages. 
Input parameter: theChildSolidId solid definition identifier 
Input parameter: theShellRefId exact solid-owned shell reference identifier 
Return: true if the active solid-owned usage was removed.
") RemoveShell;
		bool RemoveShell(const BRepGraph_SolidId theChildSolidId, const BRepGraph_ShellRefId theShellRefId);

		/****** BRepGraph_EditorView_SolidOps::RemoveShells ******/
		/****** md5 signature: 728e893a3c099baa1126c96c4d690bfc ******/
		%feature("compactdefaultargs") RemoveShells;
		%feature("autodoc", "
Parameters
----------
theSolidId: BRepGraph_SolidId
theShellRefs: NCollection_Array1<BRepGraph_ShellRefId>

Return
-------
bool

Description
-----------
Batch-remove multiple shell refs from a solid definition. All-or-nothing: validates all inputs first, then removes all. 
Input parameter: theSolidId solid definition identifier 
Input parameter: theShellRefs shell reference identifiers to remove 
Return: true if all refs were successfully removed.
") RemoveShells;
		bool RemoveShells(const BRepGraph_SolidId theSolidId, const NCollection_Array1<BRepGraph_ShellRefId> & theShellRefs);

		/****** BRepGraph_EditorView_SolidOps::SetRefChildSolidId ******/
		/****** md5 signature: f42f8e69cd1aa139339e2ee22da10f93 ******/
		%feature("compactdefaultargs") SetRefChildSolidId;
		%feature("autodoc", "
Parameters
----------
theSolidRef: BRepGraph_SolidRefId
theSolid: BRepGraph_SolidId

Return
-------
None

Description
-----------
Rewire a solid reference to a different solid def (rebinds SolidToCompSolid if parent is CompSolid).
") SetRefChildSolidId;
		void SetRefChildSolidId(const BRepGraph_SolidRefId theSolidRef, const BRepGraph_SolidId theSolid);

		/****** BRepGraph_EditorView_SolidOps::SetRefChildSolidId ******/
		/****** md5 signature: 3066829995a9d3e37616413a3745988b ******/
		%feature("compactdefaultargs") SetRefChildSolidId;
		%feature("autodoc", "
Parameters
----------
theMut: BRepGraph_MutGuard<BRepGraphInc::SolidRef>
theSolid: BRepGraph_SolidId

Return
-------
None

Description
-----------
No available documentation.
") SetRefChildSolidId;
		void SetRefChildSolidId(BRepGraph_MutGuard<BRepGraphInc::SolidRef> & theMut, const BRepGraph_SolidId theSolid);

		/****** BRepGraph_EditorView_SolidOps::SetRefOrientation ******/
		/****** md5 signature: 34f178858bf5969361dd24fca9051adb ******/
		%feature("compactdefaultargs") SetRefOrientation;
		%feature("autodoc", "
Parameters
----------
theSolidRef: BRepGraph_SolidRefId
theOrientation: BRepGraphInc::ParityOrientation

Return
-------
None

Description
-----------
Set the orientation of a solid reference.
") SetRefOrientation;
		void SetRefOrientation(const BRepGraph_SolidRefId theSolidRef, const BRepGraphInc::ParityOrientation theOrientation);

		/****** BRepGraph_EditorView_SolidOps::SetRefOrientation ******/
		/****** md5 signature: cc76368f9519b1c96c23fd425ca7eede ******/
		%feature("compactdefaultargs") SetRefOrientation;
		%feature("autodoc", "
Parameters
----------
theMut: BRepGraph_MutGuard<BRepGraphInc::SolidRef>
theOrientation: BRepGraphInc::ParityOrientation

Return
-------
None

Description
-----------
Set the orientation inside a batched mutation scope.
") SetRefOrientation;
		void SetRefOrientation(BRepGraph_MutGuard<BRepGraphInc::SolidRef> & theMut, const BRepGraphInc::ParityOrientation theOrientation);

};


%extend BRepGraph_EditorView_SolidOps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class BRepGraph_EditorView_VertexOps *
***************************************/
%nodefaultctor BRepGraph_EditorView_VertexOps;
class BRepGraph_EditorView_VertexOps {
	public:
		/****** BRepGraph_EditorView_VertexOps::Add ******/
		/****** md5 signature: b17ec0338ee0ff12087619b8086ba2d9 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
thePoint: gp_Pnt
theTolerance: double

Return
-------
BRepGraph_VertexId

Description
-----------
Add a vertex definition to the graph. 
Input parameter: thePoint 3D coordinates 
Input parameter: theTolerance vertex tolerance 
Return: typed vertex definition identifier.
") Add;
		BRepGraph_VertexId Add(const gp_Pnt & thePoint, const double theTolerance);

		/****** BRepGraph_EditorView_VertexOps::SetPoint ******/
		/****** md5 signature: 4c4c4f1fe02c3f864d20e548cb7418b6 ******/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "
Parameters
----------
theVertex: BRepGraph_VertexId
thePoint: gp_Pnt

Return
-------
None

Description
-----------
Set the 3D point of a vertex definition and fire immediate notification. 
Input parameter: theVertex typed vertex definition identifier 
Input parameter: thePoint new 3D coordinates.
") SetPoint;
		void SetPoint(const BRepGraph_VertexId theVertex, const gp_Pnt & thePoint);

		/****** BRepGraph_EditorView_VertexOps::SetPoint ******/
		/****** md5 signature: bb27640053ca189e9a061331cf66abb6 ******/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "
Parameters
----------
theMut: BRepGraph_MutGuard<BRepGraphInc::VertexDef>
thePoint: gp_Pnt

Return
-------
None

Description
-----------
Set the 3D point of a vertex definition inside a batched mutation scope. Marks the guard dirty so the destructor fires a single notification. 
Input parameter: theMut active mutable vertex guard 
Input parameter: thePoint new 3D coordinates.
") SetPoint;
		void SetPoint(BRepGraph_MutGuard<BRepGraphInc::VertexDef> & theMut, const gp_Pnt & thePoint);

		/****** BRepGraph_EditorView_VertexOps::SetRefChildVertexId ******/
		/****** md5 signature: c0cc203cd6d5be86f6ae9312f277fc1d ******/
		%feature("compactdefaultargs") SetRefChildVertexId;
		%feature("autodoc", "
Parameters
----------
theVertexRef: BRepGraph_VertexRefId
theVertex: BRepGraph_VertexId

Return
-------
None

Description
-----------
Rewire a vertex reference to a different vertex def (rebinds VertexToEdges if parent is Edge).
") SetRefChildVertexId;
		void SetRefChildVertexId(const BRepGraph_VertexRefId theVertexRef, const BRepGraph_VertexId theVertex);

		/****** BRepGraph_EditorView_VertexOps::SetRefChildVertexId ******/
		/****** md5 signature: 147526c78f74848d82a0e146298479fc ******/
		%feature("compactdefaultargs") SetRefChildVertexId;
		%feature("autodoc", "
Parameters
----------
theMut: BRepGraph_MutGuard<BRepGraphInc::VertexRef>
theVertex: BRepGraph_VertexId

Return
-------
None

Description
-----------
No available documentation.
") SetRefChildVertexId;
		void SetRefChildVertexId(BRepGraph_MutGuard<BRepGraphInc::VertexRef> & theMut, const BRepGraph_VertexId theVertex);

		/****** BRepGraph_EditorView_VertexOps::SetRefOrientation ******/
		/****** md5 signature: eefdff06d8e0fffd1f7740e1d312de5f ******/
		%feature("compactdefaultargs") SetRefOrientation;
		%feature("autodoc", "
Parameters
----------
theVertexRef: BRepGraph_VertexRefId
theOrientation: BRepGraphInc::ParityOrientation

Return
-------
None

Description
-----------
Set the orientation of a vertex reference.
") SetRefOrientation;
		void SetRefOrientation(const BRepGraph_VertexRefId theVertexRef, const BRepGraphInc::ParityOrientation theOrientation);

		/****** BRepGraph_EditorView_VertexOps::SetRefOrientation ******/
		/****** md5 signature: 64e1f7dc16e315ea8a53ed8c5ad3f22b ******/
		%feature("compactdefaultargs") SetRefOrientation;
		%feature("autodoc", "
Parameters
----------
theMut: BRepGraph_MutGuard<BRepGraphInc::VertexRef>
theOrientation: BRepGraphInc::ParityOrientation

Return
-------
None

Description
-----------
Set the orientation inside a batched mutation scope.
") SetRefOrientation;
		void SetRefOrientation(BRepGraph_MutGuard<BRepGraphInc::VertexRef> & theMut, const BRepGraphInc::ParityOrientation theOrientation);

		/****** BRepGraph_EditorView_VertexOps::SetTolerance ******/
		/****** md5 signature: c66be6653b96788e3d3d44ee0f622eee ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
theVertex: BRepGraph_VertexId
theTolerance: double

Return
-------
None

Description
-----------
Set the tolerance of a vertex definition.
") SetTolerance;
		void SetTolerance(const BRepGraph_VertexId theVertex, const double theTolerance);

		/****** BRepGraph_EditorView_VertexOps::SetTolerance ******/
		/****** md5 signature: 914715ac9c3b198170ae37018d26ef51 ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
theMut: BRepGraph_MutGuard<BRepGraphInc::VertexDef>
theTolerance: double

Return
-------
None

Description
-----------
Set the tolerance inside a batched mutation scope.
") SetTolerance;
		void SetTolerance(BRepGraph_MutGuard<BRepGraphInc::VertexDef> & theMut, const double theTolerance);

};


%extend BRepGraph_EditorView_VertexOps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class BRepGraph_EditorView_WireOps *
*************************************/
%nodefaultctor BRepGraph_EditorView_WireOps;
class BRepGraph_EditorView_WireOps {
	public:
/* public enums */
enum class CoEdgeOrderStatus {
	Ready = 0,
	Reordered = 1,
	AlreadyCurrent = 2,
	AlreadyContained = 3,
	Empty = 4,
	InvalidWire = 5,
	SizeMismatch = 6,
	DuplicateCoEdge = 7,
	InvalidCoEdge = 8,
	CoEdgeAlreadyBound = 9,
	CoEdgeNotOwnedByWire = 10,
	NotPermutation = 11,
	Disconnected = 12,
};

enum class ReplaceEdgeStatus {
	Ready = 0,
	AlreadyCurrent = 1,
	InvalidWire = 2,
	InvalidOldEdge = 3,
	InvalidNewEdge = 4,
	Disconnected = 5,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class CoEdgeOrderStatus(IntEnum):
	Ready = 0
	Reordered = 1
	AlreadyCurrent = 2
	AlreadyContained = 3
	Empty = 4
	InvalidWire = 5
	SizeMismatch = 6
	DuplicateCoEdge = 7
	InvalidCoEdge = 8
	CoEdgeAlreadyBound = 9
	CoEdgeNotOwnedByWire = 10
	NotPermutation = 11
	Disconnected = 12
Ready = CoEdgeOrderStatus.Ready
Reordered = CoEdgeOrderStatus.Reordered
AlreadyCurrent = CoEdgeOrderStatus.AlreadyCurrent
AlreadyContained = CoEdgeOrderStatus.AlreadyContained
Empty = CoEdgeOrderStatus.Empty
InvalidWire = CoEdgeOrderStatus.InvalidWire
SizeMismatch = CoEdgeOrderStatus.SizeMismatch
DuplicateCoEdge = CoEdgeOrderStatus.DuplicateCoEdge
InvalidCoEdge = CoEdgeOrderStatus.InvalidCoEdge
CoEdgeAlreadyBound = CoEdgeOrderStatus.CoEdgeAlreadyBound
CoEdgeNotOwnedByWire = CoEdgeOrderStatus.CoEdgeNotOwnedByWire
NotPermutation = CoEdgeOrderStatus.NotPermutation
Disconnected = CoEdgeOrderStatus.Disconnected

class ReplaceEdgeStatus(IntEnum):
	Ready = 0
	AlreadyCurrent = 1
	InvalidWire = 2
	InvalidOldEdge = 3
	InvalidNewEdge = 4
	Disconnected = 5
Ready = ReplaceEdgeStatus.Ready
AlreadyCurrent = ReplaceEdgeStatus.AlreadyCurrent
InvalidWire = ReplaceEdgeStatus.InvalidWire
InvalidOldEdge = ReplaceEdgeStatus.InvalidOldEdge
InvalidNewEdge = ReplaceEdgeStatus.InvalidNewEdge
Disconnected = ReplaceEdgeStatus.Disconnected
};
/* end python proxy for enums */

		/****** BRepGraph_EditorView_WireOps::Add ******/
		/****** md5 signature: 8d1ca184f20f015b0857f939577905d5 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theCoEdgeIds: NCollection_Array1<BRepGraph_CoEdgeId>

Return
-------
BRepGraph_WireId

Description
-----------
Add a wire definition from pre-created CoEdges. Each CoEdge must be free-floating (no parent wire yet). The method binds all CoEdges to the new wire and updates relation tables. 
Input parameter: theCoEdgeIds ordered coedge identifiers 
Return: typed wire definition identifier, or invalid if any referenced coedge is invalid or already bound to a wire.
") Add;
		BRepGraph_WireId Add(const NCollection_Array1<BRepGraph_CoEdgeId> & theCoEdgeIds);

		/****** BRepGraph_EditorView_WireOps::CheckAppendCoEdge ******/
		/****** md5 signature: cc2a42d7f9f99b0ba18bece3ccc4e64d ******/
		%feature("compactdefaultargs") CheckAppendCoEdge;
		%feature("autodoc", "
Parameters
----------
theWire: BRepGraph_WireId
theCoEdgeId: BRepGraph_CoEdgeId

Return
-------
BRepGraph_EditorView_WireOps::CoEdgeOrderStatus

Description
-----------
Precheck appending a free CoEdge to an existing wire. 
Input parameter: theWire wire definition identifier 
Input parameter: theCoEdgeId free coedge candidate 
Return: status describing whether the append can preserve connected order.
") CheckAppendCoEdge;
		BRepGraph_EditorView_WireOps::CoEdgeOrderStatus CheckAppendCoEdge(const BRepGraph_WireId theWire, const BRepGraph_CoEdgeId theCoEdgeId);

		/****** BRepGraph_EditorView_WireOps::CheckCoEdgeOrder ******/
		/****** md5 signature: ccdb53b1fd105b1874bf3a363c7249d5 ******/
		%feature("compactdefaultargs") CheckCoEdgeOrder;
		%feature("autodoc", "
Parameters
----------
theCoEdgeIds: NCollection_Array1<BRepGraph_CoEdgeId>

Return
-------
BRepGraph_EditorView_WireOps::CoEdgeOrderStatus

Description
-----------
Precheck free-floating CoEdges for WireOps::Add(). 
Input parameter: theCoEdgeIds candidate coedge identifiers 
Return: status describing whether the input can form a wire.
") CheckCoEdgeOrder;
		BRepGraph_EditorView_WireOps::CoEdgeOrderStatus CheckCoEdgeOrder(const NCollection_Array1<BRepGraph_CoEdgeId> & theCoEdgeIds);

		/****** BRepGraph_EditorView_WireOps::CheckCoEdgeOrder ******/
		/****** md5 signature: b48c35576866404cbe01e13828da02a4 ******/
		%feature("compactdefaultargs") CheckCoEdgeOrder;
		%feature("autodoc", "
Parameters
----------
theWire: BRepGraph_WireId
theCoEdgeIds: NCollection_Array1<BRepGraph_CoEdgeId>

Return
-------
BRepGraph_EditorView_WireOps::CoEdgeOrderStatus

Description
-----------
Precheck owned CoEdges for WireOps::SetCoEdgeOrder(). 
Input parameter: theWire wire definition identifier 
Input parameter: theCoEdgeIds candidate coedge identifiers 
Return: status describing whether the input can replace the stored order.
") CheckCoEdgeOrder;
		BRepGraph_EditorView_WireOps::CoEdgeOrderStatus CheckCoEdgeOrder(const BRepGraph_WireId theWire, const NCollection_Array1<BRepGraph_CoEdgeId> & theCoEdgeIds);

		/****** BRepGraph_EditorView_WireOps::CheckReplaceEdge ******/
		/****** md5 signature: ad323a16eb434cb23037f98e5ed42a3c ******/
		%feature("compactdefaultargs") CheckReplaceEdge;
		%feature("autodoc", "
Parameters
----------
theWire: BRepGraph_WireId
theOldEdge: BRepGraph_EdgeId
theNewEdge: BRepGraph_EdgeId
theReversed: bool

Return
-------
BRepGraph_EditorView_WireOps::ReplaceEdgeStatus

Description
-----------
Precheck replacing one edge by another in an existing wire. 
Input parameter: theWire wire definition identifier 
Input parameter: theOldEdge edge currently used by one or more wire coedges 
Input parameter: theNewEdge replacement edge 
Input parameter: theReversed if true, replacement coedge orientation is reversed 
Return: status describing whether replacement preserves connected order.
") CheckReplaceEdge;
		BRepGraph_EditorView_WireOps::ReplaceEdgeStatus CheckReplaceEdge(const BRepGraph_WireId theWire, const BRepGraph_EdgeId theOldEdge, const BRepGraph_EdgeId theNewEdge, const bool theReversed);

		/****** BRepGraph_EditorView_WireOps::RemoveCoEdge ******/
		/****** md5 signature: 8cd99c4ea74bc95660d58d30f8ccca1d ******/
		%feature("compactdefaultargs") RemoveCoEdge;
		%feature("autodoc", "
Parameters
----------
theChildWireId: BRepGraph_WireId
theCoEdgeId: BRepGraph_CoEdgeId

Return
-------
bool

Description
-----------
Detach one exact coedge entry from a wire definition. Use BRepGraph_CoEdgesOfWire::CurrentId() when removing from a wire iterator. The method removes the exact ordered coedge entry, updates relation tables, and prunes the CoEdge node when it has no other active usages. 
Input parameter: theChildWireId wire definition identifier 
Input parameter: theCoEdgeId exact wire-owned coedge identifier 
Return: true if the active wire-owned usage was removed.
") RemoveCoEdge;
		bool RemoveCoEdge(const BRepGraph_WireId theChildWireId, const BRepGraph_CoEdgeId theCoEdgeId);

		/****** BRepGraph_EditorView_WireOps::ReplaceEdge ******/
		/****** md5 signature: 089159ca8f4416b934c448721e25a3bf ******/
		%feature("compactdefaultargs") ReplaceEdge;
		%feature("autodoc", "
Parameters
----------
theChildWireId: BRepGraph_WireId
theOldEdgeEntity: BRepGraph_EdgeId
theNewEdgeEntity: BRepGraph_EdgeId
theReversed: bool

Return
-------
None

Description
-----------
Replace one edge with another in a wire definition. Updates the CoEdge's EdgeIdx to point to the new edge, adjusts orientation if theReversed, and incrementally updates relation tables. 
Input parameter: theChildWireId wire definition identifier 
Input parameter: theOldEdgeEntity edge to replace 
Input parameter: theNewEdgeEntity replacement edge 
Input parameter: theReversed if true, reverse the orientation of the replacement.
") ReplaceEdge;
		void ReplaceEdge(const BRepGraph_WireId theChildWireId, const BRepGraph_EdgeId theOldEdgeEntity, const BRepGraph_EdgeId theNewEdgeEntity, const bool theReversed);

		/****** BRepGraph_EditorView_WireOps::Reverse ******/
		/****** md5 signature: cb2515caef45669b41e328141600c9ac ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "
Parameters
----------
theWire: BRepGraph_WireId

Return
-------
None

Description
-----------
Reverse the wire: flip the order of the wire's CoEdgeIds and flip each owned CoEdge's orientation. Used by healing/sewing to invert a loop. 
Input parameter: theWire wire definition identifier.
") Reverse;
		void Reverse(const BRepGraph_WireId theWire);

		/****** BRepGraph_EditorView_WireOps::SetCoEdgeOrder ******/
		/****** md5 signature: 48a216a583f00945898bae5358ddc0f9 ******/
		%feature("compactdefaultargs") SetCoEdgeOrder;
		%feature("autodoc", "
Parameters
----------
theWire: BRepGraph_WireId
theCoEdgeIds: NCollection_Array1<BRepGraph_CoEdgeId>

Return
-------
bool

Description
-----------
Replace the ordered CoEdge relation vector with a permutation of its current content. 
Input parameter: theWire wire definition identifier 
Input parameter: theCoEdgeIds new ordered CoEdge identifiers 
Return: true if the order was accepted and applied.
") SetCoEdgeOrder;
		bool SetCoEdgeOrder(const BRepGraph_WireId theWire, const NCollection_Array1<BRepGraph_CoEdgeId> & theCoEdgeIds);

		/****** BRepGraph_EditorView_WireOps::SetRefChildWireId ******/
		/****** md5 signature: 31118d81b6091c8f708fd327b45855b3 ******/
		%feature("compactdefaultargs") SetRefChildWireId;
		%feature("autodoc", "
Parameters
----------
theWireRef: BRepGraph_WireRefId
theWire: BRepGraph_WireId

Return
-------
None

Description
-----------
Rewire a wire reference to a different wire def (rebinds WireToFaces if parent is Face).
") SetRefChildWireId;
		void SetRefChildWireId(const BRepGraph_WireRefId theWireRef, const BRepGraph_WireId theWire);

		/****** BRepGraph_EditorView_WireOps::SetRefChildWireId ******/
		/****** md5 signature: 32331289d18b9c6caa0e81b252ed5f53 ******/
		%feature("compactdefaultargs") SetRefChildWireId;
		%feature("autodoc", "
Parameters
----------
theMut: BRepGraph_MutGuard<BRepGraphInc::WireRef>
theWire: BRepGraph_WireId

Return
-------
None

Description
-----------
No available documentation.
") SetRefChildWireId;
		void SetRefChildWireId(BRepGraph_MutGuard<BRepGraphInc::WireRef> & theMut, const BRepGraph_WireId theWire);

		/****** BRepGraph_EditorView_WireOps::SetRefOrientation ******/
		/****** md5 signature: 3062e9f9c6650081222604cbb018f9ed ******/
		%feature("compactdefaultargs") SetRefOrientation;
		%feature("autodoc", "
Parameters
----------
theWireRef: BRepGraph_WireRefId
theOrientation: BRepGraphInc::ParityOrientation

Return
-------
None

Description
-----------
Set the orientation of a wire reference.
") SetRefOrientation;
		void SetRefOrientation(const BRepGraph_WireRefId theWireRef, const BRepGraphInc::ParityOrientation theOrientation);

		/****** BRepGraph_EditorView_WireOps::SetRefOrientation ******/
		/****** md5 signature: e317256cba0e2668ada788a302138d70 ******/
		%feature("compactdefaultargs") SetRefOrientation;
		%feature("autodoc", "
Parameters
----------
theMut: BRepGraph_MutGuard<BRepGraphInc::WireRef>
theOrientation: BRepGraphInc::ParityOrientation

Return
-------
None

Description
-----------
No available documentation.
") SetRefOrientation;
		void SetRefOrientation(BRepGraph_MutGuard<BRepGraphInc::WireRef> & theMut, const BRepGraphInc::ParityOrientation theOrientation);

};


%extend BRepGraph_EditorView_WireOps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class BRepGraph_FaceId *
*************************/
class BRepGraph_FaceId {
	public:
		uint32_t Index;
		/****** BRepGraph_FaceId::BRepGraph_FaceId ******/
		/****** md5 signature: 4311b88151facb04e31a8f94c612d63e ******/
		%feature("compactdefaultargs") BRepGraph_FaceId;
		%feature("autodoc", "Return
-------
None

Description
-----------
Default: invalid (Index = UINT32_MAX).
") BRepGraph_FaceId;
		 BRepGraph_FaceId();

		/****** BRepGraph_FaceId::BRepGraph_FaceId ******/
		/****** md5 signature: 718adffe00b7c66230abfc0915fac1a6 ******/
		%feature("compactdefaultargs") BRepGraph_FaceId;
		%feature("autodoc", "
Parameters
----------
theIdx: uint32_t

Return
-------
None

Description
-----------
Construct from index.
") BRepGraph_FaceId;
		 BRepGraph_FaceId(const uint32_t theIdx);

		/****** BRepGraph_FaceId::BRepGraph_FaceId ******/
		/****** md5 signature: 06f9543631732e963a42611acebb8a88 ******/
		%feature("compactdefaultargs") BRepGraph_FaceId;
		%feature("autodoc", "
Parameters
----------
theId: BRepGraph_NodeId

Return
-------
None

Description
-----------
Construct from an untyped node id of the same kind.
") BRepGraph_FaceId;
		 BRepGraph_FaceId(const BRepGraph_NodeId theId);

		/****** BRepGraph_FaceId::FromNodeId ******/
		/****** md5 signature: 446894b9c1847edab23d1c81f8aa599c ******/
		%feature("compactdefaultargs") FromNodeId;
		%feature("autodoc", "
Parameters
----------
theId: BRepGraph_NodeId

Return
-------
BRepGraph_FaceId

Description
-----------
Explicit conversion from untyped NodeId. Asserts that the Kind matches in debug builds. 
Input parameter: theId untyped NodeId to convert.
") FromNodeId;
		static BRepGraph_FaceId FromNodeId(const BRepGraph_NodeId theId);

		/****** BRepGraph_FaceId::Invalid ******/
		/****** md5 signature: 19622d4f1c44c5c7e384ccc5986fb8d8 ******/
		%feature("compactdefaultargs") Invalid;
		%feature("autodoc", "Return
-------
BRepGraph_FaceId

Description
-----------
Invalid sentinel id.
") Invalid;
		static BRepGraph_FaceId Invalid();

		/****** BRepGraph_FaceId::IsOwned ******/
		/****** md5 signature: 82162d9fddf9bcd26161cc7f9c342a8b ******/
		%feature("compactdefaultargs") IsOwned;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph

Return
-------
bool

Description
-----------
Return true if this node has an active owner in the given graph.
") IsOwned;
		bool IsOwned(const BRepGraph & theGraph);

		/****** BRepGraph_FaceId::IsRemoved ******/
		/****** md5 signature: 75ed1923a75d2c35c92a9683349c6622 ******/
		%feature("compactdefaultargs") IsRemoved;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph

Return
-------
bool

Description
-----------
Return true if this node has been soft-removed in the given graph.
") IsRemoved;
		bool IsRemoved(const BRepGraph & theGraph);

		/****** BRepGraph_FaceId::IsValid ******/
		/****** md5 signature: 735088818cf24ebe0ebc7005a507da69 ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if this id points to an allocated node slot.
") IsValid;
		bool IsValid();

		/****** BRepGraph_FaceId::IsValid ******/
		/****** md5 signature: 294f20297d740c99df23b64d8041b57c ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "
Parameters
----------
theMaxCount: uint32_t

Return
-------
bool

Description
-----------
True if this id points to an allocated slot within [0, theMaxCount). UINT32_MAX (invalid sentinel) always fails this check for any realistic count.
") IsValid;
		bool IsValid(const uint32_t theMaxCount);

		/****** BRepGraph_FaceId::Start ******/
		/****** md5 signature: fc9e9cfb659953f8d767f808052e7c04 ******/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "Return
-------
BRepGraph_FaceId

Description
-----------
First valid id in a dense per-kind sequence.
") Start;
		static BRepGraph_FaceId Start();


%extend{
    bool __ne_wrapper__(BRepGraph_FaceId other) {
        if (*self!=other) return true;
        else return false;
    }
}
%pythoncode {
def __ne__(self, right):
    try:
        return self.__ne_wrapper__(right)
    except:
        return True
}

%extend{
    bool __ne_wrapper__(const BRepGraph_NodeId other) {
        if (*self!=other) return true;
        else return false;
    }
}
%pythoncode {
def __ne__(self, right):
    try:
        return self.__ne_wrapper__(right)
    except:
        return True
}
		/****** BRepGraph_FaceId::operator + ******/
		/****** md5 signature: c69f1fde8a4abf6a73054fa1db2c1fe3 ******/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "
Parameters
----------
theOffset: uint32_t

Return
-------
BRepGraph_FaceId

Description
-----------
Advance by offset.
") operator +;
		BRepGraph_FaceId operator +(const uint32_t theOffset);

		/****** BRepGraph_FaceId::operator - ******/
		/****** md5 signature: 05213caff5555da9f8d7e29a9b6a1930 ******/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "
Parameters
----------
theOffset: uint32_t

Return
-------
BRepGraph_FaceId

Description
-----------
Retreat by offset.
") operator -;
		BRepGraph_FaceId operator -(const uint32_t theOffset);


%extend{
    bool __eq_wrapper__(BRepGraph_FaceId other) {
        if (*self==other) return true;
        else return false;
    }
}
%pythoncode {
def __eq__(self, right):
    try:
        return self.__eq_wrapper__(right)
    except:
        return False
}

%extend{
    bool __eq_wrapper__(const BRepGraph_NodeId other) {
        if (*self==other) return true;
        else return false;
    }
}
%pythoncode {
def __eq__(self, right):
    try:
        return self.__eq_wrapper__(right)
    except:
        return False
}
};


%extend BRepGraph_FaceId {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class BRepGraph_FaceRefId *
****************************/
class BRepGraph_FaceRefId {
	public:
		uint32_t Index;
		/****** BRepGraph_FaceRefId::BRepGraph_FaceRefId ******/
		/****** md5 signature: 4311b88151facb04e31a8f94c612d63e ******/
		%feature("compactdefaultargs") BRepGraph_FaceRefId;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepGraph_FaceRefId;
		 BRepGraph_FaceRefId();

		/****** BRepGraph_FaceRefId::BRepGraph_FaceRefId ******/
		/****** md5 signature: 718adffe00b7c66230abfc0915fac1a6 ******/
		%feature("compactdefaultargs") BRepGraph_FaceRefId;
		%feature("autodoc", "
Parameters
----------
theIdx: uint32_t

Return
-------
None

Description
-----------
No available documentation.
") BRepGraph_FaceRefId;
		 BRepGraph_FaceRefId(const uint32_t theIdx);

		/****** BRepGraph_FaceRefId::BRepGraph_FaceRefId ******/
		/****** md5 signature: 7e80a924fe12a8fa6b68aba27507a9ea ******/
		%feature("compactdefaultargs") BRepGraph_FaceRefId;
		%feature("autodoc", "
Parameters
----------
theRefId: BRepGraph_RefId

Return
-------
None

Description
-----------
Construct from an untyped reference id of the same kind.
") BRepGraph_FaceRefId;
		 BRepGraph_FaceRefId(const BRepGraph_RefId theRefId);

		/****** BRepGraph_FaceRefId::FromRefId ******/
		/****** md5 signature: 2c83b1a5f2a415c6daf522ac4df93236 ******/
		%feature("compactdefaultargs") FromRefId;
		%feature("autodoc", "
Parameters
----------
theRefId: BRepGraph_RefId

Return
-------
BRepGraph_FaceRefId

Description
-----------
No available documentation.
") FromRefId;
		static BRepGraph_FaceRefId FromRefId(const BRepGraph_RefId theRefId);

		/****** BRepGraph_FaceRefId::Invalid ******/
		/****** md5 signature: 19622d4f1c44c5c7e384ccc5986fb8d8 ******/
		%feature("compactdefaultargs") Invalid;
		%feature("autodoc", "Return
-------
BRepGraph_FaceRefId

Description
-----------
Invalid sentinel id.
") Invalid;
		static BRepGraph_FaceRefId Invalid();

		/****** BRepGraph_FaceRefId::IsOwned ******/
		/****** md5 signature: 82162d9fddf9bcd26161cc7f9c342a8b ******/
		%feature("compactdefaultargs") IsOwned;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph

Return
-------
bool

Description
-----------
Return true if this reference entry has an active owner in the given graph.
") IsOwned;
		bool IsOwned(const BRepGraph & theGraph);

		/****** BRepGraph_FaceRefId::IsRemoved ******/
		/****** md5 signature: 75ed1923a75d2c35c92a9683349c6622 ******/
		%feature("compactdefaultargs") IsRemoved;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph

Return
-------
bool

Description
-----------
Return true if this reference entry has been soft-removed in the given graph.
") IsRemoved;
		bool IsRemoved(const BRepGraph & theGraph);

		/****** BRepGraph_FaceRefId::IsValid ******/
		/****** md5 signature: 735088818cf24ebe0ebc7005a507da69 ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsValid;
		bool IsValid();

		/****** BRepGraph_FaceRefId::IsValid ******/
		/****** md5 signature: 294f20297d740c99df23b64d8041b57c ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "
Parameters
----------
theMaxCount: uint32_t

Return
-------
bool

Description
-----------
True if this id points to an allocated slot within [0, theMaxCount). UINT32_MAX (invalid sentinel) always fails this check for any realistic count.
") IsValid;
		bool IsValid(const uint32_t theMaxCount);

		/****** BRepGraph_FaceRefId::Start ******/
		/****** md5 signature: fc9e9cfb659953f8d767f808052e7c04 ******/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "Return
-------
BRepGraph_FaceRefId

Description
-----------
First valid id in a dense per-kind sequence.
") Start;
		static BRepGraph_FaceRefId Start();


%extend{
    bool __ne_wrapper__(BRepGraph_FaceRefId other) {
        if (*self!=other) return true;
        else return false;
    }
}
%pythoncode {
def __ne__(self, right):
    try:
        return self.__ne_wrapper__(right)
    except:
        return True
}

%extend{
    bool __ne_wrapper__(const BRepGraph_RefId other) {
        if (*self!=other) return true;
        else return false;
    }
}
%pythoncode {
def __ne__(self, right):
    try:
        return self.__ne_wrapper__(right)
    except:
        return True
}
		/****** BRepGraph_FaceRefId::operator + ******/
		/****** md5 signature: c69f1fde8a4abf6a73054fa1db2c1fe3 ******/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "
Parameters
----------
theOffset: uint32_t

Return
-------
BRepGraph_FaceRefId

Description
-----------
Advance by offset.
") operator +;
		BRepGraph_FaceRefId operator +(const uint32_t theOffset);

		/****** BRepGraph_FaceRefId::operator - ******/
		/****** md5 signature: 05213caff5555da9f8d7e29a9b6a1930 ******/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "
Parameters
----------
theOffset: uint32_t

Return
-------
BRepGraph_FaceRefId

Description
-----------
Retreat by offset.
") operator -;
		BRepGraph_FaceRefId operator -(const uint32_t theOffset);


%extend{
    bool __eq_wrapper__(BRepGraph_FaceRefId other) {
        if (*self==other) return true;
        else return false;
    }
}
%pythoncode {
def __eq__(self, right):
    try:
        return self.__eq_wrapper__(right)
    except:
        return False
}

%extend{
    bool __eq_wrapper__(const BRepGraph_RefId other) {
        if (*self==other) return true;
        else return false;
    }
}
%pythoncode {
def __eq__(self, right):
    try:
        return self.__eq_wrapper__(right)
    except:
        return False
}
};


%extend BRepGraph_FaceRefId {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class BRepGraph_ItemId *
*************************/
class BRepGraph_ItemId {
	public:
/* public enums */
enum class Domain {
	None = 0,
	Node = 1,
	Reference = 2,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class Domain(IntEnum):
	None_ = 0
	Node = 1
	Reference = 2
None_ = Domain.None_
Node = Domain.Node
Reference = Domain.Reference
};
/* end python proxy for enums */

		/****** BRepGraph_ItemId::BRepGraph_ItemId ******/
		/****** md5 signature: 0b8805451c27391abaa9774d5901258b ******/
		%feature("compactdefaultargs") BRepGraph_ItemId;
		%feature("autodoc", "Return
-------
None

Description
-----------
Construct an invalid item id.
") BRepGraph_ItemId;
		 BRepGraph_ItemId();

		/****** BRepGraph_ItemId::BRepGraph_ItemId ******/
		/****** md5 signature: 9ed154a386520f4b14ccf95cd0beb7f4 ******/
		%feature("compactdefaultargs") BRepGraph_ItemId;
		%feature("autodoc", "
Parameters
----------
theNode: BRepGraph_NodeId

Return
-------
None

Description
-----------
Construct a node item id.
") BRepGraph_ItemId;
		 BRepGraph_ItemId(const BRepGraph_NodeId theNode);

		/****** BRepGraph_ItemId::BRepGraph_ItemId ******/
		/****** md5 signature: 7498f3d55a9663b5b10395963e01d36b ******/
		%feature("compactdefaultargs") BRepGraph_ItemId;
		%feature("autodoc", "
Parameters
----------
theRef: BRepGraph_RefId

Return
-------
None

Description
-----------
Construct a reference item id.
") BRepGraph_ItemId;
		 BRepGraph_ItemId(const BRepGraph_RefId theRef);

		/****** BRepGraph_ItemId::Index ******/
		/****** md5 signature: 1a41cd404923ce7a8bc5dcb0fa93c31d ******/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Return
-------
uint32_t

Description
-----------
Return item per-kind index.
") Index;
		uint32_t Index();

		/****** BRepGraph_ItemId::IsNode ******/
		/****** md5 signature: d41c17325504294a0fef760819c6c96b ******/
		%feature("compactdefaultargs") IsNode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true if this item addresses a definition node.
") IsNode;
		bool IsNode();

		/****** BRepGraph_ItemId::IsReference ******/
		/****** md5 signature: 5f3f3cd9a45efd271c7c43304a5d9e42 ******/
		%feature("compactdefaultargs") IsReference;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true if this item addresses a reference entry.
") IsReference;
		bool IsReference();

		/****** BRepGraph_ItemId::IsValid ******/
		/****** md5 signature: f6c8ceac22636b510354e0423665508c ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true if this item addresses a graph object.
") IsValid;
		bool IsValid();

		/****** BRepGraph_ItemId::ItemDomain ******/
		/****** md5 signature: f633ed9f0d0632cbb2638d128d51cb15 ******/
		%feature("compactdefaultargs") ItemDomain;
		%feature("autodoc", "Return
-------
BRepGraph_ItemId::Domain

Description
-----------
Return the addressed domain.
") ItemDomain;
		BRepGraph_ItemId::Domain ItemDomain();

		/****** BRepGraph_ItemId::Kind ******/
		/****** md5 signature: 85b71f27b550d8f1eedc2d4091ba0755 ******/
		%feature("compactdefaultargs") Kind;
		%feature("autodoc", "Return
-------
uint8_t

Description
-----------
Return item kind encoded in its own domain enum space.
") Kind;
		uint8_t Kind();

		/****** BRepGraph_ItemId::NodeId ******/
		/****** md5 signature: b98b58a3086296f4dabc386bd81d09fb ******/
		%feature("compactdefaultargs") NodeId;
		%feature("autodoc", "Return
-------
BRepGraph_NodeId

Description
-----------
Convert to node id. Returns invalid id for non-node items.
") NodeId;
		BRepGraph_NodeId NodeId();

		/****** BRepGraph_ItemId::NodeKind ******/
		/****** md5 signature: 4b52fc850cff1b70bbe252f65a5dfa25 ******/
		%feature("compactdefaultargs") NodeKind;
		%feature("autodoc", "Return
-------
BRepGraph_NodeId::Kind

Description
-----------
Return node kind. Valid only when IsNode() is true.
") NodeKind;
		BRepGraph_NodeId::Kind NodeKind();

		/****** BRepGraph_ItemId::RawKind ******/
		/****** md5 signature: b17856e8c32515957e605a2b96aa8f6c ******/
		%feature("compactdefaultargs") RawKind;
		%feature("autodoc", "Return
-------
uint8_t

Description
-----------
Return item kind encoded in its own domain enum space.
") RawKind;
		uint8_t RawKind();

		/****** BRepGraph_ItemId::RefId ******/
		/****** md5 signature: 32593c963c15c8f9911047c0ffdde6ae ******/
		%feature("compactdefaultargs") RefId;
		%feature("autodoc", "Return
-------
BRepGraph_RefId

Description
-----------
Convert to reference id. Returns invalid id for non-reference items.
") RefId;
		BRepGraph_RefId RefId();

		/****** BRepGraph_ItemId::RefKind ******/
		/****** md5 signature: 053d85a467e30a2834b432c7bdefe248 ******/
		%feature("compactdefaultargs") RefKind;
		%feature("autodoc", "Return
-------
BRepGraph_RefId::Kind

Description
-----------
Return reference kind. Valid only when IsReference() is true.
") RefKind;
		BRepGraph_RefId::Kind RefKind();

};


%extend BRepGraph_ItemId {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class BRepGraph_ItemUID *
**************************/
class BRepGraph_ItemUID {
	public:
/* public enums */
enum class Domain {
	None = 0,
	Node = 1,
	Reference = 2,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class Domain(IntEnum):
	None_ = 0
	Node = 1
	Reference = 2
None_ = Domain.None_
Node = Domain.Node
Reference = Domain.Reference
};
/* end python proxy for enums */

		/****** BRepGraph_ItemUID::BRepGraph_ItemUID ******/
		/****** md5 signature: 7f4563a3feeb447ba73fd467e681f45f ******/
		%feature("compactdefaultargs") BRepGraph_ItemUID;
		%feature("autodoc", "Return
-------
None

Description
-----------
Construct an invalid UID.
") BRepGraph_ItemUID;
		 BRepGraph_ItemUID();

		/****** BRepGraph_ItemUID::Counter ******/
		/****** md5 signature: 060be3d0ca00eccc3de81b0ca0c1928a ******/
		%feature("compactdefaultargs") Counter;
		%feature("autodoc", "Return
-------
size_t

Description
-----------
Return the graph-wide monotonic UID counter.
") Counter;
		size_t Counter();

		/****** BRepGraph_ItemUID::HashValue ******/
		/****** md5 signature: cfafde6dce6a8bec2e309186d08373c6 ******/
		%feature("compactdefaultargs") HashValue;
		%feature("autodoc", "Return
-------
size_t

Description
-----------
Compute a hash value compatible with operator==.
") HashValue;
		size_t HashValue();

		/****** BRepGraph_ItemUID::Invalid ******/
		/****** md5 signature: 71e2cc3169d4b64199da14ed27962448 ******/
		%feature("compactdefaultargs") Invalid;
		%feature("autodoc", "Return
-------
BRepGraph_ItemUID

Description
-----------
Return an invalid sentinel UID.
") Invalid;
		static BRepGraph_ItemUID Invalid();

		/****** BRepGraph_ItemUID::IsNode ******/
		/****** md5 signature: d41c17325504294a0fef760819c6c96b ******/
		%feature("compactdefaultargs") IsNode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsNode;
		bool IsNode();

		/****** BRepGraph_ItemUID::IsReference ******/
		/****** md5 signature: 5f3f3cd9a45efd271c7c43304a5d9e42 ******/
		%feature("compactdefaultargs") IsReference;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsReference;
		bool IsReference();

		/****** BRepGraph_ItemUID::IsValid ******/
		/****** md5 signature: f6c8ceac22636b510354e0423665508c ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true if this UID has a non-sentinel counter and a valid domain/kind pair.
") IsValid;
		bool IsValid();

		/****** BRepGraph_ItemUID::ItemDomain ******/
		/****** md5 signature: f633ed9f0d0632cbb2638d128d51cb15 ******/
		%feature("compactdefaultargs") ItemDomain;
		%feature("autodoc", "Return
-------
BRepGraph_ItemUID::Domain

Description
-----------
Return the addressed identity domain.
") ItemDomain;
		BRepGraph_ItemUID::Domain ItemDomain();

		/****** BRepGraph_ItemUID::Node ******/
		/****** md5 signature: 0246c76be55e4411d383afb4bc9946bc ******/
		%feature("compactdefaultargs") Node;
		%feature("autodoc", "
Parameters
----------
theKind: BRepGraph_NodeId::Kind
theCounter: size_t

Return
-------
BRepGraph_ItemUID

Description
-----------
Construct a node UID.
") Node;
		static BRepGraph_ItemUID Node(const BRepGraph_NodeId::Kind theKind, const size_t theCounter);

		/****** BRepGraph_ItemUID::NodeKind ******/
		/****** md5 signature: 4b52fc850cff1b70bbe252f65a5dfa25 ******/
		%feature("compactdefaultargs") NodeKind;
		%feature("autodoc", "Return
-------
BRepGraph_NodeId::Kind

Description
-----------
Return node kind. Valid only for node UIDs.
") NodeKind;
		BRepGraph_NodeId::Kind NodeKind();

		/****** BRepGraph_ItemUID::RawKind ******/
		/****** md5 signature: b17856e8c32515957e605a2b96aa8f6c ******/
		%feature("compactdefaultargs") RawKind;
		%feature("autodoc", "Return
-------
uint8_t

Description
-----------
Return item kind encoded in its own domain enum space.
") RawKind;
		uint8_t RawKind();

		/****** BRepGraph_ItemUID::RefKind ******/
		/****** md5 signature: 053d85a467e30a2834b432c7bdefe248 ******/
		%feature("compactdefaultargs") RefKind;
		%feature("autodoc", "Return
-------
BRepGraph_RefId::Kind

Description
-----------
Return reference kind. Valid only for reference UIDs.
") RefKind;
		BRepGraph_RefId::Kind RefKind();

		/****** BRepGraph_ItemUID::Reference ******/
		/****** md5 signature: ca341d275eb7ee1b6a8c0ecd2d2c231a ******/
		%feature("compactdefaultargs") Reference;
		%feature("autodoc", "
Parameters
----------
theKind: BRepGraph_RefId::Kind
theCounter: size_t

Return
-------
BRepGraph_ItemUID

Description
-----------
Construct a reference UID.
") Reference;
		static BRepGraph_ItemUID Reference(const BRepGraph_RefId::Kind theKind, const size_t theCounter);

};


%extend BRepGraph_ItemUID {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class BRepGraph_Iterator *
***************************/
/************************
* class BRepGraph_Layer *
************************/
%nodefaultctor BRepGraph_Layer;
class BRepGraph_Layer : public Standard_Transient {
	public:
		/****** BRepGraph_Layer::Clear ******/
		/****** md5 signature: d26f903cd9f1a4ce9aa9c86c5d7047c1 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clear all stored data.
") Clear;
		virtual void Clear();

		/****** BRepGraph_Layer::CopyTo ******/
		/****** md5 signature: 3a67b971acc9fdd36a5b70289a26a278 ******/
		%feature("compactdefaultargs") CopyTo;
		%feature("autodoc", "
Parameters
----------
theCopy: BRepGraph_CopyRemap

Return
-------
None

Description
-----------
Copy this source layer data into another graph. The source graph is the graph this layer is attached to (Graph()). 
Input parameter: theCopy source graph, target graph, and source item id -> target item id remap @note Missing source items were not copied; persistent layers should skip dependent records. @note For BRepGraph_CopyRemap::Mode::Compact, the layer is being migrated in-place after structural compaction. UID/ItemUID records and ref/rep entries should be remapped through the item map. Stale entries (absent from the remap) should be dropped. @warning This callback may allocate and is intentionally not noexcept.
") CopyTo;
		virtual void CopyTo(const BRepGraph_CopyRemap & theCopy);

		/****** BRepGraph_Layer::ID ******/
		/****** md5 signature: e94b659c9e9f7b7f43797fc28e2b97f9 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Layer type identity (unique within a graph).
") ID;
		virtual const Standard_GUID & ID();

		/****** BRepGraph_Layer::InvalidateAll ******/
		/****** md5 signature: 8f282202a2531ba3fc931461570945f0 ******/
		%feature("compactdefaultargs") InvalidateAll;
		%feature("autodoc", "Return
-------
None

Description
-----------
Mark all cached values dirty (bulk invalidation).
") InvalidateAll;
		virtual void InvalidateAll();

		/****** BRepGraph_Layer::KindBit ******/
		/****** md5 signature: af02047175aba5339a35db877591bff6 ******/
		%feature("compactdefaultargs") KindBit;
		%feature("autodoc", "
Parameters
----------
theKind: BRepGraph_NodeId::Kind

Return
-------
int

Description
-----------
Convenience: return bitmask bit for a given Kind.
") KindBit;
		static int KindBit(const BRepGraph_NodeId::Kind theKind);

		/****** BRepGraph_Layer::Name ******/
		/****** md5 signature: 5fd48d13d17a8de0cb1f2b03a41c32b1 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Layer identity (unique within a graph).
") Name;
		virtual const TCollection_AsciiString & Name();

		/****** BRepGraph_Layer::OnItemModified ******/
		/****** md5 signature: 7fe150abcda0503512509fef88c894d9 ******/
		%feature("compactdefaultargs") OnItemModified;
		%feature("autodoc", "
Parameters
----------
theItem: BRepGraph_ItemId

Return
-------
None

Description
-----------
Dispatch a generic item modification to the matching typed modification callback. This is a non-virtual convenience entry point; typed callbacks remain the extension points for derived layers. 
Input parameter: theItem the modified definition or reference.
") OnItemModified;
		void OnItemModified(const BRepGraph_ItemId theItem);

		/****** BRepGraph_Layer::OnItemRemoved ******/
		/****** md5 signature: 54ab3d376117c7888a822a42a75fce8d ******/
		%feature("compactdefaultargs") OnItemRemoved;
		%feature("autodoc", "
Parameters
----------
theItem: BRepGraph_ItemId

Return
-------
None

Description
-----------
Dispatch a generic item removal to the matching typed removal callback. This is a non-virtual convenience entry point; typed callbacks remain the extension points for derived layers. 
Input parameter: theItem the removed definition or reference.
") OnItemRemoved;
		void OnItemRemoved(const BRepGraph_ItemId theItem);

		/****** BRepGraph_Layer::OnNodeModified ******/
		/****** md5 signature: 0855713c0fb7df2d94d77c3a6b8a4f4a ******/
		%feature("compactdefaultargs") OnNodeModified;
		%feature("autodoc", "
Parameters
----------
theNode: BRepGraph_NodeId

Return
-------
None

Description
-----------
Called in immediate (non-deferred) mode after a single node is modified. Only dispatched if the node's kind matches SubscribedKinds(). Default: no-op. 
Input parameter: theNode the modified node.
") OnNodeModified;
		virtual void OnNodeModified(const BRepGraph_NodeId theNode);

		/****** BRepGraph_Layer::OnNodeRemoved ******/
		/****** md5 signature: 2d64a2c9778b5165dbfc5236f4548d1c ******/
		%feature("compactdefaultargs") OnNodeRemoved;
		%feature("autodoc", "
Parameters
----------
theNode: BRepGraph_NodeId

Return
-------
None

Description
-----------
Called when a node is soft-removed without a replacement. 
Input parameter: theNode the removed node Layers should discard or archive data associated with it. @warning Layer callbacks must not throw. They are called from noexcept notification paths (MutGuard destructors, deferred invalidation flush).
") OnNodeRemoved;
		virtual void OnNodeRemoved(const BRepGraph_NodeId theNode);

		/****** BRepGraph_Layer::OnNodeReplaced ******/
		/****** md5 signature: 40c0c4922ccc98c3be511e6a526c9e3c ******/
		%feature("compactdefaultargs") OnNodeReplaced;
		%feature("autodoc", "
Parameters
----------
theOldNode: BRepGraph_NodeId
theNewNode: BRepGraph_NodeId

Return
-------
None

Description
-----------
Called when a node is soft-removed and replaced by another node. 
Input parameter: theOldNode the removed node 
Input parameter: theNewNode the node that replaces theOldNode Layers that store node-keyed data should migrate from theOldNode to theNewNode when the replacement kind is compatible. This is a structural lifecycle event, not an algorithmic history record. @warning Layer callbacks must not throw. They are called from noexcept notification paths (MutGuard destructors, deferred invalidation flush).
") OnNodeReplaced;
		virtual void OnNodeReplaced(const BRepGraph_NodeId theOldNode, const BRepGraph_NodeId theNewNode);

		/****** BRepGraph_Layer::OnNodesModified ******/
		/****** md5 signature: 135462999cd92d194f6621fcbb6805c3 ******/
		%feature("compactdefaultargs") OnNodesModified;
		%feature("autodoc", "
Parameters
----------
theModifiedNodes: NCollection_Array1<BRepGraph_NodeId>

Return
-------
None

Description
-----------
Called after EndDeferredInvalidation() with all nodes modified during the deferred scope. Only dispatched if at least one modified node's kind matches SubscribedKinds(). The array may contain nodes of kinds not subscribed to - layers should filter internally if needed. Default: no-op. 
Input parameter: theModifiedNodes all modified, non-removed nodes.
") OnNodesModified;
		virtual void OnNodesModified(const NCollection_Array1<BRepGraph_NodeId> & theModifiedNodes);

		/****** BRepGraph_Layer::OnRefModified ******/
		/****** md5 signature: 0e1a542d936154a42c6704ac6fff1505 ******/
		%feature("compactdefaultargs") OnRefModified;
		%feature("autodoc", "
Parameters
----------
theRef: BRepGraph_RefId

Return
-------
None

Description
-----------
Called in immediate (non-deferred) mode after a single ref is mutated. Only dispatched if the ref's kind matches SubscribedRefKinds(). Default: no-op. 
Input parameter: theRef the modified reference.
") OnRefModified;
		virtual void OnRefModified(const BRepGraph_RefId theRef);

		/****** BRepGraph_Layer::OnRefRemoved ******/
		/****** md5 signature: 520a4c26ec39dd44cdc64cb4b7013af9 ******/
		%feature("compactdefaultargs") OnRefRemoved;
		%feature("autodoc", "
Parameters
----------
theRef: BRepGraph_RefId

Return
-------
None

Description
-----------
Called when a reference is soft-deleted via RemoveRef(). No replacement concept - refs are simply removed (unlike nodes which can have a replacement during sewing or deduplication). Dispatched to all layers regardless of SubscribedRefKinds(). Default: no-op. 
Input parameter: theRef the removed reference.
") OnRefRemoved;
		virtual void OnRefRemoved(const BRepGraph_RefId theRef);

		/****** BRepGraph_Layer::OnRefsModified ******/
		/****** md5 signature: d06bf79f23a75d6afffb240f3b627f97 ******/
		%feature("compactdefaultargs") OnRefsModified;
		%feature("autodoc", "
Parameters
----------
theModifiedRefs: NCollection_Array1<BRepGraph_RefId>

Return
-------
None

Description
-----------
Called after EndDeferredInvalidation() with all refs modified during the deferred scope. Only dispatched if at least one modified ref's kind matches SubscribedRefKinds(). The array may contain refs of kinds not subscribed to - layers should filter internally if needed. Default: no-op. 
Input parameter: theModifiedRefs all modified, non-removed refs.
") OnRefsModified;
		virtual void OnRefsModified(const NCollection_Array1<BRepGraph_RefId> & theModifiedRefs);

		/****** BRepGraph_Layer::RefKindBit ******/
		/****** md5 signature: d416bd7354ecefd458532c641e99025c ******/
		%feature("compactdefaultargs") RefKindBit;
		%feature("autodoc", "
Parameters
----------
theKind: BRepGraph_RefId::Kind

Return
-------
int

Description
-----------
Convenience: return bitmask bit for a given RefId::Kind.
") RefKindBit;
		static int RefKindBit(const BRepGraph_RefId::Kind theKind);

		/****** BRepGraph_Layer::Revision ******/
		/****** md5 signature: c80316b27b453f13a1de300c37f673b5 ******/
		%feature("compactdefaultargs") Revision;
		%feature("autodoc", "Return
-------
uint64_t

Description
-----------
Monotonic revision counter incremented by touch() on every observable state change. Consumers compare stored revisions to detect staleness in O(1). Derived layers MUST call touch() from their mutators.
") Revision;
		uint64_t Revision();

		/****** BRepGraph_Layer::SubscribedKinds ******/
		/****** md5 signature: a396434837943759ef176bf3040888d1 ******/
		%feature("compactdefaultargs") SubscribedKinds;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return a bitmask of BRepGraph_NodeId::Kind values this layer subscribes to. Only modification events matching subscribed kinds are dispatched. Default: 0 (no subscription - no modification events received). Override to receive OnNodeModified/OnNodesModified callbacks. The returned value must be constant for the lifetime of the layer.
") SubscribedKinds;
		virtual int SubscribedKinds();

		/****** BRepGraph_Layer::SubscribedRefKinds ******/
		/****** md5 signature: 73e937ef98530d8312c5474c30e21d8e ******/
		%feature("compactdefaultargs") SubscribedRefKinds;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return a bitmask of BRepGraph_RefId::Kind values this layer subscribes to. Only modification events matching subscribed ref kinds are dispatched. Default: 0 (no subscription). Must be constant for the layer's lifetime.
") SubscribedRefKinds;
		virtual int SubscribedRefKinds();

};


%make_alias(BRepGraph_Layer)

%extend BRepGraph_Layer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class BRepGraph_LayerDeferred_Entry *
**************************************/
/************************************************************
* class BRepGraph_LayerDeferred_Entry_RepresentationStorage *
************************************************************/
/***********************************************
* class BRepGraph_LayerDeferred_Representation *
***********************************************/
/*************************************
* class BRepGraph_LayerHistory_Event *
*************************************/
class BRepGraph_LayerHistory_Event {
	public:
		TCollection_AsciiString OperationName;
		size_t SequenceNumber;
		BRepGraph_LayerHistory::Kind RecordKind;
		TCollection_AsciiString ExtraInfo;
		/****** BRepGraph_LayerHistory_Event::BRepGraph_LayerHistory_Event ******/
		/****** md5 signature: 3ae1c65d40232f0437cba8addbec5c14 ******/
		%feature("compactdefaultargs") BRepGraph_LayerHistory_Event;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepGraph_LayerHistory_Event;
		 BRepGraph_LayerHistory_Event();

};


%extend BRepGraph_LayerHistory_Event {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class BRepGraph_LayerIterator *
********************************/
class BRepGraph_LayerIterator {
	public:
		/****** BRepGraph_LayerIterator::BRepGraph_LayerIterator ******/
		/****** md5 signature: 2f0bdd21fb6f274c4a99295fb76f5935 ******/
		%feature("compactdefaultargs") BRepGraph_LayerIterator;
		%feature("autodoc", "
Parameters
----------
theRegistry: BRepGraph_LayerRegistry

Return
-------
None

Description
-----------
Construct an iterator over all layers in the registry.
") BRepGraph_LayerIterator;
		 BRepGraph_LayerIterator(const BRepGraph_LayerRegistry & theRegistry);

		/****** BRepGraph_LayerIterator::More ******/
		/****** md5 signature: 0a7b505ff53e438121f2c208f8ae7ce8 ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if the iterator has a current element.
") More;
		bool More();

		/****** BRepGraph_LayerIterator::NbLayers ******/
		/****** md5 signature: 58aa6b2d768c172a60f126f8128ba98a ******/
		%feature("compactdefaultargs") NbLayers;
		%feature("autodoc", "Return
-------
uint32_t

Description
-----------
Number of layers in the registry.
") NbLayers;
		uint32_t NbLayers();

		/****** BRepGraph_LayerIterator::Next ******/
		/****** md5 signature: 1201a55f750036045cd397a65f07fc7d ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
Advance to the next layer.
") Next;
		void Next();

		/****** BRepGraph_LayerIterator::Slot ******/
		/****** md5 signature: 873f9fbb83797a87e273432c9d9916f1 ******/
		%feature("compactdefaultargs") Slot;
		%feature("autodoc", "Return
-------
uint32_t

Description
-----------
Return the current slot index in the registry.
") Slot;
		uint32_t Slot();

		/****** BRepGraph_LayerIterator::Value ******/
		/****** md5 signature: cd1ff2ca71c1c9848db805c446c660fe ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<BRepGraph_Layer>

Description
-----------
Return the current layer handle.
") Value;
		opencascade::handle<BRepGraph_Layer> Value();

		/****** BRepGraph_LayerIterator::begin ******/
		/****** md5 signature: 0c3fbb731a7ccc8a39936c0c81a8fca7 ******/
		%feature("compactdefaultargs") begin;
		%feature("autodoc", "Return
-------
NCollection_ForwardRangeIterator<BRepGraph_LayerIterator >

Description
-----------
STL range-for support.
") begin;
		NCollection_ForwardRangeIterator<BRepGraph_LayerIterator > begin();

		/****** BRepGraph_LayerIterator::end ******/
		/****** md5 signature: 4edef9faa595e2b9527109cc32e6ec32 ******/
		%feature("compactdefaultargs") end;
		%feature("autodoc", "Return
-------
NCollection_ForwardRangeSentinel

Description
-----------
Sentinel marking end of iteration.
") end;
		NCollection_ForwardRangeSentinel end();

};


%extend BRepGraph_LayerIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class BRepGraph_LayerLock_ScopedOwnerEdit *
********************************************/
class BRepGraph_LayerLock_ScopedOwnerEdit {
	public:
		/****** BRepGraph_LayerLock_ScopedOwnerEdit::BRepGraph_LayerLock_ScopedOwnerEdit ******/
		/****** md5 signature: a79f39b8da795db317b535946414e9af ******/
		%feature("compactdefaultargs") BRepGraph_LayerLock_ScopedOwnerEdit;
		%feature("autodoc", "
Parameters
----------
theLayer: BRepGraph_LayerLock
theItem: BRepGraph_ItemId
theOwnerId: Standard_GUID

Return
-------
None

Description
-----------
No available documentation.
") BRepGraph_LayerLock_ScopedOwnerEdit;
		 BRepGraph_LayerLock_ScopedOwnerEdit(BRepGraph_LayerLock & theLayer, const BRepGraph_ItemId theItem, const Standard_GUID & theOwnerId);

};


%extend BRepGraph_LayerLock_ScopedOwnerEdit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class BRepGraph_LayerParametric_AddResult *
********************************************/
class BRepGraph_LayerParametric_AddResult {
	public:
		uint32_t Instance;
		BRepGraph_NodeId Root;
};


%extend BRepGraph_LayerParametric_AddResult {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class BRepGraph_LayerRegistry *
********************************/
class BRepGraph_LayerRegistry {
	public:
		/****** BRepGraph_LayerRegistry::BRepGraph_LayerRegistry ******/
		/****** md5 signature: c6c2c15a60f50524c2a3f41fbe90857a ******/
		%feature("compactdefaultargs") BRepGraph_LayerRegistry;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepGraph_LayerRegistry;
		 BRepGraph_LayerRegistry();

		/****** BRepGraph_LayerRegistry::ClearAll ******/
		/****** md5 signature: fad2d413f5353ec6395d85f6b0ec87a2 ******/
		%feature("compactdefaultargs") ClearAll;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clear all registered layer data without unregistering services.
") ClearAll;
		void ClearAll();

		/****** BRepGraph_LayerRegistry::CopyLayersTo ******/
		/****** md5 signature: 32ad0e9c34ff86d06fec12d556b51583 ******/
		%feature("compactdefaultargs") CopyLayersTo;
		%feature("autodoc", "
Parameters
----------
theTargetGraph: BRepGraph
theItemRemap: NCollection_FlatDataMap<BRepGraph_ItemId, BRepGraph_ItemId>
theMode: BRepGraph_CopyRemap::Mode

Return
-------
None

Description
-----------
Ask every registered source layer to copy itself into the target graph. For Mode::Compact, layers are unregistered first and CopyTo creates fresh instances. 
Input parameter: theTargetGraph target graph to receive layer data 
Input parameter: theItemRemap source -> target item id mapping 
Input parameter: theMode Copy or Compact semantics.
") CopyLayersTo;
		void CopyLayersTo(BRepGraph & theTargetGraph, const NCollection_FlatDataMap<BRepGraph_ItemId, BRepGraph_ItemId> & theItemRemap, const BRepGraph_CopyRemap::Mode theMode);

		/****** BRepGraph_LayerRegistry::CopyLayersTo ******/
		/****** md5 signature: 16849836c158a13cd779ec794d02ce3d ******/
		%feature("compactdefaultargs") CopyLayersTo;
		%feature("autodoc", "
Parameters
----------
theTargetGraph: BRepGraph
theMappingKind: BRepGraph_CopyRemap::MappingKind
theMode: BRepGraph_CopyRemap::Mode

Return
-------
None

Description
-----------
Ask every registered source layer to copy itself using identity mapping. Source item ids are the same as target item ids (full identity copy). 
Input parameter: theTargetGraph target graph to receive layer data 
Input parameter: theMappingKind identity or explicit mapping 
Input parameter: theMode Copy or Compact semantics.
") CopyLayersTo;
		void CopyLayersTo(BRepGraph & theTargetGraph, BRepGraph_CopyRemap::MappingKind theMappingKind, BRepGraph_CopyRemap::Mode theMode);

		/****** BRepGraph_LayerRegistry::DispatchItemModified ******/
		/****** md5 signature: 1e91a5baf0acca854ae3d52ef9300ea9 ******/
		%feature("compactdefaultargs") DispatchItemModified;
		%feature("autodoc", "
Parameters
----------
theItem: BRepGraph_ItemId

Return
-------
None

Description
-----------
Dispatch generic item modification through the matching typed subscription path.
") DispatchItemModified;
		void DispatchItemModified(const BRepGraph_ItemId theItem);

		/****** BRepGraph_LayerRegistry::DispatchNodeModified ******/
		/****** md5 signature: 0c68ceed87f1ce989a88169d3d378f1b ******/
		%feature("compactdefaultargs") DispatchNodeModified;
		%feature("autodoc", "
Parameters
----------
theNode: BRepGraph_NodeId

Return
-------
None

Description
-----------
Dispatch OnNodeModified to subscribed layers.
") DispatchNodeModified;
		void DispatchNodeModified(const BRepGraph_NodeId theNode);

		/****** BRepGraph_LayerRegistry::DispatchNodesModified ******/
		/****** md5 signature: 7a5eb90531eac79097f0dfb89c1d9f8b ******/
		%feature("compactdefaultargs") DispatchNodesModified;
		%feature("autodoc", "
Parameters
----------
theModifiedNodes: NCollection_Array1<BRepGraph_NodeId>
theModifiedKindsMask: int

Return
-------
None

Description
-----------
Dispatch OnNodesModified to subscribed layers.
") DispatchNodesModified;
		void DispatchNodesModified(const NCollection_Array1<BRepGraph_NodeId> & theModifiedNodes, const int theModifiedKindsMask);

		/****** BRepGraph_LayerRegistry::DispatchOnItemRemoved ******/
		/****** md5 signature: 817ede0e0b0b75066593b82d0cdd4983 ******/
		%feature("compactdefaultargs") DispatchOnItemRemoved;
		%feature("autodoc", "
Parameters
----------
theItem: BRepGraph_ItemId

Return
-------
None

Description
-----------
Dispatch generic item removal to all registered layers.
") DispatchOnItemRemoved;
		void DispatchOnItemRemoved(const BRepGraph_ItemId theItem);

		/****** BRepGraph_LayerRegistry::DispatchOnNodeRemoved ******/
		/****** md5 signature: e6ea98cf6c2d97b988d0bafa9b42cedc ******/
		%feature("compactdefaultargs") DispatchOnNodeRemoved;
		%feature("autodoc", "
Parameters
----------
theNode: BRepGraph_NodeId

Return
-------
None

Description
-----------
Dispatch OnNodeRemoved to all registered layers.
") DispatchOnNodeRemoved;
		void DispatchOnNodeRemoved(const BRepGraph_NodeId theNode);

		/****** BRepGraph_LayerRegistry::DispatchOnNodeReplaced ******/
		/****** md5 signature: 057799f925bc8b3fd47c65197c728e85 ******/
		%feature("compactdefaultargs") DispatchOnNodeReplaced;
		%feature("autodoc", "
Parameters
----------
theOldNode: BRepGraph_NodeId
theNewNode: BRepGraph_NodeId

Return
-------
None

Description
-----------
Dispatch OnNodeReplaced to all registered layers.
") DispatchOnNodeReplaced;
		void DispatchOnNodeReplaced(const BRepGraph_NodeId theOldNode, const BRepGraph_NodeId theNewNode);

		/****** BRepGraph_LayerRegistry::DispatchOnRefRemoved ******/
		/****** md5 signature: 61f9a4ccd76c893ba3601c34258880cf ******/
		%feature("compactdefaultargs") DispatchOnRefRemoved;
		%feature("autodoc", "
Parameters
----------
theRef: BRepGraph_RefId

Return
-------
None

Description
-----------
Dispatch OnRefRemoved to all registered layers (unconditional - not filtered).
") DispatchOnRefRemoved;
		void DispatchOnRefRemoved(const BRepGraph_RefId theRef);

		/****** BRepGraph_LayerRegistry::DispatchRefModified ******/
		/****** md5 signature: a022fd40c3db6dae3d792522370c25b7 ******/
		%feature("compactdefaultargs") DispatchRefModified;
		%feature("autodoc", "
Parameters
----------
theRef: BRepGraph_RefId

Return
-------
None

Description
-----------
Dispatch OnRefModified to subscribed layers (immediate mode).
") DispatchRefModified;
		void DispatchRefModified(const BRepGraph_RefId theRef);

		/****** BRepGraph_LayerRegistry::DispatchRefsModified ******/
		/****** md5 signature: db13addbc44623b850b7ce5df9a7b731 ******/
		%feature("compactdefaultargs") DispatchRefsModified;
		%feature("autodoc", "
Parameters
----------
theModifiedRefs: NCollection_Array1<BRepGraph_RefId>
theModifiedRefKindsMask: int

Return
-------
None

Description
-----------
Dispatch OnRefsModified to subscribed layers (deferred/batch mode).
") DispatchRefsModified;
		void DispatchRefsModified(const NCollection_Array1<BRepGraph_RefId> & theModifiedRefs, const int theModifiedRefKindsMask);

		/****** BRepGraph_LayerRegistry::FindLayer ******/
		/****** md5 signature: fd8356aa339eefec0b696cfc8116305d ******/
		%feature("compactdefaultargs") FindLayer;
		%feature("autodoc", "
Parameters
----------
theGUID: Standard_GUID

Return
-------
opencascade::handle<BRepGraph_Layer>

Description
-----------
Find a layer by GUID. Returns null handle if not found.
") FindLayer;
		opencascade::handle<BRepGraph_Layer> FindLayer(const Standard_GUID & theGUID);

		/****** BRepGraph_LayerRegistry::FindSlot ******/
		/****** md5 signature: 841c1a945ab83fe22a22fa37f373d1c4 ******/
		%feature("compactdefaultargs") FindSlot;
		%feature("autodoc", "
Parameters
----------
theGUID: Standard_GUID
theSlot: uint32_t

Return
-------
bool

Description
-----------
Return current slot for a GUID.
") FindSlot;
		bool FindSlot(const Standard_GUID & theGUID, uint32_t & theSlot);

		/****** BRepGraph_LayerRegistry::HasModificationSubscribers ******/
		/****** md5 signature: 683c9bd7ea54a367a857d6a86cded078 ******/
		%feature("compactdefaultargs") HasModificationSubscribers;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if any registered layer subscribes to node modification events.
") HasModificationSubscribers;
		bool HasModificationSubscribers();

		/****** BRepGraph_LayerRegistry::HasRefModificationSubscribers ******/
		/****** md5 signature: 1d9ad8bd6cc99d180ae53ca60cfbda1b ******/
		%feature("compactdefaultargs") HasRefModificationSubscribers;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if any registered layer subscribes to reference modification events.
") HasRefModificationSubscribers;
		bool HasRefModificationSubscribers();

		/****** BRepGraph_LayerRegistry::InvalidateAll ******/
		/****** md5 signature: 3999ffb3027a30f3cacbc6632529b630 ******/
		%feature("compactdefaultargs") InvalidateAll;
		%feature("autodoc", "Return
-------
None

Description
-----------
Invalidate all registered layer data.
") InvalidateAll;
		void InvalidateAll();

		/****** BRepGraph_LayerRegistry::Layer ******/
		/****** md5 signature: de011343a964878384b3c7eb06152f0b ******/
		%feature("compactdefaultargs") Layer;
		%feature("autodoc", "
Parameters
----------
theSlot: uint32_t

Return
-------
opencascade::handle<BRepGraph_Layer>

Description
-----------
Return layer by slot index, or null handle if the slot is out of range.
") Layer;
		opencascade::handle<BRepGraph_Layer> Layer(uint32_t theSlot);

		/****** BRepGraph_LayerRegistry::NbLayers ******/
		/****** md5 signature: 58aa6b2d768c172a60f126f8128ba98a ******/
		%feature("compactdefaultargs") NbLayers;
		%feature("autodoc", "Return
-------
uint32_t

Description
-----------
Number of registered layers.
") NbLayers;
		uint32_t NbLayers();

		/****** BRepGraph_LayerRegistry::RegisterLayer ******/
		/****** md5 signature: 7eb7b0e4a62a4453f9ba6238e2605f2f ******/
		%feature("compactdefaultargs") RegisterLayer;
		%feature("autodoc", "
Parameters
----------
theLayer: BRepGraph_Layer

Return
-------
uint32_t

Description
-----------
Register a layer. Replaces an existing layer with the same GUID. 
Return: slot index in the internal dense vector.
") RegisterLayer;
		uint32_t RegisterLayer(const opencascade::handle<BRepGraph_Layer> & theLayer);

		/****** BRepGraph_LayerRegistry::SubscribedKindsMask ******/
		/****** md5 signature: d3c7451ecf480eabef98d6fd74d12cab ******/
		%feature("compactdefaultargs") SubscribedKindsMask;
		%feature("autodoc", "Return
-------
int

Description
-----------
Bitwise OR of all registered layer node subscription masks.
") SubscribedKindsMask;
		int SubscribedKindsMask();

		/****** BRepGraph_LayerRegistry::SubscribedRefKindsMask ******/
		/****** md5 signature: a7b2ba3504182dedbb4faaa6370cbfe6 ******/
		%feature("compactdefaultargs") SubscribedRefKindsMask;
		%feature("autodoc", "Return
-------
int

Description
-----------
Bitwise OR of all registered layer reference subscription masks.
") SubscribedRefKindsMask;
		int SubscribedRefKindsMask();

		/****** BRepGraph_LayerRegistry::UnregisterLayer ******/
		/****** md5 signature: 8646aa858207065aef9aa669af7c5714 ******/
		%feature("compactdefaultargs") UnregisterLayer;
		%feature("autodoc", "
Parameters
----------
theGUID: Standard_GUID

Return
-------
None

Description
-----------
Remove a layer by GUID.
") UnregisterLayer;
		void UnregisterLayer(const Standard_GUID & theGUID);

};


%extend BRepGraph_LayerRegistry {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class BRepGraph_LayerTopoSupplement_Entry *
********************************************/
/***************************
* class BRepGraph_MeshView *
***************************/
%nodefaultctor BRepGraph_MeshView;
class BRepGraph_MeshView {
	public:
		/****** BRepGraph_MeshView::Cache ******/
		/****** md5 signature: 7fc497eee302c0d3a6ed3693d3640886 ******/
		%feature("compactdefaultargs") Cache;
		%feature("autodoc", "Return
-------
BRepGraph_MeshView_CacheView

Description
-----------
Cache-only reads.
") Cache;
		const BRepGraph_MeshView_CacheView & Cache();

		/****** BRepGraph_MeshView::Editor ******/
		/****** md5 signature: d30c21799bc9da92102246f1d2c7eb79 ******/
		%feature("compactdefaultargs") Editor;
		%feature("autodoc", "Return
-------
BRepGraph_MeshView_EditorView

Description
-----------
Cache mutations.
") Editor;
		BRepGraph_MeshView_EditorView & Editor();

		/****** BRepGraph_MeshView::Effective ******/
		/****** md5 signature: c5b15df5141927149d0261d48755b491 ******/
		%feature("compactdefaultargs") Effective;
		%feature("autodoc", "Return
-------
BRepGraph_MeshView_EffectiveView

Description
-----------
Effective reads - cache first, persistent fallback. Use when source is irrelevant.
") Effective;
		const BRepGraph_MeshView_EffectiveView & Effective();

		/****** BRepGraph_MeshView::Persistent ******/
		/****** md5 signature: 24d69924d15c990f281938ec591dbb6e ******/
		%feature("compactdefaultargs") Persistent;
		%feature("autodoc", "Return
-------
BRepGraph_MeshView_PersistentView

Description
-----------
Persistent (definition-resident) reads.
") Persistent;
		const BRepGraph_MeshView_PersistentView & Persistent();

		/****** BRepGraph_MeshView::Poly ******/
		/****** md5 signature: 21494cb557eff5527b4f24fec3bf96e6 ******/
		%feature("compactdefaultargs") Poly;
		%feature("autodoc", "Return
-------
BRepGraph_MeshView_PolyOps

Description
-----------
Polygon/triangulation count queries.
") Poly;
		const BRepGraph_MeshView_PolyOps & Poly();

};


%extend BRepGraph_MeshView {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class BRepGraph_MeshView_CacheView *
*************************************/
%nodefaultctor BRepGraph_MeshView_CacheView;
class BRepGraph_MeshView_CacheView {
	public:
		/****** BRepGraph_MeshView_CacheView::CoEdges ******/
		/****** md5 signature: 615cf507a3ebd1d5e448efcb5cb4662d ******/
		%feature("compactdefaultargs") CoEdges;
		%feature("autodoc", "Return
-------
BRepGraph_MeshView_CacheView::CoEdgeOps

Description
-----------
Grouped coedge cache queries.
") CoEdges;
		const BRepGraph_MeshView_CacheView::CoEdgeOps & CoEdges();

		/****** BRepGraph_MeshView_CacheView::Edges ******/
		/****** md5 signature: e1651e4a997aa76df732fadd190c604f ******/
		%feature("compactdefaultargs") Edges;
		%feature("autodoc", "Return
-------
BRepGraph_MeshView_CacheView::EdgeOps

Description
-----------
Grouped edge cache queries.
") Edges;
		const BRepGraph_MeshView_CacheView::EdgeOps & Edges();

		/****** BRepGraph_MeshView_CacheView::Faces ******/
		/****** md5 signature: b3511b1f1fbc70cbaabdb4e5fb6aba05 ******/
		%feature("compactdefaultargs") Faces;
		%feature("autodoc", "Return
-------
BRepGraph_MeshView_CacheView::FaceOps

Description
-----------
Grouped face cache queries.
") Faces;
		const BRepGraph_MeshView_CacheView::FaceOps & Faces();

};


%extend BRepGraph_MeshView_CacheView {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class BRepGraph_MeshView_CacheView_CoEdgeOps *
***********************************************/
%nodefaultctor BRepGraph_MeshView_CacheView_CoEdgeOps;
class BRepGraph_MeshView_CacheView_CoEdgeOps {
	public:
		/****** BRepGraph_MeshView_CacheView_CoEdgeOps::FindPolygon2D ******/
		/****** md5 signature: abdc20e766c7f6d3cdb791fbf90b8af9 ******/
		%feature("compactdefaultargs") FindPolygon2D;
		%feature("autodoc", "
Parameters
----------
theCoEdge: BRepGraph_CoEdgeId

Return
-------
BRepGraph_CacheMesh_CoEdgeMeshEntry *

Description
-----------
Return coedge entry if Polygon2D is fresh, nullptr otherwise. 
Input parameter: theCoEdge typed coedge definition identifier 
Return: cache entry pointer, or nullptr.
") FindPolygon2D;
		const BRepGraph_CacheMesh_CoEdgeMeshEntry * FindPolygon2D(const BRepGraph_CoEdgeId theCoEdge);

		/****** BRepGraph_MeshView_CacheView_CoEdgeOps::FindPolygonOnTri ******/
		/****** md5 signature: 8159cbd6e82680dfc98e7638f1522217 ******/
		%feature("compactdefaultargs") FindPolygonOnTri;
		%feature("autodoc", "
Parameters
----------
theCoEdge: BRepGraph_CoEdgeId

Return
-------
BRepGraph_CacheMesh_CoEdgeMeshEntry *

Description
-----------
Return coedge entry if PolygonsOnTri is fresh, nullptr otherwise. 
Input parameter: theCoEdge typed coedge definition identifier 
Return: cache entry pointer, or nullptr.
") FindPolygonOnTri;
		const BRepGraph_CacheMesh_CoEdgeMeshEntry * FindPolygonOnTri(const BRepGraph_CoEdgeId theCoEdge);

		/****** BRepGraph_MeshView_CacheView_CoEdgeOps::FindRaw ******/
		/****** md5 signature: a0a631cab3ba9b80ee274199cb1f79a5 ******/
		%feature("compactdefaultargs") FindRaw;
		%feature("autodoc", "
Parameters
----------
theCoEdge: BRepGraph_CoEdgeId

Return
-------
BRepGraph_CacheMesh_CoEdgeMeshEntry *

Description
-----------
Raw coedge entry access (no freshness filtering). Returns nullptr if the entry has no representation. For internal/testing use. 
Input parameter: theCoEdge typed coedge definition identifier 
Return: cache entry pointer, or nullptr if absent.
") FindRaw;
		const BRepGraph_CacheMesh_CoEdgeMeshEntry * FindRaw(const BRepGraph_CoEdgeId theCoEdge);

		/****** BRepGraph_MeshView_CacheView_CoEdgeOps::Has ******/
		/****** md5 signature: a6f3391f4d58c7c93eb0bb5cc98032f2 ******/
		%feature("compactdefaultargs") Has;
		%feature("autodoc", "
Parameters
----------
theCoEdge: BRepGraph_CoEdgeId

Return
-------
bool

Description
-----------
True if a fresh cached entry exists (any of polygon-2D / polygon-on-tri). 
Input parameter: theCoEdge typed coedge definition identifier 
Return: true if a fresh cache entry exists.
") Has;
		bool Has(const BRepGraph_CoEdgeId theCoEdge);

};


%extend BRepGraph_MeshView_CacheView_CoEdgeOps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class BRepGraph_MeshView_CacheView_EdgeOps *
*********************************************/
%nodefaultctor BRepGraph_MeshView_CacheView_EdgeOps;
class BRepGraph_MeshView_CacheView_EdgeOps {
	public:
		/****** BRepGraph_MeshView_CacheView_EdgeOps::Entry ******/
		/****** md5 signature: 2141ccb60f510bcdc594a147866763d7 ******/
		%feature("compactdefaultargs") Entry;
		%feature("autodoc", "
Parameters
----------
theEdge: BRepGraph_EdgeId

Return
-------
BRepGraph_CacheMesh_EdgeMeshEntry *

Description
-----------
Raw cached edge mesh entry, or nullptr if absent or stale. 
Input parameter: theEdge typed edge definition identifier 
Return: cache entry pointer, or nullptr.
") Entry;
		const BRepGraph_CacheMesh_EdgeMeshEntry * Entry(const BRepGraph_EdgeId theEdge);

		/****** BRepGraph_MeshView_CacheView_EdgeOps::Has ******/
		/****** md5 signature: eec94e317fefdc355a520b7fd8731f9d ******/
		%feature("compactdefaultargs") Has;
		%feature("autodoc", "
Parameters
----------
theEdge: BRepGraph_EdgeId

Return
-------
bool

Description
-----------
True if a fresh cached Polygon3D is bound to the edge. 
Input parameter: theEdge typed edge definition identifier 
Return: true if a fresh Polygon3D is present in cache.
") Has;
		bool Has(const BRepGraph_EdgeId theEdge);

		/****** BRepGraph_MeshView_CacheView_EdgeOps::Polygon3D ******/
		/****** md5 signature: 71d66d4f92fb1824b54501917f1d585a ******/
		%feature("compactdefaultargs") Polygon3D;
		%feature("autodoc", "
Parameters
----------
theEdge: BRepGraph_EdgeId

Return
-------
opencascade::handle<Poly_Polygon3D>

Description
-----------
Cached Polygon3D handle. 
Input parameter: theEdge typed edge definition identifier 
Return: polygon-3D handle, or null handle if absent.
") Polygon3D;
		const opencascade::handle<Poly_Polygon3D> & Polygon3D(const BRepGraph_EdgeId theEdge);

};


%extend BRepGraph_MeshView_CacheView_EdgeOps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class BRepGraph_MeshView_CacheView_FaceOps *
*********************************************/
%nodefaultctor BRepGraph_MeshView_CacheView_FaceOps;
class BRepGraph_MeshView_CacheView_FaceOps {
	public:
		/****** BRepGraph_MeshView_CacheView_FaceOps::Entry ******/
		/****** md5 signature: 6a57d4effe95ef268d58db7ee045d824 ******/
		%feature("compactdefaultargs") Entry;
		%feature("autodoc", "
Parameters
----------
theFace: BRepGraph_FaceId

Return
-------
BRepGraph_CacheMesh_FaceMeshEntry *

Description
-----------
Raw cached face mesh entry, or nullptr if absent or stale. 
Input parameter: theFace typed face definition identifier 
Return: cache entry pointer, or nullptr.
") Entry;
		const BRepGraph_CacheMesh_FaceMeshEntry * Entry(const BRepGraph_FaceId theFace);

		/****** BRepGraph_MeshView_CacheView_FaceOps::Has ******/
		/****** md5 signature: a6a761b7201ccc7d1cee35d6cf7b98c4 ******/
		%feature("compactdefaultargs") Has;
		%feature("autodoc", "
Parameters
----------
theFace: BRepGraph_FaceId

Return
-------
bool

Description
-----------
True if a fresh cached triangulation is present. 
Input parameter: theFace typed face definition identifier 
Return: true if Entry() would return non-null.
") Has;
		bool Has(const BRepGraph_FaceId theFace);

		/****** BRepGraph_MeshView_CacheView_FaceOps::Triangulation ******/
		/****** md5 signature: ee313e286a84b426722f566ba1089d57 ******/
		%feature("compactdefaultargs") Triangulation;
		%feature("autodoc", "
Parameters
----------
theFace: BRepGraph_FaceId

Return
-------
opencascade::handle<Poly_Triangulation>

Description
-----------
Cached triangulation handle. 
Input parameter: theFace typed face definition identifier 
Return: triangulation handle, or null handle if absent.
") Triangulation;
		const opencascade::handle<Poly_Triangulation> & Triangulation(const BRepGraph_FaceId theFace);

};


%extend BRepGraph_MeshView_CacheView_FaceOps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class BRepGraph_MeshView_EditorView *
**************************************/
%nodefaultctor BRepGraph_MeshView_EditorView;
class BRepGraph_MeshView_EditorView {
	public:
		/****** BRepGraph_MeshView_EditorView::CoEdges ******/
		/****** md5 signature: 803664c09b60324b561c1f3f8bff47fc ******/
		%feature("compactdefaultargs") CoEdges;
		%feature("autodoc", "Return
-------
BRepGraph_MeshView_EditorView::CoEdgeOps

Description
-----------
Grouped coedge cache mutations.
") CoEdges;
		BRepGraph_MeshView_EditorView::CoEdgeOps & CoEdges();

		/****** BRepGraph_MeshView_EditorView::Edges ******/
		/****** md5 signature: a37c07cff8f86d953e0c59c7db39016d ******/
		%feature("compactdefaultargs") Edges;
		%feature("autodoc", "Return
-------
BRepGraph_MeshView_EditorView::EdgeOps

Description
-----------
Grouped edge cache mutations.
") Edges;
		BRepGraph_MeshView_EditorView::EdgeOps & Edges();

		/****** BRepGraph_MeshView_EditorView::Faces ******/
		/****** md5 signature: 6c8c47fadeb2a3b6bd24a20584a4e537 ******/
		%feature("compactdefaultargs") Faces;
		%feature("autodoc", "Return
-------
BRepGraph_MeshView_EditorView::FaceOps

Description
-----------
Grouped face cache mutations.
") Faces;
		BRepGraph_MeshView_EditorView::FaceOps & Faces();

		/****** BRepGraph_MeshView_EditorView::PromoteToPersistent ******/
		/****** md5 signature: 9d4a5b091cb71e7e27d20b4fd0b14c42 ******/
		%feature("compactdefaultargs") PromoteToPersistent;
		%feature("autodoc", "Return
-------
None

Description
-----------
Promote all currently fresh default-slot cache mesh entries to persistent mesh reps.
") PromoteToPersistent;
		void PromoteToPersistent();

};


%extend BRepGraph_MeshView_EditorView {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************
* class BRepGraph_MeshView_EditorView_CoEdgeOps *
************************************************/
%nodefaultctor BRepGraph_MeshView_EditorView_CoEdgeOps;
class BRepGraph_MeshView_EditorView_CoEdgeOps {
	public:
		/****** BRepGraph_MeshView_EditorView_CoEdgeOps::AppendCachedPolygonOnTri ******/
		/****** md5 signature: 86b7b67e17cb75c6d5915c2513072a1f ******/
		%feature("compactdefaultargs") AppendCachedPolygonOnTri;
		%feature("autodoc", "
Parameters
----------
theCoEdge: BRepGraph_CoEdgeId
thePolygonOnTri: Poly_PolygonOnTriangulation

Return
-------
None

Description
-----------
Append a polygon-on-triangulation to the coedge's cached list. 
Input parameter: theCoEdge typed coedge definition identifier 
Input parameter: thePolygonOnTri polygon-on-tri to append.
") AppendCachedPolygonOnTri;
		void AppendCachedPolygonOnTri(const BRepGraph_CoEdgeId theCoEdge, const opencascade::handle<Poly_PolygonOnTriangulation> & thePolygonOnTri);

		/****** BRepGraph_MeshView_EditorView_CoEdgeOps::Clear ******/
		/****** md5 signature: 686cf12991c0f37130bbb1605ee671d7 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "
Parameters
----------
theCoEdge: BRepGraph_CoEdgeId

Return
-------
None

Description
-----------
Clear the coedge's cached mesh entry. 
Input parameter: theCoEdge typed coedge definition identifier.
") Clear;
		void Clear(const BRepGraph_CoEdgeId theCoEdge);

		/****** BRepGraph_MeshView_EditorView_CoEdgeOps::SetCachedPolygon2D ******/
		/****** md5 signature: 3737cab684afa5f5c193e386111201c9 ******/
		%feature("compactdefaultargs") SetCachedPolygon2D;
		%feature("autodoc", "
Parameters
----------
theCoEdge: BRepGraph_CoEdgeId
thePolygon2D: Poly_Polygon2D

Return
-------
None

Description
-----------
Bind a polygon-2D to the coedge's cached entry. 
Input parameter: theCoEdge typed coedge definition identifier 
Input parameter: thePolygon2D polygon-2D handle (null clears the cached binding).
") SetCachedPolygon2D;
		void SetCachedPolygon2D(const BRepGraph_CoEdgeId theCoEdge, const opencascade::handle<Poly_Polygon2D> & thePolygon2D);

};


%extend BRepGraph_MeshView_EditorView_CoEdgeOps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class BRepGraph_MeshView_EditorView_EdgeOps *
**********************************************/
%nodefaultctor BRepGraph_MeshView_EditorView_EdgeOps;
class BRepGraph_MeshView_EditorView_EdgeOps {
	public:
		/****** BRepGraph_MeshView_EditorView_EdgeOps::Clear ******/
		/****** md5 signature: e4d1668cebdbf170f9146f983a44cdc6 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "
Parameters
----------
theEdge: BRepGraph_EdgeId

Return
-------
None

Description
-----------
Clear the edge's cached mesh entry. 
Input parameter: theEdge typed edge definition identifier.
") Clear;
		void Clear(const BRepGraph_EdgeId theEdge);

		/****** BRepGraph_MeshView_EditorView_EdgeOps::SetCachedPolygon3D ******/
		/****** md5 signature: b7f31466bd8a7501b7503feee2cabcc8 ******/
		%feature("compactdefaultargs") SetCachedPolygon3D;
		%feature("autodoc", "
Parameters
----------
theEdge: BRepGraph_EdgeId
thePolygon3D: Poly_Polygon3D

Return
-------
None

Description
-----------
Bind a Polygon3D to the edge's cached entry. 
Input parameter: theEdge typed edge definition identifier 
Input parameter: thePolygon3D polygon-3D handle (null clears the cached binding).
") SetCachedPolygon3D;
		void SetCachedPolygon3D(const BRepGraph_EdgeId theEdge, const opencascade::handle<Poly_Polygon3D> & thePolygon3D);

};


%extend BRepGraph_MeshView_EditorView_EdgeOps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class BRepGraph_MeshView_EditorView_FaceOps *
**********************************************/
%nodefaultctor BRepGraph_MeshView_EditorView_FaceOps;
class BRepGraph_MeshView_EditorView_FaceOps {
	public:
		/****** BRepGraph_MeshView_EditorView_FaceOps::Clear ******/
		/****** md5 signature: 9c2be048469a33cf64ed87ae0b9ceed7 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "
Parameters
----------
theFace: BRepGraph_FaceId

Return
-------
None

Description
-----------
Clear the face's cached mesh entry (no effect if absent). 
Input parameter: theFace typed face definition identifier.
") Clear;
		void Clear(const BRepGraph_FaceId theFace);

		/****** BRepGraph_MeshView_EditorView_FaceOps::SetCachedTriangulation ******/
		/****** md5 signature: fb3961325e4853cad299c7470344cb2d ******/
		%feature("compactdefaultargs") SetCachedTriangulation;
		%feature("autodoc", "
Parameters
----------
theFace: BRepGraph_FaceId
theTriangulation: Poly_Triangulation

Return
-------
None

Description
-----------
Set the cached triangulation for a face. 
Input parameter: theFace typed face definition identifier 
Input parameter: theTriangulation triangulation to store (null clears).
") SetCachedTriangulation;
		void SetCachedTriangulation(const BRepGraph_FaceId theFace, const opencascade::handle<Poly_Triangulation> & theTriangulation);

};


%extend BRepGraph_MeshView_EditorView_FaceOps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class BRepGraph_MeshView_EffectiveView *
*****************************************/
%nodefaultctor BRepGraph_MeshView_EffectiveView;
class BRepGraph_MeshView_EffectiveView {
	public:
		/****** BRepGraph_MeshView_EffectiveView::CoEdges ******/
		/****** md5 signature: 615cf507a3ebd1d5e448efcb5cb4662d ******/
		%feature("compactdefaultargs") CoEdges;
		%feature("autodoc", "Return
-------
BRepGraph_MeshView_EffectiveView::CoEdgeOps

Description
-----------
Grouped coedge effective queries.
") CoEdges;
		const BRepGraph_MeshView_EffectiveView::CoEdgeOps & CoEdges();

		/****** BRepGraph_MeshView_EffectiveView::Edges ******/
		/****** md5 signature: e1651e4a997aa76df732fadd190c604f ******/
		%feature("compactdefaultargs") Edges;
		%feature("autodoc", "Return
-------
BRepGraph_MeshView_EffectiveView::EdgeOps

Description
-----------
Grouped edge effective queries.
") Edges;
		const BRepGraph_MeshView_EffectiveView::EdgeOps & Edges();

		/****** BRepGraph_MeshView_EffectiveView::Faces ******/
		/****** md5 signature: b3511b1f1fbc70cbaabdb4e5fb6aba05 ******/
		%feature("compactdefaultargs") Faces;
		%feature("autodoc", "Return
-------
BRepGraph_MeshView_EffectiveView::FaceOps

Description
-----------
Grouped face effective queries.
") Faces;
		const BRepGraph_MeshView_EffectiveView::FaceOps & Faces();

};


%extend BRepGraph_MeshView_EffectiveView {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************
* class BRepGraph_MeshView_EffectiveView_CoEdgeOps *
***************************************************/
%nodefaultctor BRepGraph_MeshView_EffectiveView_CoEdgeOps;
class BRepGraph_MeshView_EffectiveView_CoEdgeOps {
	public:
		/****** BRepGraph_MeshView_EffectiveView_CoEdgeOps::Has ******/
		/****** md5 signature: a6f3391f4d58c7c93eb0bb5cc98032f2 ******/
		%feature("compactdefaultargs") Has;
		%feature("autodoc", "
Parameters
----------
theCoEdge: BRepGraph_CoEdgeId

Return
-------
bool

Description
-----------
True if the coedge has any polygon-2D / polygon-on-tri in either source. 
Input parameter: theCoEdge typed coedge definition identifier 
Return: true if any coedge mesh data is reachable.
") Has;
		bool Has(const BRepGraph_CoEdgeId theCoEdge);

		/****** BRepGraph_MeshView_EffectiveView_CoEdgeOps::HasPolygonOnSurface ******/
		/****** md5 signature: e305a72015dd12aa37af33ef91907985 ******/
		%feature("compactdefaultargs") HasPolygonOnSurface;
		%feature("autodoc", "
Parameters
----------
theCoEdge: BRepGraph_CoEdgeId

Return
-------
bool

Description
-----------
True if a polygon-on-surface (2D) is reachable in either source. 
Input parameter: theCoEdge typed coedge definition identifier 
Return: true if a polygon-2D is bound on either side.
") HasPolygonOnSurface;
		bool HasPolygonOnSurface(const BRepGraph_CoEdgeId theCoEdge);

		/****** BRepGraph_MeshView_EffectiveView_CoEdgeOps::HasPolygonOnTriangulation ******/
		/****** md5 signature: 2e896d5eba6cb5302edf6778de732435 ******/
		%feature("compactdefaultargs") HasPolygonOnTriangulation;
		%feature("autodoc", "
Parameters
----------
theCoEdge: BRepGraph_CoEdgeId

Return
-------
bool

Description
-----------
True if a polygon-on-triangulation is reachable in either source. 
Input parameter: theCoEdge typed coedge definition identifier 
Return: true if a polygon-on-tri is bound on either side.
") HasPolygonOnTriangulation;
		bool HasPolygonOnTriangulation(const BRepGraph_CoEdgeId theCoEdge);

		/****** BRepGraph_MeshView_EffectiveView_CoEdgeOps::PolygonOnSurface ******/
		/****** md5 signature: ae5af65ab74281b0679c3d4ec3800724 ******/
		%feature("compactdefaultargs") PolygonOnSurface;
		%feature("autodoc", "
Parameters
----------
theCoEdge: BRepGraph_CoEdgeId

Return
-------
opencascade::handle<Poly_Polygon2D>

Description
-----------
Polygon-on-surface (2D) handle (cache first, persistent fallback). 
Input parameter: theCoEdge typed coedge definition identifier 
Return: polygon-2D handle, or null handle if absent.
") PolygonOnSurface;
		const opencascade::handle<Poly_Polygon2D> & PolygonOnSurface(const BRepGraph_CoEdgeId theCoEdge);

		/****** BRepGraph_MeshView_EffectiveView_CoEdgeOps::PolygonOnTriangulation ******/
		/****** md5 signature: 9896684cda3222c208d832545537d00a ******/
		%feature("compactdefaultargs") PolygonOnTriangulation;
		%feature("autodoc", "
Parameters
----------
theCoEdge: BRepGraph_CoEdgeId

Return
-------
opencascade::handle<Poly_PolygonOnTriangulation>

Description
-----------
Polygon-on-triangulation handle (cache first, persistent fallback). 
Input parameter: theCoEdge typed coedge definition identifier 
Return: polygon-on-tri handle, or null handle if absent.
") PolygonOnTriangulation;
		const opencascade::handle<Poly_PolygonOnTriangulation> & PolygonOnTriangulation(const BRepGraph_CoEdgeId theCoEdge);

};


%extend BRepGraph_MeshView_EffectiveView_CoEdgeOps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************
* class BRepGraph_MeshView_EffectiveView_EdgeOps *
*************************************************/
%nodefaultctor BRepGraph_MeshView_EffectiveView_EdgeOps;
class BRepGraph_MeshView_EffectiveView_EdgeOps {
	public:
		/****** BRepGraph_MeshView_EffectiveView_EdgeOps::Has ******/
		/****** md5 signature: eec94e317fefdc355a520b7fd8731f9d ******/
		%feature("compactdefaultargs") Has;
		%feature("autodoc", "
Parameters
----------
theEdge: BRepGraph_EdgeId

Return
-------
bool

Description
-----------
True if the edge has a Polygon3D in either cache or persistent storage. 
Input parameter: theEdge typed edge definition identifier 
Return: true if any Polygon3D is reachable.
") Has;
		bool Has(const BRepGraph_EdgeId theEdge);

		/****** BRepGraph_MeshView_EffectiveView_EdgeOps::Polygon3D ******/
		/****** md5 signature: 71d66d4f92fb1824b54501917f1d585a ******/
		%feature("compactdefaultargs") Polygon3D;
		%feature("autodoc", "
Parameters
----------
theEdge: BRepGraph_EdgeId

Return
-------
opencascade::handle<Poly_Polygon3D>

Description
-----------
Polygon3D handle (cache first, persistent fallback). 
Input parameter: theEdge typed edge definition identifier 
Return: polygon-3D handle, or null handle if absent.
") Polygon3D;
		const opencascade::handle<Poly_Polygon3D> & Polygon3D(const BRepGraph_EdgeId theEdge);

};


%extend BRepGraph_MeshView_EffectiveView_EdgeOps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************
* class BRepGraph_MeshView_EffectiveView_FaceOps *
*************************************************/
%nodefaultctor BRepGraph_MeshView_EffectiveView_FaceOps;
class BRepGraph_MeshView_EffectiveView_FaceOps {
	public:
		/****** BRepGraph_MeshView_EffectiveView_FaceOps::Has ******/
		/****** md5 signature: a6a761b7201ccc7d1cee35d6cf7b98c4 ******/
		%feature("compactdefaultargs") Has;
		%feature("autodoc", "
Parameters
----------
theFace: BRepGraph_FaceId

Return
-------
bool

Description
-----------
True if the face has a triangulation in either cache or persistent storage. 
Input parameter: theFace typed face definition identifier 
Return: true if any triangulation is reachable.
") Has;
		bool Has(const BRepGraph_FaceId theFace);

		/****** BRepGraph_MeshView_EffectiveView_FaceOps::Triangulation ******/
		/****** md5 signature: ee313e286a84b426722f566ba1089d57 ******/
		%feature("compactdefaultargs") Triangulation;
		%feature("autodoc", "
Parameters
----------
theFace: BRepGraph_FaceId

Return
-------
opencascade::handle<Poly_Triangulation>

Description
-----------
Cached triangulation handle (cache first, persistent fallback). 
Input parameter: theFace typed face definition identifier 
Return: triangulation handle, or null handle if absent.
") Triangulation;
		const opencascade::handle<Poly_Triangulation> & Triangulation(const BRepGraph_FaceId theFace);

};


%extend BRepGraph_MeshView_EffectiveView_FaceOps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class BRepGraph_MeshView_PersistentView *
******************************************/
%nodefaultctor BRepGraph_MeshView_PersistentView;
class BRepGraph_MeshView_PersistentView {
	public:
		/****** BRepGraph_MeshView_PersistentView::CoEdges ******/
		/****** md5 signature: 615cf507a3ebd1d5e448efcb5cb4662d ******/
		%feature("compactdefaultargs") CoEdges;
		%feature("autodoc", "Return
-------
BRepGraph_MeshView_PersistentView::CoEdgeOps

Description
-----------
Grouped coedge persistent queries.
") CoEdges;
		const BRepGraph_MeshView_PersistentView::CoEdgeOps & CoEdges();

		/****** BRepGraph_MeshView_PersistentView::Edges ******/
		/****** md5 signature: e1651e4a997aa76df732fadd190c604f ******/
		%feature("compactdefaultargs") Edges;
		%feature("autodoc", "Return
-------
BRepGraph_MeshView_PersistentView::EdgeOps

Description
-----------
Grouped edge persistent queries.
") Edges;
		const BRepGraph_MeshView_PersistentView::EdgeOps & Edges();

		/****** BRepGraph_MeshView_PersistentView::Faces ******/
		/****** md5 signature: b3511b1f1fbc70cbaabdb4e5fb6aba05 ******/
		%feature("compactdefaultargs") Faces;
		%feature("autodoc", "Return
-------
BRepGraph_MeshView_PersistentView::FaceOps

Description
-----------
Grouped face persistent queries.
") Faces;
		const BRepGraph_MeshView_PersistentView::FaceOps & Faces();

};


%extend BRepGraph_MeshView_PersistentView {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************************
* class BRepGraph_MeshView_PersistentView_CoEdgeOps *
****************************************************/
%nodefaultctor BRepGraph_MeshView_PersistentView_CoEdgeOps;
class BRepGraph_MeshView_PersistentView_CoEdgeOps {
	public:
		/****** BRepGraph_MeshView_PersistentView_CoEdgeOps::Has ******/
		/****** md5 signature: a6f3391f4d58c7c93eb0bb5cc98032f2 ******/
		%feature("compactdefaultargs") Has;
		%feature("autodoc", "
Parameters
----------
theCoEdge: BRepGraph_CoEdgeId

Return
-------
bool

Description
-----------
True if CoEdgeDef.Polygon2DRepId is bound (dominant kind on coedges). 
Input parameter: theCoEdge typed coedge definition identifier 
Return: true if a persistent polygon-on-surface is bound.
") Has;
		bool Has(const BRepGraph_CoEdgeId theCoEdge);

		/****** BRepGraph_MeshView_PersistentView_CoEdgeOps::HasPolygonOnTriangulation ******/
		/****** md5 signature: 2e896d5eba6cb5302edf6778de732435 ******/
		%feature("compactdefaultargs") HasPolygonOnTriangulation;
		%feature("autodoc", "
Parameters
----------
theCoEdge: BRepGraph_CoEdgeId

Return
-------
bool

Description
-----------
True if CoEdgeDef.PolygonOnTriRepId is bound. 
Input parameter: theCoEdge typed coedge definition identifier 
Return: true if persistent polygon-on-triangulation is bound.
") HasPolygonOnTriangulation;
		bool HasPolygonOnTriangulation(const BRepGraph_CoEdgeId theCoEdge);

		/****** BRepGraph_MeshView_PersistentView_CoEdgeOps::PolygonOnSurface ******/
		/****** md5 signature: ae5af65ab74281b0679c3d4ec3800724 ******/
		%feature("compactdefaultargs") PolygonOnSurface;
		%feature("autodoc", "
Parameters
----------
theCoEdge: BRepGraph_CoEdgeId

Return
-------
opencascade::handle<Poly_Polygon2D>

Description
-----------
Persistent polygon-on-surface (2D polygon) bound to the coedge. 
Input parameter: theCoEdge typed coedge definition identifier 
Return: polygon-2D handle, or null handle if absent.
") PolygonOnSurface;
		const opencascade::handle<Poly_Polygon2D> & PolygonOnSurface(const BRepGraph_CoEdgeId theCoEdge);

		/****** BRepGraph_MeshView_PersistentView_CoEdgeOps::PolygonOnTriangulation ******/
		/****** md5 signature: 9896684cda3222c208d832545537d00a ******/
		%feature("compactdefaultargs") PolygonOnTriangulation;
		%feature("autodoc", "
Parameters
----------
theCoEdge: BRepGraph_CoEdgeId

Return
-------
opencascade::handle<Poly_PolygonOnTriangulation>

Description
-----------
Persistent polygon-on-triangulation bound to the coedge. 
Input parameter: theCoEdge typed coedge definition identifier 
Return: polygon-on-triangulation handle, or null handle if absent.
") PolygonOnTriangulation;
		const opencascade::handle<Poly_PolygonOnTriangulation> & PolygonOnTriangulation(const BRepGraph_CoEdgeId theCoEdge);

};


%extend BRepGraph_MeshView_PersistentView_CoEdgeOps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************
* class BRepGraph_MeshView_PersistentView_EdgeOps *
**************************************************/
%nodefaultctor BRepGraph_MeshView_PersistentView_EdgeOps;
class BRepGraph_MeshView_PersistentView_EdgeOps {
	public:
		/****** BRepGraph_MeshView_PersistentView_EdgeOps::Has ******/
		/****** md5 signature: eec94e317fefdc355a520b7fd8731f9d ******/
		%feature("compactdefaultargs") Has;
		%feature("autodoc", "
Parameters
----------
theEdge: BRepGraph_EdgeId

Return
-------
bool

Description
-----------
True if EdgeDef.Polygon3DRepId is bound (dominant kind on edges). 
Input parameter: theEdge typed edge definition identifier 
Return: true if a persistent Polygon3D is bound.
") Has;
		bool Has(const BRepGraph_EdgeId theEdge);

		/****** BRepGraph_MeshView_PersistentView_EdgeOps::HasPolygonOnTriangulation ******/
		/****** md5 signature: c8f747baf0edbe9db6fcb47fe27621af ******/
		%feature("compactdefaultargs") HasPolygonOnTriangulation;
		%feature("autodoc", "
Parameters
----------
theEdge: BRepGraph_EdgeId
theFace: BRepGraph_FaceId

Return
-------
bool

Description
-----------
True if the (edge, face) coedge has a polygon-on-triangulation. 
Input parameter: theEdge typed edge definition identifier 
Input parameter: theFace typed face definition identifier 
Return: true if persistent polygon-on-triangulation is bound.
") HasPolygonOnTriangulation;
		bool HasPolygonOnTriangulation(const BRepGraph_EdgeId theEdge, const BRepGraph_FaceId theFace);

		/****** BRepGraph_MeshView_PersistentView_EdgeOps::Polygon3D ******/
		/****** md5 signature: 71d66d4f92fb1824b54501917f1d585a ******/
		%feature("compactdefaultargs") Polygon3D;
		%feature("autodoc", "
Parameters
----------
theEdge: BRepGraph_EdgeId

Return
-------
opencascade::handle<Poly_Polygon3D>

Description
-----------
Persistent Polygon3D handle. 
Input parameter: theEdge typed edge definition identifier 
Return: polygon-3D handle, or null handle if absent.
") Polygon3D;
		const opencascade::handle<Poly_Polygon3D> & Polygon3D(const BRepGraph_EdgeId theEdge);

		/****** BRepGraph_MeshView_PersistentView_EdgeOps::PolygonOnTriangulation ******/
		/****** md5 signature: c2c424e61f7d00a3996c6cb39f810d19 ******/
		%feature("compactdefaultargs") PolygonOnTriangulation;
		%feature("autodoc", "
Parameters
----------
theEdge: BRepGraph_EdgeId
theFace: BRepGraph_FaceId

Return
-------
opencascade::handle<Poly_PolygonOnTriangulation>

Description
-----------
Polygon-on-triangulation for the (edge, face) coedge. 
Input parameter: theEdge typed edge definition identifier 
Input parameter: theFace typed face definition identifier 
Return: polygon-on-triangulation handle, or null handle if absent.
") PolygonOnTriangulation;
		const opencascade::handle<Poly_PolygonOnTriangulation> & PolygonOnTriangulation(const BRepGraph_EdgeId theEdge, const BRepGraph_FaceId theFace);

};


%extend BRepGraph_MeshView_PersistentView_EdgeOps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************
* class BRepGraph_MeshView_PersistentView_FaceOps *
**************************************************/
%nodefaultctor BRepGraph_MeshView_PersistentView_FaceOps;
class BRepGraph_MeshView_PersistentView_FaceOps {
	public:
		/****** BRepGraph_MeshView_PersistentView_FaceOps::Has ******/
		/****** md5 signature: a6a761b7201ccc7d1cee35d6cf7b98c4 ******/
		%feature("compactdefaultargs") Has;
		%feature("autodoc", "
Parameters
----------
theFace: BRepGraph_FaceId

Return
-------
bool

Description
-----------
True if FaceDef.TriangulationRepId is valid and the rep is not removed. 
Input parameter: theFace typed face definition identifier 
Return: true if a persistent triangulation is bound.
") Has;
		bool Has(const BRepGraph_FaceId theFace);

		/****** BRepGraph_MeshView_PersistentView_FaceOps::Triangulation ******/
		/****** md5 signature: ee313e286a84b426722f566ba1089d57 ******/
		%feature("compactdefaultargs") Triangulation;
		%feature("autodoc", "
Parameters
----------
theFace: BRepGraph_FaceId

Return
-------
opencascade::handle<Poly_Triangulation>

Description
-----------
Persistent triangulation handle. 
Input parameter: theFace typed face definition identifier 
Return: triangulation handle, or null handle if absent.
") Triangulation;
		const opencascade::handle<Poly_Triangulation> & Triangulation(const BRepGraph_FaceId theFace);

};


%extend BRepGraph_MeshView_PersistentView_FaceOps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class BRepGraph_MeshView_PolyOps *
***********************************/
%nodefaultctor BRepGraph_MeshView_PolyOps;
class BRepGraph_MeshView_PolyOps {
	public:
		/****** BRepGraph_MeshView_PolyOps::NbActivePolygons2D ******/
		/****** md5 signature: 28b6fa05433254de0675a83c46805eb0 ******/
		%feature("compactdefaultargs") NbActivePolygons2D;
		%feature("autodoc", "Return
-------
uint32_t

Description
-----------
Number of non-removed coedge polygon-2D entries.
") NbActivePolygons2D;
		uint32_t NbActivePolygons2D();

		/****** BRepGraph_MeshView_PolyOps::NbActivePolygons3D ******/
		/****** md5 signature: c3214fc8f12a0a59e2cd2cea8204cc7f ******/
		%feature("compactdefaultargs") NbActivePolygons3D;
		%feature("autodoc", "Return
-------
uint32_t

Description
-----------
Number of non-removed edge polygon-3D entries.
") NbActivePolygons3D;
		uint32_t NbActivePolygons3D();

		/****** BRepGraph_MeshView_PolyOps::NbActivePolygonsOnTri ******/
		/****** md5 signature: 8713b32312b2a89af0b998d6ee49dbf0 ******/
		%feature("compactdefaultargs") NbActivePolygonsOnTri;
		%feature("autodoc", "Return
-------
uint32_t

Description
-----------
Number of non-removed coedge polygon-on-triangulation entries.
") NbActivePolygonsOnTri;
		uint32_t NbActivePolygonsOnTri();

		/****** BRepGraph_MeshView_PolyOps::NbActiveTriangulations ******/
		/****** md5 signature: 01ef47e3233172618aea51911c63cbc1 ******/
		%feature("compactdefaultargs") NbActiveTriangulations;
		%feature("autodoc", "Return
-------
uint32_t

Description
-----------
Number of non-removed face triangulation entries.
") NbActiveTriangulations;
		uint32_t NbActiveTriangulations();

		/****** BRepGraph_MeshView_PolyOps::NbCoEdgePolygons2D ******/
		/****** md5 signature: 616be351104846838cd52d41758cf40e ******/
		%feature("compactdefaultargs") NbCoEdgePolygons2D;
		%feature("autodoc", "Return
-------
uint32_t

Description
-----------
Total number of coedge polygon-2D slots (including removed).
") NbCoEdgePolygons2D;
		uint32_t NbCoEdgePolygons2D();

		/****** BRepGraph_MeshView_PolyOps::NbCoEdgePolygonsOnTri ******/
		/****** md5 signature: 924379ae26dbf71d1daecb0f006be1f7 ******/
		%feature("compactdefaultargs") NbCoEdgePolygonsOnTri;
		%feature("autodoc", "Return
-------
uint32_t

Description
-----------
Total number of coedge polygon-on-triangulation slots (including removed).
") NbCoEdgePolygonsOnTri;
		uint32_t NbCoEdgePolygonsOnTri();

		/****** BRepGraph_MeshView_PolyOps::NbEdgePolygons3D ******/
		/****** md5 signature: eb29c8731ef3f9e2cf781c1fe2e5e7f1 ******/
		%feature("compactdefaultargs") NbEdgePolygons3D;
		%feature("autodoc", "Return
-------
uint32_t

Description
-----------
Total number of edge polygon-3D slots (including removed).
") NbEdgePolygons3D;
		uint32_t NbEdgePolygons3D();

		/****** BRepGraph_MeshView_PolyOps::NbFaceTriangulations ******/
		/****** md5 signature: d11c22258a45fff9b78ad8e8b1c8c8f9 ******/
		%feature("compactdefaultargs") NbFaceTriangulations;
		%feature("autodoc", "Return
-------
uint32_t

Description
-----------
Total number of face triangulation slots (including removed).
") NbFaceTriangulations;
		uint32_t NbFaceTriangulations();

};


%extend BRepGraph_MeshView_PolyOps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class BRepGraph_MutGuard *
***************************/
/*************************
* class BRepGraph_NodeId *
*************************/
class BRepGraph_NodeId {
	public:
/* public enums */
enum class Kind {
	Solid = 0,
	Shell = 1,
	Face = 2,
	Wire = 3,
	Edge = 4,
	Vertex = 5,
	Compound = 6,
	CompSolid = 7,
	CoEdge = 8,
	Product = 10,
	Occurrence = 11,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class Kind(IntEnum):
	Solid = 0
	Shell = 1
	Face = 2
	Wire = 3
	Edge = 4
	Vertex = 5
	Compound = 6
	CompSolid = 7
	CoEdge = 8
	Product = 10
	Occurrence = 11
Solid = Kind.Solid
Shell = Kind.Shell
Face = Kind.Face
Wire = Kind.Wire
Edge = Kind.Edge
Vertex = Kind.Vertex
Compound = Kind.Compound
CompSolid = Kind.CompSolid
CoEdge = Kind.CoEdge
Product = Kind.Product
Occurrence = Kind.Occurrence
};
/* end python proxy for enums */

		Kind NodeKind;
		uint32_t Index;
		/****** BRepGraph_NodeId::BRepGraph_NodeId ******/
		/****** md5 signature: 49452c47ec6e1da46b84b24ae06debb2 ******/
		%feature("compactdefaultargs") BRepGraph_NodeId;
		%feature("autodoc", "Return
-------
None

Description
-----------
Default: invalid NodeId (Index = UINT32_MAX). NodeKind is set to Kind::Solid but is meaningless when !IsValid().
") BRepGraph_NodeId;
		 BRepGraph_NodeId();

		/****** BRepGraph_NodeId::BRepGraph_NodeId ******/
		/****** md5 signature: d0bfdbe5aaea11f756166c87a39ea129 ******/
		%feature("compactdefaultargs") BRepGraph_NodeId;
		%feature("autodoc", "
Parameters
----------
theKind: Kind
theIdx: uint32_t

Return
-------
None

Description
-----------
No available documentation.
") BRepGraph_NodeId;
		 BRepGraph_NodeId(Kind theKind, const uint32_t theIdx);

		/****** BRepGraph_NodeId::Invalid ******/
		/****** md5 signature: 9afba9862f371107ad1dbf52f3eb9738 ******/
		%feature("compactdefaultargs") Invalid;
		%feature("autodoc", "
Parameters
----------
theKind: Kind (optional, default to Kind::Solid)

Return
-------
BRepGraph_NodeId

Description
-----------
Invalid sentinel id for the specified kind.
") Invalid;
		static BRepGraph_NodeId Invalid(Kind theKind = Kind::Solid);

		/****** BRepGraph_NodeId::IsAssemblyKind ******/
		/****** md5 signature: 011f68ac6e3fca52f300d510b9170f4c ******/
		%feature("compactdefaultargs") IsAssemblyKind;
		%feature("autodoc", "
Parameters
----------
theKind: Kind

Return
-------
bool

Description
-----------
True if the kind is an assembly kind (Product or Occurrence).
") IsAssemblyKind;
		static bool IsAssemblyKind(Kind theKind);

		/****** BRepGraph_NodeId::IsOwned ******/
		/****** md5 signature: e4d58d12130e79c19bbd8558c64292f0 ******/
		%feature("compactdefaultargs") IsOwned;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph

Return
-------
bool

Description
-----------
Return true if this node has an active owner in the given graph.
") IsOwned;
		bool IsOwned(const BRepGraph & theGraph);

		/****** BRepGraph_NodeId::IsRemoved ******/
		/****** md5 signature: 4ad9974a183fb602e7b1ad7dfda90050 ******/
		%feature("compactdefaultargs") IsRemoved;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph

Return
-------
bool

Description
-----------
Return true if this node has been soft-removed in the given graph.
") IsRemoved;
		bool IsRemoved(const BRepGraph & theGraph);

		/****** BRepGraph_NodeId::IsTopologyKind ******/
		/****** md5 signature: 626b7c2618553363a8ec005d40c3811e ******/
		%feature("compactdefaultargs") IsTopologyKind;
		%feature("autodoc", "
Parameters
----------
theKind: Kind

Return
-------
bool

Description
-----------
True if the kind is a core topology kind (Solid..CoEdge).
") IsTopologyKind;
		static bool IsTopologyKind(Kind theKind);

		/****** BRepGraph_NodeId::IsValid ******/
		/****** md5 signature: 735088818cf24ebe0ebc7005a507da69 ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if this id points to an allocated node slot.
") IsValid;
		bool IsValid();

		/****** BRepGraph_NodeId::IsValid ******/
		/****** md5 signature: 294f20297d740c99df23b64d8041b57c ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "
Parameters
----------
theMaxCount: uint32_t

Return
-------
bool

Description
-----------
True if this id points to an allocated slot within [0, theMaxCount). UINT32_MAX (invalid sentinel) always fails this check for any realistic count.
") IsValid;
		bool IsValid(const uint32_t theMaxCount);

		/****** BRepGraph_NodeId::IsValidKind ******/
		/****** md5 signature: 59549bb935f435066c3d7d48507e26d3 ******/
		%feature("compactdefaultargs") IsValidKind;
		%feature("autodoc", "
Parameters
----------
theKind: Kind

Return
-------
bool

Description
-----------
True if the kind value is one of the supported node kinds.
") IsValidKind;
		static bool IsValidKind(Kind theKind);

		/****** BRepGraph_NodeId::Start ******/
		/****** md5 signature: 96e3f3f73960a3014ef13e59bff85256 ******/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "
Parameters
----------
theKind: Kind

Return
-------
BRepGraph_NodeId

Description
-----------
First valid id in a dense sequence for the specified kind.
") Start;
		static BRepGraph_NodeId Start(Kind theKind);


%extend{
    bool __ne_wrapper__(const BRepGraph_NodeId other) {
        if (*self!=other) return true;
        else return false;
    }
}
%pythoncode {
def __ne__(self, right):
    try:
        return self.__ne_wrapper__(right)
    except:
        return True
}
		/****** BRepGraph_NodeId::operator + ******/
		/****** md5 signature: 3c54efd6d9b91168b1f3723956eabe21 ******/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "
Parameters
----------
theOffset: uint32_t

Return
-------
BRepGraph_NodeId

Description
-----------
Advance by offset.
") operator +;
		BRepGraph_NodeId operator +(const uint32_t theOffset);

		/****** BRepGraph_NodeId::operator - ******/
		/****** md5 signature: 6af916bc1dbad857ccbd5ff88ce0add6 ******/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "
Parameters
----------
theOffset: uint32_t

Return
-------
BRepGraph_NodeId

Description
-----------
Retreat by offset.
") operator -;
		BRepGraph_NodeId operator -(const uint32_t theOffset);


%extend{
    bool __eq_wrapper__(const BRepGraph_NodeId other) {
        if (*self==other) return true;
        else return false;
    }
}
%pythoncode {
def __eq__(self, right):
    try:
        return self.__eq_wrapper__(right)
    except:
        return False
}
};


%extend BRepGraph_NodeId {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class BRepGraph_NodeId_Typed *
*******************************/
/*******************************
* class BRepGraph_OccurrenceId *
*******************************/
class BRepGraph_OccurrenceId {
	public:
		uint32_t Index;
		/****** BRepGraph_OccurrenceId::BRepGraph_OccurrenceId ******/
		/****** md5 signature: 4311b88151facb04e31a8f94c612d63e ******/
		%feature("compactdefaultargs") BRepGraph_OccurrenceId;
		%feature("autodoc", "Return
-------
None

Description
-----------
Default: invalid (Index = UINT32_MAX).
") BRepGraph_OccurrenceId;
		 BRepGraph_OccurrenceId();

		/****** BRepGraph_OccurrenceId::BRepGraph_OccurrenceId ******/
		/****** md5 signature: 718adffe00b7c66230abfc0915fac1a6 ******/
		%feature("compactdefaultargs") BRepGraph_OccurrenceId;
		%feature("autodoc", "
Parameters
----------
theIdx: uint32_t

Return
-------
None

Description
-----------
Construct from index.
") BRepGraph_OccurrenceId;
		 BRepGraph_OccurrenceId(const uint32_t theIdx);

		/****** BRepGraph_OccurrenceId::BRepGraph_OccurrenceId ******/
		/****** md5 signature: 06f9543631732e963a42611acebb8a88 ******/
		%feature("compactdefaultargs") BRepGraph_OccurrenceId;
		%feature("autodoc", "
Parameters
----------
theId: BRepGraph_NodeId

Return
-------
None

Description
-----------
Construct from an untyped node id of the same kind.
") BRepGraph_OccurrenceId;
		 BRepGraph_OccurrenceId(const BRepGraph_NodeId theId);

		/****** BRepGraph_OccurrenceId::FromNodeId ******/
		/****** md5 signature: 446894b9c1847edab23d1c81f8aa599c ******/
		%feature("compactdefaultargs") FromNodeId;
		%feature("autodoc", "
Parameters
----------
theId: BRepGraph_NodeId

Return
-------
BRepGraph_OccurrenceId

Description
-----------
Explicit conversion from untyped NodeId. Asserts that the Kind matches in debug builds. 
Input parameter: theId untyped NodeId to convert.
") FromNodeId;
		static BRepGraph_OccurrenceId FromNodeId(const BRepGraph_NodeId theId);

		/****** BRepGraph_OccurrenceId::Invalid ******/
		/****** md5 signature: 19622d4f1c44c5c7e384ccc5986fb8d8 ******/
		%feature("compactdefaultargs") Invalid;
		%feature("autodoc", "Return
-------
BRepGraph_OccurrenceId

Description
-----------
Invalid sentinel id.
") Invalid;
		static BRepGraph_OccurrenceId Invalid();

		/****** BRepGraph_OccurrenceId::IsOwned ******/
		/****** md5 signature: 82162d9fddf9bcd26161cc7f9c342a8b ******/
		%feature("compactdefaultargs") IsOwned;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph

Return
-------
bool

Description
-----------
Return true if this node has an active owner in the given graph.
") IsOwned;
		bool IsOwned(const BRepGraph & theGraph);

		/****** BRepGraph_OccurrenceId::IsRemoved ******/
		/****** md5 signature: 75ed1923a75d2c35c92a9683349c6622 ******/
		%feature("compactdefaultargs") IsRemoved;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph

Return
-------
bool

Description
-----------
Return true if this node has been soft-removed in the given graph.
") IsRemoved;
		bool IsRemoved(const BRepGraph & theGraph);

		/****** BRepGraph_OccurrenceId::IsValid ******/
		/****** md5 signature: 735088818cf24ebe0ebc7005a507da69 ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if this id points to an allocated node slot.
") IsValid;
		bool IsValid();

		/****** BRepGraph_OccurrenceId::IsValid ******/
		/****** md5 signature: 294f20297d740c99df23b64d8041b57c ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "
Parameters
----------
theMaxCount: uint32_t

Return
-------
bool

Description
-----------
True if this id points to an allocated slot within [0, theMaxCount). UINT32_MAX (invalid sentinel) always fails this check for any realistic count.
") IsValid;
		bool IsValid(const uint32_t theMaxCount);

		/****** BRepGraph_OccurrenceId::Start ******/
		/****** md5 signature: fc9e9cfb659953f8d767f808052e7c04 ******/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "Return
-------
BRepGraph_OccurrenceId

Description
-----------
First valid id in a dense per-kind sequence.
") Start;
		static BRepGraph_OccurrenceId Start();


%extend{
    bool __ne_wrapper__(BRepGraph_OccurrenceId other) {
        if (*self!=other) return true;
        else return false;
    }
}
%pythoncode {
def __ne__(self, right):
    try:
        return self.__ne_wrapper__(right)
    except:
        return True
}

%extend{
    bool __ne_wrapper__(const BRepGraph_NodeId other) {
        if (*self!=other) return true;
        else return false;
    }
}
%pythoncode {
def __ne__(self, right):
    try:
        return self.__ne_wrapper__(right)
    except:
        return True
}
		/****** BRepGraph_OccurrenceId::operator + ******/
		/****** md5 signature: c69f1fde8a4abf6a73054fa1db2c1fe3 ******/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "
Parameters
----------
theOffset: uint32_t

Return
-------
BRepGraph_OccurrenceId

Description
-----------
Advance by offset.
") operator +;
		BRepGraph_OccurrenceId operator +(const uint32_t theOffset);

		/****** BRepGraph_OccurrenceId::operator - ******/
		/****** md5 signature: 05213caff5555da9f8d7e29a9b6a1930 ******/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "
Parameters
----------
theOffset: uint32_t

Return
-------
BRepGraph_OccurrenceId

Description
-----------
Retreat by offset.
") operator -;
		BRepGraph_OccurrenceId operator -(const uint32_t theOffset);


%extend{
    bool __eq_wrapper__(BRepGraph_OccurrenceId other) {
        if (*self==other) return true;
        else return false;
    }
}
%pythoncode {
def __eq__(self, right):
    try:
        return self.__eq_wrapper__(right)
    except:
        return False
}

%extend{
    bool __eq_wrapper__(const BRepGraph_NodeId other) {
        if (*self==other) return true;
        else return false;
    }
}
%pythoncode {
def __eq__(self, right):
    try:
        return self.__eq_wrapper__(right)
    except:
        return False
}
};


%extend BRepGraph_OccurrenceId {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class BRepGraph_OccurrenceRefId *
**********************************/
class BRepGraph_OccurrenceRefId {
	public:
		uint32_t Index;
		/****** BRepGraph_OccurrenceRefId::BRepGraph_OccurrenceRefId ******/
		/****** md5 signature: 4311b88151facb04e31a8f94c612d63e ******/
		%feature("compactdefaultargs") BRepGraph_OccurrenceRefId;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepGraph_OccurrenceRefId;
		 BRepGraph_OccurrenceRefId();

		/****** BRepGraph_OccurrenceRefId::BRepGraph_OccurrenceRefId ******/
		/****** md5 signature: 718adffe00b7c66230abfc0915fac1a6 ******/
		%feature("compactdefaultargs") BRepGraph_OccurrenceRefId;
		%feature("autodoc", "
Parameters
----------
theIdx: uint32_t

Return
-------
None

Description
-----------
No available documentation.
") BRepGraph_OccurrenceRefId;
		 BRepGraph_OccurrenceRefId(const uint32_t theIdx);

		/****** BRepGraph_OccurrenceRefId::BRepGraph_OccurrenceRefId ******/
		/****** md5 signature: 7e80a924fe12a8fa6b68aba27507a9ea ******/
		%feature("compactdefaultargs") BRepGraph_OccurrenceRefId;
		%feature("autodoc", "
Parameters
----------
theRefId: BRepGraph_RefId

Return
-------
None

Description
-----------
Construct from an untyped reference id of the same kind.
") BRepGraph_OccurrenceRefId;
		 BRepGraph_OccurrenceRefId(const BRepGraph_RefId theRefId);

		/****** BRepGraph_OccurrenceRefId::FromRefId ******/
		/****** md5 signature: 2c83b1a5f2a415c6daf522ac4df93236 ******/
		%feature("compactdefaultargs") FromRefId;
		%feature("autodoc", "
Parameters
----------
theRefId: BRepGraph_RefId

Return
-------
BRepGraph_OccurrenceRefId

Description
-----------
No available documentation.
") FromRefId;
		static BRepGraph_OccurrenceRefId FromRefId(const BRepGraph_RefId theRefId);

		/****** BRepGraph_OccurrenceRefId::Invalid ******/
		/****** md5 signature: 19622d4f1c44c5c7e384ccc5986fb8d8 ******/
		%feature("compactdefaultargs") Invalid;
		%feature("autodoc", "Return
-------
BRepGraph_OccurrenceRefId

Description
-----------
Invalid sentinel id.
") Invalid;
		static BRepGraph_OccurrenceRefId Invalid();

		/****** BRepGraph_OccurrenceRefId::IsOwned ******/
		/****** md5 signature: 82162d9fddf9bcd26161cc7f9c342a8b ******/
		%feature("compactdefaultargs") IsOwned;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph

Return
-------
bool

Description
-----------
Return true if this reference entry has an active owner in the given graph.
") IsOwned;
		bool IsOwned(const BRepGraph & theGraph);

		/****** BRepGraph_OccurrenceRefId::IsRemoved ******/
		/****** md5 signature: 75ed1923a75d2c35c92a9683349c6622 ******/
		%feature("compactdefaultargs") IsRemoved;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph

Return
-------
bool

Description
-----------
Return true if this reference entry has been soft-removed in the given graph.
") IsRemoved;
		bool IsRemoved(const BRepGraph & theGraph);

		/****** BRepGraph_OccurrenceRefId::IsValid ******/
		/****** md5 signature: 735088818cf24ebe0ebc7005a507da69 ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsValid;
		bool IsValid();

		/****** BRepGraph_OccurrenceRefId::IsValid ******/
		/****** md5 signature: 294f20297d740c99df23b64d8041b57c ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "
Parameters
----------
theMaxCount: uint32_t

Return
-------
bool

Description
-----------
True if this id points to an allocated slot within [0, theMaxCount). UINT32_MAX (invalid sentinel) always fails this check for any realistic count.
") IsValid;
		bool IsValid(const uint32_t theMaxCount);

		/****** BRepGraph_OccurrenceRefId::Start ******/
		/****** md5 signature: fc9e9cfb659953f8d767f808052e7c04 ******/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "Return
-------
BRepGraph_OccurrenceRefId

Description
-----------
First valid id in a dense per-kind sequence.
") Start;
		static BRepGraph_OccurrenceRefId Start();


%extend{
    bool __ne_wrapper__(BRepGraph_OccurrenceRefId other) {
        if (*self!=other) return true;
        else return false;
    }
}
%pythoncode {
def __ne__(self, right):
    try:
        return self.__ne_wrapper__(right)
    except:
        return True
}

%extend{
    bool __ne_wrapper__(const BRepGraph_RefId other) {
        if (*self!=other) return true;
        else return false;
    }
}
%pythoncode {
def __ne__(self, right):
    try:
        return self.__ne_wrapper__(right)
    except:
        return True
}
		/****** BRepGraph_OccurrenceRefId::operator + ******/
		/****** md5 signature: c69f1fde8a4abf6a73054fa1db2c1fe3 ******/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "
Parameters
----------
theOffset: uint32_t

Return
-------
BRepGraph_OccurrenceRefId

Description
-----------
Advance by offset.
") operator +;
		BRepGraph_OccurrenceRefId operator +(const uint32_t theOffset);

		/****** BRepGraph_OccurrenceRefId::operator - ******/
		/****** md5 signature: 05213caff5555da9f8d7e29a9b6a1930 ******/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "
Parameters
----------
theOffset: uint32_t

Return
-------
BRepGraph_OccurrenceRefId

Description
-----------
Retreat by offset.
") operator -;
		BRepGraph_OccurrenceRefId operator -(const uint32_t theOffset);


%extend{
    bool __eq_wrapper__(BRepGraph_OccurrenceRefId other) {
        if (*self==other) return true;
        else return false;
    }
}
%pythoncode {
def __eq__(self, right):
    try:
        return self.__eq_wrapper__(right)
    except:
        return False
}

%extend{
    bool __eq_wrapper__(const BRepGraph_RefId other) {
        if (*self==other) return true;
        else return false;
    }
}
%pythoncode {
def __eq__(self, right):
    try:
        return self.__eq_wrapper__(right)
    except:
        return False
}
};


%extend BRepGraph_OccurrenceRefId {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class BRepGraph_ParallelPolicy *
*********************************/
class BRepGraph_ParallelPolicy {
	public:
		/****** BRepGraph_ParallelPolicy::IsParallelAllowed ******/
		/****** md5 signature: 5956bc9e241bcf6efecb16182b20ce57 ******/
		%feature("compactdefaultargs") IsParallelAllowed;
		%feature("autodoc", "
Parameters
----------
theAllowParallel: bool

Return
-------
bool

Description
-----------
Check whether parallel execution is allowed and meaningful at all.
") IsParallelAllowed;
		static bool IsParallelAllowed(const bool theAllowParallel);

		/****** BRepGraph_ParallelPolicy::ShouldRun ******/
		/****** md5 signature: cdbb5e1fb055684b2705527b27b222e7 ******/
		%feature("compactdefaultargs") ShouldRun;
		%feature("autodoc", "
Parameters
----------
theAllowParallel: bool
theWorkers: int
theWorkload: BRepGraph_ParallelPolicy_Workload

Return
-------
bool

Description
-----------
Decide whether the estimated workload is large enough to amortize thread-pool launch and synchronization overhead. 
Input parameter: theAllowParallel whether parallel mode is allowed by the caller 
Input parameter: theWorkers effective logical worker count 
Input parameter: theWorkload estimated workload for the phase 
Return: true if parallel execution should be used.
") ShouldRun;
		static bool ShouldRun(const bool theAllowParallel, const int theWorkers, BRepGraph_ParallelPolicy_Workload theWorkload);

		/****** BRepGraph_ParallelPolicy::ShouldRun ******/
		/****** md5 signature: 75b5f4631785b4af2e38dfbfa85bba8a ******/
		%feature("compactdefaultargs") ShouldRun;
		%feature("autodoc", "
Parameters
----------
theAllowParallel: bool
theWorkload: BRepGraph_ParallelPolicy_Workload

Return
-------
bool

Description
-----------
Overload that queries the active worker count lazily. 
Input parameter: theAllowParallel whether parallel mode is allowed by the caller 
Input parameter: theWorkload estimated workload for the phase 
Return: true if parallel execution should be used.
") ShouldRun;
		static bool ShouldRun(const bool theAllowParallel, BRepGraph_ParallelPolicy_Workload theWorkload);

		/****** BRepGraph_ParallelPolicy::WorkerCount ******/
		/****** md5 signature: 088f163c069b94a4b467faf9869f9a25 ******/
		%feature("compactdefaultargs") WorkerCount;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return the effective logical worker count reported by OSD_Parallel.
") WorkerCount;
		static int WorkerCount();

};


%extend BRepGraph_ParallelPolicy {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class BRepGraph_ParallelPolicy_Workload *
******************************************/
class BRepGraph_ParallelPolicy_Workload {
	public:
		uint32_t PrimaryItems;
		uint32_t AuxiliaryItems;
		uint32_t InteractionCount;
};


%extend BRepGraph_ParallelPolicy_Workload {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class BRepGraph_ParentExplorer *
*********************************/
class BRepGraph_ParentExplorer {
	public:
/* public enums */
enum class LinkKind {
	None = 0,
	Reference = 1,
	Structural = 2,
};

enum class TraversalMode {
	Recursive = 0,
	DirectParents = 1,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class LinkKind(IntEnum):
	None_ = 0
	Reference = 1
	Structural = 2
None_ = LinkKind.None_
Reference = LinkKind.Reference
Structural = LinkKind.Structural

class TraversalMode(IntEnum):
	Recursive = 0
	DirectParents = 1
Recursive = TraversalMode.Recursive
DirectParents = TraversalMode.DirectParents
};
/* end python proxy for enums */

		/****** BRepGraph_ParentExplorer::BRepGraph_ParentExplorer ******/
		/****** md5 signature: 964075292e77844249f86fac84df97a1 ******/
		%feature("compactdefaultargs") BRepGraph_ParentExplorer;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theNode: BRepGraph_NodeId
theConfig: BRepGraph_ParentExplorer_Config

Return
-------
None

Description
-----------
Preferred long-term constructor: all tuning knobs in `Config`. 
Input parameter: theGraph graph to walk 
Input parameter: theNode starting node whose ancestors are explored 
Input parameter: theConfig traversal configuration.
") BRepGraph_ParentExplorer;
		 BRepGraph_ParentExplorer(const BRepGraph & theGraph, const BRepGraph_NodeId theNode, BRepGraph_ParentExplorer_Config theConfig);

		/****** BRepGraph_ParentExplorer::BRepGraph_ParentExplorer ******/
		/****** md5 signature: bbb37f046026bec0a31d064d61aa0d8a ******/
		%feature("compactdefaultargs") BRepGraph_ParentExplorer;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theNode: BRepGraph_NodeId

Return
-------
None

Description
-----------
Explore all parents of the starting node. 
Input parameter: theGraph graph to walk 
Input parameter: theNode starting node whose ancestors are explored.
") BRepGraph_ParentExplorer;
		 BRepGraph_ParentExplorer(const BRepGraph & theGraph, const BRepGraph_NodeId theNode);

		/****** BRepGraph_ParentExplorer::BRepGraph_ParentExplorer ******/
		/****** md5 signature: aa3bbe5e63239680d3d42004c41ca792 ******/
		%feature("compactdefaultargs") BRepGraph_ParentExplorer;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theNode: BRepGraph_NodeId
theMode: TraversalMode

Return
-------
None

Description
-----------
Explore parents of the starting node using the given traversal mode. 
Input parameter: theGraph graph to walk 
Input parameter: theNode starting node whose ancestors are explored 
Input parameter: theMode traversal strategy (recursive or direct parents).
") BRepGraph_ParentExplorer;
		 BRepGraph_ParentExplorer(const BRepGraph & theGraph, const BRepGraph_NodeId theNode, TraversalMode theMode);

		/****** BRepGraph_ParentExplorer::BRepGraph_ParentExplorer ******/
		/****** md5 signature: c75fd288c21c2f9de62c08d504d44879 ******/
		%feature("compactdefaultargs") BRepGraph_ParentExplorer;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theNode: BRepGraph_NodeId
theAvoidKind: std::optional<BRepGraph_NodeId::Kind>
theEmitAvoidKind: bool
theMode: TraversalMode (optional, default to TraversalMode::Recursive)

Return
-------
None

Description
-----------
Explore all parents while pruning branches at the avoid kind. 
Input parameter: theGraph graph to walk 
Input parameter: theNode starting node whose ancestors are explored 
Input parameter: theAvoidKind node kind to avoid ascending through 
Input parameter: theEmitAvoidKind if true, emit matching avoid-kind ancestors once 
Input parameter: theMode traversal strategy.
") BRepGraph_ParentExplorer;
		 BRepGraph_ParentExplorer(const BRepGraph & theGraph, const BRepGraph_NodeId theNode, const std::optional<BRepGraph_NodeId::Kind> & theAvoidKind, bool theEmitAvoidKind, TraversalMode theMode = TraversalMode::Recursive);

		/****** BRepGraph_ParentExplorer::BRepGraph_ParentExplorer ******/
		/****** md5 signature: 135eb9bf419f9090b176f3061a339438 ******/
		%feature("compactdefaultargs") BRepGraph_ParentExplorer;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theNode: BRepGraph_NodeId
theTargetKind: BRepGraph_NodeId::Kind

Return
-------
None

Description
-----------
Explore only parents of the given kind. 
Input parameter: theGraph graph to walk 
Input parameter: theNode starting node whose ancestors are explored 
Input parameter: theTargetKind kind of nodes to emit.
") BRepGraph_ParentExplorer;
		 BRepGraph_ParentExplorer(const BRepGraph & theGraph, const BRepGraph_NodeId theNode, BRepGraph_NodeId::Kind theTargetKind);

		/****** BRepGraph_ParentExplorer::BRepGraph_ParentExplorer ******/
		/****** md5 signature: aef566573d07c428941afdd462f402af ******/
		%feature("compactdefaultargs") BRepGraph_ParentExplorer;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theNode: BRepGraph_NodeId
theTargetKind: BRepGraph_NodeId::Kind
theMode: TraversalMode

Return
-------
None

Description
-----------
Explore only parents of the given kind using the given traversal mode. 
Input parameter: theGraph graph to walk 
Input parameter: theNode starting node whose ancestors are explored 
Input parameter: theTargetKind kind of nodes to emit 
Input parameter: theMode traversal strategy.
") BRepGraph_ParentExplorer;
		 BRepGraph_ParentExplorer(const BRepGraph & theGraph, const BRepGraph_NodeId theNode, BRepGraph_NodeId::Kind theTargetKind, TraversalMode theMode);

		/****** BRepGraph_ParentExplorer::BRepGraph_ParentExplorer ******/
		/****** md5 signature: c8b63c2384c652334ab1203b7fb484c0 ******/
		%feature("compactdefaultargs") BRepGraph_ParentExplorer;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theNode: BRepGraph_NodeId
theTargetKind: BRepGraph_NodeId::Kind
theAvoidKind: std::optional<BRepGraph_NodeId::Kind>
theEmitAvoidKind: bool
theMode: TraversalMode (optional, default to TraversalMode::Recursive)

Return
-------
None

Description
-----------
Explore parents of the given kind while pruning branches at the avoid kind. 
Input parameter: theGraph graph to walk 
Input parameter: theNode starting node whose ancestors are explored 
Input parameter: theTargetKind kind of nodes to emit 
Input parameter: theAvoidKind node kind to avoid ascending through 
Input parameter: theEmitAvoidKind if true, emit matching avoid-kind ancestors once 
Input parameter: theMode traversal strategy.
") BRepGraph_ParentExplorer;
		 BRepGraph_ParentExplorer(const BRepGraph & theGraph, const BRepGraph_NodeId theNode, BRepGraph_NodeId::Kind theTargetKind, const std::optional<BRepGraph_NodeId::Kind> & theAvoidKind, bool theEmitAvoidKind, TraversalMode theMode = TraversalMode::Recursive);

		/****** BRepGraph_ParentExplorer::Current ******/
		/****** md5 signature: 82e23e0bb00d40826e239467ede4a6af ******/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "Return
-------
BRepGraphInc::NodeInstance

Description
-----------
Current matching ancestor node with accumulated location and orientation.
") Current;
		BRepGraphInc::NodeInstance Current();

		/****** BRepGraph_ParentExplorer::CurrentChild ******/
		/****** md5 signature: 5c40eb16c8b237855ce23101ed14d172 ******/
		%feature("compactdefaultargs") CurrentChild;
		%feature("autodoc", "Return
-------
BRepGraph_NodeId

Description
-----------
Returns the immediate child of Current() on the currently emitted branch. Returns invalid NodeId when no current ancestor is available.
") CurrentChild;
		BRepGraph_NodeId CurrentChild();

		/****** BRepGraph_ParentExplorer::CurrentLinkKind ******/
		/****** md5 signature: 6e64e5844ac211e45d10eea0279c29d8 ******/
		%feature("compactdefaultargs") CurrentLinkKind;
		%feature("autodoc", "Return
-------
BRepGraph_ParentExplorer::LinkKind

Description
-----------
Returns how Current() is linked to CurrentChild().
") CurrentLinkKind;
		BRepGraph_ParentExplorer::LinkKind CurrentLinkKind();

		/****** BRepGraph_ParentExplorer::CurrentRef ******/
		/****** md5 signature: 2da38ffd2d61464229ac29ede4921e7c ******/
		%feature("compactdefaultargs") CurrentRef;
		%feature("autodoc", "Return
-------
BRepGraph_RefId

Description
-----------
Returns the exact parent-owned RefId linking Current() to CurrentChild(), when that branch step is represented by a reference entry. //! Some upward steps are structural and therefore have no parent-owned ref entry even though the parent itself is still emitted by the explorer. In those cases this method returns an invalid RefId, for example for CoEdge->Edge and Occurrence->Product/topology-root.
") CurrentRef;
		BRepGraph_RefId CurrentRef();

		/****** BRepGraph_ParentExplorer::GetConfig ******/
		/****** md5 signature: 4fd244f59b28336c2db6aa049f5f1c3e ******/
		%feature("compactdefaultargs") GetConfig;
		%feature("autodoc", "Return
-------
BRepGraph_ParentExplorer_Config

Description
-----------
Returns the traversal configuration this explorer was constructed with. Read-only - configuration is fixed for the lifetime of the explorer.
") GetConfig;
		const BRepGraph_ParentExplorer_Config & GetConfig();

		/****** BRepGraph_ParentExplorer::IsCurrentBranchRoot ******/
		/****** md5 signature: 7cb0b563c6e76713895f20393d56d8ca ******/
		%feature("compactdefaultargs") IsCurrentBranchRoot;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if Current() is the explicit root node of the current branch.
") IsCurrentBranchRoot;
		bool IsCurrentBranchRoot();

		/****** BRepGraph_ParentExplorer::LeafLocation ******/
		/****** md5 signature: efb751ad32299e67ba0c783a58b77189 ******/
		%feature("compactdefaultargs") LeafLocation;
		%feature("autodoc", "Return
-------
TopLoc_Location

Description
-----------
Accumulated location at the starting node of the current branch.
") LeafLocation;
		const TopLoc_Location & LeafLocation();

		/****** BRepGraph_ParentExplorer::LeafOrientation ******/
		/****** md5 signature: 373435cd814eecb8b012c12b52377046 ******/
		%feature("compactdefaultargs") LeafOrientation;
		%feature("autodoc", "Return
-------
TopAbs_Orientation

Description
-----------
Accumulated orientation at the starting node of the current branch.
") LeafOrientation;
		TopAbs_Orientation LeafOrientation();

		/****** BRepGraph_ParentExplorer::More ******/
		/****** md5 signature: 0a7b505ff53e438121f2c208f8ae7ce8 ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if another matching parent is available.
") More;
		bool More();

		/****** BRepGraph_ParentExplorer::Next ******/
		/****** md5 signature: f35c0df5f1d7c877986db18081404532 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
Advance to the next matching parent.
") Next;
		void Next();

		/****** BRepGraph_ParentExplorer::begin ******/
		/****** md5 signature: 5d7db85dba82b551fbc32eb40b347942 ******/
		%feature("compactdefaultargs") begin;
		%feature("autodoc", "Return
-------
NCollection_ForwardRangeIterator<BRepGraph_ParentExplorer >

Description
-----------
Returns an STL-compatible iterator for range-based for loops.
") begin;
		NCollection_ForwardRangeIterator<BRepGraph_ParentExplorer > begin();

		/****** BRepGraph_ParentExplorer::end ******/
		/****** md5 signature: 4edef9faa595e2b9527109cc32e6ec32 ******/
		%feature("compactdefaultargs") end;
		%feature("autodoc", "Return
-------
NCollection_ForwardRangeSentinel

Description
-----------
Returns a sentinel marking the end of iteration.
") end;
		NCollection_ForwardRangeSentinel end();

};


%extend BRepGraph_ParentExplorer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class BRepGraph_ParentExplorer_Config *
****************************************/
class BRepGraph_ParentExplorer_Config {
	public:
		BRepGraph_ParentExplorer::TraversalMode Mode;
		bool EmitAvoidKind;
};


%extend BRepGraph_ParentExplorer_Config {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class BRepGraph_ProductId *
****************************/
class BRepGraph_ProductId {
	public:
		uint32_t Index;
		/****** BRepGraph_ProductId::BRepGraph_ProductId ******/
		/****** md5 signature: 4311b88151facb04e31a8f94c612d63e ******/
		%feature("compactdefaultargs") BRepGraph_ProductId;
		%feature("autodoc", "Return
-------
None

Description
-----------
Default: invalid (Index = UINT32_MAX).
") BRepGraph_ProductId;
		 BRepGraph_ProductId();

		/****** BRepGraph_ProductId::BRepGraph_ProductId ******/
		/****** md5 signature: 718adffe00b7c66230abfc0915fac1a6 ******/
		%feature("compactdefaultargs") BRepGraph_ProductId;
		%feature("autodoc", "
Parameters
----------
theIdx: uint32_t

Return
-------
None

Description
-----------
Construct from index.
") BRepGraph_ProductId;
		 BRepGraph_ProductId(const uint32_t theIdx);

		/****** BRepGraph_ProductId::BRepGraph_ProductId ******/
		/****** md5 signature: 06f9543631732e963a42611acebb8a88 ******/
		%feature("compactdefaultargs") BRepGraph_ProductId;
		%feature("autodoc", "
Parameters
----------
theId: BRepGraph_NodeId

Return
-------
None

Description
-----------
Construct from an untyped node id of the same kind.
") BRepGraph_ProductId;
		 BRepGraph_ProductId(const BRepGraph_NodeId theId);

		/****** BRepGraph_ProductId::FromNodeId ******/
		/****** md5 signature: 446894b9c1847edab23d1c81f8aa599c ******/
		%feature("compactdefaultargs") FromNodeId;
		%feature("autodoc", "
Parameters
----------
theId: BRepGraph_NodeId

Return
-------
BRepGraph_ProductId

Description
-----------
Explicit conversion from untyped NodeId. Asserts that the Kind matches in debug builds. 
Input parameter: theId untyped NodeId to convert.
") FromNodeId;
		static BRepGraph_ProductId FromNodeId(const BRepGraph_NodeId theId);

		/****** BRepGraph_ProductId::Invalid ******/
		/****** md5 signature: 19622d4f1c44c5c7e384ccc5986fb8d8 ******/
		%feature("compactdefaultargs") Invalid;
		%feature("autodoc", "Return
-------
BRepGraph_ProductId

Description
-----------
Invalid sentinel id.
") Invalid;
		static BRepGraph_ProductId Invalid();

		/****** BRepGraph_ProductId::IsOwned ******/
		/****** md5 signature: 82162d9fddf9bcd26161cc7f9c342a8b ******/
		%feature("compactdefaultargs") IsOwned;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph

Return
-------
bool

Description
-----------
Return true if this node has an active owner in the given graph.
") IsOwned;
		bool IsOwned(const BRepGraph & theGraph);

		/****** BRepGraph_ProductId::IsRemoved ******/
		/****** md5 signature: 75ed1923a75d2c35c92a9683349c6622 ******/
		%feature("compactdefaultargs") IsRemoved;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph

Return
-------
bool

Description
-----------
Return true if this node has been soft-removed in the given graph.
") IsRemoved;
		bool IsRemoved(const BRepGraph & theGraph);

		/****** BRepGraph_ProductId::IsValid ******/
		/****** md5 signature: 735088818cf24ebe0ebc7005a507da69 ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if this id points to an allocated node slot.
") IsValid;
		bool IsValid();

		/****** BRepGraph_ProductId::IsValid ******/
		/****** md5 signature: 294f20297d740c99df23b64d8041b57c ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "
Parameters
----------
theMaxCount: uint32_t

Return
-------
bool

Description
-----------
True if this id points to an allocated slot within [0, theMaxCount). UINT32_MAX (invalid sentinel) always fails this check for any realistic count.
") IsValid;
		bool IsValid(const uint32_t theMaxCount);

		/****** BRepGraph_ProductId::Start ******/
		/****** md5 signature: fc9e9cfb659953f8d767f808052e7c04 ******/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "Return
-------
BRepGraph_ProductId

Description
-----------
First valid id in a dense per-kind sequence.
") Start;
		static BRepGraph_ProductId Start();


%extend{
    bool __ne_wrapper__(BRepGraph_ProductId other) {
        if (*self!=other) return true;
        else return false;
    }
}
%pythoncode {
def __ne__(self, right):
    try:
        return self.__ne_wrapper__(right)
    except:
        return True
}

%extend{
    bool __ne_wrapper__(const BRepGraph_NodeId other) {
        if (*self!=other) return true;
        else return false;
    }
}
%pythoncode {
def __ne__(self, right):
    try:
        return self.__ne_wrapper__(right)
    except:
        return True
}
		/****** BRepGraph_ProductId::operator + ******/
		/****** md5 signature: c69f1fde8a4abf6a73054fa1db2c1fe3 ******/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "
Parameters
----------
theOffset: uint32_t

Return
-------
BRepGraph_ProductId

Description
-----------
Advance by offset.
") operator +;
		BRepGraph_ProductId operator +(const uint32_t theOffset);

		/****** BRepGraph_ProductId::operator - ******/
		/****** md5 signature: 05213caff5555da9f8d7e29a9b6a1930 ******/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "
Parameters
----------
theOffset: uint32_t

Return
-------
BRepGraph_ProductId

Description
-----------
Retreat by offset.
") operator -;
		BRepGraph_ProductId operator -(const uint32_t theOffset);


%extend{
    bool __eq_wrapper__(BRepGraph_ProductId other) {
        if (*self==other) return true;
        else return false;
    }
}
%pythoncode {
def __eq__(self, right):
    try:
        return self.__eq_wrapper__(right)
    except:
        return False
}

%extend{
    bool __eq_wrapper__(const BRepGraph_NodeId other) {
        if (*self==other) return true;
        else return false;
    }
}
%pythoncode {
def __eq__(self, right):
    try:
        return self.__eq_wrapper__(right)
    except:
        return False
}
};


%extend BRepGraph_ProductId {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class BRepGraph_RefId *
************************/
class BRepGraph_RefId {
	public:
/* public enums */
enum class Kind {
	Shell = 0,
	Face = 1,
	Wire = 2,
	Vertex = 3,
	Solid = 4,
	Child = 5,
	Occurrence = 6,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class Kind(IntEnum):
	Shell = 0
	Face = 1
	Wire = 2
	Vertex = 3
	Solid = 4
	Child = 5
	Occurrence = 6
Shell = Kind.Shell
Face = Kind.Face
Wire = Kind.Wire
Vertex = Kind.Vertex
Solid = Kind.Solid
Child = Kind.Child
Occurrence = Kind.Occurrence
};
/* end python proxy for enums */

		Kind RefKind;
		uint32_t Index;
		/****** BRepGraph_RefId::BRepGraph_RefId ******/
		/****** md5 signature: 63eef125042a586ce2ab58e88ee27154 ******/
		%feature("compactdefaultargs") BRepGraph_RefId;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepGraph_RefId;
		 BRepGraph_RefId();

		/****** BRepGraph_RefId::BRepGraph_RefId ******/
		/****** md5 signature: 39b06b43a85698b0021dc5632ab2c69e ******/
		%feature("compactdefaultargs") BRepGraph_RefId;
		%feature("autodoc", "
Parameters
----------
theKind: Kind
theIdx: uint32_t

Return
-------
None

Description
-----------
No available documentation.
") BRepGraph_RefId;
		 BRepGraph_RefId(Kind theKind, const uint32_t theIdx);

		/****** BRepGraph_RefId::Invalid ******/
		/****** md5 signature: 0e88d17c967a2bbe198f62452891a0b0 ******/
		%feature("compactdefaultargs") Invalid;
		%feature("autodoc", "
Parameters
----------
theKind: Kind (optional, default to Kind::Shell)

Return
-------
BRepGraph_RefId

Description
-----------
Invalid sentinel id for the specified kind.
") Invalid;
		static BRepGraph_RefId Invalid(Kind theKind = Kind::Shell);

		/****** BRepGraph_RefId::IsOwned ******/
		/****** md5 signature: e4d58d12130e79c19bbd8558c64292f0 ******/
		%feature("compactdefaultargs") IsOwned;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph

Return
-------
bool

Description
-----------
Return true if this reference entry has an active owner in the given graph.
") IsOwned;
		bool IsOwned(const BRepGraph & theGraph);

		/****** BRepGraph_RefId::IsRemoved ******/
		/****** md5 signature: 4ad9974a183fb602e7b1ad7dfda90050 ******/
		%feature("compactdefaultargs") IsRemoved;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph

Return
-------
bool

Description
-----------
Return true if this reference entry has been soft-removed in the given graph.
") IsRemoved;
		bool IsRemoved(const BRepGraph & theGraph);

		/****** BRepGraph_RefId::IsTopologyRefKind ******/
		/****** md5 signature: 8dc40385a57da1ac0e40eac5b3632bc0 ******/
		%feature("compactdefaultargs") IsTopologyRefKind;
		%feature("autodoc", "
Parameters
----------
theKind: Kind

Return
-------
bool

Description
-----------
No available documentation.
") IsTopologyRefKind;
		static bool IsTopologyRefKind(Kind theKind);

		/****** BRepGraph_RefId::IsValid ******/
		/****** md5 signature: 735088818cf24ebe0ebc7005a507da69 ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsValid;
		bool IsValid();

		/****** BRepGraph_RefId::IsValid ******/
		/****** md5 signature: 294f20297d740c99df23b64d8041b57c ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "
Parameters
----------
theMaxCount: uint32_t

Return
-------
bool

Description
-----------
True if this id points to an allocated slot within [0, theMaxCount). UINT32_MAX (invalid sentinel) always fails this check for any realistic count.
") IsValid;
		bool IsValid(const uint32_t theMaxCount);

		/****** BRepGraph_RefId::IsValidKind ******/
		/****** md5 signature: 59549bb935f435066c3d7d48507e26d3 ******/
		%feature("compactdefaultargs") IsValidKind;
		%feature("autodoc", "
Parameters
----------
theKind: Kind

Return
-------
bool

Description
-----------
True if the kind value is one of the supported reference kinds.
") IsValidKind;
		static bool IsValidKind(Kind theKind);

		/****** BRepGraph_RefId::Start ******/
		/****** md5 signature: 4fc5549edfe98f77a48ef1737443df99 ******/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "
Parameters
----------
theKind: Kind

Return
-------
BRepGraph_RefId

Description
-----------
First valid id in a dense sequence for the specified kind.
") Start;
		static BRepGraph_RefId Start(Kind theKind);


%extend{
    bool __ne_wrapper__(const BRepGraph_RefId other) {
        if (*self!=other) return true;
        else return false;
    }
}
%pythoncode {
def __ne__(self, right):
    try:
        return self.__ne_wrapper__(right)
    except:
        return True
}
		/****** BRepGraph_RefId::operator + ******/
		/****** md5 signature: 7e733849c05798127f48507d8f2a3407 ******/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "
Parameters
----------
theOffset: uint32_t

Return
-------
BRepGraph_RefId

Description
-----------
Advance by offset.
") operator +;
		BRepGraph_RefId operator +(const uint32_t theOffset);

		/****** BRepGraph_RefId::operator - ******/
		/****** md5 signature: aac3ef773dba99d7351fd1d33e06b1a3 ******/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "
Parameters
----------
theOffset: uint32_t

Return
-------
BRepGraph_RefId

Description
-----------
Retreat by offset.
") operator -;
		BRepGraph_RefId operator -(const uint32_t theOffset);


%extend{
    bool __eq_wrapper__(const BRepGraph_RefId other) {
        if (*self==other) return true;
        else return false;
    }
}
%pythoncode {
def __eq__(self, right):
    try:
        return self.__eq_wrapper__(right)
    except:
        return False
}
};


%extend BRepGraph_RefId {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class BRepGraph_RefId_Typed *
******************************/
/*************************
* class BRepGraph_RefUID *
*************************/
class BRepGraph_RefUID {
	public:
		BRepGraph_RefId::Kind Kind;
		uint32_t Counter;
		/****** BRepGraph_RefUID::BRepGraph_RefUID ******/
		/****** md5 signature: 4e228fd75888357e546925d5f3815d0b ******/
		%feature("compactdefaultargs") BRepGraph_RefUID;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepGraph_RefUID;
		 BRepGraph_RefUID();

		/****** BRepGraph_RefUID::BRepGraph_RefUID ******/
		/****** md5 signature: 7199a0346f333d0ee6583171fc86708b ******/
		%feature("compactdefaultargs") BRepGraph_RefUID;
		%feature("autodoc", "
Parameters
----------
theKind: BRepGraph_RefId::Kind
theCounter: uint32_t

Return
-------
None

Description
-----------
No available documentation.
") BRepGraph_RefUID;
		 BRepGraph_RefUID(const BRepGraph_RefId::Kind theKind, const uint32_t theCounter);

		/****** BRepGraph_RefUID::HashValue ******/
		/****** md5 signature: cfafde6dce6a8bec2e309186d08373c6 ******/
		%feature("compactdefaultargs") HashValue;
		%feature("autodoc", "Return
-------
size_t

Description
-----------
No available documentation.
") HashValue;
		size_t HashValue();

		/****** BRepGraph_RefUID::Invalid ******/
		/****** md5 signature: 34b323aec150cb5092769f73c12eeead ******/
		%feature("compactdefaultargs") Invalid;
		%feature("autodoc", "Return
-------
BRepGraph_RefUID

Description
-----------
No available documentation.
") Invalid;
		static BRepGraph_RefUID Invalid();

		/****** BRepGraph_RefUID::IsValid ******/
		/****** md5 signature: 735088818cf24ebe0ebc7005a507da69 ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if this UID has a valid kind and a non-zero counter.
") IsValid;
		bool IsValid();

};


%extend BRepGraph_RefUID {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class BRepGraph_RefsView *
***************************/
%nodefaultctor BRepGraph_RefsView;
class BRepGraph_RefsView {
	public:
		/****** BRepGraph_RefsView::Children ******/
		/****** md5 signature: 1c8b707beb18f6695e717501c36eb1c3 ******/
		%feature("compactdefaultargs") Children;
		%feature("autodoc", "Return
-------
BRepGraph_RefsView_ChildOps

Description
-----------
Grouped child reference queries.
") Children;
		const BRepGraph_RefsView_ChildOps & Children();

		/****** BRepGraph_RefsView::Faces ******/
		/****** md5 signature: b3511b1f1fbc70cbaabdb4e5fb6aba05 ******/
		%feature("compactdefaultargs") Faces;
		%feature("autodoc", "Return
-------
BRepGraph_RefsView_FaceOps

Description
-----------
Grouped face reference queries.
") Faces;
		const BRepGraph_RefsView_FaceOps & Faces();

		/****** BRepGraph_RefsView::Gen ******/
		/****** md5 signature: f10768ed4aba6ab5556e0fcc85f11f36 ******/
		%feature("compactdefaultargs") Gen;
		%feature("autodoc", "Return
-------
BRepGraph_RefsView_GenOps

Description
-----------
Grouped generic reference id queries.
") Gen;
		const BRepGraph_RefsView_GenOps & Gen();

		/****** BRepGraph_RefsView::Occurrences ******/
		/****** md5 signature: b3400ceb8029d4fa05c13b024cb4b1a3 ******/
		%feature("compactdefaultargs") Occurrences;
		%feature("autodoc", "Return
-------
BRepGraph_RefsView_OccurrenceOps

Description
-----------
Grouped occurrence reference queries.
") Occurrences;
		const BRepGraph_RefsView_OccurrenceOps & Occurrences();

		/****** BRepGraph_RefsView::Shells ******/
		/****** md5 signature: 6796a82939d43df0aa022a584750940b ******/
		%feature("compactdefaultargs") Shells;
		%feature("autodoc", "Return
-------
BRepGraph_RefsView_ShellOps

Description
-----------
Grouped shell reference queries.
") Shells;
		const BRepGraph_RefsView_ShellOps & Shells();

		/****** BRepGraph_RefsView::Solids ******/
		/****** md5 signature: 0e55fa047f97547a9d76be76ee856325 ******/
		%feature("compactdefaultargs") Solids;
		%feature("autodoc", "Return
-------
BRepGraph_RefsView_SolidOps

Description
-----------
Grouped solid reference queries.
") Solids;
		const BRepGraph_RefsView_SolidOps & Solids();

		/****** BRepGraph_RefsView::Vertices ******/
		/****** md5 signature: d564532d5dc1edbbff3f722d756cd59b ******/
		%feature("compactdefaultargs") Vertices;
		%feature("autodoc", "Return
-------
BRepGraph_RefsView_VertexOps

Description
-----------
Grouped vertex reference queries.
") Vertices;
		const BRepGraph_RefsView_VertexOps & Vertices();

		/****** BRepGraph_RefsView::Wires ******/
		/****** md5 signature: 5404ab711462d792f17e2cb9b4f36bdb ******/
		%feature("compactdefaultargs") Wires;
		%feature("autodoc", "Return
-------
BRepGraph_RefsView_WireOps

Description
-----------
Grouped wire reference queries.
") Wires;
		const BRepGraph_RefsView_WireOps & Wires();

};


%extend BRepGraph_RefsView {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class BRepGraph_RefsView_ChildOps *
************************************/
%nodefaultctor BRepGraph_RefsView_ChildOps;
class BRepGraph_RefsView_ChildOps {
	public:
		/****** BRepGraph_RefsView_ChildOps::EndId ******/
		/****** md5 signature: 913959f9e5abc163a987e1d9d3ce6cb9 ******/
		%feature("compactdefaultargs") EndId;
		%feature("autodoc", "Return
-------
BRepGraph_ChildRefId

Description
-----------
No available documentation.
") EndId;
		BRepGraph_ChildRefId EndId();

		/****** BRepGraph_RefsView_ChildOps::Entry ******/
		/****** md5 signature: 5dcaf9c281211f55fd2d85b19012c4d8 ******/
		%feature("compactdefaultargs") Entry;
		%feature("autodoc", "
Parameters
----------
theRefId: BRepGraph_ChildRefId

Return
-------
BRepGraphInc::ChildRef

Description
-----------
No available documentation.
") Entry;
		const BRepGraphInc::ChildRef & Entry(const BRepGraph_ChildRefId theRefId);

		/****** BRepGraph_RefsView_ChildOps::IdsOf ******/
		/****** md5 signature: b418c4c001d2dc3acd0efd1cae217f05 ******/
		%feature("compactdefaultargs") IdsOf;
		%feature("autodoc", "
Parameters
----------
theCompound: BRepGraph_CompoundId

Return
-------
NCollection_LinearVector<BRepGraph_ChildRefId>

Description
-----------
No available documentation.
") IdsOf;
		const NCollection_LinearVector<BRepGraph_ChildRefId> & IdsOf(const BRepGraph_CompoundId theCompound);

		/****** BRepGraph_RefsView_ChildOps::IdsReferencing ******/
		/****** md5 signature: dfff646117706e1a11a51debb773973a ******/
		%feature("compactdefaultargs") IdsReferencing;
		%feature("autodoc", "
Parameters
----------
theChild: BRepGraph_NodeId

Return
-------
NCollection_LinearVector<BRepGraph_ChildRefId>

Description
-----------
No available documentation.
") IdsReferencing;
		const NCollection_LinearVector<BRepGraph_ChildRefId> & IdsReferencing(const BRepGraph_NodeId theChild);

		/****** BRepGraph_RefsView_ChildOps::Nb ******/
		/****** md5 signature: b01689e975b6c8fb5cb08a63884172d4 ******/
		%feature("compactdefaultargs") Nb;
		%feature("autodoc", "Return
-------
uint32_t

Description
-----------
No available documentation.
") Nb;
		uint32_t Nb();

		/****** BRepGraph_RefsView_ChildOps::NbActive ******/
		/****** md5 signature: 564978715d2dbe06aa9d90fa0b6ff0ef ******/
		%feature("compactdefaultargs") NbActive;
		%feature("autodoc", "Return
-------
uint32_t

Description
-----------
No available documentation.
") NbActive;
		uint32_t NbActive();

		/****** BRepGraph_RefsView_ChildOps::StartId ******/
		/****** md5 signature: eea7d8bc207b83e593d4a5e042026ea6 ******/
		%feature("compactdefaultargs") StartId;
		%feature("autodoc", "Return
-------
BRepGraph_ChildRefId

Description
-----------
No available documentation.
") StartId;
		BRepGraph_ChildRefId StartId();

};


%extend BRepGraph_RefsView_ChildOps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class BRepGraph_RefsView_FaceOps *
***********************************/
%nodefaultctor BRepGraph_RefsView_FaceOps;
class BRepGraph_RefsView_FaceOps {
	public:
		/****** BRepGraph_RefsView_FaceOps::EndId ******/
		/****** md5 signature: a78542e35d6c6a015016c34994bc4aa1 ******/
		%feature("compactdefaultargs") EndId;
		%feature("autodoc", "Return
-------
BRepGraph_FaceRefId

Description
-----------
No available documentation.
") EndId;
		BRepGraph_FaceRefId EndId();

		/****** BRepGraph_RefsView_FaceOps::Entry ******/
		/****** md5 signature: 0139369f15126d26312319e19deaf638 ******/
		%feature("compactdefaultargs") Entry;
		%feature("autodoc", "
Parameters
----------
theRefId: BRepGraph_FaceRefId

Return
-------
BRepGraphInc::FaceRef

Description
-----------
No available documentation.
") Entry;
		const BRepGraphInc::FaceRef & Entry(const BRepGraph_FaceRefId theRefId);

		/****** BRepGraph_RefsView_FaceOps::IdsOf ******/
		/****** md5 signature: 4b217b12f0af517a4ee356d99af81fd0 ******/
		%feature("compactdefaultargs") IdsOf;
		%feature("autodoc", "
Parameters
----------
theShell: BRepGraph_ShellId

Return
-------
NCollection_LinearVector<BRepGraph_FaceRefId>

Description
-----------
No available documentation.
") IdsOf;
		const NCollection_LinearVector<BRepGraph_FaceRefId> & IdsOf(const BRepGraph_ShellId theShell);

		/****** BRepGraph_RefsView_FaceOps::Nb ******/
		/****** md5 signature: b01689e975b6c8fb5cb08a63884172d4 ******/
		%feature("compactdefaultargs") Nb;
		%feature("autodoc", "Return
-------
uint32_t

Description
-----------
No available documentation.
") Nb;
		uint32_t Nb();

		/****** BRepGraph_RefsView_FaceOps::NbActive ******/
		/****** md5 signature: 564978715d2dbe06aa9d90fa0b6ff0ef ******/
		%feature("compactdefaultargs") NbActive;
		%feature("autodoc", "Return
-------
uint32_t

Description
-----------
No available documentation.
") NbActive;
		uint32_t NbActive();

		/****** BRepGraph_RefsView_FaceOps::StartId ******/
		/****** md5 signature: 94a609e6b7d6010a201be3f28184c072 ******/
		%feature("compactdefaultargs") StartId;
		%feature("autodoc", "Return
-------
BRepGraph_FaceRefId

Description
-----------
No available documentation.
") StartId;
		BRepGraph_FaceRefId StartId();

};


%extend BRepGraph_RefsView_FaceOps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class BRepGraph_RefsView_GenOps *
**********************************/
%nodefaultctor BRepGraph_RefsView_GenOps;
class BRepGraph_RefsView_GenOps {
	public:
		/****** BRepGraph_RefsView_GenOps::ChildNode ******/
		/****** md5 signature: ed702fe7c847e483bffd364e2ea387ab ******/
		%feature("compactdefaultargs") ChildNode;
		%feature("autodoc", "
Parameters
----------
theRef: BRepGraph_RefId

Return
-------
BRepGraph_NodeId

Description
-----------
Resolve the child definition node referenced by any typed RefId.
") ChildNode;
		BRepGraph_NodeId ChildNode(const BRepGraph_RefId theRef);

		/****** BRepGraph_RefsView_GenOps::IsActive ******/
		/****** md5 signature: a2fe9a876add984bef9eb88be3054a96 ******/
		%feature("compactdefaultargs") IsActive;
		%feature("autodoc", "
Parameters
----------
theRef: BRepGraph_RefId

Return
-------
bool

Description
-----------
Return true if the reference id is valid and not soft-removed.
") IsActive;
		bool IsActive(const BRepGraph_RefId theRef);

		/****** BRepGraph_RefsView_GenOps::IsRemoved ******/
		/****** md5 signature: 2ad4b3ff63ba4b7448b1d0bea5274d00 ******/
		%feature("compactdefaultargs") IsRemoved;
		%feature("autodoc", "
Parameters
----------
theRef: BRepGraph_RefId

Return
-------
bool

Description
-----------
Return true if the specified typed RefId is invalid or marked removed.
") IsRemoved;
		bool IsRemoved(const BRepGraph_RefId theRef);

		/****** BRepGraph_RefsView_GenOps::IsValid ******/
		/****** md5 signature: 50e9cec0cc0d66beb2382cddb1af2ae9 ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "
Parameters
----------
theRef: BRepGraph_RefId

Return
-------
bool

Description
-----------
Return true if the reference id kind and index are within storage bounds.
") IsValid;
		bool IsValid(const BRepGraph_RefId theRef);

		/****** BRepGraph_RefsView_GenOps::LocalLocation ******/
		/****** md5 signature: c2194a6eddecff49fdab9374f718a18d ******/
		%feature("compactdefaultargs") LocalLocation;
		%feature("autodoc", "
Parameters
----------
theRef: BRepGraph_RefId

Return
-------
TopLoc_Location

Description
-----------
Return the local location carried by the specified typed RefId. OccurrenceRef and invalid refs return identity.
") LocalLocation;
		TopLoc_Location LocalLocation(const BRepGraph_RefId theRef);

		/****** BRepGraph_RefsView_GenOps::Nb ******/
		/****** md5 signature: d355d11d7ee1f5f4e9dd4301d912088f ******/
		%feature("compactdefaultargs") Nb;
		%feature("autodoc", "
Parameters
----------
theKind: BRepGraph_RefId::Kind

Return
-------
uint32_t

Description
-----------
Return the number of references of the specified kind (including soft-removed).
") Nb;
		uint32_t Nb(const BRepGraph_RefId::Kind theKind);

		/****** BRepGraph_RefsView_GenOps::Orientation ******/
		/****** md5 signature: 933fdd0e786bc31d09d1a021414812b6 ******/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "
Parameters
----------
theRef: BRepGraph_RefId

Return
-------
TopAbs_Orientation

Description
-----------
Return the orientation carried by the specified typed RefId. OccurrenceRef and invalid refs return TopAbs_FORWARD.
") Orientation;
		TopAbs_Orientation Orientation(const BRepGraph_RefId theRef);

		/****** BRepGraph_RefsView_GenOps::RefAtStep ******/
		/****** md5 signature: 7e9f7bcd585b1f9fee8a1ea4773168a6 ******/
		%feature("compactdefaultargs") RefAtStep;
		%feature("autodoc", "
Parameters
----------
theParent: BRepGraph_NodeId
theStep: int

Return
-------
BRepGraph_RefId

Description
-----------
Return the direct parent-owned RefId stored at the specified child step. This is a structural lookup over the parent's raw ref arrays and does not skip removed refs or refs targeting removed child defs.
") RefAtStep;
		BRepGraph_RefId RefAtStep(const BRepGraph_NodeId theParent, const int theStep);

};


%extend BRepGraph_RefsView_GenOps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class BRepGraph_RefsView_OccurrenceOps *
*****************************************/
%nodefaultctor BRepGraph_RefsView_OccurrenceOps;
class BRepGraph_RefsView_OccurrenceOps {
	public:
		/****** BRepGraph_RefsView_OccurrenceOps::EndId ******/
		/****** md5 signature: 0ac60bbd705ce3b329d164bc9c99fa1f ******/
		%feature("compactdefaultargs") EndId;
		%feature("autodoc", "Return
-------
BRepGraph_OccurrenceRefId

Description
-----------
No available documentation.
") EndId;
		BRepGraph_OccurrenceRefId EndId();

		/****** BRepGraph_RefsView_OccurrenceOps::Entry ******/
		/****** md5 signature: d7f63f029c90b1199e2921e1126e43cd ******/
		%feature("compactdefaultargs") Entry;
		%feature("autodoc", "
Parameters
----------
theRefId: BRepGraph_OccurrenceRefId

Return
-------
BRepGraphInc::OccurrenceRef

Description
-----------
No available documentation.
") Entry;
		const BRepGraphInc::OccurrenceRef & Entry(const BRepGraph_OccurrenceRefId theRefId);

		/****** BRepGraph_RefsView_OccurrenceOps::IdsOf ******/
		/****** md5 signature: 3208081be752756a54733f34953c7880 ******/
		%feature("compactdefaultargs") IdsOf;
		%feature("autodoc", "
Parameters
----------
theProduct: BRepGraph_ProductId

Return
-------
NCollection_LinearVector<BRepGraph_OccurrenceRefId>

Description
-----------
No available documentation.
") IdsOf;
		const NCollection_LinearVector<BRepGraph_OccurrenceRefId> & IdsOf(const BRepGraph_ProductId theProduct);

		/****** BRepGraph_RefsView_OccurrenceOps::IdsReferencing ******/
		/****** md5 signature: 331078c0cab39b5e2284fcce1361773c ******/
		%feature("compactdefaultargs") IdsReferencing;
		%feature("autodoc", "
Parameters
----------
theChild: BRepGraph_NodeId

Return
-------
NCollection_LinearVector<BRepGraph_OccurrenceRefId>

Description
-----------
No available documentation.
") IdsReferencing;
		const NCollection_LinearVector<BRepGraph_OccurrenceRefId> & IdsReferencing(const BRepGraph_NodeId theChild);

		/****** BRepGraph_RefsView_OccurrenceOps::Nb ******/
		/****** md5 signature: b01689e975b6c8fb5cb08a63884172d4 ******/
		%feature("compactdefaultargs") Nb;
		%feature("autodoc", "Return
-------
uint32_t

Description
-----------
No available documentation.
") Nb;
		uint32_t Nb();

		/****** BRepGraph_RefsView_OccurrenceOps::NbActive ******/
		/****** md5 signature: 564978715d2dbe06aa9d90fa0b6ff0ef ******/
		%feature("compactdefaultargs") NbActive;
		%feature("autodoc", "Return
-------
uint32_t

Description
-----------
No available documentation.
") NbActive;
		uint32_t NbActive();

		/****** BRepGraph_RefsView_OccurrenceOps::StartId ******/
		/****** md5 signature: 9442380dad17e2fed24763e66d0cfaf9 ******/
		%feature("compactdefaultargs") StartId;
		%feature("autodoc", "Return
-------
BRepGraph_OccurrenceRefId

Description
-----------
No available documentation.
") StartId;
		BRepGraph_OccurrenceRefId StartId();

};


%extend BRepGraph_RefsView_OccurrenceOps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class BRepGraph_RefsView_ShellOps *
************************************/
%nodefaultctor BRepGraph_RefsView_ShellOps;
class BRepGraph_RefsView_ShellOps {
	public:
		/****** BRepGraph_RefsView_ShellOps::EndId ******/
		/****** md5 signature: 07bc5c7d6ce9659444231ea3b9b22cde ******/
		%feature("compactdefaultargs") EndId;
		%feature("autodoc", "Return
-------
BRepGraph_ShellRefId

Description
-----------
No available documentation.
") EndId;
		BRepGraph_ShellRefId EndId();

		/****** BRepGraph_RefsView_ShellOps::Entry ******/
		/****** md5 signature: 7768e7a8c684fb3f36eabcb03e5bb593 ******/
		%feature("compactdefaultargs") Entry;
		%feature("autodoc", "
Parameters
----------
theRefId: BRepGraph_ShellRefId

Return
-------
BRepGraphInc::ShellRef

Description
-----------
No available documentation.
") Entry;
		const BRepGraphInc::ShellRef & Entry(const BRepGraph_ShellRefId theRefId);

		/****** BRepGraph_RefsView_ShellOps::IdsOf ******/
		/****** md5 signature: 33d7613190de604e5eebbb7db902ecf2 ******/
		%feature("compactdefaultargs") IdsOf;
		%feature("autodoc", "
Parameters
----------
theSolid: BRepGraph_SolidId

Return
-------
NCollection_LinearVector<BRepGraph_ShellRefId>

Description
-----------
No available documentation.
") IdsOf;
		const NCollection_LinearVector<BRepGraph_ShellRefId> & IdsOf(const BRepGraph_SolidId theSolid);

		/****** BRepGraph_RefsView_ShellOps::Nb ******/
		/****** md5 signature: b01689e975b6c8fb5cb08a63884172d4 ******/
		%feature("compactdefaultargs") Nb;
		%feature("autodoc", "Return
-------
uint32_t

Description
-----------
No available documentation.
") Nb;
		uint32_t Nb();

		/****** BRepGraph_RefsView_ShellOps::NbActive ******/
		/****** md5 signature: 564978715d2dbe06aa9d90fa0b6ff0ef ******/
		%feature("compactdefaultargs") NbActive;
		%feature("autodoc", "Return
-------
uint32_t

Description
-----------
No available documentation.
") NbActive;
		uint32_t NbActive();

		/****** BRepGraph_RefsView_ShellOps::StartId ******/
		/****** md5 signature: 4b566bf36fe0c283e8232a2238613e32 ******/
		%feature("compactdefaultargs") StartId;
		%feature("autodoc", "Return
-------
BRepGraph_ShellRefId

Description
-----------
No available documentation.
") StartId;
		BRepGraph_ShellRefId StartId();

};


%extend BRepGraph_RefsView_ShellOps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class BRepGraph_RefsView_SolidOps *
************************************/
%nodefaultctor BRepGraph_RefsView_SolidOps;
class BRepGraph_RefsView_SolidOps {
	public:
		/****** BRepGraph_RefsView_SolidOps::EndId ******/
		/****** md5 signature: 9f2187a1c51bf83c06cc6f36dc01344d ******/
		%feature("compactdefaultargs") EndId;
		%feature("autodoc", "Return
-------
BRepGraph_SolidRefId

Description
-----------
No available documentation.
") EndId;
		BRepGraph_SolidRefId EndId();

		/****** BRepGraph_RefsView_SolidOps::Entry ******/
		/****** md5 signature: 9f4fe8bbe86697dd0e8d3dc296fafad8 ******/
		%feature("compactdefaultargs") Entry;
		%feature("autodoc", "
Parameters
----------
theRefId: BRepGraph_SolidRefId

Return
-------
BRepGraphInc::SolidRef

Description
-----------
No available documentation.
") Entry;
		const BRepGraphInc::SolidRef & Entry(const BRepGraph_SolidRefId theRefId);

		/****** BRepGraph_RefsView_SolidOps::IdsOf ******/
		/****** md5 signature: c9c5746253c1c83db5d3b21b96f974f5 ******/
		%feature("compactdefaultargs") IdsOf;
		%feature("autodoc", "
Parameters
----------
theCompSolid: BRepGraph_CompSolidId

Return
-------
NCollection_LinearVector<BRepGraph_SolidRefId>

Description
-----------
No available documentation.
") IdsOf;
		const NCollection_LinearVector<BRepGraph_SolidRefId> & IdsOf(const BRepGraph_CompSolidId theCompSolid);

		/****** BRepGraph_RefsView_SolidOps::Nb ******/
		/****** md5 signature: b01689e975b6c8fb5cb08a63884172d4 ******/
		%feature("compactdefaultargs") Nb;
		%feature("autodoc", "Return
-------
uint32_t

Description
-----------
No available documentation.
") Nb;
		uint32_t Nb();

		/****** BRepGraph_RefsView_SolidOps::NbActive ******/
		/****** md5 signature: 564978715d2dbe06aa9d90fa0b6ff0ef ******/
		%feature("compactdefaultargs") NbActive;
		%feature("autodoc", "Return
-------
uint32_t

Description
-----------
No available documentation.
") NbActive;
		uint32_t NbActive();

		/****** BRepGraph_RefsView_SolidOps::StartId ******/
		/****** md5 signature: 383dedf482269ee0ab3e1ddde1d14a61 ******/
		%feature("compactdefaultargs") StartId;
		%feature("autodoc", "Return
-------
BRepGraph_SolidRefId

Description
-----------
No available documentation.
") StartId;
		BRepGraph_SolidRefId StartId();

};


%extend BRepGraph_RefsView_SolidOps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class BRepGraph_RefsView_VertexOps *
*************************************/
%nodefaultctor BRepGraph_RefsView_VertexOps;
class BRepGraph_RefsView_VertexOps {
	public:
		/****** BRepGraph_RefsView_VertexOps::EndId ******/
		/****** md5 signature: f527381f9e2c1c59c3ec124462b82d84 ******/
		%feature("compactdefaultargs") EndId;
		%feature("autodoc", "Return
-------
BRepGraph_VertexRefId

Description
-----------
No available documentation.
") EndId;
		BRepGraph_VertexRefId EndId();

		/****** BRepGraph_RefsView_VertexOps::Entry ******/
		/****** md5 signature: 05f3ed3300c33f15f0f32d4f99e0cae0 ******/
		%feature("compactdefaultargs") Entry;
		%feature("autodoc", "
Parameters
----------
theRefId: BRepGraph_VertexRefId

Return
-------
BRepGraphInc::VertexRef

Description
-----------
No available documentation.
") Entry;
		const BRepGraphInc::VertexRef & Entry(const BRepGraph_VertexRefId theRefId);

		/****** BRepGraph_RefsView_VertexOps::Nb ******/
		/****** md5 signature: b01689e975b6c8fb5cb08a63884172d4 ******/
		%feature("compactdefaultargs") Nb;
		%feature("autodoc", "Return
-------
uint32_t

Description
-----------
No available documentation.
") Nb;
		uint32_t Nb();

		/****** BRepGraph_RefsView_VertexOps::NbActive ******/
		/****** md5 signature: 564978715d2dbe06aa9d90fa0b6ff0ef ******/
		%feature("compactdefaultargs") NbActive;
		%feature("autodoc", "Return
-------
uint32_t

Description
-----------
No available documentation.
") NbActive;
		uint32_t NbActive();

		/****** BRepGraph_RefsView_VertexOps::StartId ******/
		/****** md5 signature: 6a02aca119b801da87780ca35b852b93 ******/
		%feature("compactdefaultargs") StartId;
		%feature("autodoc", "Return
-------
BRepGraph_VertexRefId

Description
-----------
No available documentation.
") StartId;
		BRepGraph_VertexRefId StartId();

};


%extend BRepGraph_RefsView_VertexOps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class BRepGraph_RefsView_WireOps *
***********************************/
%nodefaultctor BRepGraph_RefsView_WireOps;
class BRepGraph_RefsView_WireOps {
	public:
		/****** BRepGraph_RefsView_WireOps::EndId ******/
		/****** md5 signature: ab2df49b1637c19b409d655ebe71ad52 ******/
		%feature("compactdefaultargs") EndId;
		%feature("autodoc", "Return
-------
BRepGraph_WireRefId

Description
-----------
No available documentation.
") EndId;
		BRepGraph_WireRefId EndId();

		/****** BRepGraph_RefsView_WireOps::Entry ******/
		/****** md5 signature: 76401b43f39cf9d4b1b24fb14e30412c ******/
		%feature("compactdefaultargs") Entry;
		%feature("autodoc", "
Parameters
----------
theRefId: BRepGraph_WireRefId

Return
-------
BRepGraphInc::WireRef

Description
-----------
No available documentation.
") Entry;
		const BRepGraphInc::WireRef & Entry(const BRepGraph_WireRefId theRefId);

		/****** BRepGraph_RefsView_WireOps::IdsOf ******/
		/****** md5 signature: 021f6de57c7bb948988d30e9e9967f36 ******/
		%feature("compactdefaultargs") IdsOf;
		%feature("autodoc", "
Parameters
----------
theFace: BRepGraph_FaceId

Return
-------
NCollection_LinearVector<BRepGraph_WireRefId>

Description
-----------
No available documentation.
") IdsOf;
		const NCollection_LinearVector<BRepGraph_WireRefId> & IdsOf(const BRepGraph_FaceId theFace);

		/****** BRepGraph_RefsView_WireOps::Nb ******/
		/****** md5 signature: b01689e975b6c8fb5cb08a63884172d4 ******/
		%feature("compactdefaultargs") Nb;
		%feature("autodoc", "Return
-------
uint32_t

Description
-----------
No available documentation.
") Nb;
		uint32_t Nb();

		/****** BRepGraph_RefsView_WireOps::NbActive ******/
		/****** md5 signature: 564978715d2dbe06aa9d90fa0b6ff0ef ******/
		%feature("compactdefaultargs") NbActive;
		%feature("autodoc", "Return
-------
uint32_t

Description
-----------
No available documentation.
") NbActive;
		uint32_t NbActive();

		/****** BRepGraph_RefsView_WireOps::StartId ******/
		/****** md5 signature: 8aa64391427532dcba0ddc9e371c5ee9 ******/
		%feature("compactdefaultargs") StartId;
		%feature("autodoc", "Return
-------
BRepGraph_WireRefId

Description
-----------
No available documentation.
") StartId;
		BRepGraph_WireRefId StartId();

};


%extend BRepGraph_RefsView_WireOps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class BRepGraph_RelatedIterator *
**********************************/
class BRepGraph_RelatedIterator {
	public:
/* public enums */
enum class RelationKind {
	BoundaryEdge = 0,
	AdjacentFace = 1,
	OuterWire = 2,
	ReferencedByFace = 3,
	IncidentVertex = 4,
	WireCoEdge = 5,
	OwningFace = 6,
	IncidentEdge = 7,
	ParentEdge = 8,
	SeamPair = 9,
};

enum class Stage {
	First = 0,
	Second = 1,
	Third = 2,
	Finished = 3,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class RelationKind(IntEnum):
	BoundaryEdge = 0
	AdjacentFace = 1
	OuterWire = 2
	ReferencedByFace = 3
	IncidentVertex = 4
	WireCoEdge = 5
	OwningFace = 6
	IncidentEdge = 7
	ParentEdge = 8
	SeamPair = 9
BoundaryEdge = RelationKind.BoundaryEdge
AdjacentFace = RelationKind.AdjacentFace
OuterWire = RelationKind.OuterWire
ReferencedByFace = RelationKind.ReferencedByFace
IncidentVertex = RelationKind.IncidentVertex
WireCoEdge = RelationKind.WireCoEdge
OwningFace = RelationKind.OwningFace
IncidentEdge = RelationKind.IncidentEdge
ParentEdge = RelationKind.ParentEdge
SeamPair = RelationKind.SeamPair

class Stage(IntEnum):
	First = 0
	Second = 1
	Third = 2
	Finished = 3
First = Stage.First
Second = Stage.Second
Third = Stage.Third
Finished = Stage.Finished
};
/* end python proxy for enums */

		/****** BRepGraph_RelatedIterator::BRepGraph_RelatedIterator ******/
		/****** md5 signature: ad0257b0eeef8929641a6346a52aa410 ******/
		%feature("compactdefaultargs") BRepGraph_RelatedIterator;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theNode: BRepGraph_NodeId

Return
-------
None

Description
-----------
Construct an iterator over all semantically related nodes of the given source node. 
Input parameter: theGraph graph containing the node 
Input parameter: theNode source node whose relations are iterated.
") BRepGraph_RelatedIterator;
		 BRepGraph_RelatedIterator(const BRepGraph & theGraph, const BRepGraph_NodeId theNode);

		/****** BRepGraph_RelatedIterator::Current ******/
		/****** md5 signature: e5d8ae302fe34965a77552ca5d5583be ******/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "Return
-------
BRepGraph_NodeId

Description
-----------
Return the current related node id.
") Current;
		const BRepGraph_NodeId & Current();

		/****** BRepGraph_RelatedIterator::CurrentRelation ******/
		/****** md5 signature: b0eb8dfd31854008081a2b164c3e33c8 ******/
		%feature("compactdefaultargs") CurrentRelation;
		%feature("autodoc", "Return
-------
BRepGraph_RelatedIterator::RelationKind

Description
-----------
Return the relation kind explaining why the current node is related.
") CurrentRelation;
		BRepGraph_RelatedIterator::RelationKind CurrentRelation();

		/****** BRepGraph_RelatedIterator::More ******/
		/****** md5 signature: 0a7b505ff53e438121f2c208f8ae7ce8 ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if another related node is available.
") More;
		bool More();

		/****** BRepGraph_RelatedIterator::Next ******/
		/****** md5 signature: 1201a55f750036045cd397a65f07fc7d ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
Advance to the next related node.
") Next;
		void Next();

		/****** BRepGraph_RelatedIterator::begin ******/
		/****** md5 signature: 86205e2b212ceb5a3987ec7923343268 ******/
		%feature("compactdefaultargs") begin;
		%feature("autodoc", "Return
-------
NCollection_ForwardRangeIterator<BRepGraph_RelatedIterator >

Description
-----------
Returns an STL-compatible iterator for range-based for loops.
") begin;
		NCollection_ForwardRangeIterator<BRepGraph_RelatedIterator > begin();

		/****** BRepGraph_RelatedIterator::end ******/
		/****** md5 signature: 4edef9faa595e2b9527109cc32e6ec32 ******/
		%feature("compactdefaultargs") end;
		%feature("autodoc", "Return
-------
NCollection_ForwardRangeSentinel

Description
-----------
Returns a sentinel marking the end of iteration.
") end;
		NCollection_ForwardRangeSentinel end();

};


%extend BRepGraph_RelatedIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class BRepGraph_RootProductIterator *
**************************************/
class BRepGraph_RootProductIterator {
	public:
		/****** BRepGraph_RootProductIterator::BRepGraph_RootProductIterator ******/
		/****** md5 signature: ef7cdf1341a76d8c356499b9074fcba3 ******/
		%feature("compactdefaultargs") BRepGraph_RootProductIterator;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph

Return
-------
None

Description
-----------
No available documentation.
") BRepGraph_RootProductIterator;
		 BRepGraph_RootProductIterator(const BRepGraph & theGraph);

		/****** BRepGraph_RootProductIterator::Current ******/
		/****** md5 signature: c21cbcaad5a2f6201a271e2611436d0c ******/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "Return
-------
BRepGraph_ProductId

Description
-----------
No available documentation.
") Current;
		const BRepGraph_ProductId & Current();

		/****** BRepGraph_RootProductIterator::More ******/
		/****** md5 signature: 0a7b505ff53e438121f2c208f8ae7ce8 ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") More;
		bool More();

		/****** BRepGraph_RootProductIterator::Next ******/
		/****** md5 signature: 1201a55f750036045cd397a65f07fc7d ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Next;
		void Next();

		/****** BRepGraph_RootProductIterator::begin ******/
		/****** md5 signature: 685c2c4a709633ded51f9fd9b66c5c17 ******/
		%feature("compactdefaultargs") begin;
		%feature("autodoc", "Return
-------
NCollection_ForwardRangeIterator<BRepGraph_RootProductIterator >

Description
-----------
No available documentation.
") begin;
		NCollection_ForwardRangeIterator<BRepGraph_RootProductIterator > begin();

		/****** BRepGraph_RootProductIterator::end ******/
		/****** md5 signature: 4edef9faa595e2b9527109cc32e6ec32 ******/
		%feature("compactdefaultargs") end;
		%feature("autodoc", "Return
-------
NCollection_ForwardRangeSentinel

Description
-----------
No available documentation.
") end;
		NCollection_ForwardRangeSentinel end();

};


%extend BRepGraph_RootProductIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class BRepGraph_ShapesView *
*****************************/
%nodefaultctor BRepGraph_ShapesView;
class BRepGraph_ShapesView {
	public:
/* public enums */
enum class AddStatus {
	Success = 0,
	SuccessWithWarnings = 1,
	Failed = 2,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class AddStatus(IntEnum):
	Success = 0
	SuccessWithWarnings = 1
	Failed = 2
Success = AddStatus.Success
SuccessWithWarnings = AddStatus.SuccessWithWarnings
Failed = AddStatus.Failed
};
/* end python proxy for enums */

		/****** BRepGraph_ShapesView::Add ******/
		/****** md5 signature: 931595bfcc16a9dc876bb0f257c67236 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
BRepGraph_ShapesView_Result

Description
-----------
Ingest a TopoDS_Shape as a new root subgraph, wrapping the topology root in a Product. 
Input parameter: theShape shape to ingest 
Return: Result with TopologyRoot, Product and Occurrence set on success.
") Add;
		BRepGraph_ShapesView_Result Add(const TopoDS_Shape & theShape);

		/****** BRepGraph_ShapesView::Add ******/
		/****** md5 signature: bfa8d54c1527514d13296553efe7ee2e ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theOptions: BRepGraph_ShapesView_Options

Return
-------
BRepGraph_ShapesView_Result

Description
-----------
Ingest a TopoDS_Shape as a new root subgraph with explicit options. 
Input parameter: theShape shape to ingest 
Input parameter: theOptions shape-ingestion options 
Return: Result with TopologyRoot set on success; Product/Occurrence set when theOptions.CreateAutoProduct is true.
") Add;
		BRepGraph_ShapesView_Result Add(const TopoDS_Shape & theShape, BRepGraph_ShapesView_Options theOptions);

		/****** BRepGraph_ShapesView::Add ******/
		/****** md5 signature: 3ee18ae254290536aa1afb50d6f75ba8 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theParent: BRepGraph_NodeId

Return
-------
BRepGraph_ShapesView_Result

Description
-----------
Ingest a TopoDS_Shape under an existing parent. //! Parent kind dispatch: - Product: creates a child part-product, links via Occurrence with shape.Location(). - Compound: appends topology root as a child reference. - Shell: appends a Face as a FaceRef; other shapes via AddChild. - Solid: appends a Shell as a ShellRef; other shapes via AddChild. - CompSolid: appends a Solid as a SolidRef. Other parent kinds (Wire, Edge, Vertex, Occurrence) are not supported and yield an invalid Result (Result::Ok == false) without modification to the graph. 
Input parameter: theShape shape to ingest 
Input parameter: theParent parent node receiving the topology 
Return: Result with TopologyRoot set, plus (Product, Occurrence, InsertedRef) for Product parents or InsertedRef for topology container parents.
") Add;
		BRepGraph_ShapesView_Result Add(const TopoDS_Shape & theShape, const BRepGraph_NodeId theParent);

		/****** BRepGraph_ShapesView::Add ******/
		/****** md5 signature: 1a1d3df2c1eb4fc3a34834c3c3d4ab2a ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theParent: BRepGraph_NodeId
theOptions: BRepGraph_ShapesView_Options

Return
-------
BRepGraph_ShapesView_Result

Description
-----------
Ingest a shape under an existing parent with explicit options. Options::CreateAutoProduct is ignored.
") Add;
		BRepGraph_ShapesView_Result Add(const TopoDS_Shape & theShape, const BRepGraph_NodeId theParent, BRepGraph_ShapesView_Options theOptions);

		/****** BRepGraph_ShapesView::AddWithHistory ******/
		/****** md5 signature: 9c5e6e16d151e8743acefe4522b7b3bb ******/
		%feature("compactdefaultargs") AddWithHistory;
		%feature("autodoc", "
Parameters
----------
theResultShape: TopoDS_Shape
theInputs: NCollection_DataMap<TopoDS_Shape, BRepGraph_NodeId, TopTools_ShapeMapHasher>
theHistory: BRepTools_History
theOpLabel: str

Return
-------
BRepGraph_ShapesView_Result

Description
-----------
Add an OCCT algorithm result and absorb BRepTools_History into the registered BRepGraph_LayerHistory layer using explicit input shape mapping.
") AddWithHistory;
		BRepGraph_ShapesView_Result AddWithHistory(const TopoDS_Shape & theResultShape, const NCollection_DataMap<TopoDS_Shape, BRepGraph_NodeId, TopTools_ShapeMapHasher> & theInputs, const opencascade::handle<BRepTools_History> & theHistory, TCollection_AsciiString theOpLabel);

		/****** BRepGraph_ShapesView::AddWithHistory ******/
		/****** md5 signature: fa22f36d77d37f93c67ddaeb2659ad5c ******/
		%feature("compactdefaultargs") AddWithHistory;
		%feature("autodoc", "
Parameters
----------
theResultShape: TopoDS_Shape
theInputs: NCollection_DataMap<TopoDS_Shape, BRepGraph_NodeId, TopTools_ShapeMapHasher>
theHistory: BRepTools_History
theOpLabel: str
theOptions: BRepGraph_ShapesView_Options

Return
-------
BRepGraph_ShapesView_Result

Description
-----------
Add an OCCT algorithm result and absorb BRepTools_History with explicit options.
") AddWithHistory;
		BRepGraph_ShapesView_Result AddWithHistory(const TopoDS_Shape & theResultShape, const NCollection_DataMap<TopoDS_Shape, BRepGraph_NodeId, TopTools_ShapeMapHasher> & theInputs, const opencascade::handle<BRepTools_History> & theHistory, TCollection_AsciiString theOpLabel, BRepGraph_ShapesView_Options theOptions);

		/****** BRepGraph_ShapesView::AddWithHistory ******/
		/****** md5 signature: 94fd3fd44cc23ac7bd397c5beecc469e ******/
		%feature("compactdefaultargs") AddWithHistory;
		%feature("autodoc", "
Parameters
----------
theResultShape: TopoDS_Shape
theInputRoots: NCollection_Array1<BRepGraph_NodeId>
theHistory: BRepTools_History
theOpLabel: str

Return
-------
BRepGraph_ShapesView_Result

Description
-----------
Convenience overload that collects the history input map from selected roots.
") AddWithHistory;
		BRepGraph_ShapesView_Result AddWithHistory(const TopoDS_Shape & theResultShape, const NCollection_Array1<BRepGraph_NodeId> & theInputRoots, const opencascade::handle<BRepTools_History> & theHistory, TCollection_AsciiString theOpLabel);

		/****** BRepGraph_ShapesView::AddWithHistory ******/
		/****** md5 signature: 7443c4e08c62d6aaf3a95bd353b84dc2 ******/
		%feature("compactdefaultargs") AddWithHistory;
		%feature("autodoc", "
Parameters
----------
theResultShape: TopoDS_Shape
theInputRoots: NCollection_Array1<BRepGraph_NodeId>
theHistory: BRepTools_History
theOpLabel: str
theOptions: BRepGraph_ShapesView_Options

Return
-------
BRepGraph_ShapesView_Result

Description
-----------
Convenience overload that collects the history input map from selected roots and uses explicit options.
") AddWithHistory;
		BRepGraph_ShapesView_Result AddWithHistory(const TopoDS_Shape & theResultShape, const NCollection_Array1<BRepGraph_NodeId> & theInputRoots, const opencascade::handle<BRepTools_History> & theHistory, TCollection_AsciiString theOpLabel, BRepGraph_ShapesView_Options theOptions);

		/****** BRepGraph_ShapesView::ClearCached ******/
		/****** md5 signature: 945f94d84ed380cb67f838f37ab40ab9 ******/
		%feature("compactdefaultargs") ClearCached;
		%feature("autodoc", "
Parameters
----------
theNode: BRepGraph_NodeId

Return
-------
None

Description
-----------
Remove the cached reconstructed shape for one node. Does not change graph generation counters and does not rebuild the shape. Invalid or removed nodes are ignored.
") ClearCached;
		void ClearCached(const BRepGraph_NodeId theNode);

		/****** BRepGraph_ShapesView::ClearCached ******/
		/****** md5 signature: a363bebea40a3d9d9ddbbd3070b5dce6 ******/
		%feature("compactdefaultargs") ClearCached;
		%feature("autodoc", "
Parameters
----------
theRef: BRepGraph_RefId

Return
-------
None

Description
-----------
Remove the cached reconstructed shape for the node referenced by one reference. Does not change graph generation counters and does not rebuild the shape. Invalid or removed references are ignored.
") ClearCached;
		void ClearCached(const BRepGraph_RefId theRef);

		/****** BRepGraph_ShapesView::CollectHistoryInputs ******/
		/****** md5 signature: 786561542d70ba7879d51537f758f898 ******/
		%feature("compactdefaultargs") CollectHistoryInputs;
		%feature("autodoc", "
Parameters
----------
theRoots: NCollection_Array1<BRepGraph_NodeId>
theOutInputs: NCollection_DataMap<TopoDS_Shape, BRepGraph_NodeId, TopTools_ShapeMapHasher>

Return
-------
None

Description
-----------
Collect a TopoDS_Shape -> NodeId map for graph roots and all subshapes resolvable through FindNode(). This is intended for algorithms that reconstruct selected graph roots to TopoDS, run OCCT, and then need to translate BRepTools_History back to graph NodeIds.
") CollectHistoryInputs;
		void CollectHistoryInputs(const NCollection_Array1<BRepGraph_NodeId> & theRoots, NCollection_DataMap<TopoDS_Shape, BRepGraph_NodeId, TopTools_ShapeMapHasher> & theOutInputs);

		/****** BRepGraph_ShapesView::FindNode ******/
		/****** md5 signature: 68440e6d5c6f7958fea72fae7179de13 ******/
		%feature("compactdefaultargs") FindNode;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
BRepGraph_NodeId

Description
-----------
Look up the definition NodeId for a shape from graph construction input. Uses OCCT IsSame() semantics (TShape + Location, orientation ignored). Synthetic Product / Occurrence reconstructions are not given dedicated TShape bindings, so lookup is only guaranteed for construction-time topology. Programmatically created Editor().Add*() nodes can still be located by UID or by direct iteration over Topo() definitions. 
Input parameter: theShape shape to look up 
Return: active node identifier, or invalid NodeId if the shape is absent or removed.
") FindNode;
		BRepGraph_NodeId FindNode(const TopoDS_Shape & theShape);

		/****** BRepGraph_ShapesView::HasNode ******/
		/****** md5 signature: 544da638380a10d2ac0a2cd0361e3da2 ******/
		%feature("compactdefaultargs") HasNode;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
bool

Description
-----------
Check if a shape is known to the graph (was part of construction input). Uses OCCT IsSame() semantics (TShape + Location, orientation ignored). Synthetic Product / Occurrence reconstructions are not given dedicated TShape bindings, so this is only guaranteed for construction-time topology. Programmatically created Editor().Add*() nodes can still be located by UID or by direct iteration over Topo() definitions. 
Input parameter: theShape shape to check 
Return: true if the shape has a corresponding active definition node.
") HasNode;
		bool HasNode(const TopoDS_Shape & theShape);

		/****** BRepGraph_ShapesView::HasOriginal ******/
		/****** md5 signature: 8274e8054d2a046db69ce5a87111ba18 ******/
		%feature("compactdefaultargs") HasOriginal;
		%feature("autodoc", "
Parameters
----------
theNode: BRepGraph_NodeId

Return
-------
bool

Description
-----------
Check if the node has an original shape from graph construction. Editor-created and mutation-derived nodes have no original. 
Input parameter: theNode node identifier 
Return: true if an original shape exists.
") HasOriginal;
		bool HasOriginal(const BRepGraph_NodeId theNode);

		/****** BRepGraph_ShapesView::Original ******/
		/****** md5 signature: a4c19fe6d7690dac27e26f2cd8a60d73 ******/
		%feature("compactdefaultargs") Original;
		%feature("autodoc", "
Parameters
----------
theNode: BRepGraph_NodeId

Return
-------
TopoDS_Shape

Description
-----------
Return the original TopoDS_Shape stored during graph construction. 
Input parameter: theNode node identifier 
Return: original shape for an active node, or null shape when absent/invalid/removed.
") Original;
		TopoDS_Shape Original(const BRepGraph_NodeId theNode);

		/****** BRepGraph_ShapesView::Reconstruct ******/
		/****** md5 signature: bfb83d5335ba34e31eb0539de5917dff ******/
		%feature("compactdefaultargs") Reconstruct;
		%feature("autodoc", "
Parameters
----------
theRoot: BRepGraph_NodeId

Return
-------
TopoDS_Shape

Description
-----------
Reconstruct a TopoDS_Shape from a graph node without using the persistent cache. Use this when the caller explicitly needs a fresh rebuild instead of the shared cached shape returned by Shape(). This method does not populate the persistent reconstructed-shape cache. Topology definition nodes reconstruct topology directly. Product nodes are reconstructed in product-local coordinates. Occurrence nodes are reconstructed with cumulative occurrence placement. 
Input parameter: theRoot definition node identifier 
Return: reconstructed shape, or null shape for invalid/removed nodes.
") Reconstruct;
		TopoDS_Shape Reconstruct(const BRepGraph_NodeId theRoot);

		/****** BRepGraph_ShapesView::RemoveShape ******/
		/****** md5 signature: 15adebe74178b5cc19e11f37286248e3 ******/
		%feature("compactdefaultargs") RemoveShape;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
bool

Description
-----------
Remove the active graph node corresponding to a construction-time shape. This is the convenience equivalent of FindNode(theShape) followed by Editor().Gen().RemoveNode(node). 
Input parameter: theShape shape to remove 
Return: true when an active node was found and removed.
") RemoveShape;
		bool RemoveShape(const TopoDS_Shape & theShape);

		/****** BRepGraph_ShapesView::Shape ******/
		/****** md5 signature: 7b1b7c77d2e03f6de72a98422e0ddeaf ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "
Parameters
----------
theNode: BRepGraph_NodeId

Return
-------
TopoDS_Shape

Description
-----------
Return or reconstruct a TopoDS_Shape for a node. Prefer this route for repeated public queries. Returns a cached shape when available and valid; otherwise reconstructs. Topology definition nodes (Vertex..CompSolid) reconstruct their topology directly, without assembly wrappers. Product nodes are reconstructed in product-local coordinates. Occurrence nodes are reconstructed with cumulative occurrence placement. 
Input parameter: theNode node identifier 
Return: corresponding TopoDS_Shape, or null shape for invalid/removed nodes.
") Shape;
		TopoDS_Shape Shape(const BRepGraph_NodeId theNode);

};


%extend BRepGraph_ShapesView {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class BRepGraph_ShapesView_Options *
*************************************/
class BRepGraph_ShapesView_Options {
	public:
		bool CreateAutoProduct;
		bool Flatten;
		bool Parallel;
		bool TrackAddedNodes;
};


%extend BRepGraph_ShapesView_Options {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class BRepGraph_ShapesView_Result *
************************************/
class BRepGraph_ShapesView_Result {
	public:
		BRepGraph_NodeId TopologyRoot;
		BRepGraph_ProductId Product;
		BRepGraph_OccurrenceId Occurrence;
		BRepGraph_RefId InsertedRef;
		BRepGraph_ShapesView::AddStatus Status;
		/****** BRepGraph_ShapesView_Result::IsOk ******/
		/****** md5 signature: 607b2dd69a5cad72c6cf3313b687c848 ******/
		%feature("compactdefaultargs") IsOk;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if the build succeeded (with or without warnings).
") IsOk;
		bool IsOk();

};


%extend BRepGraph_ShapesView_Result {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class BRepGraph_ShellId *
**************************/
class BRepGraph_ShellId {
	public:
		uint32_t Index;
		/****** BRepGraph_ShellId::BRepGraph_ShellId ******/
		/****** md5 signature: 4311b88151facb04e31a8f94c612d63e ******/
		%feature("compactdefaultargs") BRepGraph_ShellId;
		%feature("autodoc", "Return
-------
None

Description
-----------
Default: invalid (Index = UINT32_MAX).
") BRepGraph_ShellId;
		 BRepGraph_ShellId();

		/****** BRepGraph_ShellId::BRepGraph_ShellId ******/
		/****** md5 signature: 718adffe00b7c66230abfc0915fac1a6 ******/
		%feature("compactdefaultargs") BRepGraph_ShellId;
		%feature("autodoc", "
Parameters
----------
theIdx: uint32_t

Return
-------
None

Description
-----------
Construct from index.
") BRepGraph_ShellId;
		 BRepGraph_ShellId(const uint32_t theIdx);

		/****** BRepGraph_ShellId::BRepGraph_ShellId ******/
		/****** md5 signature: 06f9543631732e963a42611acebb8a88 ******/
		%feature("compactdefaultargs") BRepGraph_ShellId;
		%feature("autodoc", "
Parameters
----------
theId: BRepGraph_NodeId

Return
-------
None

Description
-----------
Construct from an untyped node id of the same kind.
") BRepGraph_ShellId;
		 BRepGraph_ShellId(const BRepGraph_NodeId theId);

		/****** BRepGraph_ShellId::FromNodeId ******/
		/****** md5 signature: 446894b9c1847edab23d1c81f8aa599c ******/
		%feature("compactdefaultargs") FromNodeId;
		%feature("autodoc", "
Parameters
----------
theId: BRepGraph_NodeId

Return
-------
BRepGraph_ShellId

Description
-----------
Explicit conversion from untyped NodeId. Asserts that the Kind matches in debug builds. 
Input parameter: theId untyped NodeId to convert.
") FromNodeId;
		static BRepGraph_ShellId FromNodeId(const BRepGraph_NodeId theId);

		/****** BRepGraph_ShellId::Invalid ******/
		/****** md5 signature: 19622d4f1c44c5c7e384ccc5986fb8d8 ******/
		%feature("compactdefaultargs") Invalid;
		%feature("autodoc", "Return
-------
BRepGraph_ShellId

Description
-----------
Invalid sentinel id.
") Invalid;
		static BRepGraph_ShellId Invalid();

		/****** BRepGraph_ShellId::IsOwned ******/
		/****** md5 signature: 82162d9fddf9bcd26161cc7f9c342a8b ******/
		%feature("compactdefaultargs") IsOwned;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph

Return
-------
bool

Description
-----------
Return true if this node has an active owner in the given graph.
") IsOwned;
		bool IsOwned(const BRepGraph & theGraph);

		/****** BRepGraph_ShellId::IsRemoved ******/
		/****** md5 signature: 75ed1923a75d2c35c92a9683349c6622 ******/
		%feature("compactdefaultargs") IsRemoved;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph

Return
-------
bool

Description
-----------
Return true if this node has been soft-removed in the given graph.
") IsRemoved;
		bool IsRemoved(const BRepGraph & theGraph);

		/****** BRepGraph_ShellId::IsValid ******/
		/****** md5 signature: 735088818cf24ebe0ebc7005a507da69 ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if this id points to an allocated node slot.
") IsValid;
		bool IsValid();

		/****** BRepGraph_ShellId::IsValid ******/
		/****** md5 signature: 294f20297d740c99df23b64d8041b57c ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "
Parameters
----------
theMaxCount: uint32_t

Return
-------
bool

Description
-----------
True if this id points to an allocated slot within [0, theMaxCount). UINT32_MAX (invalid sentinel) always fails this check for any realistic count.
") IsValid;
		bool IsValid(const uint32_t theMaxCount);

		/****** BRepGraph_ShellId::Start ******/
		/****** md5 signature: fc9e9cfb659953f8d767f808052e7c04 ******/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "Return
-------
BRepGraph_ShellId

Description
-----------
First valid id in a dense per-kind sequence.
") Start;
		static BRepGraph_ShellId Start();


%extend{
    bool __ne_wrapper__(BRepGraph_ShellId other) {
        if (*self!=other) return true;
        else return false;
    }
}
%pythoncode {
def __ne__(self, right):
    try:
        return self.__ne_wrapper__(right)
    except:
        return True
}

%extend{
    bool __ne_wrapper__(const BRepGraph_NodeId other) {
        if (*self!=other) return true;
        else return false;
    }
}
%pythoncode {
def __ne__(self, right):
    try:
        return self.__ne_wrapper__(right)
    except:
        return True
}
		/****** BRepGraph_ShellId::operator + ******/
		/****** md5 signature: c69f1fde8a4abf6a73054fa1db2c1fe3 ******/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "
Parameters
----------
theOffset: uint32_t

Return
-------
BRepGraph_ShellId

Description
-----------
Advance by offset.
") operator +;
		BRepGraph_ShellId operator +(const uint32_t theOffset);

		/****** BRepGraph_ShellId::operator - ******/
		/****** md5 signature: 05213caff5555da9f8d7e29a9b6a1930 ******/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "
Parameters
----------
theOffset: uint32_t

Return
-------
BRepGraph_ShellId

Description
-----------
Retreat by offset.
") operator -;
		BRepGraph_ShellId operator -(const uint32_t theOffset);


%extend{
    bool __eq_wrapper__(BRepGraph_ShellId other) {
        if (*self==other) return true;
        else return false;
    }
}
%pythoncode {
def __eq__(self, right):
    try:
        return self.__eq_wrapper__(right)
    except:
        return False
}

%extend{
    bool __eq_wrapper__(const BRepGraph_NodeId other) {
        if (*self==other) return true;
        else return false;
    }
}
%pythoncode {
def __eq__(self, right):
    try:
        return self.__eq_wrapper__(right)
    except:
        return False
}
};


%extend BRepGraph_ShellId {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class BRepGraph_ShellRefId *
*****************************/
class BRepGraph_ShellRefId {
	public:
		uint32_t Index;
		/****** BRepGraph_ShellRefId::BRepGraph_ShellRefId ******/
		/****** md5 signature: 4311b88151facb04e31a8f94c612d63e ******/
		%feature("compactdefaultargs") BRepGraph_ShellRefId;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepGraph_ShellRefId;
		 BRepGraph_ShellRefId();

		/****** BRepGraph_ShellRefId::BRepGraph_ShellRefId ******/
		/****** md5 signature: 718adffe00b7c66230abfc0915fac1a6 ******/
		%feature("compactdefaultargs") BRepGraph_ShellRefId;
		%feature("autodoc", "
Parameters
----------
theIdx: uint32_t

Return
-------
None

Description
-----------
No available documentation.
") BRepGraph_ShellRefId;
		 BRepGraph_ShellRefId(const uint32_t theIdx);

		/****** BRepGraph_ShellRefId::BRepGraph_ShellRefId ******/
		/****** md5 signature: 7e80a924fe12a8fa6b68aba27507a9ea ******/
		%feature("compactdefaultargs") BRepGraph_ShellRefId;
		%feature("autodoc", "
Parameters
----------
theRefId: BRepGraph_RefId

Return
-------
None

Description
-----------
Construct from an untyped reference id of the same kind.
") BRepGraph_ShellRefId;
		 BRepGraph_ShellRefId(const BRepGraph_RefId theRefId);

		/****** BRepGraph_ShellRefId::FromRefId ******/
		/****** md5 signature: 2c83b1a5f2a415c6daf522ac4df93236 ******/
		%feature("compactdefaultargs") FromRefId;
		%feature("autodoc", "
Parameters
----------
theRefId: BRepGraph_RefId

Return
-------
BRepGraph_ShellRefId

Description
-----------
No available documentation.
") FromRefId;
		static BRepGraph_ShellRefId FromRefId(const BRepGraph_RefId theRefId);

		/****** BRepGraph_ShellRefId::Invalid ******/
		/****** md5 signature: 19622d4f1c44c5c7e384ccc5986fb8d8 ******/
		%feature("compactdefaultargs") Invalid;
		%feature("autodoc", "Return
-------
BRepGraph_ShellRefId

Description
-----------
Invalid sentinel id.
") Invalid;
		static BRepGraph_ShellRefId Invalid();

		/****** BRepGraph_ShellRefId::IsOwned ******/
		/****** md5 signature: 82162d9fddf9bcd26161cc7f9c342a8b ******/
		%feature("compactdefaultargs") IsOwned;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph

Return
-------
bool

Description
-----------
Return true if this reference entry has an active owner in the given graph.
") IsOwned;
		bool IsOwned(const BRepGraph & theGraph);

		/****** BRepGraph_ShellRefId::IsRemoved ******/
		/****** md5 signature: 75ed1923a75d2c35c92a9683349c6622 ******/
		%feature("compactdefaultargs") IsRemoved;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph

Return
-------
bool

Description
-----------
Return true if this reference entry has been soft-removed in the given graph.
") IsRemoved;
		bool IsRemoved(const BRepGraph & theGraph);

		/****** BRepGraph_ShellRefId::IsValid ******/
		/****** md5 signature: 735088818cf24ebe0ebc7005a507da69 ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsValid;
		bool IsValid();

		/****** BRepGraph_ShellRefId::IsValid ******/
		/****** md5 signature: 294f20297d740c99df23b64d8041b57c ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "
Parameters
----------
theMaxCount: uint32_t

Return
-------
bool

Description
-----------
True if this id points to an allocated slot within [0, theMaxCount). UINT32_MAX (invalid sentinel) always fails this check for any realistic count.
") IsValid;
		bool IsValid(const uint32_t theMaxCount);

		/****** BRepGraph_ShellRefId::Start ******/
		/****** md5 signature: fc9e9cfb659953f8d767f808052e7c04 ******/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "Return
-------
BRepGraph_ShellRefId

Description
-----------
First valid id in a dense per-kind sequence.
") Start;
		static BRepGraph_ShellRefId Start();


%extend{
    bool __ne_wrapper__(BRepGraph_ShellRefId other) {
        if (*self!=other) return true;
        else return false;
    }
}
%pythoncode {
def __ne__(self, right):
    try:
        return self.__ne_wrapper__(right)
    except:
        return True
}

%extend{
    bool __ne_wrapper__(const BRepGraph_RefId other) {
        if (*self!=other) return true;
        else return false;
    }
}
%pythoncode {
def __ne__(self, right):
    try:
        return self.__ne_wrapper__(right)
    except:
        return True
}
		/****** BRepGraph_ShellRefId::operator + ******/
		/****** md5 signature: c69f1fde8a4abf6a73054fa1db2c1fe3 ******/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "
Parameters
----------
theOffset: uint32_t

Return
-------
BRepGraph_ShellRefId

Description
-----------
Advance by offset.
") operator +;
		BRepGraph_ShellRefId operator +(const uint32_t theOffset);

		/****** BRepGraph_ShellRefId::operator - ******/
		/****** md5 signature: 05213caff5555da9f8d7e29a9b6a1930 ******/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "
Parameters
----------
theOffset: uint32_t

Return
-------
BRepGraph_ShellRefId

Description
-----------
Retreat by offset.
") operator -;
		BRepGraph_ShellRefId operator -(const uint32_t theOffset);


%extend{
    bool __eq_wrapper__(BRepGraph_ShellRefId other) {
        if (*self==other) return true;
        else return false;
    }
}
%pythoncode {
def __eq__(self, right):
    try:
        return self.__eq_wrapper__(right)
    except:
        return False
}

%extend{
    bool __eq_wrapper__(const BRepGraph_RefId other) {
        if (*self==other) return true;
        else return false;
    }
}
%pythoncode {
def __eq__(self, right):
    try:
        return self.__eq_wrapper__(right)
    except:
        return False
}
};


%extend BRepGraph_ShellRefId {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class BRepGraph_SolidId *
**************************/
class BRepGraph_SolidId {
	public:
		uint32_t Index;
		/****** BRepGraph_SolidId::BRepGraph_SolidId ******/
		/****** md5 signature: 4311b88151facb04e31a8f94c612d63e ******/
		%feature("compactdefaultargs") BRepGraph_SolidId;
		%feature("autodoc", "Return
-------
None

Description
-----------
Default: invalid (Index = UINT32_MAX).
") BRepGraph_SolidId;
		 BRepGraph_SolidId();

		/****** BRepGraph_SolidId::BRepGraph_SolidId ******/
		/****** md5 signature: 718adffe00b7c66230abfc0915fac1a6 ******/
		%feature("compactdefaultargs") BRepGraph_SolidId;
		%feature("autodoc", "
Parameters
----------
theIdx: uint32_t

Return
-------
None

Description
-----------
Construct from index.
") BRepGraph_SolidId;
		 BRepGraph_SolidId(const uint32_t theIdx);

		/****** BRepGraph_SolidId::BRepGraph_SolidId ******/
		/****** md5 signature: 06f9543631732e963a42611acebb8a88 ******/
		%feature("compactdefaultargs") BRepGraph_SolidId;
		%feature("autodoc", "
Parameters
----------
theId: BRepGraph_NodeId

Return
-------
None

Description
-----------
Construct from an untyped node id of the same kind.
") BRepGraph_SolidId;
		 BRepGraph_SolidId(const BRepGraph_NodeId theId);

		/****** BRepGraph_SolidId::FromNodeId ******/
		/****** md5 signature: 446894b9c1847edab23d1c81f8aa599c ******/
		%feature("compactdefaultargs") FromNodeId;
		%feature("autodoc", "
Parameters
----------
theId: BRepGraph_NodeId

Return
-------
BRepGraph_SolidId

Description
-----------
Explicit conversion from untyped NodeId. Asserts that the Kind matches in debug builds. 
Input parameter: theId untyped NodeId to convert.
") FromNodeId;
		static BRepGraph_SolidId FromNodeId(const BRepGraph_NodeId theId);

		/****** BRepGraph_SolidId::Invalid ******/
		/****** md5 signature: 19622d4f1c44c5c7e384ccc5986fb8d8 ******/
		%feature("compactdefaultargs") Invalid;
		%feature("autodoc", "Return
-------
BRepGraph_SolidId

Description
-----------
Invalid sentinel id.
") Invalid;
		static BRepGraph_SolidId Invalid();

		/****** BRepGraph_SolidId::IsOwned ******/
		/****** md5 signature: 82162d9fddf9bcd26161cc7f9c342a8b ******/
		%feature("compactdefaultargs") IsOwned;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph

Return
-------
bool

Description
-----------
Return true if this node has an active owner in the given graph.
") IsOwned;
		bool IsOwned(const BRepGraph & theGraph);

		/****** BRepGraph_SolidId::IsRemoved ******/
		/****** md5 signature: 75ed1923a75d2c35c92a9683349c6622 ******/
		%feature("compactdefaultargs") IsRemoved;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph

Return
-------
bool

Description
-----------
Return true if this node has been soft-removed in the given graph.
") IsRemoved;
		bool IsRemoved(const BRepGraph & theGraph);

		/****** BRepGraph_SolidId::IsValid ******/
		/****** md5 signature: 735088818cf24ebe0ebc7005a507da69 ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if this id points to an allocated node slot.
") IsValid;
		bool IsValid();

		/****** BRepGraph_SolidId::IsValid ******/
		/****** md5 signature: 294f20297d740c99df23b64d8041b57c ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "
Parameters
----------
theMaxCount: uint32_t

Return
-------
bool

Description
-----------
True if this id points to an allocated slot within [0, theMaxCount). UINT32_MAX (invalid sentinel) always fails this check for any realistic count.
") IsValid;
		bool IsValid(const uint32_t theMaxCount);

		/****** BRepGraph_SolidId::Start ******/
		/****** md5 signature: fc9e9cfb659953f8d767f808052e7c04 ******/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "Return
-------
BRepGraph_SolidId

Description
-----------
First valid id in a dense per-kind sequence.
") Start;
		static BRepGraph_SolidId Start();


%extend{
    bool __ne_wrapper__(BRepGraph_SolidId other) {
        if (*self!=other) return true;
        else return false;
    }
}
%pythoncode {
def __ne__(self, right):
    try:
        return self.__ne_wrapper__(right)
    except:
        return True
}

%extend{
    bool __ne_wrapper__(const BRepGraph_NodeId other) {
        if (*self!=other) return true;
        else return false;
    }
}
%pythoncode {
def __ne__(self, right):
    try:
        return self.__ne_wrapper__(right)
    except:
        return True
}
		/****** BRepGraph_SolidId::operator + ******/
		/****** md5 signature: c69f1fde8a4abf6a73054fa1db2c1fe3 ******/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "
Parameters
----------
theOffset: uint32_t

Return
-------
BRepGraph_SolidId

Description
-----------
Advance by offset.
") operator +;
		BRepGraph_SolidId operator +(const uint32_t theOffset);

		/****** BRepGraph_SolidId::operator - ******/
		/****** md5 signature: 05213caff5555da9f8d7e29a9b6a1930 ******/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "
Parameters
----------
theOffset: uint32_t

Return
-------
BRepGraph_SolidId

Description
-----------
Retreat by offset.
") operator -;
		BRepGraph_SolidId operator -(const uint32_t theOffset);


%extend{
    bool __eq_wrapper__(BRepGraph_SolidId other) {
        if (*self==other) return true;
        else return false;
    }
}
%pythoncode {
def __eq__(self, right):
    try:
        return self.__eq_wrapper__(right)
    except:
        return False
}

%extend{
    bool __eq_wrapper__(const BRepGraph_NodeId other) {
        if (*self==other) return true;
        else return false;
    }
}
%pythoncode {
def __eq__(self, right):
    try:
        return self.__eq_wrapper__(right)
    except:
        return False
}
};


%extend BRepGraph_SolidId {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class BRepGraph_SolidRefId *
*****************************/
class BRepGraph_SolidRefId {
	public:
		uint32_t Index;
		/****** BRepGraph_SolidRefId::BRepGraph_SolidRefId ******/
		/****** md5 signature: 4311b88151facb04e31a8f94c612d63e ******/
		%feature("compactdefaultargs") BRepGraph_SolidRefId;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepGraph_SolidRefId;
		 BRepGraph_SolidRefId();

		/****** BRepGraph_SolidRefId::BRepGraph_SolidRefId ******/
		/****** md5 signature: 718adffe00b7c66230abfc0915fac1a6 ******/
		%feature("compactdefaultargs") BRepGraph_SolidRefId;
		%feature("autodoc", "
Parameters
----------
theIdx: uint32_t

Return
-------
None

Description
-----------
No available documentation.
") BRepGraph_SolidRefId;
		 BRepGraph_SolidRefId(const uint32_t theIdx);

		/****** BRepGraph_SolidRefId::BRepGraph_SolidRefId ******/
		/****** md5 signature: 7e80a924fe12a8fa6b68aba27507a9ea ******/
		%feature("compactdefaultargs") BRepGraph_SolidRefId;
		%feature("autodoc", "
Parameters
----------
theRefId: BRepGraph_RefId

Return
-------
None

Description
-----------
Construct from an untyped reference id of the same kind.
") BRepGraph_SolidRefId;
		 BRepGraph_SolidRefId(const BRepGraph_RefId theRefId);

		/****** BRepGraph_SolidRefId::FromRefId ******/
		/****** md5 signature: 2c83b1a5f2a415c6daf522ac4df93236 ******/
		%feature("compactdefaultargs") FromRefId;
		%feature("autodoc", "
Parameters
----------
theRefId: BRepGraph_RefId

Return
-------
BRepGraph_SolidRefId

Description
-----------
No available documentation.
") FromRefId;
		static BRepGraph_SolidRefId FromRefId(const BRepGraph_RefId theRefId);

		/****** BRepGraph_SolidRefId::Invalid ******/
		/****** md5 signature: 19622d4f1c44c5c7e384ccc5986fb8d8 ******/
		%feature("compactdefaultargs") Invalid;
		%feature("autodoc", "Return
-------
BRepGraph_SolidRefId

Description
-----------
Invalid sentinel id.
") Invalid;
		static BRepGraph_SolidRefId Invalid();

		/****** BRepGraph_SolidRefId::IsOwned ******/
		/****** md5 signature: 82162d9fddf9bcd26161cc7f9c342a8b ******/
		%feature("compactdefaultargs") IsOwned;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph

Return
-------
bool

Description
-----------
Return true if this reference entry has an active owner in the given graph.
") IsOwned;
		bool IsOwned(const BRepGraph & theGraph);

		/****** BRepGraph_SolidRefId::IsRemoved ******/
		/****** md5 signature: 75ed1923a75d2c35c92a9683349c6622 ******/
		%feature("compactdefaultargs") IsRemoved;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph

Return
-------
bool

Description
-----------
Return true if this reference entry has been soft-removed in the given graph.
") IsRemoved;
		bool IsRemoved(const BRepGraph & theGraph);

		/****** BRepGraph_SolidRefId::IsValid ******/
		/****** md5 signature: 735088818cf24ebe0ebc7005a507da69 ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsValid;
		bool IsValid();

		/****** BRepGraph_SolidRefId::IsValid ******/
		/****** md5 signature: 294f20297d740c99df23b64d8041b57c ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "
Parameters
----------
theMaxCount: uint32_t

Return
-------
bool

Description
-----------
True if this id points to an allocated slot within [0, theMaxCount). UINT32_MAX (invalid sentinel) always fails this check for any realistic count.
") IsValid;
		bool IsValid(const uint32_t theMaxCount);

		/****** BRepGraph_SolidRefId::Start ******/
		/****** md5 signature: fc9e9cfb659953f8d767f808052e7c04 ******/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "Return
-------
BRepGraph_SolidRefId

Description
-----------
First valid id in a dense per-kind sequence.
") Start;
		static BRepGraph_SolidRefId Start();


%extend{
    bool __ne_wrapper__(BRepGraph_SolidRefId other) {
        if (*self!=other) return true;
        else return false;
    }
}
%pythoncode {
def __ne__(self, right):
    try:
        return self.__ne_wrapper__(right)
    except:
        return True
}

%extend{
    bool __ne_wrapper__(const BRepGraph_RefId other) {
        if (*self!=other) return true;
        else return false;
    }
}
%pythoncode {
def __ne__(self, right):
    try:
        return self.__ne_wrapper__(right)
    except:
        return True
}
		/****** BRepGraph_SolidRefId::operator + ******/
		/****** md5 signature: c69f1fde8a4abf6a73054fa1db2c1fe3 ******/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "
Parameters
----------
theOffset: uint32_t

Return
-------
BRepGraph_SolidRefId

Description
-----------
Advance by offset.
") operator +;
		BRepGraph_SolidRefId operator +(const uint32_t theOffset);

		/****** BRepGraph_SolidRefId::operator - ******/
		/****** md5 signature: 05213caff5555da9f8d7e29a9b6a1930 ******/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "
Parameters
----------
theOffset: uint32_t

Return
-------
BRepGraph_SolidRefId

Description
-----------
Retreat by offset.
") operator -;
		BRepGraph_SolidRefId operator -(const uint32_t theOffset);


%extend{
    bool __eq_wrapper__(BRepGraph_SolidRefId other) {
        if (*self==other) return true;
        else return false;
    }
}
%pythoncode {
def __eq__(self, right):
    try:
        return self.__eq_wrapper__(right)
    except:
        return False
}

%extend{
    bool __eq_wrapper__(const BRepGraph_RefId other) {
        if (*self==other) return true;
        else return false;
    }
}
%pythoncode {
def __eq__(self, right):
    try:
        return self.__eq_wrapper__(right)
    except:
        return False
}
};


%extend BRepGraph_SolidRefId {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class BRepGraph_SupplementEditor *
***********************************/
class BRepGraph_SupplementEditor {
	public:
		/****** BRepGraph_SupplementEditor::BRepGraph_SupplementEditor ******/
		/****** md5 signature: 36d702e0d919862add231ad1f4061fef ******/
		%feature("compactdefaultargs") BRepGraph_SupplementEditor;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph

Return
-------
None

Description
-----------
@brief Create an editor facade bound to one graph instance. 
Input parameter: theGraph graph receiving supplement attachments.
") BRepGraph_SupplementEditor;
		 BRepGraph_SupplementEditor(BRepGraph & theGraph);

		/****** BRepGraph_SupplementEditor::Attach ******/
		/****** md5 signature: 6ed2fd1c61c3c1fb780cce8c2f899ff0 ******/
		%feature("compactdefaultargs") Attach;
		%feature("autodoc", "
Parameters
----------
theOwner: BRepGraph_NodeId
theKind: BRepGraph_LayerTopoSupplement::AttachmentKind
theShape: TopoDS_Shape

Return
-------
uint64_t

Description
-----------
@brief Attach one supplemental shape to an arbitrary supported core owner. 
Input parameter: theOwner active owner node 
Input parameter: theKind semantic attachment kind 
Input parameter: theShape supplemental shape to attach 
Return: non-zero attachment uid on success, `0` on rejection.
") Attach;
		uint64_t Attach(BRepGraph_NodeId theOwner, BRepGraph_LayerTopoSupplement::AttachmentKind theKind, const TopoDS_Shape & theShape);

		/****** BRepGraph_SupplementEditor::AttachToCompSolid ******/
		/****** md5 signature: 09a4ab15e5fad4c6383e4ebf1209c24a ******/
		%feature("compactdefaultargs") AttachToCompSolid;
		%feature("autodoc", "
Parameters
----------
theCompSolid: BRepGraph_CompSolidId
theShape: TopoDS_Shape
theKind: BRepGraph_LayerTopoSupplement::AttachmentKind (optional, default to BRepGraph_LayerTopoSupplement::AttachmentKind::CompSolidAuxShape)

Return
-------
uint64_t

Description
-----------
@brief Attach a supplemental shape to a compsolid owner. 
Input parameter: theCompSolid active compsolid owner 
Input parameter: theShape supplemental shape to attach 
Input parameter: theKind semantic attachment kind 
Return: non-zero attachment uid on success, `0` on rejection.
") AttachToCompSolid;
		uint64_t AttachToCompSolid(BRepGraph_CompSolidId theCompSolid, const TopoDS_Shape & theShape, BRepGraph_LayerTopoSupplement::AttachmentKind theKind = BRepGraph_LayerTopoSupplement::AttachmentKind::CompSolidAuxShape);

		/****** BRepGraph_SupplementEditor::AttachToCompound ******/
		/****** md5 signature: c919672445bb7c191faac3872be578fb ******/
		%feature("compactdefaultargs") AttachToCompound;
		%feature("autodoc", "
Parameters
----------
theCompound: BRepGraph_CompoundId
theShape: TopoDS_Shape
theKind: BRepGraph_LayerTopoSupplement::AttachmentKind (optional, default to BRepGraph_LayerTopoSupplement::AttachmentKind::CompoundAuxShape)

Return
-------
uint64_t

Description
-----------
@brief Attach a supplemental shape to a compound owner. 
Input parameter: theCompound active compound owner 
Input parameter: theShape supplemental shape to attach 
Input parameter: theKind semantic attachment kind 
Return: non-zero attachment uid on success, `0` on rejection.
") AttachToCompound;
		uint64_t AttachToCompound(BRepGraph_CompoundId theCompound, const TopoDS_Shape & theShape, BRepGraph_LayerTopoSupplement::AttachmentKind theKind = BRepGraph_LayerTopoSupplement::AttachmentKind::CompoundAuxShape);

		/****** BRepGraph_SupplementEditor::AttachToEdge ******/
		/****** md5 signature: b49edc6f229936dd568638b0c855340d ******/
		%feature("compactdefaultargs") AttachToEdge;
		%feature("autodoc", "
Parameters
----------
theEdge: BRepGraph_EdgeId
theShape: TopoDS_Shape
theKind: BRepGraph_LayerTopoSupplement::AttachmentKind (optional, default to BRepGraph_LayerTopoSupplement::AttachmentKind::EdgeInternalVertex)

Return
-------
uint64_t

Description
-----------
@brief Attach a supplemental shape to an edge owner. 
Input parameter: theEdge active edge owner 
Input parameter: theShape supplemental shape to attach 
Input parameter: theKind semantic attachment kind 
Return: non-zero attachment uid on success, `0` on rejection.
") AttachToEdge;
		uint64_t AttachToEdge(BRepGraph_EdgeId theEdge, const TopoDS_Shape & theShape, BRepGraph_LayerTopoSupplement::AttachmentKind theKind = BRepGraph_LayerTopoSupplement::AttachmentKind::EdgeInternalVertex);

		/****** BRepGraph_SupplementEditor::AttachToFace ******/
		/****** md5 signature: 9e26bf309cdf753b4cc2d488cd242724 ******/
		%feature("compactdefaultargs") AttachToFace;
		%feature("autodoc", "
Parameters
----------
theFace: BRepGraph_FaceId
theShape: TopoDS_Shape
theKind: BRepGraph_LayerTopoSupplement::AttachmentKind (optional, default to BRepGraph_LayerTopoSupplement::AttachmentKind::FaceDirectVertex)

Return
-------
uint64_t

Description
-----------
@brief Attach a supplemental shape to a face owner. 
Input parameter: theFace active face owner 
Input parameter: theShape supplemental shape to attach 
Input parameter: theKind semantic attachment kind 
Return: non-zero attachment uid on success, `0` on rejection.
") AttachToFace;
		uint64_t AttachToFace(BRepGraph_FaceId theFace, const TopoDS_Shape & theShape, BRepGraph_LayerTopoSupplement::AttachmentKind theKind = BRepGraph_LayerTopoSupplement::AttachmentKind::FaceDirectVertex);

		/****** BRepGraph_SupplementEditor::AttachToShell ******/
		/****** md5 signature: 659676af49e4fbf9570cfcfe5e7c59b4 ******/
		%feature("compactdefaultargs") AttachToShell;
		%feature("autodoc", "
Parameters
----------
theShell: BRepGraph_ShellId
theShape: TopoDS_Shape
theKind: BRepGraph_LayerTopoSupplement::AttachmentKind (optional, default to BRepGraph_LayerTopoSupplement::AttachmentKind::ShellAuxShape)

Return
-------
uint64_t

Description
-----------
@brief Attach a supplemental shape to a shell owner. 
Input parameter: theShell active shell owner 
Input parameter: theShape supplemental shape to attach 
Input parameter: theKind semantic attachment kind 
Return: non-zero attachment uid on success, `0` on rejection.
") AttachToShell;
		uint64_t AttachToShell(BRepGraph_ShellId theShell, const TopoDS_Shape & theShape, BRepGraph_LayerTopoSupplement::AttachmentKind theKind = BRepGraph_LayerTopoSupplement::AttachmentKind::ShellAuxShape);

		/****** BRepGraph_SupplementEditor::AttachToSolid ******/
		/****** md5 signature: 4048f9a5c2ec317a6c56484efcf75ad0 ******/
		%feature("compactdefaultargs") AttachToSolid;
		%feature("autodoc", "
Parameters
----------
theSolid: BRepGraph_SolidId
theShape: TopoDS_Shape
theKind: BRepGraph_LayerTopoSupplement::AttachmentKind (optional, default to BRepGraph_LayerTopoSupplement::AttachmentKind::SolidAuxShape)

Return
-------
uint64_t

Description
-----------
@brief Attach a supplemental shape to a solid owner. 
Input parameter: theSolid active solid owner 
Input parameter: theShape supplemental shape to attach 
Input parameter: theKind semantic attachment kind 
Return: non-zero attachment uid on success, `0` on rejection.
") AttachToSolid;
		uint64_t AttachToSolid(BRepGraph_SolidId theSolid, const TopoDS_Shape & theShape, BRepGraph_LayerTopoSupplement::AttachmentKind theKind = BRepGraph_LayerTopoSupplement::AttachmentKind::SolidAuxShape);

		/****** BRepGraph_SupplementEditor::AttachToVertex ******/
		/****** md5 signature: a33f07209e74cc74e1c9dfde147b097f ******/
		%feature("compactdefaultargs") AttachToVertex;
		%feature("autodoc", "
Parameters
----------
theVertex: BRepGraph_VertexId
theShape: TopoDS_Shape
theKind: BRepGraph_LayerTopoSupplement::AttachmentKind (optional, default to BRepGraph_LayerTopoSupplement::AttachmentKind::VertexSupplementShape)

Return
-------
uint64_t

Description
-----------
@brief Attach a supplemental shape to a vertex owner. 
Input parameter: theVertex active vertex owner 
Input parameter: theShape supplemental shape to attach 
Input parameter: theKind semantic attachment kind 
Return: non-zero attachment uid on success, `0` on rejection.
") AttachToVertex;
		uint64_t AttachToVertex(BRepGraph_VertexId theVertex, const TopoDS_Shape & theShape, BRepGraph_LayerTopoSupplement::AttachmentKind theKind = BRepGraph_LayerTopoSupplement::AttachmentKind::VertexSupplementShape);

		/****** BRepGraph_SupplementEditor::RemoveAttachment ******/
		/****** md5 signature: 8a99c7f04826311d993f049c8adbbc4f ******/
		%feature("compactdefaultargs") RemoveAttachment;
		%feature("autodoc", "
Parameters
----------
theUid: uint64_t

Return
-------
bool

Description
-----------
@brief Remove one attachment by uid. 
Input parameter: theUid layer-local attachment uid 
Return: `true` when the attachment existed and was removed.
") RemoveAttachment;
		bool RemoveAttachment(uint64_t theUid);

};


%extend BRepGraph_SupplementEditor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class BRepGraph_SupplementIterator *
*************************************/
class BRepGraph_SupplementIterator {
	public:
		/****** BRepGraph_SupplementIterator::BRepGraph_SupplementIterator ******/
		/****** md5 signature: 8a71de99d2f3d3719c3f72d75988645e ******/
		%feature("compactdefaultargs") BRepGraph_SupplementIterator;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theOwner: BRepGraph_NodeId

Return
-------
None

Description
-----------
@brief Construct an iterator over supplement attachments of one owner. 
Input parameter: theGraph graph providing the supplement layer 
Input parameter: theOwner core owner node whose attachments should be iterated.
") BRepGraph_SupplementIterator;
		 BRepGraph_SupplementIterator(const BRepGraph & theGraph, const BRepGraph_NodeId theOwner);

		/****** BRepGraph_SupplementIterator::More ******/
		/****** md5 signature: 0a7b505ff53e438121f2c208f8ae7ce8 ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
@brief Return true when the iterator currently points to an attachment.
") More;
		bool More();

		/****** BRepGraph_SupplementIterator::Next ******/
		/****** md5 signature: 1201a55f750036045cd397a65f07fc7d ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
@brief Advance to the next attachment.
") Next;
		void Next();

		/****** BRepGraph_SupplementIterator::Uid ******/
		/****** md5 signature: 8bfeb5dc7e0158878a606255bfc3d3b6 ******/
		%feature("compactdefaultargs") Uid;
		%feature("autodoc", "Return
-------
uint64_t

Description
-----------
@brief Return the current layer-local attachment uid.
") Uid;
		uint64_t Uid();

		/****** BRepGraph_SupplementIterator::Value ******/
		/****** md5 signature: 2eb5cf024735df3a564b91432f4029de ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
BRepGraph_LayerTopoSupplement_Entry

Description
-----------
@brief Return the current attachment entry.
") Value;
		const BRepGraph_LayerTopoSupplement_Entry & Value();

		/****** BRepGraph_SupplementIterator::begin ******/
		/****** md5 signature: aabb793dc5d69bcc74fcbfee00a5ddc3 ******/
		%feature("compactdefaultargs") begin;
		%feature("autodoc", "Return
-------
NCollection_ForwardRangeIterator<BRepGraph_SupplementIterator >

Description
-----------
@brief STL range-for support.
") begin;
		NCollection_ForwardRangeIterator<BRepGraph_SupplementIterator > begin();

		/****** BRepGraph_SupplementIterator::end ******/
		/****** md5 signature: 4edef9faa595e2b9527109cc32e6ec32 ******/
		%feature("compactdefaultargs") end;
		%feature("autodoc", "Return
-------
NCollection_ForwardRangeSentinel

Description
-----------
@brief Sentinel marking end of iteration.
") end;
		NCollection_ForwardRangeSentinel end();

};


%extend BRepGraph_SupplementIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class BRepGraph_Tool *
***********************/
%nodefaultctor BRepGraph_Tool;
class BRepGraph_Tool {
	public:
typedef BRepGraphInc ::VertexInstance VertexUsage;
typedef BRepGraphInc ::CoEdgeInstance CoEdgeUsage;
typedef BRepGraphInc ::FaceInstance FaceUsage;
typedef BRepGraphInc ::WireInstance WireUsage;
typedef BRepGraphInc ::ShellInstance ShellUsage;
};


%extend BRepGraph_Tool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class BRepGraph_Tool_CoEdge *
******************************/
class BRepGraph_Tool_CoEdge {
	public:
		/****** BRepGraph_Tool_CoEdge::EdgeOf ******/
		/****** md5 signature: c4b68759a6b96745eafcfd4dd5cb40cc ******/
		%feature("compactdefaultargs") EdgeOf;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theCoEdge: BRepGraph_CoEdgeId

Return
-------
BRepGraph_EdgeId

Description
-----------
Returns the parent edge definition id this coedge uses. 
Input parameter: theGraph source graph 
Input parameter: theCoEdge typed coedge definition identifier 
Return: parent edge id (invalid for removed coedges).
") EdgeOf;
		static BRepGraph_EdgeId EdgeOf(const BRepGraph & theGraph, const BRepGraph_CoEdgeId theCoEdge);

		/****** BRepGraph_Tool_CoEdge::FaceOf ******/
		/****** md5 signature: 176cb035eae34680365ffd196ebffdcf ******/
		%feature("compactdefaultargs") FaceOf;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theCoEdge: BRepGraph_CoEdgeId

Return
-------
BRepGraph_FaceId

Description
-----------
Returns the owning face definition id for this coedge. 
Input parameter: theGraph source graph 
Input parameter: theCoEdge typed coedge definition identifier 
Return: owning face id (invalid for free-wire coedges).
") FaceOf;
		static BRepGraph_FaceId FaceOf(const BRepGraph & theGraph, const BRepGraph_CoEdgeId theCoEdge);

		/****** BRepGraph_Tool_CoEdge::HasPCurve ******/
		/****** md5 signature: 299ff1b3cc02af3c4ebf552979d74dba ******/
		%feature("compactdefaultargs") HasPCurve;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theCoEdge: BRepGraph_CoEdgeId

Return
-------
bool

Description
-----------
Returns true if the coedge has a PCurve representation. 
Input parameter: theGraph source graph 
Input parameter: theCoEdge typed coedge definition identifier 
Return: true if PCurve exists.
") HasPCurve;
		static bool HasPCurve(const BRepGraph & theGraph, const BRepGraph_CoEdgeId theCoEdge);

		/****** BRepGraph_Tool_CoEdge::IsReversed ******/
		/****** md5 signature: 39bdadd40e3270e61eb03375ab82602e ******/
		%feature("compactdefaultargs") IsReversed;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theCoEdge: BRepGraph_CoEdgeId

Return
-------
bool

Description
-----------
Returns true if the coedge is REVERSED relative to its parent edge. Convenience shortcut for `Orientation(...) == TopAbs_REVERSED`.
") IsReversed;
		static bool IsReversed(const BRepGraph & theGraph, const BRepGraph_CoEdgeId theCoEdge);

		/****** BRepGraph_Tool_CoEdge::IsSeam ******/
		/****** md5 signature: cd49ecd063bc4599c1d864e60675f279 ******/
		%feature("compactdefaultargs") IsSeam;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theCoEdge: BRepGraph_CoEdgeId

Return
-------
bool

Description
-----------
Returns true if this coedge is one half of a seam pair.
") IsSeam;
		static bool IsSeam(const BRepGraph & theGraph, const BRepGraph_CoEdgeId theCoEdge);

		/****** BRepGraph_Tool_CoEdge::Orientation ******/
		/****** md5 signature: 9f68cfc65e2b0445b58018864f256c43 ******/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theCoEdge: BRepGraph_CoEdgeId

Return
-------
TopAbs_Orientation

Description
-----------
Returns the coedge orientation relative to its parent edge. 
Input parameter: theGraph source graph 
Input parameter: theCoEdge typed coedge definition identifier 
Return: orientation enum.
") Orientation;
		static TopAbs_Orientation Orientation(const BRepGraph & theGraph, const BRepGraph_CoEdgeId theCoEdge);

		/****** BRepGraph_Tool_CoEdge::PCurve ******/
		/****** md5 signature: 7abb3970c6cf0d8e2488935f9ce2fd64 ******/
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theCoEdge: BRepGraph_CoEdgeId

Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
Returns the raw PCurve handle by coedge identifier (no Location - UV space). 
Input parameter: theGraph source graph 
Input parameter: theCoEdge typed coedge definition identifier 
Return: curve handle, or null handle if no PCurve.
") PCurve;
		static const opencascade::handle<Geom2d_Curve> & PCurve(const BRepGraph & theGraph, const BRepGraph_CoEdgeId theCoEdge);

		/****** BRepGraph_Tool_CoEdge::PCurveAdaptor ******/
		/****** md5 signature: e37119be2fd45c61df8233a91c6ae93f ******/
		%feature("compactdefaultargs") PCurveAdaptor;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theCoEdge: BRepGraph_CoEdgeId

Return
-------
Geom2dAdaptor_Curve

Description
-----------
Returns a PCurve adaptor by coedge identifier. If the coedge has a stored PCurve (Curve2DRepIdx >= 0), returns it directly. Otherwise, for planar face surfaces, computes the PCurve on-the-fly by projecting the edge's 3D curve onto the plane (CurveOnPlane), mirroring the behavior of BRep_Tool::CurveOnSurface for planar faces without stored PCurves. 
Input parameter: theGraph source graph 
Input parameter: theCoEdge typed coedge definition identifier 
Return: 2D curve adaptor, or empty adaptor if no PCurve and surface is not planar.
") PCurveAdaptor;
		static Geom2dAdaptor_Curve PCurveAdaptor(const BRepGraph & theGraph, const BRepGraph_CoEdgeId theCoEdge);

		/****** BRepGraph_Tool_CoEdge::PCurveAdaptor ******/
		/****** md5 signature: 4614e89edd5a22bbc3bda382177eb58e ******/
		%feature("compactdefaultargs") PCurveAdaptor;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theRef: BRepGraph_Tool::CoEdgeUsage

Return
-------
Geom2dAdaptor_Curve

Description
-----------
Returns a PCurve adaptor from a CoEdgeUsage. 
Input parameter: theGraph source graph 
Input parameter: theRef coedge incidence reference 
Return: 2D curve adaptor.
") PCurveAdaptor;
		static Geom2dAdaptor_Curve PCurveAdaptor(const BRepGraph & theGraph, const BRepGraph_Tool::CoEdgeUsage & theRef);

		/****** BRepGraph_Tool_CoEdge::Range ******/
		/****** md5 signature: 97b9062ef7685254dc9ae333996363ec ******/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theCoEdge: BRepGraph_CoEdgeId

Return
-------
std::pair<double, double >

Description
-----------
Returns the PCurve parameter range as (first, last). 
Input parameter: theGraph source graph 
Input parameter: theCoEdge typed coedge definition identifier 
Return: pair of (first, last) parameters.
") Range;
		static std::pair<double, double > Range(const BRepGraph & theGraph, const BRepGraph_CoEdgeId theCoEdge);

		/****** BRepGraph_Tool_CoEdge::SameParameter ******/
		/****** md5 signature: 7c025b8f0a4c72d2314d036bebea4542 ******/
		%feature("compactdefaultargs") SameParameter;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theCoEdge: BRepGraph_CoEdgeId

Return
-------
bool

Description
-----------
Returns true if the coedge's PCurve parameter matches the 3D curve. 
Input parameter: theGraph source graph 
Input parameter: theCoEdge typed coedge definition identifier 
Return: true if same parameter.
") SameParameter;
		static bool SameParameter(const BRepGraph & theGraph, const BRepGraph_CoEdgeId theCoEdge);

		/****** BRepGraph_Tool_CoEdge::SameRange ******/
		/****** md5 signature: 885761ac5d2965f4c4370ffd918fcbe3 ******/
		%feature("compactdefaultargs") SameRange;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theCoEdge: BRepGraph_CoEdgeId

Return
-------
bool

Description
-----------
Returns true if the coedge's PCurve range equals the 3D curve range. 
Input parameter: theGraph source graph 
Input parameter: theCoEdge typed coedge definition identifier 
Return: true if same range.
") SameRange;
		static bool SameRange(const BRepGraph & theGraph, const BRepGraph_CoEdgeId theCoEdge);

		/****** BRepGraph_Tool_CoEdge::SeamPair ******/
		/****** md5 signature: 03e070d4db64ed053cf713e1db910360 ******/
		%feature("compactdefaultargs") SeamPair;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theCoEdge: BRepGraph_CoEdgeId

Return
-------
BRepGraph_CoEdgeId

Description
-----------
Returns the seam-pair coedge for closed/seam edges. 
Input parameter: theGraph source graph 
Input parameter: theCoEdge typed coedge definition identifier 
Return: paired coedge id, or invalid if this coedge is not a seam half.
") SeamPair;
		static BRepGraph_CoEdgeId SeamPair(const BRepGraph & theGraph, const BRepGraph_CoEdgeId theCoEdge);

		/****** BRepGraph_Tool_CoEdge::UVPoints ******/
		/****** md5 signature: b3131549107101567eab84ca7eb8d4de ******/
		%feature("compactdefaultargs") UVPoints;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theCoEdge: BRepGraph_CoEdgeId

Return
-------
std::pair<gp_Pnt2d, gp_Pnt2d >

Description
-----------
Returns the UV endpoints from a CoEdge as (UV1, UV2). 
Input parameter: theGraph source graph 
Input parameter: theCoEdge typed coedge definition identifier 
Return: pair of 2D points at parameter first and last.
") UVPoints;
		static std::pair<gp_Pnt2d, gp_Pnt2d > UVPoints(const BRepGraph & theGraph, const BRepGraph_CoEdgeId theCoEdge);

};


%extend BRepGraph_Tool_CoEdge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class BRepGraph_Tool_Edge *
****************************/
class BRepGraph_Tool_Edge {
	public:
		/****** BRepGraph_Tool_Edge::Curve ******/
		/****** md5 signature: b06dda24d86390e55d3e14d01f8fdf7d ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theEdge: BRepGraph_EdgeId

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Returns the raw 3D curve handle (definition frame, no copy). 
Input parameter: theGraph source graph 
Input parameter: theEdge typed edge definition identifier 
Return: curve handle, or null handle if no curve.
") Curve;
		static const opencascade::handle<Geom_Curve> & Curve(const BRepGraph & theGraph, const BRepGraph_EdgeId theEdge);

		/****** BRepGraph_Tool_Edge::Curve ******/
		/****** md5 signature: 77c3b84db7e96df4ca8b803069203f8d ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theRef: BRepGraph_Tool::CoEdgeUsage

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Returns the transformed 3D curve handle via CoEdgeUsage (applies Location, may copy). 
Input parameter: theGraph source graph 
Input parameter: theRef coedge incidence reference carrying Location 
Return: transformed curve handle.
") Curve;
		static opencascade::handle<Geom_Curve> Curve(const BRepGraph & theGraph, const BRepGraph_Tool::CoEdgeUsage & theRef);

		/****** BRepGraph_Tool_Edge::CurveAdaptor ******/
		/****** md5 signature: a3a1ee2390d27a6f316070250c31f5d8 ******/
		%feature("compactdefaultargs") CurveAdaptor;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theEdge: BRepGraph_EdgeId

Return
-------
GeomAdaptor_TransformedCurve

Description
-----------
Returns the 3D curve adaptor in definition frame (identity Trsf). 
Input parameter: theGraph source graph 
Input parameter: theEdge typed edge definition identifier 
Return: curve adaptor, or empty adaptor if no curve.
") CurveAdaptor;
		static GeomAdaptor_TransformedCurve CurveAdaptor(const BRepGraph & theGraph, const BRepGraph_EdgeId theEdge);

		/****** BRepGraph_Tool_Edge::CurveAdaptor ******/
		/****** md5 signature: 1f94ae43584d4ce9a97659788b373b0a ******/
		%feature("compactdefaultargs") CurveAdaptor;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theRef: BRepGraph_Tool::CoEdgeUsage

Return
-------
GeomAdaptor_TransformedCurve

Description
-----------
Returns the 3D curve adaptor via CoEdgeUsage (applies edge-in-wire Location in Trsf). Falls back to CurveOnSurface when no 3D curve exists. 
Input parameter: theGraph source graph 
Input parameter: theRef coedge incidence reference carrying Location 
Return: curve adaptor with Location applied.
") CurveAdaptor;
		static GeomAdaptor_TransformedCurve CurveAdaptor(const BRepGraph & theGraph, const BRepGraph_Tool::CoEdgeUsage & theRef);

		/****** BRepGraph_Tool_Edge::CurveOnSurface ******/
		/****** md5 signature: 6f55f7b34cac9390c71fade9ca5111d4 ******/
		%feature("compactdefaultargs") CurveOnSurface;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theRef: BRepGraph_Tool::CoEdgeUsage
theFace: BRepGraph_FaceId

Return
-------
opencascade::handle<Adaptor3d_CurveOnSurface>

Description
-----------
Returns a CurveOnSurface adaptor built from a CoEdgeUsage and face. 
Input parameter: theGraph source graph 
Input parameter: theRef coedge incidence reference 
Input parameter: theFace typed face definition identifier 
Return: adaptor handle, or null if PCurve or surface is missing.
") CurveOnSurface;
		static opencascade::handle<Adaptor3d_CurveOnSurface> CurveOnSurface(const BRepGraph & theGraph, const BRepGraph_Tool::CoEdgeUsage & theRef, const BRepGraph_FaceId theFace);

		/****** BRepGraph_Tool_Edge::Degenerated ******/
		/****** md5 signature: d652a5d79c1faf3493e983d6270f396f ******/
		%feature("compactdefaultargs") Degenerated;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theEdge: BRepGraph_EdgeId

Return
-------
bool

Description
-----------
Returns true if the edge is degenerate, derived from current geometry. 
Input parameter: theGraph source graph 
Input parameter: theEdge typed edge definition identifier 
Return: true if degenerate.
") Degenerated;
		static bool Degenerated(const BRepGraph & theGraph, const BRepGraph_EdgeId theEdge);

		/****** BRepGraph_Tool_Edge::EndVertexId ******/
		/****** md5 signature: bb3e867c511dbb526a27cf3f5fa30274 ******/
		%feature("compactdefaultargs") EndVertexId;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theEdge: BRepGraph_EdgeId

Return
-------
BRepGraph_VertexRefId

Description
-----------
Returns the end vertex reference id directly. 
Input parameter: theGraph source graph 
Input parameter: theEdge typed edge definition identifier 
Return: end vertex reference id.
") EndVertexId;
		static BRepGraph_VertexRefId EndVertexId(const BRepGraph & theGraph, const BRepGraph_EdgeId theEdge);

		/****** BRepGraph_Tool_Edge::FindByVertices ******/
		/****** md5 signature: dfadb5f6af7d1fbff66cd9276d224357 ******/
		%feature("compactdefaultargs") FindByVertices;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theStartVertex: BRepGraph_VertexId
theEndVertex: BRepGraph_VertexId
theToIgnoreOrientation: bool (optional, default to false)

Return
-------
BRepGraph_EdgeId

Description
-----------
Find an active edge by its boundary vertices. 
Input parameter: theGraph source graph 
Input parameter: theStartVertex start vertex to match 
Input parameter: theEndVertex end vertex to match 
Input parameter: theToIgnoreOrientation when true, also matches the reverse vertex order 
Return: edge id, or invalid if no active edge matches.
") FindByVertices;
		static BRepGraph_EdgeId FindByVertices(const BRepGraph & theGraph, const BRepGraph_VertexId theStartVertex, const BRepGraph_VertexId theEndVertex, const bool theToIgnoreOrientation = false);

		/****** BRepGraph_Tool_Edge::FindCoEdgeId ******/
		/****** md5 signature: 0a31dd6e47e7b455d4bccbfaf6afba2c ******/
		%feature("compactdefaultargs") FindCoEdgeId;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theEdge: BRepGraph_EdgeId
theFace: BRepGraph_FaceId

Return
-------
BRepGraph_CoEdgeId

Description
-----------
Find an active coedge for the given edge-face use. 
Input parameter: theGraph source graph 
Input parameter: theEdge edge definition to match 
Input parameter: theFace face definition to match 
Return: matching coedge id, or invalid if the edge/face pair has no active coedge.
") FindCoEdgeId;
		static BRepGraph_CoEdgeId FindCoEdgeId(const BRepGraph & theGraph, const BRepGraph_EdgeId theEdge, const BRepGraph_FaceId theFace);

		/****** BRepGraph_Tool_Edge::FindCoEdgeId ******/
		/****** md5 signature: 11ebd72b39776da10fb01efa4ae73f90 ******/
		%feature("compactdefaultargs") FindCoEdgeId;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theEdge: BRepGraph_EdgeId
theFace: BRepGraph_FaceId
theOrientation: TopAbs_Orientation

Return
-------
BRepGraph_CoEdgeId

Description
-----------
Find an active coedge for the given edge-face use and preferred orientation. 
Input parameter: theGraph source graph 
Input parameter: theEdge edge definition to match 
Input parameter: theFace face definition to match 
Input parameter: theOrientation preferred coedge orientation 
Return: exact orientation match when present; otherwise the first active coedge on the edge-face pair; invalid if there is no active coedge for the edge-face pair.
") FindCoEdgeId;
		static BRepGraph_CoEdgeId FindCoEdgeId(const BRepGraph & theGraph, const BRepGraph_EdgeId theEdge, const BRepGraph_FaceId theFace, const TopAbs_Orientation theOrientation);

		/****** BRepGraph_Tool_Edge::FindPCurveCoEdgeId ******/
		/****** md5 signature: 838863b7e6eee1a5a31eeb26858c7b91 ******/
		%feature("compactdefaultargs") FindPCurveCoEdgeId;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theEdge: BRepGraph_EdgeId
theFace: BRepGraph_FaceId

Return
-------
BRepGraph_CoEdgeId

Description
-----------
Find an active coedge carrying PCurve data for the given edge-face use. 
Input parameter: theGraph source graph 
Input parameter: theEdge edge definition to match 
Input parameter: theFace face definition to match 
Return: matching coedge id, or invalid if the edge/face pair has no active PCurve coedge.
") FindPCurveCoEdgeId;
		static BRepGraph_CoEdgeId FindPCurveCoEdgeId(const BRepGraph & theGraph, const BRepGraph_EdgeId theEdge, const BRepGraph_FaceId theFace);

		/****** BRepGraph_Tool_Edge::FindPCurveCoEdgeId ******/
		/****** md5 signature: 7957390396259011b3a9b8edab9fa79e ******/
		%feature("compactdefaultargs") FindPCurveCoEdgeId;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theEdge: BRepGraph_EdgeId
theFace: BRepGraph_FaceId
theOrientation: TopAbs_Orientation

Return
-------
BRepGraph_CoEdgeId

Description
-----------
Find an active PCurve coedge for the given edge-face use and preferred orientation. 
Input parameter: theGraph source graph 
Input parameter: theEdge edge definition to match 
Input parameter: theFace face definition to match 
Input parameter: theOrientation preferred coedge orientation 
Return: exact orientation match when present; otherwise the first active PCurve coedge on the edge-face pair; invalid if there is no active PCurve coedge.
") FindPCurveCoEdgeId;
		static BRepGraph_CoEdgeId FindPCurveCoEdgeId(const BRepGraph & theGraph, const BRepGraph_EdgeId theEdge, const BRepGraph_FaceId theFace, const TopAbs_Orientation theOrientation);

		/****** BRepGraph_Tool_Edge::HasCurve ******/
		/****** md5 signature: c6864435559bd8d45ae5b344f650fce3 ******/
		%feature("compactdefaultargs") HasCurve;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theEdge: BRepGraph_EdgeId

Return
-------
bool

Description
-----------
Returns true if the edge has a 3D curve representation. 
Input parameter: theGraph source graph 
Input parameter: theEdge typed edge definition identifier 
Return: true if edge has a 3D curve.
") HasCurve;
		static bool HasCurve(const BRepGraph & theGraph, const BRepGraph_EdgeId theEdge);

		/****** BRepGraph_Tool_Edge::IsBoundary ******/
		/****** md5 signature: c4bf8b28867590433cd8a7ce7e3a9f01 ******/
		%feature("compactdefaultargs") IsBoundary;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theEdge: BRepGraph_EdgeId

Return
-------
bool

Description
-----------
Returns true if the edge belongs to exactly one face (boundary / free edge). 
Input parameter: theGraph source graph 
Input parameter: theEdge typed edge definition identifier 
Return: true if boundary.
") IsBoundary;
		static bool IsBoundary(const BRepGraph & theGraph, const BRepGraph_EdgeId theEdge);

		/****** BRepGraph_Tool_Edge::IsClosed ******/
		/****** md5 signature: c3366b4251e91a1e3c19e636acf5ec81 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theEdge: BRepGraph_EdgeId

Return
-------
bool

Description
-----------
Returns true if the edge forms a topological loop, derived from vertex topology. 
Input parameter: theGraph source graph 
Input parameter: theEdge typed edge definition identifier 
Return: true if closed.
") IsClosed;
		static bool IsClosed(const BRepGraph & theGraph, const BRepGraph_EdgeId theEdge);

		/****** BRepGraph_Tool_Edge::IsManifold ******/
		/****** md5 signature: 010834b1b7fae6954390fdcb3fd8d954 ******/
		%feature("compactdefaultargs") IsManifold;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theEdge: BRepGraph_EdgeId

Return
-------
bool

Description
-----------
Returns true if the edge is shared by exactly two faces (manifold). 
Input parameter: theGraph source graph 
Input parameter: theEdge typed edge definition identifier 
Return: true if manifold.
") IsManifold;
		static bool IsManifold(const BRepGraph & theGraph, const BRepGraph_EdgeId theEdge);

		/****** BRepGraph_Tool_Edge::IsSeamOnFace ******/
		/****** md5 signature: 67c44c8d74a0688f5867c0e73a74d2f4 ******/
		%feature("compactdefaultargs") IsSeamOnFace;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theEdge: BRepGraph_EdgeId
theFace: BRepGraph_FaceId

Return
-------
bool

Description
-----------
Returns true if the edge is a seam on the given face. 
Input parameter: theGraph source graph 
Input parameter: theEdge typed edge definition identifier 
Input parameter: theFace typed face definition identifier 
Return: true if the edge is a seam on this face.
") IsSeamOnFace;
		static bool IsSeamOnFace(const BRepGraph & theGraph, const BRepGraph_EdgeId theEdge, const BRepGraph_FaceId theFace);

		/****** BRepGraph_Tool_Edge::NbFaces ******/
		/****** md5 signature: 3a2a3c7a63cfbcaa8eeca394aca4380b ******/
		%feature("compactdefaultargs") NbFaces;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theEdge: BRepGraph_EdgeId

Return
-------
uint32_t

Description
-----------
Returns the number of faces that reference this edge via coedges. 
Input parameter: theGraph source graph 
Input parameter: theEdge typed edge definition identifier 
Return: face count.
") NbFaces;
		static uint32_t NbFaces(const BRepGraph & theGraph, const BRepGraph_EdgeId theEdge);

		/****** BRepGraph_Tool_Edge::Range ******/
		/****** md5 signature: be01ef95b909d2525451c2aff28b3897 ******/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theEdge: BRepGraph_EdgeId

Return
-------
std::pair<double, double >

Description
-----------
Returns the 3D curve parameter range as (first, last). 
Input parameter: theGraph source graph 
Input parameter: theEdge typed edge definition identifier 
Return: pair of (first, last) parameters.
") Range;
		static std::pair<double, double > Range(const BRepGraph & theGraph, const BRepGraph_EdgeId theEdge);

		/****** BRepGraph_Tool_Edge::StartVertexId ******/
		/****** md5 signature: 048d76349536049e8738a5ec1bf9398d ******/
		%feature("compactdefaultargs") StartVertexId;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theEdge: BRepGraph_EdgeId

Return
-------
BRepGraph_VertexRefId

Description
-----------
Returns the start vertex reference id directly. 
Input parameter: theGraph source graph 
Input parameter: theEdge typed edge definition identifier 
Return: start vertex reference id.
") StartVertexId;
		static BRepGraph_VertexRefId StartVertexId(const BRepGraph & theGraph, const BRepGraph_EdgeId theEdge);

		/****** BRepGraph_Tool_Edge::Tolerance ******/
		/****** md5 signature: ccfa773da2863ef708f091da42f1ed1c ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theEdge: BRepGraph_EdgeId

Return
-------
double

Description
-----------
Returns the edge tolerance. 
Input parameter: theGraph source graph 
Input parameter: theEdge typed edge definition identifier 
Return: tolerance value.
") Tolerance;
		static double Tolerance(const BRepGraph & theGraph, const BRepGraph_EdgeId theEdge);

};


%extend BRepGraph_Tool_Edge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class BRepGraph_Tool_Face *
****************************/
class BRepGraph_Tool_Face {
	public:
		/****** BRepGraph_Tool_Face::Bounds ******/
		/****** md5 signature: 91c4bc55b19a1906c638fa2a6240b344 ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theFace: BRepGraph_FaceId

Return
-------
theUMin: double
theUMax: double
theVMin: double
theVMax: double

Description
-----------
Returns the UV parameter bounds of the face surface. Fills out-parameters with the surface bounds; all values are set to 0.0 if the face has no surface. 
Input parameter: theGraph source graph 
Input parameter: theFace typed face definition identifier @param[out] theUMin minimum U parameter @param[out] theUMax maximum U parameter @param[out] theVMin minimum V parameter @param[out] theVMax maximum V parameter.
") Bounds;
		static void Bounds(const BRepGraph & theGraph, const BRepGraph_FaceId theFace, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRepGraph_Tool_Face::Bounds ******/
		/****** md5 signature: e718871ebd5cb0a4e1d8e0f054e0604d ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theFaceRef: BRepGraph_FaceRefId

Return
-------
theUMin: double
theUMax: double
theVMin: double
theVMax: double

Description
-----------
Returns the UV parameter bounds by face reference identifier.
") Bounds;
		static void Bounds(const BRepGraph & theGraph, const BRepGraph_FaceRefId theFaceRef, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRepGraph_Tool_Face::HasSurface ******/
		/****** md5 signature: 9d5630b4a014cd446a655c2cc62dbf6e ******/
		%feature("compactdefaultargs") HasSurface;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theFace: BRepGraph_FaceId

Return
-------
bool

Description
-----------
Returns true if the face has a surface representation. 
Input parameter: theGraph source graph 
Input parameter: theFace typed face definition identifier 
Return: true if surface exists.
") HasSurface;
		static bool HasSurface(const BRepGraph & theGraph, const BRepGraph_FaceId theFace);

		/****** BRepGraph_Tool_Face::HasSurface ******/
		/****** md5 signature: 7a1f7fc59a8bd0f3747d1c31b0241c1c ******/
		%feature("compactdefaultargs") HasSurface;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theFaceRef: BRepGraph_FaceRefId

Return
-------
bool

Description
-----------
Returns true if the face reference resolves to a face with a surface.
") HasSurface;
		static bool HasSurface(const BRepGraph & theGraph, const BRepGraph_FaceRefId theFaceRef);

		/****** BRepGraph_Tool_Face::NbWires ******/
		/****** md5 signature: c7e2117a6c5e84e42f93b4f3c442bb93 ******/
		%feature("compactdefaultargs") NbWires;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theFace: BRepGraph_FaceId

Return
-------
uint32_t

Description
-----------
Returns the number of wire references on the face (outer + holes). 
Input parameter: theGraph source graph 
Input parameter: theFace typed face definition identifier 
Return: wire count (includes removed refs).
") NbWires;
		static uint32_t NbWires(const BRepGraph & theGraph, const BRepGraph_FaceId theFace);

		/****** BRepGraph_Tool_Face::NbWires ******/
		/****** md5 signature: 29c1d004744f10c6201107cca5f75e3e ******/
		%feature("compactdefaultargs") NbWires;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theFaceRef: BRepGraph_FaceRefId

Return
-------
uint32_t

Description
-----------
Returns the number of wire references by face reference identifier.
") NbWires;
		static uint32_t NbWires(const BRepGraph & theGraph, const BRepGraph_FaceRefId theFaceRef);

		/****** BRepGraph_Tool_Face::OuterWire ******/
		/****** md5 signature: 2d99b6a781ac44a807334ce47b8539e4 ******/
		%feature("compactdefaultargs") OuterWire;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theFace: BRepGraph_FaceId

Return
-------
BRepGraph_WireId

Description
-----------
Returns the outer wire definition id directly. 
Input parameter: theGraph source graph 
Input parameter: theFace typed face definition identifier 
Return: outer wire id, or invalid if the face has no wire.
") OuterWire;
		static BRepGraph_WireId OuterWire(const BRepGraph & theGraph, const BRepGraph_FaceId theFace);

		/****** BRepGraph_Tool_Face::OuterWire ******/
		/****** md5 signature: e20297336040e448b5de4af84e19bb76 ******/
		%feature("compactdefaultargs") OuterWire;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theFaceRef: BRepGraph_FaceRefId

Return
-------
BRepGraph_WireId

Description
-----------
Returns the outer wire definition id by face reference identifier.
") OuterWire;
		static BRepGraph_WireId OuterWire(const BRepGraph & theGraph, const BRepGraph_FaceRefId theFaceRef);

		/****** BRepGraph_Tool_Face::Surface ******/
		/****** md5 signature: c86794bbcb8e2c23311e8729237f1937 ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theFace: BRepGraph_FaceId

Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
Returns the raw surface handle (definition frame, no copy). 
Input parameter: theGraph source graph 
Input parameter: theFace typed face definition identifier 
Return: surface handle, or null handle if no surface.
") Surface;
		static const opencascade::handle<Geom_Surface> & Surface(const BRepGraph & theGraph, const BRepGraph_FaceId theFace);

		/****** BRepGraph_Tool_Face::Surface ******/
		/****** md5 signature: df20a2f1ee2a9607ae21be45bb4aae74 ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theFaceRef: BRepGraph_FaceRefId

Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
Returns the raw surface handle by face reference identifier.
") Surface;
		static const opencascade::handle<Geom_Surface> & Surface(const BRepGraph & theGraph, const BRepGraph_FaceRefId theFaceRef);

		/****** BRepGraph_Tool_Face::SurfaceAdaptor ******/
		/****** md5 signature: d256ffeb37ade2b76ca504a4075df2cf ******/
		%feature("compactdefaultargs") SurfaceAdaptor;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theFace: BRepGraph_FaceId

Return
-------
GeomAdaptor_TransformedSurface

Description
-----------
Returns a surface adaptor in definition frame. 
Input parameter: theGraph source graph 
Input parameter: theFace typed face definition identifier 
Return: surface adaptor, or empty adaptor if no surface.
") SurfaceAdaptor;
		static GeomAdaptor_TransformedSurface SurfaceAdaptor(const BRepGraph & theGraph, const BRepGraph_FaceId theFace);

		/****** BRepGraph_Tool_Face::SurfaceAdaptor ******/
		/****** md5 signature: 75e9fe4f36875ffc66f6d4a86cb87b93 ******/
		%feature("compactdefaultargs") SurfaceAdaptor;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theRef: BRepGraph_Tool::FaceUsage

Return
-------
GeomAdaptor_TransformedSurface

Description
-----------
Returns a surface adaptor with FaceUsage Location applied.
") SurfaceAdaptor;
		static GeomAdaptor_TransformedSurface SurfaceAdaptor(const BRepGraph & theGraph, const BRepGraph_Tool::FaceUsage & theRef);

		/****** BRepGraph_Tool_Face::SurfaceAdaptor ******/
		/****** md5 signature: dcdb2d5b3d52f307af91bf2f0b9b8001 ******/
		%feature("compactdefaultargs") SurfaceAdaptor;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theFaceRef: BRepGraph_FaceRefId

Return
-------
GeomAdaptor_TransformedSurface

Description
-----------
Returns a surface adaptor by face reference identifier with reference Location applied.
") SurfaceAdaptor;
		static GeomAdaptor_TransformedSurface SurfaceAdaptor(const BRepGraph & theGraph, const BRepGraph_FaceRefId theFaceRef);

		/****** BRepGraph_Tool_Face::SurfaceAdaptor ******/
		/****** md5 signature: 59db9b645a894ee62cabfeaa83fed58e ******/
		%feature("compactdefaultargs") SurfaceAdaptor;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theFace: BRepGraph_FaceId
theUFirst: double
theULast: double
theVFirst: double
theVLast: double

Return
-------
GeomAdaptor_TransformedSurface

Description
-----------
Returns a surface adaptor with explicit UV bounds. 
Input parameter: theGraph source graph 
Input parameter: theFace typed face definition identifier 
Input parameter: theUFirst first U parameter 
Input parameter: theULast last U parameter 
Input parameter: theVFirst first V parameter 
Input parameter: theVLast last V parameter 
Return: surface adaptor with bounds, or empty adaptor if no surface.
") SurfaceAdaptor;
		static GeomAdaptor_TransformedSurface SurfaceAdaptor(const BRepGraph & theGraph, const BRepGraph_FaceId theFace, const double theUFirst, const double theULast, const double theVFirst, const double theVLast);

		/****** BRepGraph_Tool_Face::SurfaceAdaptor ******/
		/****** md5 signature: a1b3f25a26e44ffcd59ea64447549631 ******/
		%feature("compactdefaultargs") SurfaceAdaptor;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theRef: BRepGraph_Tool::FaceUsage
theUFirst: double
theULast: double
theVFirst: double
theVLast: double

Return
-------
GeomAdaptor_TransformedSurface

Description
-----------
Returns a surface adaptor with explicit UV bounds and FaceUsage Location applied.
") SurfaceAdaptor;
		static GeomAdaptor_TransformedSurface SurfaceAdaptor(const BRepGraph & theGraph, const BRepGraph_Tool::FaceUsage & theRef, const double theUFirst, const double theULast, const double theVFirst, const double theVLast);

		/****** BRepGraph_Tool_Face::SurfaceAdaptor ******/
		/****** md5 signature: a0a8fb923af11ae2d6d99a8a885c3fba ******/
		%feature("compactdefaultargs") SurfaceAdaptor;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theFaceRef: BRepGraph_FaceRefId
theUFirst: double
theULast: double
theVFirst: double
theVLast: double

Return
-------
GeomAdaptor_TransformedSurface

Description
-----------
Returns a surface adaptor with explicit UV bounds by face reference identifier.
") SurfaceAdaptor;
		static GeomAdaptor_TransformedSurface SurfaceAdaptor(const BRepGraph & theGraph, const BRepGraph_FaceRefId theFaceRef, const double theUFirst, const double theULast, const double theVFirst, const double theVLast);

		/****** BRepGraph_Tool_Face::Tolerance ******/
		/****** md5 signature: 3369fdf1691e80fd4c14830c2ea16f22 ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theFace: BRepGraph_FaceId

Return
-------
double

Description
-----------
Returns the face tolerance. 
Input parameter: theGraph source graph 
Input parameter: theFace typed face definition identifier 
Return: tolerance value.
") Tolerance;
		static double Tolerance(const BRepGraph & theGraph, const BRepGraph_FaceId theFace);

		/****** BRepGraph_Tool_Face::Tolerance ******/
		/****** md5 signature: 47db410aea42c55837d1b3d636838c17 ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theFaceRef: BRepGraph_FaceRefId

Return
-------
double

Description
-----------
Returns the face tolerance by face reference identifier.
") Tolerance;
		static double Tolerance(const BRepGraph & theGraph, const BRepGraph_FaceRefId theFaceRef);

		/****** BRepGraph_Tool_Face::Usage ******/
		/****** md5 signature: eaeb3df7d5dd58c50bf283dbf1d03b56 ******/
		%feature("compactdefaultargs") Usage;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theFaceRef: BRepGraph_FaceRefId

Return
-------
BRepGraph_Tool::FaceUsage

Description
-----------
Resolves a face reference id to a lightweight usage value. 
Input parameter: theGraph source graph 
Input parameter: theFaceRef typed face reference identifier 
Return: face usage, or invalid usage if the reference is invalid or removed.
") Usage;
		static BRepGraph_Tool::FaceUsage Usage(const BRepGraph & theGraph, const BRepGraph_FaceRefId theFaceRef);

};


%extend BRepGraph_Tool_Face {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class BRepGraph_Tool_Shell *
*****************************/
class BRepGraph_Tool_Shell {
	public:
		/****** BRepGraph_Tool_Shell::IsClosed ******/
		/****** md5 signature: 8382bdb6289accf3bb5c7b44a2e0e830 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theShell: BRepGraph_ShellId

Return
-------
bool

Description
-----------
Returns true if the shell is topologically closed, derived from face-boundary edge incidence. 
Input parameter: theGraph source graph 
Input parameter: theShell typed shell definition identifier 
Return: true if closed.
") IsClosed;
		static bool IsClosed(const BRepGraph & theGraph, const BRepGraph_ShellId theShell);

		/****** BRepGraph_Tool_Shell::IsClosed ******/
		/****** md5 signature: 88099386c805ae419b8cf363dec0ee6e ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theShellRef: BRepGraph_ShellRefId

Return
-------
bool

Description
-----------
Returns true if the referenced shell is topologically closed.
") IsClosed;
		static bool IsClosed(const BRepGraph & theGraph, const BRepGraph_ShellRefId theShellRef);

		/****** BRepGraph_Tool_Shell::NbFaces ******/
		/****** md5 signature: 7db777b458bc738b6a46952f206b3ef7 ******/
		%feature("compactdefaultargs") NbFaces;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theShell: BRepGraph_ShellId

Return
-------
uint32_t

Description
-----------
Returns the number of face references in the shell. 
Input parameter: theGraph source graph 
Input parameter: theShell typed shell definition identifier 
Return: number of face entries (including removed).
") NbFaces;
		static uint32_t NbFaces(const BRepGraph & theGraph, const BRepGraph_ShellId theShell);

		/****** BRepGraph_Tool_Shell::NbFaces ******/
		/****** md5 signature: f6394c3f453eec44ca3db6d864f17d0c ******/
		%feature("compactdefaultargs") NbFaces;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theShellRef: BRepGraph_ShellRefId

Return
-------
uint32_t

Description
-----------
Returns the number of face references in the referenced shell.
") NbFaces;
		static uint32_t NbFaces(const BRepGraph & theGraph, const BRepGraph_ShellRefId theShellRef);

		/****** BRepGraph_Tool_Shell::Usage ******/
		/****** md5 signature: 19d56310a46e90759325c579894fd4d4 ******/
		%feature("compactdefaultargs") Usage;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theShellRef: BRepGraph_ShellRefId

Return
-------
BRepGraph_Tool::ShellUsage

Description
-----------
Resolves a shell reference id to a lightweight usage value. 
Input parameter: theGraph source graph 
Input parameter: theShellRef typed shell reference identifier 
Return: shell usage, or invalid usage if the reference is invalid or removed.
") Usage;
		static BRepGraph_Tool::ShellUsage Usage(const BRepGraph & theGraph, const BRepGraph_ShellRefId theShellRef);

};


%extend BRepGraph_Tool_Shell {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class BRepGraph_Tool_Vertex *
******************************/
class BRepGraph_Tool_Vertex {
	public:
		/****** BRepGraph_Tool_Vertex::NbEdges ******/
		/****** md5 signature: cfa6c9643c56efd79bf94e4f60d2f018 ******/
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theVertex: BRepGraph_VertexId

Return
-------
uint32_t

Description
-----------
Returns the number of edges that reference this vertex. 
Input parameter: theGraph source graph 
Input parameter: theVertex typed vertex definition identifier 
Return: edge count.
") NbEdges;
		static uint32_t NbEdges(const BRepGraph & theGraph, const BRepGraph_VertexId theVertex);

		/****** BRepGraph_Tool_Vertex::Pnt ******/
		/****** md5 signature: 45510febbfe1aa770aaa2613253d2db8 ******/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theRef: BRepGraph_Tool::VertexUsage

Return
-------
gp_Pnt

Description
-----------
Returns the vertex 3D point with VertexUsage Location applied. 
Input parameter: theGraph source graph 
Input parameter: theRef vertex incidence reference carrying Location 
Return: transformed 3D point.
") Pnt;
		static gp_Pnt Pnt(const BRepGraph & theGraph, const BRepGraph_Tool::VertexUsage & theRef);

		/****** BRepGraph_Tool_Vertex::Pnt ******/
		/****** md5 signature: e9ede5ed1033d69fe88f1dc9cbdd9fdf ******/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theVertex: BRepGraph_VertexId

Return
-------
gp_Pnt

Description
-----------
Returns the vertex 3D point in definition frame (no Location applied). 
Input parameter: theGraph source graph 
Input parameter: theVertex typed vertex definition identifier 
Return: 3D point in definition frame.
") Pnt;
		static gp_Pnt Pnt(const BRepGraph & theGraph, const BRepGraph_VertexId theVertex);

		/****** BRepGraph_Tool_Vertex::Pnt ******/
		/****** md5 signature: 0f8346ec8c31a7fcd7a52361065f454f ******/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theVertexRef: BRepGraph_VertexRefId

Return
-------
gp_Pnt

Description
-----------
Returns the vertex 3D point with vertex reference location applied. 
Input parameter: theGraph source graph 
Input parameter: theVertexRef typed vertex reference identifier 
Return: transformed 3D point.
") Pnt;
		static gp_Pnt Pnt(const BRepGraph & theGraph, const BRepGraph_VertexRefId theVertexRef);

		/****** BRepGraph_Tool_Vertex::Tolerance ******/
		/****** md5 signature: 8ca1c0099bcfaa160ab2af89b2a9b206 ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theVertex: BRepGraph_VertexId

Return
-------
double

Description
-----------
Returns the vertex tolerance. 
Input parameter: theGraph source graph 
Input parameter: theVertex typed vertex definition identifier 
Return: tolerance value.
") Tolerance;
		static double Tolerance(const BRepGraph & theGraph, const BRepGraph_VertexId theVertex);

		/****** BRepGraph_Tool_Vertex::Tolerance ******/
		/****** md5 signature: 31eec4ab99ac6cebc9a33f24fff334b6 ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theVertexRef: BRepGraph_VertexRefId

Return
-------
double

Description
-----------
Returns the vertex tolerance by vertex reference identifier. 
Input parameter: theGraph source graph 
Input parameter: theVertexRef typed vertex reference identifier 
Return: tolerance value.
") Tolerance;
		static double Tolerance(const BRepGraph & theGraph, const BRepGraph_VertexRefId theVertexRef);

		/****** BRepGraph_Tool_Vertex::Usage ******/
		/****** md5 signature: ddf01e2915cbbee7a172e943ee027a2b ******/
		%feature("compactdefaultargs") Usage;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theVertexRef: BRepGraph_VertexRefId

Return
-------
BRepGraph_Tool::VertexUsage

Description
-----------
Resolves a vertex reference id to a lightweight usage value. 
Input parameter: theGraph source graph 
Input parameter: theVertexRef typed vertex reference identifier 
Return: vertex usage, or invalid usage if the reference is invalid or removed.
") Usage;
		static BRepGraph_Tool::VertexUsage Usage(const BRepGraph & theGraph, const BRepGraph_VertexRefId theVertexRef);

};


%extend BRepGraph_Tool_Vertex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class BRepGraph_Tool_Wire *
****************************/
class BRepGraph_Tool_Wire {
	public:
		/****** BRepGraph_Tool_Wire::FaceOf ******/
		/****** md5 signature: 6b62e06ddadc423e9cacceba78da7595 ******/
		%feature("compactdefaultargs") FaceOf;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theWire: BRepGraph_WireId

Return
-------
BRepGraph_FaceId

Description
-----------
Returns the first owning face for this wire via relation tables. Returns an invalid id if the wire has no owning face (free wire). 
Input parameter: theGraph source graph 
Input parameter: theWire typed wire definition identifier 
Return: owning face id, or invalid.
") FaceOf;
		static BRepGraph_FaceId FaceOf(const BRepGraph & theGraph, const BRepGraph_WireId theWire);

		/****** BRepGraph_Tool_Wire::FaceOf ******/
		/****** md5 signature: 39ab7d50330d44a037df40ce00ab13bc ******/
		%feature("compactdefaultargs") FaceOf;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theWireRef: BRepGraph_WireRefId

Return
-------
BRepGraph_FaceId

Description
-----------
Returns the first owning face for the referenced wire.
") FaceOf;
		static BRepGraph_FaceId FaceOf(const BRepGraph & theGraph, const BRepGraph_WireRefId theWireRef);

		/****** BRepGraph_Tool_Wire::IsClosed ******/
		/****** md5 signature: cb57cf7946cecc6620e8e492948e99a1 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theWire: BRepGraph_WireId

Return
-------
bool

Description
-----------
Returns true if the wire is topologically closed, derived from ordered coedge chain. 
Input parameter: theGraph source graph 
Input parameter: theWire typed wire definition identifier 
Return: true if closed.
") IsClosed;
		static bool IsClosed(const BRepGraph & theGraph, const BRepGraph_WireId theWire);

		/****** BRepGraph_Tool_Wire::IsClosed ******/
		/****** md5 signature: 387615235faf0bfaf14509168b0a9711 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theWireRef: BRepGraph_WireRefId

Return
-------
bool

Description
-----------
Returns true if the referenced wire is topologically closed.
") IsClosed;
		static bool IsClosed(const BRepGraph & theGraph, const BRepGraph_WireRefId theWireRef);

		/****** BRepGraph_Tool_Wire::IsOuter ******/
		/****** md5 signature: 67fc1576a459f3501e4e2106f8bbac87 ******/
		%feature("compactdefaultargs") IsOuter;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theWire: BRepGraph_WireId

Return
-------
bool

Description
-----------
Returns true if this wire is the first active wire of its owning face. Scans WireRefs that reference this wire. Returns false for free wires (no owning face). 
Input parameter: theGraph source graph 
Input parameter: theWire typed wire definition identifier 
Return: true if outer wire.
") IsOuter;
		static bool IsOuter(const BRepGraph & theGraph, const BRepGraph_WireId theWire);

		/****** BRepGraph_Tool_Wire::IsOuter ******/
		/****** md5 signature: cf5f3a1e802a06765c915bd59771b14c ******/
		%feature("compactdefaultargs") IsOuter;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theWireRef: BRepGraph_WireRefId

Return
-------
bool

Description
-----------
Returns true if the referenced wire is the outer wire of its owning face.
") IsOuter;
		static bool IsOuter(const BRepGraph & theGraph, const BRepGraph_WireRefId theWireRef);

		/****** BRepGraph_Tool_Wire::NbCoEdges ******/
		/****** md5 signature: ad972696de118ee36f07944aa798fedc ******/
		%feature("compactdefaultargs") NbCoEdges;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theWire: BRepGraph_WireId

Return
-------
uint32_t

Description
-----------
Number of CoEdge usages in the wire (raw count: seam halves count twice, matching TopoDS_Iterator(wire) semantics). 
Input parameter: theGraph source graph 
Input parameter: theWire typed wire definition identifier 
Return: number of coedge entries.
") NbCoEdges;
		static uint32_t NbCoEdges(const BRepGraph & theGraph, const BRepGraph_WireId theWire);

		/****** BRepGraph_Tool_Wire::NbCoEdges ******/
		/****** md5 signature: 6174a79532e2d0fe4041447ae0adda26 ******/
		%feature("compactdefaultargs") NbCoEdges;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theWireRef: BRepGraph_WireRefId

Return
-------
uint32_t

Description
-----------
Number of CoEdge usages in the referenced wire.
") NbCoEdges;
		static uint32_t NbCoEdges(const BRepGraph & theGraph, const BRepGraph_WireRefId theWireRef);

		/****** BRepGraph_Tool_Wire::NbDistinctEdges ******/
		/****** md5 signature: 1105499de6a7affc92e51132b8e5c18f ******/
		%feature("compactdefaultargs") NbDistinctEdges;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theWire: BRepGraph_WireId

Return
-------
uint32_t

Description
-----------
Number of distinct underlying edges in the wire (seam halves count once). 
Input parameter: theGraph source graph 
Input parameter: theWire typed wire definition identifier 
Return: number of distinct ChildEdgeIds reachable from the wire's CoEdgeIds.
") NbDistinctEdges;
		static uint32_t NbDistinctEdges(const BRepGraph & theGraph, const BRepGraph_WireId theWire);

		/****** BRepGraph_Tool_Wire::NbDistinctEdges ******/
		/****** md5 signature: fa38dc1bb5544508ec7f9d8dc4808a55 ******/
		%feature("compactdefaultargs") NbDistinctEdges;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theWireRef: BRepGraph_WireRefId

Return
-------
uint32_t

Description
-----------
Number of distinct underlying edges in the referenced wire.
") NbDistinctEdges;
		static uint32_t NbDistinctEdges(const BRepGraph & theGraph, const BRepGraph_WireRefId theWireRef);

		/****** BRepGraph_Tool_Wire::Usage ******/
		/****** md5 signature: 89e20bf37c81f6baa4d33dfbe05f36f8 ******/
		%feature("compactdefaultargs") Usage;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theWireRef: BRepGraph_WireRefId

Return
-------
BRepGraph_Tool::WireUsage

Description
-----------
Resolves a wire reference id to a lightweight usage value. 
Input parameter: theGraph source graph 
Input parameter: theWireRef typed wire reference identifier 
Return: wire usage, or invalid usage if the reference is invalid or removed.
") Usage;
		static BRepGraph_Tool::WireUsage Usage(const BRepGraph & theGraph, const BRepGraph_WireRefId theWireRef);

};


%extend BRepGraph_Tool_Wire {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class BRepGraph_TopoView *
***************************/
%nodefaultctor BRepGraph_TopoView;
class BRepGraph_TopoView {
	public:
		/****** BRepGraph_TopoView::CoEdges ******/
		/****** md5 signature: 615cf507a3ebd1d5e448efcb5cb4662d ******/
		%feature("compactdefaultargs") CoEdges;
		%feature("autodoc", "Return
-------
BRepGraph_TopoView_CoEdgeOps

Description
-----------
Grouped coedge-oriented queries.
") CoEdges;
		const BRepGraph_TopoView_CoEdgeOps & CoEdges();

		/****** BRepGraph_TopoView::CompSolids ******/
		/****** md5 signature: 2f4dc293a1dae3049bcea508dfe592ce ******/
		%feature("compactdefaultargs") CompSolids;
		%feature("autodoc", "Return
-------
BRepGraph_TopoView_CompSolidOps

Description
-----------
Grouped comp-solid oriented queries.
") CompSolids;
		const BRepGraph_TopoView_CompSolidOps & CompSolids();

		/****** BRepGraph_TopoView::Compounds ******/
		/****** md5 signature: 3b0e08a1705b919b116b97ec2afd1ecc ******/
		%feature("compactdefaultargs") Compounds;
		%feature("autodoc", "Return
-------
BRepGraph_TopoView_CompoundOps

Description
-----------
Grouped compound-oriented queries.
") Compounds;
		const BRepGraph_TopoView_CompoundOps & Compounds();

		/****** BRepGraph_TopoView::Edges ******/
		/****** md5 signature: e1651e4a997aa76df732fadd190c604f ******/
		%feature("compactdefaultargs") Edges;
		%feature("autodoc", "Return
-------
BRepGraph_TopoView_EdgeOps

Description
-----------
Grouped edge-oriented queries.
") Edges;
		const BRepGraph_TopoView_EdgeOps & Edges();

		/****** BRepGraph_TopoView::Faces ******/
		/****** md5 signature: b3511b1f1fbc70cbaabdb4e5fb6aba05 ******/
		%feature("compactdefaultargs") Faces;
		%feature("autodoc", "Return
-------
BRepGraph_TopoView_FaceOps

Description
-----------
Grouped face-oriented queries.
") Faces;
		const BRepGraph_TopoView_FaceOps & Faces();

		/****** BRepGraph_TopoView::Gen ******/
		/****** md5 signature: f10768ed4aba6ab5556e0fcc85f11f36 ******/
		%feature("compactdefaultargs") Gen;
		%feature("autodoc", "Return
-------
BRepGraph_TopoView_GenOps

Description
-----------
Grouped generic topology and assembly counts / meta queries.
") Gen;
		const BRepGraph_TopoView_GenOps & Gen();

		/****** BRepGraph_TopoView::Geometry ******/
		/****** md5 signature: 436b63396dd1ee98b9e6384d116d53e0 ******/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "Return
-------
BRepGraph_TopoView_GeometryOps

Description
-----------
Grouped analytic geometry representation queries.
") Geometry;
		const BRepGraph_TopoView_GeometryOps & Geometry();

		/****** BRepGraph_TopoView::Occurrences ******/
		/****** md5 signature: b3400ceb8029d4fa05c13b024cb4b1a3 ******/
		%feature("compactdefaultargs") Occurrences;
		%feature("autodoc", "Return
-------
BRepGraph_TopoView_OccurrenceOps

Description
-----------
Grouped occurrence-oriented queries.
") Occurrences;
		const BRepGraph_TopoView_OccurrenceOps & Occurrences();

		/****** BRepGraph_TopoView::Products ******/
		/****** md5 signature: f8c90e530261cf59498364de60022a01 ******/
		%feature("compactdefaultargs") Products;
		%feature("autodoc", "Return
-------
BRepGraph_TopoView_ProductOps

Description
-----------
Grouped product-oriented queries.
") Products;
		const BRepGraph_TopoView_ProductOps & Products();

		/****** BRepGraph_TopoView::Shells ******/
		/****** md5 signature: 6796a82939d43df0aa022a584750940b ******/
		%feature("compactdefaultargs") Shells;
		%feature("autodoc", "Return
-------
BRepGraph_TopoView_ShellOps

Description
-----------
Grouped shell-oriented queries.
") Shells;
		const BRepGraph_TopoView_ShellOps & Shells();

		/****** BRepGraph_TopoView::Solids ******/
		/****** md5 signature: 0e55fa047f97547a9d76be76ee856325 ******/
		%feature("compactdefaultargs") Solids;
		%feature("autodoc", "Return
-------
BRepGraph_TopoView_SolidOps

Description
-----------
Grouped solid-oriented queries.
") Solids;
		const BRepGraph_TopoView_SolidOps & Solids();

		/****** BRepGraph_TopoView::Vertices ******/
		/****** md5 signature: d564532d5dc1edbbff3f722d756cd59b ******/
		%feature("compactdefaultargs") Vertices;
		%feature("autodoc", "Return
-------
BRepGraph_TopoView_VertexOps

Description
-----------
Grouped vertex-oriented queries.
") Vertices;
		const BRepGraph_TopoView_VertexOps & Vertices();

		/****** BRepGraph_TopoView::Wires ******/
		/****** md5 signature: 5404ab711462d792f17e2cb9b4f36bdb ******/
		%feature("compactdefaultargs") Wires;
		%feature("autodoc", "Return
-------
BRepGraph_TopoView_WireOps

Description
-----------
Grouped wire-oriented queries.
") Wires;
		const BRepGraph_TopoView_WireOps & Wires();

};


%extend BRepGraph_TopoView {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class BRepGraph_TopoView_CoEdgeOps *
*************************************/
%nodefaultctor BRepGraph_TopoView_CoEdgeOps;
class BRepGraph_TopoView_CoEdgeOps {
	public:
		/****** BRepGraph_TopoView_CoEdgeOps::Curve2D ******/
		/****** md5 signature: 3372e654a96ae8091c74ab0a26b0c901 ******/
		%feature("compactdefaultargs") Curve2D;
		%feature("autodoc", "
Parameters
----------
theCoEdge: BRepGraph_CoEdgeId

Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
Return the 2D PCurve handle for the given coedge. May be null if the coedge has no PCurve representation. 
Input parameter: theCoEdge typed coedge identifier.
") Curve2D;
		opencascade::handle<Geom2d_Curve> Curve2D(const BRepGraph_CoEdgeId theCoEdge);

		/****** BRepGraph_TopoView_CoEdgeOps::Definition ******/
		/****** md5 signature: 278526d7008ecb234fd9c3061cc3bedd ******/
		%feature("compactdefaultargs") Definition;
		%feature("autodoc", "
Parameters
----------
theCoEdge: BRepGraph_CoEdgeId

Return
-------
BRepGraphInc::CoEdgeDef

Description
-----------
Return the definition struct for the given coedge. 
Input parameter: theCoEdge typed coedge identifier.
") Definition;
		const BRepGraphInc::CoEdgeDef & Definition(const BRepGraph_CoEdgeId theCoEdge);

		/****** BRepGraph_TopoView_CoEdgeOps::Edge ******/
		/****** md5 signature: 6eb81a9f14a05e989cfa9389279502d2 ******/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "
Parameters
----------
theCoEdge: BRepGraph_CoEdgeId

Return
-------
BRepGraph_EdgeId

Description
-----------
Return the parent edge of the given coedge. 
Input parameter: theCoEdge typed coedge identifier.
") Edge;
		BRepGraph_EdgeId Edge(const BRepGraph_CoEdgeId theCoEdge);

		/****** BRepGraph_TopoView_CoEdgeOps::EndId ******/
		/****** md5 signature: b416970f16e1c5373b5cc61206e6b697 ******/
		%feature("compactdefaultargs") EndId;
		%feature("autodoc", "Return
-------
BRepGraph_CoEdgeId

Description
-----------
Return the past-the-end coedge identifier (one past the last valid id).
") EndId;
		BRepGraph_CoEdgeId EndId();

		/****** BRepGraph_TopoView_CoEdgeOps::Face ******/
		/****** md5 signature: 46929e21a84ee802556e152ff7cc306a ******/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "
Parameters
----------
theCoEdge: BRepGraph_CoEdgeId

Return
-------
BRepGraph_FaceId

Description
-----------
Return the face that owns the given coedge. 
Input parameter: theCoEdge typed coedge identifier.
") Face;
		BRepGraph_FaceId Face(const BRepGraph_CoEdgeId theCoEdge);

		/****** BRepGraph_TopoView_CoEdgeOps::Nb ******/
		/****** md5 signature: b01689e975b6c8fb5cb08a63884172d4 ******/
		%feature("compactdefaultargs") Nb;
		%feature("autodoc", "Return
-------
uint32_t

Description
-----------
Return the total number of coedge definitions (including soft-removed).
") Nb;
		uint32_t Nb();

		/****** BRepGraph_TopoView_CoEdgeOps::NbActive ******/
		/****** md5 signature: 564978715d2dbe06aa9d90fa0b6ff0ef ******/
		%feature("compactdefaultargs") NbActive;
		%feature("autodoc", "Return
-------
uint32_t

Description
-----------
Return the number of active (non-soft-removed) coedge definitions.
") NbActive;
		uint32_t NbActive();

		/****** BRepGraph_TopoView_CoEdgeOps::StartId ******/
		/****** md5 signature: f647b973ed2ca48e0ffbd1bcfd6d69ae ******/
		%feature("compactdefaultargs") StartId;
		%feature("autodoc", "Return
-------
BRepGraph_CoEdgeId

Description
-----------
Return the first valid coedge identifier for iteration.
") StartId;
		BRepGraph_CoEdgeId StartId();

		/****** BRepGraph_TopoView_CoEdgeOps::Wire ******/
		/****** md5 signature: b649a07a681a733516290851570b2172 ******/
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "
Parameters
----------
theCoEdge: BRepGraph_CoEdgeId

Return
-------
BRepGraph_WireId

Description
-----------
Return the wire that owns the given coedge. 
Input parameter: theCoEdge typed coedge identifier.
") Wire;
		BRepGraph_WireId Wire(const BRepGraph_CoEdgeId theCoEdge);

};


%extend BRepGraph_TopoView_CoEdgeOps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class BRepGraph_TopoView_CompSolidOps *
****************************************/
%nodefaultctor BRepGraph_TopoView_CompSolidOps;
class BRepGraph_TopoView_CompSolidOps {
	public:
		/****** BRepGraph_TopoView_CompSolidOps::Definition ******/
		/****** md5 signature: dca5084ebf37fd98ac1946d02a92031a ******/
		%feature("compactdefaultargs") Definition;
		%feature("autodoc", "
Parameters
----------
theCompSolid: BRepGraph_CompSolidId

Return
-------
BRepGraphInc::CompSolidDef

Description
-----------
Return the definition struct for the given comp-solid. 
Input parameter: theCompSolid typed comp-solid identifier.
") Definition;
		const BRepGraphInc::CompSolidDef & Definition(const BRepGraph_CompSolidId theCompSolid);

		/****** BRepGraph_TopoView_CompSolidOps::EndId ******/
		/****** md5 signature: 19ae0e3a20725121fa8dbc137c6aec64 ******/
		%feature("compactdefaultargs") EndId;
		%feature("autodoc", "Return
-------
BRepGraph_CompSolidId

Description
-----------
Return the past-the-end comp-solid identifier (one past the last valid id).
") EndId;
		BRepGraph_CompSolidId EndId();

		/****** BRepGraph_TopoView_CompSolidOps::Nb ******/
		/****** md5 signature: b01689e975b6c8fb5cb08a63884172d4 ******/
		%feature("compactdefaultargs") Nb;
		%feature("autodoc", "Return
-------
uint32_t

Description
-----------
Return the total number of comp-solid definitions (including soft-removed).
") Nb;
		uint32_t Nb();

		/****** BRepGraph_TopoView_CompSolidOps::NbActive ******/
		/****** md5 signature: 564978715d2dbe06aa9d90fa0b6ff0ef ******/
		%feature("compactdefaultargs") NbActive;
		%feature("autodoc", "Return
-------
uint32_t

Description
-----------
Return the number of active (non-soft-removed) comp-solid definitions.
") NbActive;
		uint32_t NbActive();

		/****** BRepGraph_TopoView_CompSolidOps::Relations ******/
		/****** md5 signature: a5256012b68304079add79b4ecac2154 ******/
		%feature("compactdefaultargs") Relations;
		%feature("autodoc", "
Parameters
----------
theCompSolid: BRepGraph_CompSolidId

Return
-------
BRepGraphInc::CompSolidRelations

Description
-----------
Return the relation struct (child solids) for the given comp-solid. 
Input parameter: theCompSolid typed comp-solid identifier.
") Relations;
		const BRepGraphInc::CompSolidRelations & Relations(const BRepGraph_CompSolidId theCompSolid);

		/****** BRepGraph_TopoView_CompSolidOps::StartId ******/
		/****** md5 signature: 81194fd0b03a06887ce89438a5f87191 ******/
		%feature("compactdefaultargs") StartId;
		%feature("autodoc", "Return
-------
BRepGraph_CompSolidId

Description
-----------
Return the first valid comp-solid identifier for iteration.
") StartId;
		BRepGraph_CompSolidId StartId();

};


%extend BRepGraph_TopoView_CompSolidOps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class BRepGraph_TopoView_CompoundOps *
***************************************/
%nodefaultctor BRepGraph_TopoView_CompoundOps;
class BRepGraph_TopoView_CompoundOps {
	public:
		/****** BRepGraph_TopoView_CompoundOps::Definition ******/
		/****** md5 signature: b2407166d7dd209a17ce4efdcbcae05d ******/
		%feature("compactdefaultargs") Definition;
		%feature("autodoc", "
Parameters
----------
theCompound: BRepGraph_CompoundId

Return
-------
BRepGraphInc::CompoundDef

Description
-----------
Return the definition struct for the given compound. 
Input parameter: theCompound typed compound identifier.
") Definition;
		const BRepGraphInc::CompoundDef & Definition(const BRepGraph_CompoundId theCompound);

		/****** BRepGraph_TopoView_CompoundOps::EndId ******/
		/****** md5 signature: 7cab49c98a5c3038e783964623efb5d9 ******/
		%feature("compactdefaultargs") EndId;
		%feature("autodoc", "Return
-------
BRepGraph_CompoundId

Description
-----------
Return the past-the-end compound identifier (one past the last valid id).
") EndId;
		BRepGraph_CompoundId EndId();

		/****** BRepGraph_TopoView_CompoundOps::Nb ******/
		/****** md5 signature: b01689e975b6c8fb5cb08a63884172d4 ******/
		%feature("compactdefaultargs") Nb;
		%feature("autodoc", "Return
-------
uint32_t

Description
-----------
Return the total number of compound definitions (including soft-removed).
") Nb;
		uint32_t Nb();

		/****** BRepGraph_TopoView_CompoundOps::NbActive ******/
		/****** md5 signature: 564978715d2dbe06aa9d90fa0b6ff0ef ******/
		%feature("compactdefaultargs") NbActive;
		%feature("autodoc", "Return
-------
uint32_t

Description
-----------
Return the number of active (non-soft-removed) compound definitions.
") NbActive;
		uint32_t NbActive();

		/****** BRepGraph_TopoView_CompoundOps::Relations ******/
		/****** md5 signature: 79c399bc14ad4dbf76b2a6914c39e5d9 ******/
		%feature("compactdefaultargs") Relations;
		%feature("autodoc", "
Parameters
----------
theCompound: BRepGraph_CompoundId

Return
-------
BRepGraphInc::CompoundRelations

Description
-----------
Return the relation struct (child references) for the given compound. 
Input parameter: theCompound typed compound identifier.
") Relations;
		const BRepGraphInc::CompoundRelations & Relations(const BRepGraph_CompoundId theCompound);

		/****** BRepGraph_TopoView_CompoundOps::StartId ******/
		/****** md5 signature: 519ccb1fa0b47ac7055f9e3dfb175913 ******/
		%feature("compactdefaultargs") StartId;
		%feature("autodoc", "Return
-------
BRepGraph_CompoundId

Description
-----------
Return the first valid compound identifier for iteration.
") StartId;
		BRepGraph_CompoundId StartId();

};


%extend BRepGraph_TopoView_CompoundOps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class BRepGraph_TopoView_EdgeOps *
***********************************/
%nodefaultctor BRepGraph_TopoView_EdgeOps;
class BRepGraph_TopoView_EdgeOps {
	public:
		/****** BRepGraph_TopoView_EdgeOps::CoEdges ******/
		/****** md5 signature: 1093f38d3d30b6daf4f9da8d86a6a08e ******/
		%feature("compactdefaultargs") CoEdges;
		%feature("autodoc", "
Parameters
----------
theEdge: BRepGraph_EdgeId

Return
-------
NCollection_LinearVector<BRepGraph_CoEdgeId>

Description
-----------
Return the coedges that reference the given edge. 
Input parameter: theEdge typed edge identifier.
") CoEdges;
		const NCollection_LinearVector<BRepGraph_CoEdgeId> & CoEdges(const BRepGraph_EdgeId theEdge);

		/****** BRepGraph_TopoView_EdgeOps::Curve3D ******/
		/****** md5 signature: cfc26424ecd4b3d2cfc40b14eea497b2 ******/
		%feature("compactdefaultargs") Curve3D;
		%feature("autodoc", "
Parameters
----------
theEdge: BRepGraph_EdgeId

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Return the 3D curve handle for the given edge. May be null if the edge has no 3D curve representation. 
Input parameter: theEdge typed edge identifier.
") Curve3D;
		opencascade::handle<Geom_Curve> Curve3D(const BRepGraph_EdgeId theEdge);

		/****** BRepGraph_TopoView_EdgeOps::Definition ******/
		/****** md5 signature: ed1770c192506abaa64ba55564e56653 ******/
		%feature("compactdefaultargs") Definition;
		%feature("autodoc", "
Parameters
----------
theEdge: BRepGraph_EdgeId

Return
-------
BRepGraphInc::EdgeDef

Description
-----------
Return the definition struct for the given edge. 
Input parameter: theEdge typed edge identifier.
") Definition;
		const BRepGraphInc::EdgeDef & Definition(const BRepGraph_EdgeId theEdge);

		/****** BRepGraph_TopoView_EdgeOps::EndId ******/
		/****** md5 signature: c4ded3bcd67c1fdcacb64d89e6e84f85 ******/
		%feature("compactdefaultargs") EndId;
		%feature("autodoc", "Return
-------
BRepGraph_EdgeId

Description
-----------
Return the past-the-end edge identifier (one past the last valid id).
") EndId;
		BRepGraph_EdgeId EndId();

		/****** BRepGraph_TopoView_EdgeOps::Nb ******/
		/****** md5 signature: b01689e975b6c8fb5cb08a63884172d4 ******/
		%feature("compactdefaultargs") Nb;
		%feature("autodoc", "Return
-------
uint32_t

Description
-----------
Return the total number of edge definitions (including soft-removed).
") Nb;
		uint32_t Nb();

		/****** BRepGraph_TopoView_EdgeOps::NbActive ******/
		/****** md5 signature: 564978715d2dbe06aa9d90fa0b6ff0ef ******/
		%feature("compactdefaultargs") NbActive;
		%feature("autodoc", "Return
-------
uint32_t

Description
-----------
Return the number of active (non-soft-removed) edge definitions.
") NbActive;
		uint32_t NbActive();

		/****** BRepGraph_TopoView_EdgeOps::NbFaces ******/
		/****** md5 signature: e5a9aa68dee11fb0ea88ea4e1eac5b33 ******/
		%feature("compactdefaultargs") NbFaces;
		%feature("autodoc", "
Parameters
----------
theEdge: BRepGraph_EdgeId

Return
-------
uint32_t

Description
-----------
Return the number of active faces adjacent to the given edge through active coedges. 
Input parameter: theEdge typed edge definition identifier 
Return: active adjacent face count.
") NbFaces;
		uint32_t NbFaces(const BRepGraph_EdgeId theEdge);

		/****** BRepGraph_TopoView_EdgeOps::Relations ******/
		/****** md5 signature: f06f0392886885b3dcc9fe2640e8cb0b ******/
		%feature("compactdefaultargs") Relations;
		%feature("autodoc", "
Parameters
----------
theEdge: BRepGraph_EdgeId

Return
-------
BRepGraphInc::EdgeRelations

Description
-----------
Return the relation struct (adjacency lists) for the given edge. 
Input parameter: theEdge typed edge identifier.
") Relations;
		const BRepGraphInc::EdgeRelations & Relations(const BRepGraph_EdgeId theEdge);

		/****** BRepGraph_TopoView_EdgeOps::StartId ******/
		/****** md5 signature: f5d21711309fe648a8ec9df692fa067c ******/
		%feature("compactdefaultargs") StartId;
		%feature("autodoc", "Return
-------
BRepGraph_EdgeId

Description
-----------
Return the first valid edge identifier for iteration.
") StartId;
		BRepGraph_EdgeId StartId();

};


%extend BRepGraph_TopoView_EdgeOps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class BRepGraph_TopoView_FaceOps *
***********************************/
%nodefaultctor BRepGraph_TopoView_FaceOps;
class BRepGraph_TopoView_FaceOps {
	public:
		/****** BRepGraph_TopoView_FaceOps::ActiveTriangulation ******/
		/****** md5 signature: b946d638ee1f6d5e17493b16806d2f2f ******/
		%feature("compactdefaultargs") ActiveTriangulation;
		%feature("autodoc", "
Parameters
----------
theFace: BRepGraph_FaceId

Return
-------
opencascade::handle<Poly_Triangulation>

Description
-----------
Return the active triangulation for the given face. Returns null if the face has no triangulation or it has been invalidated. 
Input parameter: theFace typed face identifier.
") ActiveTriangulation;
		opencascade::handle<Poly_Triangulation> ActiveTriangulation(const BRepGraph_FaceId theFace);

		/****** BRepGraph_TopoView_FaceOps::Definition ******/
		/****** md5 signature: e0d52850c6ae530c1ef4cf25d50ee0d3 ******/
		%feature("compactdefaultargs") Definition;
		%feature("autodoc", "
Parameters
----------
theFace: BRepGraph_FaceId

Return
-------
BRepGraphInc::FaceDef

Description
-----------
Return the definition struct for the given face. 
Input parameter: theFace typed face identifier.
") Definition;
		const BRepGraphInc::FaceDef & Definition(const BRepGraph_FaceId theFace);

		/****** BRepGraph_TopoView_FaceOps::EndId ******/
		/****** md5 signature: 561db55906af844cbde73cb5908f8710 ******/
		%feature("compactdefaultargs") EndId;
		%feature("autodoc", "Return
-------
BRepGraph_FaceId

Description
-----------
Return the past-the-end face identifier (one past the last valid id).
") EndId;
		BRepGraph_FaceId EndId();

		/****** BRepGraph_TopoView_FaceOps::Nb ******/
		/****** md5 signature: b01689e975b6c8fb5cb08a63884172d4 ******/
		%feature("compactdefaultargs") Nb;
		%feature("autodoc", "Return
-------
uint32_t

Description
-----------
Return the total number of face definitions (including soft-removed).
") Nb;
		uint32_t Nb();

		/****** BRepGraph_TopoView_FaceOps::NbActive ******/
		/****** md5 signature: 564978715d2dbe06aa9d90fa0b6ff0ef ******/
		%feature("compactdefaultargs") NbActive;
		%feature("autodoc", "Return
-------
uint32_t

Description
-----------
Return the number of active (non-soft-removed) face definitions.
") NbActive;
		uint32_t NbActive();

		/****** BRepGraph_TopoView_FaceOps::Relations ******/
		/****** md5 signature: 7d007a16d70ee6a6052e624b7c7c9eff ******/
		%feature("compactdefaultargs") Relations;
		%feature("autodoc", "
Parameters
----------
theFace: BRepGraph_FaceId

Return
-------
BRepGraphInc::FaceRelations

Description
-----------
Return the relation struct (adjacency lists) for the given face. 
Input parameter: theFace typed face identifier.
") Relations;
		const BRepGraphInc::FaceRelations & Relations(const BRepGraph_FaceId theFace);

		/****** BRepGraph_TopoView_FaceOps::StartId ******/
		/****** md5 signature: 60458d519d91adb3555e18b1d2a7693d ******/
		%feature("compactdefaultargs") StartId;
		%feature("autodoc", "Return
-------
BRepGraph_FaceId

Description
-----------
Return the first valid face identifier for iteration.
") StartId;
		BRepGraph_FaceId StartId();

		/****** BRepGraph_TopoView_FaceOps::Surface ******/
		/****** md5 signature: 1142f9cca2a98c0ccb6f09d04409287d ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "
Parameters
----------
theFace: BRepGraph_FaceId

Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
Return the surface handle for the given face. May be null if the face has no surface representation. 
Input parameter: theFace typed face identifier.
") Surface;
		opencascade::handle<Geom_Surface> Surface(const BRepGraph_FaceId theFace);

};


%extend BRepGraph_TopoView_FaceOps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class BRepGraph_TopoView_GenOps *
**********************************/
%nodefaultctor BRepGraph_TopoView_GenOps;
class BRepGraph_TopoView_GenOps {
	public:
		/****** BRepGraph_TopoView_GenOps::CompoundRefIds ******/
		/****** md5 signature: 9322ef40627b81851170ef0876ff637a ******/
		%feature("compactdefaultargs") CompoundRefIds;
		%feature("autodoc", "
Parameters
----------
theChild: BRepGraph_NodeId

Return
-------
NCollection_LinearVector<BRepGraph_ChildRefId>

Description
-----------
Return the compound (child) reference identifiers that point to the given node. 
Input parameter: theChild node identifier.
") CompoundRefIds;
		const NCollection_LinearVector<BRepGraph_ChildRefId> & CompoundRefIds(const BRepGraph_NodeId theChild);

		/****** BRepGraph_TopoView_GenOps::HasCompoundParents ******/
		/****** md5 signature: 6c188a5e15f3a1f8f6bcb92834e61109 ******/
		%feature("compactdefaultargs") HasCompoundParents;
		%feature("autodoc", "
Parameters
----------
theNode: BRepGraph_NodeId

Return
-------
bool

Description
-----------
True if the node has at least one compound parent. 
Input parameter: theNode node identifier.
") HasCompoundParents;
		bool HasCompoundParents(const BRepGraph_NodeId theNode);

		/****** BRepGraph_TopoView_GenOps::HasOccurrenceParents ******/
		/****** md5 signature: f863fe87a930a9813ddef2341b2a5e11 ******/
		%feature("compactdefaultargs") HasOccurrenceParents;
		%feature("autodoc", "
Parameters
----------
theNode: BRepGraph_NodeId

Return
-------
bool

Description
-----------
True if the node has at least one occurrence parent. 
Input parameter: theNode node identifier.
") HasOccurrenceParents;
		bool HasOccurrenceParents(const BRepGraph_NodeId theNode);

		/****** BRepGraph_TopoView_GenOps::IsActive ******/
		/****** md5 signature: 3e26c0d0a908e444958387566e129e38 ******/
		%feature("compactdefaultargs") IsActive;
		%feature("autodoc", "
Parameters
----------
theNode: BRepGraph_NodeId

Return
-------
bool

Description
-----------
Return true if the node id is valid and not soft-removed.
") IsActive;
		bool IsActive(const BRepGraph_NodeId theNode);

		/****** BRepGraph_TopoView_GenOps::IsRemoved ******/
		/****** md5 signature: b6e1a428e0549ee1c67c40bad6ecd40d ******/
		%feature("compactdefaultargs") IsRemoved;
		%feature("autodoc", "
Parameters
----------
theNode: BRepGraph_NodeId

Return
-------
bool

Description
-----------
Return true if the given node is invalid or has been soft-removed. 
Input parameter: theNode node identifier.
") IsRemoved;
		bool IsRemoved(const BRepGraph_NodeId theNode);

		/****** BRepGraph_TopoView_GenOps::IsValid ******/
		/****** md5 signature: 1b5a5e9bd6f86dd7d0d529ec4e3e81b3 ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "
Parameters
----------
theNode: BRepGraph_NodeId

Return
-------
bool

Description
-----------
Return true if the node id kind and index are within storage bounds.
") IsValid;
		bool IsValid(const BRepGraph_NodeId theNode);

		/****** BRepGraph_TopoView_GenOps::Nb ******/
		/****** md5 signature: 41e65e67a7f341f010ff1e274ac510f9 ******/
		%feature("compactdefaultargs") Nb;
		%feature("autodoc", "
Parameters
----------
theKind: BRepGraph_NodeId::Kind

Return
-------
uint32_t

Description
-----------
Return the number of node definitions of the specified kind (including soft-removed).
") Nb;
		uint32_t Nb(const BRepGraph_NodeId::Kind theKind);

		/****** BRepGraph_TopoView_GenOps::NbNodes ******/
		/****** md5 signature: d12c9588998099e757eac971f597dd80 ******/
		%feature("compactdefaultargs") NbNodes;
		%feature("autodoc", "Return
-------
uint32_t

Description
-----------
Return the total number of nodes across all topology kinds (including soft-removed).
") NbNodes;
		uint32_t NbNodes();

		/****** BRepGraph_TopoView_GenOps::OccurrenceRefIds ******/
		/****** md5 signature: 54b6ec1d5a17f5da09035f956ceba5e1 ******/
		%feature("compactdefaultargs") OccurrenceRefIds;
		%feature("autodoc", "
Parameters
----------
theChild: BRepGraph_NodeId

Return
-------
NCollection_LinearVector<BRepGraph_OccurrenceRefId>

Description
-----------
Return the occurrence reference identifiers that point to the given node. 
Input parameter: theChild node identifier.
") OccurrenceRefIds;
		const NCollection_LinearVector<BRepGraph_OccurrenceRefId> & OccurrenceRefIds(const BRepGraph_NodeId theChild);

		/****** BRepGraph_TopoView_GenOps::TopoEntity ******/
		/****** md5 signature: 70cdf7b10c61b317d4ca4b4c6cd632a9 ******/
		%feature("compactdefaultargs") TopoEntity;
		%feature("autodoc", "
Parameters
----------
theId: BRepGraph_NodeId

Return
-------
BRepGraphInc::BaseDef *

Description
-----------
Return the base definition pointer for any topology node (polymorphic). Returns null if the node id is invalid, out of range, or soft-removed. 
Input parameter: theId node identifier (any kind).
") TopoEntity;
		const BRepGraphInc::BaseDef * TopoEntity(const BRepGraph_NodeId theId);

};


%extend BRepGraph_TopoView_GenOps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class BRepGraph_TopoView_GeometryOps *
***************************************/
%nodefaultctor BRepGraph_TopoView_GeometryOps;
class BRepGraph_TopoView_GeometryOps {
	public:
		/****** BRepGraph_TopoView_GeometryOps::NbActiveCoEdgeCurves2D ******/
		/****** md5 signature: 1e7afa3dcc270c2a198418039fda949e ******/
		%feature("compactdefaultargs") NbActiveCoEdgeCurves2D;
		%feature("autodoc", "Return
-------
uint32_t

Description
-----------
Return the number of active (non-soft-removed) coedge 2D PCurve representations.
") NbActiveCoEdgeCurves2D;
		uint32_t NbActiveCoEdgeCurves2D();

		/****** BRepGraph_TopoView_GeometryOps::NbActiveEdgeCurves3D ******/
		/****** md5 signature: 112f58ea5002dd4f6bf24d48349b9b42 ******/
		%feature("compactdefaultargs") NbActiveEdgeCurves3D;
		%feature("autodoc", "Return
-------
uint32_t

Description
-----------
Return the number of active (non-soft-removed) edge 3D curve representations.
") NbActiveEdgeCurves3D;
		uint32_t NbActiveEdgeCurves3D();

		/****** BRepGraph_TopoView_GeometryOps::NbActiveFaceSurfaces ******/
		/****** md5 signature: b83226365373ee7c85fb25f9daaccf44 ******/
		%feature("compactdefaultargs") NbActiveFaceSurfaces;
		%feature("autodoc", "Return
-------
uint32_t

Description
-----------
Return the number of active (non-soft-removed) face surface representations.
") NbActiveFaceSurfaces;
		uint32_t NbActiveFaceSurfaces();

		/****** BRepGraph_TopoView_GeometryOps::NbCoEdgeCurves2D ******/
		/****** md5 signature: f1ab7ed5757b49c11d5f20948ae34d6f ******/
		%feature("compactdefaultargs") NbCoEdgeCurves2D;
		%feature("autodoc", "Return
-------
uint32_t

Description
-----------
Return the total number of coedge 2D PCurve representations (including soft-removed).
") NbCoEdgeCurves2D;
		uint32_t NbCoEdgeCurves2D();

		/****** BRepGraph_TopoView_GeometryOps::NbEdgeCurves3D ******/
		/****** md5 signature: c440eda7f347714871933ef7831d2fe9 ******/
		%feature("compactdefaultargs") NbEdgeCurves3D;
		%feature("autodoc", "Return
-------
uint32_t

Description
-----------
Return the total number of edge 3D curve representations (including soft-removed).
") NbEdgeCurves3D;
		uint32_t NbEdgeCurves3D();

		/****** BRepGraph_TopoView_GeometryOps::NbFaceSurfaces ******/
		/****** md5 signature: a4329a23574bf8aa19dac356d9d27f54 ******/
		%feature("compactdefaultargs") NbFaceSurfaces;
		%feature("autodoc", "Return
-------
uint32_t

Description
-----------
Return the total number of face surface representations (including soft-removed).
") NbFaceSurfaces;
		uint32_t NbFaceSurfaces();

};


%extend BRepGraph_TopoView_GeometryOps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class BRepGraph_TopoView_OccurrenceOps *
*****************************************/
%nodefaultctor BRepGraph_TopoView_OccurrenceOps;
class BRepGraph_TopoView_OccurrenceOps {
	public:
		/****** BRepGraph_TopoView_OccurrenceOps::Definition ******/
		/****** md5 signature: 9c147465f6397c40a9b6cff24659332b ******/
		%feature("compactdefaultargs") Definition;
		%feature("autodoc", "
Parameters
----------
theOccurrence: BRepGraph_OccurrenceId

Return
-------
BRepGraphInc::OccurrenceDef

Description
-----------
Return the definition struct for the given occurrence. 
Input parameter: theOccurrence typed occurrence identifier.
") Definition;
		const BRepGraphInc::OccurrenceDef & Definition(const BRepGraph_OccurrenceId theOccurrence);

		/****** BRepGraph_TopoView_OccurrenceOps::EndId ******/
		/****** md5 signature: e408496dd1fb0aa5383555153b7430a6 ******/
		%feature("compactdefaultargs") EndId;
		%feature("autodoc", "Return
-------
BRepGraph_OccurrenceId

Description
-----------
Return the past-the-end occurrence identifier (one past the last valid id).
") EndId;
		BRepGraph_OccurrenceId EndId();

		/****** BRepGraph_TopoView_OccurrenceOps::Nb ******/
		/****** md5 signature: b01689e975b6c8fb5cb08a63884172d4 ******/
		%feature("compactdefaultargs") Nb;
		%feature("autodoc", "Return
-------
uint32_t

Description
-----------
Return the total number of occurrence definitions (including soft-removed).
") Nb;
		uint32_t Nb();

		/****** BRepGraph_TopoView_OccurrenceOps::NbActive ******/
		/****** md5 signature: 564978715d2dbe06aa9d90fa0b6ff0ef ******/
		%feature("compactdefaultargs") NbActive;
		%feature("autodoc", "Return
-------
uint32_t

Description
-----------
Return the number of active (non-soft-removed) occurrence definitions.
") NbActive;
		uint32_t NbActive();

		/****** BRepGraph_TopoView_OccurrenceOps::OccurrenceLocation ******/
		/****** md5 signature: 29e3daf8b10e343fcdff338b29ebb957 ******/
		%feature("compactdefaultargs") OccurrenceLocation;
		%feature("autodoc", "
Parameters
----------
theOccurrence: BRepGraph_OccurrenceId

Return
-------
TopLoc_Location

Description
-----------
Return the local placement of an occurrence (OccurrenceRef::LocalLocation). This is the placement relative to the parent product, not the global placement. For global placement, use ChildExplorer with cumulative location tracking. 
Input parameter: theOccurrence typed occurrence identifier 
Return: OccurrenceRef::LocalLocation, or identity if not found.
") OccurrenceLocation;
		TopLoc_Location OccurrenceLocation(const BRepGraph_OccurrenceId theOccurrence);

		/****** BRepGraph_TopoView_OccurrenceOps::ParentProduct ******/
		/****** md5 signature: eecdbaf90e9541874bc2e539b90c4d38 ******/
		%feature("compactdefaultargs") ParentProduct;
		%feature("autodoc", "
Parameters
----------
theOccurrence: BRepGraph_OccurrenceId

Return
-------
BRepGraph_ProductId

Description
-----------
Return the parent product that owns this occurrence. 
Input parameter: theOccurrence typed occurrence identifier.
") ParentProduct;
		BRepGraph_ProductId ParentProduct(const BRepGraph_OccurrenceId theOccurrence);

		/****** BRepGraph_TopoView_OccurrenceOps::Product ******/
		/****** md5 signature: d58233073c0b0aac2533761cbc862922 ******/
		%feature("compactdefaultargs") Product;
		%feature("autodoc", "
Parameters
----------
theOccurrence: BRepGraph_OccurrenceId

Return
-------
BRepGraph_ProductId

Description
-----------
Return the product that this occurrence instantiates. 
Input parameter: theOccurrence typed occurrence identifier.
") Product;
		BRepGraph_ProductId Product(const BRepGraph_OccurrenceId theOccurrence);

		/****** BRepGraph_TopoView_OccurrenceOps::Relations ******/
		/****** md5 signature: 59a4a11b2f96106920884440a88e48a1 ******/
		%feature("compactdefaultargs") Relations;
		%feature("autodoc", "
Parameters
----------
theOccurrence: BRepGraph_OccurrenceId

Return
-------
BRepGraphInc::OccurrenceRelations

Description
-----------
Return the relation struct (parent, placement) for the given occurrence. 
Input parameter: theOccurrence typed occurrence identifier.
") Relations;
		const BRepGraphInc::OccurrenceRelations & Relations(const BRepGraph_OccurrenceId theOccurrence);

		/****** BRepGraph_TopoView_OccurrenceOps::StartId ******/
		/****** md5 signature: 362438189c701c8a0a39203882360499 ******/
		%feature("compactdefaultargs") StartId;
		%feature("autodoc", "Return
-------
BRepGraph_OccurrenceId

Description
-----------
Return the first valid occurrence identifier for iteration.
") StartId;
		BRepGraph_OccurrenceId StartId();

};


%extend BRepGraph_TopoView_OccurrenceOps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class BRepGraph_TopoView_ProductOps *
**************************************/
%nodefaultctor BRepGraph_TopoView_ProductOps;
class BRepGraph_TopoView_ProductOps {
	public:
		/****** BRepGraph_TopoView_ProductOps::Component ******/
		/****** md5 signature: 97ab5be243dee6b0bb5b5e1d5ad41b1b ******/
		%feature("compactdefaultargs") Component;
		%feature("autodoc", "
Parameters
----------
theProduct: BRepGraph_ProductId
theComponentIdx: int

Return
-------
BRepGraph_OccurrenceId

Description
-----------
Return the i-th active child occurrence identifier of a product. 
Input parameter: theProduct typed product definition identifier 
Input parameter: theComponentIdx zero-based active occurrence index within the product.
") Component;
		BRepGraph_OccurrenceId Component(const BRepGraph_ProductId theProduct, const int theComponentIdx);

		/****** BRepGraph_TopoView_ProductOps::Definition ******/
		/****** md5 signature: d00a902169b3cc6f30d51d3d8fc1eb4e ******/
		%feature("compactdefaultargs") Definition;
		%feature("autodoc", "
Parameters
----------
theProduct: BRepGraph_ProductId

Return
-------
BRepGraphInc::ProductDef

Description
-----------
Return the definition struct for the given product. 
Input parameter: theProduct typed product definition identifier.
") Definition;
		const BRepGraphInc::ProductDef & Definition(const BRepGraph_ProductId theProduct);

		/****** BRepGraph_TopoView_ProductOps::EndId ******/
		/****** md5 signature: 23c5ea7f16a7d766044bb9c188efc80f ******/
		%feature("compactdefaultargs") EndId;
		%feature("autodoc", "Return
-------
BRepGraph_ProductId

Description
-----------
Return the past-the-end product identifier (one past the last valid id).
") EndId;
		BRepGraph_ProductId EndId();

		/****** BRepGraph_TopoView_ProductOps::IsAssembly ******/
		/****** md5 signature: 72550233f7458f46a5dec613a9c5e8e9 ******/
		%feature("compactdefaultargs") IsAssembly;
		%feature("autodoc", "
Parameters
----------
theProduct: BRepGraph_ProductId

Return
-------
bool

Description
-----------
True if the product is an assembly (has active child occurrences and no topology root). 
Input parameter: theProduct typed product definition identifier.
") IsAssembly;
		bool IsAssembly(const BRepGraph_ProductId theProduct);

		/****** BRepGraph_TopoView_ProductOps::IsPart ******/
		/****** md5 signature: fa677c20bfd6124a3dfc861acb5bbe13 ******/
		%feature("compactdefaultargs") IsPart;
		%feature("autodoc", "
Parameters
----------
theProduct: BRepGraph_ProductId

Return
-------
bool

Description
-----------
True if the product is a part (has a valid topology root). 
Input parameter: theProduct typed product definition identifier.
") IsPart;
		bool IsPart(const BRepGraph_ProductId theProduct);

		/****** BRepGraph_TopoView_ProductOps::Nb ******/
		/****** md5 signature: b01689e975b6c8fb5cb08a63884172d4 ******/
		%feature("compactdefaultargs") Nb;
		%feature("autodoc", "Return
-------
uint32_t

Description
-----------
Return the total number of product definitions (including soft-removed).
") Nb;
		uint32_t Nb();

		/****** BRepGraph_TopoView_ProductOps::NbActive ******/
		/****** md5 signature: 564978715d2dbe06aa9d90fa0b6ff0ef ******/
		%feature("compactdefaultargs") NbActive;
		%feature("autodoc", "Return
-------
uint32_t

Description
-----------
Return the number of active (non-soft-removed) product definitions.
") NbActive;
		uint32_t NbActive();

		/****** BRepGraph_TopoView_ProductOps::NbComponents ******/
		/****** md5 signature: 6650458c6f3d7ff61441cfd174d5c156 ******/
		%feature("compactdefaultargs") NbComponents;
		%feature("autodoc", "
Parameters
----------
theProduct: BRepGraph_ProductId

Return
-------
uint32_t

Description
-----------
Number of active child occurrences of a product. 
Input parameter: theProduct typed product definition identifier.
") NbComponents;
		uint32_t NbComponents(const BRepGraph_ProductId theProduct);

		/****** BRepGraph_TopoView_ProductOps::Relations ******/
		/****** md5 signature: 89451bc2ff43c00da0f6f5655d23a501 ******/
		%feature("compactdefaultargs") Relations;
		%feature("autodoc", "
Parameters
----------
theProduct: BRepGraph_ProductId

Return
-------
BRepGraphInc::ProductRelations

Description
-----------
Return the relation struct (occurrences, shape root) for the given product. 
Input parameter: theProduct typed product definition identifier.
") Relations;
		const BRepGraphInc::ProductRelations & Relations(const BRepGraph_ProductId theProduct);

		/****** BRepGraph_TopoView_ProductOps::ShapeRoot ******/
		/****** md5 signature: 2caffeec622d361d2532aed6367df245 ******/
		%feature("compactdefaultargs") ShapeRoot;
		%feature("autodoc", "
Parameters
----------
theProduct: BRepGraph_ProductId

Return
-------
BRepGraph_NodeId

Description
-----------
Return the topology root NodeId for the given product. For assemblies (no topology root) returns an invalid NodeId. 
Input parameter: theProduct typed product definition identifier.
") ShapeRoot;
		BRepGraph_NodeId ShapeRoot(const BRepGraph_ProductId theProduct);

		/****** BRepGraph_TopoView_ProductOps::ShapeRootNode ******/
		/****** md5 signature: 7b4f9e30b2eb12617af0cec3985aafc3 ******/
		%feature("compactdefaultargs") ShapeRootNode;
		%feature("autodoc", "
Parameters
----------
theProduct: BRepGraph_ProductId

Return
-------
BRepGraph_NodeId

Description
-----------
Return the topology root NodeId for a part product. For assemblies (no topology root) returns an invalid NodeId. 
Input parameter: theProduct typed product definition identifier.
") ShapeRootNode;
		BRepGraph_NodeId ShapeRootNode(const BRepGraph_ProductId theProduct);

		/****** BRepGraph_TopoView_ProductOps::StartId ******/
		/****** md5 signature: 787df1d4abfca2e4d9e99ae86b0a06eb ******/
		%feature("compactdefaultargs") StartId;
		%feature("autodoc", "Return
-------
BRepGraph_ProductId

Description
-----------
Return the first valid product identifier for iteration.
") StartId;
		BRepGraph_ProductId StartId();

};


%extend BRepGraph_TopoView_ProductOps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class BRepGraph_TopoView_ShellOps *
************************************/
%nodefaultctor BRepGraph_TopoView_ShellOps;
class BRepGraph_TopoView_ShellOps {
	public:
		/****** BRepGraph_TopoView_ShellOps::Definition ******/
		/****** md5 signature: 0592ca34c3eb241613ca514bd329001d ******/
		%feature("compactdefaultargs") Definition;
		%feature("autodoc", "
Parameters
----------
theShell: BRepGraph_ShellId

Return
-------
BRepGraphInc::ShellDef

Description
-----------
Return the definition struct for the given shell. 
Input parameter: theShell typed shell identifier.
") Definition;
		const BRepGraphInc::ShellDef & Definition(const BRepGraph_ShellId theShell);

		/****** BRepGraph_TopoView_ShellOps::EndId ******/
		/****** md5 signature: 41904cb01e4043c27b257b2d7da47e39 ******/
		%feature("compactdefaultargs") EndId;
		%feature("autodoc", "Return
-------
BRepGraph_ShellId

Description
-----------
Return the past-the-end shell identifier (one past the last valid id).
") EndId;
		BRepGraph_ShellId EndId();

		/****** BRepGraph_TopoView_ShellOps::Nb ******/
		/****** md5 signature: b01689e975b6c8fb5cb08a63884172d4 ******/
		%feature("compactdefaultargs") Nb;
		%feature("autodoc", "Return
-------
uint32_t

Description
-----------
Return the total number of shell definitions (including soft-removed).
") Nb;
		uint32_t Nb();

		/****** BRepGraph_TopoView_ShellOps::NbActive ******/
		/****** md5 signature: 564978715d2dbe06aa9d90fa0b6ff0ef ******/
		%feature("compactdefaultargs") NbActive;
		%feature("autodoc", "Return
-------
uint32_t

Description
-----------
Return the number of active (non-soft-removed) shell definitions.
") NbActive;
		uint32_t NbActive();

		/****** BRepGraph_TopoView_ShellOps::Relations ******/
		/****** md5 signature: 3a806b959e9821aa0a539ced8ab5c721 ******/
		%feature("compactdefaultargs") Relations;
		%feature("autodoc", "
Parameters
----------
theShell: BRepGraph_ShellId

Return
-------
BRepGraphInc::ShellRelations

Description
-----------
Return the relation struct (adjacency lists) for the given shell. 
Input parameter: theShell typed shell identifier.
") Relations;
		const BRepGraphInc::ShellRelations & Relations(const BRepGraph_ShellId theShell);

		/****** BRepGraph_TopoView_ShellOps::StartId ******/
		/****** md5 signature: 223bbd6ae91d2aff86bf4b55c2118975 ******/
		%feature("compactdefaultargs") StartId;
		%feature("autodoc", "Return
-------
BRepGraph_ShellId

Description
-----------
Return the first valid shell identifier for iteration.
") StartId;
		BRepGraph_ShellId StartId();

};


%extend BRepGraph_TopoView_ShellOps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class BRepGraph_TopoView_SolidOps *
************************************/
%nodefaultctor BRepGraph_TopoView_SolidOps;
class BRepGraph_TopoView_SolidOps {
	public:
		/****** BRepGraph_TopoView_SolidOps::Definition ******/
		/****** md5 signature: b5ddd03fc2b38f6ad31aed31f3af16a8 ******/
		%feature("compactdefaultargs") Definition;
		%feature("autodoc", "
Parameters
----------
theSolid: BRepGraph_SolidId

Return
-------
BRepGraphInc::SolidDef

Description
-----------
Return the definition struct for the given solid. 
Input parameter: theSolid typed solid identifier.
") Definition;
		const BRepGraphInc::SolidDef & Definition(const BRepGraph_SolidId theSolid);

		/****** BRepGraph_TopoView_SolidOps::EndId ******/
		/****** md5 signature: 21b33babe1d033ece19f568fb721f0d4 ******/
		%feature("compactdefaultargs") EndId;
		%feature("autodoc", "Return
-------
BRepGraph_SolidId

Description
-----------
Return the past-the-end solid identifier (one past the last valid id).
") EndId;
		BRepGraph_SolidId EndId();

		/****** BRepGraph_TopoView_SolidOps::Nb ******/
		/****** md5 signature: b01689e975b6c8fb5cb08a63884172d4 ******/
		%feature("compactdefaultargs") Nb;
		%feature("autodoc", "Return
-------
uint32_t

Description
-----------
Return the total number of solid definitions (including soft-removed).
") Nb;
		uint32_t Nb();

		/****** BRepGraph_TopoView_SolidOps::NbActive ******/
		/****** md5 signature: 564978715d2dbe06aa9d90fa0b6ff0ef ******/
		%feature("compactdefaultargs") NbActive;
		%feature("autodoc", "Return
-------
uint32_t

Description
-----------
Return the number of active (non-soft-removed) solid definitions.
") NbActive;
		uint32_t NbActive();

		/****** BRepGraph_TopoView_SolidOps::Relations ******/
		/****** md5 signature: 0aa46f1895f4a9faff2f3ad5ad2aefa4 ******/
		%feature("compactdefaultargs") Relations;
		%feature("autodoc", "
Parameters
----------
theSolid: BRepGraph_SolidId

Return
-------
BRepGraphInc::SolidRelations

Description
-----------
Return the relation struct (adjacency lists) for the given solid. 
Input parameter: theSolid typed solid identifier.
") Relations;
		const BRepGraphInc::SolidRelations & Relations(const BRepGraph_SolidId theSolid);

		/****** BRepGraph_TopoView_SolidOps::StartId ******/
		/****** md5 signature: 759937de9ce2c6e58ed6d39266046368 ******/
		%feature("compactdefaultargs") StartId;
		%feature("autodoc", "Return
-------
BRepGraph_SolidId

Description
-----------
Return the first valid solid identifier for iteration.
") StartId;
		BRepGraph_SolidId StartId();

};


%extend BRepGraph_TopoView_SolidOps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class BRepGraph_TopoView_VertexOps *
*************************************/
%nodefaultctor BRepGraph_TopoView_VertexOps;
class BRepGraph_TopoView_VertexOps {
	public:
		/****** BRepGraph_TopoView_VertexOps::Definition ******/
		/****** md5 signature: 6354ce923642bffd493e2cde0dd20073 ******/
		%feature("compactdefaultargs") Definition;
		%feature("autodoc", "
Parameters
----------
theVertex: BRepGraph_VertexId

Return
-------
BRepGraphInc::VertexDef

Description
-----------
Return the definition struct for the given vertex. 
Input parameter: theVertex typed vertex identifier.
") Definition;
		const BRepGraphInc::VertexDef & Definition(const BRepGraph_VertexId theVertex);

		/****** BRepGraph_TopoView_VertexOps::Edges ******/
		/****** md5 signature: 464269c088954b09ec736fe69cba0086 ******/
		%feature("compactdefaultargs") Edges;
		%feature("autodoc", "
Parameters
----------
theVertex: BRepGraph_VertexId

Return
-------
NCollection_LinearVector<BRepGraph_EdgeId>

Description
-----------
Return the edges incident to the given vertex. 
Input parameter: theVertex typed vertex identifier.
") Edges;
		const NCollection_LinearVector<BRepGraph_EdgeId> & Edges(const BRepGraph_VertexId theVertex);

		/****** BRepGraph_TopoView_VertexOps::EndId ******/
		/****** md5 signature: f9aea47fefbfeb90f45434b62bc9637e ******/
		%feature("compactdefaultargs") EndId;
		%feature("autodoc", "Return
-------
BRepGraph_VertexId

Description
-----------
Return the past-the-end vertex identifier (one past the last valid id).
") EndId;
		BRepGraph_VertexId EndId();

		/****** BRepGraph_TopoView_VertexOps::Nb ******/
		/****** md5 signature: b01689e975b6c8fb5cb08a63884172d4 ******/
		%feature("compactdefaultargs") Nb;
		%feature("autodoc", "Return
-------
uint32_t

Description
-----------
Return the total number of vertex definitions (including soft-removed).
") Nb;
		uint32_t Nb();

		/****** BRepGraph_TopoView_VertexOps::NbActive ******/
		/****** md5 signature: 564978715d2dbe06aa9d90fa0b6ff0ef ******/
		%feature("compactdefaultargs") NbActive;
		%feature("autodoc", "Return
-------
uint32_t

Description
-----------
Return the number of active (non-soft-removed) vertex definitions.
") NbActive;
		uint32_t NbActive();

		/****** BRepGraph_TopoView_VertexOps::Relations ******/
		/****** md5 signature: e8e473229de2b24adeeefb33dbb1a9bf ******/
		%feature("compactdefaultargs") Relations;
		%feature("autodoc", "
Parameters
----------
theVertex: BRepGraph_VertexId

Return
-------
BRepGraphInc::VertexRelations

Description
-----------
Return the relation struct (adjacency lists) for the given vertex. 
Input parameter: theVertex typed vertex identifier.
") Relations;
		const BRepGraphInc::VertexRelations & Relations(const BRepGraph_VertexId theVertex);

		/****** BRepGraph_TopoView_VertexOps::StartId ******/
		/****** md5 signature: 69f95d17396ad597df66fcb8aec9d884 ******/
		%feature("compactdefaultargs") StartId;
		%feature("autodoc", "Return
-------
BRepGraph_VertexId

Description
-----------
Return the first valid vertex identifier for iteration.
") StartId;
		BRepGraph_VertexId StartId();

};


%extend BRepGraph_TopoView_VertexOps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class BRepGraph_TopoView_WireOps *
***********************************/
%nodefaultctor BRepGraph_TopoView_WireOps;
class BRepGraph_TopoView_WireOps {
	public:
		/****** BRepGraph_TopoView_WireOps::Definition ******/
		/****** md5 signature: 833a94b5ab8b70f14f7f194cc3295250 ******/
		%feature("compactdefaultargs") Definition;
		%feature("autodoc", "
Parameters
----------
theWire: BRepGraph_WireId

Return
-------
BRepGraphInc::WireDef

Description
-----------
Return the definition struct for the given wire. 
Input parameter: theWire typed wire identifier.
") Definition;
		const BRepGraphInc::WireDef & Definition(const BRepGraph_WireId theWire);

		/****** BRepGraph_TopoView_WireOps::EndId ******/
		/****** md5 signature: 0614ca9be43f05598679222dfd40ef89 ******/
		%feature("compactdefaultargs") EndId;
		%feature("autodoc", "Return
-------
BRepGraph_WireId

Description
-----------
Return the past-the-end wire identifier (one past the last valid id).
") EndId;
		BRepGraph_WireId EndId();

		/****** BRepGraph_TopoView_WireOps::Nb ******/
		/****** md5 signature: b01689e975b6c8fb5cb08a63884172d4 ******/
		%feature("compactdefaultargs") Nb;
		%feature("autodoc", "Return
-------
uint32_t

Description
-----------
Return the total number of wire definitions (including soft-removed).
") Nb;
		uint32_t Nb();

		/****** BRepGraph_TopoView_WireOps::NbActive ******/
		/****** md5 signature: 564978715d2dbe06aa9d90fa0b6ff0ef ******/
		%feature("compactdefaultargs") NbActive;
		%feature("autodoc", "Return
-------
uint32_t

Description
-----------
Return the number of active (non-soft-removed) wire definitions.
") NbActive;
		uint32_t NbActive();

		/****** BRepGraph_TopoView_WireOps::Relations ******/
		/****** md5 signature: 3b930cbe3a63654f135277dde77b2217 ******/
		%feature("compactdefaultargs") Relations;
		%feature("autodoc", "
Parameters
----------
theWire: BRepGraph_WireId

Return
-------
BRepGraphInc::WireRelations

Description
-----------
Return the relation struct (adjacency lists) for the given wire. 
Input parameter: theWire typed wire identifier.
") Relations;
		const BRepGraphInc::WireRelations & Relations(const BRepGraph_WireId theWire);

		/****** BRepGraph_TopoView_WireOps::StartId ******/
		/****** md5 signature: 439886a5aa9114dc7e7d0b47bcd24a19 ******/
		%feature("compactdefaultargs") StartId;
		%feature("autodoc", "Return
-------
BRepGraph_WireId

Description
-----------
Return the first valid wire identifier for iteration.
") StartId;
		BRepGraph_WireId StartId();

};


%extend BRepGraph_TopoView_WireOps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class BRepGraph_Transform *
****************************/
%nodefaultctor BRepGraph_Transform;
class BRepGraph_Transform {
	public:
		/****** BRepGraph_Transform::MoveRef ******/
		/****** md5 signature: 8ad1e69595a380aa7ff121211e7a1aad ******/
		%feature("compactdefaultargs") MoveRef;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theRefId: BRepGraph_ChildRefId
theTrsf: gp_Trsf

Return
-------
bool

Description
-----------
Apply an in-place location-only transform to a child reference. Composes theTrsf into ChildRef placement without copying any geometry. Cached mesh data on entities downstream of the moved ref is stored in the entity's local frame and is unaffected; callers that bake a world transform into a cache key own the invalidation responsibility. @note Only pure rotation/translation transforms (scale == 1) are supported. The method returns false if |scaleFactor| != 1. 
Input parameter: theGraph the graph containing the reference 
Input parameter: theRefId child reference to move 
Input parameter: theTrsf the transformation to compose into the location 
Return: true on success; false if the ref is invalid/removed or theTrsf has non-unit scale.
") MoveRef;
		static bool MoveRef(BRepGraph & theGraph, const BRepGraph_ChildRefId theRefId, const gp_Trsf & theTrsf);

		/****** BRepGraph_Transform::MoveRef ******/
		/****** md5 signature: 1cfd43e6d0462d4051c98a5824a1f867 ******/
		%feature("compactdefaultargs") MoveRef;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theRefId: BRepGraph_OccurrenceRefId
theTrsf: gp_Trsf

Return
-------
bool

Description
-----------
Apply an in-place location-only transform to an occurrence reference. Composes theTrsf into OccurrenceRef placement without copying any geometry. @note Only pure rotation/translation transforms (scale == 1) are supported. 
Return: true on success; false if the ref is invalid/removed or theTrsf has non-unit scale.
") MoveRef;
		static bool MoveRef(BRepGraph & theGraph, const BRepGraph_OccurrenceRefId theRefId, const gp_Trsf & theTrsf);

		/****** BRepGraph_Transform::Perform ******/
		/****** md5 signature: a47b65e918ade46a8c3ac779ada6ca86 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theSourceGraph: BRepGraph
theTargetGraph: BRepGraph
theTrsf: gp_Trsf
theGeomPolicy: BRepGraph_Copy::GeomPolicy (optional, default to BRepGraph_Copy::GeomPolicy::Copy)
theMeshPolicy: BRepGraph_Copy::MeshPolicy (optional, default to BRepGraph_Copy::MeshPolicy::Drop)

Return
-------
bool

Description
-----------
Transform the entire graph into a target graph. //! Self-transform (theSourceGraph == theTargetGraph): Applies transform in-place on theTargetGraph. //! External transform to empty target (theTargetGraph.IsEmpty()): Copies source into target, then transforms. //! External transform to non-empty target: Appends source entities into target with explicit mapping, then transforms. //! 
Input parameter: theSourceGraph a pre-built BRepGraph (must not be empty) @param[in,out] theTargetGraph destination graph (may already contain data) 
Input parameter: theTrsf the transformation to apply 
Input parameter: theGeomPolicy geometry handle policy (default: Copy) 
Input parameter: theMeshPolicy mesh data policy (default: Drop) 
Return: true on success, false on failure (empty source, or Drop + geometry-modification-required).
") Perform;
		static bool Perform(const BRepGraph & theSourceGraph, BRepGraph & theTargetGraph, const gp_Trsf & theTrsf, const BRepGraph_Copy::GeomPolicy theGeomPolicy = BRepGraph_Copy::GeomPolicy::Copy, const BRepGraph_Copy::MeshPolicy theMeshPolicy = BRepGraph_Copy::MeshPolicy::Drop);

		/****** BRepGraph_Transform::TransformNode ******/
		/****** md5 signature: 3d9428915364c6490f55fd2de172ff11 ******/
		%feature("compactdefaultargs") TransformNode;
		%feature("autodoc", "
Parameters
----------
theSourceGraph: BRepGraph
theTargetGraph: BRepGraph
theNodeId: BRepGraph_NodeId
theTrsf: gp_Trsf
theGeomPolicy: BRepGraph_Copy::GeomPolicy (optional, default to BRepGraph_Copy::GeomPolicy::Copy)
theMeshPolicy: BRepGraph_Copy::MeshPolicy (optional, default to BRepGraph_Copy::MeshPolicy::Drop)

Return
-------
BRepGraph_NodeId

Description
-----------
Transform a single node sub-graph of any kind. Topology nodes are copied and transformed by baking the transform into their definitions. //! Self-transform (theSourceGraph == theTargetGraph): Duplicates the sub-graph with new entity IDs, then transforms the copy. //! External transform: Copies the sub-graph into theTargetGraph, then transforms. //! 
Input parameter: theSourceGraph a pre-built BRepGraph @param[in,out] theTargetGraph destination graph (may already contain data) 
Input parameter: theNodeId node identifier (any kind) 
Input parameter: theTrsf the transformation to apply 
Input parameter: theGeomPolicy geometry handle policy (default: Copy; Drop is invalid for topology) 
Input parameter: theMeshPolicy mesh data policy (default: Drop) 
Return: the mapped root NodeId in theTargetGraph, or invalid NodeId on failure.
") TransformNode;
		static BRepGraph_NodeId TransformNode(const BRepGraph & theSourceGraph, BRepGraph & theTargetGraph, const BRepGraph_NodeId theNodeId, const gp_Trsf & theTrsf, const BRepGraph_Copy::GeomPolicy theGeomPolicy = BRepGraph_Copy::GeomPolicy::Copy, const BRepGraph_Copy::MeshPolicy theMeshPolicy = BRepGraph_Copy::MeshPolicy::Drop);

};


%extend BRepGraph_Transform {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class BRepGraph_UID *
**********************/
class BRepGraph_UID {
	public:
		BRepGraph_NodeId::Kind Kind;
		uint32_t Counter;
		/****** BRepGraph_UID::BRepGraph_UID ******/
		/****** md5 signature: 8b0d185df37138240c2cec7a661ea9c8 ******/
		%feature("compactdefaultargs") BRepGraph_UID;
		%feature("autodoc", "Return
-------
None

Description
-----------
Default: invalid UID (counter = 0 is the invalid sentinel).
") BRepGraph_UID;
		 BRepGraph_UID();

		/****** BRepGraph_UID::BRepGraph_UID ******/
		/****** md5 signature: f5a14c37b7899894916af444851db5a1 ******/
		%feature("compactdefaultargs") BRepGraph_UID;
		%feature("autodoc", "
Parameters
----------
theKind: BRepGraph_NodeId::Kind
theCounter: uint32_t

Return
-------
None

Description
-----------
Construct a valid UID. Called internally by BRepGraphInc_Storage::AllocateNodeUID(). @pre theCounter > 0 (counter = 0 is reserved as the invalid sentinel).
") BRepGraph_UID;
		 BRepGraph_UID(const BRepGraph_NodeId::Kind theKind, const uint32_t theCounter);

		/****** BRepGraph_UID::HashValue ******/
		/****** md5 signature: cfafde6dce6a8bec2e309186d08373c6 ******/
		%feature("compactdefaultargs") HashValue;
		%feature("autodoc", "Return
-------
size_t

Description
-----------
Hash value compatible with operator==.
") HashValue;
		size_t HashValue();

		/****** BRepGraph_UID::Invalid ******/
		/****** md5 signature: b3018634ce2b5599fb3960e36896164b ******/
		%feature("compactdefaultargs") Invalid;
		%feature("autodoc", "Return
-------
BRepGraph_UID

Description
-----------
Factory: returns an explicitly invalid UID.
") Invalid;
		static BRepGraph_UID Invalid();

		/****** BRepGraph_UID::IsAssembly ******/
		/****** md5 signature: 802744c3972877eb7226ef9f8d071002 ******/
		%feature("compactdefaultargs") IsAssembly;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsAssembly;
		bool IsAssembly();

		/****** BRepGraph_UID::IsTopology ******/
		/****** md5 signature: f3668b0870c1f0b21a9a8d5baa208eeb ******/
		%feature("compactdefaultargs") IsTopology;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsTopology;
		bool IsTopology();

		/****** BRepGraph_UID::IsValid ******/
		/****** md5 signature: 735088818cf24ebe0ebc7005a507da69 ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if this UID has a valid kind and a non-zero counter.
") IsValid;
		bool IsValid();

};


%extend BRepGraph_UID {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class BRepGraph_UIDsView *
***************************/
%nodefaultctor BRepGraph_UIDsView;
class BRepGraph_UIDsView {
	public:
		/****** BRepGraph_UIDsView::Generation ******/
		/****** md5 signature: 97ab1be4dc0ec137870b039fa35dd45f ******/
		%feature("compactdefaultargs") Generation;
		%feature("autodoc", "Return
-------
uint32_t

Description
-----------
Return the current generation counter (incremented on each BRepGraph::Clear()). 
Return: graph generation number.
") Generation;
		uint32_t Generation();

		/****** BRepGraph_UIDsView::GraphGUID ******/
		/****** md5 signature: b6a6a5d32e5e515d1a496c2efbdfe5a7 ******/
		%feature("compactdefaultargs") GraphGUID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Return the graph-level identity GUID. Generated randomly at BRepGraph::Clear() time; changes on each rebuild. 
Return: reference to the graph identity GUID.
") GraphGUID;
		const Standard_GUID & GraphGUID();

		/****** BRepGraph_UIDsView::Has ******/
		/****** md5 signature: 951ef955ae2bf985618579cd4b26d0ad ******/
		%feature("compactdefaultargs") Has;
		%feature("autodoc", "
Parameters
----------
theUID: BRepGraph_UID

Return
-------
bool

Description
-----------
Check if a UID is valid and exists in this graph generation. 
Input parameter: theUID unique identifier to check 
Return: true if the UID resolves to an active node in this graph generation.
") Has;
		bool Has(const BRepGraph_UID & theUID);

		/****** BRepGraph_UIDsView::Has ******/
		/****** md5 signature: f6228682a136284ac57778f75080d0c1 ******/
		%feature("compactdefaultargs") Has;
		%feature("autodoc", "
Parameters
----------
theUID: BRepGraph_RefUID

Return
-------
bool

Description
-----------
Check if a RefUID is valid and exists in this graph generation. 
Input parameter: theUID unique reference identifier to check 
Return: true if the RefUID resolves to an active reference in this graph generation.
") Has;
		bool Has(const BRepGraph_RefUID & theUID);

		/****** BRepGraph_UIDsView::Has ******/
		/****** md5 signature: 7a0d40a1a3188b2c60c2ae41e7dc72ff ******/
		%feature("compactdefaultargs") Has;
		%feature("autodoc", "
Parameters
----------
theUID: BRepGraph_ItemUID

Return
-------
bool

Description
-----------
Check if a generic item UID exists in this graph generation.
") Has;
		bool Has(const BRepGraph_ItemUID & theUID);

		/****** BRepGraph_UIDsView::IsStale ******/
		/****** md5 signature: 45d078a0546cc74c6894e0eb0f949e21 ******/
		%feature("compactdefaultargs") IsStale;
		%feature("autodoc", "
Parameters
----------
theStamp: BRepGraph_VersionStamp

Return
-------
bool

Description
-----------
Check if a previously-taken stamp is stale. A stamp is stale when the stamped item has been mutated, removed, or the graph was rebuilt since the stamp was taken. 
Input parameter: theStamp version stamp to check 
Return: true if the stamp no longer matches the current graph state.
") IsStale;
		bool IsStale(const BRepGraph_VersionStamp & theStamp);

		/****** BRepGraph_UIDsView::ItemIdFrom ******/
		/****** md5 signature: a1622460f47be95b663f5d672a08a0f3 ******/
		%feature("compactdefaultargs") ItemIdFrom;
		%feature("autodoc", "
Parameters
----------
theUID: BRepGraph_ItemUID

Return
-------
BRepGraph_ItemId

Description
-----------
Resolve a generic item UID back to a transient item id. 
Input parameter: theUID durable node/reference item identity 
Return: active item id, or invalid item id if the UID cannot be resolved.
") ItemIdFrom;
		BRepGraph_ItemId ItemIdFrom(const BRepGraph_ItemUID & theUID);

		/****** BRepGraph_UIDsView::NodeIdFrom ******/
		/****** md5 signature: f64401663dab646b4dea1a4f417a37dc ******/
		%feature("compactdefaultargs") NodeIdFrom;
		%feature("autodoc", "
Parameters
----------
theUID: BRepGraph_UID

Return
-------
BRepGraph_NodeId

Description
-----------
Resolve a UID back to a NodeId using the internal reverse index. 
Input parameter: theUID unique identifier to resolve 
Return: corresponding active NodeId, or invalid NodeId if not found/removed.
") NodeIdFrom;
		BRepGraph_NodeId NodeIdFrom(const BRepGraph_UID & theUID);

		/****** BRepGraph_UIDsView::Of ******/
		/****** md5 signature: 278d5ace6caa99cb74c191fbfc956bb3 ******/
		%feature("compactdefaultargs") Of;
		%feature("autodoc", "
Parameters
----------
theNode: BRepGraph_NodeId

Return
-------
BRepGraph_UID

Description
-----------
Return the UID assigned to a node. 
Input parameter: theNode node identifier 
Return: UID for the active node, or invalid UID if theNode is out of bounds or removed.
") Of;
		BRepGraph_UID Of(const BRepGraph_NodeId theNode);

		/****** BRepGraph_UIDsView::Of ******/
		/****** md5 signature: 2e7a92dac107bfd7d43426315e605cc4 ******/
		%feature("compactdefaultargs") Of;
		%feature("autodoc", "
Parameters
----------
theRefId: BRepGraph_RefId

Return
-------
BRepGraph_RefUID

Description
-----------
Return the RefUID assigned to a reference. 
Input parameter: theRefId reference identifier 
Return: RefUID for the active reference, or invalid RefUID if theRefId is out of bounds or removed.
") Of;
		BRepGraph_RefUID Of(const BRepGraph_RefId theRefId);

		/****** BRepGraph_UIDsView::Of ******/
		/****** md5 signature: 7ed83e6e364dc5e24ad60e8fe1b07e39 ******/
		%feature("compactdefaultargs") Of;
		%feature("autodoc", "
Parameters
----------
theItem: BRepGraph_ItemId

Return
-------
BRepGraph_ItemUID

Description
-----------
Return the persistent UID assigned to a generic graph item. 
Input parameter: theItem definition-node or reference-entry item id 
Return: durable item UID, or invalid UID if the item is out of bounds or removed.
") Of;
		BRepGraph_ItemUID Of(const BRepGraph_ItemId theItem);

		/****** BRepGraph_UIDsView::RefIdFrom ******/
		/****** md5 signature: 1adf36c47f547aad032008a0b3bdbf4f ******/
		%feature("compactdefaultargs") RefIdFrom;
		%feature("autodoc", "
Parameters
----------
theUID: BRepGraph_RefUID

Return
-------
BRepGraph_RefId

Description
-----------
Resolve a RefUID back to a RefId using the internal reverse index. 
Input parameter: theUID unique reference identifier to resolve 
Return: corresponding active RefId, or invalid RefId if not found/removed.
") RefIdFrom;
		BRepGraph_RefId RefIdFrom(const BRepGraph_RefUID & theUID);

		/****** BRepGraph_UIDsView::StampOf ******/
		/****** md5 signature: 5e4827851391746c1d266b0e96844381 ******/
		%feature("compactdefaultargs") StampOf;
		%feature("autodoc", "
Parameters
----------
theNode: BRepGraph_NodeId

Return
-------
BRepGraph_VersionStamp

Description
-----------
Produce a version stamp for the given node. Combines the node's UID with its current OwnGen and graph Generation. 
Input parameter: theNode node identifier 
Return: version stamp, or invalid stamp if theNode is invalid, removed, or out of bounds.
") StampOf;
		BRepGraph_VersionStamp StampOf(const BRepGraph_NodeId theNode);

		/****** BRepGraph_UIDsView::StampOf ******/
		/****** md5 signature: 40e7e8a902ae7711dc6938e5ee722b69 ******/
		%feature("compactdefaultargs") StampOf;
		%feature("autodoc", "
Parameters
----------
theRefId: BRepGraph_RefId

Return
-------
BRepGraph_VersionStamp

Description
-----------
Produce a version stamp for the given reference. Combines the reference's RefUID with its current OwnGen and graph Generation. 
Input parameter: theRefId reference identifier 
Return: version stamp, or invalid stamp if theRefId is invalid, removed, or out of bounds.
") StampOf;
		BRepGraph_VersionStamp StampOf(const BRepGraph_RefId theRefId);

		/****** BRepGraph_UIDsView::StampOf ******/
		/****** md5 signature: 928e4d3600328169ba03665bfe5dddae ******/
		%feature("compactdefaultargs") StampOf;
		%feature("autodoc", "
Parameters
----------
theRepId: BRepGraph_RepId

Return
-------
BRepGraph_VersionStamp

Description
-----------
Produce a version stamp for an owner-scoped use record. Use records have no durable UID or mutation generation; the stamp uses the owning definition-node UID, OwnGen, and graph Generation. 
Input parameter: theRepId use-record identifier 
Return: version stamp, or invalid stamp if theRepId is invalid, removed, or out of bounds.
") StampOf;
		BRepGraph_VersionStamp StampOf(const BRepGraph_RepId theRepId);

		/****** BRepGraph_UIDsView::StampOf ******/
		/****** md5 signature: 83d27ae3a6a6c1c27cc834026acabe47 ******/
		%feature("compactdefaultargs") StampOf;
		%feature("autodoc", "
Parameters
----------
theItem: BRepGraph_ItemId

Return
-------
BRepGraph_VersionStamp

Description
-----------
Produce a version stamp for the given definition-node or reference-entry item.
") StampOf;
		BRepGraph_VersionStamp StampOf(const BRepGraph_ItemId theItem);

};


%extend BRepGraph_UIDsView {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class BRepGraph_UsagePath *
****************************/
class BRepGraph_UsagePath {
	public:
		/****** BRepGraph_UsagePath::BRepGraph_UsagePath ******/
		/****** md5 signature: e2a3d928c99ccfa662d328fad37b5943 ******/
		%feature("compactdefaultargs") BRepGraph_UsagePath;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty usage path.
") BRepGraph_UsagePath;
		 BRepGraph_UsagePath();

		/****** BRepGraph_UsagePath::BRepGraph_UsagePath ******/
		/****** md5 signature: 7b2a937ccc28e2a141f1c7c3ad725ed4 ******/
		%feature("compactdefaultargs") BRepGraph_UsagePath;
		%feature("autodoc", "
Parameters
----------
theCapacity: size_t

Return
-------
None

Description
-----------
Creates a usage path with pre-allocated capacity. 
Input parameter: theCapacity number of steps to pre-allocate.
") BRepGraph_UsagePath;
		 BRepGraph_UsagePath(const size_t theCapacity);

		/****** BRepGraph_UsagePath::Append ******/
		/****** md5 signature: c00f3514dd73ca800d8d84ac28af6917 ******/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "
Parameters
----------
theStep: BRepGraph_UsagePath_Step

Return
-------
None

Description
-----------
Appends a step to the end of the path. 
Input parameter: theStep step to append.
") Append;
		void Append(BRepGraph_UsagePath_Step theStep);

		/****** BRepGraph_UsagePath::Clear ******/
		/****** md5 signature: 75abd67f132413fc11c19201aabf1126 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes all steps from the path.
") Clear;
		void Clear();

		/****** BRepGraph_UsagePath::First ******/
		/****** md5 signature: 6cef7f869b52fd246b65921f9535be80 ******/
		%feature("compactdefaultargs") First;
		%feature("autodoc", "Return
-------
BRepGraph_UsagePath_Step

Description
-----------
Returns the first step in the path.
") First;
		const BRepGraph_UsagePath_Step & First();

		/****** BRepGraph_UsagePath::InsertBefore ******/
		/****** md5 signature: 348e12dd3a682f9e3542e4c283216495 ******/
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "
Parameters
----------
theIdx: size_t
theStep: BRepGraph_UsagePath_Step

Return
-------
None

Description
-----------
Inserts a step before the given index. 
Input parameter: theIdx zero-based index to insert before 
Input parameter: theStep step to insert.
") InsertBefore;
		void InsertBefore(const size_t theIdx, BRepGraph_UsagePath_Step theStep);

		/****** BRepGraph_UsagePath::IsEmpty ******/
		/****** md5 signature: 70a41d5fe65955a28167088305fc6991 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the path has no steps.
") IsEmpty;
		bool IsEmpty();

		/****** BRepGraph_UsagePath::Last ******/
		/****** md5 signature: 75c87fdb6d04453fc8c72bfaa3e30949 ******/
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "Return
-------
BRepGraph_UsagePath_Step

Description
-----------
Returns the last step in the path.
") Last;
		const BRepGraph_UsagePath_Step & Last();

		/****** BRepGraph_UsagePath::Size ******/
		/****** md5 signature: cbd8471ac8e6ef120a405ad6c4ba90d1 ******/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "Return
-------
size_t

Description
-----------
Returns the number of steps in the path.
") Size;
		size_t Size();

		/****** BRepGraph_UsagePath::Value ******/
		/****** md5 signature: c4549e25042dc4060a56e720a26592a3 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
theIdx: size_t

Return
-------
BRepGraph_UsagePath_Step

Description
-----------
Returns the step at the given index. 
Input parameter: theIdx zero-based index.
") Value;
		const BRepGraph_UsagePath_Step & Value(const size_t theIdx);


%extend{
    bool __eq_wrapper__(const BRepGraph_UsagePath other) {
        if (*self==other) return true;
        else return false;
    }
}
%pythoncode {
def __eq__(self, right):
    try:
        return self.__eq_wrapper__(right)
    except:
        return False
}
};


%extend BRepGraph_UsagePath {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def IsEqual(self):
		pass

	@methodnotwrapped
	def HashCode(self):
		pass
	}
};

/*********************************
* class BRepGraph_UsagePath_Step *
*********************************/
class BRepGraph_UsagePath_Step {
	public:
		BRepGraph_NodeId Node;
		BRepGraph_RefId Ref;
		int StepIndex;

%extend{
    bool __eq_wrapper__(BRepGraph_UsagePath_Step other) {
        if (*self==other) return true;
        else return false;
    }
}
%pythoncode {
def __eq__(self, right):
    try:
        return self.__eq_wrapper__(right)
    except:
        return False
}
};


%extend BRepGraph_UsagePath_Step {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class BRepGraph_Validate *
***************************/
%nodefaultctor BRepGraph_Validate;
class BRepGraph_Validate {
	public:
/* public enums */
enum class Severity {
	Warning = 0,
	Error = 1,
};

enum class Mode {
	Lightweight = 0,
	Audit = 1,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class Severity(IntEnum):
	Warning = 0
	Error = 1
Warning = Severity.Warning
Error = Severity.Error

class Mode(IntEnum):
	Lightweight = 0
	Audit = 1
Lightweight = Mode.Lightweight
Audit = Mode.Audit
};
/* end python proxy for enums */

		/****** BRepGraph_Validate::Perform ******/
		/****** md5 signature: eef87c1c73e831e3cc7f14818996aec3 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph

Return
-------
BRepGraph_Validate_Result

Description
-----------
Run default lightweight structural checks on a built graph. Uses Mode::Lightweight; for full structural audit use Perform(theGraph, Mode::Audit). 
Input parameter: theGraph graph to validate (const, read-only) 
Return: validation result with all detected issues.
") Perform;
		static BRepGraph_Validate_Result Perform(const BRepGraph & theGraph);

		/****** BRepGraph_Validate::Perform ******/
		/****** md5 signature: 9d452e2bf92898dda9654fdd3d871288 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theMode: Mode

Return
-------
BRepGraph_Validate_Result

Description
-----------
Run structural checks on a built graph with explicit mode. 
Input parameter: theGraph graph to validate (const, read-only) 
Input parameter: theMode validation mode 
Return: validation result with all detected issues.
") Perform;
		static BRepGraph_Validate_Result Perform(const BRepGraph & theGraph, Mode theMode);

		/****** BRepGraph_Validate::Perform ******/
		/****** md5 signature: 18df43e68959be6239b1ab179ad389c3 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theOptions: BRepGraph_Validate_Options

Return
-------
BRepGraph_Validate_Result

Description
-----------
Run structural checks on a built graph with explicit options. 
Input parameter: theGraph graph to validate (const, read-only) 
Input parameter: theOptions validation profile/options 
Return: validation result with all detected issues.
") Perform;
		static BRepGraph_Validate_Result Perform(const BRepGraph & theGraph, BRepGraph_Validate_Options theOptions);

};


%extend BRepGraph_Validate {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class BRepGraph_Validate_Issue *
*********************************/
class BRepGraph_Validate_Issue {
	public:
		BRepGraph_Validate::Severity Sev;
		BRepGraph_NodeId NodeId;
		TCollection_AsciiString Description;
};


%extend BRepGraph_Validate_Issue {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class BRepGraph_Validate_Options *
***********************************/
class BRepGraph_Validate_Options {
	public:
		BRepGraph_Validate::Mode ValidationMode;
		/****** BRepGraph_Validate_Options::Audit ******/
		/****** md5 signature: 23b6d23d6d2e4a2cc9e7abf2d8491778 ******/
		%feature("compactdefaultargs") Audit;
		%feature("autodoc", "Return
-------
BRepGraph_Validate_Options

Description
-----------
Build options for full-audit validation.
") Audit;
		static BRepGraph_Validate_Options Audit();

		/****** BRepGraph_Validate_Options::Lightweight ******/
		/****** md5 signature: 48b0573fceec52b019f0e9119e3d2fd1 ******/
		%feature("compactdefaultargs") Lightweight;
		%feature("autodoc", "Return
-------
BRepGraph_Validate_Options

Description
-----------
Build options for lightweight validation.
") Lightweight;
		static BRepGraph_Validate_Options Lightweight();

};


%extend BRepGraph_Validate_Options {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class BRepGraph_Validate_Result *
**********************************/
class BRepGraph_Validate_Result {
	public:
		/****** BRepGraph_Validate_Result::IsValid ******/
		/****** md5 signature: f11036be78d4c26ffdc54c2415b67292 ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if no Error-level issues were found.
") IsValid;
		bool IsValid();

		/****** BRepGraph_Validate_Result::NbIssues ******/
		/****** md5 signature: 733f4f0c43ab2063b9ce721b2e742d9f ******/
		%feature("compactdefaultargs") NbIssues;
		%feature("autodoc", "
Parameters
----------
theSev: BRepGraph_Validate::Severity

Return
-------
int

Description
-----------
Count issues of a given severity.
") NbIssues;
		int NbIssues(BRepGraph_Validate::Severity theSev);

};


%extend BRepGraph_Validate_Result {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class BRepGraph_VersionStamp *
*******************************/
class BRepGraph_VersionStamp {
	public:
/* public enums */
enum class Domain {
	None = 0,
	Node = 1,
	Reference = 2,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class Domain(IntEnum):
	None_ = 0
	Node = 1
	Reference = 2
None_ = Domain.None_
Node = Domain.Node
Reference = Domain.Reference
};
/* end python proxy for enums */

		BRepGraph_UID myNodeUID;
		BRepGraph_RefUID myRefUID;
		uint32_t myMutationGen;
		uint32_t myGeneration;
		Domain myDomain;
		/****** BRepGraph_VersionStamp::BRepGraph_VersionStamp ******/
		/****** md5 signature: 2496f0729f713bc2cdff59efb0701077 ******/
		%feature("compactdefaultargs") BRepGraph_VersionStamp;
		%feature("autodoc", "Return
-------
None

Description
-----------
Default constructor. Creates an invalid stamp (invalid UID, zero counters).
") BRepGraph_VersionStamp;
		 BRepGraph_VersionStamp();

		/****** BRepGraph_VersionStamp::BRepGraph_VersionStamp ******/
		/****** md5 signature: b055a31b2118f48a9d45c601c709a01e ******/
		%feature("compactdefaultargs") BRepGraph_VersionStamp;
		%feature("autodoc", "
Parameters
----------
theUID: BRepGraph_UID
theMutationGen: uint32_t
theGeneration: uint32_t

Return
-------
None

Description
-----------
Construct a node-domain stamp from components. 
Input parameter: theUID persistent definition-node identity 
Input parameter: theMutationGen OwnGen counter (own-data mutation counter) 
Input parameter: theGeneration graph BRepGraph::Clear() generation.
") BRepGraph_VersionStamp;
		 BRepGraph_VersionStamp(const BRepGraph_UID & theUID, const uint32_t theMutationGen, const uint32_t theGeneration);

		/****** BRepGraph_VersionStamp::BRepGraph_VersionStamp ******/
		/****** md5 signature: cd95a219a063fcde73e3249528447c6c ******/
		%feature("compactdefaultargs") BRepGraph_VersionStamp;
		%feature("autodoc", "
Parameters
----------
theRefUID: BRepGraph_RefUID
theMutationGen: uint32_t
theGeneration: uint32_t

Return
-------
None

Description
-----------
Construct a reference-domain stamp from components. 
Input parameter: theRefUID persistent reference identity 
Input parameter: theMutationGen OwnGen counter (own-data mutation counter) 
Input parameter: theGeneration graph BRepGraph::Clear() generation.
") BRepGraph_VersionStamp;
		 BRepGraph_VersionStamp(const BRepGraph_RefUID & theRefUID, const uint32_t theMutationGen, const uint32_t theGeneration);

		/****** BRepGraph_VersionStamp::HashValue ******/
		/****** md5 signature: 9a7b1f7ea60bb022cabc72d67e674eb3 ******/
		%feature("compactdefaultargs") HashValue;
		%feature("autodoc", "Return
-------
size_t

Description
-----------
Compute hash value consistent with operator==. 
Return: hash combining active UID, domain, OwnGen, and Generation.
") HashValue;
		size_t HashValue();

		/****** BRepGraph_VersionStamp::IsNodeStamp ******/
		/****** md5 signature: fadb81ab50d15a17bb3fd6074510e37a ******/
		%feature("compactdefaultargs") IsNodeStamp;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True when this is a definition-node-domain stamp.
") IsNodeStamp;
		bool IsNodeStamp();

		/****** BRepGraph_VersionStamp::IsRefStamp ******/
		/****** md5 signature: bba72e0f1c54c34da67de452391c6c53 ******/
		%feature("compactdefaultargs") IsRefStamp;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True when this is a reference-domain stamp.
") IsRefStamp;
		bool IsRefStamp();

		/****** BRepGraph_VersionStamp::IsSameItem ******/
		/****** md5 signature: 553529a1d1562f1cb28ad81d59438dfc ******/
		%feature("compactdefaultargs") IsSameItem;
		%feature("autodoc", "
Parameters
----------
theOther: BRepGraph_VersionStamp

Return
-------
bool

Description
-----------
Check if two stamps refer to the same graph item regardless of version. Compares active UID only, ignoring OwnGen and Generation. 
Input parameter: theOther stamp to compare with 
Return: true if both stamps have the same domain and UID.
") IsSameItem;
		bool IsSameItem(const BRepGraph_VersionStamp & theOther);

		/****** BRepGraph_VersionStamp::IsValid ******/
		/****** md5 signature: 735088818cf24ebe0ebc7005a507da69 ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Check if the stamp has a valid identity in its domain.
") IsValid;
		bool IsValid();

		/****** BRepGraph_VersionStamp::ItemUID ******/
		/****** md5 signature: cff6ac221f87f0e13022ffb376678e0c ******/
		%feature("compactdefaultargs") ItemUID;
		%feature("autodoc", "Return
-------
BRepGraph_ItemUID

Description
-----------
Return the active generic item identity.
") ItemUID;
		BRepGraph_ItemUID ItemUID();

		/****** BRepGraph_VersionStamp::ToGUID ******/
		/****** md5 signature: a3509b7e5cb6d0f0d9c25a67bdb9d15a ******/
		%feature("compactdefaultargs") ToGUID;
		%feature("autodoc", "
Parameters
----------
theGraphGUID: Standard_GUID

Return
-------
Standard_GUID

Description
-----------
Derive a deterministic Standard_GUID from this stamp. The graph GUID is incorporated into the hash, making per-node GUIDs globally unique across different graph instances. One-way: cannot reconstruct stamp fields from the resulting GUID. 
Input parameter: theGraphGUID the owning graph's identity GUID 
Return: deterministic Standard_GUID derived from stamp + graph GUID.
") ToGUID;
		Standard_GUID ToGUID(const Standard_GUID & theGraphGUID);


%extend{
    bool __ne_wrapper__(const BRepGraph_VersionStamp other) {
        if (*self!=other) return true;
        else return false;
    }
}
%pythoncode {
def __ne__(self, right):
    try:
        return self.__ne_wrapper__(right)
    except:
        return True
}

%extend{
    bool __eq_wrapper__(const BRepGraph_VersionStamp other) {
        if (*self==other) return true;
        else return false;
    }
}
%pythoncode {
def __eq__(self, right):
    try:
        return self.__eq_wrapper__(right)
    except:
        return False
}
};


%extend BRepGraph_VersionStamp {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class BRepGraph_VertexId *
***************************/
class BRepGraph_VertexId {
	public:
		uint32_t Index;
		/****** BRepGraph_VertexId::BRepGraph_VertexId ******/
		/****** md5 signature: 4311b88151facb04e31a8f94c612d63e ******/
		%feature("compactdefaultargs") BRepGraph_VertexId;
		%feature("autodoc", "Return
-------
None

Description
-----------
Default: invalid (Index = UINT32_MAX).
") BRepGraph_VertexId;
		 BRepGraph_VertexId();

		/****** BRepGraph_VertexId::BRepGraph_VertexId ******/
		/****** md5 signature: 718adffe00b7c66230abfc0915fac1a6 ******/
		%feature("compactdefaultargs") BRepGraph_VertexId;
		%feature("autodoc", "
Parameters
----------
theIdx: uint32_t

Return
-------
None

Description
-----------
Construct from index.
") BRepGraph_VertexId;
		 BRepGraph_VertexId(const uint32_t theIdx);

		/****** BRepGraph_VertexId::BRepGraph_VertexId ******/
		/****** md5 signature: 06f9543631732e963a42611acebb8a88 ******/
		%feature("compactdefaultargs") BRepGraph_VertexId;
		%feature("autodoc", "
Parameters
----------
theId: BRepGraph_NodeId

Return
-------
None

Description
-----------
Construct from an untyped node id of the same kind.
") BRepGraph_VertexId;
		 BRepGraph_VertexId(const BRepGraph_NodeId theId);

		/****** BRepGraph_VertexId::FromNodeId ******/
		/****** md5 signature: 446894b9c1847edab23d1c81f8aa599c ******/
		%feature("compactdefaultargs") FromNodeId;
		%feature("autodoc", "
Parameters
----------
theId: BRepGraph_NodeId

Return
-------
BRepGraph_VertexId

Description
-----------
Explicit conversion from untyped NodeId. Asserts that the Kind matches in debug builds. 
Input parameter: theId untyped NodeId to convert.
") FromNodeId;
		static BRepGraph_VertexId FromNodeId(const BRepGraph_NodeId theId);

		/****** BRepGraph_VertexId::Invalid ******/
		/****** md5 signature: 19622d4f1c44c5c7e384ccc5986fb8d8 ******/
		%feature("compactdefaultargs") Invalid;
		%feature("autodoc", "Return
-------
BRepGraph_VertexId

Description
-----------
Invalid sentinel id.
") Invalid;
		static BRepGraph_VertexId Invalid();

		/****** BRepGraph_VertexId::IsOwned ******/
		/****** md5 signature: 82162d9fddf9bcd26161cc7f9c342a8b ******/
		%feature("compactdefaultargs") IsOwned;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph

Return
-------
bool

Description
-----------
Return true if this node has an active owner in the given graph.
") IsOwned;
		bool IsOwned(const BRepGraph & theGraph);

		/****** BRepGraph_VertexId::IsRemoved ******/
		/****** md5 signature: 75ed1923a75d2c35c92a9683349c6622 ******/
		%feature("compactdefaultargs") IsRemoved;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph

Return
-------
bool

Description
-----------
Return true if this node has been soft-removed in the given graph.
") IsRemoved;
		bool IsRemoved(const BRepGraph & theGraph);

		/****** BRepGraph_VertexId::IsValid ******/
		/****** md5 signature: 735088818cf24ebe0ebc7005a507da69 ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if this id points to an allocated node slot.
") IsValid;
		bool IsValid();

		/****** BRepGraph_VertexId::IsValid ******/
		/****** md5 signature: 294f20297d740c99df23b64d8041b57c ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "
Parameters
----------
theMaxCount: uint32_t

Return
-------
bool

Description
-----------
True if this id points to an allocated slot within [0, theMaxCount). UINT32_MAX (invalid sentinel) always fails this check for any realistic count.
") IsValid;
		bool IsValid(const uint32_t theMaxCount);

		/****** BRepGraph_VertexId::Start ******/
		/****** md5 signature: fc9e9cfb659953f8d767f808052e7c04 ******/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "Return
-------
BRepGraph_VertexId

Description
-----------
First valid id in a dense per-kind sequence.
") Start;
		static BRepGraph_VertexId Start();


%extend{
    bool __ne_wrapper__(BRepGraph_VertexId other) {
        if (*self!=other) return true;
        else return false;
    }
}
%pythoncode {
def __ne__(self, right):
    try:
        return self.__ne_wrapper__(right)
    except:
        return True
}

%extend{
    bool __ne_wrapper__(const BRepGraph_NodeId other) {
        if (*self!=other) return true;
        else return false;
    }
}
%pythoncode {
def __ne__(self, right):
    try:
        return self.__ne_wrapper__(right)
    except:
        return True
}
		/****** BRepGraph_VertexId::operator + ******/
		/****** md5 signature: c69f1fde8a4abf6a73054fa1db2c1fe3 ******/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "
Parameters
----------
theOffset: uint32_t

Return
-------
BRepGraph_VertexId

Description
-----------
Advance by offset.
") operator +;
		BRepGraph_VertexId operator +(const uint32_t theOffset);

		/****** BRepGraph_VertexId::operator - ******/
		/****** md5 signature: 05213caff5555da9f8d7e29a9b6a1930 ******/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "
Parameters
----------
theOffset: uint32_t

Return
-------
BRepGraph_VertexId

Description
-----------
Retreat by offset.
") operator -;
		BRepGraph_VertexId operator -(const uint32_t theOffset);


%extend{
    bool __eq_wrapper__(BRepGraph_VertexId other) {
        if (*self==other) return true;
        else return false;
    }
}
%pythoncode {
def __eq__(self, right):
    try:
        return self.__eq_wrapper__(right)
    except:
        return False
}

%extend{
    bool __eq_wrapper__(const BRepGraph_NodeId other) {
        if (*self==other) return true;
        else return false;
    }
}
%pythoncode {
def __eq__(self, right):
    try:
        return self.__eq_wrapper__(right)
    except:
        return False
}
};


%extend BRepGraph_VertexId {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class BRepGraph_VertexRefId *
******************************/
class BRepGraph_VertexRefId {
	public:
		uint32_t Index;
		/****** BRepGraph_VertexRefId::BRepGraph_VertexRefId ******/
		/****** md5 signature: 4311b88151facb04e31a8f94c612d63e ******/
		%feature("compactdefaultargs") BRepGraph_VertexRefId;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepGraph_VertexRefId;
		 BRepGraph_VertexRefId();

		/****** BRepGraph_VertexRefId::BRepGraph_VertexRefId ******/
		/****** md5 signature: 718adffe00b7c66230abfc0915fac1a6 ******/
		%feature("compactdefaultargs") BRepGraph_VertexRefId;
		%feature("autodoc", "
Parameters
----------
theIdx: uint32_t

Return
-------
None

Description
-----------
No available documentation.
") BRepGraph_VertexRefId;
		 BRepGraph_VertexRefId(const uint32_t theIdx);

		/****** BRepGraph_VertexRefId::BRepGraph_VertexRefId ******/
		/****** md5 signature: 7e80a924fe12a8fa6b68aba27507a9ea ******/
		%feature("compactdefaultargs") BRepGraph_VertexRefId;
		%feature("autodoc", "
Parameters
----------
theRefId: BRepGraph_RefId

Return
-------
None

Description
-----------
Construct from an untyped reference id of the same kind.
") BRepGraph_VertexRefId;
		 BRepGraph_VertexRefId(const BRepGraph_RefId theRefId);

		/****** BRepGraph_VertexRefId::FromRefId ******/
		/****** md5 signature: 2c83b1a5f2a415c6daf522ac4df93236 ******/
		%feature("compactdefaultargs") FromRefId;
		%feature("autodoc", "
Parameters
----------
theRefId: BRepGraph_RefId

Return
-------
BRepGraph_VertexRefId

Description
-----------
No available documentation.
") FromRefId;
		static BRepGraph_VertexRefId FromRefId(const BRepGraph_RefId theRefId);

		/****** BRepGraph_VertexRefId::Invalid ******/
		/****** md5 signature: 19622d4f1c44c5c7e384ccc5986fb8d8 ******/
		%feature("compactdefaultargs") Invalid;
		%feature("autodoc", "Return
-------
BRepGraph_VertexRefId

Description
-----------
Invalid sentinel id.
") Invalid;
		static BRepGraph_VertexRefId Invalid();

		/****** BRepGraph_VertexRefId::IsOwned ******/
		/****** md5 signature: 82162d9fddf9bcd26161cc7f9c342a8b ******/
		%feature("compactdefaultargs") IsOwned;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph

Return
-------
bool

Description
-----------
Return true if this reference entry has an active owner in the given graph.
") IsOwned;
		bool IsOwned(const BRepGraph & theGraph);

		/****** BRepGraph_VertexRefId::IsRemoved ******/
		/****** md5 signature: 75ed1923a75d2c35c92a9683349c6622 ******/
		%feature("compactdefaultargs") IsRemoved;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph

Return
-------
bool

Description
-----------
Return true if this reference entry has been soft-removed in the given graph.
") IsRemoved;
		bool IsRemoved(const BRepGraph & theGraph);

		/****** BRepGraph_VertexRefId::IsValid ******/
		/****** md5 signature: 735088818cf24ebe0ebc7005a507da69 ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsValid;
		bool IsValid();

		/****** BRepGraph_VertexRefId::IsValid ******/
		/****** md5 signature: 294f20297d740c99df23b64d8041b57c ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "
Parameters
----------
theMaxCount: uint32_t

Return
-------
bool

Description
-----------
True if this id points to an allocated slot within [0, theMaxCount). UINT32_MAX (invalid sentinel) always fails this check for any realistic count.
") IsValid;
		bool IsValid(const uint32_t theMaxCount);

		/****** BRepGraph_VertexRefId::Start ******/
		/****** md5 signature: fc9e9cfb659953f8d767f808052e7c04 ******/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "Return
-------
BRepGraph_VertexRefId

Description
-----------
First valid id in a dense per-kind sequence.
") Start;
		static BRepGraph_VertexRefId Start();


%extend{
    bool __ne_wrapper__(BRepGraph_VertexRefId other) {
        if (*self!=other) return true;
        else return false;
    }
}
%pythoncode {
def __ne__(self, right):
    try:
        return self.__ne_wrapper__(right)
    except:
        return True
}

%extend{
    bool __ne_wrapper__(const BRepGraph_RefId other) {
        if (*self!=other) return true;
        else return false;
    }
}
%pythoncode {
def __ne__(self, right):
    try:
        return self.__ne_wrapper__(right)
    except:
        return True
}
		/****** BRepGraph_VertexRefId::operator + ******/
		/****** md5 signature: c69f1fde8a4abf6a73054fa1db2c1fe3 ******/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "
Parameters
----------
theOffset: uint32_t

Return
-------
BRepGraph_VertexRefId

Description
-----------
Advance by offset.
") operator +;
		BRepGraph_VertexRefId operator +(const uint32_t theOffset);

		/****** BRepGraph_VertexRefId::operator - ******/
		/****** md5 signature: 05213caff5555da9f8d7e29a9b6a1930 ******/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "
Parameters
----------
theOffset: uint32_t

Return
-------
BRepGraph_VertexRefId

Description
-----------
Retreat by offset.
") operator -;
		BRepGraph_VertexRefId operator -(const uint32_t theOffset);


%extend{
    bool __eq_wrapper__(BRepGraph_VertexRefId other) {
        if (*self==other) return true;
        else return false;
    }
}
%pythoncode {
def __eq__(self, right):
    try:
        return self.__eq_wrapper__(right)
    except:
        return False
}

%extend{
    bool __eq_wrapper__(const BRepGraph_RefId other) {
        if (*self==other) return true;
        else return false;
    }
}
%pythoncode {
def __eq__(self, right):
    try:
        return self.__eq_wrapper__(right)
    except:
        return False
}
};


%extend BRepGraph_VertexRefId {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class BRepGraph_WireId *
*************************/
class BRepGraph_WireId {
	public:
		uint32_t Index;
		/****** BRepGraph_WireId::BRepGraph_WireId ******/
		/****** md5 signature: 4311b88151facb04e31a8f94c612d63e ******/
		%feature("compactdefaultargs") BRepGraph_WireId;
		%feature("autodoc", "Return
-------
None

Description
-----------
Default: invalid (Index = UINT32_MAX).
") BRepGraph_WireId;
		 BRepGraph_WireId();

		/****** BRepGraph_WireId::BRepGraph_WireId ******/
		/****** md5 signature: 718adffe00b7c66230abfc0915fac1a6 ******/
		%feature("compactdefaultargs") BRepGraph_WireId;
		%feature("autodoc", "
Parameters
----------
theIdx: uint32_t

Return
-------
None

Description
-----------
Construct from index.
") BRepGraph_WireId;
		 BRepGraph_WireId(const uint32_t theIdx);

		/****** BRepGraph_WireId::BRepGraph_WireId ******/
		/****** md5 signature: 06f9543631732e963a42611acebb8a88 ******/
		%feature("compactdefaultargs") BRepGraph_WireId;
		%feature("autodoc", "
Parameters
----------
theId: BRepGraph_NodeId

Return
-------
None

Description
-----------
Construct from an untyped node id of the same kind.
") BRepGraph_WireId;
		 BRepGraph_WireId(const BRepGraph_NodeId theId);

		/****** BRepGraph_WireId::FromNodeId ******/
		/****** md5 signature: 446894b9c1847edab23d1c81f8aa599c ******/
		%feature("compactdefaultargs") FromNodeId;
		%feature("autodoc", "
Parameters
----------
theId: BRepGraph_NodeId

Return
-------
BRepGraph_WireId

Description
-----------
Explicit conversion from untyped NodeId. Asserts that the Kind matches in debug builds. 
Input parameter: theId untyped NodeId to convert.
") FromNodeId;
		static BRepGraph_WireId FromNodeId(const BRepGraph_NodeId theId);

		/****** BRepGraph_WireId::Invalid ******/
		/****** md5 signature: 19622d4f1c44c5c7e384ccc5986fb8d8 ******/
		%feature("compactdefaultargs") Invalid;
		%feature("autodoc", "Return
-------
BRepGraph_WireId

Description
-----------
Invalid sentinel id.
") Invalid;
		static BRepGraph_WireId Invalid();

		/****** BRepGraph_WireId::IsOwned ******/
		/****** md5 signature: 82162d9fddf9bcd26161cc7f9c342a8b ******/
		%feature("compactdefaultargs") IsOwned;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph

Return
-------
bool

Description
-----------
Return true if this node has an active owner in the given graph.
") IsOwned;
		bool IsOwned(const BRepGraph & theGraph);

		/****** BRepGraph_WireId::IsRemoved ******/
		/****** md5 signature: 75ed1923a75d2c35c92a9683349c6622 ******/
		%feature("compactdefaultargs") IsRemoved;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph

Return
-------
bool

Description
-----------
Return true if this node has been soft-removed in the given graph.
") IsRemoved;
		bool IsRemoved(const BRepGraph & theGraph);

		/****** BRepGraph_WireId::IsValid ******/
		/****** md5 signature: 735088818cf24ebe0ebc7005a507da69 ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if this id points to an allocated node slot.
") IsValid;
		bool IsValid();

		/****** BRepGraph_WireId::IsValid ******/
		/****** md5 signature: 294f20297d740c99df23b64d8041b57c ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "
Parameters
----------
theMaxCount: uint32_t

Return
-------
bool

Description
-----------
True if this id points to an allocated slot within [0, theMaxCount). UINT32_MAX (invalid sentinel) always fails this check for any realistic count.
") IsValid;
		bool IsValid(const uint32_t theMaxCount);

		/****** BRepGraph_WireId::Start ******/
		/****** md5 signature: fc9e9cfb659953f8d767f808052e7c04 ******/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "Return
-------
BRepGraph_WireId

Description
-----------
First valid id in a dense per-kind sequence.
") Start;
		static BRepGraph_WireId Start();


%extend{
    bool __ne_wrapper__(BRepGraph_WireId other) {
        if (*self!=other) return true;
        else return false;
    }
}
%pythoncode {
def __ne__(self, right):
    try:
        return self.__ne_wrapper__(right)
    except:
        return True
}

%extend{
    bool __ne_wrapper__(const BRepGraph_NodeId other) {
        if (*self!=other) return true;
        else return false;
    }
}
%pythoncode {
def __ne__(self, right):
    try:
        return self.__ne_wrapper__(right)
    except:
        return True
}
		/****** BRepGraph_WireId::operator + ******/
		/****** md5 signature: c69f1fde8a4abf6a73054fa1db2c1fe3 ******/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "
Parameters
----------
theOffset: uint32_t

Return
-------
BRepGraph_WireId

Description
-----------
Advance by offset.
") operator +;
		BRepGraph_WireId operator +(const uint32_t theOffset);

		/****** BRepGraph_WireId::operator - ******/
		/****** md5 signature: 05213caff5555da9f8d7e29a9b6a1930 ******/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "
Parameters
----------
theOffset: uint32_t

Return
-------
BRepGraph_WireId

Description
-----------
Retreat by offset.
") operator -;
		BRepGraph_WireId operator -(const uint32_t theOffset);


%extend{
    bool __eq_wrapper__(BRepGraph_WireId other) {
        if (*self==other) return true;
        else return false;
    }
}
%pythoncode {
def __eq__(self, right):
    try:
        return self.__eq_wrapper__(right)
    except:
        return False
}

%extend{
    bool __eq_wrapper__(const BRepGraph_NodeId other) {
        if (*self==other) return true;
        else return false;
    }
}
%pythoncode {
def __eq__(self, right):
    try:
        return self.__eq_wrapper__(right)
    except:
        return False
}
};


%extend BRepGraph_WireId {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class BRepGraph_WireRefId *
****************************/
class BRepGraph_WireRefId {
	public:
		uint32_t Index;
		/****** BRepGraph_WireRefId::BRepGraph_WireRefId ******/
		/****** md5 signature: 4311b88151facb04e31a8f94c612d63e ******/
		%feature("compactdefaultargs") BRepGraph_WireRefId;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepGraph_WireRefId;
		 BRepGraph_WireRefId();

		/****** BRepGraph_WireRefId::BRepGraph_WireRefId ******/
		/****** md5 signature: 718adffe00b7c66230abfc0915fac1a6 ******/
		%feature("compactdefaultargs") BRepGraph_WireRefId;
		%feature("autodoc", "
Parameters
----------
theIdx: uint32_t

Return
-------
None

Description
-----------
No available documentation.
") BRepGraph_WireRefId;
		 BRepGraph_WireRefId(const uint32_t theIdx);

		/****** BRepGraph_WireRefId::BRepGraph_WireRefId ******/
		/****** md5 signature: 7e80a924fe12a8fa6b68aba27507a9ea ******/
		%feature("compactdefaultargs") BRepGraph_WireRefId;
		%feature("autodoc", "
Parameters
----------
theRefId: BRepGraph_RefId

Return
-------
None

Description
-----------
Construct from an untyped reference id of the same kind.
") BRepGraph_WireRefId;
		 BRepGraph_WireRefId(const BRepGraph_RefId theRefId);

		/****** BRepGraph_WireRefId::FromRefId ******/
		/****** md5 signature: 2c83b1a5f2a415c6daf522ac4df93236 ******/
		%feature("compactdefaultargs") FromRefId;
		%feature("autodoc", "
Parameters
----------
theRefId: BRepGraph_RefId

Return
-------
BRepGraph_WireRefId

Description
-----------
No available documentation.
") FromRefId;
		static BRepGraph_WireRefId FromRefId(const BRepGraph_RefId theRefId);

		/****** BRepGraph_WireRefId::Invalid ******/
		/****** md5 signature: 19622d4f1c44c5c7e384ccc5986fb8d8 ******/
		%feature("compactdefaultargs") Invalid;
		%feature("autodoc", "Return
-------
BRepGraph_WireRefId

Description
-----------
Invalid sentinel id.
") Invalid;
		static BRepGraph_WireRefId Invalid();

		/****** BRepGraph_WireRefId::IsOwned ******/
		/****** md5 signature: 82162d9fddf9bcd26161cc7f9c342a8b ******/
		%feature("compactdefaultargs") IsOwned;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph

Return
-------
bool

Description
-----------
Return true if this reference entry has an active owner in the given graph.
") IsOwned;
		bool IsOwned(const BRepGraph & theGraph);

		/****** BRepGraph_WireRefId::IsRemoved ******/
		/****** md5 signature: 75ed1923a75d2c35c92a9683349c6622 ******/
		%feature("compactdefaultargs") IsRemoved;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph

Return
-------
bool

Description
-----------
Return true if this reference entry has been soft-removed in the given graph.
") IsRemoved;
		bool IsRemoved(const BRepGraph & theGraph);

		/****** BRepGraph_WireRefId::IsValid ******/
		/****** md5 signature: 735088818cf24ebe0ebc7005a507da69 ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsValid;
		bool IsValid();

		/****** BRepGraph_WireRefId::IsValid ******/
		/****** md5 signature: 294f20297d740c99df23b64d8041b57c ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "
Parameters
----------
theMaxCount: uint32_t

Return
-------
bool

Description
-----------
True if this id points to an allocated slot within [0, theMaxCount). UINT32_MAX (invalid sentinel) always fails this check for any realistic count.
") IsValid;
		bool IsValid(const uint32_t theMaxCount);

		/****** BRepGraph_WireRefId::Start ******/
		/****** md5 signature: fc9e9cfb659953f8d767f808052e7c04 ******/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "Return
-------
BRepGraph_WireRefId

Description
-----------
First valid id in a dense per-kind sequence.
") Start;
		static BRepGraph_WireRefId Start();


%extend{
    bool __ne_wrapper__(BRepGraph_WireRefId other) {
        if (*self!=other) return true;
        else return false;
    }
}
%pythoncode {
def __ne__(self, right):
    try:
        return self.__ne_wrapper__(right)
    except:
        return True
}

%extend{
    bool __ne_wrapper__(const BRepGraph_RefId other) {
        if (*self!=other) return true;
        else return false;
    }
}
%pythoncode {
def __ne__(self, right):
    try:
        return self.__ne_wrapper__(right)
    except:
        return True
}
		/****** BRepGraph_WireRefId::operator + ******/
		/****** md5 signature: c69f1fde8a4abf6a73054fa1db2c1fe3 ******/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "
Parameters
----------
theOffset: uint32_t

Return
-------
BRepGraph_WireRefId

Description
-----------
Advance by offset.
") operator +;
		BRepGraph_WireRefId operator +(const uint32_t theOffset);

		/****** BRepGraph_WireRefId::operator - ******/
		/****** md5 signature: 05213caff5555da9f8d7e29a9b6a1930 ******/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "
Parameters
----------
theOffset: uint32_t

Return
-------
BRepGraph_WireRefId

Description
-----------
Retreat by offset.
") operator -;
		BRepGraph_WireRefId operator -(const uint32_t theOffset);


%extend{
    bool __eq_wrapper__(BRepGraph_WireRefId other) {
        if (*self==other) return true;
        else return false;
    }
}
%pythoncode {
def __eq__(self, right):
    try:
        return self.__eq_wrapper__(right)
    except:
        return False
}

%extend{
    bool __eq_wrapper__(const BRepGraph_RefId other) {
        if (*self==other) return true;
        else return false;
    }
}
%pythoncode {
def __eq__(self, right):
    try:
        return self.__eq_wrapper__(right)
    except:
        return False
}
};


%extend BRepGraph_WireRefId {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************
* class BaseTraits *
*******************/
/******************************
* class ChildOfCompoundTraits *
******************************/
/***************************
* class CoEdgeOfWireTraits *
***************************/
/************************************
* class CompSolidFromSolidRefTraits *
************************************/
/***********************************
* class CompoundFromChildRefTraits *
***********************************/
/**************************************
* class DefTraits<BRepGraph_CoEdgeId> *
**************************************/
/*****************************************
* class DefTraits<BRepGraph_CompSolidId> *
*****************************************/
/****************************************
* class DefTraits<BRepGraph_CompoundId> *
****************************************/
/************************************
* class DefTraits<BRepGraph_EdgeId> *
************************************/
/************************************
* class DefTraits<BRepGraph_FaceId> *
************************************/
/******************************************
* class DefTraits<BRepGraph_OccurrenceId> *
******************************************/
/***************************************
* class DefTraits<BRepGraph_ProductId> *
***************************************/
/*************************************
* class DefTraits<BRepGraph_ShellId> *
*************************************/
/*************************************
* class DefTraits<BRepGraph_SolidId> *
*************************************/
/**************************************
* class DefTraits<BRepGraph_VertexId> *
**************************************/
/************************************
* class DefTraits<BRepGraph_WireId> *
************************************/
/*********************
* class DefsOfParent *
*********************/
/*************************
* class DefsVertexOfEdge *
*************************/
/******************************
* class EdgeOfVertexRefTraits *
******************************/
/*************************
* class EdgeOfWireTraits *
*************************/
/**********************
* class EdgeParentsOf *
**********************/
/*********************************
* class FaceFromEdgeCoEdgeTraits *
*********************************/
/******************************
* class FaceFromWireRefTraits *
******************************/
/**************************
* class FaceOfShellTraits *
**************************/
/******************
* class IdsOfRefs *
******************/
/***************************
* class LookupParentRefsOf *
***************************/
/*******************************************
* class NodeTraits<BRepGraphInc_CoEdgeDef> *
*******************************************/
/**********************************************
* class NodeTraits<BRepGraphInc_CompSolidDef> *
**********************************************/
/*********************************************
* class NodeTraits<BRepGraphInc_CompoundDef> *
*********************************************/
/*****************************************
* class NodeTraits<BRepGraphInc_EdgeDef> *
*****************************************/
/*****************************************
* class NodeTraits<BRepGraphInc_FaceDef> *
*****************************************/
/***********************************************
* class NodeTraits<BRepGraphInc_OccurrenceDef> *
***********************************************/
/********************************************
* class NodeTraits<BRepGraphInc_ProductDef> *
********************************************/
/******************************************
* class NodeTraits<BRepGraphInc_ShellDef> *
******************************************/
/******************************************
* class NodeTraits<BRepGraphInc_SolidDef> *
******************************************/
/*******************************************
* class NodeTraits<BRepGraphInc_VertexDef> *
*******************************************/
/*****************************************
* class NodeTraits<BRepGraphInc_WireDef> *
*****************************************/
/******************************************
* class OccurrenceFromOccurrenceRefTraits *
******************************************/
/**********************************
* class OccurrenceOfProductTraits *
**********************************/
/******************
* class ParentRef *
******************/
/******************
* class ParentsOf *
******************/
/***************************************
* class ProductFromOccurrenceRefTraits *
***************************************/
/********************
* class RefIterator *
********************/
/*****************************************
* class RefTraits<BRepGraphInc_ChildRef> *
*****************************************/
/****************************************
* class RefTraits<BRepGraphInc_FaceRef> *
****************************************/
/**********************************************
* class RefTraits<BRepGraphInc_OccurrenceRef> *
**********************************************/
/*****************************************
* class RefTraits<BRepGraphInc_ShellRef> *
*****************************************/
/*****************************************
* class RefTraits<BRepGraphInc_SolidRef> *
*****************************************/
/******************************************
* class RefTraits<BRepGraphInc_VertexRef> *
******************************************/
/****************************************
* class RefTraits<BRepGraphInc_WireRef> *
****************************************/
/*********************
* class RefsOfParent *
*********************/
/*************************
* class RefsVertexOfEdge *
*************************/
/*******************************
* class ShellFromFaceRefTraits *
*******************************/
/***************************
* class ShellOfSolidTraits *
***************************/
/********************************
* class SolidFromShellRefTraits *
********************************/
/*******************************
* class SolidOfCompSolidTraits *
*******************************/
/*********************************
* class WireFromEdgeCoEdgeTraits *
*********************************/
/********************************
* class WireOfCoEdgeUsageTraits *
********************************/
/*************************
* class WireOfFaceTraits *
*************************/
/************************************
* class std::hash<BRepGraph_ItemId> *
************************************/
/*************************************
* class std::hash<BRepGraph_ItemUID> *
*************************************/
/****************************************************
* class std::hash<BRepGraph_NodeId::Typed<TheKind>> *
****************************************************/
/************************************
* class std::hash<BRepGraph_NodeId> *
************************************/
/***************************************************
* class std::hash<BRepGraph_RefId::Typed<TheKind>> *
***************************************************/
/***********************************
* class std::hash<BRepGraph_RefId> *
***********************************/
/************************************
* class std::hash<BRepGraph_RefUID> *
************************************/
/*********************************
* class std::hash<BRepGraph_UID> *
*********************************/
/***************************************
* class std::hash<BRepGraph_UsagePath> *
***************************************/
/******************************************
* class std::hash<BRepGraph_VersionStamp> *
******************************************/
/************************************
* class BRepGraph_CacheDerivedState *
************************************/
class BRepGraph_CacheDerivedState : public BRepGraph_Cache {
	public:
		/****** BRepGraph_CacheDerivedState::Clear ******/
		/****** md5 signature: 7e973a9c7dbf665f4dcda464d053850b ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears all cached entries.
") Clear;
		void Clear();

		/****** BRepGraph_CacheDerivedState::ComputeEdgeProperties ******/
		/****** md5 signature: 5b51d36008f3885dc54155e10bf8a35c ******/
		%feature("compactdefaultargs") ComputeEdgeProperties;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theEdge: BRepGraph_EdgeId

Return
-------
theIsDegenerated: bool
theIsClosed: bool

Description
-----------
Compute edge-own derived state (Status, IsClosed). SameRange/SameParameter are per-CoEdge - use the per-CoEdge cache directly. 
Input parameter: theGraph source graph 
Input parameter: theEdge edge definition identifier @param[out] theIsDegenerated true if edge is degenerate @param[out] theIsClosed true if edge is closed 
Return: true if computation succeeded.
") ComputeEdgeProperties;
		static bool ComputeEdgeProperties(const BRepGraph & theGraph, BRepGraph_EdgeId theEdge, Standard_Boolean &OutValue, Standard_Boolean &OutValue);

		/****** BRepGraph_CacheDerivedState::ComputeShellIsClosed ******/
		/****** md5 signature: 8d0cc46062eb9a9c14c3561f795fa573 ******/
		%feature("compactdefaultargs") ComputeShellIsClosed;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theShell: BRepGraph_ShellId

Return
-------
bool

Description
-----------
Compute shell closure directly from a BRepGraph without caching. 
Input parameter: theGraph source graph 
Input parameter: theShell shell definition identifier 
Return: true if the shell is closed.
") ComputeShellIsClosed;
		static bool ComputeShellIsClosed(const BRepGraph & theGraph, BRepGraph_ShellId theShell);

		/****** BRepGraph_CacheDerivedState::ComputeWireIsClosed ******/
		/****** md5 signature: b9c70a46ae936e7c88a286d88ade320b ******/
		%feature("compactdefaultargs") ComputeWireIsClosed;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theWire: BRepGraph_WireId

Return
-------
bool

Description
-----------
Compute wire closure directly from a BRepGraph without caching. 
Input parameter: theGraph source graph 
Input parameter: theWire wire definition identifier 
Return: true if the wire is closed.
") ComputeWireIsClosed;
		static bool ComputeWireIsClosed(const BRepGraph & theGraph, BRepGraph_WireId theWire);

		/****** BRepGraph_CacheDerivedState::CopyFreshTo ******/
		/****** md5 signature: 728954de855d437cab6dccfeea39610f ******/
		%feature("compactdefaultargs") CopyFreshTo;
		%feature("autodoc", "
Parameters
----------
theCopy: BRepGraph_CopyRemap

Return
-------
None

Description
-----------
Copy fresh, remappable derived-state entries into the target graph.
") CopyFreshTo;
		void CopyFreshTo(const BRepGraph_CopyRemap & theCopy);

		/****** BRepGraph_CacheDerivedState::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Returns the unique cache service GUID.
") GetID;
		static const Standard_GUID & GetID();

		/****** BRepGraph_CacheDerivedState::GetWireIsClosed ******/
		/****** md5 signature: 7835b841e2f39be4e0c37b0c8c4bc25d ******/
		%feature("compactdefaultargs") GetWireIsClosed;
		%feature("autodoc", "
Parameters
----------
theWire: BRepGraph_WireId

Return
-------
theClosed: bool

Description
-----------
@brief Return wire closure, computing and storing a fresh entry. 
Input parameter: theWire wire definition identifier @param[out] theClosed filled with the fresh derived value 
Return: true if computation succeeded.
") GetWireIsClosed;
		bool GetWireIsClosed(BRepGraph_WireId theWire, Standard_Boolean &OutValue);

		/****** BRepGraph_CacheDerivedState::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Returns the unique cache service GUID.
") ID;
		const Standard_GUID & ID();

		/****** BRepGraph_CacheDerivedState::IsClosed ******/
		/****** md5 signature: 90f14207295b9bf690c397a70d5d33f4 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "
Parameters
----------
theEdge: BRepGraph_EdgeId

Return
-------
bool

Description
-----------
@brief Test if an edge is closed (start vertex == end vertex). Computes and caches only IsClosed. 
Input parameter: theEdge edge definition identifier 
Return: true if the edge is closed.
") IsClosed;
		bool IsClosed(BRepGraph_EdgeId theEdge);

		/****** BRepGraph_CacheDerivedState::IsDegenerated ******/
		/****** md5 signature: 1a6f171294221468cac432e53e10943a ******/
		%feature("compactdefaultargs") IsDegenerated;
		%feature("autodoc", "
Parameters
----------
theEdge: BRepGraph_EdgeId

Return
-------
bool

Description
-----------
@brief Test if an edge is degenerate (no 3D curve and vertex collapse). Computes and caches only Status - does NOT compute SameParameter/SameRange. 
Input parameter: theEdge edge definition identifier 
Return: true if the edge is degenerate.
") IsDegenerated;
		bool IsDegenerated(BRepGraph_EdgeId theEdge);

		/****** BRepGraph_CacheDerivedState::IsShellClosed ******/
		/****** md5 signature: 98897cc19aa00354bb37b69fad0a370f ******/
		%feature("compactdefaultargs") IsShellClosed;
		%feature("autodoc", "
Parameters
----------
theShell: BRepGraph_ShellId

Return
-------
bool

Description
-----------
@brief Test if a shell is closed. 
Input parameter: theShell shell definition identifier 
Return: true if the shell is closed.
") IsShellClosed;
		bool IsShellClosed(BRepGraph_ShellId theShell);

		/****** BRepGraph_CacheDerivedState::Name ******/
		/****** md5 signature: 8a990d6f3d119e50e810cdbe935c270c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns the cache service display name.
") Name;
		const TCollection_AsciiString & Name();

		/****** BRepGraph_CacheDerivedState::SameParameter ******/
		/****** md5 signature: 10a46012e4ac3762ee46ba1937e0d143 ******/
		%feature("compactdefaultargs") SameParameter;
		%feature("autodoc", "
Parameters
----------
theCoEdge: BRepGraph_CoEdgeId

Return
-------
bool

Description
-----------
@brief Test if a single coedge has SameParameter. 
Input parameter: theCoEdge coedge definition identifier 
Return: true if the coedge has SameParameter.
") SameParameter;
		bool SameParameter(BRepGraph_CoEdgeId theCoEdge);

		/****** BRepGraph_CacheDerivedState::SameRange ******/
		/****** md5 signature: 42c75fc3b3fcd8b2426ca1f5b709b410 ******/
		%feature("compactdefaultargs") SameRange;
		%feature("autodoc", "
Parameters
----------
theCoEdge: BRepGraph_CoEdgeId

Return
-------
bool

Description
-----------
@brief Test if a single coedge has SameRange. 
Input parameter: theCoEdge coedge definition identifier 
Return: true if the coedge has SameRange.
") SameRange;
		bool SameRange(BRepGraph_CoEdgeId theCoEdge);

		/****** BRepGraph_CacheDerivedState::SetWireIsClosed ******/
		/****** md5 signature: b9083e12e7b9eb7e211e262f6f3830bc ******/
		%feature("compactdefaultargs") SetWireIsClosed;
		%feature("autodoc", "
Parameters
----------
theWire: BRepGraph_WireId
theClosed: bool

Return
-------
None

Description
-----------
@brief Store a pre-computed wire closure value. 
Input parameter: theWire wire definition identifier 
Input parameter: theClosed pre-computed closure value.
") SetWireIsClosed;
		void SetWireIsClosed(BRepGraph_WireId theWire, bool theClosed);

};


%make_alias(BRepGraph_CacheDerivedState)

%extend BRepGraph_CacheDerivedState {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class BRepGraph_CacheMesh *
****************************/
/******************************
* class BRepGraph_FacesOfEdge *
******************************/
/********************************
* class BRepGraph_LayerDeferred *
********************************/
/*******************************
* class BRepGraph_LayerHistory *
*******************************/
class BRepGraph_LayerHistory : public BRepGraph_Layer {
	public:
/* public enums */
enum class Kind {
	Modified = 0,
	Generated = 1,
	Deleted = 2,
	Replaced = 3,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class Kind(IntEnum):
	Modified = 0
	Generated = 1
	Deleted = 2
	Replaced = 3
Modified = Kind.Modified
Generated = Kind.Generated
Deleted = Kind.Deleted
Replaced = Kind.Replaced
};
/* end python proxy for enums */

		/****** BRepGraph_LayerHistory::BRepGraph_LayerHistory ******/
		/****** md5 signature: cf3ceb8855b473d4792f7a1f3155a6ab ******/
		%feature("compactdefaultargs") BRepGraph_LayerHistory;
		%feature("autodoc", "Return
-------
None

Description
-----------
Default constructor.
") BRepGraph_LayerHistory;
		 BRepGraph_LayerHistory();

		/****** BRepGraph_LayerHistory::Absorb ******/
		/****** md5 signature: 47309f9e88e14bf118e433b25f8dd353 ******/
		%feature("compactdefaultargs") Absorb;
		%feature("autodoc", "
Parameters
----------
theInputs: NCollection_DataMap<TopoDS_Shape, BRepGraph_NodeId, TopTools_ShapeMapHasher>
theOutputs: NCollection_DataMap<TopoDS_Shape, BRepGraph_NodeId, TopTools_ShapeMapHasher>
theSource: BRepTools_History
theOpLabel: str

Return
-------
None

Description
-----------
Import a BRepTools_History into this graph-native history log. //! Iterates @p theInputs, queries @p theSource for Modified / Generated / IsRemoved, translates each TopoDS_Shape image to a NodeId via @p theOutputs, and emits the corresponding records. //! Semantics: - For every input shape whose Modified() list is non-empty: emit a Modified record. - For every input shape whose Generated() list is non-empty: emit a Generated record. - For every input shape with IsRemoved() == true: accumulate into a single Deleted record (IsRemoved takes precedence over Modified/Generated to handle a known OCCT bug where a shape can appear in both the removed set and the generated map). //! Output TopoDS_Shapes that do not appear in @p theOutputs are silently dropped (expected for subshapes merged into a parent compound whose identity is preserved at a higher level). //! 
Input parameter: theInputs TopoDS_Shape -> NodeId for every input subshape that should be tracked 
Input parameter: theOutputs TopoDS_Shape -> NodeId for every subshape added to the graph by this operation (typically from BRepGraph::ShapesView::Add with TrackAddedNodes) 
Input parameter: theSource BRepTools_History from the OCCT algorithm. Null is accepted (no-op). 
Input parameter: theOpLabel record label written into every emitted record.
") Absorb;
		void Absorb(const NCollection_DataMap<TopoDS_Shape, BRepGraph_NodeId, TopTools_ShapeMapHasher> & theInputs, const NCollection_DataMap<TopoDS_Shape, BRepGraph_NodeId, TopTools_ShapeMapHasher> & theOutputs, const opencascade::handle<BRepTools_History> & theSource, TCollection_AsciiString theOpLabel);

		/****** BRepGraph_LayerHistory::Absorb ******/
		/****** md5 signature: 11db2b9a4ff34e55dca1b62da2a5064e ******/
		%feature("compactdefaultargs") Absorb;
		%feature("autodoc", "
Parameters
----------
theInputGraph: BRepGraph
theOutputGraph: BRepGraph
theInputs: NCollection_DataMap<TopoDS_Shape, BRepGraph_NodeId, TopTools_ShapeMapHasher>
theOutputs: NCollection_DataMap<TopoDS_Shape, BRepGraph_NodeId, TopTools_ShapeMapHasher>
theSource: BRepTools_History
theOpLabel: str

Return
-------
None

Description
-----------
Import a BRepTools_History using persistent UIDs from source/result graphs. //! This overload is the canonical bridge for cross-graph algorithms: input shapes are resolved in @p theInputGraph, output shapes are resolved in @p theOutputGraph, and the resulting history is stored by UID.
") Absorb;
		void Absorb(const BRepGraph & theInputGraph, const BRepGraph & theOutputGraph, const NCollection_DataMap<TopoDS_Shape, BRepGraph_NodeId, TopTools_ShapeMapHasher> & theInputs, const NCollection_DataMap<TopoDS_Shape, BRepGraph_NodeId, TopTools_ShapeMapHasher> & theOutputs, const opencascade::handle<BRepTools_History> & theSource, TCollection_AsciiString theOpLabel);

		/****** BRepGraph_LayerHistory::Clear ******/
		/****** md5 signature: 7e973a9c7dbf665f4dcda464d053850b ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clear all records and lookup maps.
") Clear;
		void Clear();

		/****** BRepGraph_LayerHistory::CopyTo ******/
		/****** md5 signature: d4f4c76539d4213a8ce531df2b7ba3c6 ******/
		%feature("compactdefaultargs") CopyTo;
		%feature("autodoc", "
Parameters
----------
theCopy: BRepGraph_CopyRemap

Return
-------
None

Description
-----------
Copy history records whose source items have copied target items.
") CopyTo;
		void CopyTo(const BRepGraph_CopyRemap & theCopy);

		/****** BRepGraph_LayerHistory::DeletedItemUids ******/
		/****** md5 signature: d0b2ab91794b4fb7e4709b7c28b1e167 ******/
		%feature("compactdefaultargs") DeletedItemUids;
		%feature("autodoc", "Return
-------
NCollection_FlatMap<BRepGraph_ItemUID>

Description
-----------
ItemUID-keyed deleted set stored directly in this history.
") DeletedItemUids;
		const NCollection_FlatMap<BRepGraph_ItemUID> & DeletedItemUids();

		/****** BRepGraph_LayerHistory::DeletedNodes ******/
		/****** md5 signature: 135fcec5bbbb1e829b37fbb056d86deb ******/
		%feature("compactdefaultargs") DeletedNodes;
		%feature("autodoc", "Return
-------
NCollection_FlatMap<BRepGraph_NodeId>

Description
-----------
Borrowed access to the full deleted set. 
Return: reference to the deleted-node set.
") DeletedNodes;
		const NCollection_FlatMap<BRepGraph_NodeId> & DeletedNodes();

		/****** BRepGraph_LayerHistory::DeletedUids ******/
		/****** md5 signature: ec3728fe735940fb6c736d7d420ebb19 ******/
		%feature("compactdefaultargs") DeletedUids;
		%feature("autodoc", "Return
-------
NCollection_FlatMap<BRepGraph_UID>

Description
-----------
UID-keyed deleted set stored directly in this history.
") DeletedUids;
		const NCollection_FlatMap<BRepGraph_UID> & DeletedUids();

		/****** BRepGraph_LayerHistory::DeletedUids ******/
		/****** md5 signature: acfb474550f7b455d58d7c81c778b210 ******/
		%feature("compactdefaultargs") DeletedUids;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph

Return
-------
NCollection_LinearVector<BRepGraph_UID >

Description
-----------
UID-keyed convenience: dump the full deleted set as UIDs. 
Input parameter: theGraph graph used to translate NodeId -> UID 
Return: UIDs of all deleted entities (insertion order is not stable).
") DeletedUids;
		NCollection_LinearVector<BRepGraph_UID > DeletedUids(const BRepGraph & theGraph);

		/****** BRepGraph_LayerHistory::FindDerived ******/
		/****** md5 signature: ef7166ef086d6e57e29f124bc8dc8f12 ******/
		%feature("compactdefaultargs") FindDerived;
		%feature("autodoc", "
Parameters
----------
theOriginal: BRepGraph_NodeId

Return
-------
NCollection_LinearVector<BRepGraph_NodeId >

Description
-----------
Walk forwards from an original node to all derived nodes, including both Modified and Generated descendants. Follows the forward maps recursively, collecting every transitively-reachable descendant (intermediate nodes and leaves alike, but not @p theOriginal itself). 
Input parameter: theOriginal node id to trace forward 
Return: all transitively derived node ids in breadth-first order.
") FindDerived;
		NCollection_LinearVector<BRepGraph_NodeId > FindDerived(const BRepGraph_NodeId theOriginal);

		/****** BRepGraph_LayerHistory::FindGenerated ******/
		/****** md5 signature: eb1bb9615e48ed35d6a02df7bb0b14e1 ******/
		%feature("compactdefaultargs") FindGenerated;
		%feature("autodoc", "
Parameters
----------
theOriginal: BRepGraph_NodeId

Return
-------
NCollection_LinearVector<BRepGraph_NodeId> *

Description
-----------
Direct lookup of the Generated images of @p theOriginal, non-recursive. 
Input parameter: theOriginal node id to query 
Return: pointer to the stored vector, or nullptr if @p theOriginal has no Generated record.
") FindGenerated;
		const NCollection_LinearVector<BRepGraph_NodeId> * FindGenerated(const BRepGraph_NodeId theOriginal);

		/****** BRepGraph_LayerHistory::FindGenerated ******/
		/****** md5 signature: 829c965755a7cdad55df6575c3b76f40 ******/
		%feature("compactdefaultargs") FindGenerated;
		%feature("autodoc", "
Parameters
----------
theUID: BRepGraph_UID

Return
-------
NCollection_LinearVector<BRepGraph_UID> *

Description
-----------
UID-keyed Generated images stored directly in this history.
") FindGenerated;
		const NCollection_LinearVector<BRepGraph_UID> * FindGenerated(const BRepGraph_UID & theUID);

		/****** BRepGraph_LayerHistory::FindGenerated ******/
		/****** md5 signature: 95b66ee6d7b8c1fc82ce63b3eb8c4a54 ******/
		%feature("compactdefaultargs") FindGenerated;
		%feature("autodoc", "
Parameters
----------
theUID: BRepGraph_ItemUID

Return
-------
NCollection_LinearVector<BRepGraph_ItemUID> *

Description
-----------
ItemUID-keyed Generated images stored directly in this history.
") FindGenerated;
		const NCollection_LinearVector<BRepGraph_ItemUID> * FindGenerated(const BRepGraph_ItemUID & theUID);

		/****** BRepGraph_LayerHistory::FindGenerated ******/
		/****** md5 signature: 98c5ae93cae51782a1b3920adf8a2d71 ******/
		%feature("compactdefaultargs") FindGenerated;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theUID: BRepGraph_UID

Return
-------
NCollection_LinearVector<BRepGraph_UID >

Description
-----------
UID-keyed convenience: Generated images. See #FindModified for the resolution contract. 
Input parameter: theGraph graph used to translate UID <-> NodeId 
Input parameter: theUID UID of the input entity 
Return: UIDs of the generated images (in record-insertion order).
") FindGenerated;
		NCollection_LinearVector<BRepGraph_UID > FindGenerated(const BRepGraph & theGraph, const BRepGraph_UID & theUID);

		/****** BRepGraph_LayerHistory::FindModified ******/
		/****** md5 signature: b74c9d903196a7654f66227ff147fd1f ******/
		%feature("compactdefaultargs") FindModified;
		%feature("autodoc", "
Parameters
----------
theOriginal: BRepGraph_NodeId

Return
-------
NCollection_LinearVector<BRepGraph_NodeId> *

Description
-----------
Direct lookup of the Modified images of @p theOriginal, non-recursive. 
Input parameter: theOriginal node id to query 
Return: pointer to the stored vector, or nullptr if @p theOriginal has no Modified record (note: nullptr does not imply IsDeleted).
") FindModified;
		const NCollection_LinearVector<BRepGraph_NodeId> * FindModified(const BRepGraph_NodeId theOriginal);

		/****** BRepGraph_LayerHistory::FindModified ******/
		/****** md5 signature: 1138de3c3122879a1c433b70f1eb591f ******/
		%feature("compactdefaultargs") FindModified;
		%feature("autodoc", "
Parameters
----------
theUID: BRepGraph_UID

Return
-------
NCollection_LinearVector<BRepGraph_UID> *

Description
-----------
UID-keyed Modified images stored directly in this history.
") FindModified;
		const NCollection_LinearVector<BRepGraph_UID> * FindModified(const BRepGraph_UID & theUID);

		/****** BRepGraph_LayerHistory::FindModified ******/
		/****** md5 signature: 925ed772ac5e89a417f2ad8fbc18051c ******/
		%feature("compactdefaultargs") FindModified;
		%feature("autodoc", "
Parameters
----------
theUID: BRepGraph_ItemUID

Return
-------
NCollection_LinearVector<BRepGraph_ItemUID> *

Description
-----------
ItemUID-keyed Modified images stored directly in this history.
") FindModified;
		const NCollection_LinearVector<BRepGraph_ItemUID> * FindModified(const BRepGraph_ItemUID & theUID);

		/****** BRepGraph_LayerHistory::FindModified ******/
		/****** md5 signature: 96c8c86e09f3830bb79e433a4ec9edd9 ******/
		%feature("compactdefaultargs") FindModified;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theUID: BRepGraph_UID

Return
-------
NCollection_LinearVector<BRepGraph_UID >

Description
-----------
UID-keyed convenience: Modified images of the input identified by @p theUID, resolved against @p theGraph. Returns an empty vector if the UID cannot be resolved or has no Modified record. 
Input parameter: theGraph graph used to translate UID <-> NodeId 
Input parameter: theUID UID of the input entity 
Return: UIDs of the modified images (in record-insertion order).
") FindModified;
		NCollection_LinearVector<BRepGraph_UID > FindModified(const BRepGraph & theGraph, const BRepGraph_UID & theUID);

		/****** BRepGraph_LayerHistory::FindOriginal ******/
		/****** md5 signature: 8df9f809181e1629b786393660822574 ******/
		%feature("compactdefaultargs") FindOriginal;
		%feature("autodoc", "
Parameters
----------
theModified: BRepGraph_NodeId

Return
-------
BRepGraph_NodeId

Description
-----------
Walk backwards from a modified node to its original. Follows the reverse map recursively until a root is reached. 
Input parameter: theModified node id to trace back 
Return: the root original node id, or theModified itself if not found.
") FindOriginal;
		BRepGraph_NodeId FindOriginal(const BRepGraph_NodeId theModified);

		/****** BRepGraph_LayerHistory::FindOriginals ******/
		/****** md5 signature: fcdf3c5d3a378753e38504c91685ba26 ******/
		%feature("compactdefaultargs") FindOriginals;
		%feature("autodoc", "
Parameters
----------
theDerived: BRepGraph_NodeId

Return
-------
NCollection_LinearVector<BRepGraph_NodeId> *

Description
-----------
Direct lookup of all immediate node origins of @p theDerived. A derived entity can have more than one parent in reconstructive algorithms.
") FindOriginals;
		const NCollection_LinearVector<BRepGraph_NodeId> * FindOriginals(const BRepGraph_NodeId theDerived);

		/****** BRepGraph_LayerHistory::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Stable layer GUID.
") GetID;
		static const Standard_GUID & GetID();

		/****** BRepGraph_LayerHistory::HasKnownInput ******/
		/****** md5 signature: c5526bc4bd6433d439cfb3154a28fca5 ******/
		%feature("compactdefaultargs") HasKnownInput;
		%feature("autodoc", "
Parameters
----------
theUID: BRepGraph_UID

Return
-------
bool

Description
-----------
Test whether @p theUID was registered as an operation input.
") HasKnownInput;
		bool HasKnownInput(const BRepGraph_UID & theUID);

		/****** BRepGraph_LayerHistory::HasKnownInput ******/
		/****** md5 signature: 13e7e535fc47b0b2b6fbb0d4bd8aee18 ******/
		%feature("compactdefaultargs") HasKnownInput;
		%feature("autodoc", "
Parameters
----------
theUID: BRepGraph_ItemUID

Return
-------
bool

Description
-----------
Test whether @p theUID was registered as an operation input.
") HasKnownInput;
		bool HasKnownInput(const BRepGraph_ItemUID & theUID);

		/****** BRepGraph_LayerHistory::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Layer type identity.
") ID;
		const Standard_GUID & ID();

		/****** BRepGraph_LayerHistory::InvalidateAll ******/
		/****** md5 signature: 3a68b77b3f69648640be5b9c8de1cfde ******/
		%feature("compactdefaultargs") InvalidateAll;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clear derived caches by dropping collected history.
") InvalidateAll;
		void InvalidateAll();

		/****** BRepGraph_LayerHistory::IsDeleted ******/
		/****** md5 signature: 152c45ffe2cd13d3f1019e706a5dc845 ******/
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", "
Parameters
----------
theOriginal: BRepGraph_NodeId

Return
-------
bool

Description
-----------
Test whether @p theOriginal was deleted by some recorded operation. 
Input parameter: theOriginal node id to query 
Return: true if @p theOriginal is in the deleted set.
") IsDeleted;
		bool IsDeleted(const BRepGraph_NodeId theOriginal);

		/****** BRepGraph_LayerHistory::IsDeleted ******/
		/****** md5 signature: ed6fa1a0dba407e78b2ba8568f013690 ******/
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", "
Parameters
----------
theUID: BRepGraph_UID

Return
-------
bool

Description
-----------
UID-keyed deletion test stored directly in this history.
") IsDeleted;
		bool IsDeleted(const BRepGraph_UID & theUID);

		/****** BRepGraph_LayerHistory::IsDeleted ******/
		/****** md5 signature: 7b16ff986927cef4da32e23757410734 ******/
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", "
Parameters
----------
theUID: BRepGraph_ItemUID

Return
-------
bool

Description
-----------
ItemUID-keyed deletion test stored directly in this history.
") IsDeleted;
		bool IsDeleted(const BRepGraph_ItemUID & theUID);

		/****** BRepGraph_LayerHistory::IsDeleted ******/
		/****** md5 signature: 468eea92e2fdcb456f24a13f4e75ba9e ******/
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", "
Parameters
----------
theGraph: BRepGraph
theUID: BRepGraph_UID

Return
-------
bool

Description
-----------
UID-keyed convenience: deletion test. 
Input parameter: theGraph graph used to resolve the UID 
Input parameter: theUID UID of the input entity 
Return: true if the resolved NodeId is in the deleted set.
") IsDeleted;
		bool IsDeleted(const BRepGraph & theGraph, const BRepGraph_UID & theUID);

		/****** BRepGraph_LayerHistory::IsEnabled ******/
		/****** md5 signature: 727f3f39b5ce99031de3931462efa9d8 ******/
		%feature("compactdefaultargs") IsEnabled;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Query whether history recording is enabled. 
Return: true if recording is active.
") IsEnabled;
		bool IsEnabled();

		/****** BRepGraph_LayerHistory::Name ******/
		/****** md5 signature: 8a990d6f3d119e50e810cdbe935c270c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Layer display name.
") Name;
		const TCollection_AsciiString & Name();

		/****** BRepGraph_LayerHistory::NbRecords ******/
		/****** md5 signature: fbbd458eed49774b7ebf1b4c4323fc52 ******/
		%feature("compactdefaultargs") NbRecords;
		%feature("autodoc", "Return
-------
size_t

Description
-----------
Number of recorded history events. 
Return: record count.
") NbRecords;
		size_t NbRecords();

		/****** BRepGraph_LayerHistory::OnNodeRemoved ******/
		/****** md5 signature: 86bcf6b1268493ad0098d99fb3799717 ******/
		%feature("compactdefaultargs") OnNodeRemoved;
		%feature("autodoc", "
Parameters
----------
theNode: BRepGraph_NodeId

Return
-------
None

Description
-----------
Layer removal callback. Records pure graph deletions when enabled.
") OnNodeRemoved;
		void OnNodeRemoved(const BRepGraph_NodeId theNode);

		/****** BRepGraph_LayerHistory::Record ******/
		/****** md5 signature: e7487c54b7afb3d4468a68fe3bd8f168 ******/
		%feature("compactdefaultargs") Record;
		%feature("autodoc", "
Parameters
----------
theOpLabel: str
theOriginal: BRepGraph_NodeId
theReplacements: NCollection_Array1<BRepGraph_NodeId>
theKind: BRepGraph_LayerHistory::Kind (optional, default to BRepGraph_LayerHistory::Kind::Modified)

Return
-------
None

Description
-----------
Record a modification: theOriginal was replaced by theReplacements. //! @note When @p theReplacements is empty the record is auto-downgraded to Kind::Deleted and @p theOriginal is added to the deleted set, regardless of @p theKind. Use #RecordDeleted directly for the deletion case to avoid relying on this implicit conversion. 
Input parameter: theOpLabel human-readable operation name 
Input parameter: theOriginal node id before the operation 
Input parameter: theReplacements node ids after the operation 
Input parameter: theKind classification of this record (default Modified).
") Record;
		void Record(TCollection_AsciiString theOpLabel, const BRepGraph_NodeId theOriginal, const NCollection_Array1<BRepGraph_NodeId> & theReplacements, const BRepGraph_LayerHistory::Kind theKind = BRepGraph_LayerHistory::Kind::Modified);

		/****** BRepGraph_LayerHistory::Record ******/
		/****** md5 signature: 1f65d8c318d91807ec4a4c41b41d92de ******/
		%feature("compactdefaultargs") Record;
		%feature("autodoc", "
Parameters
----------
theRecordIdx: size_t

Return
-------
BRepGraph_LayerHistory_Event

Description
-----------
Access a record by index (0-based). 
Input parameter: theRecordIdx zero-based index into the records vector 
Return: the history record at the given index.
") Record;
		const BRepGraph_LayerHistory_Event & Record(const size_t theRecordIdx);

		/****** BRepGraph_LayerHistory::RecordBatch ******/
		/****** md5 signature: 7d684bf9b9e74f16a27771ee0d3fab07 ******/
		%feature("compactdefaultargs") RecordBatch;
		%feature("autodoc", "
Parameters
----------
theOpLabel: str
theOriginals: NCollection_Array1<BRepGraph_NodeId>
theReplacements: NCollection_Array1<BRepGraph_NodeId>
theExtraInfo: str (optional, default to TCollection_AsciiString())
theKind: BRepGraph_LayerHistory::Kind (optional, default to BRepGraph_LayerHistory::Kind::Modified)

Return
-------
None

Description
-----------
Record a batch of 1-to-1 modifications in a single history event. Each original is paired with the replacement at the same logical position. More efficient than calling Record() in a loop: creates one HistoryRecord and updates the per-kind maps with minimal overhead. 
Input parameter: theOpLabel human-readable operation name 
Input parameter: theOriginals node ids before the operation 
Input parameter: theReplacements node ids after the operation (same length) 
Input parameter: theExtraInfo optional diagnostic info stored on the record 
Input parameter: theKind classification of this record (default Modified).
") RecordBatch;
		void RecordBatch(TCollection_AsciiString theOpLabel, const NCollection_Array1<BRepGraph_NodeId> & theOriginals, const NCollection_Array1<BRepGraph_NodeId> & theReplacements, TCollection_AsciiString theExtraInfo = TCollection_AsciiString(), const BRepGraph_LayerHistory::Kind theKind = BRepGraph_LayerHistory::Kind::Modified);

		/****** BRepGraph_LayerHistory::RecordDeleted ******/
		/****** md5 signature: 93d63b0c54a47550ac05f9f23195467f ******/
		%feature("compactdefaultargs") RecordDeleted;
		%feature("autodoc", "
Parameters
----------
theOpLabel: str
theDeleted: NCollection_Array1<BRepGraph_NodeId>

Return
-------
None

Description
-----------
Record that a collection of inputs has been consumed by the operation and has no image in the result. Each input is appended to the deleted set and emits a single audit record with empty replacements. 
Input parameter: theOpLabel human-readable operation name 
Input parameter: theDeleted node ids that have been removed.
") RecordDeleted;
		void RecordDeleted(TCollection_AsciiString theOpLabel, const NCollection_Array1<BRepGraph_NodeId> & theDeleted);

		/****** BRepGraph_LayerHistory::RecordDeletedItemUid ******/
		/****** md5 signature: 1215d4d2fc7758b05b1f8e023b266d9f ******/
		%feature("compactdefaultargs") RecordDeletedItemUid;
		%feature("autodoc", "
Parameters
----------
theOpLabel: str
theDeleted: NCollection_Array1<BRepGraph_ItemUID>

Return
-------
None

Description
-----------
Record ItemUID-keyed deletions.
") RecordDeletedItemUid;
		void RecordDeletedItemUid(TCollection_AsciiString theOpLabel, const NCollection_Array1<BRepGraph_ItemUID> & theDeleted);

		/****** BRepGraph_LayerHistory::RecordDeletedUid ******/
		/****** md5 signature: 8901608ce2891497c477474ec7800443 ******/
		%feature("compactdefaultargs") RecordDeletedUid;
		%feature("autodoc", "
Parameters
----------
theOpLabel: str
theDeleted: NCollection_Array1<BRepGraph_UID>

Return
-------
None

Description
-----------
Record UID-keyed deletions.
") RecordDeletedUid;
		void RecordDeletedUid(TCollection_AsciiString theOpLabel, const NCollection_Array1<BRepGraph_UID> & theDeleted);

		/****** BRepGraph_LayerHistory::RecordItemUid ******/
		/****** md5 signature: 0907f20f5b7b9ffd06866d6b398ea699 ******/
		%feature("compactdefaultargs") RecordItemUid;
		%feature("autodoc", "
Parameters
----------
theOpLabel: str
theOriginal: BRepGraph_ItemUID
theReplacements: NCollection_Array1<BRepGraph_ItemUID>
theKind: BRepGraph_LayerHistory::Kind (optional, default to BRepGraph_LayerHistory::Kind::Modified)

Return
-------
None

Description
-----------
Record an all-domain ItemUID-keyed modification/generation event.
") RecordItemUid;
		void RecordItemUid(TCollection_AsciiString theOpLabel, const BRepGraph_ItemUID & theOriginal, const NCollection_Array1<BRepGraph_ItemUID> & theReplacements, const BRepGraph_LayerHistory::Kind theKind = BRepGraph_LayerHistory::Kind::Modified);

		/****** BRepGraph_LayerHistory::RecordReplaced ******/
		/****** md5 signature: 0272a7fff9bcef8860abe5e7ab5a6b52 ******/
		%feature("compactdefaultargs") RecordReplaced;
		%feature("autodoc", "
Parameters
----------
theOpLabel: str
theOriginal: BRepGraph_NodeId
theReplacement: BRepGraph_NodeId

Return
-------
None

Description
-----------
Record replacements: each original is logically removed/detached and continued by the corresponding replacement. Replaced records participate in modified-image queries and also mark originals as deleted.
") RecordReplaced;
		void RecordReplaced(TCollection_AsciiString theOpLabel, const BRepGraph_NodeId theOriginal, const BRepGraph_NodeId theReplacement);

		/****** BRepGraph_LayerHistory::RecordReplacedBatch ******/
		/****** md5 signature: f4216e0aff45983e4ca0b7f6ececab6b ******/
		%feature("compactdefaultargs") RecordReplacedBatch;
		%feature("autodoc", "
Parameters
----------
theOpLabel: str
theOriginals: NCollection_Array1<BRepGraph_NodeId>
theReplacements: NCollection_Array1<BRepGraph_NodeId>
theExtraInfo: str (optional, default to TCollection_AsciiString())

Return
-------
None

Description
-----------
Record a batch of 1-to-1 replacements in a single history event.
") RecordReplacedBatch;
		void RecordReplacedBatch(TCollection_AsciiString theOpLabel, const NCollection_Array1<BRepGraph_NodeId> & theOriginals, const NCollection_Array1<BRepGraph_NodeId> & theReplacements, TCollection_AsciiString theExtraInfo = TCollection_AsciiString());

		/****** BRepGraph_LayerHistory::RecordUid ******/
		/****** md5 signature: 8994392c017bf828d7d66b22c2e08503 ******/
		%feature("compactdefaultargs") RecordUid;
		%feature("autodoc", "
Parameters
----------
theOpLabel: str
theOriginal: BRepGraph_UID
theReplacements: NCollection_Array1<BRepGraph_UID>
theKind: BRepGraph_LayerHistory::Kind (optional, default to BRepGraph_LayerHistory::Kind::Modified)

Return
-------
None

Description
-----------
Record a UID-keyed modification/generation event. //! This is the durable-history path for operations whose source and result identities may live in different BRepGraph instances. Existing NodeId records remain available for in-graph algorithms; UID records are queried directly by cross-graph consumers.
") RecordUid;
		void RecordUid(TCollection_AsciiString theOpLabel, const BRepGraph_UID & theOriginal, const NCollection_Array1<BRepGraph_UID> & theReplacements, const BRepGraph_LayerHistory::Kind theKind = BRepGraph_LayerHistory::Kind::Modified);

		/****** BRepGraph_LayerHistory::SetEnabled ******/
		/****** md5 signature: a4de233134b2820fc331fa7d7136c710 ******/
		%feature("compactdefaultargs") SetEnabled;
		%feature("autodoc", "
Parameters
----------
theVal: bool

Return
-------
None

Description
-----------
Enable or disable history recording. 
Input parameter: theVal true to enable, false to disable.
") SetEnabled;
		void SetEnabled(const bool theVal);

};


%make_alias(BRepGraph_LayerHistory)

%extend BRepGraph_LayerHistory {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class BRepGraph_LayerLock *
****************************/
class BRepGraph_LayerLock : public BRepGraph_Layer {
	public:
		/****** BRepGraph_LayerLock::BRepGraph_LayerLock ******/
		/****** md5 signature: fc6a68eefd5819141d3abdf0f7a45584 ******/
		%feature("compactdefaultargs") BRepGraph_LayerLock;
		%feature("autodoc", "Return
-------
None

Description
-----------
Create lock-owner storage.
") BRepGraph_LayerLock;
		 BRepGraph_LayerLock();

		/****** BRepGraph_LayerLock::Clear ******/
		/****** md5 signature: 7e973a9c7dbf665f4dcda464d053850b ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Clear;
		void Clear();

		/****** BRepGraph_LayerLock::CopyTo ******/
		/****** md5 signature: d4f4c76539d4213a8ce531df2b7ba3c6 ******/
		%feature("compactdefaultargs") CopyTo;
		%feature("autodoc", "
Parameters
----------
theCopy: BRepGraph_CopyRemap

Return
-------
None

Description
-----------
No available documentation.
") CopyTo;
		void CopyTo(const BRepGraph_CopyRemap & theCopy);

		/****** BRepGraph_LayerLock::FindOwnerId ******/
		/****** md5 signature: 5de8032522e86a509ce7b901699be37e ******/
		%feature("compactdefaultargs") FindOwnerId;
		%feature("autodoc", "
Parameters
----------
theItem: BRepGraph_ItemId
theOwnerId: Standard_GUID

Return
-------
bool

Description
-----------
Return owner ID for an item. Traverses upward for nodes/refs to find the root owner entry. 
Return: true when the item has a resolved owner and @p theOwnerId was filled.
") FindOwnerId;
		bool FindOwnerId(const BRepGraph_ItemId theItem, Standard_GUID & theOwnerId);

		/****** BRepGraph_LayerLock::FindOwnerId ******/
		/****** md5 signature: 833e2f45876b04c9dde6826b906c86ec ******/
		%feature("compactdefaultargs") FindOwnerId;
		%feature("autodoc", "
Parameters
----------
theNode: BRepGraph_NodeId
theOwnerId: Standard_GUID

Return
-------
bool

Description
-----------
Return owner ID for a node.
") FindOwnerId;
		bool FindOwnerId(const BRepGraph_NodeId theNode, Standard_GUID & theOwnerId);

		/****** BRepGraph_LayerLock::FindOwnerId ******/
		/****** md5 signature: 92f5b052b5b5bc5f800613e8327207e8 ******/
		%feature("compactdefaultargs") FindOwnerId;
		%feature("autodoc", "
Parameters
----------
theRef: BRepGraph_RefId
theOwnerId: Standard_GUID

Return
-------
bool

Description
-----------
Return owner ID for a reference.
") FindOwnerId;
		bool FindOwnerId(const BRepGraph_RefId theRef, Standard_GUID & theOwnerId);

		/****** BRepGraph_LayerLock::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Return fixed layer type GUID.
") GetID;
		static const Standard_GUID & GetID();

		/****** BRepGraph_LayerLock::HasOwner ******/
		/****** md5 signature: b9073a57f06bc1c5d9b47967e50864b3 ******/
		%feature("compactdefaultargs") HasOwner;
		%feature("autodoc", "
Parameters
----------
theItem: BRepGraph_ItemId

Return
-------
bool

Description
-----------
Return true if an item's IsOwned bit-flag is set. This is an O(1) check. Use FindOwnerId() to resolve the actual owner GUID.
") HasOwner;
		bool HasOwner(const BRepGraph_ItemId theItem);

		/****** BRepGraph_LayerLock::HasOwner ******/
		/****** md5 signature: 2d8ea04f6ebef0afe7238fca2dff4e4c ******/
		%feature("compactdefaultargs") HasOwner;
		%feature("autodoc", "
Parameters
----------
theNode: BRepGraph_NodeId

Return
-------
bool

Description
-----------
Return true if a node's IsOwned bit-flag is set.
") HasOwner;
		bool HasOwner(const BRepGraph_NodeId theNode);

		/****** BRepGraph_LayerLock::HasOwner ******/
		/****** md5 signature: ed17f80ffb1db92228285f38820e87a8 ******/
		%feature("compactdefaultargs") HasOwner;
		%feature("autodoc", "
Parameters
----------
theRef: BRepGraph_RefId

Return
-------
bool

Description
-----------
Return true if a reference's IsOwned bit-flag is set.
") HasOwner;
		bool HasOwner(const BRepGraph_RefId theRef);

		/****** BRepGraph_LayerLock::HasOwners ******/
		/****** md5 signature: f6d8a5778796bf0164e443ba1821acd5 ******/
		%feature("compactdefaultargs") HasOwners;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true if at least one root entry exists.
") HasOwners;
		bool HasOwners();

		/****** BRepGraph_LayerLock::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Return this layer type GUID.
") ID;
		const Standard_GUID & ID();

		/****** BRepGraph_LayerLock::InvalidateAll ******/
		/****** md5 signature: 3a68b77b3f69648640be5b9c8de1cfde ******/
		%feature("compactdefaultargs") InvalidateAll;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") InvalidateAll;
		void InvalidateAll();

		/****** BRepGraph_LayerLock::Name ******/
		/****** md5 signature: 8a990d6f3d119e50e810cdbe935c270c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") Name;
		const TCollection_AsciiString & Name();

		/****** BRepGraph_LayerLock::OnNodeRemoved ******/
		/****** md5 signature: 86bcf6b1268493ad0098d99fb3799717 ******/
		%feature("compactdefaultargs") OnNodeRemoved;
		%feature("autodoc", "
Parameters
----------
theNode: BRepGraph_NodeId

Return
-------
None

Description
-----------
No available documentation.
") OnNodeRemoved;
		void OnNodeRemoved(const BRepGraph_NodeId theNode);

		/****** BRepGraph_LayerLock::OnNodeReplaced ******/
		/****** md5 signature: 68d22b4bf33b9bd38cd5a00f27d11881 ******/
		%feature("compactdefaultargs") OnNodeReplaced;
		%feature("autodoc", "
Parameters
----------
theOldNode: BRepGraph_NodeId
theNewNode: BRepGraph_NodeId

Return
-------
None

Description
-----------
No available documentation.
") OnNodeReplaced;
		void OnNodeReplaced(const BRepGraph_NodeId theOldNode, const BRepGraph_NodeId theNewNode);

		/****** BRepGraph_LayerLock::OnRefRemoved ******/
		/****** md5 signature: 8a156fdcb2e95bd73276f8791b23e5aa ******/
		%feature("compactdefaultargs") OnRefRemoved;
		%feature("autodoc", "
Parameters
----------
theRef: BRepGraph_RefId

Return
-------
None

Description
-----------
No available documentation.
") OnRefRemoved;
		void OnRefRemoved(const BRepGraph_RefId theRef);

		/****** BRepGraph_LayerLock::ReserveOwners ******/
		/****** md5 signature: 93f3cb1b564c45b42f3671e92e8dcbd9 ******/
		%feature("compactdefaultargs") ReserveOwners;
		%feature("autodoc", "
Parameters
----------
theNbOwners: size_t

Return
-------
None

Description
-----------
Reserve owner map buckets for bulk registration.
") ReserveOwners;
		void ReserveOwners(const size_t theNbOwners);

		/****** BRepGraph_LayerLock::SetOwner ******/
		/****** md5 signature: be2b581ad6acaf17a473aa30d51b4374 ******/
		%feature("compactdefaultargs") SetOwner;
		%feature("autodoc", "
Parameters
----------
theItem: BRepGraph_ItemId
theOwnerId: Standard_GUID

Return
-------
None

Description
-----------
Register an owner ID and set the graph item's ownership flag. For nodes, propagates the IsOwned bit-flag to all descendants. Rejects if the item is already covered by an ancestor root with a different GUID.
") SetOwner;
		void SetOwner(const BRepGraph_ItemId theItem, const Standard_GUID & theOwnerId);

		/****** BRepGraph_LayerLock::SetOwner ******/
		/****** md5 signature: 5276b4f65386778b3e0925f53d84ee1a ******/
		%feature("compactdefaultargs") SetOwner;
		%feature("autodoc", "
Parameters
----------
theItem: BRepGraph_ItemId
theOwnerId: Standard_GUID
theToUpdateRevision: bool

Return
-------
bool

Description
-----------
Register an owner ID and set the graph item's ownership flag. Returns true when owner storage changed. Revision update can be deferred by bulk callers.
") SetOwner;
		bool SetOwner(const BRepGraph_ItemId theItem, const Standard_GUID & theOwnerId, const bool theToUpdateRevision);

		/****** BRepGraph_LayerLock::SetOwner ******/
		/****** md5 signature: 673af6168e396de46421b71cb3f154dd ******/
		%feature("compactdefaultargs") SetOwner;
		%feature("autodoc", "
Parameters
----------
theNode: BRepGraph_NodeId
theOwnerId: Standard_GUID

Return
-------
None

Description
-----------
Register an owner ID and set the node ownership flag.
") SetOwner;
		void SetOwner(const BRepGraph_NodeId theNode, const Standard_GUID & theOwnerId);

		/****** BRepGraph_LayerLock::SetOwner ******/
		/****** md5 signature: c0c133f4904bfc50a91acb94e15ca405 ******/
		%feature("compactdefaultargs") SetOwner;
		%feature("autodoc", "
Parameters
----------
theRef: BRepGraph_RefId
theOwnerId: Standard_GUID

Return
-------
None

Description
-----------
Register an owner ID and set the reference ownership flag.
") SetOwner;
		void SetOwner(const BRepGraph_RefId theRef, const Standard_GUID & theOwnerId);

		/****** BRepGraph_LayerLock::TouchOwners ******/
		/****** md5 signature: 3c370918d47a4ad0c09966ab5da18382 ******/
		%feature("compactdefaultargs") TouchOwners;
		%feature("autodoc", "Return
-------
None

Description
-----------
Mark owner metadata changed after a bulk update.
") TouchOwners;
		void TouchOwners();

		/****** BRepGraph_LayerLock::UnsetOwner ******/
		/****** md5 signature: 7dd3b93252b9ca2e22a0df122d13f3a9 ******/
		%feature("compactdefaultargs") UnsetOwner;
		%feature("autodoc", "
Parameters
----------
theItem: BRepGraph_ItemId

Return
-------
None

Description
-----------
Remove an owner and clear the graph item's ownership flag. For node roots, clears the IsOwned bit-flag on all descendants.
") UnsetOwner;
		void UnsetOwner(const BRepGraph_ItemId theItem);

		/****** BRepGraph_LayerLock::UnsetOwner ******/
		/****** md5 signature: 6c03cd362627e8f6c9bbd8687cefb99d ******/
		%feature("compactdefaultargs") UnsetOwner;
		%feature("autodoc", "
Parameters
----------
theItem: BRepGraph_ItemId
theOwnerId: Standard_GUID

Return
-------
None

Description
-----------
Remove an owner and clear the graph item's ownership flag if owner ID matches.
") UnsetOwner;
		void UnsetOwner(const BRepGraph_ItemId theItem, const Standard_GUID & theOwnerId);

		/****** BRepGraph_LayerLock::UnsetOwner ******/
		/****** md5 signature: 697e683f01a65b2f6e684e28306e9802 ******/
		%feature("compactdefaultargs") UnsetOwner;
		%feature("autodoc", "
Parameters
----------
theNode: BRepGraph_NodeId

Return
-------
None

Description
-----------
Remove an owner and clear the node ownership flag.
") UnsetOwner;
		void UnsetOwner(const BRepGraph_NodeId theNode);

		/****** BRepGraph_LayerLock::UnsetOwner ******/
		/****** md5 signature: 0879cacd44d732b75b28ad82c98fd41f ******/
		%feature("compactdefaultargs") UnsetOwner;
		%feature("autodoc", "
Parameters
----------
theRef: BRepGraph_RefId

Return
-------
None

Description
-----------
Remove an owner and clear the reference ownership flag.
") UnsetOwner;
		void UnsetOwner(const BRepGraph_RefId theRef);

};


%make_alias(BRepGraph_LayerLock)

%extend BRepGraph_LayerLock {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class BRepGraph_LayerParametric *
**********************************/
%nodefaultctor BRepGraph_LayerParametric;
class BRepGraph_LayerParametric : public BRepGraph_Layer {
	public:
/* public enums */
enum class GenerationFlag {
	Topology = 1,
	Geometry = 2,
	Mesh = 4,
};

enum class MeshQuality {
	VeryCoarse = 0,
	Coarse = 1,
	Medium = 2,
	Fine = 3,
	VeryFine = 4,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class GenerationFlag(IntEnum):
	Topology = 1
	Geometry = 2
	Mesh = 4
Topology = GenerationFlag.Topology
Geometry = GenerationFlag.Geometry
Mesh = GenerationFlag.Mesh

class MeshQuality(IntEnum):
	VeryCoarse = 0
	Coarse = 1
	Medium = 2
	Fine = 3
	VeryFine = 4
VeryCoarse = MeshQuality.VeryCoarse
Coarse = MeshQuality.Coarse
Medium = MeshQuality.Medium
Fine = MeshQuality.Fine
VeryFine = MeshQuality.VeryFine
};
/* end python proxy for enums */

		/****** BRepGraph_LayerParametric::GenerationMask ******/
		/****** md5 signature: 3b067693c7e9155baa08cbd43b8fa214 ******/
		%feature("compactdefaultargs") GenerationMask;
		%feature("autodoc", "
Parameters
----------
theFlag: GenerationFlag

Return
-------
uint32_t

Description
-----------
Convert one generation flag into its bit-mask value. 
Input parameter: theFlag generation flag to convert 
Return: bit-mask value for the requested generation flag.
") GenerationMask;
		static uint32_t GenerationMask(GenerationFlag theFlag);

		/****** BRepGraph_LayerParametric::HasGenerationFlag ******/
		/****** md5 signature: 52872adf543286b2ac7934a13f19f0f1 ******/
		%feature("compactdefaultargs") HasGenerationFlag;
		%feature("autodoc", "
Parameters
----------
theFlags: uint32_t
theFlag: GenerationFlag

Return
-------
bool

Description
-----------
Return true when the flag mask contains the requested generation flag. 
Input parameter: theFlags generation mask built from GenerationFlag bits 
Input parameter: theFlag generation flag to test 
Return: true when the flag is present in the mask.
") HasGenerationFlag;
		static bool HasGenerationFlag(const uint32_t theFlags, GenerationFlag theFlag);

		/****** BRepGraph_LayerParametric::MeshQualityValue ******/
		/****** md5 signature: 9a222e2719cc6e3d3f31e7a9905b3a9f ******/
		%feature("compactdefaultargs") MeshQualityValue;
		%feature("autodoc", "
Parameters
----------
theQuality: MeshQuality
theVeryCoarse: uint32_t
theCoarse: uint32_t
theMedium: uint32_t
theFine: uint32_t
theVeryFine: uint32_t

Return
-------
uint32_t

Description
-----------
Select one integer value from a mesh-quality ladder. 
Input parameter: theQuality requested shared mesh quality 
Input parameter: theVeryCoarse value for MeshQuality::VeryCoarse 
Input parameter: theCoarse value for MeshQuality::Coarse 
Input parameter: theMedium value for MeshQuality::Medium 
Input parameter: theFine value for MeshQuality::Fine 
Input parameter: theVeryFine value for MeshQuality::VeryFine 
Return: selected value for the requested quality.
") MeshQualityValue;
		static uint32_t MeshQualityValue(MeshQuality theQuality, const uint32_t theVeryCoarse, const uint32_t theCoarse, const uint32_t theMedium, const uint32_t theFine, const uint32_t theVeryFine);

};


%make_alias(BRepGraph_LayerParametric)

%extend BRepGraph_LayerParametric {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class BRepGraph_LayerTopoSupplement *
**************************************/
/******************************
* class BRepGraph_WiresOfEdge *
******************************/
/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class BRepGraph_LayerDeferred:
	pass

@classnotwrapped
class BRepGraph_CacheMesh:
	pass

@classnotwrapped
class BRepGraph_LayerTopoSupplement:
	pass

@classnotwrapped
class BRepGraph_Data:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def BRepGraph_ChildRefId_FromRefId(*args):
	return BRepGraph_ChildRefId.FromRefId(*args)

@deprecated
def BRepGraph_ChildRefId_Invalid(*args):
	return BRepGraph_ChildRefId.Invalid(*args)

@deprecated
def BRepGraph_ChildRefId_Start(*args):
	return BRepGraph_ChildRefId.Start(*args)

@deprecated
def BRepGraph_CoEdgeId_FromNodeId(*args):
	return BRepGraph_CoEdgeId.FromNodeId(*args)

@deprecated
def BRepGraph_CoEdgeId_Invalid(*args):
	return BRepGraph_CoEdgeId.Invalid(*args)

@deprecated
def BRepGraph_CoEdgeId_Start(*args):
	return BRepGraph_CoEdgeId.Start(*args)

@deprecated
def BRepGraph_CompSolidId_FromNodeId(*args):
	return BRepGraph_CompSolidId.FromNodeId(*args)

@deprecated
def BRepGraph_CompSolidId_Invalid(*args):
	return BRepGraph_CompSolidId.Invalid(*args)

@deprecated
def BRepGraph_CompSolidId_Start(*args):
	return BRepGraph_CompSolidId.Start(*args)

@deprecated
def BRepGraph_Compact_Perform(*args):
	return BRepGraph_Compact.Perform(*args)

@deprecated
def BRepGraph_Compact_Perform(*args):
	return BRepGraph_Compact.Perform(*args)

@deprecated
def BRepGraph_CompoundId_FromNodeId(*args):
	return BRepGraph_CompoundId.FromNodeId(*args)

@deprecated
def BRepGraph_CompoundId_Invalid(*args):
	return BRepGraph_CompoundId.Invalid(*args)

@deprecated
def BRepGraph_CompoundId_Start(*args):
	return BRepGraph_CompoundId.Start(*args)

@deprecated
def BRepGraph_Copy_CopyNode(*args):
	return BRepGraph_Copy.CopyNode(*args)

@deprecated
def BRepGraph_Copy_Perform(*args):
	return BRepGraph_Copy.Perform(*args)

@deprecated
def BRepGraph_Deduplicate_Perform(*args):
	return BRepGraph_Deduplicate.Perform(*args)

@deprecated
def BRepGraph_Deduplicate_Perform(*args):
	return BRepGraph_Deduplicate.Perform(*args)

@deprecated
def BRepGraph_EdgeId_FromNodeId(*args):
	return BRepGraph_EdgeId.FromNodeId(*args)

@deprecated
def BRepGraph_EdgeId_Invalid(*args):
	return BRepGraph_EdgeId.Invalid(*args)

@deprecated
def BRepGraph_EdgeId_Start(*args):
	return BRepGraph_EdgeId.Start(*args)

@deprecated
def BRepGraph_FaceId_FromNodeId(*args):
	return BRepGraph_FaceId.FromNodeId(*args)

@deprecated
def BRepGraph_FaceId_Invalid(*args):
	return BRepGraph_FaceId.Invalid(*args)

@deprecated
def BRepGraph_FaceId_Start(*args):
	return BRepGraph_FaceId.Start(*args)

@deprecated
def BRepGraph_FaceRefId_FromRefId(*args):
	return BRepGraph_FaceRefId.FromRefId(*args)

@deprecated
def BRepGraph_FaceRefId_Invalid(*args):
	return BRepGraph_FaceRefId.Invalid(*args)

@deprecated
def BRepGraph_FaceRefId_Start(*args):
	return BRepGraph_FaceRefId.Start(*args)

@deprecated
def BRepGraph_ItemUID_Invalid(*args):
	return BRepGraph_ItemUID.Invalid(*args)

@deprecated
def BRepGraph_ItemUID_Node(*args):
	return BRepGraph_ItemUID.Node(*args)

@deprecated
def BRepGraph_ItemUID_Reference(*args):
	return BRepGraph_ItemUID.Reference(*args)

@deprecated
def BRepGraph_Layer_KindBit(*args):
	return BRepGraph_Layer.KindBit(*args)

@deprecated
def BRepGraph_Layer_RefKindBit(*args):
	return BRepGraph_Layer.RefKindBit(*args)

@deprecated
def BRepGraph_NodeId_Invalid(*args):
	return BRepGraph_NodeId.Invalid(*args)

@deprecated
def BRepGraph_NodeId_IsAssemblyKind(*args):
	return BRepGraph_NodeId.IsAssemblyKind(*args)

@deprecated
def BRepGraph_NodeId_IsTopologyKind(*args):
	return BRepGraph_NodeId.IsTopologyKind(*args)

@deprecated
def BRepGraph_NodeId_IsValidKind(*args):
	return BRepGraph_NodeId.IsValidKind(*args)

@deprecated
def BRepGraph_NodeId_Start(*args):
	return BRepGraph_NodeId.Start(*args)

@deprecated
def BRepGraph_OccurrenceId_FromNodeId(*args):
	return BRepGraph_OccurrenceId.FromNodeId(*args)

@deprecated
def BRepGraph_OccurrenceId_Invalid(*args):
	return BRepGraph_OccurrenceId.Invalid(*args)

@deprecated
def BRepGraph_OccurrenceId_Start(*args):
	return BRepGraph_OccurrenceId.Start(*args)

@deprecated
def BRepGraph_OccurrenceRefId_FromRefId(*args):
	return BRepGraph_OccurrenceRefId.FromRefId(*args)

@deprecated
def BRepGraph_OccurrenceRefId_Invalid(*args):
	return BRepGraph_OccurrenceRefId.Invalid(*args)

@deprecated
def BRepGraph_OccurrenceRefId_Start(*args):
	return BRepGraph_OccurrenceRefId.Start(*args)

@deprecated
def BRepGraph_ParallelPolicy_IsParallelAllowed(*args):
	return BRepGraph_ParallelPolicy.IsParallelAllowed(*args)

@deprecated
def BRepGraph_ParallelPolicy_ShouldRun(*args):
	return BRepGraph_ParallelPolicy.ShouldRun(*args)

@deprecated
def BRepGraph_ParallelPolicy_ShouldRun(*args):
	return BRepGraph_ParallelPolicy.ShouldRun(*args)

@deprecated
def BRepGraph_ParallelPolicy_WorkerCount(*args):
	return BRepGraph_ParallelPolicy.WorkerCount(*args)

@deprecated
def BRepGraph_ProductId_FromNodeId(*args):
	return BRepGraph_ProductId.FromNodeId(*args)

@deprecated
def BRepGraph_ProductId_Invalid(*args):
	return BRepGraph_ProductId.Invalid(*args)

@deprecated
def BRepGraph_ProductId_Start(*args):
	return BRepGraph_ProductId.Start(*args)

@deprecated
def BRepGraph_RefId_Invalid(*args):
	return BRepGraph_RefId.Invalid(*args)

@deprecated
def BRepGraph_RefId_IsTopologyRefKind(*args):
	return BRepGraph_RefId.IsTopologyRefKind(*args)

@deprecated
def BRepGraph_RefId_IsValidKind(*args):
	return BRepGraph_RefId.IsValidKind(*args)

@deprecated
def BRepGraph_RefId_Start(*args):
	return BRepGraph_RefId.Start(*args)

@deprecated
def BRepGraph_RefUID_Invalid(*args):
	return BRepGraph_RefUID.Invalid(*args)

@deprecated
def BRepGraph_ShellId_FromNodeId(*args):
	return BRepGraph_ShellId.FromNodeId(*args)

@deprecated
def BRepGraph_ShellId_Invalid(*args):
	return BRepGraph_ShellId.Invalid(*args)

@deprecated
def BRepGraph_ShellId_Start(*args):
	return BRepGraph_ShellId.Start(*args)

@deprecated
def BRepGraph_ShellRefId_FromRefId(*args):
	return BRepGraph_ShellRefId.FromRefId(*args)

@deprecated
def BRepGraph_ShellRefId_Invalid(*args):
	return BRepGraph_ShellRefId.Invalid(*args)

@deprecated
def BRepGraph_ShellRefId_Start(*args):
	return BRepGraph_ShellRefId.Start(*args)

@deprecated
def BRepGraph_SolidId_FromNodeId(*args):
	return BRepGraph_SolidId.FromNodeId(*args)

@deprecated
def BRepGraph_SolidId_Invalid(*args):
	return BRepGraph_SolidId.Invalid(*args)

@deprecated
def BRepGraph_SolidId_Start(*args):
	return BRepGraph_SolidId.Start(*args)

@deprecated
def BRepGraph_SolidRefId_FromRefId(*args):
	return BRepGraph_SolidRefId.FromRefId(*args)

@deprecated
def BRepGraph_SolidRefId_Invalid(*args):
	return BRepGraph_SolidRefId.Invalid(*args)

@deprecated
def BRepGraph_SolidRefId_Start(*args):
	return BRepGraph_SolidRefId.Start(*args)

@deprecated
def BRepGraph_Tool_CoEdge_EdgeOf(*args):
	return BRepGraph_Tool_CoEdge.EdgeOf(*args)

@deprecated
def BRepGraph_Tool_CoEdge_FaceOf(*args):
	return BRepGraph_Tool_CoEdge.FaceOf(*args)

@deprecated
def BRepGraph_Tool_CoEdge_HasPCurve(*args):
	return BRepGraph_Tool_CoEdge.HasPCurve(*args)

@deprecated
def BRepGraph_Tool_CoEdge_IsReversed(*args):
	return BRepGraph_Tool_CoEdge.IsReversed(*args)

@deprecated
def BRepGraph_Tool_CoEdge_IsSeam(*args):
	return BRepGraph_Tool_CoEdge.IsSeam(*args)

@deprecated
def BRepGraph_Tool_CoEdge_Orientation(*args):
	return BRepGraph_Tool_CoEdge.Orientation(*args)

@deprecated
def BRepGraph_Tool_CoEdge_PCurve(*args):
	return BRepGraph_Tool_CoEdge.PCurve(*args)

@deprecated
def BRepGraph_Tool_CoEdge_PCurveAdaptor(*args):
	return BRepGraph_Tool_CoEdge.PCurveAdaptor(*args)

@deprecated
def BRepGraph_Tool_CoEdge_PCurveAdaptor(*args):
	return BRepGraph_Tool_CoEdge.PCurveAdaptor(*args)

@deprecated
def BRepGraph_Tool_CoEdge_Range(*args):
	return BRepGraph_Tool_CoEdge.Range(*args)

@deprecated
def BRepGraph_Tool_CoEdge_SameParameter(*args):
	return BRepGraph_Tool_CoEdge.SameParameter(*args)

@deprecated
def BRepGraph_Tool_CoEdge_SameRange(*args):
	return BRepGraph_Tool_CoEdge.SameRange(*args)

@deprecated
def BRepGraph_Tool_CoEdge_SeamPair(*args):
	return BRepGraph_Tool_CoEdge.SeamPair(*args)

@deprecated
def BRepGraph_Tool_CoEdge_UVPoints(*args):
	return BRepGraph_Tool_CoEdge.UVPoints(*args)

@deprecated
def BRepGraph_Tool_Edge_Curve(*args):
	return BRepGraph_Tool_Edge.Curve(*args)

@deprecated
def BRepGraph_Tool_Edge_Curve(*args):
	return BRepGraph_Tool_Edge.Curve(*args)

@deprecated
def BRepGraph_Tool_Edge_CurveAdaptor(*args):
	return BRepGraph_Tool_Edge.CurveAdaptor(*args)

@deprecated
def BRepGraph_Tool_Edge_CurveAdaptor(*args):
	return BRepGraph_Tool_Edge.CurveAdaptor(*args)

@deprecated
def BRepGraph_Tool_Edge_CurveOnSurface(*args):
	return BRepGraph_Tool_Edge.CurveOnSurface(*args)

@deprecated
def BRepGraph_Tool_Edge_Degenerated(*args):
	return BRepGraph_Tool_Edge.Degenerated(*args)

@deprecated
def BRepGraph_Tool_Edge_EndVertexId(*args):
	return BRepGraph_Tool_Edge.EndVertexId(*args)

@deprecated
def BRepGraph_Tool_Edge_FindByVertices(*args):
	return BRepGraph_Tool_Edge.FindByVertices(*args)

@deprecated
def BRepGraph_Tool_Edge_FindCoEdgeId(*args):
	return BRepGraph_Tool_Edge.FindCoEdgeId(*args)

@deprecated
def BRepGraph_Tool_Edge_FindCoEdgeId(*args):
	return BRepGraph_Tool_Edge.FindCoEdgeId(*args)

@deprecated
def BRepGraph_Tool_Edge_FindPCurveCoEdgeId(*args):
	return BRepGraph_Tool_Edge.FindPCurveCoEdgeId(*args)

@deprecated
def BRepGraph_Tool_Edge_FindPCurveCoEdgeId(*args):
	return BRepGraph_Tool_Edge.FindPCurveCoEdgeId(*args)

@deprecated
def BRepGraph_Tool_Edge_HasCurve(*args):
	return BRepGraph_Tool_Edge.HasCurve(*args)

@deprecated
def BRepGraph_Tool_Edge_IsBoundary(*args):
	return BRepGraph_Tool_Edge.IsBoundary(*args)

@deprecated
def BRepGraph_Tool_Edge_IsClosed(*args):
	return BRepGraph_Tool_Edge.IsClosed(*args)

@deprecated
def BRepGraph_Tool_Edge_IsManifold(*args):
	return BRepGraph_Tool_Edge.IsManifold(*args)

@deprecated
def BRepGraph_Tool_Edge_IsSeamOnFace(*args):
	return BRepGraph_Tool_Edge.IsSeamOnFace(*args)

@deprecated
def BRepGraph_Tool_Edge_NbFaces(*args):
	return BRepGraph_Tool_Edge.NbFaces(*args)

@deprecated
def BRepGraph_Tool_Edge_Range(*args):
	return BRepGraph_Tool_Edge.Range(*args)

@deprecated
def BRepGraph_Tool_Edge_StartVertexId(*args):
	return BRepGraph_Tool_Edge.StartVertexId(*args)

@deprecated
def BRepGraph_Tool_Edge_Tolerance(*args):
	return BRepGraph_Tool_Edge.Tolerance(*args)

@deprecated
def BRepGraph_Tool_Face_Bounds(*args):
	return BRepGraph_Tool_Face.Bounds(*args)

@deprecated
def BRepGraph_Tool_Face_Bounds(*args):
	return BRepGraph_Tool_Face.Bounds(*args)

@deprecated
def BRepGraph_Tool_Face_HasSurface(*args):
	return BRepGraph_Tool_Face.HasSurface(*args)

@deprecated
def BRepGraph_Tool_Face_HasSurface(*args):
	return BRepGraph_Tool_Face.HasSurface(*args)

@deprecated
def BRepGraph_Tool_Face_NbWires(*args):
	return BRepGraph_Tool_Face.NbWires(*args)

@deprecated
def BRepGraph_Tool_Face_NbWires(*args):
	return BRepGraph_Tool_Face.NbWires(*args)

@deprecated
def BRepGraph_Tool_Face_OuterWire(*args):
	return BRepGraph_Tool_Face.OuterWire(*args)

@deprecated
def BRepGraph_Tool_Face_OuterWire(*args):
	return BRepGraph_Tool_Face.OuterWire(*args)

@deprecated
def BRepGraph_Tool_Face_Surface(*args):
	return BRepGraph_Tool_Face.Surface(*args)

@deprecated
def BRepGraph_Tool_Face_Surface(*args):
	return BRepGraph_Tool_Face.Surface(*args)

@deprecated
def BRepGraph_Tool_Face_SurfaceAdaptor(*args):
	return BRepGraph_Tool_Face.SurfaceAdaptor(*args)

@deprecated
def BRepGraph_Tool_Face_SurfaceAdaptor(*args):
	return BRepGraph_Tool_Face.SurfaceAdaptor(*args)

@deprecated
def BRepGraph_Tool_Face_SurfaceAdaptor(*args):
	return BRepGraph_Tool_Face.SurfaceAdaptor(*args)

@deprecated
def BRepGraph_Tool_Face_SurfaceAdaptor(*args):
	return BRepGraph_Tool_Face.SurfaceAdaptor(*args)

@deprecated
def BRepGraph_Tool_Face_SurfaceAdaptor(*args):
	return BRepGraph_Tool_Face.SurfaceAdaptor(*args)

@deprecated
def BRepGraph_Tool_Face_SurfaceAdaptor(*args):
	return BRepGraph_Tool_Face.SurfaceAdaptor(*args)

@deprecated
def BRepGraph_Tool_Face_Tolerance(*args):
	return BRepGraph_Tool_Face.Tolerance(*args)

@deprecated
def BRepGraph_Tool_Face_Tolerance(*args):
	return BRepGraph_Tool_Face.Tolerance(*args)

@deprecated
def BRepGraph_Tool_Face_Usage(*args):
	return BRepGraph_Tool_Face.Usage(*args)

@deprecated
def BRepGraph_Tool_Shell_IsClosed(*args):
	return BRepGraph_Tool_Shell.IsClosed(*args)

@deprecated
def BRepGraph_Tool_Shell_IsClosed(*args):
	return BRepGraph_Tool_Shell.IsClosed(*args)

@deprecated
def BRepGraph_Tool_Shell_NbFaces(*args):
	return BRepGraph_Tool_Shell.NbFaces(*args)

@deprecated
def BRepGraph_Tool_Shell_NbFaces(*args):
	return BRepGraph_Tool_Shell.NbFaces(*args)

@deprecated
def BRepGraph_Tool_Shell_Usage(*args):
	return BRepGraph_Tool_Shell.Usage(*args)

@deprecated
def BRepGraph_Tool_Vertex_NbEdges(*args):
	return BRepGraph_Tool_Vertex.NbEdges(*args)

@deprecated
def BRepGraph_Tool_Vertex_Pnt(*args):
	return BRepGraph_Tool_Vertex.Pnt(*args)

@deprecated
def BRepGraph_Tool_Vertex_Pnt(*args):
	return BRepGraph_Tool_Vertex.Pnt(*args)

@deprecated
def BRepGraph_Tool_Vertex_Pnt(*args):
	return BRepGraph_Tool_Vertex.Pnt(*args)

@deprecated
def BRepGraph_Tool_Vertex_Tolerance(*args):
	return BRepGraph_Tool_Vertex.Tolerance(*args)

@deprecated
def BRepGraph_Tool_Vertex_Tolerance(*args):
	return BRepGraph_Tool_Vertex.Tolerance(*args)

@deprecated
def BRepGraph_Tool_Vertex_Usage(*args):
	return BRepGraph_Tool_Vertex.Usage(*args)

@deprecated
def BRepGraph_Tool_Wire_FaceOf(*args):
	return BRepGraph_Tool_Wire.FaceOf(*args)

@deprecated
def BRepGraph_Tool_Wire_FaceOf(*args):
	return BRepGraph_Tool_Wire.FaceOf(*args)

@deprecated
def BRepGraph_Tool_Wire_IsClosed(*args):
	return BRepGraph_Tool_Wire.IsClosed(*args)

@deprecated
def BRepGraph_Tool_Wire_IsClosed(*args):
	return BRepGraph_Tool_Wire.IsClosed(*args)

@deprecated
def BRepGraph_Tool_Wire_IsOuter(*args):
	return BRepGraph_Tool_Wire.IsOuter(*args)

@deprecated
def BRepGraph_Tool_Wire_IsOuter(*args):
	return BRepGraph_Tool_Wire.IsOuter(*args)

@deprecated
def BRepGraph_Tool_Wire_NbCoEdges(*args):
	return BRepGraph_Tool_Wire.NbCoEdges(*args)

@deprecated
def BRepGraph_Tool_Wire_NbCoEdges(*args):
	return BRepGraph_Tool_Wire.NbCoEdges(*args)

@deprecated
def BRepGraph_Tool_Wire_NbDistinctEdges(*args):
	return BRepGraph_Tool_Wire.NbDistinctEdges(*args)

@deprecated
def BRepGraph_Tool_Wire_NbDistinctEdges(*args):
	return BRepGraph_Tool_Wire.NbDistinctEdges(*args)

@deprecated
def BRepGraph_Tool_Wire_Usage(*args):
	return BRepGraph_Tool_Wire.Usage(*args)

@deprecated
def BRepGraph_Transform_MoveRef(*args):
	return BRepGraph_Transform.MoveRef(*args)

@deprecated
def BRepGraph_Transform_MoveRef(*args):
	return BRepGraph_Transform.MoveRef(*args)

@deprecated
def BRepGraph_Transform_Perform(*args):
	return BRepGraph_Transform.Perform(*args)

@deprecated
def BRepGraph_Transform_TransformNode(*args):
	return BRepGraph_Transform.TransformNode(*args)

@deprecated
def BRepGraph_UID_Invalid(*args):
	return BRepGraph_UID.Invalid(*args)

@deprecated
def BRepGraph_Validate_Perform(*args):
	return BRepGraph_Validate.Perform(*args)

@deprecated
def BRepGraph_Validate_Perform(*args):
	return BRepGraph_Validate.Perform(*args)

@deprecated
def BRepGraph_Validate_Perform(*args):
	return BRepGraph_Validate.Perform(*args)

@deprecated
def BRepGraph_Validate_Options_Audit(*args):
	return BRepGraph_Validate_Options.Audit(*args)

@deprecated
def BRepGraph_Validate_Options_Lightweight(*args):
	return BRepGraph_Validate_Options.Lightweight(*args)

@deprecated
def BRepGraph_VertexId_FromNodeId(*args):
	return BRepGraph_VertexId.FromNodeId(*args)

@deprecated
def BRepGraph_VertexId_Invalid(*args):
	return BRepGraph_VertexId.Invalid(*args)

@deprecated
def BRepGraph_VertexId_Start(*args):
	return BRepGraph_VertexId.Start(*args)

@deprecated
def BRepGraph_VertexRefId_FromRefId(*args):
	return BRepGraph_VertexRefId.FromRefId(*args)

@deprecated
def BRepGraph_VertexRefId_Invalid(*args):
	return BRepGraph_VertexRefId.Invalid(*args)

@deprecated
def BRepGraph_VertexRefId_Start(*args):
	return BRepGraph_VertexRefId.Start(*args)

@deprecated
def BRepGraph_WireId_FromNodeId(*args):
	return BRepGraph_WireId.FromNodeId(*args)

@deprecated
def BRepGraph_WireId_Invalid(*args):
	return BRepGraph_WireId.Invalid(*args)

@deprecated
def BRepGraph_WireId_Start(*args):
	return BRepGraph_WireId.Start(*args)

@deprecated
def BRepGraph_WireRefId_FromRefId(*args):
	return BRepGraph_WireRefId.FromRefId(*args)

@deprecated
def BRepGraph_WireRefId_Invalid(*args):
	return BRepGraph_WireRefId.Invalid(*args)

@deprecated
def BRepGraph_WireRefId_Start(*args):
	return BRepGraph_WireRefId.Start(*args)

@deprecated
def BRepGraph_CacheDerivedState_ComputeEdgeProperties(*args):
	return BRepGraph_CacheDerivedState.ComputeEdgeProperties(*args)

@deprecated
def BRepGraph_CacheDerivedState_ComputeShellIsClosed(*args):
	return BRepGraph_CacheDerivedState.ComputeShellIsClosed(*args)

@deprecated
def BRepGraph_CacheDerivedState_ComputeWireIsClosed(*args):
	return BRepGraph_CacheDerivedState.ComputeWireIsClosed(*args)

@deprecated
def BRepGraph_CacheDerivedState_GetID(*args):
	return BRepGraph_CacheDerivedState.GetID(*args)

@deprecated
def BRepGraph_LayerHistory_GetID(*args):
	return BRepGraph_LayerHistory.GetID(*args)

@deprecated
def BRepGraph_LayerLock_GetID(*args):
	return BRepGraph_LayerLock.GetID(*args)

@deprecated
def BRepGraph_LayerParametric_GenerationMask(*args):
	return BRepGraph_LayerParametric.GenerationMask(*args)

@deprecated
def BRepGraph_LayerParametric_HasGenerationFlag(*args):
	return BRepGraph_LayerParametric.HasGenerationFlag(*args)

@deprecated
def BRepGraph_LayerParametric_MeshQualityValue(*args):
	return BRepGraph_LayerParametric.MeshQualityValue(*args)

}
