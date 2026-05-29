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
%define XCAFDOCDOCSTRING
"XCAFDoc module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_xcafdoc.html"
%enddef
%module (package="OCC.Core", docstring=XCAFDOCDOCSTRING) XCAFDoc


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
#include<XCAFDoc_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TCollection_module.hxx>
#include<TDF_module.hxx>
#include<TDataStd_module.hxx>
#include<TDocStd_module.hxx>
#include<TColStd_module.hxx>
#include<gp_module.hxx>
#include<Quantity_module.hxx>
#include<TopoDS_module.hxx>
#include<XCAFDimTolObjects_module.hxx>
#include<UnitsMethods_module.hxx>
#include<TopLoc_module.hxx>
#include<XCAFNoteObjects_module.hxx>
#include<OSD_module.hxx>
#include<TopTools_module.hxx>
#include<XCAFView_module.hxx>
#include<Graphic3d_module.hxx>
#include<Resource_module.hxx>
#include<Message_module.hxx>
#include<CDF_module.hxx>
#include<CDM_module.hxx>
#include<PCDM_module.hxx>
#include<TDF_module.hxx>
#include<Aspect_module.hxx>
#include<Bnd_module.hxx>
#include<Media_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TCollection.i
%import TDF.i
%import TDataStd.i
%import TDocStd.i
%import TColStd.i
%import gp.i
%import Quantity.i
%import TopoDS.i
%import XCAFDimTolObjects.i
%import UnitsMethods.i
%import TopLoc.i
%import XCAFNoteObjects.i
%import OSD.i
%import TopTools.i
%import XCAFView.i
%import Graphic3d.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum XCAFDoc_ColorType {
	XCAFDoc_ColorGen = 0,
	XCAFDoc_ColorSurf = 1,
	XCAFDoc_ColorCurv = 2,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class XCAFDoc_ColorType(IntEnum):
	XCAFDoc_ColorGen = 0
	XCAFDoc_ColorSurf = 1
	XCAFDoc_ColorCurv = 2
XCAFDoc_ColorGen = XCAFDoc_ColorType.XCAFDoc_ColorGen
XCAFDoc_ColorSurf = XCAFDoc_ColorType.XCAFDoc_ColorSurf
XCAFDoc_ColorCurv = XCAFDoc_ColorType.XCAFDoc_ColorCurv
};
/* end python proxy for enums */

/* handles */
%wrap_handle(XCAFDoc_Area)
%wrap_handle(XCAFDoc_AssemblyGraph)
%wrap_handle(XCAFDoc_AssemblyItemRef)
%wrap_handle(XCAFDoc_Centroid)
%wrap_handle(XCAFDoc_ClippingPlaneTool)
%wrap_handle(XCAFDoc_Color)
%wrap_handle(XCAFDoc_ColorTool)
%wrap_handle(XCAFDoc_Datum)
%wrap_handle(XCAFDoc_DimTol)
%wrap_handle(XCAFDoc_DimTolTool)
%wrap_handle(XCAFDoc_Dimension)
%wrap_handle(XCAFDoc_DocumentTool)
%wrap_handle(XCAFDoc_GraphNode)
%wrap_handle(XCAFDoc_LayerTool)
%wrap_handle(XCAFDoc_LengthUnit)
%wrap_handle(XCAFDoc_Location)
%wrap_handle(XCAFDoc_Material)
%wrap_handle(XCAFDoc_MaterialTool)
%wrap_handle(XCAFDoc_Note)
%wrap_handle(XCAFDoc_NotesTool)
%wrap_handle(XCAFDoc_ShapeMapTool)
%wrap_handle(XCAFDoc_ShapeTool)
%wrap_handle(XCAFDoc_View)
%wrap_handle(XCAFDoc_ViewTool)
%wrap_handle(XCAFDoc_VisMaterial)
%wrap_handle(XCAFDoc_VisMaterialTool)
%wrap_handle(XCAFDoc_Volume)
%wrap_handle(XCAFDoc_NoteBinData)
%wrap_handle(XCAFDoc_NoteComment)
%wrap_handle(XCAFDoc_NoteBalloon)
/* end handles declaration */

/* templates */
%ignore NCollection_DataMap<TopoDS_Shape,TDF_Label,TopTools_ShapeMapHasher>::Items;
%ignore NCollection_DataMap<TopoDS_Shape,TDF_Label,TopTools_ShapeMapHasher>::KeyValues;
%template(XCAFDoc_DataMapOfShapeLabel) NCollection_DataMap<TopoDS_Shape,TDF_Label,TopTools_ShapeMapHasher>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap<TopoDS_Shape, TDF_Label, TopTools_ShapeMapHasher>::Iterator XCAFDoc_DataMapIteratorOfDataMapOfShapeLabel;
typedef NCollection_DataMap<TopoDS_Shape, TDF_Label, TopTools_ShapeMapHasher> XCAFDoc_DataMapOfShapeLabel;
typedef TCollection_AsciiString XCAFDoc_PartId;
/* end typedefs declaration */

/****************
* class XCAFDoc *
****************/
%rename(xcafdoc) XCAFDoc;
class XCAFDoc {
	public:
		/****** XCAFDoc::AssemblyGUID ******/
		/****** md5 signature: 08f8f5799c370f0c7118cbf66eb955e8 ******/
		%feature("compactdefaultargs") AssemblyGUID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
class for containing GraphNodes. Returns GUID for UAttribute identifying assembly.
") AssemblyGUID;
		static const Standard_GUID & AssemblyGUID();

		/****** XCAFDoc::AttributeInfo ******/
		/****** md5 signature: 49484a25600c534dd484fee332280355 ******/
		%feature("compactdefaultargs") AttributeInfo;
		%feature("autodoc", "
Parameters
----------
theAtt: TDF_Attribute

Return
-------
TCollection_AsciiString

Description
-----------
Prints attribute information into a string. 
Parameter theAtt an XDE attribute 
Return: the generated info value.
") AttributeInfo;
		static TCollection_AsciiString AttributeInfo(const opencascade::handle<TDF_Attribute> & theAtt);

		/****** XCAFDoc::ColorByLayerGUID ******/
		/****** md5 signature: e7c9fa808a6c556c84def8d7ccc2e9e0 ******/
		%feature("compactdefaultargs") ColorByLayerGUID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ColorByLayerGUID;
		static const Standard_GUID & ColorByLayerGUID();

		/****** XCAFDoc::ColorRefGUID ******/
		/****** md5 signature: 551197dedb9ab8d034da4461360ef5df ******/
		%feature("compactdefaultargs") ColorRefGUID;
		%feature("autodoc", "
Parameters
----------
type: XCAFDoc_ColorType

Return
-------
Standard_GUID

Description
-----------
Return GUIDs for TreeNode representing specified types of colors.
") ColorRefGUID;
		static const Standard_GUID & ColorRefGUID(const XCAFDoc_ColorType type);

		/****** XCAFDoc::DatumRefGUID ******/
		/****** md5 signature: fa78499fe8700f501482b714104baae7 ******/
		%feature("compactdefaultargs") DatumRefGUID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Return GUIDs for TreeNode representing specified types of datum.
") DatumRefGUID;
		static const Standard_GUID & DatumRefGUID();

		/****** XCAFDoc::DatumTolRefGUID ******/
		/****** md5 signature: 83929cf7dea9ebe90ec24d767be2fcba ******/
		%feature("compactdefaultargs") DatumTolRefGUID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Return GUIDs for TreeNode representing connections Datum-Toler.
") DatumTolRefGUID;
		static const Standard_GUID & DatumTolRefGUID();

		/****** XCAFDoc::DimTolRefGUID ******/
		/****** md5 signature: cb6332b2f7ea08eacdb3015e18fff2ae ******/
		%feature("compactdefaultargs") DimTolRefGUID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Return GUIDs for TreeNode representing specified types of DGT.
") DimTolRefGUID;
		static const Standard_GUID & DimTolRefGUID();

		/****** XCAFDoc::DimensionRefFirstGUID ******/
		/****** md5 signature: 8f5110dc5159e61e07300a14ee7d197e ******/
		%feature("compactdefaultargs") DimensionRefFirstGUID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Return GUIDs for TreeNode representing specified types of Dimension.
") DimensionRefFirstGUID;
		static const Standard_GUID & DimensionRefFirstGUID();

		/****** XCAFDoc::DimensionRefSecondGUID ******/
		/****** md5 signature: b332dc5df6a0f5cc6ad03aa406535426 ******/
		%feature("compactdefaultargs") DimensionRefSecondGUID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Return GUIDs for TreeNode representing specified types of Dimension.
") DimensionRefSecondGUID;
		static const Standard_GUID & DimensionRefSecondGUID();

		/****** XCAFDoc::ExternRefGUID ******/
		/****** md5 signature: e4f3aecf6b95b248a97833fcdd9f78af ******/
		%feature("compactdefaultargs") ExternRefGUID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Returns GUID for UAttribute identifying external reference on no-step file.
") ExternRefGUID;
		static const Standard_GUID & ExternRefGUID();

		/****** XCAFDoc::GeomToleranceRefGUID ******/
		/****** md5 signature: 3ce9952af6e8ac2829f1c8ddcb120406 ******/
		%feature("compactdefaultargs") GeomToleranceRefGUID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Return GUIDs for TreeNode representing specified types of GeomTolerance.
") GeomToleranceRefGUID;
		static const Standard_GUID & GeomToleranceRefGUID();

		/****** XCAFDoc::InvisibleGUID ******/
		/****** md5 signature: 8dc61b41a2ab98beab1cf04a8ead4506 ******/
		%feature("compactdefaultargs") InvisibleGUID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") InvisibleGUID;
		static const Standard_GUID & InvisibleGUID();

		/****** XCAFDoc::LayerRefGUID ******/
		/****** md5 signature: 8a0906b64172bec646477a09e14b38e9 ******/
		%feature("compactdefaultargs") LayerRefGUID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") LayerRefGUID;
		static const Standard_GUID & LayerRefGUID();

		/****** XCAFDoc::LockGUID ******/
		/****** md5 signature: 9905902179bea800f4cbd2b10f32e70b ******/
		%feature("compactdefaultargs") LockGUID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Returns GUID for UAttribute identifying lock flag.
") LockGUID;
		static const Standard_GUID & LockGUID();

		/****** XCAFDoc::MaterialRefGUID ******/
		/****** md5 signature: c92f52a63371080ee7e8ae947a177f9c ******/
		%feature("compactdefaultargs") MaterialRefGUID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") MaterialRefGUID;
		static const Standard_GUID & MaterialRefGUID();

		/****** XCAFDoc::NoteRefGUID ******/
		/****** md5 signature: b53339cbab8681aa0f794cf616872140 ******/
		%feature("compactdefaultargs") NoteRefGUID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Return GUIDs for representing notes.
") NoteRefGUID;
		static const Standard_GUID & NoteRefGUID();

		/****** XCAFDoc::SHUORefGUID ******/
		/****** md5 signature: bf4592bd617fbb30adb695367e15346c ******/
		%feature("compactdefaultargs") SHUORefGUID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Returns GUID for UAttribute identifying specified higher usage occurrence.
") SHUORefGUID;
		static const Standard_GUID & SHUORefGUID();

		/****** XCAFDoc::ShapeRefGUID ******/
		/****** md5 signature: 344fd4ba37b7dcc32f16506ee780dea8 ******/
		%feature("compactdefaultargs") ShapeRefGUID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Returns GUID for TreeNode representing assembly link.
") ShapeRefGUID;
		static const Standard_GUID & ShapeRefGUID();

		/****** XCAFDoc::ViewRefAnnotationGUID ******/
		/****** md5 signature: 3b24a2105dcb91eff89d74331a1f1eb3 ******/
		%feature("compactdefaultargs") ViewRefAnnotationGUID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ViewRefAnnotationGUID;
		static const Standard_GUID & ViewRefAnnotationGUID();

		/****** XCAFDoc::ViewRefGDTGUID ******/
		/****** md5 signature: daead34db984df64a60d887ee14bf2bc ******/
		%feature("compactdefaultargs") ViewRefGDTGUID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Return GUIDs for TreeNode representing specified types of View.
") ViewRefGDTGUID;
		static const Standard_GUID & ViewRefGDTGUID();

		/****** XCAFDoc::ViewRefGUID ******/
		/****** md5 signature: 1d659c6eef18ddb9cf3a6adeb0f02de3 ******/
		%feature("compactdefaultargs") ViewRefGUID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Return GUIDs for TreeNode representing specified types of View.
") ViewRefGUID;
		static const Standard_GUID & ViewRefGUID();

		/****** XCAFDoc::ViewRefNoteGUID ******/
		/****** md5 signature: 1b759f7e4d75c3e69f1ed1ff8ce2bc80 ******/
		%feature("compactdefaultargs") ViewRefNoteGUID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Return GUIDs for GraphNode representing specified types of View.
") ViewRefNoteGUID;
		static const Standard_GUID & ViewRefNoteGUID();

		/****** XCAFDoc::ViewRefPlaneGUID ******/
		/****** md5 signature: 1efa9615074bc88478edae11271485c7 ******/
		%feature("compactdefaultargs") ViewRefPlaneGUID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Return GUIDs for TreeNode representing specified types of View.
") ViewRefPlaneGUID;
		static const Standard_GUID & ViewRefPlaneGUID();

		/****** XCAFDoc::ViewRefShapeGUID ******/
		/****** md5 signature: b24e8f81946175309cbeb0c59979c17e ******/
		%feature("compactdefaultargs") ViewRefShapeGUID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Return GUIDs for TreeNode representing specified types of View.
") ViewRefShapeGUID;
		static const Standard_GUID & ViewRefShapeGUID();

		/****** XCAFDoc::VisMaterialRefGUID ******/
		/****** md5 signature: 6f2a7fe937e3eae96df1fce1ab75eee4 ******/
		%feature("compactdefaultargs") VisMaterialRefGUID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Return GUID for TreeNode representing Visualization Material.
") VisMaterialRefGUID;
		static const Standard_GUID & VisMaterialRefGUID();

};


%extend XCAFDoc {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class XCAFDoc_Area *
*********************/
class XCAFDoc_Area : public TDataStd_Real {
	public:
		/****** XCAFDoc_Area::XCAFDoc_Area ******/
		/****** md5 signature: 1d1a9e57f6fd1c122bae7660a32edfab ******/
		%feature("compactdefaultargs") XCAFDoc_Area;
		%feature("autodoc", "Return
-------
None

Description
-----------
class methods =============.
") XCAFDoc_Area;
		 XCAFDoc_Area();

		/****** XCAFDoc_Area::Dump ******/
		/****** md5 signature: c3832f0735de2bdac14af95fe6ce7de3 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOS: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		Standard_OStream & Dump(std::ostream &OutValue);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** XCAFDoc_Area::Get ******/
		/****** md5 signature: cdec7cab9884d7fced97581bfac75b03 ******/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Get;
		double Get();

		/****** XCAFDoc_Area::Get ******/
		/****** md5 signature: 7915f25276ba16249c76a2e0159946c7 ******/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label

Return
-------
area: double

Description
-----------
Returns volume of area as argument and success status returns false if no such attribute at the <label>.
") Get;
		static bool Get(const TDF_Label & label, Standard_Real &OutValue);

		/****** XCAFDoc_Area::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") GetID;
		static const Standard_GUID & GetID();

		/****** XCAFDoc_Area::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** XCAFDoc_Area::Set ******/
		/****** md5 signature: 62938c9af59de680c109a8fa6a87f095 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
vol: double

Return
-------
None

Description
-----------
Sets a value of volume.
") Set;
		void Set(const double vol);

		/****** XCAFDoc_Area::Set ******/
		/****** md5 signature: 2d0538bb5d3c5863ddb4a21083b3beec ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
area: double

Return
-------
opencascade::handle<XCAFDoc_Area>

Description
-----------
Find, or create, an Area attribute and set its value.
") Set;
		static opencascade::handle<XCAFDoc_Area> Set(const TDF_Label & label, const double area);

};


%make_alias(XCAFDoc_Area)

%extend XCAFDoc_Area {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class XCAFDoc_AssemblyGraph *
******************************/
class XCAFDoc_AssemblyGraph : public Standard_Transient {
	public:
typedef NCollection_DataMap<int , TColStd_PackedMapOfInteger> AdjacencyMap;
		class Iterator {};
/* public enums */
enum NodeType {
	NodeType_UNDEFINED = 0,
	NodeType_AssemblyRoot = 1,
	NodeType_Subassembly = 2,
	NodeType_Occurrence = 3,
	NodeType_Part = 4,
	NodeType_Subshape = 5,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class NodeType(IntEnum):
	NodeType_UNDEFINED = 0
	NodeType_AssemblyRoot = 1
	NodeType_Subassembly = 2
	NodeType_Occurrence = 3
	NodeType_Part = 4
	NodeType_Subshape = 5
NodeType_UNDEFINED = NodeType.NodeType_UNDEFINED
NodeType_AssemblyRoot = NodeType.NodeType_AssemblyRoot
NodeType_Subassembly = NodeType.NodeType_Subassembly
NodeType_Occurrence = NodeType.NodeType_Occurrence
NodeType_Part = NodeType.NodeType_Part
NodeType_Subshape = NodeType.NodeType_Subshape
};
/* end python proxy for enums */

		/****** XCAFDoc_AssemblyGraph::XCAFDoc_AssemblyGraph ******/
		/****** md5 signature: 7a43fcc42d351eea072de136f9d8ebb1 ******/
		%feature("compactdefaultargs") XCAFDoc_AssemblyGraph;
		%feature("autodoc", "
Parameters
----------
theDoc: TDocStd_Document

Return
-------
None

Description
-----------
\brief Constructs graph from XCAF document. Construction of a formal graph will be done immediately. \param[in] theDoc - document to iterate.
") XCAFDoc_AssemblyGraph;
		 XCAFDoc_AssemblyGraph(const opencascade::handle<TDocStd_Document> & theDoc);

		/****** XCAFDoc_AssemblyGraph::XCAFDoc_AssemblyGraph ******/
		/****** md5 signature: 6521866e2af20cbd6733dfab8c4790a7 ******/
		%feature("compactdefaultargs") XCAFDoc_AssemblyGraph;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label

Return
-------
None

Description
-----------
\brief Constructs graph from XCAF label. Construction of a formal graph will be done immediately. The specified label is used as a starting position. \param[in] theDoc - document to iterate. \param[in] theLabel - starting position.
") XCAFDoc_AssemblyGraph;
		 XCAFDoc_AssemblyGraph(const TDF_Label & theLabel);

		/****** XCAFDoc_AssemblyGraph::GetChildren ******/
		/****** md5 signature: ab4bc1e2b9838eb165b321c886d314e1 ******/
		%feature("compactdefaultargs") GetChildren;
		%feature("autodoc", "
Parameters
----------
theNode: int

Return
-------
TColStd_PackedMapOfInteger

Description
-----------
\brief Returns IDs of child nodes for the given node. \param[in] theNode - one-based node ID. eturn set of child IDs.
") GetChildren;
		const TColStd_PackedMapOfInteger & GetChildren(const int theNode);

		/****** XCAFDoc_AssemblyGraph::GetLinks ******/
		/****** md5 signature: 71d026ba70bb50b3fb1f61585b29c8cb ******/
		%feature("compactdefaultargs") GetLinks;
		%feature("autodoc", "Return
-------
AdjacencyMap

Description
-----------
\brief Returns the collection of graph links in the form of adjacency matrix. eturn graph links.
") GetLinks;
		const AdjacencyMap & GetLinks();

		/****** XCAFDoc_AssemblyGraph::GetNode ******/
		/****** md5 signature: 661da74285fa1f86b527a95aeab5b268 ******/
		%feature("compactdefaultargs") GetNode;
		%feature("autodoc", "
Parameters
----------
theNode: int

Return
-------
TDF_Label

Description
-----------
\brief returns object ID by node ID. \param[in] theNode - one-based node ID. eturn persistent ID.
") GetNode;
		const TDF_Label & GetNode(const int theNode);

		/****** XCAFDoc_AssemblyGraph::GetNodeType ******/
		/****** md5 signature: 43e4dbbb0e78cdb9796c5bb4db761a63 ******/
		%feature("compactdefaultargs") GetNodeType;
		%feature("autodoc", "
Parameters
----------
theNode: int

Return
-------
XCAFDoc_AssemblyGraph::NodeType

Description
-----------
\brief Returns the node type from ef NodeType enum. \param[in] theNode - one-based node ID. eturn node type. \sa NodeType.
") GetNodeType;
		XCAFDoc_AssemblyGraph::NodeType GetNodeType(const int theNode);

		/****** XCAFDoc_AssemblyGraph::GetNodes ******/
		/****** md5 signature: 82aef061a407fe0b7cc370a1bc4e8e0e ******/
		%feature("compactdefaultargs") GetNodes;
		%feature("autodoc", "Return
-------
TDF_LabelIndexedMap

Description
-----------
\brief Returns the unordered set of graph nodes. eturn graph nodes.
") GetNodes;
		const TDF_LabelIndexedMap & GetNodes();

		/****** XCAFDoc_AssemblyGraph::GetRoots ******/
		/****** md5 signature: a9e5a8c4207210773dc54e4bb1aa3b34 ******/
		%feature("compactdefaultargs") GetRoots;
		%feature("autodoc", "Return
-------
TColStd_PackedMapOfInteger

Description
-----------
\brief Returns IDs of the root nodes. eturn IDs of the root nodes.
") GetRoots;
		const TColStd_PackedMapOfInteger & GetRoots();

		/****** XCAFDoc_AssemblyGraph::GetShapeTool ******/
		/****** md5 signature: a61be1bd1f2b067dcdc81a2d70df068a ******/
		%feature("compactdefaultargs") GetShapeTool;
		%feature("autodoc", "Return
-------
opencascade::handle<XCAFDoc_ShapeTool>

Description
-----------
eturn Document shape tool.
") GetShapeTool;
		const opencascade::handle<XCAFDoc_ShapeTool> & GetShapeTool();

		/****** XCAFDoc_AssemblyGraph::HasChildren ******/
		/****** md5 signature: ef214b7d15146c6515b86401f600606c ******/
		%feature("compactdefaultargs") HasChildren;
		%feature("autodoc", "
Parameters
----------
theNode: int

Return
-------
bool

Description
-----------
\brief Checks whether direct children exist for the given node. \param[in] theNode - one-based node ID. eturn true/false.
") HasChildren;
		bool HasChildren(const int theNode);

		/****** XCAFDoc_AssemblyGraph::IsDirectLink ******/
		/****** md5 signature: e2f42d3bdf9f395def6459f957024054 ******/
		%feature("compactdefaultargs") IsDirectLink;
		%feature("autodoc", "
Parameters
----------
theNode1: int
theNode2: int

Return
-------
bool

Description
-----------
\brief Checks whether the assembly graph contains (n1, n2) directed link. \param[in] theNode1 - one-based ID of the first node. \param[in] theNode2 - one-based ID of the second node. eturn true/false.
") IsDirectLink;
		bool IsDirectLink(const int theNode1, const int theNode2);

		/****** XCAFDoc_AssemblyGraph::NbLinks ******/
		/****** md5 signature: 5cad74f2abf81066e1144c03969d0b0e ******/
		%feature("compactdefaultargs") NbLinks;
		%feature("autodoc", "Return
-------
int

Description
-----------
\brief Returns the number of graph links. eturn number of graph links.
") NbLinks;
		int NbLinks();

		/****** XCAFDoc_AssemblyGraph::NbNodes ******/
		/****** md5 signature: d40157e610feffebe18aa0d56c09a4f4 ******/
		%feature("compactdefaultargs") NbNodes;
		%feature("autodoc", "Return
-------
int

Description
-----------
\brief Returns the number of graph nodes. eturn number of graph nodes.
") NbNodes;
		int NbNodes();

		/****** XCAFDoc_AssemblyGraph::NbOccurrences ******/
		/****** md5 signature: 69ffcb4c0aad4ed15edaae320fe24fc0 ******/
		%feature("compactdefaultargs") NbOccurrences;
		%feature("autodoc", "
Parameters
----------
theNode: int

Return
-------
int

Description
-----------
Returns quantity of part usage occurrences. \param[in] theNode - one-based part ID. eturn usage occurrence quantity.
") NbOccurrences;
		int NbOccurrences(const int theNode);

};


%make_alias(XCAFDoc_AssemblyGraph)

%extend XCAFDoc_AssemblyGraph {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class XCAFDoc_AssemblyItemId *
*******************************/
class XCAFDoc_AssemblyItemId {
	public:
		/****** XCAFDoc_AssemblyItemId::XCAFDoc_AssemblyItemId ******/
		/****** md5 signature: 3be71f2dc646719d8cb62bac0797d937 ******/
		%feature("compactdefaultargs") XCAFDoc_AssemblyItemId;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an empty item ID.
") XCAFDoc_AssemblyItemId;
		 XCAFDoc_AssemblyItemId();

		/****** XCAFDoc_AssemblyItemId::XCAFDoc_AssemblyItemId ******/
		/****** md5 signature: 5c2853024c796a8beeef2207de2d723e ******/
		%feature("compactdefaultargs") XCAFDoc_AssemblyItemId;
		%feature("autodoc", "
Parameters
----------
thePath: TColStd_ListOfAsciiString

Return
-------
None

Description
-----------
Constructs an item ID from a list of strings, where every string is a label entry. \param[in] thePath - list of label entries.
") XCAFDoc_AssemblyItemId;
		 XCAFDoc_AssemblyItemId(const TColStd_ListOfAsciiString & thePath);

		/****** XCAFDoc_AssemblyItemId::XCAFDoc_AssemblyItemId ******/
		/****** md5 signature: 4f4fd6890c8e5f971165c7982fbcb794 ******/
		%feature("compactdefaultargs") XCAFDoc_AssemblyItemId;
		%feature("autodoc", "
Parameters
----------
theString: str

Return
-------
None

Description
-----------
Constructs an item ID from a formatted path, where label entries are separated by '/' symbol. \param[in] theString - formatted full path.
") XCAFDoc_AssemblyItemId;
		 XCAFDoc_AssemblyItemId(TCollection_AsciiString theString);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** XCAFDoc_AssemblyItemId::GetPath ******/
		/****** md5 signature: 7bfc472a254346fcd5192598bd9b2b80 ******/
		%feature("compactdefaultargs") GetPath;
		%feature("autodoc", "Return
-------
TColStd_ListOfAsciiString

Description
-----------
Returns the full path as a list of label entries.
") GetPath;
		const TColStd_ListOfAsciiString & GetPath();

		/****** XCAFDoc_AssemblyItemId::Init ******/
		/****** md5 signature: dcc84bdbee9466c522f9fb190f1a3100 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
thePath: TColStd_ListOfAsciiString

Return
-------
None

Description
-----------
Initializes the item ID from a list of strings, where every string is a label entry. \param[in] thePath - list of label entries.
") Init;
		void Init(const TColStd_ListOfAsciiString & thePath);

		/****** XCAFDoc_AssemblyItemId::Init ******/
		/****** md5 signature: 202b959385f798c770333c9d3efef0aa ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theString: str

Return
-------
None

Description
-----------
Initializes the item ID from a formatted path, where label entries are separated by '/' symbol. \param[in] theString - formatted full path.
") Init;
		void Init(TCollection_AsciiString theString);

		/****** XCAFDoc_AssemblyItemId::IsChild ******/
		/****** md5 signature: a83ef1a2c9efea597870917f1ab6cc74 ******/
		%feature("compactdefaultargs") IsChild;
		%feature("autodoc", "
Parameters
----------
theOther: XCAFDoc_AssemblyItemId

Return
-------
bool

Description
-----------
Checks if this item is a child of the given item. \param[in] theOther - potentially ancestor item. eturn true if the item is a child of theOther item, otherwise - false.
") IsChild;
		bool IsChild(const XCAFDoc_AssemblyItemId & theOther);

		/****** XCAFDoc_AssemblyItemId::IsDirectChild ******/
		/****** md5 signature: 4df52111ab4518c17e7766815090f22c ******/
		%feature("compactdefaultargs") IsDirectChild;
		%feature("autodoc", "
Parameters
----------
theOther: XCAFDoc_AssemblyItemId

Return
-------
bool

Description
-----------
Checks if this item is a direct child of the given item. \param[in] theOther - potentially parent item. eturn true if the item is a direct child of theOther item, otherwise - false.
") IsDirectChild;
		bool IsDirectChild(const XCAFDoc_AssemblyItemId & theOther);

		/****** XCAFDoc_AssemblyItemId::IsEqual ******/
		/****** md5 signature: 2b807a26584f62c9a56a4a171337e97b ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
theOther: XCAFDoc_AssemblyItemId

Return
-------
bool

Description
-----------
Checks for item IDs equality. \param[in] theOther - the item ID to check equality with. eturn true if this ID is equal to theOther, otherwise - false.
") IsEqual;
		bool IsEqual(const XCAFDoc_AssemblyItemId & theOther);

		/****** XCAFDoc_AssemblyItemId::IsNull ******/
		/****** md5 signature: 853b69e6816e494cce299d49aca90322 ******/
		%feature("compactdefaultargs") IsNull;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the full path is empty, otherwise - false.
") IsNull;
		bool IsNull();

		/****** XCAFDoc_AssemblyItemId::Nullify ******/
		/****** md5 signature: 1915d5159e87738b7b9af9d5accf4c6e ******/
		%feature("compactdefaultargs") Nullify;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the full path.
") Nullify;
		void Nullify();

		/****** XCAFDoc_AssemblyItemId::ToString ******/
		/****** md5 signature: 6a79ea63aa5c6c7eae0245b9bdc8f632 ******/
		%feature("compactdefaultargs") ToString;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns the full pass as a formatted string.
") ToString;
		TCollection_AsciiString ToString();


%extend{
    bool __eq_wrapper__(const XCAFDoc_AssemblyItemId other) {
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


%extend XCAFDoc_AssemblyItemId {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class XCAFDoc_AssemblyItemRef *
********************************/
class XCAFDoc_AssemblyItemRef : public TDF_Attribute {
	public:
		/****** XCAFDoc_AssemblyItemRef::XCAFDoc_AssemblyItemRef ******/
		/****** md5 signature: 7f77a642c1be436263b736d0b2eb7d35 ******/
		%feature("compactdefaultargs") XCAFDoc_AssemblyItemRef;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty reference attribute.
") XCAFDoc_AssemblyItemRef;
		 XCAFDoc_AssemblyItemRef();

		/****** XCAFDoc_AssemblyItemRef::ClearExtraRef ******/
		/****** md5 signature: 263d6cb44cbbb2149f9558d7817e131b ******/
		%feature("compactdefaultargs") ClearExtraRef;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reverts the reference to empty state.
") ClearExtraRef;
		void ClearExtraRef();

		/****** XCAFDoc_AssemblyItemRef::Dump ******/
		/****** md5 signature: 93728f1e04c6a4610b0181e40f01badf ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
theOS: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		Standard_OStream & Dump(std::ostream &OutValue);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** XCAFDoc_AssemblyItemRef::Get ******/
		/****** md5 signature: 3d90b76d3b6cdf628ef6575cb2d33050 ******/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label

Return
-------
opencascade::handle<XCAFDoc_AssemblyItemRef>

Description
-----------
Finds a reference attribute on the given label and returns it, if it is found.
") Get;
		static opencascade::handle<XCAFDoc_AssemblyItemRef> Get(const TDF_Label & theLabel);

		/****** XCAFDoc_AssemblyItemRef::GetGUID ******/
		/****** md5 signature: 4035298df9b7a3ee1fc784f10276a0bf ******/
		%feature("compactdefaultargs") GetGUID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Returns the assembly item's attribute that the reference points to. If the reference doesn't point to an attribute, returns an empty GUID.
") GetGUID;
		Standard_GUID GetGUID();

		/****** XCAFDoc_AssemblyItemRef::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") GetID;
		static const Standard_GUID & GetID();

		/****** XCAFDoc_AssemblyItemRef::GetItem ******/
		/****** md5 signature: b6a222a305b35c43f5b5bf5c092a486c ******/
		%feature("compactdefaultargs") GetItem;
		%feature("autodoc", "Return
-------
XCAFDoc_AssemblyItemId

Description
-----------
Returns the assembly item ID that the reference points to.
") GetItem;
		const XCAFDoc_AssemblyItemId & GetItem();

		/****** XCAFDoc_AssemblyItemRef::GetSubshapeIndex ******/
		/****** md5 signature: c73d45a1e4cd1f6f5f40cd59efee0614 ******/
		%feature("compactdefaultargs") GetSubshapeIndex;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the assembly item's subshape that the reference points to. If the reference doesn't point to a subshape, returns 0.
") GetSubshapeIndex;
		int GetSubshapeIndex();

		/****** XCAFDoc_AssemblyItemRef::HasExtraRef ******/
		/****** md5 signature: ac2c75576791a4213e939ccaee951812 ******/
		%feature("compactdefaultargs") HasExtraRef;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Checks if the reference points on an item's shapeindex or attribute.
") HasExtraRef;
		bool HasExtraRef();

		/****** XCAFDoc_AssemblyItemRef::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** XCAFDoc_AssemblyItemRef::IsGUID ******/
		/****** md5 signature: 406edfebaac23b40f32e05ad4bd39da8 ******/
		%feature("compactdefaultargs") IsGUID;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Checks is the reference points to an item's attribute.
") IsGUID;
		bool IsGUID();

		/****** XCAFDoc_AssemblyItemRef::IsOrphan ******/
		/****** md5 signature: 31bfe2ddd51c4cf8aa5b8b81ec3650c8 ******/
		%feature("compactdefaultargs") IsOrphan;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Checks if the reference points to a really existing item in XDE document.
") IsOrphan;
		bool IsOrphan();

		/****** XCAFDoc_AssemblyItemRef::IsSubshapeIndex ******/
		/****** md5 signature: ab3ea2362f4571c5017b6747e1dbbcef ******/
		%feature("compactdefaultargs") IsSubshapeIndex;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Checks is the reference points to an item's subshape.
") IsSubshapeIndex;
		bool IsSubshapeIndex();

		/****** XCAFDoc_AssemblyItemRef::NewEmpty ******/
		/****** md5 signature: 4ebad80fa2cacb9f9e231bbb83a29a98 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** XCAFDoc_AssemblyItemRef::Paste ******/
		/****** md5 signature: 613080067c5023e60243d9a07dced7b6 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
theAttrInto: TDF_Attribute
theRT: TDF_RelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & theAttrInto, const opencascade::handle<TDF_RelocationTable> & theRT);

		/****** XCAFDoc_AssemblyItemRef::Restore ******/
		/****** md5 signature: 93ec1c35e22a62dd86fc70c54564a087 ******/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
theAttrFrom: TDF_Attribute

Return
-------
None

Description
-----------
No available documentation.
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & theAttrFrom);

		/****** XCAFDoc_AssemblyItemRef::Set ******/
		/****** md5 signature: bd9d6e07b3021dd893a192411c53dd3d ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label
theItemId: XCAFDoc_AssemblyItemId

Return
-------
opencascade::handle<XCAFDoc_AssemblyItemRef>

Description
-----------
Create (if not exist) a reference to an assembly item. \param[in] theLabel - label to add the attribute. \param[in] theItemId - assembly item ID. eturn A handle to the attribute instance.
") Set;
		static opencascade::handle<XCAFDoc_AssemblyItemRef> Set(const TDF_Label & theLabel, const XCAFDoc_AssemblyItemId & theItemId);

		/****** XCAFDoc_AssemblyItemRef::Set ******/
		/****** md5 signature: c006d20ee52a9083de594f6d92d17432 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label
theItemId: XCAFDoc_AssemblyItemId
theGUID: Standard_GUID

Return
-------
opencascade::handle<XCAFDoc_AssemblyItemRef>

Description
-----------
Create (if not exist) a reference to an assembly item's label attribute. \param[in] theLabel - label to add the attribute. \param[in] theItemId - assembly item ID. \param[in] theGUID - assembly item's label attribute ID. eturn A handle to the attribute instance.
") Set;
		static opencascade::handle<XCAFDoc_AssemblyItemRef> Set(const TDF_Label & theLabel, const XCAFDoc_AssemblyItemId & theItemId, const Standard_GUID & theGUID);

		/****** XCAFDoc_AssemblyItemRef::Set ******/
		/****** md5 signature: d9d45642f6da3c372ae96cfb435d491f ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label
theItemId: XCAFDoc_AssemblyItemId
theShapeIndex: int

Return
-------
opencascade::handle<XCAFDoc_AssemblyItemRef>

Description
-----------
Create (if not exist) a reference to an assembly item's subshape. \param[in] theLabel - label to add the attribute. \param[in] theItemId - assembly item ID. \param[in] theShapeIndex - assembly item's subshape index. eturn A handle to the attribute instance.
") Set;
		static opencascade::handle<XCAFDoc_AssemblyItemRef> Set(const TDF_Label & theLabel, const XCAFDoc_AssemblyItemId & theItemId, const int theShapeIndex);

		/****** XCAFDoc_AssemblyItemRef::SetGUID ******/
		/****** md5 signature: cee186262c3d0db0336ec4c42cee0136 ******/
		%feature("compactdefaultargs") SetGUID;
		%feature("autodoc", "
Parameters
----------
theAttrGUID: Standard_GUID

Return
-------
None

Description
-----------
Sets the assembly item's label attribute that the reference points to. The base assembly item will not change.
") SetGUID;
		void SetGUID(const Standard_GUID & theAttrGUID);

		/****** XCAFDoc_AssemblyItemRef::SetItem ******/
		/****** md5 signature: 0b321c4a6177112c45f4d4bd9c118caf ******/
		%feature("compactdefaultargs") SetItem;
		%feature("autodoc", "
Parameters
----------
theItemId: XCAFDoc_AssemblyItemId

Return
-------
None

Description
-----------
Sets the assembly item ID that the reference points to. Extra reference data (if any) will be cleared.
") SetItem;
		void SetItem(const XCAFDoc_AssemblyItemId & theItemId);

		/****** XCAFDoc_AssemblyItemRef::SetItem ******/
		/****** md5 signature: 7d47fd08534fee4b22ef924815af05d6 ******/
		%feature("compactdefaultargs") SetItem;
		%feature("autodoc", "
Parameters
----------
thePath: TColStd_ListOfAsciiString

Return
-------
None

Description
-----------
Sets the assembly item ID from a list of label entries that the reference points to. Extra reference data (if any) will be cleared.
") SetItem;
		void SetItem(const TColStd_ListOfAsciiString & thePath);

		/****** XCAFDoc_AssemblyItemRef::SetItem ******/
		/****** md5 signature: ed6d4d7b28f4f31e5058482ec17190c4 ******/
		%feature("compactdefaultargs") SetItem;
		%feature("autodoc", "
Parameters
----------
theString: str

Return
-------
None

Description
-----------
Sets the assembly item ID from a formatted path that the reference points to. Extra reference data (if any) will be cleared.
") SetItem;
		void SetItem(TCollection_AsciiString theString);

		/****** XCAFDoc_AssemblyItemRef::SetSubshapeIndex ******/
		/****** md5 signature: 0b6c1dc95d5869920d92bc57e3dd6280 ******/
		%feature("compactdefaultargs") SetSubshapeIndex;
		%feature("autodoc", "
Parameters
----------
theShapeIndex: int

Return
-------
None

Description
-----------
Sets the assembly item's subshape that the reference points to. The base assembly item will not change.
") SetSubshapeIndex;
		void SetSubshapeIndex(int theShapeIndex);

};


%make_alias(XCAFDoc_AssemblyItemRef)

%extend XCAFDoc_AssemblyItemRef {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class XCAFDoc_AssemblyIterator *
*********************************/
class XCAFDoc_AssemblyIterator {
	public:
		class AuxAssemblyItem {};
		/****** XCAFDoc_AssemblyIterator::XCAFDoc_AssemblyIterator ******/
		/****** md5 signature: d3156ffbff97e2b72376816e9c5ea4be ******/
		%feature("compactdefaultargs") XCAFDoc_AssemblyIterator;
		%feature("autodoc", "
Parameters
----------
theDoc: TDocStd_Document
theLevel: int (optional, default to INT_MAX)

Return
-------
None

Description
-----------
Constructs iterator starting from assembly roots. \param[in] theDoc - document to iterate. \param [in, opt] theLevel - max level of hierarchy to reach (INT_MAX is for no limit).
") XCAFDoc_AssemblyIterator;
		 XCAFDoc_AssemblyIterator(const opencascade::handle<TDocStd_Document> & theDoc, const int theLevel = INT_MAX);

		/****** XCAFDoc_AssemblyIterator::XCAFDoc_AssemblyIterator ******/
		/****** md5 signature: f3065495b345cd13c7c407275b3dc2b5 ******/
		%feature("compactdefaultargs") XCAFDoc_AssemblyIterator;
		%feature("autodoc", "
Parameters
----------
theDoc: TDocStd_Document
theRoot: XCAFDoc_AssemblyItemId
theLevel: int (optional, default to INT_MAX)

Return
-------
None

Description
-----------
Constructs iterator starting from the specified position in the assembly tree. \param[in] theDoc - document to iterate. \param[in] theRoot - assembly item to start iterating from. \param [in, opt] theLevel - max level of hierarchy to reach (INT_MAX is for no limit).
") XCAFDoc_AssemblyIterator;
		 XCAFDoc_AssemblyIterator(const opencascade::handle<TDocStd_Document> & theDoc, const XCAFDoc_AssemblyItemId & theRoot, const int theLevel = INT_MAX);

		/****** XCAFDoc_AssemblyIterator::Current ******/
		/****** md5 signature: 3c4f769b7dbbbef61faa7e2c796471ec ******/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "Return
-------
XCAFDoc_AssemblyItemId

Description
-----------
eturn current item.
") Current;
		XCAFDoc_AssemblyItemId Current();

		/****** XCAFDoc_AssemblyIterator::More ******/
		/****** md5 signature: 922f3b0d43975d648336ba28bdfd0416 ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
eturn true if there is still something to iterate, false -- otherwise.
") More;
		bool More();

		/****** XCAFDoc_AssemblyIterator::Next ******/
		/****** md5 signature: f35c0df5f1d7c877986db18081404532 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
Moves depth-first iterator to the next position.
") Next;
		void Next();

};


%extend XCAFDoc_AssemblyIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class XCAFDoc_AssemblyTool *
*****************************/
class XCAFDoc_AssemblyTool {
	public:
};


%extend XCAFDoc_AssemblyTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class XCAFDoc_Centroid *
*************************/
class XCAFDoc_Centroid : public TDF_Attribute {
	public:
		/****** XCAFDoc_Centroid::XCAFDoc_Centroid ******/
		/****** md5 signature: ae330113df9c3495a25e9d03ac73cfcd ******/
		%feature("compactdefaultargs") XCAFDoc_Centroid;
		%feature("autodoc", "Return
-------
None

Description
-----------
class methods =============.
") XCAFDoc_Centroid;
		 XCAFDoc_Centroid();

		/****** XCAFDoc_Centroid::Dump ******/
		/****** md5 signature: c3832f0735de2bdac14af95fe6ce7de3 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOS: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		Standard_OStream & Dump(std::ostream &OutValue);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** XCAFDoc_Centroid::Get ******/
		/****** md5 signature: 6858beb2d2926012952734f9982f4540 ******/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Get;
		gp_Pnt Get();

		/****** XCAFDoc_Centroid::Get ******/
		/****** md5 signature: 6ec791c18ce81e5ae29e82798fd62734 ******/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
pnt: gp_Pnt

Return
-------
bool

Description
-----------
Returns point as argument returns false if no such attribute at the <label>.
") Get;
		static bool Get(const TDF_Label & label, gp_Pnt & pnt);

		/****** XCAFDoc_Centroid::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") GetID;
		static const Standard_GUID & GetID();

		/****** XCAFDoc_Centroid::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** XCAFDoc_Centroid::NewEmpty ******/
		/****** md5 signature: 4ebad80fa2cacb9f9e231bbb83a29a98 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** XCAFDoc_Centroid::Paste ******/
		/****** md5 signature: bfece7a0e37cb5034ac0b2a8c488da37 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Into: TDF_Attribute
RT: TDF_RelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****** XCAFDoc_Centroid::Restore ******/
		/****** md5 signature: 8bde8d15cc1907242b8c43fe6eb18f19 ******/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
With: TDF_Attribute

Return
-------
None

Description
-----------
No available documentation.
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****** XCAFDoc_Centroid::Set ******/
		/****** md5 signature: e2324d1e7f5b53a63e38d29ef2d7c8ca ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
pnt: gp_Pnt

Return
-------
opencascade::handle<XCAFDoc_Centroid>

Description
-----------
Find, or create, a Location attribute and set it's value the Location attribute is returned. Location methods ===============.
") Set;
		static opencascade::handle<XCAFDoc_Centroid> Set(const TDF_Label & label, const gp_Pnt & pnt);

		/****** XCAFDoc_Centroid::Set ******/
		/****** md5 signature: c54194e78dc1d9312645386e87138447 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
pnt: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const gp_Pnt & pnt);

};


%make_alias(XCAFDoc_Centroid)

%extend XCAFDoc_Centroid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class XCAFDoc_ClippingPlaneTool *
**********************************/
class XCAFDoc_ClippingPlaneTool : public TDataStd_GenericEmpty {
	public:
		/****** XCAFDoc_ClippingPlaneTool::XCAFDoc_ClippingPlaneTool ******/
		/****** md5 signature: 522fcfb25b1352fbc544ea4eca6f8810 ******/
		%feature("compactdefaultargs") XCAFDoc_ClippingPlaneTool;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") XCAFDoc_ClippingPlaneTool;
		 XCAFDoc_ClippingPlaneTool();

		/****** XCAFDoc_ClippingPlaneTool::AddClippingPlane ******/
		/****** md5 signature: 05a9d995f8bd10daa8585832af578869 ******/
		%feature("compactdefaultargs") AddClippingPlane;
		%feature("autodoc", "
Parameters
----------
thePlane: gp_Pln
theName: str
theCapping: bool

Return
-------
TDF_Label

Description
-----------
Adds a clipping plane definition to a ClippingPlane table and returns its label (returns existing label if the same clipping plane is already defined).
") AddClippingPlane;
		TDF_Label AddClippingPlane(const gp_Pln & thePlane, TCollection_ExtendedString theName, const bool theCapping);

		/****** XCAFDoc_ClippingPlaneTool::AddClippingPlane ******/
		/****** md5 signature: 99a8053841f66cc004a33e0dffbb3d22 ******/
		%feature("compactdefaultargs") AddClippingPlane;
		%feature("autodoc", "
Parameters
----------
thePlane: gp_Pln
theName: TCollection_HAsciiString
theCapping: bool

Return
-------
TDF_Label

Description
-----------
Adds a clipping plane definition to a ClippingPlane table and returns its label (returns existing label if the same clipping plane is already defined).
") AddClippingPlane;
		TDF_Label AddClippingPlane(const gp_Pln & thePlane, const opencascade::handle<TCollection_HAsciiString> & theName, const bool theCapping);

		/****** XCAFDoc_ClippingPlaneTool::AddClippingPlane ******/
		/****** md5 signature: 99178b0fee8b169641a9e510091515c7 ******/
		%feature("compactdefaultargs") AddClippingPlane;
		%feature("autodoc", "
Parameters
----------
thePlane: gp_Pln
theName: str

Return
-------
TDF_Label

Description
-----------
Adds a clipping plane definition to a ClippingPlane table and returns its label (returns existing label if the same clipping plane is already defined).
") AddClippingPlane;
		TDF_Label AddClippingPlane(const gp_Pln & thePlane, TCollection_ExtendedString theName);

		/****** XCAFDoc_ClippingPlaneTool::AddClippingPlane ******/
		/****** md5 signature: 39b67f88acdbae8d7a347f43242b6396 ******/
		%feature("compactdefaultargs") AddClippingPlane;
		%feature("autodoc", "
Parameters
----------
thePlane: gp_Pln
theName: TCollection_HAsciiString

Return
-------
TDF_Label

Description
-----------
Adds a clipping plane definition to a ClippingPlane table and returns its label (returns existing label if the same clipping plane is already defined).
") AddClippingPlane;
		TDF_Label AddClippingPlane(const gp_Pln & thePlane, const opencascade::handle<TCollection_HAsciiString> & theName);

		/****** XCAFDoc_ClippingPlaneTool::BaseLabel ******/
		/****** md5 signature: cb499d8135863e96e585085d0b85c75a ******/
		%feature("compactdefaultargs") BaseLabel;
		%feature("autodoc", "Return
-------
TDF_Label

Description
-----------
returns the label under which ClippingPlanes are stored.
") BaseLabel;
		TDF_Label BaseLabel();

		/****** XCAFDoc_ClippingPlaneTool::GetCapping ******/
		/****** md5 signature: bba2e52679761460b5397de1bbf6434b ******/
		%feature("compactdefaultargs") GetCapping;
		%feature("autodoc", "
Parameters
----------
theClippingPlaneL: TDF_Label

Return
-------
bool

Description
-----------
Get capping value for given clipping plane label Return capping value.
") GetCapping;
		bool GetCapping(const TDF_Label & theClippingPlaneL);

		/****** XCAFDoc_ClippingPlaneTool::GetCapping ******/
		/****** md5 signature: db11044316e364165673a06e6717cdcb ******/
		%feature("compactdefaultargs") GetCapping;
		%feature("autodoc", "
Parameters
----------
theClippingPlaneL: TDF_Label

Return
-------
theCapping: bool

Description
-----------
Get capping value for given clipping plane label Return true if Label is valid and capping exists.
") GetCapping;
		bool GetCapping(const TDF_Label & theClippingPlaneL, Standard_Boolean &OutValue);

		/****** XCAFDoc_ClippingPlaneTool::GetClippingPlane ******/
		/****** md5 signature: dacf0bb10b55fd3bf7dd402f52047a1a ******/
		%feature("compactdefaultargs") GetClippingPlane;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label
thePlane: gp_Pln
theName: str

Return
-------
theCapping: bool

Description
-----------
Returns ClippingPlane defined by label lab Returns False if the label is not in ClippingPlane table or does not define a ClippingPlane.
") GetClippingPlane;
		bool GetClippingPlane(const TDF_Label & theLabel, gp_Pln & thePlane, TCollection_ExtendedString & theName, Standard_Boolean &OutValue);

		/****** XCAFDoc_ClippingPlaneTool::GetClippingPlane ******/
		/****** md5 signature: c826a509847515dced8cc557a7504a0b ******/
		%feature("compactdefaultargs") GetClippingPlane;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label
thePlane: gp_Pln

Return
-------
theName: TCollection_HAsciiString
theCapping: bool

Description
-----------
Returns ClippingPlane defined by label lab Returns False if the label is not in ClippingPlane table or does not define a ClippingPlane.
") GetClippingPlane;
		bool GetClippingPlane(const TDF_Label & theLabel, gp_Pln & thePlane, opencascade::handle<TCollection_HAsciiString> &OutValue, Standard_Boolean &OutValue);

		/****** XCAFDoc_ClippingPlaneTool::GetClippingPlanes ******/
		/****** md5 signature: a34af0d0ca3753703d5e03661daf8bec ******/
		%feature("compactdefaultargs") GetClippingPlanes;
		%feature("autodoc", "
Parameters
----------
Labels: TDF_LabelSequence

Return
-------
None

Description
-----------
Returns a sequence of clipping planes currently stored in the ClippingPlane table.
") GetClippingPlanes;
		void GetClippingPlanes(TDF_LabelSequence & Labels);

		/****** XCAFDoc_ClippingPlaneTool::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") GetID;
		static const Standard_GUID & GetID();

		/****** XCAFDoc_ClippingPlaneTool::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** XCAFDoc_ClippingPlaneTool::IsClippingPlane ******/
		/****** md5 signature: 9fab344c4b4658152141bda0c924c05e ******/
		%feature("compactdefaultargs") IsClippingPlane;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label

Return
-------
bool

Description
-----------
Returns True if label belongs to a ClippingPlane table and is a ClippingPlane definition.
") IsClippingPlane;
		bool IsClippingPlane(const TDF_Label & theLabel);

		/****** XCAFDoc_ClippingPlaneTool::RemoveClippingPlane ******/
		/****** md5 signature: 34de3a6394d2aba3cb4235420b396ec6 ******/
		%feature("compactdefaultargs") RemoveClippingPlane;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label

Return
-------
bool

Description
-----------
Removes clipping plane from the ClippingPlane table Return false and do nothing if clipping plane is referenced in at least one View.
") RemoveClippingPlane;
		bool RemoveClippingPlane(const TDF_Label & theLabel);

		/****** XCAFDoc_ClippingPlaneTool::Set ******/
		/****** md5 signature: 14dc48a9915ce467ffda532089e7780c ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label

Return
-------
opencascade::handle<XCAFDoc_ClippingPlaneTool>

Description
-----------
Creates (if not exist) ClippingPlaneTool.
") Set;
		static opencascade::handle<XCAFDoc_ClippingPlaneTool> Set(const TDF_Label & theLabel);

		/****** XCAFDoc_ClippingPlaneTool::SetCapping ******/
		/****** md5 signature: f04b6b84d11a412fe112bf654504fe17 ******/
		%feature("compactdefaultargs") SetCapping;
		%feature("autodoc", "
Parameters
----------
theClippingPlaneL: TDF_Label
theCapping: bool

Return
-------
None

Description
-----------
Set new value of capping for given clipping plane label.
") SetCapping;
		void SetCapping(const TDF_Label & theClippingPlaneL, const bool theCapping);

		/****** XCAFDoc_ClippingPlaneTool::UpdateClippingPlane ******/
		/****** md5 signature: 357e65a08bcce2bae64fb69d5e937894 ******/
		%feature("compactdefaultargs") UpdateClippingPlane;
		%feature("autodoc", "
Parameters
----------
theLabelL: TDF_Label
thePlane: gp_Pln
theName: str

Return
-------
None

Description
-----------
Sets new value of plane and name to the given clipping plane label or do nothing, if the given label is not a clipping plane label.
") UpdateClippingPlane;
		void UpdateClippingPlane(const TDF_Label & theLabelL, const gp_Pln & thePlane, TCollection_ExtendedString theName);

};


%make_alias(XCAFDoc_ClippingPlaneTool)

%extend XCAFDoc_ClippingPlaneTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class XCAFDoc_Color *
**********************/
class XCAFDoc_Color : public TDF_Attribute {
	public:
		/****** XCAFDoc_Color::XCAFDoc_Color ******/
		/****** md5 signature: 90f95c5238144ae2afcc3df0a9c37fb1 ******/
		%feature("compactdefaultargs") XCAFDoc_Color;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") XCAFDoc_Color;
		 XCAFDoc_Color();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** XCAFDoc_Color::GetAlpha ******/
		/****** md5 signature: 5dad5187780a4f586e75b266cb24b04a ******/
		%feature("compactdefaultargs") GetAlpha;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") GetAlpha;
		float GetAlpha();

		/****** XCAFDoc_Color::GetColor ******/
		/****** md5 signature: d4c30997bc0976f42c148c7003c6321b ******/
		%feature("compactdefaultargs") GetColor;
		%feature("autodoc", "Return
-------
Quantity_Color

Description
-----------
No available documentation.
") GetColor;
		const Quantity_Color & GetColor();

		/****** XCAFDoc_Color::GetColorRGBA ******/
		/****** md5 signature: 246f8061881801800ffaa798bf268100 ******/
		%feature("compactdefaultargs") GetColorRGBA;
		%feature("autodoc", "Return
-------
Quantity_ColorRGBA

Description
-----------
No available documentation.
") GetColorRGBA;
		const Quantity_ColorRGBA & GetColorRGBA();

		/****** XCAFDoc_Color::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") GetID;
		static const Standard_GUID & GetID();

		/****** XCAFDoc_Color::GetNOC ******/
		/****** md5 signature: ebb86be7317e9845d6927cc622e251b8 ******/
		%feature("compactdefaultargs") GetNOC;
		%feature("autodoc", "Return
-------
Quantity_NameOfColor

Description
-----------
No available documentation.
") GetNOC;
		Quantity_NameOfColor GetNOC();

		/****** XCAFDoc_Color::GetRGB ******/
		/****** md5 signature: 77fdfe2c109a195827c4074b156a24cc ******/
		%feature("compactdefaultargs") GetRGB;
		%feature("autodoc", "
Parameters
----------

Return
-------
R: double
G: double
B: double

Description
-----------
No available documentation.
") GetRGB;
		void GetRGB(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** XCAFDoc_Color::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** XCAFDoc_Color::NewEmpty ******/
		/****** md5 signature: 4ebad80fa2cacb9f9e231bbb83a29a98 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** XCAFDoc_Color::Paste ******/
		/****** md5 signature: bfece7a0e37cb5034ac0b2a8c488da37 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Into: TDF_Attribute
RT: TDF_RelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****** XCAFDoc_Color::Restore ******/
		/****** md5 signature: 8bde8d15cc1907242b8c43fe6eb18f19 ******/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
With: TDF_Attribute

Return
-------
None

Description
-----------
No available documentation.
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****** XCAFDoc_Color::Set ******/
		/****** md5 signature: 511b838bc44cd703059a095b81fd1667 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
C: Quantity_Color

Return
-------
opencascade::handle<XCAFDoc_Color>

Description
-----------
No available documentation.
") Set;
		static opencascade::handle<XCAFDoc_Color> Set(const TDF_Label & label, const Quantity_Color & C);

		/****** XCAFDoc_Color::Set ******/
		/****** md5 signature: e4659b3e8995913bb915d93176bf069b ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
C: Quantity_ColorRGBA

Return
-------
opencascade::handle<XCAFDoc_Color>

Description
-----------
No available documentation.
") Set;
		static opencascade::handle<XCAFDoc_Color> Set(const TDF_Label & label, const Quantity_ColorRGBA & C);

		/****** XCAFDoc_Color::Set ******/
		/****** md5 signature: 364f02967eadb97fd87574772ac1d8de ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
C: Quantity_NameOfColor

Return
-------
opencascade::handle<XCAFDoc_Color>

Description
-----------
No available documentation.
") Set;
		static opencascade::handle<XCAFDoc_Color> Set(const TDF_Label & label, const Quantity_NameOfColor C);

		/****** XCAFDoc_Color::Set ******/
		/****** md5 signature: dbb6485ec4613495d3fd91882d6e2a5e ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
R: double
G: double
B: double
alpha: double (optional, default to 1.0)

Return
-------
opencascade::handle<XCAFDoc_Color>

Description
-----------
Find, or create, a Color attribute and set it's value the Color attribute is returned.
") Set;
		static opencascade::handle<XCAFDoc_Color> Set(const TDF_Label & label, const double R, const double G, const double B, const double alpha = 1.0);

		/****** XCAFDoc_Color::Set ******/
		/****** md5 signature: 950c30f558d1ea0d05615f065e775e47 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
C: Quantity_Color

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const Quantity_Color & C);

		/****** XCAFDoc_Color::Set ******/
		/****** md5 signature: f1c108ff086ceecd317a84ff18c426cc ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
C: Quantity_ColorRGBA

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const Quantity_ColorRGBA & C);

		/****** XCAFDoc_Color::Set ******/
		/****** md5 signature: 7123deed59babe8053430671a14b1fe8 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
C: Quantity_NameOfColor

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const Quantity_NameOfColor C);

		/****** XCAFDoc_Color::Set ******/
		/****** md5 signature: ee609d40a57602df90e5118b2460af4f ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
R: double
G: double
B: double
alpha: double (optional, default to 1.0)

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const double R, const double G, const double B, const double alpha = 1.0);

};


%make_alias(XCAFDoc_Color)

%extend XCAFDoc_Color {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class XCAFDoc_ColorTool *
**************************/
class XCAFDoc_ColorTool : public TDataStd_GenericEmpty {
	public:
		/****** XCAFDoc_ColorTool::XCAFDoc_ColorTool ******/
		/****** md5 signature: f6ed5417f3b128e0a824bdc9feaffa0f ******/
		%feature("compactdefaultargs") XCAFDoc_ColorTool;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") XCAFDoc_ColorTool;
		 XCAFDoc_ColorTool();

		/****** XCAFDoc_ColorTool::AddColor ******/
		/****** md5 signature: 78ce80768a36bafba89dd722c911c784 ******/
		%feature("compactdefaultargs") AddColor;
		%feature("autodoc", "
Parameters
----------
col: Quantity_Color

Return
-------
TDF_Label

Description
-----------
Adds a color definition to a colortable and returns its label (returns existing label if the same color is already defined).
") AddColor;
		TDF_Label AddColor(const Quantity_Color & col);

		/****** XCAFDoc_ColorTool::AddColor ******/
		/****** md5 signature: e5c15a7ac5d4ca8bf140149494253a9a ******/
		%feature("compactdefaultargs") AddColor;
		%feature("autodoc", "
Parameters
----------
col: Quantity_ColorRGBA

Return
-------
TDF_Label

Description
-----------
Adds a color definition to a colortable and returns its label (returns existing label if the same color is already defined).
") AddColor;
		TDF_Label AddColor(const Quantity_ColorRGBA & col);

		/****** XCAFDoc_ColorTool::AutoNaming ******/
		/****** md5 signature: 1256b9087c5fb5b8cd4b95d81d22b205 ******/
		%feature("compactdefaultargs") AutoNaming;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns current auto-naming mode; True by default. If True then for added colors the TDataStd_Name attribute will be automatically added. This setting is global.
") AutoNaming;
		static bool AutoNaming();

		/****** XCAFDoc_ColorTool::BaseLabel ******/
		/****** md5 signature: cb499d8135863e96e585085d0b85c75a ******/
		%feature("compactdefaultargs") BaseLabel;
		%feature("autodoc", "Return
-------
TDF_Label

Description
-----------
returns the label under which colors are stored.
") BaseLabel;
		TDF_Label BaseLabel();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** XCAFDoc_ColorTool::FindColor ******/
		/****** md5 signature: 0529130f8d780b676a70676b61ca642a ******/
		%feature("compactdefaultargs") FindColor;
		%feature("autodoc", "
Parameters
----------
col: Quantity_Color
lab: TDF_Label

Return
-------
bool

Description
-----------
Finds a color definition in a colortable and returns its label if found Returns False if color is not found in colortable.
") FindColor;
		bool FindColor(const Quantity_Color & col, TDF_Label & lab);

		/****** XCAFDoc_ColorTool::FindColor ******/
		/****** md5 signature: 412458c193c4ca4c0eb1d466b05413fc ******/
		%feature("compactdefaultargs") FindColor;
		%feature("autodoc", "
Parameters
----------
col: Quantity_ColorRGBA
lab: TDF_Label

Return
-------
bool

Description
-----------
Finds a color definition in a colortable and returns its label if found Returns False if color is not found in colortable.
") FindColor;
		bool FindColor(const Quantity_ColorRGBA & col, TDF_Label & lab);

		/****** XCAFDoc_ColorTool::FindColor ******/
		/****** md5 signature: 1a4423bd5d3c7bbec127ad385848bbc8 ******/
		%feature("compactdefaultargs") FindColor;
		%feature("autodoc", "
Parameters
----------
col: Quantity_Color

Return
-------
TDF_Label

Description
-----------
Finds a color definition in a colortable and returns its label if found (or Null label else).
") FindColor;
		TDF_Label FindColor(const Quantity_Color & col);

		/****** XCAFDoc_ColorTool::FindColor ******/
		/****** md5 signature: a148889c39cc78ed52fbc1c8658b5ffd ******/
		%feature("compactdefaultargs") FindColor;
		%feature("autodoc", "
Parameters
----------
col: Quantity_ColorRGBA

Return
-------
TDF_Label

Description
-----------
Finds a color definition in a colortable and returns its label if found (or Null label else).
") FindColor;
		TDF_Label FindColor(const Quantity_ColorRGBA & col);

		/****** XCAFDoc_ColorTool::GetColor ******/
		/****** md5 signature: ae861b01b9745e790d9b18515bdbaada ******/
		%feature("compactdefaultargs") GetColor;
		%feature("autodoc", "
Parameters
----------
lab: TDF_Label
col: Quantity_Color

Return
-------
bool

Description
-----------
Returns color defined by label lab Returns False if the label is not in colortable or does not define a color.
") GetColor;
		static bool GetColor(const TDF_Label & lab, Quantity_Color & col);

		/****** XCAFDoc_ColorTool::GetColor ******/
		/****** md5 signature: 02df35a9dc6b997e853f2e8ad3ef50f1 ******/
		%feature("compactdefaultargs") GetColor;
		%feature("autodoc", "
Parameters
----------
lab: TDF_Label
col: Quantity_ColorRGBA

Return
-------
bool

Description
-----------
Returns color defined by label lab Returns False if the label is not in colortable or does not define a color.
") GetColor;
		static bool GetColor(const TDF_Label & lab, Quantity_ColorRGBA & col);

		/****** XCAFDoc_ColorTool::GetColor ******/
		/****** md5 signature: 3b2b409e7497cd3ef89f4cc818f7599f ******/
		%feature("compactdefaultargs") GetColor;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label
type: XCAFDoc_ColorType
colorL: TDF_Label

Return
-------
bool

Description
-----------
Returns label with color assigned to <L> as <type> Returns False if no such color is assigned.
") GetColor;
		static bool GetColor(const TDF_Label & L, const XCAFDoc_ColorType type, TDF_Label & colorL);

		/****** XCAFDoc_ColorTool::GetColor ******/
		/****** md5 signature: fe5174a9bf7e7665ddba838f74a6cf96 ******/
		%feature("compactdefaultargs") GetColor;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label
type: XCAFDoc_ColorType
color: Quantity_Color

Return
-------
bool

Description
-----------
Returns color assigned to <L> as <type> Returns False if no such color is assigned.
") GetColor;
		static bool GetColor(const TDF_Label & L, const XCAFDoc_ColorType type, Quantity_Color & color);

		/****** XCAFDoc_ColorTool::GetColor ******/
		/****** md5 signature: a41909ce1471ef3897633fabf42774f7 ******/
		%feature("compactdefaultargs") GetColor;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label
type: XCAFDoc_ColorType
color: Quantity_ColorRGBA

Return
-------
bool

Description
-----------
Returns color assigned to <L> as <type> Returns False if no such color is assigned.
") GetColor;
		static bool GetColor(const TDF_Label & L, const XCAFDoc_ColorType type, Quantity_ColorRGBA & color);

		/****** XCAFDoc_ColorTool::GetColor ******/
		/****** md5 signature: b4d45ef71fbf90f1f7e2804184b32f2e ******/
		%feature("compactdefaultargs") GetColor;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
type: XCAFDoc_ColorType
colorL: TDF_Label

Return
-------
bool

Description
-----------
Returns label with color assigned to <L> as <type> Returns False if no such color is assigned.
") GetColor;
		bool GetColor(const TopoDS_Shape & S, const XCAFDoc_ColorType type, TDF_Label & colorL);

		/****** XCAFDoc_ColorTool::GetColor ******/
		/****** md5 signature: 281b62784db4382391b357505bbf65f5 ******/
		%feature("compactdefaultargs") GetColor;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
type: XCAFDoc_ColorType
color: Quantity_Color

Return
-------
bool

Description
-----------
Returns color assigned to <L> as <type> Returns False if no such color is assigned.
") GetColor;
		bool GetColor(const TopoDS_Shape & S, const XCAFDoc_ColorType type, Quantity_Color & color);

		/****** XCAFDoc_ColorTool::GetColor ******/
		/****** md5 signature: f8bb07652a478e85cc14f41c31b70e78 ******/
		%feature("compactdefaultargs") GetColor;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
type: XCAFDoc_ColorType
color: Quantity_ColorRGBA

Return
-------
bool

Description
-----------
Returns color assigned to <L> as <type> Returns False if no such color is assigned.
") GetColor;
		bool GetColor(const TopoDS_Shape & S, const XCAFDoc_ColorType type, Quantity_ColorRGBA & color);

		/****** XCAFDoc_ColorTool::GetColors ******/
		/****** md5 signature: ad6501e5168a08515f93ee540df4deaf ******/
		%feature("compactdefaultargs") GetColors;
		%feature("autodoc", "
Parameters
----------
Labels: TDF_LabelSequence

Return
-------
None

Description
-----------
Returns a sequence of colors currently stored in the colortable.
") GetColors;
		void GetColors(TDF_LabelSequence & Labels);

		/****** XCAFDoc_ColorTool::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") GetID;
		static const Standard_GUID & GetID();

		/****** XCAFDoc_ColorTool::GetInstanceColor ******/
		/****** md5 signature: 8ff8a2b67b920ec19634ab36c16d2dc4 ******/
		%feature("compactdefaultargs") GetInstanceColor;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
type: XCAFDoc_ColorType
color: Quantity_Color

Return
-------
bool

Description
-----------
Gets the color of component that styled with SHUO structure Returns False if no sush component or color type.
") GetInstanceColor;
		bool GetInstanceColor(const TopoDS_Shape & theShape, const XCAFDoc_ColorType type, Quantity_Color & color);

		/****** XCAFDoc_ColorTool::GetInstanceColor ******/
		/****** md5 signature: 7ac59470beb053950712ae1283bb73d9 ******/
		%feature("compactdefaultargs") GetInstanceColor;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
type: XCAFDoc_ColorType
color: Quantity_ColorRGBA

Return
-------
bool

Description
-----------
Gets the color of component that styled with SHUO structure Returns False if no sush component or color type.
") GetInstanceColor;
		bool GetInstanceColor(const TopoDS_Shape & theShape, const XCAFDoc_ColorType type, Quantity_ColorRGBA & color);

		/****** XCAFDoc_ColorTool::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** XCAFDoc_ColorTool::IsColor ******/
		/****** md5 signature: 4311131a96b4024993951ff7d9ebea94 ******/
		%feature("compactdefaultargs") IsColor;
		%feature("autodoc", "
Parameters
----------
lab: TDF_Label

Return
-------
bool

Description
-----------
Returns True if label belongs to a colortable and is a color definition.
") IsColor;
		bool IsColor(const TDF_Label & lab);

		/****** XCAFDoc_ColorTool::IsColorByLayer ******/
		/****** md5 signature: 571b61993e87864c2501f264914bc052 ******/
		%feature("compactdefaultargs") IsColorByLayer;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label

Return
-------
bool

Description
-----------
Return True if object color defined by its Layer, False if not.
") IsColorByLayer;
		bool IsColorByLayer(const TDF_Label & L);

		/****** XCAFDoc_ColorTool::IsInstanceVisible ******/
		/****** md5 signature: 9cdfeed1d891600550af72e04c6be967 ******/
		%feature("compactdefaultargs") IsInstanceVisible;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
bool

Description
-----------
Gets the visibility status of component that styled with SHUO structure Returns False if no sush component.
") IsInstanceVisible;
		bool IsInstanceVisible(const TopoDS_Shape & theShape);

		/****** XCAFDoc_ColorTool::IsSet ******/
		/****** md5 signature: f91c9332217fa4cc86f1a566475f8b6a ******/
		%feature("compactdefaultargs") IsSet;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label
type: XCAFDoc_ColorType

Return
-------
bool

Description
-----------
Returns True if label <L> has a color assignment of the type <type>.
") IsSet;
		bool IsSet(const TDF_Label & L, const XCAFDoc_ColorType type);

		/****** XCAFDoc_ColorTool::IsSet ******/
		/****** md5 signature: 88c8b4b25d14470a71c693510c7c7a28 ******/
		%feature("compactdefaultargs") IsSet;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
type: XCAFDoc_ColorType

Return
-------
bool

Description
-----------
Returns True if label <L> has a color assignment of the type <type>.
") IsSet;
		bool IsSet(const TopoDS_Shape & S, const XCAFDoc_ColorType type);

		/****** XCAFDoc_ColorTool::IsVisible ******/
		/****** md5 signature: f1c004ff98995c7e7270e6adbfd35bd3 ******/
		%feature("compactdefaultargs") IsVisible;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label

Return
-------
bool

Description
-----------
Return True if object on this label is visible, False if invisible.
") IsVisible;
		static bool IsVisible(const TDF_Label & L);

		/****** XCAFDoc_ColorTool::RemoveColor ******/
		/****** md5 signature: 3e1749f5696dd21fe53c3eb3d8e77952 ******/
		%feature("compactdefaultargs") RemoveColor;
		%feature("autodoc", "
Parameters
----------
lab: TDF_Label

Return
-------
None

Description
-----------
Removes color from the colortable.
") RemoveColor;
		void RemoveColor(const TDF_Label & lab);

		/****** XCAFDoc_ColorTool::ReverseChainsOfTreeNodes ******/
		/****** md5 signature: 8c0209354c50a9a80f6b4ee8a2a5945a ******/
		%feature("compactdefaultargs") ReverseChainsOfTreeNodes;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Reverses order in chains of TreeNodes (from Last to First) under each Color Label since we became to use function ::Prepend() instead of ::Append() in method SetColor() for acceleration.
") ReverseChainsOfTreeNodes;
		bool ReverseChainsOfTreeNodes();

		/****** XCAFDoc_ColorTool::Set ******/
		/****** md5 signature: b64dbbaddbab53d4135ce29025f58d74 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label

Return
-------
opencascade::handle<XCAFDoc_ColorTool>

Description
-----------
Creates (if not exist) ColorTool.
") Set;
		static opencascade::handle<XCAFDoc_ColorTool> Set(const TDF_Label & L);

		/****** XCAFDoc_ColorTool::SetAutoNaming ******/
		/****** md5 signature: 759055c55f1c268d0c2f50e21cb6eda1 ******/
		%feature("compactdefaultargs") SetAutoNaming;
		%feature("autodoc", "
Parameters
----------
theIsAutoNaming: bool

Return
-------
None

Description
-----------
See also AutoNaming().
") SetAutoNaming;
		static void SetAutoNaming(bool theIsAutoNaming);

		/****** XCAFDoc_ColorTool::SetColor ******/
		/****** md5 signature: 88b8899f758e2e2c777de7c0158faf95 ******/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label
colorL: TDF_Label
type: XCAFDoc_ColorType

Return
-------
None

Description
-----------
Sets a link with GUID defined by <type> (see XCAFDoc::ColorRefGUID()) from label <L> to color defined by <colorL>. Color of shape is defined following way in dependance with type of color. If type of color is XCAFDoc_ColorGen - then this color defines default color for surfaces and curves. If for shape color with types XCAFDoc_ColorSurf or XCAFDoc_ColorCurv is specified then such color overrides generic color.
") SetColor;
		void SetColor(const TDF_Label & L, const TDF_Label & colorL, const XCAFDoc_ColorType type);

		/****** XCAFDoc_ColorTool::SetColor ******/
		/****** md5 signature: de1be3db1bce601aade3b825ac7d7d34 ******/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label
Color: Quantity_Color
type: XCAFDoc_ColorType

Return
-------
None

Description
-----------
Sets a link with GUID defined by <type> (see XCAFDoc::ColorRefGUID()) from label <L> to color <Color> in the colortable Adds a color as necessary.
") SetColor;
		void SetColor(const TDF_Label & L, const Quantity_Color & Color, const XCAFDoc_ColorType type);

		/****** XCAFDoc_ColorTool::SetColor ******/
		/****** md5 signature: 34ba97c1dca1aa80a46dddc421bfc6de ******/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label
Color: Quantity_ColorRGBA
type: XCAFDoc_ColorType

Return
-------
None

Description
-----------
Sets a link with GUID defined by <type> (see XCAFDoc::ColorRefGUID()) from label <L> to color <Color> in the colortable Adds a color as necessary.
") SetColor;
		void SetColor(const TDF_Label & L, const Quantity_ColorRGBA & Color, const XCAFDoc_ColorType type);

		/****** XCAFDoc_ColorTool::SetColor ******/
		/****** md5 signature: 67dbd19f1609a6a7b11ff7e5bf4eca9a ******/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
colorL: TDF_Label
type: XCAFDoc_ColorType

Return
-------
bool

Description
-----------
Sets a link with GUID defined by <type> (see XCAFDoc::ColorRefGUID()) from label <L> to color defined by <colorL> Returns False if cannot find a label for shape S.
") SetColor;
		bool SetColor(const TopoDS_Shape & S, const TDF_Label & colorL, const XCAFDoc_ColorType type);

		/****** XCAFDoc_ColorTool::SetColor ******/
		/****** md5 signature: a296d537ef6b396443f1c0a31148ad75 ******/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
Color: Quantity_Color
type: XCAFDoc_ColorType

Return
-------
bool

Description
-----------
Sets a link with GUID defined by <type> (see XCAFDoc::ColorRefGUID()) from label <L> to color <Color> in the colortable Adds a color as necessary Returns False if cannot find a label for shape S.
") SetColor;
		bool SetColor(const TopoDS_Shape & S, const Quantity_Color & Color, const XCAFDoc_ColorType type);

		/****** XCAFDoc_ColorTool::SetColor ******/
		/****** md5 signature: ecd7915906b03e02c6b6e0d4801b9f4d ******/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
Color: Quantity_ColorRGBA
type: XCAFDoc_ColorType

Return
-------
bool

Description
-----------
Sets a link with GUID defined by <type> (see XCAFDoc::ColorRefGUID()) from label <L> to color <Color> in the colortable Adds a color as necessary Returns False if cannot find a label for shape S.
") SetColor;
		bool SetColor(const TopoDS_Shape & S, const Quantity_ColorRGBA & Color, const XCAFDoc_ColorType type);

		/****** XCAFDoc_ColorTool::SetColorByLayer ******/
		/****** md5 signature: 3c3440b3812b8ae970859941bdfcd405 ******/
		%feature("compactdefaultargs") SetColorByLayer;
		%feature("autodoc", "
Parameters
----------
shapeLabel: TDF_Label
isColorByLayer: bool (optional, default to false)

Return
-------
None

Description
-----------
Set the Color defined by Layer flag on label. Do nothing if there no any object. Set UAttribute with corresponding GUID.
") SetColorByLayer;
		void SetColorByLayer(const TDF_Label & shapeLabel, const bool isColorByLayer = false);

		/****** XCAFDoc_ColorTool::SetInstanceColor ******/
		/****** md5 signature: 50bd6064f3180e383534b67ae032724a ******/
		%feature("compactdefaultargs") SetInstanceColor;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
type: XCAFDoc_ColorType
color: Quantity_Color
isCreateSHUO: bool (optional, default to true)

Return
-------
bool

Description
-----------
Sets the color of component that styled with SHUO structure Returns False if no sush component found NOTE: create SHUO structeure if it is necessary and if <isCreateSHUO>.
") SetInstanceColor;
		bool SetInstanceColor(const TopoDS_Shape & theShape, const XCAFDoc_ColorType type, const Quantity_Color & color, const bool isCreateSHUO = true);

		/****** XCAFDoc_ColorTool::SetInstanceColor ******/
		/****** md5 signature: e578878d099306bc5405739a24944b57 ******/
		%feature("compactdefaultargs") SetInstanceColor;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
type: XCAFDoc_ColorType
color: Quantity_ColorRGBA
isCreateSHUO: bool (optional, default to true)

Return
-------
bool

Description
-----------
Sets the color of component that styled with SHUO structure Returns False if no sush component found NOTE: create SHUO structeure if it is necessary and if <isCreateSHUO>.
") SetInstanceColor;
		bool SetInstanceColor(const TopoDS_Shape & theShape, const XCAFDoc_ColorType type, const Quantity_ColorRGBA & color, const bool isCreateSHUO = true);

		/****** XCAFDoc_ColorTool::SetVisibility ******/
		/****** md5 signature: 219862f9b0c5551b7f06ea985954f9c7 ******/
		%feature("compactdefaultargs") SetVisibility;
		%feature("autodoc", "
Parameters
----------
shapeLabel: TDF_Label
isvisible: bool (optional, default to true)

Return
-------
None

Description
-----------
Set the visibility of object on label. Do nothing if there no any object. Set UAttribute with corresponding GUID.
") SetVisibility;
		void SetVisibility(const TDF_Label & shapeLabel, const bool isvisible = true);

		/****** XCAFDoc_ColorTool::ShapeTool ******/
		/****** md5 signature: f3b52ea6763fc2a237d4ce7351722eb2 ******/
		%feature("compactdefaultargs") ShapeTool;
		%feature("autodoc", "Return
-------
opencascade::handle<XCAFDoc_ShapeTool>

Description
-----------
Returns internal XCAFDoc_ShapeTool tool.
") ShapeTool;
		const opencascade::handle<XCAFDoc_ShapeTool> & ShapeTool();

		/****** XCAFDoc_ColorTool::UnSetColor ******/
		/****** md5 signature: 4a350d0cf48724014836220d4bfcc269 ******/
		%feature("compactdefaultargs") UnSetColor;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label
type: XCAFDoc_ColorType

Return
-------
None

Description
-----------
Removes a link with GUID defined by <type> (see XCAFDoc::ColorRefGUID()) from label <L> to color.
") UnSetColor;
		void UnSetColor(const TDF_Label & L, const XCAFDoc_ColorType type);

		/****** XCAFDoc_ColorTool::UnSetColor ******/
		/****** md5 signature: 8ca6dbd4041889c12e6ace86182c686c ******/
		%feature("compactdefaultargs") UnSetColor;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
type: XCAFDoc_ColorType

Return
-------
bool

Description
-----------
Removes a link with GUID defined by <type> (see XCAFDoc::ColorRefGUID()) from label <L> to color Returns True if such link existed.
") UnSetColor;
		bool UnSetColor(const TopoDS_Shape & S, const XCAFDoc_ColorType type);

};


%make_alias(XCAFDoc_ColorTool)

%extend XCAFDoc_ColorTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class XCAFDoc_Datum *
**********************/
class XCAFDoc_Datum : public TDF_Attribute {
	public:
		/****** XCAFDoc_Datum::XCAFDoc_Datum ******/
		/****** md5 signature: 326721c9f48980ecbf6644f41dc6bb7e ******/
		%feature("compactdefaultargs") XCAFDoc_Datum;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") XCAFDoc_Datum;
		 XCAFDoc_Datum();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** XCAFDoc_Datum::GetDescription ******/
		/****** md5 signature: d57bdeefc6af6dad2fd33af139e84636 ******/
		%feature("compactdefaultargs") GetDescription;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") GetDescription;
		opencascade::handle<TCollection_HAsciiString> GetDescription();

		/****** XCAFDoc_Datum::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") GetID;
		static const Standard_GUID & GetID();

		/****** XCAFDoc_Datum::GetIdentification ******/
		/****** md5 signature: 1c3af0f209cc0a50800473ebb4349206 ******/
		%feature("compactdefaultargs") GetIdentification;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") GetIdentification;
		opencascade::handle<TCollection_HAsciiString> GetIdentification();

		/****** XCAFDoc_Datum::GetName ******/
		/****** md5 signature: 23aadc9cd2e3411b58fb02d3fd2db5c9 ******/
		%feature("compactdefaultargs") GetName;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") GetName;
		opencascade::handle<TCollection_HAsciiString> GetName();

		/****** XCAFDoc_Datum::GetObject ******/
		/****** md5 signature: 073da452cb43608ac741069c33dbd361 ******/
		%feature("compactdefaultargs") GetObject;
		%feature("autodoc", "Return
-------
opencascade::handle<XCAFDimTolObjects_DatumObject>

Description
-----------
Returns dimension object data taken from the paren's label and its sub-labels.
") GetObject;
		opencascade::handle<XCAFDimTolObjects_DatumObject> GetObject();

		/****** XCAFDoc_Datum::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** XCAFDoc_Datum::NewEmpty ******/
		/****** md5 signature: 4ebad80fa2cacb9f9e231bbb83a29a98 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** XCAFDoc_Datum::Paste ******/
		/****** md5 signature: bfece7a0e37cb5034ac0b2a8c488da37 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Into: TDF_Attribute
RT: TDF_RelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****** XCAFDoc_Datum::Restore ******/
		/****** md5 signature: 8bde8d15cc1907242b8c43fe6eb18f19 ******/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
With: TDF_Attribute

Return
-------
None

Description
-----------
No available documentation.
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****** XCAFDoc_Datum::Set ******/
		/****** md5 signature: abbb0ce2fe8160fc59e48134918705cf ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
anIdentification: TCollection_HAsciiString

Return
-------
opencascade::handle<XCAFDoc_Datum>

Description
-----------
No available documentation.
") Set;
		static opencascade::handle<XCAFDoc_Datum> Set(const TDF_Label & label, const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<TCollection_HAsciiString> & anIdentification);

		/****** XCAFDoc_Datum::Set ******/
		/****** md5 signature: bc678b4db80f6d228e9f44f33f201a2d ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label

Return
-------
opencascade::handle<XCAFDoc_Datum>

Description
-----------
No available documentation.
") Set;
		static opencascade::handle<XCAFDoc_Datum> Set(const TDF_Label & theLabel);

		/****** XCAFDoc_Datum::Set ******/
		/****** md5 signature: 780645a6a8ebebf24a0065db679bc441 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
anIdentification: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<TCollection_HAsciiString> & anIdentification);

		/****** XCAFDoc_Datum::SetObject ******/
		/****** md5 signature: c6d57e033685bdb838511cff3f60503b ******/
		%feature("compactdefaultargs") SetObject;
		%feature("autodoc", "
Parameters
----------
theDatumObject: XCAFDimTolObjects_DatumObject

Return
-------
None

Description
-----------
Updates parent's label and its sub-labels with data taken from theDatumObject. Old data associated with the label will be lost.
") SetObject;
		void SetObject(const opencascade::handle<XCAFDimTolObjects_DatumObject> & theDatumObject);

};


%make_alias(XCAFDoc_Datum)

%extend XCAFDoc_Datum {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class XCAFDoc_DimTol *
***********************/
class XCAFDoc_DimTol : public TDF_Attribute {
	public:
		/****** XCAFDoc_DimTol::XCAFDoc_DimTol ******/
		/****** md5 signature: a81a84fd72551cc64aff08da8be185fa ******/
		%feature("compactdefaultargs") XCAFDoc_DimTol;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") XCAFDoc_DimTol;
		 XCAFDoc_DimTol();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** XCAFDoc_DimTol::GetDescription ******/
		/****** md5 signature: d57bdeefc6af6dad2fd33af139e84636 ******/
		%feature("compactdefaultargs") GetDescription;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") GetDescription;
		opencascade::handle<TCollection_HAsciiString> GetDescription();

		/****** XCAFDoc_DimTol::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") GetID;
		static const Standard_GUID & GetID();

		/****** XCAFDoc_DimTol::GetKind ******/
		/****** md5 signature: e37db903148ef6eff9836f5d6e7f6e65 ******/
		%feature("compactdefaultargs") GetKind;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") GetKind;
		int GetKind();

		/****** XCAFDoc_DimTol::GetName ******/
		/****** md5 signature: 23aadc9cd2e3411b58fb02d3fd2db5c9 ******/
		%feature("compactdefaultargs") GetName;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") GetName;
		opencascade::handle<TCollection_HAsciiString> GetName();

		/****** XCAFDoc_DimTol::GetVal ******/
		/****** md5 signature: dfd99986f98d98d0dad78d398886ed72 ******/
		%feature("compactdefaultargs") GetVal;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
No available documentation.
") GetVal;
		opencascade::handle<TColStd_HArray1OfReal> GetVal();

		/****** XCAFDoc_DimTol::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** XCAFDoc_DimTol::NewEmpty ******/
		/****** md5 signature: 4ebad80fa2cacb9f9e231bbb83a29a98 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** XCAFDoc_DimTol::Paste ******/
		/****** md5 signature: bfece7a0e37cb5034ac0b2a8c488da37 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Into: TDF_Attribute
RT: TDF_RelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****** XCAFDoc_DimTol::Restore ******/
		/****** md5 signature: 8bde8d15cc1907242b8c43fe6eb18f19 ******/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
With: TDF_Attribute

Return
-------
None

Description
-----------
No available documentation.
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****** XCAFDoc_DimTol::Set ******/
		/****** md5 signature: 238ae2c8b71e122623b88bde58192d92 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
kind: int
aVal: TColStd_HArray1OfReal
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString

Return
-------
opencascade::handle<XCAFDoc_DimTol>

Description
-----------
No available documentation.
") Set;
		static opencascade::handle<XCAFDoc_DimTol> Set(const TDF_Label & label, const int kind, const opencascade::handle<TColStd_HArray1OfReal> & aVal, const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****** XCAFDoc_DimTol::Set ******/
		/****** md5 signature: fb1b1e88713805ab114c3e25d04b73c1 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
kind: int
aVal: TColStd_HArray1OfReal
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const int kind, const opencascade::handle<TColStd_HArray1OfReal> & aVal, const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription);

};


%make_alias(XCAFDoc_DimTol)

%extend XCAFDoc_DimTol {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class XCAFDoc_DimTolTool *
***************************/
class XCAFDoc_DimTolTool : public TDataStd_GenericEmpty {
	public:
		/****** XCAFDoc_DimTolTool::XCAFDoc_DimTolTool ******/
		/****** md5 signature: 2c5641f63aaa759ef0aac01b43f9acd2 ******/
		%feature("compactdefaultargs") XCAFDoc_DimTolTool;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") XCAFDoc_DimTolTool;
		 XCAFDoc_DimTolTool();

		/****** XCAFDoc_DimTolTool::AddDatum ******/
		/****** md5 signature: 7b3140f13c362f2900f2e8aeee2b7060 ******/
		%feature("compactdefaultargs") AddDatum;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HAsciiString
theDescription: TCollection_HAsciiString
theIdentification: TCollection_HAsciiString

Return
-------
TDF_Label

Description
-----------
Adds a datum definition to the GD&T table and returns its label.
") AddDatum;
		TDF_Label AddDatum(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<TCollection_HAsciiString> & theDescription, const opencascade::handle<TCollection_HAsciiString> & theIdentification);

		/****** XCAFDoc_DimTolTool::AddDatum ******/
		/****** md5 signature: 76d11891da7673a63ac64936a722b7dd ******/
		%feature("compactdefaultargs") AddDatum;
		%feature("autodoc", "Return
-------
TDF_Label

Description
-----------
Adds a datum definition to the GD&T table and returns its label.
") AddDatum;
		TDF_Label AddDatum();

		/****** XCAFDoc_DimTolTool::AddDimTol ******/
		/****** md5 signature: c3d8b70f2fbb44f2b741d632276920ff ******/
		%feature("compactdefaultargs") AddDimTol;
		%feature("autodoc", "
Parameters
----------
theKind: int
theVal: TColStd_HArray1OfReal
theName: TCollection_HAsciiString
theDescription: TCollection_HAsciiString

Return
-------
TDF_Label

Description
-----------
Adds a dimension tolerance definition with the specified kind, value, name and description to the GD&T table and returns its label.
") AddDimTol;
		TDF_Label AddDimTol(const int theKind, const opencascade::handle<TColStd_HArray1OfReal> & theVal, const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<TCollection_HAsciiString> & theDescription);

		/****** XCAFDoc_DimTolTool::AddDimension ******/
		/****** md5 signature: 2448da71f93125dbf15e2a84b4a8e8d9 ******/
		%feature("compactdefaultargs") AddDimension;
		%feature("autodoc", "Return
-------
TDF_Label

Description
-----------
Adds a dimension definition to the GD&T table and returns its label.
") AddDimension;
		TDF_Label AddDimension();

		/****** XCAFDoc_DimTolTool::AddGeomTolerance ******/
		/****** md5 signature: 45a2568a95679220a38a4de1efabae73 ******/
		%feature("compactdefaultargs") AddGeomTolerance;
		%feature("autodoc", "Return
-------
TDF_Label

Description
-----------
Adds a GeomTolerance definition to the GD&T table and returns its label.
") AddGeomTolerance;
		TDF_Label AddGeomTolerance();

		/****** XCAFDoc_DimTolTool::BaseLabel ******/
		/****** md5 signature: cb499d8135863e96e585085d0b85c75a ******/
		%feature("compactdefaultargs") BaseLabel;
		%feature("autodoc", "Return
-------
TDF_Label

Description
-----------
Returns the label under which GD&T table is stored.
") BaseLabel;
		TDF_Label BaseLabel();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** XCAFDoc_DimTolTool::FindDatum ******/
		/****** md5 signature: c3d9bb18cdef24357521eb803f3303b0 ******/
		%feature("compactdefaultargs") FindDatum;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HAsciiString
theDescription: TCollection_HAsciiString
theIdentification: TCollection_HAsciiString
lab: TDF_Label

Return
-------
bool

Description
-----------
Finds a datum satisfying the specified name, description and identification and returns its label if found.
") FindDatum;
		bool FindDatum(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<TCollection_HAsciiString> & theDescription, const opencascade::handle<TCollection_HAsciiString> & theIdentification, TDF_Label & lab);

		/****** XCAFDoc_DimTolTool::FindDimTol ******/
		/****** md5 signature: fb822c76e02c7256f19db92648bfae0a ******/
		%feature("compactdefaultargs") FindDimTol;
		%feature("autodoc", "
Parameters
----------
theKind: int
theVal: TColStd_HArray1OfReal
theName: TCollection_HAsciiString
theDescription: TCollection_HAsciiString
lab: TDF_Label

Return
-------
bool

Description
-----------
Finds a dimension tolerance definition in the GD&T table satisfying the specified kind, values, name and description and returns its label if found. Returns False if dimension tolerance is not found in DGTtable.
") FindDimTol;
		bool FindDimTol(const int theKind, const opencascade::handle<TColStd_HArray1OfReal> & theVal, const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<TCollection_HAsciiString> & theDescription, TDF_Label & lab);

		/****** XCAFDoc_DimTolTool::FindDimTol ******/
		/****** md5 signature: a20b6efd9ec978979e319be9f003dc5a ******/
		%feature("compactdefaultargs") FindDimTol;
		%feature("autodoc", "
Parameters
----------
theKind: int
theVal: TColStd_HArray1OfReal
theName: TCollection_HAsciiString
theDescription: TCollection_HAsciiString

Return
-------
TDF_Label

Description
-----------
Finds a dimension tolerance in the GD&T table satisfying the specified kind, values, name and description and returns its label if found (or Null label else).
") FindDimTol;
		TDF_Label FindDimTol(const int theKind, const opencascade::handle<TColStd_HArray1OfReal> & theVal, const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<TCollection_HAsciiString> & theDescription);

		/****** XCAFDoc_DimTolTool::GetDatum ******/
		/****** md5 signature: 74d72eb30a845767352795d903cd7273 ******/
		%feature("compactdefaultargs") GetDatum;
		%feature("autodoc", "
Parameters
----------
theDatumL: TDF_Label

Return
-------
theName: TCollection_HAsciiString
theDescription: TCollection_HAsciiString
theIdentification: TCollection_HAsciiString

Description
-----------
Returns datum assigned to theDatumL label. Returns False if no such datum is assigned.
") GetDatum;
		bool GetDatum(const TDF_Label & theDatumL, opencascade::handle<TCollection_HAsciiString> &OutValue, opencascade::handle<TCollection_HAsciiString> &OutValue, opencascade::handle<TCollection_HAsciiString> &OutValue);

		/****** XCAFDoc_DimTolTool::GetDatumLabels ******/
		/****** md5 signature: 5731aa9370b628af3e56587f25cef8c8 ******/
		%feature("compactdefaultargs") GetDatumLabels;
		%feature("autodoc", "
Parameters
----------
Labels: TDF_LabelSequence

Return
-------
None

Description
-----------
Returns a sequence of Datums currently stored in the GD&T table.
") GetDatumLabels;
		void GetDatumLabels(TDF_LabelSequence & Labels);

		/****** XCAFDoc_DimTolTool::GetDatumOfTolerLabels ******/
		/****** md5 signature: 05725f4a02063cb5f775eac59887f6f0 ******/
		%feature("compactdefaultargs") GetDatumOfTolerLabels;
		%feature("autodoc", "
Parameters
----------
theDimTolL: TDF_Label
theDatums: TDF_LabelSequence

Return
-------
bool

Description
-----------
Returns all Datum labels defined for theDimTolL label.
") GetDatumOfTolerLabels;
		static bool GetDatumOfTolerLabels(const TDF_Label & theDimTolL, TDF_LabelSequence & theDatums);

		/****** XCAFDoc_DimTolTool::GetDatumWithObjectOfTolerLabels ******/
		/****** md5 signature: ad1b11a7537fec1bdd41cf309b8dbe3f ******/
		%feature("compactdefaultargs") GetDatumWithObjectOfTolerLabels;
		%feature("autodoc", "
Parameters
----------
theDimTolL: TDF_Label
theDatums: TDF_LabelSequence

Return
-------
bool

Description
-----------
Returns all Datum labels with XCAFDimTolObjects_DatumObject defined for label theDimTolL.
") GetDatumWithObjectOfTolerLabels;
		static bool GetDatumWithObjectOfTolerLabels(const TDF_Label & theDimTolL, TDF_LabelSequence & theDatums);

		/****** XCAFDoc_DimTolTool::GetDimTol ******/
		/****** md5 signature: 8a0d877aae085f1f06eafd74ab2a1819 ******/
		%feature("compactdefaultargs") GetDimTol;
		%feature("autodoc", "
Parameters
----------
theDimTolL: TDF_Label
theVal: TColStd_HArray1OfReal

Return
-------
theKind: int
theName: TCollection_HAsciiString
theDescription: TCollection_HAsciiString

Description
-----------
Returns dimension tolerance assigned to theDimTolL label. Returns False if no such dimension tolerance is assigned.
") GetDimTol;
		bool GetDimTol(const TDF_Label & theDimTolL, Standard_Integer &OutValue, opencascade::handle<TColStd_HArray1OfReal> & theVal, opencascade::handle<TCollection_HAsciiString> &OutValue, opencascade::handle<TCollection_HAsciiString> &OutValue);

		/****** XCAFDoc_DimTolTool::GetDimTolLabels ******/
		/****** md5 signature: d52f170215b81229bb9eee435ba2b2cb ******/
		%feature("compactdefaultargs") GetDimTolLabels;
		%feature("autodoc", "
Parameters
----------
Labels: TDF_LabelSequence

Return
-------
None

Description
-----------
Returns a sequence of D&GTs currently stored in the GD&T table.
") GetDimTolLabels;
		void GetDimTolLabels(TDF_LabelSequence & Labels);

		/****** XCAFDoc_DimTolTool::GetDimensionLabels ******/
		/****** md5 signature: 9dbc31c3018cb99ff4f4844e2cd8b43d ******/
		%feature("compactdefaultargs") GetDimensionLabels;
		%feature("autodoc", "
Parameters
----------
theLabels: TDF_LabelSequence

Return
-------
None

Description
-----------
Returns a sequence of Dimension labels currently stored in the GD&T table.
") GetDimensionLabels;
		void GetDimensionLabels(TDF_LabelSequence & theLabels);

		/****** XCAFDoc_DimTolTool::GetGDTPresentations ******/
		/****** md5 signature: d56c55b273c67e9c64e4bb8d45f185c4 ******/
		%feature("compactdefaultargs") GetGDTPresentations;
		%feature("autodoc", "
Parameters
----------
theGDTLabelToShape: NCollection_IndexedDataMap<TDF_Label, TopoDS_Shape>

Return
-------
None

Description
-----------
fill the map GDT label -> shape presentation.
") GetGDTPresentations;
		void GetGDTPresentations(NCollection_IndexedDataMap<TDF_Label, TopoDS_Shape> & theGDTLabelToShape);

		/****** XCAFDoc_DimTolTool::GetGeomToleranceLabels ******/
		/****** md5 signature: 43126acd2ad4beb5b63cd7a9fbaf26c9 ******/
		%feature("compactdefaultargs") GetGeomToleranceLabels;
		%feature("autodoc", "
Parameters
----------
theLabels: TDF_LabelSequence

Return
-------
None

Description
-----------
Returns a sequence of Tolerance labels currently stored in the GD&T table.
") GetGeomToleranceLabels;
		void GetGeomToleranceLabels(TDF_LabelSequence & theLabels);

		/****** XCAFDoc_DimTolTool::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Returns the standard GD&T tool GUID.
") GetID;
		static const Standard_GUID & GetID();

		/****** XCAFDoc_DimTolTool::GetRefDatumLabel ******/
		/****** md5 signature: e3f6af506f5cc812771eb187d46aaba4 ******/
		%feature("compactdefaultargs") GetRefDatumLabel;
		%feature("autodoc", "
Parameters
----------
theShapeL: TDF_Label
theDatum: TDF_LabelSequence

Return
-------
bool

Description
-----------
Returns Datum label defined for theShapeL label.
") GetRefDatumLabel;
		bool GetRefDatumLabel(const TDF_Label & theShapeL, TDF_LabelSequence & theDatum);

		/****** XCAFDoc_DimTolTool::GetRefDimensionLabels ******/
		/****** md5 signature: ebe42bef2539abade6a83594a9af6055 ******/
		%feature("compactdefaultargs") GetRefDimensionLabels;
		%feature("autodoc", "
Parameters
----------
theShapeL: TDF_Label
theDimensions: TDF_LabelSequence

Return
-------
bool

Description
-----------
Returns all Dimension labels defined for theShapeL.
") GetRefDimensionLabels;
		bool GetRefDimensionLabels(const TDF_Label & theShapeL, TDF_LabelSequence & theDimensions);

		/****** XCAFDoc_DimTolTool::GetRefGeomToleranceLabels ******/
		/****** md5 signature: 85ac2b3f4e47dfc47a11e46655a135d7 ******/
		%feature("compactdefaultargs") GetRefGeomToleranceLabels;
		%feature("autodoc", "
Parameters
----------
theShapeL: TDF_Label
theDimTols: TDF_LabelSequence

Return
-------
bool

Description
-----------
Returns all GeomTolerance labels defined for theShapeL.
") GetRefGeomToleranceLabels;
		bool GetRefGeomToleranceLabels(const TDF_Label & theShapeL, TDF_LabelSequence & theDimTols);

		/****** XCAFDoc_DimTolTool::GetRefShapeLabel ******/
		/****** md5 signature: a46cc1fbe999994f85f0c1cadafc42d5 ******/
		%feature("compactdefaultargs") GetRefShapeLabel;
		%feature("autodoc", "
Parameters
----------
theL: TDF_Label
theShapeLFirst: TDF_LabelSequence
theShapeLSecond: TDF_LabelSequence

Return
-------
bool

Description
-----------
Gets all shape labels referred by theL label of the GD&T table. Returns False if there are no shape labels added to the sequences.
") GetRefShapeLabel;
		static bool GetRefShapeLabel(const TDF_Label & theL, TDF_LabelSequence & theShapeLFirst, TDF_LabelSequence & theShapeLSecond);

		/****** XCAFDoc_DimTolTool::GetTolerOfDatumLabels ******/
		/****** md5 signature: fa730d7b67becc3574ac05f4b3a3d016 ******/
		%feature("compactdefaultargs") GetTolerOfDatumLabels;
		%feature("autodoc", "
Parameters
----------
theDatumL: TDF_Label
theTols: TDF_LabelSequence

Return
-------
bool

Description
-----------
Returns all GeomToleranses labels defined for theDatumL label.
") GetTolerOfDatumLabels;
		bool GetTolerOfDatumLabels(const TDF_Label & theDatumL, TDF_LabelSequence & theTols);

		/****** XCAFDoc_DimTolTool::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** XCAFDoc_DimTolTool::IsDatum ******/
		/****** md5 signature: d975178d9d5be680552648cc66816495 ******/
		%feature("compactdefaultargs") IsDatum;
		%feature("autodoc", "
Parameters
----------
lab: TDF_Label

Return
-------
bool

Description
-----------
Returns True if label belongs to the GD&T table and is a Datum definition.
") IsDatum;
		bool IsDatum(const TDF_Label & lab);

		/****** XCAFDoc_DimTolTool::IsDimTol ******/
		/****** md5 signature: 43de52c3d0281937c63c2bfdbf50f40b ******/
		%feature("compactdefaultargs") IsDimTol;
		%feature("autodoc", "
Parameters
----------
theLab: TDF_Label

Return
-------
bool

Description
-----------
Returns True if theLab belongs to the GD&T table and is a dmension tolerance.
") IsDimTol;
		bool IsDimTol(const TDF_Label & theLab);

		/****** XCAFDoc_DimTolTool::IsDimension ******/
		/****** md5 signature: 3c298eb40c5e3ebbc9016057c7792796 ******/
		%feature("compactdefaultargs") IsDimension;
		%feature("autodoc", "
Parameters
----------
theLab: TDF_Label

Return
-------
bool

Description
-----------
Returns True if the label belongs to a GD&T table and is a Dimension definition.
") IsDimension;
		bool IsDimension(const TDF_Label & theLab);

		/****** XCAFDoc_DimTolTool::IsGeomTolerance ******/
		/****** md5 signature: eab7e7f0ffa43b541db5a6ff770863da ******/
		%feature("compactdefaultargs") IsGeomTolerance;
		%feature("autodoc", "
Parameters
----------
theLab: TDF_Label

Return
-------
bool

Description
-----------
Returns True if the label belongs to the GD&T table and is a dimension tolerance.
") IsGeomTolerance;
		bool IsGeomTolerance(const TDF_Label & theLab);

		/****** XCAFDoc_DimTolTool::IsLocked ******/
		/****** md5 signature: 333841a1935224d396ede7d5e781eb4c ******/
		%feature("compactdefaultargs") IsLocked;
		%feature("autodoc", "
Parameters
----------
theViewL: TDF_Label

Return
-------
bool

Description
-----------
Returns true if the given GDT is marked as locked.
") IsLocked;
		bool IsLocked(const TDF_Label & theViewL);

		/****** XCAFDoc_DimTolTool::Lock ******/
		/****** md5 signature: 44e08eb297c1fac0353895828de43f48 ******/
		%feature("compactdefaultargs") Lock;
		%feature("autodoc", "
Parameters
----------
theViewL: TDF_Label

Return
-------
None

Description
-----------
Mark the given GDT as locked.
") Lock;
		void Lock(const TDF_Label & theViewL);

		/****** XCAFDoc_DimTolTool::Set ******/
		/****** md5 signature: fb1eaa4ca2f6c7d90fe59b7b29cc9a0b ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label

Return
-------
opencascade::handle<XCAFDoc_DimTolTool>

Description
-----------
Creates (if not exist) DimTolTool attribute.
") Set;
		static opencascade::handle<XCAFDoc_DimTolTool> Set(const TDF_Label & L);

		/****** XCAFDoc_DimTolTool::SetDatum ******/
		/****** md5 signature: 0d8fd5e2fa3a363d110a41833c768dbc ******/
		%feature("compactdefaultargs") SetDatum;
		%feature("autodoc", "
Parameters
----------
theShapeLabels: TDF_LabelSequence
theDatumL: TDF_Label

Return
-------
None

Description
-----------
Sets a datum to the sequence of shape labels.
") SetDatum;
		void SetDatum(const TDF_LabelSequence & theShapeLabels, const TDF_Label & theDatumL);

		/****** XCAFDoc_DimTolTool::SetDatum ******/
		/****** md5 signature: d982af1bc9dd960ae3ae8d920d54dad2 ******/
		%feature("compactdefaultargs") SetDatum;
		%feature("autodoc", "
Parameters
----------
theL: TDF_Label
theTolerL: TDF_Label
theName: TCollection_HAsciiString
theDescription: TCollection_HAsciiString
theIdentification: TCollection_HAsciiString

Return
-------
None

Description
-----------
Sets a datum to theL label and binds it with theTolerL label. A datum with the specified name, description and identification is created if it isn't found in the GD&T table.
") SetDatum;
		void SetDatum(const TDF_Label & theL, const TDF_Label & theTolerL, const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<TCollection_HAsciiString> & theDescription, const opencascade::handle<TCollection_HAsciiString> & theIdentification);

		/****** XCAFDoc_DimTolTool::SetDatumToGeomTol ******/
		/****** md5 signature: db27d085af9240574d7b342aaecc9c83 ******/
		%feature("compactdefaultargs") SetDatumToGeomTol;
		%feature("autodoc", "
Parameters
----------
theDatumL: TDF_Label
theTolerL: TDF_Label

Return
-------
None

Description
-----------
Sets a datum from theDatumL label to theToletL label.
") SetDatumToGeomTol;
		void SetDatumToGeomTol(const TDF_Label & theDatumL, const TDF_Label & theTolerL);

		/****** XCAFDoc_DimTolTool::SetDimTol ******/
		/****** md5 signature: 38322484baaaf45bd1c89d9c7b1799d0 ******/
		%feature("compactdefaultargs") SetDimTol;
		%feature("autodoc", "
Parameters
----------
theL: TDF_Label
theDimTolL: TDF_Label

Return
-------
None

Description
-----------
Sets existing dimension tolerance to theL label.
") SetDimTol;
		void SetDimTol(const TDF_Label & theL, const TDF_Label & theDimTolL);

		/****** XCAFDoc_DimTolTool::SetDimTol ******/
		/****** md5 signature: d267151812031cdd0f515626a23acbb8 ******/
		%feature("compactdefaultargs") SetDimTol;
		%feature("autodoc", "
Parameters
----------
theL: TDF_Label
theKind: int
theVal: TColStd_HArray1OfReal
theName: TCollection_HAsciiString
theDescription: TCollection_HAsciiString

Return
-------
TDF_Label

Description
-----------
Creates a dimension tolerance and sets it to theL label.
") SetDimTol;
		TDF_Label SetDimTol(const TDF_Label & theL, const int theKind, const opencascade::handle<TColStd_HArray1OfReal> & theVal, const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<TCollection_HAsciiString> & theDescription);

		/****** XCAFDoc_DimTolTool::SetDimension ******/
		/****** md5 signature: 27eca9b26f753b69de2e8bdaa68375a3 ******/
		%feature("compactdefaultargs") SetDimension;
		%feature("autodoc", "
Parameters
----------
theFirstLS: TDF_LabelSequence
theSecondLS: TDF_LabelSequence
theDimL: TDF_Label

Return
-------
None

Description
-----------
Sets a dimension to sequences target labels.
") SetDimension;
		void SetDimension(const TDF_LabelSequence & theFirstLS, const TDF_LabelSequence & theSecondLS, const TDF_Label & theDimL);

		/****** XCAFDoc_DimTolTool::SetDimension ******/
		/****** md5 signature: 195e81604b6cf3cc5c4843b69ed128bb ******/
		%feature("compactdefaultargs") SetDimension;
		%feature("autodoc", "
Parameters
----------
theFirstL: TDF_Label
theSecondL: TDF_Label
theDimL: TDF_Label

Return
-------
None

Description
-----------
Sets a dimension to target labels.
") SetDimension;
		void SetDimension(const TDF_Label & theFirstL, const TDF_Label & theSecondL, const TDF_Label & theDimL);

		/****** XCAFDoc_DimTolTool::SetDimension ******/
		/****** md5 signature: d6ad33b3ad7394b9a483ba06cdd9c78b ******/
		%feature("compactdefaultargs") SetDimension;
		%feature("autodoc", "
Parameters
----------
theL: TDF_Label
theDimL: TDF_Label

Return
-------
None

Description
-----------
Sets a dimension to the target label.
") SetDimension;
		void SetDimension(const TDF_Label & theL, const TDF_Label & theDimL);

		/****** XCAFDoc_DimTolTool::SetGDTPresentations ******/
		/****** md5 signature: dc81af26228cca24292b0f76736e0486 ******/
		%feature("compactdefaultargs") SetGDTPresentations;
		%feature("autodoc", "
Parameters
----------
theGDTLabelToPrs: NCollection_IndexedDataMap<TDF_Label, TopoDS_Shape>

Return
-------
None

Description
-----------
Set shape presentation for GDT labels according to given map (theGDTLabelToPrs) theGDTLabelToPrsName map is an additional argument, can be used to set presentation names. If label is not in the theGDTLabelToPrsName map, the presentation name will be empty.
") SetGDTPresentations;
		void SetGDTPresentations(NCollection_IndexedDataMap<TDF_Label, TopoDS_Shape> & theGDTLabelToPrs);

		/****** XCAFDoc_DimTolTool::SetGeomTolerance ******/
		/****** md5 signature: 58ad83a4333f88636ad5771b734333df ******/
		%feature("compactdefaultargs") SetGeomTolerance;
		%feature("autodoc", "
Parameters
----------
theL: TDF_Label
theGeomTolL: TDF_Label

Return
-------
None

Description
-----------
Sets a geometry tolerance from theGeomTolL to theL label. Checks if theGeomTolL is a geometry tolerance definition first.
") SetGeomTolerance;
		void SetGeomTolerance(const TDF_Label & theL, const TDF_Label & theGeomTolL);

		/****** XCAFDoc_DimTolTool::SetGeomTolerance ******/
		/****** md5 signature: fdf18dbf83f689c9c7046088f28e052f ******/
		%feature("compactdefaultargs") SetGeomTolerance;
		%feature("autodoc", "
Parameters
----------
theL: TDF_LabelSequence
theGeomTolL: TDF_Label

Return
-------
None

Description
-----------
Sets a geometry tolerance from theGeomTolL to sequence of labels theL. Checks if theGeomTolL is a geometry tolerance definition first.
") SetGeomTolerance;
		void SetGeomTolerance(const TDF_LabelSequence & theL, const TDF_Label & theGeomTolL);

		/****** XCAFDoc_DimTolTool::ShapeTool ******/
		/****** md5 signature: f3b52ea6763fc2a237d4ce7351722eb2 ******/
		%feature("compactdefaultargs") ShapeTool;
		%feature("autodoc", "Return
-------
opencascade::handle<XCAFDoc_ShapeTool>

Description
-----------
Returns internal XCAFDoc_ShapeTool tool.
") ShapeTool;
		const opencascade::handle<XCAFDoc_ShapeTool> & ShapeTool();

		/****** XCAFDoc_DimTolTool::Unlock ******/
		/****** md5 signature: 47087adf5c901031f9be4fa4e9008a89 ******/
		%feature("compactdefaultargs") Unlock;
		%feature("autodoc", "
Parameters
----------
theViewL: TDF_Label

Return
-------
None

Description
-----------
Unlock the given GDT.
") Unlock;
		void Unlock(const TDF_Label & theViewL);

};


%make_alias(XCAFDoc_DimTolTool)

%extend XCAFDoc_DimTolTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class XCAFDoc_Dimension *
**************************/
class XCAFDoc_Dimension : public TDataStd_GenericEmpty {
	public:
		/****** XCAFDoc_Dimension::XCAFDoc_Dimension ******/
		/****** md5 signature: 2f99c63c2afe4a9019d4297ed13fc8e7 ******/
		%feature("compactdefaultargs") XCAFDoc_Dimension;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") XCAFDoc_Dimension;
		 XCAFDoc_Dimension();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** XCAFDoc_Dimension::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") GetID;
		static const Standard_GUID & GetID();

		/****** XCAFDoc_Dimension::GetObject ******/
		/****** md5 signature: 4fbe8acda838943eb7ecc2a85c52a164 ******/
		%feature("compactdefaultargs") GetObject;
		%feature("autodoc", "Return
-------
opencascade::handle<XCAFDimTolObjects_DimensionObject>

Description
-----------
Returns dimension object data taken from the parent's label and its sub-labels.
") GetObject;
		opencascade::handle<XCAFDimTolObjects_DimensionObject> GetObject();

		/****** XCAFDoc_Dimension::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** XCAFDoc_Dimension::Set ******/
		/****** md5 signature: e8759c5f34d978e2ceb6df9a8d290445 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label

Return
-------
opencascade::handle<XCAFDoc_Dimension>

Description
-----------
No available documentation.
") Set;
		static opencascade::handle<XCAFDoc_Dimension> Set(const TDF_Label & theLabel);

		/****** XCAFDoc_Dimension::SetObject ******/
		/****** md5 signature: 95b72ce55fc506acef34593949ecd306 ******/
		%feature("compactdefaultargs") SetObject;
		%feature("autodoc", "
Parameters
----------
theDimensionObject: XCAFDimTolObjects_DimensionObject

Return
-------
None

Description
-----------
Updates parent's label and its sub-labels with data taken from theDimensionObject. Old data associated with the label will be lost.
") SetObject;
		void SetObject(const opencascade::handle<XCAFDimTolObjects_DimensionObject> & theDimensionObject);

};


%make_alias(XCAFDoc_Dimension)

%extend XCAFDoc_Dimension {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class XCAFDoc_DocumentTool *
*****************************/
class XCAFDoc_DocumentTool : public TDataStd_GenericEmpty {
	public:
		/****** XCAFDoc_DocumentTool::XCAFDoc_DocumentTool ******/
		/****** md5 signature: 1abef24785b933429a4a476444f0ca17 ******/
		%feature("compactdefaultargs") XCAFDoc_DocumentTool;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") XCAFDoc_DocumentTool;
		 XCAFDoc_DocumentTool();

		/****** XCAFDoc_DocumentTool::AfterRetrieval ******/
		/****** md5 signature: 4244bb7f4341c6f4f1117b357909fbc5 ******/
		%feature("compactdefaultargs") AfterRetrieval;
		%feature("autodoc", "
Parameters
----------
forceIt: bool (optional, default to false)

Return
-------
bool

Description
-----------
To init this derived attribute after the attribute restore using the base restore-methods.
") AfterRetrieval;
		bool AfterRetrieval(const bool forceIt = false);

		/****** XCAFDoc_DocumentTool::CheckClippingPlaneTool ******/
		/****** md5 signature: 2605bfffb99db4ed300205bac099d850 ******/
		%feature("compactdefaultargs") CheckClippingPlaneTool;
		%feature("autodoc", "
Parameters
----------
theAcces: TDF_Label

Return
-------
bool

Description
-----------
Checks for the ClippingPlaneTool attribute on the label's document Returns True if Tool exists, ELSE if it has not been created.
") CheckClippingPlaneTool;
		static bool CheckClippingPlaneTool(const TDF_Label & theAcces);

		/****** XCAFDoc_DocumentTool::CheckColorTool ******/
		/****** md5 signature: 93d6ba53aaa9ef9b7d6781c8978b6030 ******/
		%feature("compactdefaultargs") CheckColorTool;
		%feature("autodoc", "
Parameters
----------
theAcces: TDF_Label

Return
-------
bool

Description
-----------
Checks for the ColorTool attribute on the label's document Returns True if Tool exists, ELSE if it has not been created.
") CheckColorTool;
		static bool CheckColorTool(const TDF_Label & theAcces);

		/****** XCAFDoc_DocumentTool::CheckDimTolTool ******/
		/****** md5 signature: 4a92f45c736bed0f6c36b1f3e6fe2194 ******/
		%feature("compactdefaultargs") CheckDimTolTool;
		%feature("autodoc", "
Parameters
----------
theAcces: TDF_Label

Return
-------
bool

Description
-----------
Checks for the DimTolTool attribute on the label's document Returns True if Tool exists, ELSE if it has not been created.
") CheckDimTolTool;
		static bool CheckDimTolTool(const TDF_Label & theAcces);

		/****** XCAFDoc_DocumentTool::CheckLayerTool ******/
		/****** md5 signature: 1547543ed61d6ad728c129a85ae68d17 ******/
		%feature("compactdefaultargs") CheckLayerTool;
		%feature("autodoc", "
Parameters
----------
theAcces: TDF_Label

Return
-------
bool

Description
-----------
Checks for the LayerTool attribute on the label's document Returns True if Tool exists, ELSE if it has not been created.
") CheckLayerTool;
		static bool CheckLayerTool(const TDF_Label & theAcces);

		/****** XCAFDoc_DocumentTool::CheckMaterialTool ******/
		/****** md5 signature: ee6c641385fa39190bd32068890de74f ******/
		%feature("compactdefaultargs") CheckMaterialTool;
		%feature("autodoc", "
Parameters
----------
theAcces: TDF_Label

Return
-------
bool

Description
-----------
Checks for the MaterialTool attribute on the label's document Returns True if Tool exists, ELSE if it has not been created.
") CheckMaterialTool;
		static bool CheckMaterialTool(const TDF_Label & theAcces);

		/****** XCAFDoc_DocumentTool::CheckNotesTool ******/
		/****** md5 signature: 6242fbaf1d1633a02ed27dcbd6c18efc ******/
		%feature("compactdefaultargs") CheckNotesTool;
		%feature("autodoc", "
Parameters
----------
theAcces: TDF_Label

Return
-------
bool

Description
-----------
Checks for the NotesTool attribute on the label's document Returns True if Tool exists, ELSE if it has not been created.
") CheckNotesTool;
		static bool CheckNotesTool(const TDF_Label & theAcces);

		/****** XCAFDoc_DocumentTool::CheckShapeTool ******/
		/****** md5 signature: 2efd05352b07666297ab83089bbb8025 ******/
		%feature("compactdefaultargs") CheckShapeTool;
		%feature("autodoc", "
Parameters
----------
theAcces: TDF_Label

Return
-------
bool

Description
-----------
Checks for the ShapeTool attribute on the label's document Returns True if Tool exists, ELSE if it has not been created.
") CheckShapeTool;
		static bool CheckShapeTool(const TDF_Label & theAcces);

		/****** XCAFDoc_DocumentTool::CheckViewTool ******/
		/****** md5 signature: e8298c80ff0f47b2a42f0cccea0fb244 ******/
		%feature("compactdefaultargs") CheckViewTool;
		%feature("autodoc", "
Parameters
----------
theAcces: TDF_Label

Return
-------
bool

Description
-----------
Checks for the ViewTool attribute on the label's document Returns True if Tool exists, ELSE if it has not been created.
") CheckViewTool;
		static bool CheckViewTool(const TDF_Label & theAcces);

		/****** XCAFDoc_DocumentTool::CheckVisMaterialTool ******/
		/****** md5 signature: 455b2295a594d7a342892c0aa48b81f3 ******/
		%feature("compactdefaultargs") CheckVisMaterialTool;
		%feature("autodoc", "
Parameters
----------
theAcces: TDF_Label

Return
-------
bool

Description
-----------
Checks for the VisMaterialTool attribute on the label's document Returns True if Tool exists, ELSE if it has not been created.
") CheckVisMaterialTool;
		static bool CheckVisMaterialTool(const TDF_Label & theAcces);

		/****** XCAFDoc_DocumentTool::ClippingPlaneTool ******/
		/****** md5 signature: 10db4cdb3c6c63d4b8a63936644512e6 ******/
		%feature("compactdefaultargs") ClippingPlaneTool;
		%feature("autodoc", "
Parameters
----------
acces: TDF_Label

Return
-------
opencascade::handle<XCAFDoc_ClippingPlaneTool>

Description
-----------
Creates (if it does not exist) ClippingPlaneTool attribute on ClippingPlanesLabel().
") ClippingPlaneTool;
		static opencascade::handle<XCAFDoc_ClippingPlaneTool> ClippingPlaneTool(const TDF_Label & acces);

		/****** XCAFDoc_DocumentTool::ClippingPlanesLabel ******/
		/****** md5 signature: 5b7c2ced1060d0932b5d1e5e0ecd5f81 ******/
		%feature("compactdefaultargs") ClippingPlanesLabel;
		%feature("autodoc", "
Parameters
----------
acces: TDF_Label

Return
-------
TDF_Label

Description
-----------
Returns sub-label of DocLabel() with tag 8.
") ClippingPlanesLabel;
		static TDF_Label ClippingPlanesLabel(const TDF_Label & acces);

		/****** XCAFDoc_DocumentTool::ColorTool ******/
		/****** md5 signature: d3c0054b10912f448673053243c3c346 ******/
		%feature("compactdefaultargs") ColorTool;
		%feature("autodoc", "
Parameters
----------
acces: TDF_Label

Return
-------
opencascade::handle<XCAFDoc_ColorTool>

Description
-----------
Creates (if it does not exist) ColorTool attribute on ColorsLabel().
") ColorTool;
		static opencascade::handle<XCAFDoc_ColorTool> ColorTool(const TDF_Label & acces);

		/****** XCAFDoc_DocumentTool::ColorsLabel ******/
		/****** md5 signature: e23e6d491f1947ea83faba361eb41fc1 ******/
		%feature("compactdefaultargs") ColorsLabel;
		%feature("autodoc", "
Parameters
----------
acces: TDF_Label

Return
-------
TDF_Label

Description
-----------
Returns sub-label of DocLabel() with tag 2.
") ColorsLabel;
		static TDF_Label ColorsLabel(const TDF_Label & acces);

		/****** XCAFDoc_DocumentTool::DGTsLabel ******/
		/****** md5 signature: d4e8164cc4fda6d66464f0535ee644fe ******/
		%feature("compactdefaultargs") DGTsLabel;
		%feature("autodoc", "
Parameters
----------
acces: TDF_Label

Return
-------
TDF_Label

Description
-----------
Returns sub-label of DocLabel() with tag 4.
") DGTsLabel;
		static TDF_Label DGTsLabel(const TDF_Label & acces);

		/****** XCAFDoc_DocumentTool::DimTolTool ******/
		/****** md5 signature: d1466e8aeae874db80fe131cd897eb31 ******/
		%feature("compactdefaultargs") DimTolTool;
		%feature("autodoc", "
Parameters
----------
acces: TDF_Label

Return
-------
opencascade::handle<XCAFDoc_DimTolTool>

Description
-----------
Creates (if it does not exist) DimTolTool attribute on DGTsLabel().
") DimTolTool;
		static opencascade::handle<XCAFDoc_DimTolTool> DimTolTool(const TDF_Label & acces);

		/****** XCAFDoc_DocumentTool::DocLabel ******/
		/****** md5 signature: 3f2fe08c41b68def128f86c32d38b346 ******/
		%feature("compactdefaultargs") DocLabel;
		%feature("autodoc", "
Parameters
----------
acces: TDF_Label

Return
-------
TDF_Label

Description
-----------
Returns label where the DocumentTool attribute is or 0.1 if DocumentTool is not yet set.
") DocLabel;
		static TDF_Label DocLabel(const TDF_Label & acces);

		/****** XCAFDoc_DocumentTool::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") GetID;
		static const Standard_GUID & GetID();

		/****** XCAFDoc_DocumentTool::GetLengthUnit ******/
		/****** md5 signature: e9e53ef74238a08c45a6963741e743ae ******/
		%feature("compactdefaultargs") GetLengthUnit;
		%feature("autodoc", "
Parameters
----------
theDoc: TDocStd_Document
theBaseUnit: UnitsMethods_LengthUnit

Return
-------
theResut: double

Description
-----------
Returns value of current internal unit for the document converted to base unit type.
") GetLengthUnit;
		static bool GetLengthUnit(const opencascade::handle<TDocStd_Document> & theDoc, Standard_Real &OutValue, const UnitsMethods_LengthUnit theBaseUnit);

		/****** XCAFDoc_DocumentTool::GetLengthUnit ******/
		/****** md5 signature: e3ac0c22cf4ebf12afa5ac2cc3bc1d57 ******/
		%feature("compactdefaultargs") GetLengthUnit;
		%feature("autodoc", "
Parameters
----------
theDoc: TDocStd_Document

Return
-------
theResut: double

Description
-----------
Returns value of current internal unit for the document in meter.
") GetLengthUnit;
		static bool GetLengthUnit(const opencascade::handle<TDocStd_Document> & theDoc, Standard_Real &OutValue);

		/****** XCAFDoc_DocumentTool::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** XCAFDoc_DocumentTool::Init ******/
		/****** md5 signature: 5c8b420ee9c456c5fe5ca5ec600af54c ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Return
-------
None

Description
-----------
to be called when reading this attribute from file.
") Init;
		void Init();

		/****** XCAFDoc_DocumentTool::IsXCAFDocument ******/
		/****** md5 signature: 6de918e0cf20fabda9201908af29c046 ******/
		%feature("compactdefaultargs") IsXCAFDocument;
		%feature("autodoc", "
Parameters
----------
Doc: TDocStd_Document

Return
-------
bool

Description
-----------
No available documentation.
") IsXCAFDocument;
		static bool IsXCAFDocument(const opencascade::handle<TDocStd_Document> & Doc);

		/****** XCAFDoc_DocumentTool::LayerTool ******/
		/****** md5 signature: 69adf92e6bb0c252d5ffef6f5b5a2adb ******/
		%feature("compactdefaultargs") LayerTool;
		%feature("autodoc", "
Parameters
----------
acces: TDF_Label

Return
-------
opencascade::handle<XCAFDoc_LayerTool>

Description
-----------
Creates (if it does not exist) LayerTool attribute on LayersLabel().
") LayerTool;
		static opencascade::handle<XCAFDoc_LayerTool> LayerTool(const TDF_Label & acces);

		/****** XCAFDoc_DocumentTool::LayersLabel ******/
		/****** md5 signature: 736a64053b934f8122bdb4a1fbb56010 ******/
		%feature("compactdefaultargs") LayersLabel;
		%feature("autodoc", "
Parameters
----------
acces: TDF_Label

Return
-------
TDF_Label

Description
-----------
Returns sub-label of DocLabel() with tag 3.
") LayersLabel;
		static TDF_Label LayersLabel(const TDF_Label & acces);

		/****** XCAFDoc_DocumentTool::MaterialTool ******/
		/****** md5 signature: 5807def30a6152d99b7f839e854c5742 ******/
		%feature("compactdefaultargs") MaterialTool;
		%feature("autodoc", "
Parameters
----------
acces: TDF_Label

Return
-------
opencascade::handle<XCAFDoc_MaterialTool>

Description
-----------
Creates (if it does not exist) DimTolTool attribute on DGTsLabel().
") MaterialTool;
		static opencascade::handle<XCAFDoc_MaterialTool> MaterialTool(const TDF_Label & acces);

		/****** XCAFDoc_DocumentTool::MaterialsLabel ******/
		/****** md5 signature: 528074efc4484c95c9f9404e5c4e7a9a ******/
		%feature("compactdefaultargs") MaterialsLabel;
		%feature("autodoc", "
Parameters
----------
acces: TDF_Label

Return
-------
TDF_Label

Description
-----------
Returns sub-label of DocLabel() with tag 5.
") MaterialsLabel;
		static TDF_Label MaterialsLabel(const TDF_Label & acces);

		/****** XCAFDoc_DocumentTool::NotesLabel ******/
		/****** md5 signature: e008bd46ff239db30ba9453034fc580b ******/
		%feature("compactdefaultargs") NotesLabel;
		%feature("autodoc", "
Parameters
----------
acces: TDF_Label

Return
-------
TDF_Label

Description
-----------
Returns sub-label of DocLabel() with tag 9.
") NotesLabel;
		static TDF_Label NotesLabel(const TDF_Label & acces);

		/****** XCAFDoc_DocumentTool::NotesTool ******/
		/****** md5 signature: 73cd9c9db561cfa07b4f78d1cb4b624c ******/
		%feature("compactdefaultargs") NotesTool;
		%feature("autodoc", "
Parameters
----------
acces: TDF_Label

Return
-------
opencascade::handle<XCAFDoc_NotesTool>

Description
-----------
Creates (if it does not exist) NotesTool attribute on NotesLabel().
") NotesTool;
		static opencascade::handle<XCAFDoc_NotesTool> NotesTool(const TDF_Label & acces);

		/****** XCAFDoc_DocumentTool::Set ******/
		/****** md5 signature: c822e916b56ae92641214b42e7e66265 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label
IsAcces: bool (optional, default to true)

Return
-------
opencascade::handle<XCAFDoc_DocumentTool>

Description
-----------
Create (if not exist) DocumentTool attribute on 0.1 label if <IsAcces> is true, else on <L> label. This label will be returned by DocLabel(); If the attribute is already set it won't be reset on <L> even if <IsAcces> is false. ColorTool and ShapeTool attributes are also set by this method.
") Set;
		static opencascade::handle<XCAFDoc_DocumentTool> Set(const TDF_Label & L, const bool IsAcces = true);

		/****** XCAFDoc_DocumentTool::SetLengthUnit ******/
		/****** md5 signature: ffbc3b6e2215df8209a3b1de57167822 ******/
		%feature("compactdefaultargs") SetLengthUnit;
		%feature("autodoc", "
Parameters
----------
theDoc: TDocStd_Document
theUnitValue: double

Return
-------
None

Description
-----------
Sets value of current internal unit to the document in meter.
") SetLengthUnit;
		static void SetLengthUnit(const opencascade::handle<TDocStd_Document> & theDoc, const double theUnitValue);

		/****** XCAFDoc_DocumentTool::SetLengthUnit ******/
		/****** md5 signature: ab63325faa87fd0c866a760cf16b0a27 ******/
		%feature("compactdefaultargs") SetLengthUnit;
		%feature("autodoc", "
Parameters
----------
theDoc: TDocStd_Document
theUnitValue: double
theBaseUnit: UnitsMethods_LengthUnit

Return
-------
None

Description
-----------
Sets value of current internal unit to the document 
Parameter theUnitValue must be represented in the base unit type.
") SetLengthUnit;
		static void SetLengthUnit(const opencascade::handle<TDocStd_Document> & theDoc, const double theUnitValue, const UnitsMethods_LengthUnit theBaseUnit);

		/****** XCAFDoc_DocumentTool::ShapeTool ******/
		/****** md5 signature: 8e94f9cf40c103af90fc51fe6aebf09f ******/
		%feature("compactdefaultargs") ShapeTool;
		%feature("autodoc", "
Parameters
----------
acces: TDF_Label

Return
-------
opencascade::handle<XCAFDoc_ShapeTool>

Description
-----------
Creates (if it does not exist) ShapeTool attribute on ShapesLabel().
") ShapeTool;
		static opencascade::handle<XCAFDoc_ShapeTool> ShapeTool(const TDF_Label & acces);

		/****** XCAFDoc_DocumentTool::ShapesLabel ******/
		/****** md5 signature: 72018a6459d2ee439837a4dfcab76a41 ******/
		%feature("compactdefaultargs") ShapesLabel;
		%feature("autodoc", "
Parameters
----------
acces: TDF_Label

Return
-------
TDF_Label

Description
-----------
Returns sub-label of DocLabel() with tag 1.
") ShapesLabel;
		static TDF_Label ShapesLabel(const TDF_Label & acces);

		/****** XCAFDoc_DocumentTool::ViewTool ******/
		/****** md5 signature: 15975daf16f7afba4900e61b6fb4c808 ******/
		%feature("compactdefaultargs") ViewTool;
		%feature("autodoc", "
Parameters
----------
acces: TDF_Label

Return
-------
opencascade::handle<XCAFDoc_ViewTool>

Description
-----------
Creates (if it does not exist) ViewTool attribute on ViewsLabel().
") ViewTool;
		static opencascade::handle<XCAFDoc_ViewTool> ViewTool(const TDF_Label & acces);

		/****** XCAFDoc_DocumentTool::ViewsLabel ******/
		/****** md5 signature: 5a81b215e7e769e498fa8526eb262542 ******/
		%feature("compactdefaultargs") ViewsLabel;
		%feature("autodoc", "
Parameters
----------
acces: TDF_Label

Return
-------
TDF_Label

Description
-----------
Returns sub-label of DocLabel() with tag 7.
") ViewsLabel;
		static TDF_Label ViewsLabel(const TDF_Label & acces);

		/****** XCAFDoc_DocumentTool::VisMaterialLabel ******/
		/****** md5 signature: aa97b0800d16da0cd7711258f1341b2e ******/
		%feature("compactdefaultargs") VisMaterialLabel;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label

Return
-------
TDF_Label

Description
-----------
Returns sub-label of DocLabel() with tag 10.
") VisMaterialLabel;
		static TDF_Label VisMaterialLabel(const TDF_Label & theLabel);

		/****** XCAFDoc_DocumentTool::VisMaterialTool ******/
		/****** md5 signature: b8eef964f42cbc7ca9b1f5ddea81ec3e ******/
		%feature("compactdefaultargs") VisMaterialTool;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label

Return
-------
opencascade::handle<XCAFDoc_VisMaterialTool>

Description
-----------
Creates (if it does not exist) XCAFDoc_VisMaterialTool attribute on VisMaterialLabel(). Should not be confused with MaterialTool() defining physical/manufacturing materials.
") VisMaterialTool;
		static opencascade::handle<XCAFDoc_VisMaterialTool> VisMaterialTool(const TDF_Label & theLabel);

};


%make_alias(XCAFDoc_DocumentTool)

%extend XCAFDoc_DocumentTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class XCAFDoc_Editor *
***********************/
class XCAFDoc_Editor {
	public:
		/****** XCAFDoc_Editor::CloneMetaData ******/
		/****** md5 signature: 3cc390dda75b991f76037394062dd924 ******/
		%feature("compactdefaultargs") CloneMetaData;
		%feature("autodoc", "
Parameters
----------
theSrcLabel: TDF_Label
theDstLabel: TDF_Label
theVisMatMap: XCAFDoc_VisMaterial
theToCopyColor: bool (optional, default to true)
theToCopyLayer: bool (optional, default to true)
theToCopyMaterial: bool (optional, default to true)
theToCopyVisMaterial: bool (optional, default to true)
theToCopyAttributes: bool (optional, default to true)

Return
-------
None

Description
-----------
Copies metadata contains from the source label to the destination label. Protected against creating a new label for non-existent tools 
Input parameter: theSrcLabel original label to copy from 
Input parameter: theDstLabel destination shape label to set attributes 
Input parameter: theVisMatMap relating map of the original VisMaterial and created. Can be NULL for the same document 
Input parameter: theToCopyColor copying visible value and shape color (handled all color type) 
Input parameter: theToCopyLayer copying layer 
Input parameter: theToCopyMaterial copying material 
Input parameter: theToCopyVisMaterial copying visual material 
Input parameter: theToCopyAttributes copying of other node attributes, for example, a shape's property.
") CloneMetaData;
		static void CloneMetaData(const TDF_Label & theSrcLabel, const TDF_Label & theDstLabel, NCollection_DataMap<opencascade::handle<XCAFDoc_VisMaterial>, opencascade::handle<XCAFDoc_VisMaterial>> * theVisMatMap, const bool theToCopyColor = true, const bool theToCopyLayer = true, const bool theToCopyMaterial = true, const bool theToCopyVisMaterial = true, const bool theToCopyAttributes = true);

		/****** XCAFDoc_Editor::CloneShapeLabel ******/
		/****** md5 signature: 892fa9b918adb713c3b1e7d3c310c2e8 ******/
		%feature("compactdefaultargs") CloneShapeLabel;
		%feature("autodoc", "
Parameters
----------
theSrcLabel: TDF_Label
theSrcShapeTool: XCAFDoc_ShapeTool
theDstShapeTool: XCAFDoc_ShapeTool
theMap: TDF_LabelDataMap

Return
-------
TDF_Label

Description
-----------
Copies shapes label with keeping of shape structure (recursively) 
Input parameter: theSrcLabel original label to copy from 
Input parameter: theSrcShapeTool shape tool to get 
Input parameter: theDstShapeTool shape tool to set @param[out] theMap relating map of the original shapes label and labels created from them 
Return: result shape label.
") CloneShapeLabel;
		static TDF_Label CloneShapeLabel(const TDF_Label & theSrcLabel, const opencascade::handle<XCAFDoc_ShapeTool> & theSrcShapeTool, const opencascade::handle<XCAFDoc_ShapeTool> & theDstShapeTool, TDF_LabelDataMap & theMap);

		/****** XCAFDoc_Editor::Expand ******/
		/****** md5 signature: 8e7facb5fb17eb3b7f2f4eb941c1e568 ******/
		%feature("compactdefaultargs") Expand;
		%feature("autodoc", "
Parameters
----------
theDoc: TDF_Label
theShape: TDF_Label
theRecursively: bool (optional, default to true)

Return
-------
bool

Description
-----------
Converts shape (compound/compsolid/shell/wire) to assembly. 
Input parameter: theDoc input document 
Input parameter: theShape input shape label 
Input parameter: theRecursively recursively expand a compound subshape 
Return: True if shape successfully expanded.
") Expand;
		static bool Expand(const TDF_Label & theDoc, const TDF_Label & theShape, const bool theRecursively = true);

		/****** XCAFDoc_Editor::Expand ******/
		/****** md5 signature: 64ace23af99175690b54aa2c23e197a3 ******/
		%feature("compactdefaultargs") Expand;
		%feature("autodoc", "
Parameters
----------
theDoc: TDF_Label
theRecursively: bool (optional, default to true)

Return
-------
bool

Description
-----------
Converts all compounds shapes in the document to assembly 
Input parameter: theDoc input document 
Input parameter: theRecursively recursively expand a compound subshape 
Return: True if shape successfully expanded.
") Expand;
		static bool Expand(const TDF_Label & theDoc, const bool theRecursively = true);

		/****** XCAFDoc_Editor::Extract ******/
		/****** md5 signature: d3a86b51b218c51633600f7c3b683d9f ******/
		%feature("compactdefaultargs") Extract;
		%feature("autodoc", "
Parameters
----------
theSrcLabels: TDF_LabelSequence
theDstLabel: TDF_Label
theIsNoVisMat: bool (optional, default to false)

Return
-------
bool

Description
-----------
Clones all labels to a new position, keeping the structure with all the attributes 
Input parameter: theSrcLabels original labels to copy from 
Input parameter: theDstLabel label to set result as a component of or a main document's label to simply set new shape 
Input parameter: theIsNoVisMat get a VisMaterial attributes as is or convert to color 
Return: True if shape successfully extracted.
") Extract;
		static bool Extract(const TDF_LabelSequence & theSrcLabels, const TDF_Label & theDstLabel, const bool theIsNoVisMat = false);

		/****** XCAFDoc_Editor::Extract ******/
		/****** md5 signature: a938a60b72324690367837d6e857eb78 ******/
		%feature("compactdefaultargs") Extract;
		%feature("autodoc", "
Parameters
----------
theSrcLabel: TDF_Label
theDstLabel: TDF_Label
theIsNoVisMat: bool (optional, default to false)

Return
-------
bool

Description
-----------
Clones the label to a new position, keeping the structure with all the attributes 
Input parameter: theSrcLabel original label to copy from 
Input parameter: theDstLabel label to set result as a component of or a main document's label to simply set new shape 
Input parameter: theIsNoVisMat get a VisMaterial attributes as is or convert to color 
Return: True if shape successfully extracted.
") Extract;
		static bool Extract(const TDF_Label & theSrcLabel, const TDF_Label & theDstLabel, const bool theIsNoVisMat = false);

		/****** XCAFDoc_Editor::FilterShapeTree ******/
		/****** md5 signature: e655871d4719d04f5f270df81ac1770a ******/
		%feature("compactdefaultargs") FilterShapeTree;
		%feature("autodoc", "
Parameters
----------
theShapeTool: XCAFDoc_ShapeTool
theLabelsToKeep: TDF_LabelMap

Return
-------
bool

Description
-----------
Filters original shape tree with keeping structure. The result will include the full label hierarchy lower then input labels. Any higher hierarchy labels will be filtered to keep only necessary labels. All not related shape labels with input will be cleared (all attributes will be removed). //! The result impact directly into original document and existed shape labels. Attributes related to removed shape can became invalide. For example, GDT with relation on removed shape label(s) and without attachment point(s) became invalid for visualization. //! 
Input parameter: theShapeTool shape tool to extract from 
Input parameter: theLabelsToKeep labels to keep 
Return: true if the tree was filtered successfully.
") FilterShapeTree;
		static bool FilterShapeTree(const opencascade::handle<XCAFDoc_ShapeTool> & theShapeTool, const TDF_LabelMap & theLabelsToKeep);

		/****** XCAFDoc_Editor::GetChildShapeLabels ******/
		/****** md5 signature: f37cf67e90a0245b1894c136e48d1ce8 ******/
		%feature("compactdefaultargs") GetChildShapeLabels;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label
theRelatedLabels: TDF_LabelMap

Return
-------
None

Description
-----------
Gets shape labels that has up relation with the input label. 
Input parameter: theLabel input label @param[out] theRelatedLabels output labels.
") GetChildShapeLabels;
		static void GetChildShapeLabels(const TDF_Label & theLabel, TDF_LabelMap & theRelatedLabels);

		/****** XCAFDoc_Editor::GetParentShapeLabels ******/
		/****** md5 signature: 4a8ed72cfb7b35affa56bd061d38a51e ******/
		%feature("compactdefaultargs") GetParentShapeLabels;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label
theRelatedLabels: TDF_LabelMap

Return
-------
None

Description
-----------
Gets shape labels that has down relation with the input label. 
Input parameter: theLabel input label @param[out] theRelatedLabels output labels.
") GetParentShapeLabels;
		static void GetParentShapeLabels(const TDF_Label & theLabel, TDF_LabelMap & theRelatedLabels);

		/****** XCAFDoc_Editor::RescaleGeometry ******/
		/****** md5 signature: 304f127e58a892f9edc0da2ef680c8e3 ******/
		%feature("compactdefaultargs") RescaleGeometry;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label
theScaleFactor: double
theForceIfNotRoot: bool (optional, default to false)

Return
-------
bool

Description
-----------
Applies geometrical scaling to the following assembly components: - part geometry - sub-assembly/part occurrence location - part's centroid, area and volume attributes - PMIs (warnings and errors are reported if it is impossible to make changes) Normally, should start from a root sub-assembly, but if theForceIfNotRoot true scaling will be applied forcibly. If theLabel corresponds to the shape tool scaling is applied to the whole assembly. 
Input parameter: theLabel starting label 
Input parameter: theScaleFactor scale factor, should be positive 
Input parameter: theForceIfNotRoot allows scaling of a non root assembly if true,  otherwise - returns false 
Return: true in case of success, otherwise - false.
") RescaleGeometry;
		static bool RescaleGeometry(const TDF_Label & theLabel, const double theScaleFactor, const bool theForceIfNotRoot = false);

};


%extend XCAFDoc_Editor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class XCAFDoc_GeomTolerance *
******************************/
/**************************
* class XCAFDoc_GraphNode *
**************************/
class XCAFDoc_GraphNode : public TDF_Attribute {
	public:
		/****** XCAFDoc_GraphNode::XCAFDoc_GraphNode ******/
		/****** md5 signature: 643e3623efbb4efb8eb5d7e1356f6832 ******/
		%feature("compactdefaultargs") XCAFDoc_GraphNode;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") XCAFDoc_GraphNode;
		 XCAFDoc_GraphNode();

		/****** XCAFDoc_GraphNode::BeforeForget ******/
		/****** md5 signature: 62cb9500c708360c96952b8784c42662 ******/
		%feature("compactdefaultargs") BeforeForget;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BeforeForget;
		void BeforeForget();

		/****** XCAFDoc_GraphNode::ChildIndex ******/
		/****** md5 signature: 44dcccbcb55537cec15207a5e6dabeaa ******/
		%feature("compactdefaultargs") ChildIndex;
		%feature("autodoc", "
Parameters
----------
Ch: XCAFDoc_GraphNode

Return
-------
int

Description
-----------
Return index of <Ch>, or zero if there is no such Graphnode.
") ChildIndex;
		int ChildIndex(const opencascade::handle<XCAFDoc_GraphNode> & Ch);

		/****** XCAFDoc_GraphNode::Dump ******/
		/****** md5 signature: c3832f0735de2bdac14af95fe6ce7de3 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOS: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		Standard_OStream & Dump(std::ostream &OutValue);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** XCAFDoc_GraphNode::FatherIndex ******/
		/****** md5 signature: 96439df65079af5d28ff8138c0db53f7 ******/
		%feature("compactdefaultargs") FatherIndex;
		%feature("autodoc", "
Parameters
----------
F: XCAFDoc_GraphNode

Return
-------
int

Description
-----------
Return index of <F>, or zero if there is no such Graphnode.
") FatherIndex;
		int FatherIndex(const opencascade::handle<XCAFDoc_GraphNode> & F);

		/****** XCAFDoc_GraphNode::Find ******/
		/****** md5 signature: b2dec1c325ee7435bf0df38a1b8e9724 ******/
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label
G: XCAFDoc_GraphNode

Return
-------
bool

Description
-----------
class methods working on the node ================================= Shortcut to search a Graph node attribute with default GraphID. Returns true if found.
") Find;
		static bool Find(const TDF_Label & L, opencascade::handle<XCAFDoc_GraphNode> & G);

		/****** XCAFDoc_GraphNode::GetChild ******/
		/****** md5 signature: 81d3557f9292a4480b3a48edc8cb7b79 ******/
		%feature("compactdefaultargs") GetChild;
		%feature("autodoc", "
Parameters
----------
Chindex: int

Return
-------
opencascade::handle<XCAFDoc_GraphNode>

Description
-----------
Return GraphNode by index from GraphNodeSequence.
") GetChild;
		opencascade::handle<XCAFDoc_GraphNode> GetChild(const int Chindex);

		/****** XCAFDoc_GraphNode::GetDefaultGraphID ******/
		/****** md5 signature: 2532385e5611250dafc41295a1c5ea7c ******/
		%feature("compactdefaultargs") GetDefaultGraphID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
returns a default Graph ID. this ID is used by the <Set> method without explicit tree ID. Instance methods: ================.
") GetDefaultGraphID;
		static const Standard_GUID & GetDefaultGraphID();

		/****** XCAFDoc_GraphNode::GetFather ******/
		/****** md5 signature: 7080f4eb09370d6559e5cc006d317133 ******/
		%feature("compactdefaultargs") GetFather;
		%feature("autodoc", "
Parameters
----------
Findex: int

Return
-------
opencascade::handle<XCAFDoc_GraphNode>

Description
-----------
Return GraphNode by index from GraphNodeSequence.
") GetFather;
		opencascade::handle<XCAFDoc_GraphNode> GetFather(const int Findex);

		/****** XCAFDoc_GraphNode::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Returns the Graph ID (default or explicit one depending on the Set method used).
") ID;
		const Standard_GUID & ID();

		/****** XCAFDoc_GraphNode::IsChild ******/
		/****** md5 signature: 765d1ae22eb3c258f7715c64a4b6920d ******/
		%feature("compactdefaultargs") IsChild;
		%feature("autodoc", "
Parameters
----------
F: XCAFDoc_GraphNode

Return
-------
bool

Description
-----------
returns True if <self> is child of <F>.
") IsChild;
		bool IsChild(const opencascade::handle<XCAFDoc_GraphNode> & F);

		/****** XCAFDoc_GraphNode::IsFather ******/
		/****** md5 signature: 9ae74f54cc6366fe9ba827360c8b93f3 ******/
		%feature("compactdefaultargs") IsFather;
		%feature("autodoc", "
Parameters
----------
Ch: XCAFDoc_GraphNode

Return
-------
bool

Description
-----------
returns True if <self> is father of <Ch>.
") IsFather;
		bool IsFather(const opencascade::handle<XCAFDoc_GraphNode> & Ch);

		/****** XCAFDoc_GraphNode::NbChildren ******/
		/****** md5 signature: 7e65f71358e532585ba5de397dbc88a5 ******/
		%feature("compactdefaultargs") NbChildren;
		%feature("autodoc", "Return
-------
int

Description
-----------
return Number of Childrens GraphNodes. Implementation of Attribute methods: ===================================.
") NbChildren;
		int NbChildren();

		/****** XCAFDoc_GraphNode::NbFathers ******/
		/****** md5 signature: 1de0392851c99beaf70d03b46d76a78f ******/
		%feature("compactdefaultargs") NbFathers;
		%feature("autodoc", "Return
-------
int

Description
-----------
return Number of Fathers GraphNodes.
") NbFathers;
		int NbFathers();

		/****** XCAFDoc_GraphNode::NewEmpty ******/
		/****** md5 signature: 4ebad80fa2cacb9f9e231bbb83a29a98 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** XCAFDoc_GraphNode::Paste ******/
		/****** md5 signature: bfece7a0e37cb5034ac0b2a8c488da37 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
into: TDF_Attribute
RT: TDF_RelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****** XCAFDoc_GraphNode::References ******/
		/****** md5 signature: 3de62c613451bbbead6f06af1452fc25 ******/
		%feature("compactdefaultargs") References;
		%feature("autodoc", "
Parameters
----------
aDataSet: TDF_DataSet

Return
-------
None

Description
-----------
No available documentation.
") References;
		void References(const opencascade::handle<TDF_DataSet> & aDataSet);

		/****** XCAFDoc_GraphNode::Restore ******/
		/****** md5 signature: 8bde8d15cc1907242b8c43fe6eb18f19 ******/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
with: TDF_Attribute

Return
-------
None

Description
-----------
No available documentation.
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & with);

		/****** XCAFDoc_GraphNode::Set ******/
		/****** md5 signature: b6e8909fbbbdf1041428186cdb13569c ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label

Return
-------
opencascade::handle<XCAFDoc_GraphNode>

Description
-----------
Finds or Creates a GraphNode attribute on the label <L> with the default Graph ID, returned by the method <GetDefaultGraphID>. Returns the created/found GraphNode attribute.
") Set;
		static opencascade::handle<XCAFDoc_GraphNode> Set(const TDF_Label & L);

		/****** XCAFDoc_GraphNode::Set ******/
		/****** md5 signature: b809956f0f830840d9994567f2e0323a ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label
ExplicitGraphID: Standard_GUID

Return
-------
opencascade::handle<XCAFDoc_GraphNode>

Description
-----------
Finds or Creates a GraphNode attribute on the label <L>, with an explicit tree ID. <ExplicitGraphID> is the ID returned by <TDF_Attribute::ID> method. Returns the found/created GraphNode attribute.
") Set;
		static opencascade::handle<XCAFDoc_GraphNode> Set(const TDF_Label & L, const Standard_GUID & ExplicitGraphID);

		/****** XCAFDoc_GraphNode::SetChild ******/
		/****** md5 signature: 264c3a9a96cb34bea000b8e67a40bbd7 ******/
		%feature("compactdefaultargs") SetChild;
		%feature("autodoc", "
Parameters
----------
Ch: XCAFDoc_GraphNode

Return
-------
int

Description
-----------
Set GraphNode <Ch> as child of me and returns index of <Ch> in Sequence that containing Children GraphNodes. return index of <Ch> from GraphNodeSequnece.
") SetChild;
		int SetChild(const opencascade::handle<XCAFDoc_GraphNode> & Ch);

		/****** XCAFDoc_GraphNode::SetFather ******/
		/****** md5 signature: d146a078e5a799f364b62358a00fb251 ******/
		%feature("compactdefaultargs") SetFather;
		%feature("autodoc", "
Parameters
----------
F: XCAFDoc_GraphNode

Return
-------
int

Description
-----------
Set GraphNode <F> as father of me and returns index of <F> in Sequence that containing Fathers GraphNodes. return index of <F> from GraphNodeSequnece.
") SetFather;
		int SetFather(const opencascade::handle<XCAFDoc_GraphNode> & F);

		/****** XCAFDoc_GraphNode::SetGraphID ******/
		/****** md5 signature: f024812dcf92005052396001898ee2fa ******/
		%feature("compactdefaultargs") SetGraphID;
		%feature("autodoc", "
Parameters
----------
explicitID: Standard_GUID

Return
-------
None

Description
-----------
No available documentation.
") SetGraphID;
		void SetGraphID(const Standard_GUID & explicitID);

		/****** XCAFDoc_GraphNode::UnSetChild ******/
		/****** md5 signature: 3f93c2a21491d627b4f30b8c6d1186c9 ******/
		%feature("compactdefaultargs") UnSetChild;
		%feature("autodoc", "
Parameters
----------
Ch: XCAFDoc_GraphNode

Return
-------
None

Description
-----------
Remove <Ch> from GraphNodeSequence. and remove link between father and child.
") UnSetChild;
		void UnSetChild(const opencascade::handle<XCAFDoc_GraphNode> & Ch);

		/****** XCAFDoc_GraphNode::UnSetChild ******/
		/****** md5 signature: 03cff3c4cdbf7cb2ea37f651bf944cf9 ******/
		%feature("compactdefaultargs") UnSetChild;
		%feature("autodoc", "
Parameters
----------
Chindex: int

Return
-------
None

Description
-----------
Remove Child GraphNode by index from Children GraphNodeSequence. and remove link between father and child.
") UnSetChild;
		void UnSetChild(const int Chindex);

		/****** XCAFDoc_GraphNode::UnSetFather ******/
		/****** md5 signature: 7db0f5a2b969b8587c0c18917b5183da ******/
		%feature("compactdefaultargs") UnSetFather;
		%feature("autodoc", "
Parameters
----------
F: XCAFDoc_GraphNode

Return
-------
None

Description
-----------
Remove <F> from Fathers GraphNodeSequence. and remove link between father and child.
") UnSetFather;
		void UnSetFather(const opencascade::handle<XCAFDoc_GraphNode> & F);

		/****** XCAFDoc_GraphNode::UnSetFather ******/
		/****** md5 signature: 66cd7ffc76a3a05c586b8556d713fcac ******/
		%feature("compactdefaultargs") UnSetFather;
		%feature("autodoc", "
Parameters
----------
Findex: int

Return
-------
None

Description
-----------
Remove Father GraphNode by index from Fathers GraphNodeSequence. and remove link between father and child.
") UnSetFather;
		void UnSetFather(const int Findex);

};


%make_alias(XCAFDoc_GraphNode)

%extend XCAFDoc_GraphNode {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class XCAFDoc_LayerTool *
**************************/
class XCAFDoc_LayerTool : public TDataStd_GenericEmpty {
	public:
		/****** XCAFDoc_LayerTool::XCAFDoc_LayerTool ******/
		/****** md5 signature: e54175d79e822b0491336741e09fba62 ******/
		%feature("compactdefaultargs") XCAFDoc_LayerTool;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") XCAFDoc_LayerTool;
		 XCAFDoc_LayerTool();

		/****** XCAFDoc_LayerTool::AddLayer ******/
		/****** md5 signature: b4e925ccd9f434d36de9de65e71210fd ******/
		%feature("compactdefaultargs") AddLayer;
		%feature("autodoc", "
Parameters
----------
theLayer: str

Return
-------
TDF_Label

Description
-----------
Adds a Layer definition to a Layertable and returns its label (returns existing label if the same Layer is already defined).
") AddLayer;
		TDF_Label AddLayer(TCollection_ExtendedString theLayer);

		/****** XCAFDoc_LayerTool::AddLayer ******/
		/****** md5 signature: 1a86bc74104e9bb8a7f95e7a3c012780 ******/
		%feature("compactdefaultargs") AddLayer;
		%feature("autodoc", "
Parameters
----------
theLayer: str
theToFindVisible: bool

Return
-------
TDF_Label

Description
-----------
Adds a Layer definition to a Layertable and returns its label Returns existing label (if it is already defined) of visible or invisible layer, according to <theToFindVisible> parameter.
") AddLayer;
		TDF_Label AddLayer(TCollection_ExtendedString theLayer, const bool theToFindVisible);

		/****** XCAFDoc_LayerTool::BaseLabel ******/
		/****** md5 signature: cb499d8135863e96e585085d0b85c75a ******/
		%feature("compactdefaultargs") BaseLabel;
		%feature("autodoc", "Return
-------
TDF_Label

Description
-----------
returns the label under which Layers are stored.
") BaseLabel;
		TDF_Label BaseLabel();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** XCAFDoc_LayerTool::FindLayer ******/
		/****** md5 signature: 02ca150171c212c9245741ff3edee18a ******/
		%feature("compactdefaultargs") FindLayer;
		%feature("autodoc", "
Parameters
----------
aLayer: str
lab: TDF_Label

Return
-------
bool

Description
-----------
Finds a Layer definition in a Layertable and returns its label if found Returns False if Layer is not found in Layertable.
") FindLayer;
		bool FindLayer(TCollection_ExtendedString aLayer, TDF_Label & lab);

		/****** XCAFDoc_LayerTool::FindLayer ******/
		/****** md5 signature: 0f2fef699c7352064ec8195e2bc66ab7 ******/
		%feature("compactdefaultargs") FindLayer;
		%feature("autodoc", "
Parameters
----------
aLayer: str
theToFindWithProperty: bool (optional, default to false)
theToFindVisible: bool (optional, default to true)

Return
-------
TDF_Label

Description
-----------
Finds a Layer definition in a Layertable by name Returns first founded label with the same name if <theToFindWithProperty> is false If <theToFindWithProperty> is true returns first label that contains or not contains visible attr, according to the <theToFindVisible> parameter.
") FindLayer;
		TDF_Label FindLayer(TCollection_ExtendedString aLayer, const bool theToFindWithProperty = false, const bool theToFindVisible = true);

		/****** XCAFDoc_LayerTool::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") GetID;
		static const Standard_GUID & GetID();

		/****** XCAFDoc_LayerTool::GetLayer ******/
		/****** md5 signature: 75fa02378e0725e5e2a8d037be1be782 ******/
		%feature("compactdefaultargs") GetLayer;
		%feature("autodoc", "
Parameters
----------
lab: TDF_Label
aLayer: str

Return
-------
bool

Description
-----------
Returns Layer defined by label lab Returns False if the label is not in Layertable or does not define a Layer.
") GetLayer;
		bool GetLayer(const TDF_Label & lab, TCollection_ExtendedString & aLayer);

		/****** XCAFDoc_LayerTool::GetLayerLabels ******/
		/****** md5 signature: 2010c01cdec1658ae369f59d67fb2566 ******/
		%feature("compactdefaultargs") GetLayerLabels;
		%feature("autodoc", "
Parameters
----------
Labels: TDF_LabelSequence

Return
-------
None

Description
-----------
Returns a sequence of Layers currently stored in the Layertable.
") GetLayerLabels;
		void GetLayerLabels(TDF_LabelSequence & Labels);

		/****** XCAFDoc_LayerTool::GetLayers ******/
		/****** md5 signature: c18eec4f316c1825ee20a3c6df412e0c ******/
		%feature("compactdefaultargs") GetLayers;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label
aLayerS: TColStd_HSequenceOfExtendedString

Return
-------
bool

Description
-----------
Return sequence of strings <aLayerS> that associated with label <L>.
") GetLayers;
		bool GetLayers(const TDF_Label & L, opencascade::handle<TColStd_HSequenceOfExtendedString> & aLayerS);

		/****** XCAFDoc_LayerTool::GetLayers ******/
		/****** md5 signature: eeb680328019d023d4b942c386c5419f ******/
		%feature("compactdefaultargs") GetLayers;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label
aLayerLS: TDF_LabelSequence

Return
-------
bool

Description
-----------
Return sequence of labels <aLayerSL> that associated with label <L>.
") GetLayers;
		bool GetLayers(const TDF_Label & L, TDF_LabelSequence & aLayerLS);

		/****** XCAFDoc_LayerTool::GetLayers ******/
		/****** md5 signature: 60800ae52dd05e0b49770c381aa4b6f3 ******/
		%feature("compactdefaultargs") GetLayers;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label

Return
-------
opencascade::handle<TColStd_HSequenceOfExtendedString>

Description
-----------
Return sequence of strings that associated with label <L>.
") GetLayers;
		opencascade::handle<TColStd_HSequenceOfExtendedString> GetLayers(const TDF_Label & L);

		/****** XCAFDoc_LayerTool::GetLayers ******/
		/****** md5 signature: a6bd610fa73b84cbac06d862128d92ee ******/
		%feature("compactdefaultargs") GetLayers;
		%feature("autodoc", "
Parameters
----------
Sh: TopoDS_Shape
aLayerS: TColStd_HSequenceOfExtendedString

Return
-------
bool

Description
-----------
Return sequence of strings <aLayerS> that associated with shape <Sh>.
") GetLayers;
		bool GetLayers(const TopoDS_Shape & Sh, opencascade::handle<TColStd_HSequenceOfExtendedString> & aLayerS);

		/****** XCAFDoc_LayerTool::GetLayers ******/
		/****** md5 signature: 3d16020e8dd49c55e716f5d3c808cc93 ******/
		%feature("compactdefaultargs") GetLayers;
		%feature("autodoc", "
Parameters
----------
Sh: TopoDS_Shape
aLayerLS: TDF_LabelSequence

Return
-------
bool

Description
-----------
Return sequence of labels <aLayerLS> that associated with shape <Sh>.
") GetLayers;
		bool GetLayers(const TopoDS_Shape & Sh, TDF_LabelSequence & aLayerLS);

		/****** XCAFDoc_LayerTool::GetLayers ******/
		/****** md5 signature: e0693fd0d0b57d20feecff1826528ece ******/
		%feature("compactdefaultargs") GetLayers;
		%feature("autodoc", "
Parameters
----------
Sh: TopoDS_Shape

Return
-------
opencascade::handle<TColStd_HSequenceOfExtendedString>

Description
-----------
Return sequence of strings that associated with shape <Sh>.
") GetLayers;
		opencascade::handle<TColStd_HSequenceOfExtendedString> GetLayers(const TopoDS_Shape & Sh);

		/****** XCAFDoc_LayerTool::GetShapesOfLayer ******/
		/****** md5 signature: a600ebd4a8ee63dbb596a3dfc0d3bce2 ******/
		%feature("compactdefaultargs") GetShapesOfLayer;
		%feature("autodoc", "
Parameters
----------
theLayerL: TDF_Label
theShLabels: TDF_LabelSequence

Return
-------
None

Description
-----------
Return sequanese of shape labels that assigned with layers to <ShLabels>.
") GetShapesOfLayer;
		static void GetShapesOfLayer(const TDF_Label & theLayerL, TDF_LabelSequence & theShLabels);

		/****** XCAFDoc_LayerTool::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** XCAFDoc_LayerTool::IsLayer ******/
		/****** md5 signature: 70a62851e77882e7abe75bb300947905 ******/
		%feature("compactdefaultargs") IsLayer;
		%feature("autodoc", "
Parameters
----------
lab: TDF_Label

Return
-------
bool

Description
-----------
Returns True if label belongs to a Layertable and is a Layer definition.
") IsLayer;
		bool IsLayer(const TDF_Label & lab);

		/****** XCAFDoc_LayerTool::IsSet ******/
		/****** md5 signature: 8d7ae741419035d2b7ee2aefcf845df8 ******/
		%feature("compactdefaultargs") IsSet;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label
aLayer: str

Return
-------
bool

Description
-----------
Returns True if label <L> has a Layer associated with the <aLayer>.
") IsSet;
		bool IsSet(const TDF_Label & L, TCollection_ExtendedString aLayer);

		/****** XCAFDoc_LayerTool::IsSet ******/
		/****** md5 signature: 9a5b6a8509de91fa64242b5df580e198 ******/
		%feature("compactdefaultargs") IsSet;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label
aLayerL: TDF_Label

Return
-------
bool

Description
-----------
Returns True if label <L> has a Layer associated with the <aLayerL> label.
") IsSet;
		bool IsSet(const TDF_Label & L, const TDF_Label & aLayerL);

		/****** XCAFDoc_LayerTool::IsSet ******/
		/****** md5 signature: aeec069d30332fe27664a6a19c4f53da ******/
		%feature("compactdefaultargs") IsSet;
		%feature("autodoc", "
Parameters
----------
Sh: TopoDS_Shape
aLayer: str

Return
-------
bool

Description
-----------
Returns True if shape <Sh> has a Layer associated with the <aLayer>.
") IsSet;
		bool IsSet(const TopoDS_Shape & Sh, TCollection_ExtendedString aLayer);

		/****** XCAFDoc_LayerTool::IsSet ******/
		/****** md5 signature: 3efc75067c06ed58f8fd43fa99ae864a ******/
		%feature("compactdefaultargs") IsSet;
		%feature("autodoc", "
Parameters
----------
Sh: TopoDS_Shape
aLayerL: TDF_Label

Return
-------
bool

Description
-----------
Returns True if shape <Sh> has a Layer associated with the <aLayerL>.
") IsSet;
		bool IsSet(const TopoDS_Shape & Sh, const TDF_Label & aLayerL);

		/****** XCAFDoc_LayerTool::IsVisible ******/
		/****** md5 signature: c56293ac5ec7f0dd2381bb7e29002846 ******/
		%feature("compactdefaultargs") IsVisible;
		%feature("autodoc", "
Parameters
----------
layerL: TDF_Label

Return
-------
bool

Description
-----------
Return True if layer is visible, False if invisible.
") IsVisible;
		bool IsVisible(const TDF_Label & layerL);

		/****** XCAFDoc_LayerTool::RemoveLayer ******/
		/****** md5 signature: 70b3d064bc3eaaa8774633bc02985d70 ******/
		%feature("compactdefaultargs") RemoveLayer;
		%feature("autodoc", "
Parameters
----------
lab: TDF_Label

Return
-------
None

Description
-----------
Removes Layer from the Layertable.
") RemoveLayer;
		void RemoveLayer(const TDF_Label & lab);

		/****** XCAFDoc_LayerTool::Set ******/
		/****** md5 signature: 9357654ead4b02c2995c604f9b674917 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label

Return
-------
opencascade::handle<XCAFDoc_LayerTool>

Description
-----------
Creates (if not exist) LayerTool.
") Set;
		static opencascade::handle<XCAFDoc_LayerTool> Set(const TDF_Label & L);

		/****** XCAFDoc_LayerTool::SetLayer ******/
		/****** md5 signature: 8dd10864e8acf1225316dfd5b92f1764 ******/
		%feature("compactdefaultargs") SetLayer;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label
LayerL: TDF_Label
shapeInOneLayer: bool (optional, default to false)

Return
-------
None

Description
-----------
Sets a link from label <L> to Layer defined by <LayerL> optional parameter <shapeInOneLayer> show could shape be in number of layers or only in one.
") SetLayer;
		void SetLayer(const TDF_Label & L, const TDF_Label & LayerL, const bool shapeInOneLayer = false);

		/****** XCAFDoc_LayerTool::SetLayer ******/
		/****** md5 signature: 440060fc53cc6691e11cb25b689b738f ******/
		%feature("compactdefaultargs") SetLayer;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label
aLayer: str
shapeInOneLayer: bool (optional, default to false)

Return
-------
None

Description
-----------
Sets a link from label <L> to Layer <aLayer> in the Layertable Adds a Layer as necessary optional parameter <shapeInOneLayer> show could shape be in number of layers or only in one.
") SetLayer;
		void SetLayer(const TDF_Label & L, TCollection_ExtendedString aLayer, const bool shapeInOneLayer = false);

		/****** XCAFDoc_LayerTool::SetLayer ******/
		/****** md5 signature: d5dc4bf3ced67e83b008a6f7161d013f ******/
		%feature("compactdefaultargs") SetLayer;
		%feature("autodoc", "
Parameters
----------
Sh: TopoDS_Shape
LayerL: TDF_Label
shapeInOneLayer: bool (optional, default to false)

Return
-------
bool

Description
-----------
Sets a link from label that containing shape <Sh> with layer that situated at label <LayerL>. optional parameter <shapeInOneLayer> show could shape be in number of layers or only in one. return False if no such shape <Sh> or label <LayerL>.
") SetLayer;
		bool SetLayer(const TopoDS_Shape & Sh, const TDF_Label & LayerL, const bool shapeInOneLayer = false);

		/****** XCAFDoc_LayerTool::SetLayer ******/
		/****** md5 signature: abc477eb6f8c05f918369ebdd97538c1 ******/
		%feature("compactdefaultargs") SetLayer;
		%feature("autodoc", "
Parameters
----------
Sh: TopoDS_Shape
aLayer: str
shapeInOneLayer: bool (optional, default to false)

Return
-------
bool

Description
-----------
Sets a link from label that containing shape <Sh> with layer <aLayer>. Add <aLayer> to LayerTable if nessesery. optional parameter <shapeInOneLayer> show could shape be in number of layers or only in one. return False if no such shape <Sh>.
") SetLayer;
		bool SetLayer(const TopoDS_Shape & Sh, TCollection_ExtendedString aLayer, const bool shapeInOneLayer = false);

		/****** XCAFDoc_LayerTool::SetVisibility ******/
		/****** md5 signature: 0e049568dcbab22a4df38a71aafbe676 ******/
		%feature("compactdefaultargs") SetVisibility;
		%feature("autodoc", "
Parameters
----------
layerL: TDF_Label
isvisible: bool (optional, default to true)

Return
-------
None

Description
-----------
Set the visibility of layer. If layer is invisible when on it's layer will set UAttribute with corresponding GUID.
") SetVisibility;
		void SetVisibility(const TDF_Label & layerL, const bool isvisible = true);

		/****** XCAFDoc_LayerTool::ShapeTool ******/
		/****** md5 signature: f3b52ea6763fc2a237d4ce7351722eb2 ******/
		%feature("compactdefaultargs") ShapeTool;
		%feature("autodoc", "Return
-------
opencascade::handle<XCAFDoc_ShapeTool>

Description
-----------
Returns internal XCAFDoc_ShapeTool tool.
") ShapeTool;
		const opencascade::handle<XCAFDoc_ShapeTool> & ShapeTool();

		/****** XCAFDoc_LayerTool::UnSetLayers ******/
		/****** md5 signature: 6b2f8a0f998eeb6df2ab7a1db6a4fa18 ******/
		%feature("compactdefaultargs") UnSetLayers;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label

Return
-------
None

Description
-----------
Removes a link from label <L> to all layers.
") UnSetLayers;
		void UnSetLayers(const TDF_Label & L);

		/****** XCAFDoc_LayerTool::UnSetLayers ******/
		/****** md5 signature: 4328449f361558b897379e15c99c505a ******/
		%feature("compactdefaultargs") UnSetLayers;
		%feature("autodoc", "
Parameters
----------
Sh: TopoDS_Shape

Return
-------
bool

Description
-----------
Remove link between shape <Sh> and all Layers at LayerTable. return False if no such shape <Sh> in XCAF Document.
") UnSetLayers;
		bool UnSetLayers(const TopoDS_Shape & Sh);

		/****** XCAFDoc_LayerTool::UnSetOneLayer ******/
		/****** md5 signature: aed2cb7cb3e4f6eca87ee38d8c7f9e7e ******/
		%feature("compactdefaultargs") UnSetOneLayer;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label
aLayer: str

Return
-------
bool

Description
-----------
Remove link from label <L> and Layer <aLayer>. returns False if no such layer.
") UnSetOneLayer;
		bool UnSetOneLayer(const TDF_Label & L, TCollection_ExtendedString aLayer);

		/****** XCAFDoc_LayerTool::UnSetOneLayer ******/
		/****** md5 signature: d6ea28853677a9603f4deb691dcf53cd ******/
		%feature("compactdefaultargs") UnSetOneLayer;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label
aLayerL: TDF_Label

Return
-------
bool

Description
-----------
Remove link from label <L> and Layer <aLayerL>. returns False if <aLayerL> is not a layer label.
") UnSetOneLayer;
		bool UnSetOneLayer(const TDF_Label & L, const TDF_Label & aLayerL);

		/****** XCAFDoc_LayerTool::UnSetOneLayer ******/
		/****** md5 signature: fa34dd947dd1d3adfc05f700e7b1577c ******/
		%feature("compactdefaultargs") UnSetOneLayer;
		%feature("autodoc", "
Parameters
----------
Sh: TopoDS_Shape
aLayer: str

Return
-------
bool

Description
-----------
Remove link between shape <Sh> and layer <aLayer>. returns False if no such layer <aLayer> or shape <Sh>.
") UnSetOneLayer;
		bool UnSetOneLayer(const TopoDS_Shape & Sh, TCollection_ExtendedString aLayer);

		/****** XCAFDoc_LayerTool::UnSetOneLayer ******/
		/****** md5 signature: 858467e3e336cfcf20133299c1f3e439 ******/
		%feature("compactdefaultargs") UnSetOneLayer;
		%feature("autodoc", "
Parameters
----------
Sh: TopoDS_Shape
aLayerL: TDF_Label

Return
-------
bool

Description
-----------
Remove link between shape <Sh> and layer <aLayerL>. returns False if no such layer <aLayerL> or shape <Sh>.
") UnSetOneLayer;
		bool UnSetOneLayer(const TopoDS_Shape & Sh, const TDF_Label & aLayerL);

};


%make_alias(XCAFDoc_LayerTool)

%extend XCAFDoc_LayerTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class XCAFDoc_LengthUnit *
***************************/
class XCAFDoc_LengthUnit : public TDF_Attribute {
	public:
		/****** XCAFDoc_LengthUnit::XCAFDoc_LengthUnit ******/
		/****** md5 signature: 364d9ddfae96196b2b587c84f83339d1 ******/
		%feature("compactdefaultargs") XCAFDoc_LengthUnit;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") XCAFDoc_LengthUnit;
		 XCAFDoc_LengthUnit();

		/****** XCAFDoc_LengthUnit::Dump ******/
		/****** md5 signature: c3832f0735de2bdac14af95fe6ce7de3 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOS: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		Standard_OStream & Dump(std::ostream &OutValue);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** XCAFDoc_LengthUnit::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Returns the GUID of the attribute.
") GetID;
		static const Standard_GUID & GetID();

		/****** XCAFDoc_LengthUnit::GetUnitName ******/
		/****** md5 signature: 16cdd69f7f38a7fd849d2d4de7b40582 ******/
		%feature("compactdefaultargs") GetUnitName;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Length unit description (could be arbitrary text).
") GetUnitName;
		const TCollection_AsciiString & GetUnitName();

		/****** XCAFDoc_LengthUnit::GetUnitValue ******/
		/****** md5 signature: ad7640508d1460e169c68a600ef9edf2 ******/
		%feature("compactdefaultargs") GetUnitValue;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns length unit scale factor to meter.
") GetUnitValue;
		double GetUnitValue();

		/****** XCAFDoc_LengthUnit::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** XCAFDoc_LengthUnit::IsEmpty ******/
		/****** md5 signature: 70a41d5fe65955a28167088305fc6991 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsEmpty;
		bool IsEmpty();

		/****** XCAFDoc_LengthUnit::Paste ******/
		/****** md5 signature: d899fab304a21d933c88c466423b5c62 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
theInto: TDF_Attribute
theRT: TDF_RelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & theInto, const opencascade::handle<TDF_RelocationTable> & theRT);

		/****** XCAFDoc_LengthUnit::Restore ******/
		/****** md5 signature: a185c1616ee303e3a863a289ca3eba90 ******/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
theWith: TDF_Attribute

Return
-------
None

Description
-----------
No available documentation.
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & theWith);

		/****** XCAFDoc_LengthUnit::Set ******/
		/****** md5 signature: df799d55be79e55154c1118e8026d8a2 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label
theUnitName: str
theUnitValue: double

Return
-------
opencascade::handle<XCAFDoc_LengthUnit>

Description
-----------
Finds or creates a LengthUnit attribute 
Parameter theUnitName - name of the unit: mm, m, cm, km, micron, in, min, nin, ft, stat.mile 
Parameter theUnitValue - length scale factor to meter The LengthUnit attribute is returned.
") Set;
		static opencascade::handle<XCAFDoc_LengthUnit> Set(const TDF_Label & theLabel, TCollection_AsciiString theUnitName, const double theUnitValue);

		/****** XCAFDoc_LengthUnit::Set ******/
		/****** md5 signature: e8a6f34678b50d3e4dad85c442cd925f ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label
theUnitValue: double

Return
-------
opencascade::handle<XCAFDoc_LengthUnit>

Description
-----------
Finds or creates a LengthUnit attribute 
Parameter theUnitValue - length scale factor to meter The LengthUnit attribute is returned.
") Set;
		static opencascade::handle<XCAFDoc_LengthUnit> Set(const TDF_Label & theLabel, const double theUnitValue);

		/****** XCAFDoc_LengthUnit::Set ******/
		/****** md5 signature: 9bf13f1788032bb93372f8ce60cb8b54 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label
theGUID: Standard_GUID
theUnitName: str
theUnitValue: double

Return
-------
opencascade::handle<XCAFDoc_LengthUnit>

Description
-----------
Finds, or creates, a LengthUnit attribute with explicit user defined GUID 
Parameter theUnitName - name of the unit: mm, m, cm, km, micron, in, min, nin, ft, stat.mile 
Parameter theUnitValue - length scale factor to meter The LengthUnit attribute is returned.
") Set;
		static opencascade::handle<XCAFDoc_LengthUnit> Set(const TDF_Label & theLabel, const Standard_GUID & theGUID, TCollection_AsciiString theUnitName, const double theUnitValue);

		/****** XCAFDoc_LengthUnit::Set ******/
		/****** md5 signature: d254989d186107f91c1233f78236d6b4 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
theUnitName: str
theUnitValue: double

Return
-------
None

Description
-----------
Creates a LengthUnit attribute 
Parameter theUnitName - name of the unit: mm, m, cm, km, micron, in, min, nin, ft, stat.mile 
Parameter theUnitValue - length scale factor to meter.
") Set;
		void Set(TCollection_AsciiString theUnitName, const double theUnitValue);

};


%make_alias(XCAFDoc_LengthUnit)

%extend XCAFDoc_LengthUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class XCAFDoc_Location *
*************************/
class XCAFDoc_Location : public TDF_Attribute {
	public:
		/****** XCAFDoc_Location::XCAFDoc_Location ******/
		/****** md5 signature: 2d5e62afecc2f47f6a32deafc536152b ******/
		%feature("compactdefaultargs") XCAFDoc_Location;
		%feature("autodoc", "Return
-------
None

Description
-----------
class methods =============.
") XCAFDoc_Location;
		 XCAFDoc_Location();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** XCAFDoc_Location::Get ******/
		/****** md5 signature: 359bc64c03f84420a1380939ba1ece6c ******/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Return
-------
TopLoc_Location

Description
-----------
Returns True if there is a reference on the same label.
") Get;
		const TopLoc_Location & Get();

		/****** XCAFDoc_Location::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") GetID;
		static const Standard_GUID & GetID();

		/****** XCAFDoc_Location::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** XCAFDoc_Location::NewEmpty ******/
		/****** md5 signature: 4ebad80fa2cacb9f9e231bbb83a29a98 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** XCAFDoc_Location::Paste ******/
		/****** md5 signature: bfece7a0e37cb5034ac0b2a8c488da37 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Into: TDF_Attribute
RT: TDF_RelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****** XCAFDoc_Location::Restore ******/
		/****** md5 signature: 8bde8d15cc1907242b8c43fe6eb18f19 ******/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
With: TDF_Attribute

Return
-------
None

Description
-----------
No available documentation.
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****** XCAFDoc_Location::Set ******/
		/****** md5 signature: 0c361e816257c5327f25db0bbb1ba828 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
Loc: TopLoc_Location

Return
-------
opencascade::handle<XCAFDoc_Location>

Description
-----------
Find, or create, a Location attribute and set it's value the Location attribute is returned. Location methods ===============.
") Set;
		static opencascade::handle<XCAFDoc_Location> Set(const TDF_Label & label, const TopLoc_Location & Loc);

		/****** XCAFDoc_Location::Set ******/
		/****** md5 signature: 966bc32cd32426ecb76db3a1646d4b65 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Loc: TopLoc_Location

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const TopLoc_Location & Loc);

};


%make_alias(XCAFDoc_Location)

%extend XCAFDoc_Location {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class XCAFDoc_Material *
*************************/
class XCAFDoc_Material : public TDF_Attribute {
	public:
		/****** XCAFDoc_Material::XCAFDoc_Material ******/
		/****** md5 signature: f462b57795f908e7fe50317722771242 ******/
		%feature("compactdefaultargs") XCAFDoc_Material;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") XCAFDoc_Material;
		 XCAFDoc_Material();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** XCAFDoc_Material::GetDensName ******/
		/****** md5 signature: 3b1043acd4ad662679429887111967a0 ******/
		%feature("compactdefaultargs") GetDensName;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") GetDensName;
		opencascade::handle<TCollection_HAsciiString> GetDensName();

		/****** XCAFDoc_Material::GetDensValType ******/
		/****** md5 signature: 42efd68e1d2c974eb5eb1ab702d3a6de ******/
		%feature("compactdefaultargs") GetDensValType;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") GetDensValType;
		opencascade::handle<TCollection_HAsciiString> GetDensValType();

		/****** XCAFDoc_Material::GetDensity ******/
		/****** md5 signature: d2d77174e080603ed9dde6a10696ff4d ******/
		%feature("compactdefaultargs") GetDensity;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") GetDensity;
		double GetDensity();

		/****** XCAFDoc_Material::GetDescription ******/
		/****** md5 signature: d57bdeefc6af6dad2fd33af139e84636 ******/
		%feature("compactdefaultargs") GetDescription;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") GetDescription;
		opencascade::handle<TCollection_HAsciiString> GetDescription();

		/****** XCAFDoc_Material::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") GetID;
		static const Standard_GUID & GetID();

		/****** XCAFDoc_Material::GetName ******/
		/****** md5 signature: 23aadc9cd2e3411b58fb02d3fd2db5c9 ******/
		%feature("compactdefaultargs") GetName;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") GetName;
		opencascade::handle<TCollection_HAsciiString> GetName();

		/****** XCAFDoc_Material::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** XCAFDoc_Material::NewEmpty ******/
		/****** md5 signature: 4ebad80fa2cacb9f9e231bbb83a29a98 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** XCAFDoc_Material::Paste ******/
		/****** md5 signature: bfece7a0e37cb5034ac0b2a8c488da37 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Into: TDF_Attribute
RT: TDF_RelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****** XCAFDoc_Material::Restore ******/
		/****** md5 signature: 8bde8d15cc1907242b8c43fe6eb18f19 ******/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
With: TDF_Attribute

Return
-------
None

Description
-----------
No available documentation.
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****** XCAFDoc_Material::Set ******/
		/****** md5 signature: 5146789d7a843fb514de39a3ce029b8d ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
aDensity: double
aDensName: TCollection_HAsciiString
aDensValType: TCollection_HAsciiString

Return
-------
opencascade::handle<XCAFDoc_Material>

Description
-----------
No available documentation.
") Set;
		static opencascade::handle<XCAFDoc_Material> Set(const TDF_Label & label, const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription, const double aDensity, const opencascade::handle<TCollection_HAsciiString> & aDensName, const opencascade::handle<TCollection_HAsciiString> & aDensValType);

		/****** XCAFDoc_Material::Set ******/
		/****** md5 signature: e048f5d15644db07800a92bfd076fdad ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
aDensity: double
aDensName: TCollection_HAsciiString
aDensValType: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription, const double aDensity, const opencascade::handle<TCollection_HAsciiString> & aDensName, const opencascade::handle<TCollection_HAsciiString> & aDensValType);

};


%make_alias(XCAFDoc_Material)

%extend XCAFDoc_Material {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class XCAFDoc_MaterialTool *
*****************************/
class XCAFDoc_MaterialTool : public TDataStd_GenericEmpty {
	public:
		/****** XCAFDoc_MaterialTool::XCAFDoc_MaterialTool ******/
		/****** md5 signature: fbb0be87f4f6e7f0c11ef3c770906fb1 ******/
		%feature("compactdefaultargs") XCAFDoc_MaterialTool;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") XCAFDoc_MaterialTool;
		 XCAFDoc_MaterialTool();

		/****** XCAFDoc_MaterialTool::AddMaterial ******/
		/****** md5 signature: b8792ca5b64b79e130a28659296c16c2 ******/
		%feature("compactdefaultargs") AddMaterial;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
aDensity: double
aDensName: TCollection_HAsciiString
aDensValType: TCollection_HAsciiString

Return
-------
TDF_Label

Description
-----------
Adds a Material definition to a table and returns its label.
") AddMaterial;
		TDF_Label AddMaterial(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription, const double aDensity, const opencascade::handle<TCollection_HAsciiString> & aDensName, const opencascade::handle<TCollection_HAsciiString> & aDensValType);

		/****** XCAFDoc_MaterialTool::BaseLabel ******/
		/****** md5 signature: cb499d8135863e96e585085d0b85c75a ******/
		%feature("compactdefaultargs") BaseLabel;
		%feature("autodoc", "Return
-------
TDF_Label

Description
-----------
returns the label under which colors are stored.
") BaseLabel;
		TDF_Label BaseLabel();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** XCAFDoc_MaterialTool::GetDensityForShape ******/
		/****** md5 signature: be029a71a842c398ddef1cb8009dd7ea ******/
		%feature("compactdefaultargs") GetDensityForShape;
		%feature("autodoc", "
Parameters
----------
ShapeL: TDF_Label

Return
-------
double

Description
-----------
Find referred material and return density from it if no material --> return 0.
") GetDensityForShape;
		static double GetDensityForShape(const TDF_Label & ShapeL);

		/****** XCAFDoc_MaterialTool::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") GetID;
		static const Standard_GUID & GetID();

		/****** XCAFDoc_MaterialTool::GetMaterial ******/
		/****** md5 signature: 0c7c572f71fc68fbd5768ec71005b2da ******/
		%feature("compactdefaultargs") GetMaterial;
		%feature("autodoc", "
Parameters
----------
MatL: TDF_Label

Return
-------
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
aDensity: double
aDensName: TCollection_HAsciiString
aDensValType: TCollection_HAsciiString

Description
-----------
Returns Material assigned to <MatL> Returns False if no such Material is assigned.
") GetMaterial;
		static bool GetMaterial(const TDF_Label & MatL, opencascade::handle<TCollection_HAsciiString> &OutValue, opencascade::handle<TCollection_HAsciiString> &OutValue, Standard_Real &OutValue, opencascade::handle<TCollection_HAsciiString> &OutValue, opencascade::handle<TCollection_HAsciiString> &OutValue);

		/****** XCAFDoc_MaterialTool::GetMaterialLabels ******/
		/****** md5 signature: 825c84496d0bf50cbd94ed858c4fac88 ******/
		%feature("compactdefaultargs") GetMaterialLabels;
		%feature("autodoc", "
Parameters
----------
Labels: TDF_LabelSequence

Return
-------
None

Description
-----------
Returns a sequence of materials currently stored in the material table.
") GetMaterialLabels;
		void GetMaterialLabels(TDF_LabelSequence & Labels);

		/****** XCAFDoc_MaterialTool::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** XCAFDoc_MaterialTool::IsMaterial ******/
		/****** md5 signature: b74cbedd7e102b6b89f2df8ffcc6b296 ******/
		%feature("compactdefaultargs") IsMaterial;
		%feature("autodoc", "
Parameters
----------
lab: TDF_Label

Return
-------
bool

Description
-----------
Returns True if label belongs to a material table and is a Material definition.
") IsMaterial;
		bool IsMaterial(const TDF_Label & lab);

		/****** XCAFDoc_MaterialTool::Set ******/
		/****** md5 signature: 93eb8e9cd550f2295955998cae514434 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label

Return
-------
opencascade::handle<XCAFDoc_MaterialTool>

Description
-----------
Creates (if not exist) MaterialTool.
") Set;
		static opencascade::handle<XCAFDoc_MaterialTool> Set(const TDF_Label & L);

		/****** XCAFDoc_MaterialTool::SetMaterial ******/
		/****** md5 signature: 25933d10c1b326360e9cadcc044353a2 ******/
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label
MatL: TDF_Label

Return
-------
None

Description
-----------
Sets a link with GUID.
") SetMaterial;
		void SetMaterial(const TDF_Label & L, const TDF_Label & MatL);

		/****** XCAFDoc_MaterialTool::SetMaterial ******/
		/****** md5 signature: bb5b9c50267a428933c75995060df4f5 ******/
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
aDensity: double
aDensName: TCollection_HAsciiString
aDensValType: TCollection_HAsciiString

Return
-------
None

Description
-----------
Sets a link with GUID Adds a Material as necessary.
") SetMaterial;
		void SetMaterial(const TDF_Label & L, const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription, const double aDensity, const opencascade::handle<TCollection_HAsciiString> & aDensName, const opencascade::handle<TCollection_HAsciiString> & aDensValType);

		/****** XCAFDoc_MaterialTool::ShapeTool ******/
		/****** md5 signature: f3b52ea6763fc2a237d4ce7351722eb2 ******/
		%feature("compactdefaultargs") ShapeTool;
		%feature("autodoc", "Return
-------
opencascade::handle<XCAFDoc_ShapeTool>

Description
-----------
Returns internal XCAFDoc_ShapeTool tool.
") ShapeTool;
		const opencascade::handle<XCAFDoc_ShapeTool> & ShapeTool();

};


%make_alias(XCAFDoc_MaterialTool)

%extend XCAFDoc_MaterialTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class XCAFDoc_Note *
*********************/
%nodefaultctor XCAFDoc_Note;
class XCAFDoc_Note : public TDF_Attribute {
	public:
		/****** XCAFDoc_Note::Dump ******/
		/****** md5 signature: 93728f1e04c6a4610b0181e40f01badf ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
theOS: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		Standard_OStream & Dump(std::ostream &OutValue);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** XCAFDoc_Note::Get ******/
		/****** md5 signature: 1ceee7b570e5f239e158c7517ea24a7d ******/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label

Return
-------
opencascade::handle<XCAFDoc_Note>

Description
-----------
Finds a reference attribute on the given label and returns it, if it is found.
") Get;
		static opencascade::handle<XCAFDoc_Note> Get(const TDF_Label & theLabel);

		/****** XCAFDoc_Note::GetObject ******/
		/****** md5 signature: 71dbd3fdb8801c6f0c263f66457f91b5 ******/
		%feature("compactdefaultargs") GetObject;
		%feature("autodoc", "Return
-------
opencascade::handle<XCAFNoteObjects_NoteObject>

Description
-----------
Returns auxiliary data object.
") GetObject;
		opencascade::handle<XCAFNoteObjects_NoteObject> GetObject();

		/****** XCAFDoc_Note::IsMine ******/
		/****** md5 signature: 0e223b54aad8b07bec2be3642e8de077 ******/
		%feature("compactdefaultargs") IsMine;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label

Return
-------
bool

Description
-----------
Checks if the given label represents a note.
") IsMine;
		static bool IsMine(const TDF_Label & theLabel);

		/****** XCAFDoc_Note::IsOrphan ******/
		/****** md5 signature: 31bfe2ddd51c4cf8aa5b8b81ec3650c8 ******/
		%feature("compactdefaultargs") IsOrphan;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Checks if the note isn't linked to annotated items.
") IsOrphan;
		bool IsOrphan();

		/****** XCAFDoc_Note::Paste ******/
		/****** md5 signature: 613080067c5023e60243d9a07dced7b6 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
theAttrInto: TDF_Attribute
theRT: TDF_RelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & theAttrInto, const opencascade::handle<TDF_RelocationTable> & theRT);

		/****** XCAFDoc_Note::Restore ******/
		/****** md5 signature: 93ec1c35e22a62dd86fc70c54564a087 ******/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
theAttrFrom: TDF_Attribute

Return
-------
None

Description
-----------
No available documentation.
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & theAttrFrom);

		/****** XCAFDoc_Note::Set ******/
		/****** md5 signature: 7028b1b5759e056bb785b7cb64a8734a ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
theUserName: str
theTimeStamp: str

Return
-------
None

Description
-----------
Sets the user name and the timestamp of the note. \param[in] theUserName - the user associated with the note. \param[in] theTimeStamp - timestamp of the note. eturn A handle to the attribute instance.
") Set;
		void Set(TCollection_ExtendedString theUserName, TCollection_ExtendedString theTimeStamp);

		/****** XCAFDoc_Note::SetObject ******/
		/****** md5 signature: 71119db957b809a32068e9c60ccf3aaf ******/
		%feature("compactdefaultargs") SetObject;
		%feature("autodoc", "
Parameters
----------
theObject: XCAFNoteObjects_NoteObject

Return
-------
None

Description
-----------
Updates auxiliary data.
") SetObject;
		void SetObject(const opencascade::handle<XCAFNoteObjects_NoteObject> & theObject);

		/****** XCAFDoc_Note::TimeStamp ******/
		/****** md5 signature: da74f049fea064226fb35bba315df859 ******/
		%feature("compactdefaultargs") TimeStamp;
		%feature("autodoc", "Return
-------
TCollection_ExtendedString

Description
-----------
Returns the timestamp of the note.
") TimeStamp;
		const TCollection_ExtendedString & TimeStamp();

		/****** XCAFDoc_Note::UserName ******/
		/****** md5 signature: 9adfab6768c9cf07c019afd496692827 ******/
		%feature("compactdefaultargs") UserName;
		%feature("autodoc", "Return
-------
TCollection_ExtendedString

Description
-----------
Returns the user name, who created the note.
") UserName;
		const TCollection_ExtendedString & UserName();

};


%make_alias(XCAFDoc_Note)

%extend XCAFDoc_Note {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class XCAFDoc_NotesTool *
**************************/
class XCAFDoc_NotesTool : public TDataStd_GenericEmpty {
	public:
		/****** XCAFDoc_NotesTool::XCAFDoc_NotesTool ******/
		/****** md5 signature: c0e77601b7f2e50489392007c2098938 ******/
		%feature("compactdefaultargs") XCAFDoc_NotesTool;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty notes tool.
") XCAFDoc_NotesTool;
		 XCAFDoc_NotesTool();

		/****** XCAFDoc_NotesTool::AddNote ******/
		/****** md5 signature: c9f044efe559b77b586fd200c2229d61 ******/
		%feature("compactdefaultargs") AddNote;
		%feature("autodoc", "
Parameters
----------
theNoteLabel: TDF_Label
theItemId: XCAFDoc_AssemblyItemId

Return
-------
opencascade::handle<XCAFDoc_AssemblyItemRef>

Description
-----------
Adds the given note to the assembly item. \param[in] theNoteLabel - note label. \param[in] theItemId - assembly item ID. eturn a handle to the assembly reference attribute.
") AddNote;
		opencascade::handle<XCAFDoc_AssemblyItemRef> AddNote(const TDF_Label & theNoteLabel, const XCAFDoc_AssemblyItemId & theItemId);

		/****** XCAFDoc_NotesTool::AddNote ******/
		/****** md5 signature: 51ab4480df00fbda55f45031ccc45334 ******/
		%feature("compactdefaultargs") AddNote;
		%feature("autodoc", "
Parameters
----------
theNoteLabel: TDF_Label
theItemLabel: TDF_Label

Return
-------
opencascade::handle<XCAFDoc_AssemblyItemRef>

Description
-----------
Adds the given note to the labeled item. \param[in] theNoteLabel - note label. \param[in] theItemLabel - item label. eturn a handle to the assembly reference attribute.
") AddNote;
		opencascade::handle<XCAFDoc_AssemblyItemRef> AddNote(const TDF_Label & theNoteLabel, const TDF_Label & theItemLabel);

		/****** XCAFDoc_NotesTool::AddNoteToAttr ******/
		/****** md5 signature: 2994c4af4a88647f63b347e8d6a87709 ******/
		%feature("compactdefaultargs") AddNoteToAttr;
		%feature("autodoc", "
Parameters
----------
theNoteLabel: TDF_Label
theItemId: XCAFDoc_AssemblyItemId
theGUID: Standard_GUID

Return
-------
opencascade::handle<XCAFDoc_AssemblyItemRef>

Description
-----------
Adds the given note to the assembly item's attribute. \param[in] theNoteLabel - note label. \param[in] theItemId - assembly item ID. \param[in] theGUID - assembly item's attribute GUID. eturn a handle to the assembly reference attribute.
") AddNoteToAttr;
		opencascade::handle<XCAFDoc_AssemblyItemRef> AddNoteToAttr(const TDF_Label & theNoteLabel, const XCAFDoc_AssemblyItemId & theItemId, const Standard_GUID & theGUID);

		/****** XCAFDoc_NotesTool::AddNoteToAttr ******/
		/****** md5 signature: da5393bd90097082a350ebed45a901fe ******/
		%feature("compactdefaultargs") AddNoteToAttr;
		%feature("autodoc", "
Parameters
----------
theNoteLabel: TDF_Label
theItemLabel: TDF_Label
theGUID: Standard_GUID

Return
-------
opencascade::handle<XCAFDoc_AssemblyItemRef>

Description
-----------
Adds the given note to the labeled item's attribute. \param[in] theNoteLabel - note label. \param[in] theItemLabel - item label. \param[in] theGUID - assembly item's attribute GUID. eturn a handle to the assembly reference attribute.
") AddNoteToAttr;
		opencascade::handle<XCAFDoc_AssemblyItemRef> AddNoteToAttr(const TDF_Label & theNoteLabel, const TDF_Label & theItemLabel, const Standard_GUID & theGUID);

		/****** XCAFDoc_NotesTool::AddNoteToSubshape ******/
		/****** md5 signature: 57029eb1d02d9a79145cd6abe8ea765f ******/
		%feature("compactdefaultargs") AddNoteToSubshape;
		%feature("autodoc", "
Parameters
----------
theNoteLabel: TDF_Label
theItemId: XCAFDoc_AssemblyItemId
theSubshapeIndex: int

Return
-------
opencascade::handle<XCAFDoc_AssemblyItemRef>

Description
-----------
Adds the given note to the assembly item's subshape. \param[in] theNoteLabel - note label. \param[in] theItemId - assembly item ID. \param[in] theSubshapeIndex - assembly item's subshape index. eturn a handle to the assembly reference attribute.
") AddNoteToSubshape;
		opencascade::handle<XCAFDoc_AssemblyItemRef> AddNoteToSubshape(const TDF_Label & theNoteLabel, const XCAFDoc_AssemblyItemId & theItemId, int theSubshapeIndex);

		/****** XCAFDoc_NotesTool::AddNoteToSubshape ******/
		/****** md5 signature: 1245e5f215e129968d08742091b1609d ******/
		%feature("compactdefaultargs") AddNoteToSubshape;
		%feature("autodoc", "
Parameters
----------
theNoteLabel: TDF_Label
theItemLabel: TDF_Label
theSubshapeIndex: int

Return
-------
opencascade::handle<XCAFDoc_AssemblyItemRef>

Description
-----------
Adds the given note to the labeled item's subshape. \param[in] theNoteLabel - note label. \param[in] theItemLabel - item label. \param[in] theSubshapeIndex - assembly item's subshape index. eturn a handle to the assembly reference attribute.
") AddNoteToSubshape;
		opencascade::handle<XCAFDoc_AssemblyItemRef> AddNoteToSubshape(const TDF_Label & theNoteLabel, const TDF_Label & theItemLabel, int theSubshapeIndex);

		/****** XCAFDoc_NotesTool::CreateBalloon ******/
		/****** md5 signature: 4107d08404aed1c9342055777bdbc42b ******/
		%feature("compactdefaultargs") CreateBalloon;
		%feature("autodoc", "
Parameters
----------
theUserName: str
theTimeStamp: str
theComment: str

Return
-------
opencascade::handle<XCAFDoc_Note>

Description
-----------
Create a new 'balloon' note. Creates a new label under the notes hive and attaches ef XCAFDoc_NoteBalloon attribute (derived ftom ef XCAFDoc_Note). \param[in] theUserName - the user associated with the note. \param[in] theTimeStamp - timestamp of the note. \param[in] theComment - textual comment. eturn a handle to the base note attribute.
") CreateBalloon;
		opencascade::handle<XCAFDoc_Note> CreateBalloon(TCollection_ExtendedString theUserName, TCollection_ExtendedString theTimeStamp, TCollection_ExtendedString theComment);

		/****** XCAFDoc_NotesTool::CreateBinData ******/
		/****** md5 signature: 8fffa593325c02823c46011e17c3c3e5 ******/
		%feature("compactdefaultargs") CreateBinData;
		%feature("autodoc", "
Parameters
----------
theUserName: str
theTimeStamp: str
theTitle: str
theMIMEtype: str
theFile: OSD_File

Return
-------
opencascade::handle<XCAFDoc_Note>

Description
-----------
Create a new note with data loaded from a binary file. Creates a new label under the notes hive and attaches ef XCAFDoc_NoteComment attribute (derived ftom ef XCAFDoc_Note). \param[in] theUserName - the user associated with the note. \param[in] theTimeStamp - timestamp of the note. \param[in] theTitle - file title. \param[in] theMIMEtype - MIME type of the file. \param[in] theFile - input binary file. eturn a handle to the base note attribute.
") CreateBinData;
		opencascade::handle<XCAFDoc_Note> CreateBinData(TCollection_ExtendedString theUserName, TCollection_ExtendedString theTimeStamp, TCollection_ExtendedString theTitle, TCollection_AsciiString theMIMEtype, OSD_File & theFile);

		/****** XCAFDoc_NotesTool::CreateBinData ******/
		/****** md5 signature: 39ffc27a9d9a8c5cfd35ad6854d69d54 ******/
		%feature("compactdefaultargs") CreateBinData;
		%feature("autodoc", "
Parameters
----------
theUserName: str
theTimeStamp: str
theTitle: str
theMIMEtype: str
theData: TColStd_HArray1OfByte

Return
-------
opencascade::handle<XCAFDoc_Note>

Description
-----------
Create a new note with data loaded from a byte data array. Creates a new label under the notes hive and attaches ef XCAFDoc_NoteComment attribute (derived ftom ef XCAFDoc_Note). \param[in] theUserName - the user associated with the note. \param[in] theTimeStamp - timestamp of the note. \param[in] theTitle - data title. \param[in] theMIMEtype - MIME type of the file. \param[in] theData - byte data array. eturn a handle to the base note attribute.
") CreateBinData;
		opencascade::handle<XCAFDoc_Note> CreateBinData(TCollection_ExtendedString theUserName, TCollection_ExtendedString theTimeStamp, TCollection_ExtendedString theTitle, TCollection_AsciiString theMIMEtype, const opencascade::handle<TColStd_HArray1OfByte> & theData);

		/****** XCAFDoc_NotesTool::CreateComment ******/
		/****** md5 signature: 41b663076b0b608af4ceedbf243160b2 ******/
		%feature("compactdefaultargs") CreateComment;
		%feature("autodoc", "
Parameters
----------
theUserName: str
theTimeStamp: str
theComment: str

Return
-------
opencascade::handle<XCAFDoc_Note>

Description
-----------
Create a new comment note. Creates a new label under the notes hive and attaches ef XCAFDoc_NoteComment attribute (derived ftom ef XCAFDoc_Note). \param[in] theUserName - the user associated with the note. \param[in] theTimeStamp - timestamp of the note. \param[in] theComment - textual comment. eturn a handle to the base note attribute.
") CreateComment;
		opencascade::handle<XCAFDoc_Note> CreateComment(TCollection_ExtendedString theUserName, TCollection_ExtendedString theTimeStamp, TCollection_ExtendedString theComment);

		/****** XCAFDoc_NotesTool::DeleteAllNotes ******/
		/****** md5 signature: d4b8612e7b8c1a1544ce6602a39d3ad3 ******/
		%feature("compactdefaultargs") DeleteAllNotes;
		%feature("autodoc", "Return
-------
int

Description
-----------
Deletes all notes. Clears all annotations. eturn number of deleted notes.
") DeleteAllNotes;
		int DeleteAllNotes();

		/****** XCAFDoc_NotesTool::DeleteNote ******/
		/****** md5 signature: c59853d1950291853d9d01138188168f ******/
		%feature("compactdefaultargs") DeleteNote;
		%feature("autodoc", "
Parameters
----------
theNoteLabel: TDF_Label

Return
-------
bool

Description
-----------
Deletes the given note. Removes all links with items annotated by the note. \param[in] theNoteLabel - note label. eturn true if the note is deleted, otherwise - false.
") DeleteNote;
		bool DeleteNote(const TDF_Label & theNoteLabel);

		/****** XCAFDoc_NotesTool::DeleteNotes ******/
		/****** md5 signature: 5556ad833c2cca185500dde730e9a3c5 ******/
		%feature("compactdefaultargs") DeleteNotes;
		%feature("autodoc", "
Parameters
----------
theNoteLabels: TDF_LabelSequence

Return
-------
int

Description
-----------
Deletes the given notes. Removes all links with items annotated by the notes. \param[in] theNoteLabels - note label sequence. eturn number of deleted notes.
") DeleteNotes;
		int DeleteNotes(TDF_LabelSequence & theNoteLabels);

		/****** XCAFDoc_NotesTool::DeleteOrphanNotes ******/
		/****** md5 signature: bbbef2304a5603a8f89a4507fd669c64 ******/
		%feature("compactdefaultargs") DeleteOrphanNotes;
		%feature("autodoc", "Return
-------
int

Description
-----------
Deletes all notes that aren't linked to annotated items. eturn number of deleted notes.
") DeleteOrphanNotes;
		int DeleteOrphanNotes();

		/****** XCAFDoc_NotesTool::Dump ******/
		/****** md5 signature: 93728f1e04c6a4610b0181e40f01badf ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
theOS: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		Standard_OStream & Dump(std::ostream &OutValue);

		/****** XCAFDoc_NotesTool::FindAnnotatedItem ******/
		/****** md5 signature: 7e562ae1ec4bb3d6b2a750f4a95ec514 ******/
		%feature("compactdefaultargs") FindAnnotatedItem;
		%feature("autodoc", "
Parameters
----------
theItemId: XCAFDoc_AssemblyItemId

Return
-------
TDF_Label

Description
-----------
Finds a label of the given assembly item ID in the annotated items hive. \param[in] theItemId - assembly item ID. eturn annotated item label if it is found, otherwise - null label.
") FindAnnotatedItem;
		TDF_Label FindAnnotatedItem(const XCAFDoc_AssemblyItemId & theItemId);

		/****** XCAFDoc_NotesTool::FindAnnotatedItem ******/
		/****** md5 signature: b57f724d81528931d6f6f4e8c20759bd ******/
		%feature("compactdefaultargs") FindAnnotatedItem;
		%feature("autodoc", "
Parameters
----------
theItemLabel: TDF_Label

Return
-------
TDF_Label

Description
-----------
Finds a label of the given labeled item in the annotated items hive. \param[in] theItemLabel - item label. eturn annotated item label if it is found, otherwise - null label.
") FindAnnotatedItem;
		TDF_Label FindAnnotatedItem(const TDF_Label & theItemLabel);

		/****** XCAFDoc_NotesTool::FindAnnotatedItemAttr ******/
		/****** md5 signature: 408bda6b14038825cc94a8eb0bccca37 ******/
		%feature("compactdefaultargs") FindAnnotatedItemAttr;
		%feature("autodoc", "
Parameters
----------
theItemId: XCAFDoc_AssemblyItemId
theGUID: Standard_GUID

Return
-------
TDF_Label

Description
-----------
Finds a label of the given assembly item's attribute in the annotated items hive. \param[in] theItemId - assembly item ID. \param[in] theGUID - assembly item's attribute GUID. eturn annotated item label if it is found, otherwise - null label.
") FindAnnotatedItemAttr;
		TDF_Label FindAnnotatedItemAttr(const XCAFDoc_AssemblyItemId & theItemId, const Standard_GUID & theGUID);

		/****** XCAFDoc_NotesTool::FindAnnotatedItemAttr ******/
		/****** md5 signature: 2144cf2f088a63cb26df5ba367daca0f ******/
		%feature("compactdefaultargs") FindAnnotatedItemAttr;
		%feature("autodoc", "
Parameters
----------
theItemLabel: TDF_Label
theGUID: Standard_GUID

Return
-------
TDF_Label

Description
-----------
Finds a label of the given labeled item's attribute in the annotated items hive. \param[in] theItemLabel - item label. \param[in] theGUID - item's attribute GUID. eturn annotated item label if it is found, otherwise - null label.
") FindAnnotatedItemAttr;
		TDF_Label FindAnnotatedItemAttr(const TDF_Label & theItemLabel, const Standard_GUID & theGUID);

		/****** XCAFDoc_NotesTool::FindAnnotatedItemSubshape ******/
		/****** md5 signature: 680913b6e7fe930ab7f0785c434e6c05 ******/
		%feature("compactdefaultargs") FindAnnotatedItemSubshape;
		%feature("autodoc", "
Parameters
----------
theItemId: XCAFDoc_AssemblyItemId
theSubshapeIndex: int

Return
-------
TDF_Label

Description
-----------
Finds a label of the given assembly item's subshape in the annotated items hive. \param[in] theItemId - assembly item ID. \param[in] theSubshapeIndex - assembly item's subshape index. eturn annotated item label if it is found, otherwise - null label.
") FindAnnotatedItemSubshape;
		TDF_Label FindAnnotatedItemSubshape(const XCAFDoc_AssemblyItemId & theItemId, int theSubshapeIndex);

		/****** XCAFDoc_NotesTool::FindAnnotatedItemSubshape ******/
		/****** md5 signature: 56fba01d0fd9b78a3af2c876c6235962 ******/
		%feature("compactdefaultargs") FindAnnotatedItemSubshape;
		%feature("autodoc", "
Parameters
----------
theItemLabel: TDF_Label
theSubshapeIndex: int

Return
-------
TDF_Label

Description
-----------
Finds a label of the given labeled item's subshape in the annotated items hive. \param[in] theItemLabel - item label. \param[in] theSubshapeIndex - labeled item's subshape index. eturn annotated item label if it is found, otherwise - null label.
") FindAnnotatedItemSubshape;
		TDF_Label FindAnnotatedItemSubshape(const TDF_Label & theItemLabel, int theSubshapeIndex);

		/****** XCAFDoc_NotesTool::GetAnnotatedItems ******/
		/****** md5 signature: 3fc00548db6619d464caccf893f5e123 ******/
		%feature("compactdefaultargs") GetAnnotatedItems;
		%feature("autodoc", "
Parameters
----------
theLabels: TDF_LabelSequence

Return
-------
None

Description
-----------
Returns all labels from the annotated items hive. The label sequence isn't cleared beforehand. \param[out] theNoteLabels - sequence of labels.
") GetAnnotatedItems;
		void GetAnnotatedItems(TDF_LabelSequence & theLabels);

		/****** XCAFDoc_NotesTool::GetAnnotatedItemsLabel ******/
		/****** md5 signature: ed92168a16310f5f00b16c87f1b19956 ******/
		%feature("compactdefaultargs") GetAnnotatedItemsLabel;
		%feature("autodoc", "Return
-------
TDF_Label

Description
-----------
Returns the label of the annotated items hive.
") GetAnnotatedItemsLabel;
		TDF_Label GetAnnotatedItemsLabel();

		/****** XCAFDoc_NotesTool::GetAttrNotes ******/
		/****** md5 signature: d0cee9ebb48f16ea4c89df30a2843f05 ******/
		%feature("compactdefaultargs") GetAttrNotes;
		%feature("autodoc", "
Parameters
----------
theItemId: XCAFDoc_AssemblyItemId
theGUID: Standard_GUID
theNoteLabels: TDF_LabelSequence

Return
-------
int

Description
-----------
Gets all note labels of the assembly item's attribute. Notes linked to the item itself or to item's subshapes aren't taken into account. The label sequence isn't cleared beforehand. \param[in] theItemId - assembly item ID. \param[in] theGUID - assembly item's attribute GUID. \param[out] theNoteLabels - sequence of labels. eturn number of added labels.
") GetAttrNotes;
		int GetAttrNotes(const XCAFDoc_AssemblyItemId & theItemId, const Standard_GUID & theGUID, TDF_LabelSequence & theNoteLabels);

		/****** XCAFDoc_NotesTool::GetAttrNotes ******/
		/****** md5 signature: 504aea38ad8c32e5a333734a8f0ac0b7 ******/
		%feature("compactdefaultargs") GetAttrNotes;
		%feature("autodoc", "
Parameters
----------
theItemLabel: TDF_Label
theGUID: Standard_GUID
theNoteLabels: TDF_LabelSequence

Return
-------
int

Description
-----------
Gets all note labels of the labeled item's attribute. Notes linked to the item itself or to item's subshapes aren't taken into account. The label sequence isn't cleared beforehand. \param[in] theItemLabel - item label. \param[in] theGUID - item's attribute GUID. \param[out] theNoteLabels - sequence of labels. eturn number of added labels.
") GetAttrNotes;
		int GetAttrNotes(const TDF_Label & theItemLabel, const Standard_GUID & theGUID, TDF_LabelSequence & theNoteLabels);

		/****** XCAFDoc_NotesTool::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Returns default attribute GUID.
") GetID;
		static const Standard_GUID & GetID();

		/****** XCAFDoc_NotesTool::GetNotes ******/
		/****** md5 signature: ec87faea7edf129072d0ade826fa477d ******/
		%feature("compactdefaultargs") GetNotes;
		%feature("autodoc", "
Parameters
----------
theNoteLabels: TDF_LabelSequence

Return
-------
None

Description
-----------
Returns all labels from the notes hive. The label sequence isn't cleared beforehand. \param[out] theNoteLabels - sequence of labels.
") GetNotes;
		void GetNotes(TDF_LabelSequence & theNoteLabels);

		/****** XCAFDoc_NotesTool::GetNotes ******/
		/****** md5 signature: 24278e4af73055d7c5d2e1a0994a9f08 ******/
		%feature("compactdefaultargs") GetNotes;
		%feature("autodoc", "
Parameters
----------
theItemId: XCAFDoc_AssemblyItemId
theNoteLabels: TDF_LabelSequence

Return
-------
int

Description
-----------
Gets all note labels of the assembly item. Notes linked to item's subshapes or attributes aren't taken into account. The label sequence isn't cleared beforehand. \param[in] theItemId - assembly item ID. \param[out] theNoteLabels - sequence of labels. eturn number of added labels.
") GetNotes;
		int GetNotes(const XCAFDoc_AssemblyItemId & theItemId, TDF_LabelSequence & theNoteLabels);

		/****** XCAFDoc_NotesTool::GetNotes ******/
		/****** md5 signature: 6b8e649085d636c4f4c6b5de3dafab81 ******/
		%feature("compactdefaultargs") GetNotes;
		%feature("autodoc", "
Parameters
----------
theItemLabel: TDF_Label
theNoteLabels: TDF_LabelSequence

Return
-------
int

Description
-----------
Gets all note labels of the labeled item. Notes linked to item's attributes aren't taken into account. The label sequence isn't cleared beforehand. \param[in] theItemLabel - item label. \param[out] theNoteLabels - sequence of labels. eturn number of added labels.
") GetNotes;
		int GetNotes(const TDF_Label & theItemLabel, TDF_LabelSequence & theNoteLabels);

		/****** XCAFDoc_NotesTool::GetNotesLabel ******/
		/****** md5 signature: 4fe051c0e9aeba91b144247aba0adb33 ******/
		%feature("compactdefaultargs") GetNotesLabel;
		%feature("autodoc", "Return
-------
TDF_Label

Description
-----------
Returns the label of the notes hive.
") GetNotesLabel;
		TDF_Label GetNotesLabel();

		/****** XCAFDoc_NotesTool::GetOrphanNotes ******/
		/****** md5 signature: c1dd2886a4aa34f095959d2a76b2286d ******/
		%feature("compactdefaultargs") GetOrphanNotes;
		%feature("autodoc", "
Parameters
----------
theNoteLabels: TDF_LabelSequence

Return
-------
None

Description
-----------
Returns note labels that aren't linked to annotated items. The label sequence isn't cleared beforehand. \param[out] theNoteLabels - sequence of labels.
") GetOrphanNotes;
		void GetOrphanNotes(TDF_LabelSequence & theNoteLabels);

		/****** XCAFDoc_NotesTool::GetSubshapeNotes ******/
		/****** md5 signature: f9b6245e522ecba409cf2e0f7f2c1220 ******/
		%feature("compactdefaultargs") GetSubshapeNotes;
		%feature("autodoc", "
Parameters
----------
theItemId: XCAFDoc_AssemblyItemId
theSubshapeIndex: int
theNoteLabels: TDF_LabelSequence

Return
-------
int

Description
-----------
Gets all note labels of the annotated item. Notes linked to the item itself or to item's attributes taken into account. The label sequence isn't cleared beforehand. \param[in] theItemId - assembly item ID. \param[in] theSubshapeIndex - assembly item's subshape index. \param[out] theNoteLabels - sequence of labels. eturn number of added labels.
") GetSubshapeNotes;
		int GetSubshapeNotes(const XCAFDoc_AssemblyItemId & theItemId, int theSubshapeIndex, TDF_LabelSequence & theNoteLabels);

		/****** XCAFDoc_NotesTool::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** XCAFDoc_NotesTool::IsAnnotatedItem ******/
		/****** md5 signature: 27466bfb71a09de28715dd0b600c5de3 ******/
		%feature("compactdefaultargs") IsAnnotatedItem;
		%feature("autodoc", "
Parameters
----------
theItemId: XCAFDoc_AssemblyItemId

Return
-------
bool

Description
-----------
Checks if the given assembly item is annotated. \param[in] theItemId - assembly item ID. eturn true if the item is annotated, otherwise - false.
") IsAnnotatedItem;
		bool IsAnnotatedItem(const XCAFDoc_AssemblyItemId & theItemId);

		/****** XCAFDoc_NotesTool::IsAnnotatedItem ******/
		/****** md5 signature: 6458ae74deaa6278b54cc07b6baf9a7a ******/
		%feature("compactdefaultargs") IsAnnotatedItem;
		%feature("autodoc", "
Parameters
----------
theItemLabel: TDF_Label

Return
-------
bool

Description
-----------
Checks if the given labeled item is annotated. \param[in] theItemLabel - item label. eturn true if the item is annotated, otherwise - false.
") IsAnnotatedItem;
		bool IsAnnotatedItem(const TDF_Label & theItemLabel);

		/****** XCAFDoc_NotesTool::NbAnnotatedItems ******/
		/****** md5 signature: 7c5ca49425e35201055a00a7de753d40 ******/
		%feature("compactdefaultargs") NbAnnotatedItems;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of labels in the annotated items hive.
") NbAnnotatedItems;
		int NbAnnotatedItems();

		/****** XCAFDoc_NotesTool::NbNotes ******/
		/****** md5 signature: 3e0be8f1d0ff45f6ea89fb9e414716d5 ******/
		%feature("compactdefaultargs") NbNotes;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of labels in the notes hive.
") NbNotes;
		int NbNotes();

		/****** XCAFDoc_NotesTool::NbOrphanNotes ******/
		/****** md5 signature: 66cbff9aa657558fee9ff5f17c287c2e ******/
		%feature("compactdefaultargs") NbOrphanNotes;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of notes that aren't linked to annotated items.
") NbOrphanNotes;
		int NbOrphanNotes();

		/****** XCAFDoc_NotesTool::RemoveAllAttrNotes ******/
		/****** md5 signature: d168a95875b36ef2d958fd5d31f372f8 ******/
		%feature("compactdefaultargs") RemoveAllAttrNotes;
		%feature("autodoc", "
Parameters
----------
theItemId: XCAFDoc_AssemblyItemId
theGUID: Standard_GUID
theDelIfOrphan: bool (optional, default to false)

Return
-------
bool

Description
-----------
Removes all notes from the assembly item's attribute. \param[in] theItemId - assembly item ID. \param[in] theGUID - assembly item's attribute GUID. \param[in] theDelIfOrphan - deletes removed notes from the notes  hive if there are no more annotated items  linked with the notes. eturn true if the notes are removed, otherwise - false.
") RemoveAllAttrNotes;
		bool RemoveAllAttrNotes(const XCAFDoc_AssemblyItemId & theItemId, const Standard_GUID & theGUID, bool theDelIfOrphan = false);

		/****** XCAFDoc_NotesTool::RemoveAllAttrNotes ******/
		/****** md5 signature: b0ab202d3ed29dd841ced61314eaf968 ******/
		%feature("compactdefaultargs") RemoveAllAttrNotes;
		%feature("autodoc", "
Parameters
----------
theItemLabel: TDF_Label
theGUID: Standard_GUID
theDelIfOrphan: bool (optional, default to false)

Return
-------
bool

Description
-----------
Removes all notes from the labeled item's attribute. \param[in] theItemLabel - item label. \param[in] theGUID - labeled item's attribute GUID. \param[in] theDelIfOrphan - deletes removed notes from the notes  hive if there are no more annotated items  linked with the notes. eturn true if the notes are removed, otherwise - false.
") RemoveAllAttrNotes;
		bool RemoveAllAttrNotes(const TDF_Label & theItemLabel, const Standard_GUID & theGUID, bool theDelIfOrphan = false);

		/****** XCAFDoc_NotesTool::RemoveAllNotes ******/
		/****** md5 signature: d543002c347841075e42075a2f3df6f4 ******/
		%feature("compactdefaultargs") RemoveAllNotes;
		%feature("autodoc", "
Parameters
----------
theItemId: XCAFDoc_AssemblyItemId
theDelIfOrphan: bool (optional, default to false)

Return
-------
bool

Description
-----------
Removes all notes from the assembly item. \param[in] theItemId - assembly item ID. \param[in] theDelIfOrphan - deletes removed notes from the notes  hive if there are no more annotated items  linked with the notes. eturn true if the notes are removed, otherwise - false.
") RemoveAllNotes;
		bool RemoveAllNotes(const XCAFDoc_AssemblyItemId & theItemId, bool theDelIfOrphan = false);

		/****** XCAFDoc_NotesTool::RemoveAllNotes ******/
		/****** md5 signature: 74d596032f47159ef56b1fe19cd3042f ******/
		%feature("compactdefaultargs") RemoveAllNotes;
		%feature("autodoc", "
Parameters
----------
theItemLabel: TDF_Label
theDelIfOrphan: bool (optional, default to false)

Return
-------
bool

Description
-----------
Removes all notes from the labeled item. \param[in] theItemLabel - item label. \param[in] theDelIfOrphan - deletes removed notes from the notes  hive if there are no more annotated items  linked with the notes. eturn true if the notes are removed, otherwise - false.
") RemoveAllNotes;
		bool RemoveAllNotes(const TDF_Label & theItemLabel, bool theDelIfOrphan = false);

		/****** XCAFDoc_NotesTool::RemoveAllSubshapeNotes ******/
		/****** md5 signature: 6e4f6d717c85ca33aea1189633b928cc ******/
		%feature("compactdefaultargs") RemoveAllSubshapeNotes;
		%feature("autodoc", "
Parameters
----------
theItemId: XCAFDoc_AssemblyItemId
theSubshapeIndex: int
theDelIfOrphan: bool (optional, default to false)

Return
-------
bool

Description
-----------
Removes all notes from the assembly item's subshape. \param[in] theItemId - assembly item ID. \param[in] theSubshapeIndex - assembly item's subshape index. \param[in] theDelIfOrphan - deletes removed notes from the notes  hive if there are no more annotated items  linked with the notes. eturn true if the notes are removed, otherwise - false.
") RemoveAllSubshapeNotes;
		bool RemoveAllSubshapeNotes(const XCAFDoc_AssemblyItemId & theItemId, int theSubshapeIndex, bool theDelIfOrphan = false);

		/****** XCAFDoc_NotesTool::RemoveAttrNote ******/
		/****** md5 signature: d5a420aa79830cecd0a8ca9592f13433 ******/
		%feature("compactdefaultargs") RemoveAttrNote;
		%feature("autodoc", "
Parameters
----------
theNoteLabel: TDF_Label
theItemId: XCAFDoc_AssemblyItemId
theGUID: Standard_GUID
theDelIfOrphan: bool (optional, default to false)

Return
-------
bool

Description
-----------
Removes a note from the assembly item's attribute. \param[in] theNoteLabel - note label. \param[in] theItemId - assembly item ID. \param[in] theGUID - assembly item's attribute GUID. \param[in] theDelIfOrphan - deletes the note from the notes hive  if there are no more assembly item's  attribute linked with the note. eturn true if the note is removed, otherwise - false.
") RemoveAttrNote;
		bool RemoveAttrNote(const TDF_Label & theNoteLabel, const XCAFDoc_AssemblyItemId & theItemId, const Standard_GUID & theGUID, bool theDelIfOrphan = false);

		/****** XCAFDoc_NotesTool::RemoveAttrNote ******/
		/****** md5 signature: 0547deefde501c2fe57dc4c605800e40 ******/
		%feature("compactdefaultargs") RemoveAttrNote;
		%feature("autodoc", "
Parameters
----------
theNoteLabel: TDF_Label
theItemLabel: TDF_Label
theGUID: Standard_GUID
theDelIfOrphan: bool (optional, default to false)

Return
-------
bool

Description
-----------
Removes a note from the labeled item's attribute. \param[in] theNoteLabel - note label. \param[in] theItemLabel - item label. \param[in] theGUID - labeled item's attribute GUID. \param[in] theDelIfOrphan - deletes the note from the notes hive  if there are no more assembly item's  attribute linked with the note. eturn true if the note is removed, otherwise - false.
") RemoveAttrNote;
		bool RemoveAttrNote(const TDF_Label & theNoteLabel, const TDF_Label & theItemLabel, const Standard_GUID & theGUID, bool theDelIfOrphan = false);

		/****** XCAFDoc_NotesTool::RemoveNote ******/
		/****** md5 signature: d714f88fbdbc40c226b85e6f1dea9403 ******/
		%feature("compactdefaultargs") RemoveNote;
		%feature("autodoc", "
Parameters
----------
theNoteLabel: TDF_Label
theItemId: XCAFDoc_AssemblyItemId
theDelIfOrphan: bool (optional, default to false)

Return
-------
bool

Description
-----------
Removes the given note from the assembly item. \param[in] theNoteLabel - note label. \param[in] theItemId - assembly item ID. \param[in] theDelIfOrphan - deletes the note from the notes hive  if there are no more assembly items  linked with the note. eturn true if the note is removed, otherwise - false.
") RemoveNote;
		bool RemoveNote(const TDF_Label & theNoteLabel, const XCAFDoc_AssemblyItemId & theItemId, bool theDelIfOrphan = false);

		/****** XCAFDoc_NotesTool::RemoveNote ******/
		/****** md5 signature: c8ea5b4c4518c883bedd56147c6ae6a9 ******/
		%feature("compactdefaultargs") RemoveNote;
		%feature("autodoc", "
Parameters
----------
theNoteLabel: TDF_Label
theItemLabel: TDF_Label
theDelIfOrphan: bool (optional, default to false)

Return
-------
bool

Description
-----------
Removes the given note from the labeled item. \param[in] theNoteLabel - note label. \param[in] theItemLabel - item label. \param[in] theDelIfOrphan - deletes the note from the notes hive  if there are no more labeled items  linked with the note. eturn true if the note is removed, otherwise - false.
") RemoveNote;
		bool RemoveNote(const TDF_Label & theNoteLabel, const TDF_Label & theItemLabel, bool theDelIfOrphan = false);

		/****** XCAFDoc_NotesTool::RemoveSubshapeNote ******/
		/****** md5 signature: 29ce63357e0588fc285a19b63af5ddc0 ******/
		%feature("compactdefaultargs") RemoveSubshapeNote;
		%feature("autodoc", "
Parameters
----------
theNoteLabel: TDF_Label
theItemId: XCAFDoc_AssemblyItemId
theSubshapeIndex: int
theDelIfOrphan: bool (optional, default to false)

Return
-------
bool

Description
-----------
Removes the given note from the assembly item's subshape. \param[in] theNoteLabel - note label. \param[in] theItemId - assembly item ID. \param[in] theSubshapeIndex - assembly item's subshape index. \param[in] theDelIfOrphan - deletes the note from the notes hive  if there are no more assembly item's  subshape linked with the note. eturn true if the note is removed, otherwise - false.
") RemoveSubshapeNote;
		bool RemoveSubshapeNote(const TDF_Label & theNoteLabel, const XCAFDoc_AssemblyItemId & theItemId, int theSubshapeIndex, bool theDelIfOrphan = false);

		/****** XCAFDoc_NotesTool::RemoveSubshapeNote ******/
		/****** md5 signature: d424fa48b7438ec26519ee2ff13b654f ******/
		%feature("compactdefaultargs") RemoveSubshapeNote;
		%feature("autodoc", "
Parameters
----------
theNoteLabel: TDF_Label
theItemLabel: TDF_Label
theSubshapeIndex: int
theDelIfOrphan: bool (optional, default to false)

Return
-------
bool

Description
-----------
Removes the given note from the labeled item's subshape. \param[in] theNoteLabel - note label. \param[in] theItemLabel - item label. \param[in] theSubshapeIndex - labeled item's subshape index. \param[in] theDelIfOrphan - deletes the note from the notes hive  if there are no more assembly item's  subshape linked with the note. eturn true if the note is removed, otherwise - false.
") RemoveSubshapeNote;
		bool RemoveSubshapeNote(const TDF_Label & theNoteLabel, const TDF_Label & theItemLabel, int theSubshapeIndex, bool theDelIfOrphan = false);

		/****** XCAFDoc_NotesTool::Set ******/
		/****** md5 signature: 2ff88c3f33292cb4a299d4e1fc57ff9a ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label

Return
-------
opencascade::handle<XCAFDoc_NotesTool>

Description
-----------
Create (if not exist) a notes tool from XCAFDoc on theLabel.
") Set;
		static opencascade::handle<XCAFDoc_NotesTool> Set(const TDF_Label & theLabel);

};


%make_alias(XCAFDoc_NotesTool)

%extend XCAFDoc_NotesTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class XCAFDoc_ShapeMapTool *
*****************************/
class XCAFDoc_ShapeMapTool : public TDF_Attribute {
	public:
		/****** XCAFDoc_ShapeMapTool::XCAFDoc_ShapeMapTool ******/
		/****** md5 signature: 718d3a0988987c0f4a6143f5dbd61cb1 ******/
		%feature("compactdefaultargs") XCAFDoc_ShapeMapTool;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty tool.
") XCAFDoc_ShapeMapTool;
		 XCAFDoc_ShapeMapTool();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** XCAFDoc_ShapeMapTool::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") GetID;
		static const Standard_GUID & GetID();

		/****** XCAFDoc_ShapeMapTool::GetMap ******/
		/****** md5 signature: 70fc35ebfad459e21d549e8b4a954f53 ******/
		%feature("compactdefaultargs") GetMap;
		%feature("autodoc", "Return
-------
TopTools_IndexedMapOfShape

Description
-----------
No available documentation.
") GetMap;
		const TopTools_IndexedMapOfShape & GetMap();

		/****** XCAFDoc_ShapeMapTool::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** XCAFDoc_ShapeMapTool::IsSubShape ******/
		/****** md5 signature: fde8a23134f20acd64cbbf93b60b9674 ******/
		%feature("compactdefaultargs") IsSubShape;
		%feature("autodoc", "
Parameters
----------
sub: TopoDS_Shape

Return
-------
bool

Description
-----------
Checks whether shape <sub> is subshape of shape stored on label shapeL.
") IsSubShape;
		bool IsSubShape(const TopoDS_Shape & sub);

		/****** XCAFDoc_ShapeMapTool::NewEmpty ******/
		/****** md5 signature: 4ebad80fa2cacb9f9e231bbb83a29a98 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** XCAFDoc_ShapeMapTool::Paste ******/
		/****** md5 signature: bfece7a0e37cb5034ac0b2a8c488da37 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
into: TDF_Attribute
RT: TDF_RelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****** XCAFDoc_ShapeMapTool::Restore ******/
		/****** md5 signature: 8bde8d15cc1907242b8c43fe6eb18f19 ******/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
with: TDF_Attribute

Return
-------
None

Description
-----------
No available documentation.
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & with);

		/****** XCAFDoc_ShapeMapTool::Set ******/
		/****** md5 signature: 560ff08959f299869cc3123eea33884b ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label

Return
-------
opencascade::handle<XCAFDoc_ShapeMapTool>

Description
-----------
Create (if not exist) ShapeTool from XCAFDoc on <L>.
") Set;
		static opencascade::handle<XCAFDoc_ShapeMapTool> Set(const TDF_Label & L);

		/****** XCAFDoc_ShapeMapTool::SetShape ******/
		/****** md5 signature: 61fbf3edc3841b29e8ccf415d8706a1b ******/
		%feature("compactdefaultargs") SetShape;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
Sets representation (TopoDS_Shape) for top-level shape.
") SetShape;
		void SetShape(const TopoDS_Shape & S);

};


%make_alias(XCAFDoc_ShapeMapTool)

%extend XCAFDoc_ShapeMapTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class XCAFDoc_ShapeTool *
**************************/
class XCAFDoc_ShapeTool : public TDataStd_GenericEmpty {
	public:
		/****** XCAFDoc_ShapeTool::XCAFDoc_ShapeTool ******/
		/****** md5 signature: 5b97c0c77598e644de30c3b8c03cca11 ******/
		%feature("compactdefaultargs") XCAFDoc_ShapeTool;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty tool Creates a tool to work with a document <Doc> Attaches to label XCAFDoc::LabelShapes().
") XCAFDoc_ShapeTool;
		 XCAFDoc_ShapeTool();

		/****** XCAFDoc_ShapeTool::AddComponent ******/
		/****** md5 signature: b70e09b3452825fc10a94bf2cbba9eb7 ******/
		%feature("compactdefaultargs") AddComponent;
		%feature("autodoc", "
Parameters
----------
assembly: TDF_Label
comp: TDF_Label
Loc: TopLoc_Location

Return
-------
TDF_Label

Description
-----------
Adds a component given by its label and location to the assembly Note: assembly must be IsAssembly() or IsSimpleShape().
") AddComponent;
		TDF_Label AddComponent(const TDF_Label & assembly, const TDF_Label & comp, const TopLoc_Location & Loc);

		/****** XCAFDoc_ShapeTool::AddComponent ******/
		/****** md5 signature: 45fa2391365629458a37d74ca5554053 ******/
		%feature("compactdefaultargs") AddComponent;
		%feature("autodoc", "
Parameters
----------
assembly: TDF_Label
comp: TopoDS_Shape
expand: bool (optional, default to false)

Return
-------
TDF_Label

Description
-----------
Adds a shape (located) as a component to the assembly If necessary, creates an additional top-level shape for component and return the Label of component. If expand is True and component is Compound, it will be created as assembly also Note: assembly must be IsAssembly() or IsSimpleShape().
") AddComponent;
		TDF_Label AddComponent(const TDF_Label & assembly, const TopoDS_Shape & comp, const bool expand = false);

		/****** XCAFDoc_ShapeTool::AddShape ******/
		/****** md5 signature: 9274ce4eabd0412b7e9e828765d1a3d5 ******/
		%feature("compactdefaultargs") AddShape;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
makeAssembly: bool (optional, default to true)
makePrepare: bool (optional, default to true)

Return
-------
TDF_Label

Description
-----------
Adds a new top-level (creates and returns a new label) If makeAssembly is True, treats TopAbs_COMPOUND shapes as assemblies (creates assembly structure). NOTE: <makePrepare> replace components without location in assembly by located components to avoid some problems. If AutoNaming() is True then automatically attaches names.
") AddShape;
		TDF_Label AddShape(const TopoDS_Shape & S, const bool makeAssembly = true, const bool makePrepare = true);

		/****** XCAFDoc_ShapeTool::AddSubShape ******/
		/****** md5 signature: 558754a0421156ef049e0b4507806193 ******/
		%feature("compactdefaultargs") AddSubShape;
		%feature("autodoc", "
Parameters
----------
shapeL: TDF_Label
sub: TopoDS_Shape

Return
-------
TDF_Label

Description
-----------
Adds a label for subshape <sub> of shape stored on label shapeL Returns Null label if it is not subshape.
") AddSubShape;
		TDF_Label AddSubShape(const TDF_Label & shapeL, const TopoDS_Shape & sub);

		/****** XCAFDoc_ShapeTool::AddSubShape ******/
		/****** md5 signature: 736183e4007f56c054173d2e13a5b558 ******/
		%feature("compactdefaultargs") AddSubShape;
		%feature("autodoc", "
Parameters
----------
shapeL: TDF_Label
sub: TopoDS_Shape
addedSubShapeL: TDF_Label

Return
-------
bool

Description
-----------
Adds (of finds already existed) a label for subshape <sub> of shape stored on label shapeL. Label addedSubShapeL returns added (found) label or empty in case of wrong subshape. Returns True, if new shape was added, False in case of already existed subshape/wrong subshape.
") AddSubShape;
		bool AddSubShape(const TDF_Label & shapeL, const TopoDS_Shape & sub, TDF_Label & addedSubShapeL);

		/****** XCAFDoc_ShapeTool::AutoNaming ******/
		/****** md5 signature: 1256b9087c5fb5b8cd4b95d81d22b205 ******/
		%feature("compactdefaultargs") AutoNaming;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns current auto-naming mode. See SetAutoNaming() for description.
") AutoNaming;
		static bool AutoNaming();

		/****** XCAFDoc_ShapeTool::BaseLabel ******/
		/****** md5 signature: cb499d8135863e96e585085d0b85c75a ******/
		%feature("compactdefaultargs") BaseLabel;
		%feature("autodoc", "Return
-------
TDF_Label

Description
-----------
returns the label under which shapes are stored.
") BaseLabel;
		TDF_Label BaseLabel();

		/****** XCAFDoc_ShapeTool::ComputeShapes ******/
		/****** md5 signature: fb7b892d8fb91ca0f8a461452a468488 ******/
		%feature("compactdefaultargs") ComputeShapes;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label

Return
-------
None

Description
-----------
recursive.
") ComputeShapes;
		void ComputeShapes(const TDF_Label & L);

		/****** XCAFDoc_ShapeTool::ComputeSimpleShapes ******/
		/****** md5 signature: 8f21e84f2d7c8a5855df571cb8738ea6 ******/
		%feature("compactdefaultargs") ComputeSimpleShapes;
		%feature("autodoc", "Return
-------
None

Description
-----------
Compute a sequence of simple shapes.
") ComputeSimpleShapes;
		void ComputeSimpleShapes();

		/****** XCAFDoc_ShapeTool::Dump ******/
		/****** md5 signature: e5e5b97bce9c71f79b8a95240c09c003 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
deep: bool

Return
-------
theDumpLog: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		Standard_OStream & Dump(std::ostream &OutValue, const bool deep);

		/****** XCAFDoc_ShapeTool::Dump ******/
		/****** md5 signature: b6e5c21b03e9ad0006e46a2b5ed1c5e9 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
theDumpLog: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		Standard_OStream & Dump(std::ostream &OutValue);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** XCAFDoc_ShapeTool::DumpShape ******/
		/****** md5 signature: e6aedcda42b4fa550a7a927b1076eb68 ******/
		%feature("compactdefaultargs") DumpShape;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label
level: int (optional, default to 0)
deep: bool (optional, default to false)

Return
-------
theDumpLog: Standard_OStream

Description
-----------
Print to std::ostream <theDumpLog> type of shape found on <L> label and the entry of <L>, with <level> tabs before. If <deep>, print also TShape and Location addresses.
") DumpShape;
		static void DumpShape(std::ostream &OutValue, const TDF_Label & L, const int level = 0, const bool deep = false);

		/****** XCAFDoc_ShapeTool::Expand ******/
		/****** md5 signature: 4bd9d91483af73035ed894c709220e3a ******/
		%feature("compactdefaultargs") Expand;
		%feature("autodoc", "
Parameters
----------
Shape: TDF_Label

Return
-------
bool

Description
-----------
Convert Shape (compound/compsolid/shell/wire) to assembly.
") Expand;
		bool Expand(const TDF_Label & Shape);

		/****** XCAFDoc_ShapeTool::FindComponent ******/
		/****** md5 signature: 48696bae7bd8a298ff1d3957cfe83fd8 ******/
		%feature("compactdefaultargs") FindComponent;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
Labels: TDF_LabelSequence

Return
-------
bool

Description
-----------
Search the path of labels in the document, that corresponds the component from any assembly Try to search the sequence of labels with location that produce this shape as component of any assembly NOTE: Clear sequence of labels before filling.
") FindComponent;
		bool FindComponent(const TopoDS_Shape & theShape, TDF_LabelSequence & Labels);

		/****** XCAFDoc_ShapeTool::FindMainShape ******/
		/****** md5 signature: 37e4e0c22653d7d223843876d69e26d9 ******/
		%feature("compactdefaultargs") FindMainShape;
		%feature("autodoc", "
Parameters
----------
sub: TopoDS_Shape

Return
-------
TDF_Label

Description
-----------
Performs a search among top-level shapes to find the shape containing <sub> as subshape Checks only simple shapes, and returns the first found label (which should be the only one for valid model).
") FindMainShape;
		TDF_Label FindMainShape(const TopoDS_Shape & sub);

		/****** XCAFDoc_ShapeTool::FindMainShapeUsingMap ******/
		/****** md5 signature: d7a834974439597167af8e5492bd8747 ******/
		%feature("compactdefaultargs") FindMainShapeUsingMap;
		%feature("autodoc", "
Parameters
----------
sub: TopoDS_Shape

Return
-------
TDF_Label

Description
-----------
No available documentation.
") FindMainShapeUsingMap;
		TDF_Label FindMainShapeUsingMap(const TopoDS_Shape & sub);

		/****** XCAFDoc_ShapeTool::FindSHUO ******/
		/****** md5 signature: a2b304da619b7a228dee9b212b34a831 ******/
		%feature("compactdefaultargs") FindSHUO;
		%feature("autodoc", "
Parameters
----------
Labels: TDF_LabelSequence
theSHUOAttr: XCAFDoc_GraphNode

Return
-------
bool

Description
-----------
Searches the SHUO by labels of components from upper_usage component to next_usage Returns null attribute if no SHUO found.
") FindSHUO;
		static bool FindSHUO(const TDF_LabelSequence & Labels, opencascade::handle<XCAFDoc_GraphNode> & theSHUOAttr);

		/****** XCAFDoc_ShapeTool::FindShape ******/
		/****** md5 signature: bd3d5cc4adb045b727540e10dbef52f0 ******/
		%feature("compactdefaultargs") FindShape;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
L: TDF_Label
findInstance: bool (optional, default to false)

Return
-------
bool

Description
-----------
Returns the label corresponding to shape S (searches among top-level shapes, not including subcomponents of assemblies and subshapes) If findInstance is False (default), search for the input shape without location If findInstance is True, searches for the input shape as is. Return True if <S> is found.
") FindShape;
		bool FindShape(const TopoDS_Shape & S, TDF_Label & L, const bool findInstance = false);

		/****** XCAFDoc_ShapeTool::FindShape ******/
		/****** md5 signature: 1923c8ed8b1392073cbe0fbd635461f4 ******/
		%feature("compactdefaultargs") FindShape;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
findInstance: bool (optional, default to false)

Return
-------
TDF_Label

Description
-----------
Does the same as previous method Returns Null label if not found.
") FindShape;
		TDF_Label FindShape(const TopoDS_Shape & S, const bool findInstance = false);

		/****** XCAFDoc_ShapeTool::FindSubShape ******/
		/****** md5 signature: 140a0d6750f741faf58bd9bd36c92639 ******/
		%feature("compactdefaultargs") FindSubShape;
		%feature("autodoc", "
Parameters
----------
shapeL: TDF_Label
sub: TopoDS_Shape
L: TDF_Label

Return
-------
bool

Description
-----------
Finds a label for subshape <sub> of shape stored on label shapeL Returns Null label if it is not found.
") FindSubShape;
		bool FindSubShape(const TDF_Label & shapeL, const TopoDS_Shape & sub, TDF_Label & L);

		/****** XCAFDoc_ShapeTool::GetAllComponentSHUO ******/
		/****** md5 signature: 982436be80e113a82a62dfd2f86f44e8 ******/
		%feature("compactdefaultargs") GetAllComponentSHUO;
		%feature("autodoc", "
Parameters
----------
CompLabel: TDF_Label
SHUOAttrs: TDF_AttributeSequence

Return
-------
bool

Description
-----------
Returns founded SHUO GraphNodes of indicated component Returns false in other case.
") GetAllComponentSHUO;
		static bool GetAllComponentSHUO(const TDF_Label & CompLabel, TDF_AttributeSequence & SHUOAttrs);

		/****** XCAFDoc_ShapeTool::GetAllSHUOInstances ******/
		/****** md5 signature: 7a3727e4b045f8288ca09cee98de6f16 ******/
		%feature("compactdefaultargs") GetAllSHUOInstances;
		%feature("autodoc", "
Parameters
----------
theSHUO: XCAFDoc_GraphNode
theSHUOShapeSeq: TopTools_SequenceOfShape

Return
-------
bool

Description
-----------
Searching for component shapes that styled by shuo Returns empty sequence of shape if no any shape is found.
") GetAllSHUOInstances;
		bool GetAllSHUOInstances(const opencascade::handle<XCAFDoc_GraphNode> & theSHUO, TopTools_SequenceOfShape & theSHUOShapeSeq);

		/****** XCAFDoc_ShapeTool::GetComponents ******/
		/****** md5 signature: 823b458bd0418d4bce061313c82d60c4 ******/
		%feature("compactdefaultargs") GetComponents;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label
Labels: TDF_LabelSequence
getsubchilds: bool (optional, default to false)

Return
-------
bool

Description
-----------
Returns list of components of assembly Returns False if label is not assembly.
") GetComponents;
		static bool GetComponents(const TDF_Label & L, TDF_LabelSequence & Labels, const bool getsubchilds = false);

		/****** XCAFDoc_ShapeTool::GetExternRefs ******/
		/****** md5 signature: 251cf6564cb71950e8b9c2ce64c1a09e ******/
		%feature("compactdefaultargs") GetExternRefs;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label
SHAS: TColStd_SequenceOfHAsciiString

Return
-------
None

Description
-----------
Gets the names of references on the no-step files.
") GetExternRefs;
		static void GetExternRefs(const TDF_Label & L, TColStd_SequenceOfHAsciiString & SHAS);

		/****** XCAFDoc_ShapeTool::GetFreeShapes ******/
		/****** md5 signature: a94047e9d4c729b92c7cd63df449f5c2 ******/
		%feature("compactdefaultargs") GetFreeShapes;
		%feature("autodoc", "
Parameters
----------
FreeLabels: TDF_LabelSequence

Return
-------
None

Description
-----------
Returns a sequence of all top-level shapes which are free (i.e. not referred by any other).
") GetFreeShapes;
		void GetFreeShapes(TDF_LabelSequence & FreeLabels);

		/****** XCAFDoc_ShapeTool::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") GetID;
		static const Standard_GUID & GetID();

		/****** XCAFDoc_ShapeTool::GetLocation ******/
		/****** md5 signature: b73bb57bbd021037f9fe9474f8be086f ******/
		%feature("compactdefaultargs") GetLocation;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label

Return
-------
TopLoc_Location

Description
-----------
Returns location of instance.
") GetLocation;
		static TopLoc_Location GetLocation(const TDF_Label & L);

		/****** XCAFDoc_ShapeTool::GetNamedProperties ******/
		/****** md5 signature: 5d935bb817ecece6173c56f978e53baf ******/
		%feature("compactdefaultargs") GetNamedProperties;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label
theToCreate: bool (optional, default to false)

Return
-------
opencascade::handle<TDataStd_NamedData>

Description
-----------
Method to get NamedData attribute assigned to the given shape label. 
Input parameter: theLabel the shape Label 
Input parameter: theToCreate create and assign attribute if it doesn't exist 
Return: Handle to the NamedData attribute or Null if there is none.
") GetNamedProperties;
		opencascade::handle<TDataStd_NamedData> GetNamedProperties(const TDF_Label & theLabel, const bool theToCreate = false);

		/****** XCAFDoc_ShapeTool::GetNamedProperties ******/
		/****** md5 signature: b110f508d4adf05a5505671b7323291a ******/
		%feature("compactdefaultargs") GetNamedProperties;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theToCreate: bool (optional, default to false)

Return
-------
opencascade::handle<TDataStd_NamedData>

Description
-----------
Method to get NamedData attribute assigned to a label of the given shape. 
Input parameter: theShape input shape 
Input parameter: theToCreate create and assign attribute if it doesn't exist 
Return: Handle to the NamedData attribute or Null if there is none.
") GetNamedProperties;
		opencascade::handle<TDataStd_NamedData> GetNamedProperties(const TopoDS_Shape & theShape, const bool theToCreate = false);

		/****** XCAFDoc_ShapeTool::GetOneShape ******/
		/****** md5 signature: 48d89b0678655c1bfe9ed5cb32ef32d3 ******/
		%feature("compactdefaultargs") GetOneShape;
		%feature("autodoc", "
Parameters
----------
theLabels: TDF_LabelSequence

Return
-------
TopoDS_Shape

Description
-----------
Gets shape from a sequence of shape's labels 
Input parameter: theLabels a sequence of labels to get shapes from 
Return: original shape in case of one label and a compound of shapes in case of more.
") GetOneShape;
		static TopoDS_Shape GetOneShape(const TDF_LabelSequence & theLabels);

		/****** XCAFDoc_ShapeTool::GetOneShape ******/
		/****** md5 signature: 5c1df85e1e2a72b0b93fde509f26a709 ******/
		%feature("compactdefaultargs") GetOneShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Gets shape from a sequence of all top-level shapes which are free 
Return: original shape in case of one label and a compound of shapes in case of more.
") GetOneShape;
		TopoDS_Shape GetOneShape();

		/****** XCAFDoc_ShapeTool::GetReferredShape ******/
		/****** md5 signature: 4379239a3c5e113c9513d288dabd53a5 ******/
		%feature("compactdefaultargs") GetReferredShape;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label
Label: TDF_Label

Return
-------
bool

Description
-----------
Returns label which corresponds to a shape referred by L Returns False if label is not reference.
") GetReferredShape;
		static bool GetReferredShape(const TDF_Label & L, TDF_Label & Label);

		/****** XCAFDoc_ShapeTool::GetSHUO ******/
		/****** md5 signature: 605b10dcd1f9e1b35093e27d4284ee07 ******/
		%feature("compactdefaultargs") GetSHUO;
		%feature("autodoc", "
Parameters
----------
SHUOLabel: TDF_Label
aSHUOAttr: XCAFDoc_GraphNode

Return
-------
bool

Description
-----------
Returns founded SHUO GraphNode attribute <aSHUOAttr> Returns false in other case.
") GetSHUO;
		static bool GetSHUO(const TDF_Label & SHUOLabel, opencascade::handle<XCAFDoc_GraphNode> & aSHUOAttr);

		/****** XCAFDoc_ShapeTool::GetSHUOInstance ******/
		/****** md5 signature: ca31198cfeed305fd2720c84fb281379 ******/
		%feature("compactdefaultargs") GetSHUOInstance;
		%feature("autodoc", "
Parameters
----------
theSHUO: XCAFDoc_GraphNode

Return
-------
TopoDS_Shape

Description
-----------
Search for the component shape that styled by shuo Returns null shape if no any shape is found.
") GetSHUOInstance;
		TopoDS_Shape GetSHUOInstance(const opencascade::handle<XCAFDoc_GraphNode> & theSHUO);

		/****** XCAFDoc_ShapeTool::GetSHUONextUsage ******/
		/****** md5 signature: 385e0dfd15daa350e2b00b9769649724 ******/
		%feature("compactdefaultargs") GetSHUONextUsage;
		%feature("autodoc", "
Parameters
----------
UpperUsageL: TDF_Label
Labels: TDF_LabelSequence

Return
-------
bool

Description
-----------
Returns the sequence of labels of SHUO attributes, which is next_usage for this upper_usage SHUO attribute (that indicated by label) NOTE: returns next_usages only on one level (not recurse) NOTE: do not clear the sequence before filling.
") GetSHUONextUsage;
		static bool GetSHUONextUsage(const TDF_Label & UpperUsageL, TDF_LabelSequence & Labels);

		/****** XCAFDoc_ShapeTool::GetSHUOUpperUsage ******/
		/****** md5 signature: dc1880774571350fe1b782c2fc5f7d90 ******/
		%feature("compactdefaultargs") GetSHUOUpperUsage;
		%feature("autodoc", "
Parameters
----------
NextUsageL: TDF_Label
Labels: TDF_LabelSequence

Return
-------
bool

Description
-----------
Returns the sequence of labels of SHUO attributes, which is upper_usage for this next_usage SHUO attribute (that indicated by label) NOTE: returns upper_usages only on one level (not recurse) NOTE: do not clear the sequence before filling.
") GetSHUOUpperUsage;
		static bool GetSHUOUpperUsage(const TDF_Label & NextUsageL, TDF_LabelSequence & Labels);

		/****** XCAFDoc_ShapeTool::GetShape ******/
		/****** md5 signature: 3202796e33c26749c754d5b9a390ff78 ******/
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label
S: TopoDS_Shape

Return
-------
bool

Description
-----------
To get TopoDS_Shape from shape's label For component, returns new shape with correct location Returns False if label does not contain shape.
") GetShape;
		static bool GetShape(const TDF_Label & L, TopoDS_Shape & S);

		/****** XCAFDoc_ShapeTool::GetShape ******/
		/****** md5 signature: 9877181bb42dd1a8926db70912cc456b ******/
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label

Return
-------
TopoDS_Shape

Description
-----------
To get TopoDS_Shape from shape's label For component, returns new shape with correct location Returns Null shape if label does not contain shape.
") GetShape;
		static TopoDS_Shape GetShape(const TDF_Label & L);

		/****** XCAFDoc_ShapeTool::GetShapes ******/
		/****** md5 signature: 9e25354d64958a4a508ee0b3df061521 ******/
		%feature("compactdefaultargs") GetShapes;
		%feature("autodoc", "
Parameters
----------
Labels: TDF_LabelSequence

Return
-------
None

Description
-----------
Returns a sequence of all top-level shapes.
") GetShapes;
		void GetShapes(TDF_LabelSequence & Labels);

		/****** XCAFDoc_ShapeTool::GetSubShapes ******/
		/****** md5 signature: f575638c9c85a9e2b83266a5e8e9e7b1 ******/
		%feature("compactdefaultargs") GetSubShapes;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label
Labels: TDF_LabelSequence

Return
-------
bool

Description
-----------
Returns list of labels identifying subshapes of the given shape Returns False if no subshapes are placed on that label.
") GetSubShapes;
		static bool GetSubShapes(const TDF_Label & L, TDF_LabelSequence & Labels);

		/****** XCAFDoc_ShapeTool::GetUsers ******/
		/****** md5 signature: 1eb5749b3effa68772bf46924feefd7e ******/
		%feature("compactdefaultargs") GetUsers;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label
Labels: TDF_LabelSequence
getsubchilds: bool (optional, default to false)

Return
-------
int

Description
-----------
Returns list of labels which refer shape L as component Returns number of users (0 if shape is free).
") GetUsers;
		static int GetUsers(const TDF_Label & L, TDF_LabelSequence & Labels, const bool getsubchilds = false);

		/****** XCAFDoc_ShapeTool::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** XCAFDoc_ShapeTool::Init ******/
		/****** md5 signature: 0de93ef32c53d091768788dca0e281fd ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Return
-------
None

Description
-----------
set hasComponents into false.
") Init;
		void Init();

		/****** XCAFDoc_ShapeTool::IsAssembly ******/
		/****** md5 signature: 45a2447afbe9fdde3cefbdee56f7484f ******/
		%feature("compactdefaultargs") IsAssembly;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label

Return
-------
bool

Description
-----------
Returns True if the label is a label of assembly, i.e. contains sublabels which are assembly components This is relevant only if IsShape() is True.
") IsAssembly;
		static bool IsAssembly(const TDF_Label & L);

		/****** XCAFDoc_ShapeTool::IsComponent ******/
		/****** md5 signature: c2a390b8591e93827c7ea8750f58ce46 ******/
		%feature("compactdefaultargs") IsComponent;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label

Return
-------
bool

Description
-----------
Return true if <L> is reference serving as component of assembly.
") IsComponent;
		static bool IsComponent(const TDF_Label & L);

		/****** XCAFDoc_ShapeTool::IsCompound ******/
		/****** md5 signature: 583d8f39b33a283f6e51002e05eebd5a ******/
		%feature("compactdefaultargs") IsCompound;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label

Return
-------
bool

Description
-----------
Returns True if the label is a label of compound, i.e. contains some sublabels This is relevant only if IsShape() is True.
") IsCompound;
		static bool IsCompound(const TDF_Label & L);

		/****** XCAFDoc_ShapeTool::IsExternRef ******/
		/****** md5 signature: bbfdae7b74d3d30c804495743bec953a ******/
		%feature("compactdefaultargs") IsExternRef;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label

Return
-------
bool

Description
-----------
Returns True if the label is a label of external references, i.e. there are some reference on the no-step files, which are described in document only their names.
") IsExternRef;
		static bool IsExternRef(const TDF_Label & L);

		/****** XCAFDoc_ShapeTool::IsFree ******/
		/****** md5 signature: e299229e01a27be7e9f0bc788780c6f7 ******/
		%feature("compactdefaultargs") IsFree;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label

Return
-------
bool

Description
-----------
Returns True if the label is not used by any assembly, i.e. contains sublabels which are assembly components This is relevant only if IsShape() is True (There is no Father TreeNode on this <L>).
") IsFree;
		static bool IsFree(const TDF_Label & L);

		/****** XCAFDoc_ShapeTool::IsReference ******/
		/****** md5 signature: 59b3ddd84024c39218af6c91e89ab491 ******/
		%feature("compactdefaultargs") IsReference;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label

Return
-------
bool

Description
-----------
Return true if <L> is a located instance of other shape i.e. reference.
") IsReference;
		static bool IsReference(const TDF_Label & L);

		/****** XCAFDoc_ShapeTool::IsShape ******/
		/****** md5 signature: 47cf07be248b5cfb03a2cbc4e3580166 ******/
		%feature("compactdefaultargs") IsShape;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label

Return
-------
bool

Description
-----------
Returns True if the label represents a shape (simple shape, assembly or reference).
") IsShape;
		static bool IsShape(const TDF_Label & L);

		/****** XCAFDoc_ShapeTool::IsSimpleShape ******/
		/****** md5 signature: e9cb2d03971a0cfc192bfb1be63bf166 ******/
		%feature("compactdefaultargs") IsSimpleShape;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label

Return
-------
bool

Description
-----------
Returns True if the label is a label of simple shape.
") IsSimpleShape;
		static bool IsSimpleShape(const TDF_Label & L);

		/****** XCAFDoc_ShapeTool::IsSubShape ******/
		/****** md5 signature: ac2f19e0ab23985f42e3e133b976b8b6 ******/
		%feature("compactdefaultargs") IsSubShape;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label

Return
-------
bool

Description
-----------
Return true if <L> is subshape of the top-level shape.
") IsSubShape;
		static bool IsSubShape(const TDF_Label & L);

		/****** XCAFDoc_ShapeTool::IsSubShape ******/
		/****** md5 signature: e49ae0ed0c92a7f91b1b8440396b44a2 ******/
		%feature("compactdefaultargs") IsSubShape;
		%feature("autodoc", "
Parameters
----------
shapeL: TDF_Label
sub: TopoDS_Shape

Return
-------
bool

Description
-----------
Checks whether shape <sub> is subshape of shape stored on label shapeL.
") IsSubShape;
		bool IsSubShape(const TDF_Label & shapeL, const TopoDS_Shape & sub);

		/****** XCAFDoc_ShapeTool::IsTopLevel ******/
		/****** md5 signature: 85ae2524c7e93271a817cf8128ee8737 ******/
		%feature("compactdefaultargs") IsTopLevel;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label

Return
-------
bool

Description
-----------
Returns True if the label is a label of top-level shape, as opposed to component of assembly or subshape.
") IsTopLevel;
		bool IsTopLevel(const TDF_Label & L);

		/****** XCAFDoc_ShapeTool::NbComponents ******/
		/****** md5 signature: 90e31c85eefca15eaecb27adc8d2d56f ******/
		%feature("compactdefaultargs") NbComponents;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label
getsubchilds: bool (optional, default to false)

Return
-------
int

Description
-----------
Returns number of Assembles components.
") NbComponents;
		static int NbComponents(const TDF_Label & L, const bool getsubchilds = false);

		/****** XCAFDoc_ShapeTool::NewShape ******/
		/****** md5 signature: be3f917f6ac40df6a84f450b698db353 ******/
		%feature("compactdefaultargs") NewShape;
		%feature("autodoc", "Return
-------
TDF_Label

Description
-----------
Creates new (empty) top-level shape. Initially it holds empty TopoDS_Compound.
") NewShape;
		TDF_Label NewShape();

		/****** XCAFDoc_ShapeTool::RemoveComponent ******/
		/****** md5 signature: 231f2b5b04ddc6bf841f8649e4547e79 ******/
		%feature("compactdefaultargs") RemoveComponent;
		%feature("autodoc", "
Parameters
----------
comp: TDF_Label

Return
-------
None

Description
-----------
Removes a component from its assembly.
") RemoveComponent;
		void RemoveComponent(const TDF_Label & comp);

		/****** XCAFDoc_ShapeTool::RemoveSHUO ******/
		/****** md5 signature: fd3014f2b2bd04f10a91847762d5db8c ******/
		%feature("compactdefaultargs") RemoveSHUO;
		%feature("autodoc", "
Parameters
----------
SHUOLabel: TDF_Label

Return
-------
bool

Description
-----------
Remove SHUO from component sublabel, remove all dependencies on other SHUO. Returns False if cannot remove SHUO dependencies. NOTE: remove any styles that associated with this SHUO.
") RemoveSHUO;
		bool RemoveSHUO(const TDF_Label & SHUOLabel);

		/****** XCAFDoc_ShapeTool::RemoveShape ******/
		/****** md5 signature: ed4c0a0486cb3dc3bb97d5b8ba57b0c6 ******/
		%feature("compactdefaultargs") RemoveShape;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label
removeCompletely: bool (optional, default to true)

Return
-------
bool

Description
-----------
Removes shape (whole label and all its sublabels) If removeCompletely is true, removes complete shape If removeCompletely is false, removes instance(location) only Returns False (and does nothing) if shape is not free or is not top-level shape.
") RemoveShape;
		bool RemoveShape(const TDF_Label & L, const bool removeCompletely = true);

		/****** XCAFDoc_ShapeTool::Search ******/
		/****** md5 signature: 94186f24c9a42e9a1cea5dfbec70f2e0 ******/
		%feature("compactdefaultargs") Search;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
L: TDF_Label
findInstance: bool (optional, default to true)
findComponent: bool (optional, default to true)
findSubshape: bool (optional, default to true)

Return
-------
bool

Description
-----------
General tool to find a (sub) shape in the document * If findInstance is True, and S has a non-null location, first tries to find the shape among the top-level shapes with this location * If not found, and findComponent is True, tries to find the shape among the components of assemblies * If not found, tries to find the shape without location among top-level shapes * If not found and findSubshape is True, tries to find a shape as a subshape of top-level simple shapes Returns False if nothing is found.
") Search;
		bool Search(const TopoDS_Shape & S, TDF_Label & L, const bool findInstance = true, const bool findComponent = true, const bool findSubshape = true);

		/****** XCAFDoc_ShapeTool::SearchUsingMap ******/
		/****** md5 signature: 7fd5371c588185e427651b41595d5a91 ******/
		%feature("compactdefaultargs") SearchUsingMap;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
L: TDF_Label
findWithoutLoc: bool
findSubshape: bool

Return
-------
bool

Description
-----------
No available documentation.
") SearchUsingMap;
		bool SearchUsingMap(const TopoDS_Shape & S, TDF_Label & L, const bool findWithoutLoc, const bool findSubshape);

		/****** XCAFDoc_ShapeTool::Set ******/
		/****** md5 signature: e7840fdd6b042b302eff154ea7e10508 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label

Return
-------
opencascade::handle<XCAFDoc_ShapeTool>

Description
-----------
Create (if not exist) ShapeTool from XCAFDoc on <L>.
") Set;
		static opencascade::handle<XCAFDoc_ShapeTool> Set(const TDF_Label & L);

		/****** XCAFDoc_ShapeTool::SetAutoNaming ******/
		/****** md5 signature: cbdd6e0e2f5ace1531d60677264d0920 ******/
		%feature("compactdefaultargs") SetAutoNaming;
		%feature("autodoc", "
Parameters
----------
V: bool

Return
-------
None

Description
-----------
Sets auto-naming mode to <V>. If True then for added shapes, links, assemblies and SHUO's, the TDataStd_Name attribute is automatically added. For shapes it contains a shape type (e.g. 'SOLID', 'SHELL', etc); for links it has a form '=>[0:1:1:2]' (where a tag is a label containing a shape without a location); for assemblies it is 'ASSEMBLY', and 'SHUO' for SHUO's. This setting is global; it cannot be made a member function as it is used by static methods as well. By default, auto-naming is enabled. See also AutoNaming().
") SetAutoNaming;
		static void SetAutoNaming(const bool V);

		/****** XCAFDoc_ShapeTool::SetExternRefs ******/
		/****** md5 signature: c9a2fdada834bbc725bdca91353f2af0 ******/
		%feature("compactdefaultargs") SetExternRefs;
		%feature("autodoc", "
Parameters
----------
SHAS: TColStd_SequenceOfHAsciiString

Return
-------
TDF_Label

Description
-----------
Sets the names of references on the no-step files.
") SetExternRefs;
		TDF_Label SetExternRefs(const TColStd_SequenceOfHAsciiString & SHAS);

		/****** XCAFDoc_ShapeTool::SetExternRefs ******/
		/****** md5 signature: 01d85f052bc124a5dfbe0dc20c615a73 ******/
		%feature("compactdefaultargs") SetExternRefs;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label
SHAS: TColStd_SequenceOfHAsciiString

Return
-------
None

Description
-----------
Sets the names of references on the no-step files.
") SetExternRefs;
		void SetExternRefs(const TDF_Label & L, const TColStd_SequenceOfHAsciiString & SHAS);

		/****** XCAFDoc_ShapeTool::SetInstanceSHUO ******/
		/****** md5 signature: 3a2876846d7fb4d04fba56e940da38a9 ******/
		%feature("compactdefaultargs") SetInstanceSHUO;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
opencascade::handle<XCAFDoc_GraphNode>

Description
-----------
Search for the component shape by labelks path and set SHUO structure for founded label structure Returns null attribute if no component in any assembly found.
") SetInstanceSHUO;
		opencascade::handle<XCAFDoc_GraphNode> SetInstanceSHUO(const TopoDS_Shape & theShape);

		/****** XCAFDoc_ShapeTool::SetLocation ******/
		/****** md5 signature: 2c05b99ca6114b6ecb5970d9655f59dc ******/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "
Parameters
----------
theShapeLabel: TDF_Label
theLoc: TopLoc_Location
theRefLabel: TDF_Label

Return
-------
bool

Description
-----------
Sets location to the shape label If label is reference -> changes location attribute If label is free shape -> creates reference with location to it 
Input parameter: theShapeLabel the shape label to change location 
Input parameter: theLoc location to set @param[out] theRefLabel the reference label with new location 
Return: True if new location was set.
") SetLocation;
		bool SetLocation(const TDF_Label & theShapeLabel, const TopLoc_Location & theLoc, TDF_Label & theRefLabel);

		/****** XCAFDoc_ShapeTool::SetSHUO ******/
		/****** md5 signature: 51e9dc8feb358c7a83e226fe66a1574d ******/
		%feature("compactdefaultargs") SetSHUO;
		%feature("autodoc", "
Parameters
----------
Labels: TDF_LabelSequence
MainSHUOAttr: XCAFDoc_GraphNode

Return
-------
bool

Description
-----------
Sets the SHUO structure between upper_usage and next_usage create multy-level (if number of labels > 2) SHUO from first to last Initialise out <MainSHUOAttr> by main upper_usage SHUO attribute. Returns False if some of labels in not component label.
") SetSHUO;
		bool SetSHUO(const TDF_LabelSequence & Labels, opencascade::handle<XCAFDoc_GraphNode> & MainSHUOAttr);

		/****** XCAFDoc_ShapeTool::SetShape ******/
		/****** md5 signature: a0d7d58b60bcc078c2a64a6ff54f1afc ******/
		%feature("compactdefaultargs") SetShape;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label
S: TopoDS_Shape

Return
-------
None

Description
-----------
Sets representation (TopoDS_Shape) for top-level shape.
") SetShape;
		void SetShape(const TDF_Label & L, const TopoDS_Shape & S);

		/****** XCAFDoc_ShapeTool::UpdateAssemblies ******/
		/****** md5 signature: 9e19036c79d91376e16f3485fb8f9ab8 ******/
		%feature("compactdefaultargs") UpdateAssemblies;
		%feature("autodoc", "Return
-------
None

Description
-----------
Top-down update for all assembly compounds stored in the document.
") UpdateAssemblies;
		void UpdateAssemblies();

};


%make_alias(XCAFDoc_ShapeTool)

%extend XCAFDoc_ShapeTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class XCAFDoc_View *
*********************/
class XCAFDoc_View : public TDataStd_GenericEmpty {
	public:
		/****** XCAFDoc_View::XCAFDoc_View ******/
		/****** md5 signature: 0245c9b612af8c7f9c5d80a84506c419 ******/
		%feature("compactdefaultargs") XCAFDoc_View;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") XCAFDoc_View;
		 XCAFDoc_View();

		/****** XCAFDoc_View::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") GetID;
		static const Standard_GUID & GetID();

		/****** XCAFDoc_View::GetObject ******/
		/****** md5 signature: d4237a0790ea570202ac13a7e6992469 ******/
		%feature("compactdefaultargs") GetObject;
		%feature("autodoc", "Return
-------
opencascade::handle<XCAFView_Object>

Description
-----------
Returns view object data taken from the paren's label and its sub-labels.
") GetObject;
		opencascade::handle<XCAFView_Object> GetObject();

		/****** XCAFDoc_View::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** XCAFDoc_View::Set ******/
		/****** md5 signature: 674777373bb851e3052609659f01d247 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label

Return
-------
opencascade::handle<XCAFDoc_View>

Description
-----------
No available documentation.
") Set;
		static opencascade::handle<XCAFDoc_View> Set(const TDF_Label & theLabel);

		/****** XCAFDoc_View::SetObject ******/
		/****** md5 signature: e479b9d64db1c1df40b02c80de3956b3 ******/
		%feature("compactdefaultargs") SetObject;
		%feature("autodoc", "
Parameters
----------
theViewObject: XCAFView_Object

Return
-------
None

Description
-----------
Updates parent's label and its sub-labels with data taken from theViewObject. Old data associated with the label will be lost.
") SetObject;
		void SetObject(const opencascade::handle<XCAFView_Object> & theViewObject);

};


%make_alias(XCAFDoc_View)

%extend XCAFDoc_View {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class XCAFDoc_ViewTool *
*************************/
class XCAFDoc_ViewTool : public TDataStd_GenericEmpty {
	public:
		/****** XCAFDoc_ViewTool::XCAFDoc_ViewTool ******/
		/****** md5 signature: 4864083a9c277edf2495cf642a7aeced ******/
		%feature("compactdefaultargs") XCAFDoc_ViewTool;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") XCAFDoc_ViewTool;
		 XCAFDoc_ViewTool();

		/****** XCAFDoc_ViewTool::AddView ******/
		/****** md5 signature: f710066f6898ee7d96369f06cca4b434 ******/
		%feature("compactdefaultargs") AddView;
		%feature("autodoc", "Return
-------
TDF_Label

Description
-----------
Adds a view definition to a View table and returns its label.
") AddView;
		TDF_Label AddView();

		/****** XCAFDoc_ViewTool::BaseLabel ******/
		/****** md5 signature: cb499d8135863e96e585085d0b85c75a ******/
		%feature("compactdefaultargs") BaseLabel;
		%feature("autodoc", "Return
-------
TDF_Label

Description
-----------
Returns the label under which Views are stored.
") BaseLabel;
		TDF_Label BaseLabel();

		/****** XCAFDoc_ViewTool::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") GetID;
		static const Standard_GUID & GetID();

		/****** XCAFDoc_ViewTool::GetRefAnnotationLabel ******/
		/****** md5 signature: 824c0ee4c490bc04e77bf7c3b200db79 ******/
		%feature("compactdefaultargs") GetRefAnnotationLabel;
		%feature("autodoc", "
Parameters
----------
theViewL: TDF_Label
theAnnotationLabels: TDF_LabelSequence

Return
-------
bool

Description
-----------
Returns Annotation labels defined for label theViewL Returns False if the theViewL is not in View table.
") GetRefAnnotationLabel;
		bool GetRefAnnotationLabel(const TDF_Label & theViewL, TDF_LabelSequence & theAnnotationLabels);

		/****** XCAFDoc_ViewTool::GetRefClippingPlaneLabel ******/
		/****** md5 signature: 03df396fead5268f7883f50332de9c19 ******/
		%feature("compactdefaultargs") GetRefClippingPlaneLabel;
		%feature("autodoc", "
Parameters
----------
theViewL: TDF_Label
theClippingPlaneLabels: TDF_LabelSequence

Return
-------
bool

Description
-----------
Returns ClippingPlane labels defined for label theViewL Returns False if the theViewL is not in View table.
") GetRefClippingPlaneLabel;
		bool GetRefClippingPlaneLabel(const TDF_Label & theViewL, TDF_LabelSequence & theClippingPlaneLabels);

		/****** XCAFDoc_ViewTool::GetRefGDTLabel ******/
		/****** md5 signature: 82b892347e4c3ce9a4f9c3ed59c72931 ******/
		%feature("compactdefaultargs") GetRefGDTLabel;
		%feature("autodoc", "
Parameters
----------
theViewL: TDF_Label
theGDTLabels: TDF_LabelSequence

Return
-------
bool

Description
-----------
Returns GDT labels defined for label theViewL Returns False if the theViewL is not in View table.
") GetRefGDTLabel;
		bool GetRefGDTLabel(const TDF_Label & theViewL, TDF_LabelSequence & theGDTLabels);

		/****** XCAFDoc_ViewTool::GetRefNoteLabel ******/
		/****** md5 signature: e29b19160b4b3dddb3216b30b3779c74 ******/
		%feature("compactdefaultargs") GetRefNoteLabel;
		%feature("autodoc", "
Parameters
----------
theViewL: TDF_Label
theNoteLabels: TDF_LabelSequence

Return
-------
bool

Description
-----------
Returns Notes labels defined for label theViewL Returns False if the theViewL is not in View table.
") GetRefNoteLabel;
		bool GetRefNoteLabel(const TDF_Label & theViewL, TDF_LabelSequence & theNoteLabels);

		/****** XCAFDoc_ViewTool::GetRefShapeLabel ******/
		/****** md5 signature: e1d130ffebdc2283e29d27db19769bcc ******/
		%feature("compactdefaultargs") GetRefShapeLabel;
		%feature("autodoc", "
Parameters
----------
theViewL: TDF_Label
theShapeLabels: TDF_LabelSequence

Return
-------
bool

Description
-----------
Returns shape labels defined for label theViewL Returns False if the theViewL is not in View table.
") GetRefShapeLabel;
		bool GetRefShapeLabel(const TDF_Label & theViewL, TDF_LabelSequence & theShapeLabels);

		/****** XCAFDoc_ViewTool::GetViewLabels ******/
		/****** md5 signature: 36b471bb18ba1f43a4f4108febdc4790 ******/
		%feature("compactdefaultargs") GetViewLabels;
		%feature("autodoc", "
Parameters
----------
theLabels: TDF_LabelSequence

Return
-------
None

Description
-----------
Returns a sequence of View labels currently stored in the View table.
") GetViewLabels;
		void GetViewLabels(TDF_LabelSequence & theLabels);

		/****** XCAFDoc_ViewTool::GetViewLabelsForAnnotation ******/
		/****** md5 signature: 049eafdf6fac276fb913af25d1a2f3b8 ******/
		%feature("compactdefaultargs") GetViewLabelsForAnnotation;
		%feature("autodoc", "
Parameters
----------
theAnnotationL: TDF_Label
theViews: TDF_LabelSequence

Return
-------
bool

Description
-----------
Returns all View labels defined for label AnnotationL.
") GetViewLabelsForAnnotation;
		bool GetViewLabelsForAnnotation(const TDF_Label & theAnnotationL, TDF_LabelSequence & theViews);

		/****** XCAFDoc_ViewTool::GetViewLabelsForClippingPlane ******/
		/****** md5 signature: 51d545a416de304ef0c6b807c9788b5a ******/
		%feature("compactdefaultargs") GetViewLabelsForClippingPlane;
		%feature("autodoc", "
Parameters
----------
theClippingPlaneL: TDF_Label
theViews: TDF_LabelSequence

Return
-------
bool

Description
-----------
Returns all View labels defined for label ClippingPlaneL.
") GetViewLabelsForClippingPlane;
		bool GetViewLabelsForClippingPlane(const TDF_Label & theClippingPlaneL, TDF_LabelSequence & theViews);

		/****** XCAFDoc_ViewTool::GetViewLabelsForGDT ******/
		/****** md5 signature: 7508a638dc8aa9d481066efea64ee1b9 ******/
		%feature("compactdefaultargs") GetViewLabelsForGDT;
		%feature("autodoc", "
Parameters
----------
theGDTL: TDF_Label
theViews: TDF_LabelSequence

Return
-------
bool

Description
-----------
Returns all View labels defined for label GDTL.
") GetViewLabelsForGDT;
		bool GetViewLabelsForGDT(const TDF_Label & theGDTL, TDF_LabelSequence & theViews);

		/****** XCAFDoc_ViewTool::GetViewLabelsForNote ******/
		/****** md5 signature: 8d5bc360b595e9c68884cc8defd872dd ******/
		%feature("compactdefaultargs") GetViewLabelsForNote;
		%feature("autodoc", "
Parameters
----------
theNoteL: TDF_Label
theViews: TDF_LabelSequence

Return
-------
bool

Description
-----------
Returns all View labels defined for label NoteL.
") GetViewLabelsForNote;
		bool GetViewLabelsForNote(const TDF_Label & theNoteL, TDF_LabelSequence & theViews);

		/****** XCAFDoc_ViewTool::GetViewLabelsForShape ******/
		/****** md5 signature: 7a22b1ac9e53629fe3204dcce3f788a2 ******/
		%feature("compactdefaultargs") GetViewLabelsForShape;
		%feature("autodoc", "
Parameters
----------
theShapeL: TDF_Label
theViews: TDF_LabelSequence

Return
-------
bool

Description
-----------
Returns all View labels defined for label ShapeL.
") GetViewLabelsForShape;
		bool GetViewLabelsForShape(const TDF_Label & theShapeL, TDF_LabelSequence & theViews);

		/****** XCAFDoc_ViewTool::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** XCAFDoc_ViewTool::IsLocked ******/
		/****** md5 signature: 333841a1935224d396ede7d5e781eb4c ******/
		%feature("compactdefaultargs") IsLocked;
		%feature("autodoc", "
Parameters
----------
theViewL: TDF_Label

Return
-------
bool

Description
-----------
Returns true if the given View is marked as locked.
") IsLocked;
		bool IsLocked(const TDF_Label & theViewL);

		/****** XCAFDoc_ViewTool::IsView ******/
		/****** md5 signature: c69544921a34202fd739b863032b62b4 ******/
		%feature("compactdefaultargs") IsView;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label

Return
-------
bool

Description
-----------
Returns True if label belongs to a View table and is a View definition.
") IsView;
		bool IsView(const TDF_Label & theLabel);

		/****** XCAFDoc_ViewTool::Lock ******/
		/****** md5 signature: 44e08eb297c1fac0353895828de43f48 ******/
		%feature("compactdefaultargs") Lock;
		%feature("autodoc", "
Parameters
----------
theViewL: TDF_Label

Return
-------
None

Description
-----------
Mark the given View as locked.
") Lock;
		void Lock(const TDF_Label & theViewL);

		/****** XCAFDoc_ViewTool::RemoveView ******/
		/****** md5 signature: f1810b43f33eadaf802adda4d65274e8 ******/
		%feature("compactdefaultargs") RemoveView;
		%feature("autodoc", "
Parameters
----------
theViewL: TDF_Label

Return
-------
None

Description
-----------
Remove View.
") RemoveView;
		void RemoveView(const TDF_Label & theViewL);

		/****** XCAFDoc_ViewTool::Set ******/
		/****** md5 signature: 36ad683191aa4700d6f2065ed9e0ca01 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label

Return
-------
opencascade::handle<XCAFDoc_ViewTool>

Description
-----------
Creates (if not exist) ViewTool.
") Set;
		static opencascade::handle<XCAFDoc_ViewTool> Set(const TDF_Label & L);

		/****** XCAFDoc_ViewTool::SetClippingPlanes ******/
		/****** md5 signature: c797e35f5f7ce7c64e7d98833898cd97 ******/
		%feature("compactdefaultargs") SetClippingPlanes;
		%feature("autodoc", "
Parameters
----------
theClippingPlaneLabels: TDF_LabelSequence
theViewL: TDF_Label

Return
-------
None

Description
-----------
Set Clipping planes to given View.
") SetClippingPlanes;
		void SetClippingPlanes(const TDF_LabelSequence & theClippingPlaneLabels, const TDF_Label & theViewL);

		/****** XCAFDoc_ViewTool::SetView ******/
		/****** md5 signature: 155ee29b611e9191ff10a4d073b713cd ******/
		%feature("compactdefaultargs") SetView;
		%feature("autodoc", "
Parameters
----------
theShapes: TDF_LabelSequence
theGDTs: TDF_LabelSequence
theClippingPlanes: TDF_LabelSequence
theNotes: TDF_LabelSequence
theAnnotations: TDF_LabelSequence
theViewL: TDF_Label

Return
-------
None

Description
-----------
Sets a link with GUID.
") SetView;
		void SetView(const TDF_LabelSequence & theShapes, const TDF_LabelSequence & theGDTs, const TDF_LabelSequence & theClippingPlanes, const TDF_LabelSequence & theNotes, const TDF_LabelSequence & theAnnotations, const TDF_Label & theViewL);

		/****** XCAFDoc_ViewTool::SetView ******/
		/****** md5 signature: cb24d6adccccb367b8fb9dcdd3f56cba ******/
		%feature("compactdefaultargs") SetView;
		%feature("autodoc", "
Parameters
----------
theShapes: TDF_LabelSequence
theGDTs: TDF_LabelSequence
theClippingPlanes: TDF_LabelSequence
theViewL: TDF_Label

Return
-------
None

Description
-----------
Sets a link with GUID.
") SetView;
		void SetView(const TDF_LabelSequence & theShapes, const TDF_LabelSequence & theGDTs, const TDF_LabelSequence & theClippingPlanes, const TDF_Label & theViewL);

		/****** XCAFDoc_ViewTool::SetView ******/
		/****** md5 signature: 7d72f78b58f15b61198b33f6f7e3132e ******/
		%feature("compactdefaultargs") SetView;
		%feature("autodoc", "
Parameters
----------
theShapes: TDF_LabelSequence
theGDTs: TDF_LabelSequence
theViewL: TDF_Label

Return
-------
None

Description
-----------
Sets a link with GUID.
") SetView;
		void SetView(const TDF_LabelSequence & theShapes, const TDF_LabelSequence & theGDTs, const TDF_Label & theViewL);

		/****** XCAFDoc_ViewTool::Unlock ******/
		/****** md5 signature: 47087adf5c901031f9be4fa4e9008a89 ******/
		%feature("compactdefaultargs") Unlock;
		%feature("autodoc", "
Parameters
----------
theViewL: TDF_Label

Return
-------
None

Description
-----------
Unlock the given View.
") Unlock;
		void Unlock(const TDF_Label & theViewL);

};


%make_alias(XCAFDoc_ViewTool)

%extend XCAFDoc_ViewTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class XCAFDoc_VisMaterial *
****************************/
class XCAFDoc_VisMaterial : public TDF_Attribute {
	public:
		/****** XCAFDoc_VisMaterial::XCAFDoc_VisMaterial ******/
		/****** md5 signature: de25513c62db54dd98c28fb751e5f3a8 ******/
		%feature("compactdefaultargs") XCAFDoc_VisMaterial;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") XCAFDoc_VisMaterial;
		 XCAFDoc_VisMaterial();

		/****** XCAFDoc_VisMaterial::AlphaCutOff ******/
		/****** md5 signature: 533b77adaecb1842c9e04f3968496ce7 ******/
		%feature("compactdefaultargs") AlphaCutOff;
		%feature("autodoc", "Return
-------
float

Description
-----------
Return alpha cutoff value; 0.5 by default.
") AlphaCutOff;
		float AlphaCutOff();

		/****** XCAFDoc_VisMaterial::AlphaMode ******/
		/****** md5 signature: c141b940ccd51adaa91c404b4d4a5d76 ******/
		%feature("compactdefaultargs") AlphaMode;
		%feature("autodoc", "Return
-------
Graphic3d_AlphaMode

Description
-----------
Return alpha mode; Graphic3d_AlphaMode_BlendAuto by default.
") AlphaMode;
		Graphic3d_AlphaMode AlphaMode();

		/****** XCAFDoc_VisMaterial::BaseColor ******/
		/****** md5 signature: f8585c32bce71447f36243b6bcd6baa9 ******/
		%feature("compactdefaultargs") BaseColor;
		%feature("autodoc", "Return
-------
Quantity_ColorRGBA

Description
-----------
Return base color.
") BaseColor;
		Quantity_ColorRGBA BaseColor();

		/****** XCAFDoc_VisMaterial::CommonMaterial ******/
		/****** md5 signature: 703dc4550b60da27a28ba4b2bb54d11e ******/
		%feature("compactdefaultargs") CommonMaterial;
		%feature("autodoc", "Return
-------
XCAFDoc_VisMaterialCommon

Description
-----------
Return common material. Note that default constructor creates an empty material (
See also: XCAFDoc_VisMaterialCommon::IsDefined).
") CommonMaterial;
		const XCAFDoc_VisMaterialCommon & CommonMaterial();

		/****** XCAFDoc_VisMaterial::ConvertToCommonMaterial ******/
		/****** md5 signature: 251cc72d8a745287cc99962025b28cdc ******/
		%feature("compactdefaultargs") ConvertToCommonMaterial;
		%feature("autodoc", "Return
-------
XCAFDoc_VisMaterialCommon

Description
-----------
Return Common material or convert PBR into Common material.
") ConvertToCommonMaterial;
		XCAFDoc_VisMaterialCommon ConvertToCommonMaterial();

		/****** XCAFDoc_VisMaterial::ConvertToPbrMaterial ******/
		/****** md5 signature: 9c2a26304acde37d2893e7eed990e88a ******/
		%feature("compactdefaultargs") ConvertToPbrMaterial;
		%feature("autodoc", "Return
-------
XCAFDoc_VisMaterialPBR

Description
-----------
Return PBR material or convert Common into PBR material.
") ConvertToPbrMaterial;
		XCAFDoc_VisMaterialPBR ConvertToPbrMaterial();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** XCAFDoc_VisMaterial::FaceCulling ******/
		/****** md5 signature: ea5bcfdb7347bbf80f346aa702bd7b90 ******/
		%feature("compactdefaultargs") FaceCulling;
		%feature("autodoc", "Return
-------
Graphic3d_TypeOfBackfacingModel

Description
-----------
Returns if the material is double or single sided; Graphic3d_TypeOfBackfacingModel_Auto by default.
") FaceCulling;
		Graphic3d_TypeOfBackfacingModel FaceCulling();

		/****** XCAFDoc_VisMaterial::FillAspect ******/
		/****** md5 signature: f4ca83412976fc99587d66a154a321d7 ******/
		%feature("compactdefaultargs") FillAspect;
		%feature("autodoc", "
Parameters
----------
theAspect: Graphic3d_Aspects

Return
-------
None

Description
-----------
Fill in graphic aspects.
") FillAspect;
		void FillAspect(const opencascade::handle<Graphic3d_Aspects> & theAspect);

		/****** XCAFDoc_VisMaterial::FillMaterialAspect ******/
		/****** md5 signature: e6d424919dabf73c3259cb308aa680fb ******/
		%feature("compactdefaultargs") FillMaterialAspect;
		%feature("autodoc", "
Parameters
----------
theAspect: Graphic3d_MaterialAspect

Return
-------
None

Description
-----------
Fill in material aspect.
") FillMaterialAspect;
		void FillMaterialAspect(Graphic3d_MaterialAspect & theAspect);

		/****** XCAFDoc_VisMaterial::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Return attribute GUID.
") GetID;
		static const Standard_GUID & GetID();

		/****** XCAFDoc_VisMaterial::HasCommonMaterial ******/
		/****** md5 signature: 6b4a83ccc3cf640a1f888031cab3a537 ******/
		%feature("compactdefaultargs") HasCommonMaterial;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if common material is defined; False by default.
") HasCommonMaterial;
		bool HasCommonMaterial();

		/****** XCAFDoc_VisMaterial::HasPbrMaterial ******/
		/****** md5 signature: 831bf23489a21d58818ef6937d415881 ******/
		%feature("compactdefaultargs") HasPbrMaterial;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if metal-roughness PBR material is defined; False by default.
") HasPbrMaterial;
		bool HasPbrMaterial();

		/****** XCAFDoc_VisMaterial::ID ******/
		/****** md5 signature: ed9a004ce9c4cfa8dc3750240047c0ab ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Return GUID of this attribute type.
") ID;
		const Standard_GUID & ID();

		/****** XCAFDoc_VisMaterial::IsDoubleSided ******/
		/****** md5 signature: 5fafd40f91813a45c96d2f953873eff9 ******/
		%feature("compactdefaultargs") IsDoubleSided;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDoubleSided;
		bool IsDoubleSided();

		/****** XCAFDoc_VisMaterial::IsEmpty ******/
		/****** md5 signature: 70a41d5fe65955a28167088305fc6991 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if material definition is empty.
") IsEmpty;
		bool IsEmpty();

		/****** XCAFDoc_VisMaterial::IsEqual ******/
		/****** md5 signature: e4a65fc6b05c34e17dced5a3436b6721 ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
theOther: XCAFDoc_VisMaterial

Return
-------
bool

Description
-----------
Compare two materials. Performs deep comparison by actual values - e.g. can be useful for merging materials.
") IsEqual;
		bool IsEqual(const opencascade::handle<XCAFDoc_VisMaterial> & theOther);

		/****** XCAFDoc_VisMaterial::NewEmpty ******/
		/****** md5 signature: 4ebad80fa2cacb9f9e231bbb83a29a98 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
Create a new empty attribute.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** XCAFDoc_VisMaterial::Paste ******/
		/****** md5 signature: fb8daa2e8feeefcefc53122b29046916 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
theInto: TDF_Attribute
theRelTable: TDF_RelocationTable

Return
-------
None

Description
-----------
Paste this attribute into another one. 
Parameter theInto [in/out] target attribute to copy this into 
Input parameter: theRelTable relocation table.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & theInto, const opencascade::handle<TDF_RelocationTable> & theRelTable);

		/****** XCAFDoc_VisMaterial::PbrMaterial ******/
		/****** md5 signature: 70e2786d099bf6b93bcc9776e47c8653 ******/
		%feature("compactdefaultargs") PbrMaterial;
		%feature("autodoc", "Return
-------
XCAFDoc_VisMaterialPBR

Description
-----------
Return metal-roughness PBR material. Note that default constructor creates an empty material (
See also: XCAFDoc_VisMaterialPBR::IsDefined).
") PbrMaterial;
		const XCAFDoc_VisMaterialPBR & PbrMaterial();

		/****** XCAFDoc_VisMaterial::RawName ******/
		/****** md5 signature: 7e81df8d60c046b013b0297615523157 ******/
		%feature("compactdefaultargs") RawName;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Return material name / tag (transient data, not stored in the document).
") RawName;
		const opencascade::handle<TCollection_HAsciiString> & RawName();

		/****** XCAFDoc_VisMaterial::Restore ******/
		/****** md5 signature: a185c1616ee303e3a863a289ca3eba90 ******/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
theWith: TDF_Attribute

Return
-------
None

Description
-----------
Restore attribute from specified state. 
Input parameter: theWith attribute state to restore (copy into this).
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & theWith);

		/****** XCAFDoc_VisMaterial::SetAlphaMode ******/
		/****** md5 signature: a35c1ffccbe6fd2aad5f0674eb0fc256 ******/
		%feature("compactdefaultargs") SetAlphaMode;
		%feature("autodoc", "
Parameters
----------
theMode: Graphic3d_AlphaMode
theCutOff: float (optional, default to 0.5f)

Return
-------
None

Description
-----------
Set alpha mode.
") SetAlphaMode;
		void SetAlphaMode(Graphic3d_AlphaMode theMode, float theCutOff = 0.5f);

		/****** XCAFDoc_VisMaterial::SetCommonMaterial ******/
		/****** md5 signature: 1da963f33b57d451b2018898c979446d ******/
		%feature("compactdefaultargs") SetCommonMaterial;
		%feature("autodoc", "
Parameters
----------
theMaterial: XCAFDoc_VisMaterialCommon

Return
-------
None

Description
-----------
Setup common material.
") SetCommonMaterial;
		void SetCommonMaterial(const XCAFDoc_VisMaterialCommon & theMaterial);

		/****** XCAFDoc_VisMaterial::SetDoubleSided ******/
		/****** md5 signature: d5d9c7d3195af5a49b9c5cdb2fa8b342 ******/
		%feature("compactdefaultargs") SetDoubleSided;
		%feature("autodoc", "
Parameters
----------
theIsDoubleSided: bool

Return
-------
None

Description
-----------
No available documentation.
") SetDoubleSided;
		void SetDoubleSided(bool theIsDoubleSided);

		/****** XCAFDoc_VisMaterial::SetFaceCulling ******/
		/****** md5 signature: cf7dadbbebda38a3c1720b79e3ec6234 ******/
		%feature("compactdefaultargs") SetFaceCulling;
		%feature("autodoc", "
Parameters
----------
theFaceCulling: Graphic3d_TypeOfBackfacingModel

Return
-------
None

Description
-----------
Specifies whether the material is double or single sided.
") SetFaceCulling;
		void SetFaceCulling(Graphic3d_TypeOfBackfacingModel theFaceCulling);

		/****** XCAFDoc_VisMaterial::SetPbrMaterial ******/
		/****** md5 signature: 246f3302fcf9beda6246ed99bc1b8073 ******/
		%feature("compactdefaultargs") SetPbrMaterial;
		%feature("autodoc", "
Parameters
----------
theMaterial: XCAFDoc_VisMaterialPBR

Return
-------
None

Description
-----------
Setup metal-roughness PBR material.
") SetPbrMaterial;
		void SetPbrMaterial(const XCAFDoc_VisMaterialPBR & theMaterial);

		/****** XCAFDoc_VisMaterial::SetRawName ******/
		/****** md5 signature: 9f88ade149954cac32d3dc435506e2f6 ******/
		%feature("compactdefaultargs") SetRawName;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set material name / tag (transient data, not stored in the document).
") SetRawName;
		void SetRawName(const opencascade::handle<TCollection_HAsciiString> & theName);

		/****** XCAFDoc_VisMaterial::UnsetCommonMaterial ******/
		/****** md5 signature: a5b693feebb7383a941684ae5470fefc ******/
		%feature("compactdefaultargs") UnsetCommonMaterial;
		%feature("autodoc", "Return
-------
None

Description
-----------
Setup undefined common material.
") UnsetCommonMaterial;
		void UnsetCommonMaterial();

		/****** XCAFDoc_VisMaterial::UnsetPbrMaterial ******/
		/****** md5 signature: 6eacbffbd2403fc7578046deb6faf1ad ******/
		%feature("compactdefaultargs") UnsetPbrMaterial;
		%feature("autodoc", "Return
-------
None

Description
-----------
Setup undefined metal-roughness PBR material.
") UnsetPbrMaterial;
		void UnsetPbrMaterial();

};


%make_alias(XCAFDoc_VisMaterial)

%extend XCAFDoc_VisMaterial {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class XCAFDoc_VisMaterialCommon *
**********************************/
class XCAFDoc_VisMaterialCommon {
	public:
		/****** XCAFDoc_VisMaterialCommon::XCAFDoc_VisMaterialCommon ******/
		/****** md5 signature: 902673da58471421f95b5ccf0bdee6a3 ******/
		%feature("compactdefaultargs") XCAFDoc_VisMaterialCommon;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") XCAFDoc_VisMaterialCommon;
		 XCAFDoc_VisMaterialCommon();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** XCAFDoc_VisMaterialCommon::IsEqual ******/
		/****** md5 signature: 683a0366ee48b57e05ff551bf589d705 ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
theOther: XCAFDoc_VisMaterialCommon

Return
-------
bool

Description
-----------
Compare two materials.
") IsEqual;
		bool IsEqual(const XCAFDoc_VisMaterialCommon & theOther);

};


%extend XCAFDoc_VisMaterialCommon {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class XCAFDoc_VisMaterialPBR *
*******************************/
class XCAFDoc_VisMaterialPBR {
	public:
		/****** XCAFDoc_VisMaterialPBR::XCAFDoc_VisMaterialPBR ******/
		/****** md5 signature: 11ea295424c444b06892c19d880417c9 ******/
		%feature("compactdefaultargs") XCAFDoc_VisMaterialPBR;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") XCAFDoc_VisMaterialPBR;
		 XCAFDoc_VisMaterialPBR();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** XCAFDoc_VisMaterialPBR::IsEqual ******/
		/****** md5 signature: 02c38e84b0f882dc2b9f785bb60f2b6d ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
theOther: XCAFDoc_VisMaterialPBR

Return
-------
bool

Description
-----------
Compare two materials.
") IsEqual;
		bool IsEqual(const XCAFDoc_VisMaterialPBR & theOther);

};


%extend XCAFDoc_VisMaterialPBR {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class XCAFDoc_VisMaterialTool *
********************************/
class XCAFDoc_VisMaterialTool : public TDF_Attribute {
	public:
		/****** XCAFDoc_VisMaterialTool::XCAFDoc_VisMaterialTool ******/
		/****** md5 signature: 4164cee54ac875c4d3212c58ff9d1585 ******/
		%feature("compactdefaultargs") XCAFDoc_VisMaterialTool;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") XCAFDoc_VisMaterialTool;
		 XCAFDoc_VisMaterialTool();

		/****** XCAFDoc_VisMaterialTool::AddMaterial ******/
		/****** md5 signature: dcff29fb1f77f5df10ee13363d609e28 ******/
		%feature("compactdefaultargs") AddMaterial;
		%feature("autodoc", "
Parameters
----------
theMat: XCAFDoc_VisMaterial
theName: str

Return
-------
TDF_Label

Description
-----------
Adds Material definition to a Material Table and returns its Label.
") AddMaterial;
		TDF_Label AddMaterial(const opencascade::handle<XCAFDoc_VisMaterial> & theMat, TCollection_AsciiString theName);

		/****** XCAFDoc_VisMaterialTool::AddMaterial ******/
		/****** md5 signature: 4f812bc5d327fe3e730676ff3e6dd617 ******/
		%feature("compactdefaultargs") AddMaterial;
		%feature("autodoc", "
Parameters
----------
theName: str

Return
-------
TDF_Label

Description
-----------
Adds Material definition to a Material Table and returns its Label.
") AddMaterial;
		TDF_Label AddMaterial(TCollection_AsciiString theName);

		/****** XCAFDoc_VisMaterialTool::BaseLabel ******/
		/****** md5 signature: 0fb6b1cd40875f3170cd1b9dbe0b46bd ******/
		%feature("compactdefaultargs") BaseLabel;
		%feature("autodoc", "Return
-------
TDF_Label

Description
-----------
returns the label under which colors are stored.
") BaseLabel;
		TDF_Label BaseLabel();

		/****** XCAFDoc_VisMaterialTool::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") GetID;
		static const Standard_GUID & GetID();

		/****** XCAFDoc_VisMaterialTool::GetMaterial ******/
		/****** md5 signature: 694e93123423187642f68fe8d4e64f2a ******/
		%feature("compactdefaultargs") GetMaterial;
		%feature("autodoc", "
Parameters
----------
theMatLabel: TDF_Label

Return
-------
opencascade::handle<XCAFDoc_VisMaterial>

Description
-----------
Returns Material defined by specified Label, or NULL if the label is not in Material Table.
") GetMaterial;
		static opencascade::handle<XCAFDoc_VisMaterial> GetMaterial(const TDF_Label & theMatLabel);

		/****** XCAFDoc_VisMaterialTool::GetMaterials ******/
		/****** md5 signature: 1bfc27534188e7333aac42c0ff48264d ******/
		%feature("compactdefaultargs") GetMaterials;
		%feature("autodoc", "
Parameters
----------
Labels: TDF_LabelSequence

Return
-------
None

Description
-----------
Returns a sequence of Materials currently stored in the Material Table.
") GetMaterials;
		void GetMaterials(TDF_LabelSequence & Labels);

		/****** XCAFDoc_VisMaterialTool::GetShapeMaterial ******/
		/****** md5 signature: e422a802dd9f9698ddcee5f109c13da2 ******/
		%feature("compactdefaultargs") GetShapeMaterial;
		%feature("autodoc", "
Parameters
----------
theShapeLabel: TDF_Label
theMaterialLabel: TDF_Label

Return
-------
bool

Description
-----------
Returns label with material assigned to shape label. 
Input parameter: theShapeLabel shape label @param[out] theMaterialLabel material label 
Return: False if no material is assigned.
") GetShapeMaterial;
		static bool GetShapeMaterial(const TDF_Label & theShapeLabel, TDF_Label & theMaterialLabel);

		/****** XCAFDoc_VisMaterialTool::GetShapeMaterial ******/
		/****** md5 signature: 04847c1ad68cdd465933ffa2a713f244 ******/
		%feature("compactdefaultargs") GetShapeMaterial;
		%feature("autodoc", "
Parameters
----------
theShapeLabel: TDF_Label

Return
-------
opencascade::handle<XCAFDoc_VisMaterial>

Description
-----------
Returns material assigned to the shape label.
") GetShapeMaterial;
		static opencascade::handle<XCAFDoc_VisMaterial> GetShapeMaterial(const TDF_Label & theShapeLabel);

		/****** XCAFDoc_VisMaterialTool::GetShapeMaterial ******/
		/****** md5 signature: 408deb10f59f79a982c5543d9b5f7c94 ******/
		%feature("compactdefaultargs") GetShapeMaterial;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theMaterialLabel: TDF_Label

Return
-------
bool

Description
-----------
Returns label with material assigned to shape. 
Input parameter: theShape shape @param[out] theMaterialLabel material label 
Return: False if no material is assigned.
") GetShapeMaterial;
		bool GetShapeMaterial(const TopoDS_Shape & theShape, TDF_Label & theMaterialLabel);

		/****** XCAFDoc_VisMaterialTool::GetShapeMaterial ******/
		/****** md5 signature: 7a7f0994125f233b322cc60c2fd40844 ******/
		%feature("compactdefaultargs") GetShapeMaterial;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
opencascade::handle<XCAFDoc_VisMaterial>

Description
-----------
Returns material assigned to shape or NULL if not assigned.
") GetShapeMaterial;
		opencascade::handle<XCAFDoc_VisMaterial> GetShapeMaterial(const TopoDS_Shape & theShape);

		/****** XCAFDoc_VisMaterialTool::ID ******/
		/****** md5 signature: ed9a004ce9c4cfa8dc3750240047c0ab ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Returns GUID of this attribute type.
") ID;
		const Standard_GUID & ID();

		/****** XCAFDoc_VisMaterialTool::IsMaterial ******/
		/****** md5 signature: 646cc1de2b9bfe7d43dc5ec7118fa92d ******/
		%feature("compactdefaultargs") IsMaterial;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label

Return
-------
bool

Description
-----------
Returns True if Label belongs to a Material Table.
") IsMaterial;
		bool IsMaterial(const TDF_Label & theLabel);

		/****** XCAFDoc_VisMaterialTool::IsSetShapeMaterial ******/
		/****** md5 signature: b2b60dcc4d2e6856820b3858c9100aab ******/
		%feature("compactdefaultargs") IsSetShapeMaterial;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label

Return
-------
bool

Description
-----------
Returns True if label has a material assignment.
") IsSetShapeMaterial;
		bool IsSetShapeMaterial(const TDF_Label & theLabel);

		/****** XCAFDoc_VisMaterialTool::IsSetShapeMaterial ******/
		/****** md5 signature: a6462fa7ee4364dda391c17930ba095d ******/
		%feature("compactdefaultargs") IsSetShapeMaterial;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
bool

Description
-----------
Returns True if shape has a material assignment.
") IsSetShapeMaterial;
		bool IsSetShapeMaterial(const TopoDS_Shape & theShape);

		/****** XCAFDoc_VisMaterialTool::NewEmpty ******/
		/****** md5 signature: 20840845e8bb6dddd2769aa3f6b04b87 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
Creates new instance of this tool.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** XCAFDoc_VisMaterialTool::Paste ******/
		/****** md5 signature: abb86f226cded3905059a920ebd063c0 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
&: TDF_Attribute
&: TDF_RelocationTable

Return
-------
None

Description
-----------
Does nothing.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute > &, const opencascade::handle<TDF_RelocationTable > &);

		/****** XCAFDoc_VisMaterialTool::RemoveMaterial ******/
		/****** md5 signature: 775c769efa33703b71d57b14aad1c668 ******/
		%feature("compactdefaultargs") RemoveMaterial;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label

Return
-------
None

Description
-----------
Removes Material from the Material Table.
") RemoveMaterial;
		void RemoveMaterial(const TDF_Label & theLabel);

		/****** XCAFDoc_VisMaterialTool::Restore ******/
		/****** md5 signature: 5fb0284b023e9075031975d2732e8200 ******/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
&: TDF_Attribute

Return
-------
None

Description
-----------
Does nothing.
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute > &);

		/****** XCAFDoc_VisMaterialTool::Set ******/
		/****** md5 signature: d22b33d6563c5e4e2eb49ebdf3751fdb ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label

Return
-------
opencascade::handle<XCAFDoc_VisMaterialTool>

Description
-----------
Creates (if not exist) ColorTool.
") Set;
		static opencascade::handle<XCAFDoc_VisMaterialTool> Set(const TDF_Label & L);

		/****** XCAFDoc_VisMaterialTool::SetShapeMaterial ******/
		/****** md5 signature: c02461a59f71e755a5f9e57497ad3b7b ******/
		%feature("compactdefaultargs") SetShapeMaterial;
		%feature("autodoc", "
Parameters
----------
theShapeLabel: TDF_Label
theMaterialLabel: TDF_Label

Return
-------
None

Description
-----------
Sets new material to the shape.
") SetShapeMaterial;
		void SetShapeMaterial(const TDF_Label & theShapeLabel, const TDF_Label & theMaterialLabel);

		/****** XCAFDoc_VisMaterialTool::SetShapeMaterial ******/
		/****** md5 signature: 209f73cda191c563265c86abf92c9094 ******/
		%feature("compactdefaultargs") SetShapeMaterial;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theMaterialLabel: TDF_Label

Return
-------
bool

Description
-----------
Sets a link with GUID XCAFDoc::VisMaterialRefGUID() from shape label to material label. 
Input parameter: theShape shape 
Input parameter: theMaterialLabel material label 
Return: False if cannot find a label for shape.
") SetShapeMaterial;
		bool SetShapeMaterial(const TopoDS_Shape & theShape, const TDF_Label & theMaterialLabel);

		/****** XCAFDoc_VisMaterialTool::ShapeTool ******/
		/****** md5 signature: f3b52ea6763fc2a237d4ce7351722eb2 ******/
		%feature("compactdefaultargs") ShapeTool;
		%feature("autodoc", "Return
-------
opencascade::handle<XCAFDoc_ShapeTool>

Description
-----------
Returns internal XCAFDoc_ShapeTool tool.
") ShapeTool;
		const opencascade::handle<XCAFDoc_ShapeTool> & ShapeTool();

		/****** XCAFDoc_VisMaterialTool::UnSetShapeMaterial ******/
		/****** md5 signature: b6124abd7d901d59c49fc99b537e31d6 ******/
		%feature("compactdefaultargs") UnSetShapeMaterial;
		%feature("autodoc", "
Parameters
----------
theShapeLabel: TDF_Label

Return
-------
None

Description
-----------
Removes a link with GUID XCAFDoc::VisMaterialRefGUID() from shape label to material.
") UnSetShapeMaterial;
		void UnSetShapeMaterial(const TDF_Label & theShapeLabel);

		/****** XCAFDoc_VisMaterialTool::UnSetShapeMaterial ******/
		/****** md5 signature: 4c061f0a407ab30b304d50376c0abb20 ******/
		%feature("compactdefaultargs") UnSetShapeMaterial;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
bool

Description
-----------
Removes a link with GUID XCAFDoc::VisMaterialRefGUID() from shape label to material. 
Return: True if such link existed.
") UnSetShapeMaterial;
		bool UnSetShapeMaterial(const TopoDS_Shape & theShape);

};


%make_alias(XCAFDoc_VisMaterialTool)

%extend XCAFDoc_VisMaterialTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class XCAFDoc_Volume *
***********************/
class XCAFDoc_Volume : public TDataStd_Real {
	public:
		/****** XCAFDoc_Volume::XCAFDoc_Volume ******/
		/****** md5 signature: dbf6d7bd9fbecc3f59a747906bf1fbdf ******/
		%feature("compactdefaultargs") XCAFDoc_Volume;
		%feature("autodoc", "Return
-------
None

Description
-----------
class methods =============.
") XCAFDoc_Volume;
		 XCAFDoc_Volume();

		/****** XCAFDoc_Volume::Dump ******/
		/****** md5 signature: c3832f0735de2bdac14af95fe6ce7de3 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOS: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		Standard_OStream & Dump(std::ostream &OutValue);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** XCAFDoc_Volume::Get ******/
		/****** md5 signature: cdec7cab9884d7fced97581bfac75b03 ******/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Get;
		double Get();

		/****** XCAFDoc_Volume::Get ******/
		/****** md5 signature: bff4649b54a097493f4782a876e16e39 ******/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label

Return
-------
vol: double

Description
-----------
Returns volume as argument returns false if no such attribute at the <label>.
") Get;
		static bool Get(const TDF_Label & label, Standard_Real &OutValue);

		/****** XCAFDoc_Volume::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") GetID;
		static const Standard_GUID & GetID();

		/****** XCAFDoc_Volume::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** XCAFDoc_Volume::Set ******/
		/****** md5 signature: 62938c9af59de680c109a8fa6a87f095 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
vol: double

Return
-------
None

Description
-----------
Sets a value of volume.
") Set;
		void Set(const double vol);

		/****** XCAFDoc_Volume::Set ******/
		/****** md5 signature: 1181fc1e76a80512334f0b8d3121ee8d ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
vol: double

Return
-------
opencascade::handle<XCAFDoc_Volume>

Description
-----------
Find, or create, an Volume attribute and set its value.
") Set;
		static opencascade::handle<XCAFDoc_Volume> Set(const TDF_Label & label, const double vol);

};


%make_alias(XCAFDoc_Volume)

%extend XCAFDoc_Volume {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class hash<XCAFDoc_AssemblyItemId> *
*************************************/
/****************************
* class XCAFDoc_NoteBinData *
****************************/
class XCAFDoc_NoteBinData : public XCAFDoc_Note {
	public:
		/****** XCAFDoc_NoteBinData::XCAFDoc_NoteBinData ******/
		/****** md5 signature: f25e08a0f55dc8c306751fc7d98a29d0 ******/
		%feature("compactdefaultargs") XCAFDoc_NoteBinData;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty binary data note.
") XCAFDoc_NoteBinData;
		 XCAFDoc_NoteBinData();

		/****** XCAFDoc_NoteBinData::Data ******/
		/****** md5 signature: 1e2e9aa81cc2890f224e32ac2309399c ******/
		%feature("compactdefaultargs") Data;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfByte>

Description
-----------
Returns byte data array.
") Data;
		const opencascade::handle<TColStd_HArray1OfByte> & Data();

		/****** XCAFDoc_NoteBinData::Dump ******/
		/****** md5 signature: 93728f1e04c6a4610b0181e40f01badf ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
theOS: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		Standard_OStream & Dump(std::ostream &OutValue);

		/****** XCAFDoc_NoteBinData::Get ******/
		/****** md5 signature: 02af6bbbdbedcc1ca4399ebdbd529b59 ******/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label

Return
-------
opencascade::handle<XCAFDoc_NoteBinData>

Description
-----------
Finds a binary data attribute on the given label and returns it, if it is found.
") Get;
		static opencascade::handle<XCAFDoc_NoteBinData> Get(const TDF_Label & theLabel);

		/****** XCAFDoc_NoteBinData::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Returns default attribute GUID.
") GetID;
		static const Standard_GUID & GetID();

		/****** XCAFDoc_NoteBinData::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** XCAFDoc_NoteBinData::MIMEtype ******/
		/****** md5 signature: fe48efd490314a06c0046b11090ff48d ******/
		%feature("compactdefaultargs") MIMEtype;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns data MIME type.
") MIMEtype;
		const TCollection_AsciiString & MIMEtype();

		/****** XCAFDoc_NoteBinData::NewEmpty ******/
		/****** md5 signature: 4ebad80fa2cacb9f9e231bbb83a29a98 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** XCAFDoc_NoteBinData::Paste ******/
		/****** md5 signature: 613080067c5023e60243d9a07dced7b6 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
theAttrInto: TDF_Attribute
theRT: TDF_RelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & theAttrInto, const opencascade::handle<TDF_RelocationTable> & theRT);

		/****** XCAFDoc_NoteBinData::Restore ******/
		/****** md5 signature: 93ec1c35e22a62dd86fc70c54564a087 ******/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
theAttrFrom: TDF_Attribute

Return
-------
None

Description
-----------
No available documentation.
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & theAttrFrom);

		/****** XCAFDoc_NoteBinData::Set ******/
		/****** md5 signature: 9c3daba24c507f0c878aceba1bebac7f ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label
theUserName: str
theTimeStamp: str
theTitle: str
theMIMEtype: str
theFile: OSD_File

Return
-------
opencascade::handle<XCAFDoc_NoteBinData>

Description
-----------
Create (if not exist) a binary note with data loaded from a binary file. \param[in] theLabel - label to add the attribute. \param[in] theUserName - the name of the user, who created the note. \param[in] theTimeStamp - creation timestamp of the note. \param[in] theTitle - file title. \param[in] theMIMEtype - MIME type of the file. \param[in] theFile - input binary file. eturn A handle to the attribute instance.
") Set;
		static opencascade::handle<XCAFDoc_NoteBinData> Set(const TDF_Label & theLabel, TCollection_ExtendedString theUserName, TCollection_ExtendedString theTimeStamp, TCollection_ExtendedString theTitle, TCollection_AsciiString theMIMEtype, OSD_File & theFile);

		/****** XCAFDoc_NoteBinData::Set ******/
		/****** md5 signature: 3edb440b393d69b83d24ed9240800dc3 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label
theUserName: str
theTimeStamp: str
theTitle: str
theMIMEtype: str
theData: TColStd_HArray1OfByte

Return
-------
opencascade::handle<XCAFDoc_NoteBinData>

Description
-----------
Create (if not exist) a binary note byte data array. \param[in] theLabel - label to add the attribute. \param[in] theUserName - the name of the user, who created the note. \param[in] theTimeStamp - creation timestamp of the note. \param[in] theTitle - data title. \param[in] theMIMEtype - MIME type of data. \param[in] theData - byte data array. eturn A handle to the attribute instance.
") Set;
		static opencascade::handle<XCAFDoc_NoteBinData> Set(const TDF_Label & theLabel, TCollection_ExtendedString theUserName, TCollection_ExtendedString theTimeStamp, TCollection_ExtendedString theTitle, TCollection_AsciiString theMIMEtype, const opencascade::handle<TColStd_HArray1OfByte> & theData);

		/****** XCAFDoc_NoteBinData::Set ******/
		/****** md5 signature: ff8731b2c0afd6180999966d31cd8f1d ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
theTitle: str
theMIMEtype: str
theFile: OSD_File

Return
-------
bool

Description
-----------
Sets title, MIME type and data from a binary file. \param[in] theTitle - file title. \param[in] theMIMEtype - MIME type of the file. \param[in] theFile - input binary file.
") Set;
		bool Set(TCollection_ExtendedString theTitle, TCollection_AsciiString theMIMEtype, OSD_File & theFile);

		/****** XCAFDoc_NoteBinData::Set ******/
		/****** md5 signature: 22776f6ff3374d633c8b77e2a582d8a7 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
theTitle: str
theMIMEtype: str
theData: TColStd_HArray1OfByte

Return
-------
None

Description
-----------
Sets title, MIME type and data from a byte array. \param[in] theTitle - data title. \param[in] theMIMEtype - MIME type of data. \param[in] theData - byte data array.
") Set;
		void Set(TCollection_ExtendedString theTitle, TCollection_AsciiString theMIMEtype, const opencascade::handle<TColStd_HArray1OfByte> & theData);

		/****** XCAFDoc_NoteBinData::Size ******/
		/****** md5 signature: 95fd550d1712c017c7cad2fbb2186e09 ******/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "Return
-------
int

Description
-----------
Size of data in bytes.
") Size;
		int Size();

		/****** XCAFDoc_NoteBinData::Title ******/
		/****** md5 signature: f6908c94b14b08bda1ee947ff0d8b2f6 ******/
		%feature("compactdefaultargs") Title;
		%feature("autodoc", "Return
-------
TCollection_ExtendedString

Description
-----------
Returns the note title.
") Title;
		const TCollection_ExtendedString & Title();

};


%make_alias(XCAFDoc_NoteBinData)

%extend XCAFDoc_NoteBinData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class XCAFDoc_NoteComment *
****************************/
class XCAFDoc_NoteComment : public XCAFDoc_Note {
	public:
		/****** XCAFDoc_NoteComment::XCAFDoc_NoteComment ******/
		/****** md5 signature: 54c6854f670bb44c7c682e1361217cd3 ******/
		%feature("compactdefaultargs") XCAFDoc_NoteComment;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty comment note.
") XCAFDoc_NoteComment;
		 XCAFDoc_NoteComment();

		/****** XCAFDoc_NoteComment::Comment ******/
		/****** md5 signature: f7f4e583b1edea4beb0abba514dedde0 ******/
		%feature("compactdefaultargs") Comment;
		%feature("autodoc", "Return
-------
TCollection_ExtendedString

Description
-----------
Returns the comment text.
") Comment;
		const TCollection_ExtendedString & Comment();

		/****** XCAFDoc_NoteComment::Dump ******/
		/****** md5 signature: 93728f1e04c6a4610b0181e40f01badf ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
theOS: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		Standard_OStream & Dump(std::ostream &OutValue);

		/****** XCAFDoc_NoteComment::Get ******/
		/****** md5 signature: 821f268035461249ad0ec3f1760ab2ea ******/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label

Return
-------
opencascade::handle<XCAFDoc_NoteComment>

Description
-----------
Finds a reference attribute on the given label and returns it, if it is found.
") Get;
		static opencascade::handle<XCAFDoc_NoteComment> Get(const TDF_Label & theLabel);

		/****** XCAFDoc_NoteComment::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Returns default attribute GUID.
") GetID;
		static const Standard_GUID & GetID();

		/****** XCAFDoc_NoteComment::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** XCAFDoc_NoteComment::NewEmpty ******/
		/****** md5 signature: 4ebad80fa2cacb9f9e231bbb83a29a98 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** XCAFDoc_NoteComment::Paste ******/
		/****** md5 signature: 613080067c5023e60243d9a07dced7b6 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
theAttrInto: TDF_Attribute
theRT: TDF_RelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & theAttrInto, const opencascade::handle<TDF_RelocationTable> & theRT);

		/****** XCAFDoc_NoteComment::Restore ******/
		/****** md5 signature: 93ec1c35e22a62dd86fc70c54564a087 ******/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
theAttrFrom: TDF_Attribute

Return
-------
None

Description
-----------
No available documentation.
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & theAttrFrom);

		/****** XCAFDoc_NoteComment::Set ******/
		/****** md5 signature: 14d9ff14f0193d561e7eeee92b2ce149 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label
theUserName: str
theTimeStamp: str
theComment: str

Return
-------
opencascade::handle<XCAFDoc_NoteComment>

Description
-----------
Create (if not exist) a comment note on the given label. \param[in] theLabel - note label. \param[in] theUserName - the name of the user, who created the note. \param[in] theTimeStamp - creation timestamp of the note. \param[in] theComment - comment text.
") Set;
		static opencascade::handle<XCAFDoc_NoteComment> Set(const TDF_Label & theLabel, TCollection_ExtendedString theUserName, TCollection_ExtendedString theTimeStamp, TCollection_ExtendedString theComment);

		/****** XCAFDoc_NoteComment::Set ******/
		/****** md5 signature: 3e473f226231aa9fb962779c514f560d ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
theComment: str

Return
-------
None

Description
-----------
Sets the comment text.
") Set;
		void Set(TCollection_ExtendedString theComment);

};


%make_alias(XCAFDoc_NoteComment)

%extend XCAFDoc_NoteComment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class XCAFDoc_NoteBalloon *
****************************/
class XCAFDoc_NoteBalloon : public XCAFDoc_NoteComment {
	public:
		/****** XCAFDoc_NoteBalloon::XCAFDoc_NoteBalloon ******/
		/****** md5 signature: 4371baf718139887204de6f06f21b14c ******/
		%feature("compactdefaultargs") XCAFDoc_NoteBalloon;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty comment note.
") XCAFDoc_NoteBalloon;
		 XCAFDoc_NoteBalloon();

		/****** XCAFDoc_NoteBalloon::Get ******/
		/****** md5 signature: 0ff3bccea1458ab67896633fc610cdad ******/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label

Return
-------
opencascade::handle<XCAFDoc_NoteBalloon>

Description
-----------
Finds a reference attribute on the given label and returns it, if it is found.
") Get;
		static opencascade::handle<XCAFDoc_NoteBalloon> Get(const TDF_Label & theLabel);

		/****** XCAFDoc_NoteBalloon::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Returns default attribute GUID.
") GetID;
		static const Standard_GUID & GetID();

		/****** XCAFDoc_NoteBalloon::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** XCAFDoc_NoteBalloon::Set ******/
		/****** md5 signature: 1a0b4c33374b4e717ff9247e5c3e3a20 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label
theUserName: str
theTimeStamp: str
theComment: str

Return
-------
opencascade::handle<XCAFDoc_NoteBalloon>

Description
-----------
Create (if not exist) a comment note on the given label. \param[in] theLabel - note label. \param[in] theUserName - the name of the user, who created the note. \param[in] theTimeStamp - creation timestamp of the note. \param[in] theComment - comment text.
") Set;
		static opencascade::handle<XCAFDoc_NoteBalloon> Set(const TDF_Label & theLabel, TCollection_ExtendedString theUserName, TCollection_ExtendedString theTimeStamp, TCollection_ExtendedString theComment);

};


%make_alias(XCAFDoc_NoteBalloon)

%extend XCAFDoc_NoteBalloon {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class XCAFDoc_GeomTolerance:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
XCAFDoc_PartId=OCC.Core.TCollection.TCollection_AsciiString
}
/* deprecated methods */
%pythoncode {
@deprecated
def xcafdoc_AssemblyGUID(*args):
	return xcafdoc.AssemblyGUID(*args)

@deprecated
def xcafdoc_AttributeInfo(*args):
	return xcafdoc.AttributeInfo(*args)

@deprecated
def xcafdoc_ColorByLayerGUID(*args):
	return xcafdoc.ColorByLayerGUID(*args)

@deprecated
def xcafdoc_ColorRefGUID(*args):
	return xcafdoc.ColorRefGUID(*args)

@deprecated
def xcafdoc_DatumRefGUID(*args):
	return xcafdoc.DatumRefGUID(*args)

@deprecated
def xcafdoc_DatumTolRefGUID(*args):
	return xcafdoc.DatumTolRefGUID(*args)

@deprecated
def xcafdoc_DimTolRefGUID(*args):
	return xcafdoc.DimTolRefGUID(*args)

@deprecated
def xcafdoc_DimensionRefFirstGUID(*args):
	return xcafdoc.DimensionRefFirstGUID(*args)

@deprecated
def xcafdoc_DimensionRefSecondGUID(*args):
	return xcafdoc.DimensionRefSecondGUID(*args)

@deprecated
def xcafdoc_ExternRefGUID(*args):
	return xcafdoc.ExternRefGUID(*args)

@deprecated
def xcafdoc_GeomToleranceRefGUID(*args):
	return xcafdoc.GeomToleranceRefGUID(*args)

@deprecated
def xcafdoc_InvisibleGUID(*args):
	return xcafdoc.InvisibleGUID(*args)

@deprecated
def xcafdoc_LayerRefGUID(*args):
	return xcafdoc.LayerRefGUID(*args)

@deprecated
def xcafdoc_LockGUID(*args):
	return xcafdoc.LockGUID(*args)

@deprecated
def xcafdoc_MaterialRefGUID(*args):
	return xcafdoc.MaterialRefGUID(*args)

@deprecated
def xcafdoc_NoteRefGUID(*args):
	return xcafdoc.NoteRefGUID(*args)

@deprecated
def xcafdoc_SHUORefGUID(*args):
	return xcafdoc.SHUORefGUID(*args)

@deprecated
def xcafdoc_ShapeRefGUID(*args):
	return xcafdoc.ShapeRefGUID(*args)

@deprecated
def xcafdoc_ViewRefAnnotationGUID(*args):
	return xcafdoc.ViewRefAnnotationGUID(*args)

@deprecated
def xcafdoc_ViewRefGDTGUID(*args):
	return xcafdoc.ViewRefGDTGUID(*args)

@deprecated
def xcafdoc_ViewRefGUID(*args):
	return xcafdoc.ViewRefGUID(*args)

@deprecated
def xcafdoc_ViewRefNoteGUID(*args):
	return xcafdoc.ViewRefNoteGUID(*args)

@deprecated
def xcafdoc_ViewRefPlaneGUID(*args):
	return xcafdoc.ViewRefPlaneGUID(*args)

@deprecated
def xcafdoc_ViewRefShapeGUID(*args):
	return xcafdoc.ViewRefShapeGUID(*args)

@deprecated
def xcafdoc_VisMaterialRefGUID(*args):
	return xcafdoc.VisMaterialRefGUID(*args)

@deprecated
def XCAFDoc_Area_Get(*args):
	return XCAFDoc_Area.Get(*args)

@deprecated
def XCAFDoc_Area_GetID(*args):
	return XCAFDoc_Area.GetID(*args)

@deprecated
def XCAFDoc_Area_Set(*args):
	return XCAFDoc_Area.Set(*args)

@deprecated
def XCAFDoc_AssemblyItemRef_Get(*args):
	return XCAFDoc_AssemblyItemRef.Get(*args)

@deprecated
def XCAFDoc_AssemblyItemRef_GetID(*args):
	return XCAFDoc_AssemblyItemRef.GetID(*args)

@deprecated
def XCAFDoc_AssemblyItemRef_Set(*args):
	return XCAFDoc_AssemblyItemRef.Set(*args)

@deprecated
def XCAFDoc_AssemblyItemRef_Set(*args):
	return XCAFDoc_AssemblyItemRef.Set(*args)

@deprecated
def XCAFDoc_AssemblyItemRef_Set(*args):
	return XCAFDoc_AssemblyItemRef.Set(*args)

@deprecated
def XCAFDoc_Centroid_Get(*args):
	return XCAFDoc_Centroid.Get(*args)

@deprecated
def XCAFDoc_Centroid_GetID(*args):
	return XCAFDoc_Centroid.GetID(*args)

@deprecated
def XCAFDoc_Centroid_Set(*args):
	return XCAFDoc_Centroid.Set(*args)

@deprecated
def XCAFDoc_ClippingPlaneTool_GetID(*args):
	return XCAFDoc_ClippingPlaneTool.GetID(*args)

@deprecated
def XCAFDoc_ClippingPlaneTool_Set(*args):
	return XCAFDoc_ClippingPlaneTool.Set(*args)

@deprecated
def XCAFDoc_Color_GetID(*args):
	return XCAFDoc_Color.GetID(*args)

@deprecated
def XCAFDoc_Color_Set(*args):
	return XCAFDoc_Color.Set(*args)

@deprecated
def XCAFDoc_Color_Set(*args):
	return XCAFDoc_Color.Set(*args)

@deprecated
def XCAFDoc_Color_Set(*args):
	return XCAFDoc_Color.Set(*args)

@deprecated
def XCAFDoc_Color_Set(*args):
	return XCAFDoc_Color.Set(*args)

@deprecated
def XCAFDoc_ColorTool_AutoNaming(*args):
	return XCAFDoc_ColorTool.AutoNaming(*args)

@deprecated
def XCAFDoc_ColorTool_GetColor(*args):
	return XCAFDoc_ColorTool.GetColor(*args)

@deprecated
def XCAFDoc_ColorTool_GetColor(*args):
	return XCAFDoc_ColorTool.GetColor(*args)

@deprecated
def XCAFDoc_ColorTool_GetColor(*args):
	return XCAFDoc_ColorTool.GetColor(*args)

@deprecated
def XCAFDoc_ColorTool_GetColor(*args):
	return XCAFDoc_ColorTool.GetColor(*args)

@deprecated
def XCAFDoc_ColorTool_GetColor(*args):
	return XCAFDoc_ColorTool.GetColor(*args)

@deprecated
def XCAFDoc_ColorTool_GetID(*args):
	return XCAFDoc_ColorTool.GetID(*args)

@deprecated
def XCAFDoc_ColorTool_IsVisible(*args):
	return XCAFDoc_ColorTool.IsVisible(*args)

@deprecated
def XCAFDoc_ColorTool_Set(*args):
	return XCAFDoc_ColorTool.Set(*args)

@deprecated
def XCAFDoc_ColorTool_SetAutoNaming(*args):
	return XCAFDoc_ColorTool.SetAutoNaming(*args)

@deprecated
def XCAFDoc_Datum_GetID(*args):
	return XCAFDoc_Datum.GetID(*args)

@deprecated
def XCAFDoc_Datum_Set(*args):
	return XCAFDoc_Datum.Set(*args)

@deprecated
def XCAFDoc_Datum_Set(*args):
	return XCAFDoc_Datum.Set(*args)

@deprecated
def XCAFDoc_DimTol_GetID(*args):
	return XCAFDoc_DimTol.GetID(*args)

@deprecated
def XCAFDoc_DimTol_Set(*args):
	return XCAFDoc_DimTol.Set(*args)

@deprecated
def XCAFDoc_DimTolTool_GetDatumOfTolerLabels(*args):
	return XCAFDoc_DimTolTool.GetDatumOfTolerLabels(*args)

@deprecated
def XCAFDoc_DimTolTool_GetDatumWithObjectOfTolerLabels(*args):
	return XCAFDoc_DimTolTool.GetDatumWithObjectOfTolerLabels(*args)

@deprecated
def XCAFDoc_DimTolTool_GetID(*args):
	return XCAFDoc_DimTolTool.GetID(*args)

@deprecated
def XCAFDoc_DimTolTool_GetRefShapeLabel(*args):
	return XCAFDoc_DimTolTool.GetRefShapeLabel(*args)

@deprecated
def XCAFDoc_DimTolTool_Set(*args):
	return XCAFDoc_DimTolTool.Set(*args)

@deprecated
def XCAFDoc_Dimension_GetID(*args):
	return XCAFDoc_Dimension.GetID(*args)

@deprecated
def XCAFDoc_Dimension_Set(*args):
	return XCAFDoc_Dimension.Set(*args)

@deprecated
def XCAFDoc_DocumentTool_CheckClippingPlaneTool(*args):
	return XCAFDoc_DocumentTool.CheckClippingPlaneTool(*args)

@deprecated
def XCAFDoc_DocumentTool_CheckColorTool(*args):
	return XCAFDoc_DocumentTool.CheckColorTool(*args)

@deprecated
def XCAFDoc_DocumentTool_CheckDimTolTool(*args):
	return XCAFDoc_DocumentTool.CheckDimTolTool(*args)

@deprecated
def XCAFDoc_DocumentTool_CheckLayerTool(*args):
	return XCAFDoc_DocumentTool.CheckLayerTool(*args)

@deprecated
def XCAFDoc_DocumentTool_CheckMaterialTool(*args):
	return XCAFDoc_DocumentTool.CheckMaterialTool(*args)

@deprecated
def XCAFDoc_DocumentTool_CheckNotesTool(*args):
	return XCAFDoc_DocumentTool.CheckNotesTool(*args)

@deprecated
def XCAFDoc_DocumentTool_CheckShapeTool(*args):
	return XCAFDoc_DocumentTool.CheckShapeTool(*args)

@deprecated
def XCAFDoc_DocumentTool_CheckViewTool(*args):
	return XCAFDoc_DocumentTool.CheckViewTool(*args)

@deprecated
def XCAFDoc_DocumentTool_CheckVisMaterialTool(*args):
	return XCAFDoc_DocumentTool.CheckVisMaterialTool(*args)

@deprecated
def XCAFDoc_DocumentTool_ClippingPlaneTool(*args):
	return XCAFDoc_DocumentTool.ClippingPlaneTool(*args)

@deprecated
def XCAFDoc_DocumentTool_ClippingPlanesLabel(*args):
	return XCAFDoc_DocumentTool.ClippingPlanesLabel(*args)

@deprecated
def XCAFDoc_DocumentTool_ColorTool(*args):
	return XCAFDoc_DocumentTool.ColorTool(*args)

@deprecated
def XCAFDoc_DocumentTool_ColorsLabel(*args):
	return XCAFDoc_DocumentTool.ColorsLabel(*args)

@deprecated
def XCAFDoc_DocumentTool_DGTsLabel(*args):
	return XCAFDoc_DocumentTool.DGTsLabel(*args)

@deprecated
def XCAFDoc_DocumentTool_DimTolTool(*args):
	return XCAFDoc_DocumentTool.DimTolTool(*args)

@deprecated
def XCAFDoc_DocumentTool_DocLabel(*args):
	return XCAFDoc_DocumentTool.DocLabel(*args)

@deprecated
def XCAFDoc_DocumentTool_GetID(*args):
	return XCAFDoc_DocumentTool.GetID(*args)

@deprecated
def XCAFDoc_DocumentTool_GetLengthUnit(*args):
	return XCAFDoc_DocumentTool.GetLengthUnit(*args)

@deprecated
def XCAFDoc_DocumentTool_GetLengthUnit(*args):
	return XCAFDoc_DocumentTool.GetLengthUnit(*args)

@deprecated
def XCAFDoc_DocumentTool_IsXCAFDocument(*args):
	return XCAFDoc_DocumentTool.IsXCAFDocument(*args)

@deprecated
def XCAFDoc_DocumentTool_LayerTool(*args):
	return XCAFDoc_DocumentTool.LayerTool(*args)

@deprecated
def XCAFDoc_DocumentTool_LayersLabel(*args):
	return XCAFDoc_DocumentTool.LayersLabel(*args)

@deprecated
def XCAFDoc_DocumentTool_MaterialTool(*args):
	return XCAFDoc_DocumentTool.MaterialTool(*args)

@deprecated
def XCAFDoc_DocumentTool_MaterialsLabel(*args):
	return XCAFDoc_DocumentTool.MaterialsLabel(*args)

@deprecated
def XCAFDoc_DocumentTool_NotesLabel(*args):
	return XCAFDoc_DocumentTool.NotesLabel(*args)

@deprecated
def XCAFDoc_DocumentTool_NotesTool(*args):
	return XCAFDoc_DocumentTool.NotesTool(*args)

@deprecated
def XCAFDoc_DocumentTool_Set(*args):
	return XCAFDoc_DocumentTool.Set(*args)

@deprecated
def XCAFDoc_DocumentTool_SetLengthUnit(*args):
	return XCAFDoc_DocumentTool.SetLengthUnit(*args)

@deprecated
def XCAFDoc_DocumentTool_SetLengthUnit(*args):
	return XCAFDoc_DocumentTool.SetLengthUnit(*args)

@deprecated
def XCAFDoc_DocumentTool_ShapeTool(*args):
	return XCAFDoc_DocumentTool.ShapeTool(*args)

@deprecated
def XCAFDoc_DocumentTool_ShapesLabel(*args):
	return XCAFDoc_DocumentTool.ShapesLabel(*args)

@deprecated
def XCAFDoc_DocumentTool_ViewTool(*args):
	return XCAFDoc_DocumentTool.ViewTool(*args)

@deprecated
def XCAFDoc_DocumentTool_ViewsLabel(*args):
	return XCAFDoc_DocumentTool.ViewsLabel(*args)

@deprecated
def XCAFDoc_DocumentTool_VisMaterialLabel(*args):
	return XCAFDoc_DocumentTool.VisMaterialLabel(*args)

@deprecated
def XCAFDoc_DocumentTool_VisMaterialTool(*args):
	return XCAFDoc_DocumentTool.VisMaterialTool(*args)

@deprecated
def XCAFDoc_Editor_CloneMetaData(*args):
	return XCAFDoc_Editor.CloneMetaData(*args)

@deprecated
def XCAFDoc_Editor_CloneShapeLabel(*args):
	return XCAFDoc_Editor.CloneShapeLabel(*args)

@deprecated
def XCAFDoc_Editor_Expand(*args):
	return XCAFDoc_Editor.Expand(*args)

@deprecated
def XCAFDoc_Editor_Expand(*args):
	return XCAFDoc_Editor.Expand(*args)

@deprecated
def XCAFDoc_Editor_Extract(*args):
	return XCAFDoc_Editor.Extract(*args)

@deprecated
def XCAFDoc_Editor_Extract(*args):
	return XCAFDoc_Editor.Extract(*args)

@deprecated
def XCAFDoc_Editor_FilterShapeTree(*args):
	return XCAFDoc_Editor.FilterShapeTree(*args)

@deprecated
def XCAFDoc_Editor_GetChildShapeLabels(*args):
	return XCAFDoc_Editor.GetChildShapeLabels(*args)

@deprecated
def XCAFDoc_Editor_GetParentShapeLabels(*args):
	return XCAFDoc_Editor.GetParentShapeLabels(*args)

@deprecated
def XCAFDoc_Editor_RescaleGeometry(*args):
	return XCAFDoc_Editor.RescaleGeometry(*args)

@deprecated
def XCAFDoc_GraphNode_Find(*args):
	return XCAFDoc_GraphNode.Find(*args)

@deprecated
def XCAFDoc_GraphNode_GetDefaultGraphID(*args):
	return XCAFDoc_GraphNode.GetDefaultGraphID(*args)

@deprecated
def XCAFDoc_GraphNode_Set(*args):
	return XCAFDoc_GraphNode.Set(*args)

@deprecated
def XCAFDoc_GraphNode_Set(*args):
	return XCAFDoc_GraphNode.Set(*args)

@deprecated
def XCAFDoc_LayerTool_GetID(*args):
	return XCAFDoc_LayerTool.GetID(*args)

@deprecated
def XCAFDoc_LayerTool_GetShapesOfLayer(*args):
	return XCAFDoc_LayerTool.GetShapesOfLayer(*args)

@deprecated
def XCAFDoc_LayerTool_Set(*args):
	return XCAFDoc_LayerTool.Set(*args)

@deprecated
def XCAFDoc_LengthUnit_GetID(*args):
	return XCAFDoc_LengthUnit.GetID(*args)

@deprecated
def XCAFDoc_LengthUnit_Set(*args):
	return XCAFDoc_LengthUnit.Set(*args)

@deprecated
def XCAFDoc_LengthUnit_Set(*args):
	return XCAFDoc_LengthUnit.Set(*args)

@deprecated
def XCAFDoc_LengthUnit_Set(*args):
	return XCAFDoc_LengthUnit.Set(*args)

@deprecated
def XCAFDoc_Location_GetID(*args):
	return XCAFDoc_Location.GetID(*args)

@deprecated
def XCAFDoc_Location_Set(*args):
	return XCAFDoc_Location.Set(*args)

@deprecated
def XCAFDoc_Material_GetID(*args):
	return XCAFDoc_Material.GetID(*args)

@deprecated
def XCAFDoc_Material_Set(*args):
	return XCAFDoc_Material.Set(*args)

@deprecated
def XCAFDoc_MaterialTool_GetDensityForShape(*args):
	return XCAFDoc_MaterialTool.GetDensityForShape(*args)

@deprecated
def XCAFDoc_MaterialTool_GetID(*args):
	return XCAFDoc_MaterialTool.GetID(*args)

@deprecated
def XCAFDoc_MaterialTool_GetMaterial(*args):
	return XCAFDoc_MaterialTool.GetMaterial(*args)

@deprecated
def XCAFDoc_MaterialTool_Set(*args):
	return XCAFDoc_MaterialTool.Set(*args)

@deprecated
def XCAFDoc_Note_Get(*args):
	return XCAFDoc_Note.Get(*args)

@deprecated
def XCAFDoc_Note_IsMine(*args):
	return XCAFDoc_Note.IsMine(*args)

@deprecated
def XCAFDoc_NotesTool_GetID(*args):
	return XCAFDoc_NotesTool.GetID(*args)

@deprecated
def XCAFDoc_NotesTool_Set(*args):
	return XCAFDoc_NotesTool.Set(*args)

@deprecated
def XCAFDoc_ShapeMapTool_GetID(*args):
	return XCAFDoc_ShapeMapTool.GetID(*args)

@deprecated
def XCAFDoc_ShapeMapTool_Set(*args):
	return XCAFDoc_ShapeMapTool.Set(*args)

@deprecated
def XCAFDoc_ShapeTool_AutoNaming(*args):
	return XCAFDoc_ShapeTool.AutoNaming(*args)

@deprecated
def XCAFDoc_ShapeTool_DumpShape(*args):
	return XCAFDoc_ShapeTool.DumpShape(*args)

@deprecated
def XCAFDoc_ShapeTool_FindSHUO(*args):
	return XCAFDoc_ShapeTool.FindSHUO(*args)

@deprecated
def XCAFDoc_ShapeTool_GetAllComponentSHUO(*args):
	return XCAFDoc_ShapeTool.GetAllComponentSHUO(*args)

@deprecated
def XCAFDoc_ShapeTool_GetComponents(*args):
	return XCAFDoc_ShapeTool.GetComponents(*args)

@deprecated
def XCAFDoc_ShapeTool_GetExternRefs(*args):
	return XCAFDoc_ShapeTool.GetExternRefs(*args)

@deprecated
def XCAFDoc_ShapeTool_GetID(*args):
	return XCAFDoc_ShapeTool.GetID(*args)

@deprecated
def XCAFDoc_ShapeTool_GetLocation(*args):
	return XCAFDoc_ShapeTool.GetLocation(*args)

@deprecated
def XCAFDoc_ShapeTool_GetOneShape(*args):
	return XCAFDoc_ShapeTool.GetOneShape(*args)

@deprecated
def XCAFDoc_ShapeTool_GetReferredShape(*args):
	return XCAFDoc_ShapeTool.GetReferredShape(*args)

@deprecated
def XCAFDoc_ShapeTool_GetSHUO(*args):
	return XCAFDoc_ShapeTool.GetSHUO(*args)

@deprecated
def XCAFDoc_ShapeTool_GetSHUONextUsage(*args):
	return XCAFDoc_ShapeTool.GetSHUONextUsage(*args)

@deprecated
def XCAFDoc_ShapeTool_GetSHUOUpperUsage(*args):
	return XCAFDoc_ShapeTool.GetSHUOUpperUsage(*args)

@deprecated
def XCAFDoc_ShapeTool_GetShape(*args):
	return XCAFDoc_ShapeTool.GetShape(*args)

@deprecated
def XCAFDoc_ShapeTool_GetShape(*args):
	return XCAFDoc_ShapeTool.GetShape(*args)

@deprecated
def XCAFDoc_ShapeTool_GetSubShapes(*args):
	return XCAFDoc_ShapeTool.GetSubShapes(*args)

@deprecated
def XCAFDoc_ShapeTool_GetUsers(*args):
	return XCAFDoc_ShapeTool.GetUsers(*args)

@deprecated
def XCAFDoc_ShapeTool_IsAssembly(*args):
	return XCAFDoc_ShapeTool.IsAssembly(*args)

@deprecated
def XCAFDoc_ShapeTool_IsComponent(*args):
	return XCAFDoc_ShapeTool.IsComponent(*args)

@deprecated
def XCAFDoc_ShapeTool_IsCompound(*args):
	return XCAFDoc_ShapeTool.IsCompound(*args)

@deprecated
def XCAFDoc_ShapeTool_IsExternRef(*args):
	return XCAFDoc_ShapeTool.IsExternRef(*args)

@deprecated
def XCAFDoc_ShapeTool_IsFree(*args):
	return XCAFDoc_ShapeTool.IsFree(*args)

@deprecated
def XCAFDoc_ShapeTool_IsReference(*args):
	return XCAFDoc_ShapeTool.IsReference(*args)

@deprecated
def XCAFDoc_ShapeTool_IsShape(*args):
	return XCAFDoc_ShapeTool.IsShape(*args)

@deprecated
def XCAFDoc_ShapeTool_IsSimpleShape(*args):
	return XCAFDoc_ShapeTool.IsSimpleShape(*args)

@deprecated
def XCAFDoc_ShapeTool_IsSubShape(*args):
	return XCAFDoc_ShapeTool.IsSubShape(*args)

@deprecated
def XCAFDoc_ShapeTool_NbComponents(*args):
	return XCAFDoc_ShapeTool.NbComponents(*args)

@deprecated
def XCAFDoc_ShapeTool_Set(*args):
	return XCAFDoc_ShapeTool.Set(*args)

@deprecated
def XCAFDoc_ShapeTool_SetAutoNaming(*args):
	return XCAFDoc_ShapeTool.SetAutoNaming(*args)

@deprecated
def XCAFDoc_View_GetID(*args):
	return XCAFDoc_View.GetID(*args)

@deprecated
def XCAFDoc_View_Set(*args):
	return XCAFDoc_View.Set(*args)

@deprecated
def XCAFDoc_ViewTool_GetID(*args):
	return XCAFDoc_ViewTool.GetID(*args)

@deprecated
def XCAFDoc_ViewTool_Set(*args):
	return XCAFDoc_ViewTool.Set(*args)

@deprecated
def XCAFDoc_VisMaterial_GetID(*args):
	return XCAFDoc_VisMaterial.GetID(*args)

@deprecated
def XCAFDoc_VisMaterialTool_GetID(*args):
	return XCAFDoc_VisMaterialTool.GetID(*args)

@deprecated
def XCAFDoc_VisMaterialTool_GetMaterial(*args):
	return XCAFDoc_VisMaterialTool.GetMaterial(*args)

@deprecated
def XCAFDoc_VisMaterialTool_GetShapeMaterial(*args):
	return XCAFDoc_VisMaterialTool.GetShapeMaterial(*args)

@deprecated
def XCAFDoc_VisMaterialTool_GetShapeMaterial(*args):
	return XCAFDoc_VisMaterialTool.GetShapeMaterial(*args)

@deprecated
def XCAFDoc_VisMaterialTool_Set(*args):
	return XCAFDoc_VisMaterialTool.Set(*args)

@deprecated
def XCAFDoc_Volume_Get(*args):
	return XCAFDoc_Volume.Get(*args)

@deprecated
def XCAFDoc_Volume_GetID(*args):
	return XCAFDoc_Volume.GetID(*args)

@deprecated
def XCAFDoc_Volume_Set(*args):
	return XCAFDoc_Volume.Set(*args)

@deprecated
def XCAFDoc_NoteBinData_Get(*args):
	return XCAFDoc_NoteBinData.Get(*args)

@deprecated
def XCAFDoc_NoteBinData_GetID(*args):
	return XCAFDoc_NoteBinData.GetID(*args)

@deprecated
def XCAFDoc_NoteBinData_Set(*args):
	return XCAFDoc_NoteBinData.Set(*args)

@deprecated
def XCAFDoc_NoteBinData_Set(*args):
	return XCAFDoc_NoteBinData.Set(*args)

@deprecated
def XCAFDoc_NoteComment_Get(*args):
	return XCAFDoc_NoteComment.Get(*args)

@deprecated
def XCAFDoc_NoteComment_GetID(*args):
	return XCAFDoc_NoteComment.GetID(*args)

@deprecated
def XCAFDoc_NoteComment_Set(*args):
	return XCAFDoc_NoteComment.Set(*args)

@deprecated
def XCAFDoc_NoteBalloon_Get(*args):
	return XCAFDoc_NoteBalloon.Get(*args)

@deprecated
def XCAFDoc_NoteBalloon_GetID(*args):
	return XCAFDoc_NoteBalloon.GetID(*args)

@deprecated
def XCAFDoc_NoteBalloon_Set(*args):
	return XCAFDoc_NoteBalloon.Set(*args)

}
