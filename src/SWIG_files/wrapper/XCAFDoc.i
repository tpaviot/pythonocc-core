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
%define XCAFDOCDOCSTRING
"XCAFDoc module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_xcafdoc.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


%{
#include<XCAFDoc_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TCollection_module.hxx>
#include<TDF_module.hxx>
#include<TColStd_module.hxx>
#include<gp_module.hxx>
#include<Quantity_module.hxx>
#include<TopoDS_module.hxx>
#include<XCAFDimTolObjects_module.hxx>
#include<TDocStd_module.hxx>
#include<TopLoc_module.hxx>
#include<XCAFNoteObjects_module.hxx>
#include<OSD_module.hxx>
#include<TopTools_module.hxx>
#include<TDataStd_module.hxx>
#include<XCAFView_module.hxx>
#include<Resource_module.hxx>
#include<Message_module.hxx>
#include<CDF_module.hxx>
#include<CDM_module.hxx>
#include<PCDM_module.hxx>
#include<TDF_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TCollection.i
%import TDF.i
%import TColStd.i
%import gp.i
%import Quantity.i
%import TopoDS.i
%import XCAFDimTolObjects.i
%import TDocStd.i
%import TopLoc.i
%import XCAFNoteObjects.i
%import OSD.i
%import TopTools.i
%import TDataStd.i
%import XCAFView.i

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

/* python proy classes for enums */
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
%wrap_handle(XCAFDoc_AssemblyItemRef)
%wrap_handle(XCAFDoc_Centroid)
%wrap_handle(XCAFDoc_ClippingPlaneTool)
%wrap_handle(XCAFDoc_Color)
%wrap_handle(XCAFDoc_ColorTool)
%wrap_handle(XCAFDoc_Datum)
%wrap_handle(XCAFDoc_DimTol)
%wrap_handle(XCAFDoc_Dimension)
%wrap_handle(XCAFDoc_DocumentTool)
%wrap_handle(XCAFDoc_GraphNode)
%wrap_handle(XCAFDoc_LayerTool)
%wrap_handle(XCAFDoc_Location)
%wrap_handle(XCAFDoc_Material)
%wrap_handle(XCAFDoc_MaterialTool)
%wrap_handle(XCAFDoc_Note)
%wrap_handle(XCAFDoc_NotesTool)
%wrap_handle(XCAFDoc_ShapeMapTool)
%wrap_handle(XCAFDoc_ShapeTool)
%wrap_handle(XCAFDoc_View)
%wrap_handle(XCAFDoc_ViewTool)
%wrap_handle(XCAFDoc_Volume)
%wrap_handle(XCAFDoc_NoteBinData)
%wrap_handle(XCAFDoc_NoteComment)
%wrap_handle(XCAFDoc_NoteBalloon)
/* end handles declaration */

/* templates */
%template(XCAFDoc_DataMapOfShapeLabel) NCollection_DataMap<TopoDS_Shape,TDF_Label,TopTools_ShapeMapHasher>;
%template(XCAFDoc_GraphNodeSequence) NCollection_Sequence<opencascade::handle<XCAFDoc_GraphNode>>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap<TopoDS_Shape, TDF_Label, TopTools_ShapeMapHasher>::Iterator XCAFDoc_DataMapIteratorOfDataMapOfShapeLabel;
typedef NCollection_DataMap<TopoDS_Shape, TDF_Label, TopTools_ShapeMapHasher> XCAFDoc_DataMapOfShapeLabel;
typedef NCollection_Sequence<opencascade::handle<XCAFDoc_GraphNode>> XCAFDoc_GraphNodeSequence;
typedef TCollection_AsciiString XCAFDoc_PartId;
/* end typedefs declaration */

/****************
* class XCAFDoc *
****************/
%rename(xcafdoc) XCAFDoc;
class XCAFDoc {
	public:
		/****************** AssemblyGUID ******************/
		%feature("compactdefaultargs") AssemblyGUID;
		%feature("autodoc", "Class for containing graphnodes. returns guid for uattribute identifying assembly.

Returns
-------
Standard_GUID
") AssemblyGUID;
		static const Standard_GUID & AssemblyGUID();

		/****************** ColorByLayerGUID ******************/
		%feature("compactdefaultargs") ColorByLayerGUID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ColorByLayerGUID;
		static const Standard_GUID & ColorByLayerGUID();

		/****************** ColorRefGUID ******************/
		%feature("compactdefaultargs") ColorRefGUID;
		%feature("autodoc", "Return guids for treenode representing specified types of colors.

Parameters
----------
type: XCAFDoc_ColorType

Returns
-------
Standard_GUID
") ColorRefGUID;
		static const Standard_GUID & ColorRefGUID(const XCAFDoc_ColorType type);

		/****************** DatumRefGUID ******************/
		%feature("compactdefaultargs") DatumRefGUID;
		%feature("autodoc", "Return guids for treenode representing specified types of datum.

Returns
-------
Standard_GUID
") DatumRefGUID;
		static const Standard_GUID & DatumRefGUID();

		/****************** DatumTolRefGUID ******************/
		%feature("compactdefaultargs") DatumTolRefGUID;
		%feature("autodoc", "Return guids for treenode representing connections datum-toler.

Returns
-------
Standard_GUID
") DatumTolRefGUID;
		static const Standard_GUID & DatumTolRefGUID();

		/****************** DimTolRefGUID ******************/
		%feature("compactdefaultargs") DimTolRefGUID;
		%feature("autodoc", "Return guids for treenode representing specified types of dgt.

Returns
-------
Standard_GUID
") DimTolRefGUID;
		static const Standard_GUID & DimTolRefGUID();

		/****************** DimensionRefFirstGUID ******************/
		%feature("compactdefaultargs") DimensionRefFirstGUID;
		%feature("autodoc", "Return guids for treenode representing specified types of dimension.

Returns
-------
Standard_GUID
") DimensionRefFirstGUID;
		static const Standard_GUID & DimensionRefFirstGUID();

		/****************** DimensionRefSecondGUID ******************/
		%feature("compactdefaultargs") DimensionRefSecondGUID;
		%feature("autodoc", "Return guids for treenode representing specified types of dimension.

Returns
-------
Standard_GUID
") DimensionRefSecondGUID;
		static const Standard_GUID & DimensionRefSecondGUID();

		/****************** ExternRefGUID ******************/
		%feature("compactdefaultargs") ExternRefGUID;
		%feature("autodoc", "Returns guid for uattribute identifying external reference on no-step file.

Returns
-------
Standard_GUID
") ExternRefGUID;
		static const Standard_GUID & ExternRefGUID();

		/****************** GeomToleranceRefGUID ******************/
		%feature("compactdefaultargs") GeomToleranceRefGUID;
		%feature("autodoc", "Return guids for treenode representing specified types of geomtolerance.

Returns
-------
Standard_GUID
") GeomToleranceRefGUID;
		static const Standard_GUID & GeomToleranceRefGUID();

		/****************** InvisibleGUID ******************/
		%feature("compactdefaultargs") InvisibleGUID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") InvisibleGUID;
		static const Standard_GUID & InvisibleGUID();

		/****************** LayerRefGUID ******************/
		%feature("compactdefaultargs") LayerRefGUID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") LayerRefGUID;
		static const Standard_GUID & LayerRefGUID();

		/****************** LockGUID ******************/
		%feature("compactdefaultargs") LockGUID;
		%feature("autodoc", "Returns guid for uattribute identifying lock flag.

Returns
-------
Standard_GUID
") LockGUID;
		static const Standard_GUID & LockGUID();

		/****************** MaterialRefGUID ******************/
		%feature("compactdefaultargs") MaterialRefGUID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") MaterialRefGUID;
		static const Standard_GUID & MaterialRefGUID();

		/****************** NoteRefGUID ******************/
		%feature("compactdefaultargs") NoteRefGUID;
		%feature("autodoc", "Return guids for representing notes.

Returns
-------
Standard_GUID
") NoteRefGUID;
		static const Standard_GUID & NoteRefGUID();

		/****************** SHUORefGUID ******************/
		%feature("compactdefaultargs") SHUORefGUID;
		%feature("autodoc", "Returns guid for uattribute identifying specified higher usage occurrence.

Returns
-------
Standard_GUID
") SHUORefGUID;
		static const Standard_GUID & SHUORefGUID();

		/****************** ShapeRefGUID ******************/
		%feature("compactdefaultargs") ShapeRefGUID;
		%feature("autodoc", "Returns guid for treenode representing assembly link.

Returns
-------
Standard_GUID
") ShapeRefGUID;
		static const Standard_GUID & ShapeRefGUID();

		/****************** ViewRefAnnotationGUID ******************/
		%feature("compactdefaultargs") ViewRefAnnotationGUID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ViewRefAnnotationGUID;
		static const Standard_GUID & ViewRefAnnotationGUID();

		/****************** ViewRefGDTGUID ******************/
		%feature("compactdefaultargs") ViewRefGDTGUID;
		%feature("autodoc", "Return guids for treenode representing specified types of view.

Returns
-------
Standard_GUID
") ViewRefGDTGUID;
		static const Standard_GUID & ViewRefGDTGUID();

		/****************** ViewRefGUID ******************/
		%feature("compactdefaultargs") ViewRefGUID;
		%feature("autodoc", "Return guids for treenode representing specified types of view.

Returns
-------
Standard_GUID
") ViewRefGUID;
		static const Standard_GUID & ViewRefGUID();

		/****************** ViewRefNoteGUID ******************/
		%feature("compactdefaultargs") ViewRefNoteGUID;
		%feature("autodoc", "Return guids for graphnode representing specified types of view.

Returns
-------
Standard_GUID
") ViewRefNoteGUID;
		static const Standard_GUID & ViewRefNoteGUID();

		/****************** ViewRefPlaneGUID ******************/
		%feature("compactdefaultargs") ViewRefPlaneGUID;
		%feature("autodoc", "Return guids for treenode representing specified types of view.

Returns
-------
Standard_GUID
") ViewRefPlaneGUID;
		static const Standard_GUID & ViewRefPlaneGUID();

		/****************** ViewRefShapeGUID ******************/
		%feature("compactdefaultargs") ViewRefShapeGUID;
		%feature("autodoc", "Return guids for treenode representing specified types of view.

Returns
-------
Standard_GUID
") ViewRefShapeGUID;
		static const Standard_GUID & ViewRefShapeGUID();

};


%extend XCAFDoc {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class XCAFDoc_Area *
*********************/
class XCAFDoc_Area : public TDF_Attribute {
	public:
		/****************** XCAFDoc_Area ******************/
		%feature("compactdefaultargs") XCAFDoc_Area;
		%feature("autodoc", "Class methods =============.

Returns
-------
None
") XCAFDoc_Area;
		 XCAFDoc_Area();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Get;
		Standard_Real Get();

		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Returns volume of area as argument and succes status returns false if no such attribute at the <label>.

Parameters
----------
label: TDF_Label

Returns
-------
area: float
") Get;
		static Standard_Boolean Get(const TDF_Label & label, Standard_Real &OutValue);

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
Into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
With: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets a value of volume.

Parameters
----------
vol: float

Returns
-------
None
") Set;
		void Set(const Standard_Real vol);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Find, or create, an area attribute and set its value.

Parameters
----------
label: TDF_Label
area: float

Returns
-------
opencascade::handle<XCAFDoc_Area>
") Set;
		static opencascade::handle<XCAFDoc_Area> Set(const TDF_Label & label, const Standard_Real area);

};


%make_alias(XCAFDoc_Area)

%extend XCAFDoc_Area {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class XCAFDoc_AssemblyItemId *
*******************************/
class XCAFDoc_AssemblyItemId {
	public:
		class Hasher {};
		/****************** XCAFDoc_AssemblyItemId ******************/
		%feature("compactdefaultargs") XCAFDoc_AssemblyItemId;
		%feature("autodoc", "Constructs an empty item id.

Returns
-------
None
") XCAFDoc_AssemblyItemId;
		 XCAFDoc_AssemblyItemId();

		/****************** XCAFDoc_AssemblyItemId ******************/
		%feature("compactdefaultargs") XCAFDoc_AssemblyItemId;
		%feature("autodoc", "Constructs an item id from a list of strings, where every string is a label entry. \param [in] thepath - list of label entries.

Parameters
----------
thePath: TColStd_ListOfAsciiString

Returns
-------
None
") XCAFDoc_AssemblyItemId;
		 XCAFDoc_AssemblyItemId(const TColStd_ListOfAsciiString & thePath);

		/****************** XCAFDoc_AssemblyItemId ******************/
		%feature("compactdefaultargs") XCAFDoc_AssemblyItemId;
		%feature("autodoc", "Constructs an item id from a formatted path, where label entries are separated by '/' symbol. \param [in] thestring - formatted full path.

Parameters
----------
theString: TCollection_AsciiString

Returns
-------
None
") XCAFDoc_AssemblyItemId;
		 XCAFDoc_AssemblyItemId(const TCollection_AsciiString & theString);

		/****************** GetPath ******************/
		%feature("compactdefaultargs") GetPath;
		%feature("autodoc", "Returns the full path as a list of label entries.

Returns
-------
TColStd_ListOfAsciiString
") GetPath;
		const TColStd_ListOfAsciiString & GetPath();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes the item id from a list of strings, where every string is a label entry. \param [in] thepath - list of label entries.

Parameters
----------
thePath: TColStd_ListOfAsciiString

Returns
-------
None
") Init;
		void Init(const TColStd_ListOfAsciiString & thePath);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes the item id from a formatted path, where label entries are separated by '/' symbol. \param [in] thestring - formatted full path.

Parameters
----------
theString: TCollection_AsciiString

Returns
-------
None
") Init;
		void Init(const TCollection_AsciiString & theString);

		/****************** IsChild ******************/
		%feature("compactdefaultargs") IsChild;
		%feature("autodoc", "Checks if this item is a child of the given item. \param [in] theother - potentially ancestor item. eturn true if the item is a child of theother item, otherwise - false.

Parameters
----------
theOther: XCAFDoc_AssemblyItemId

Returns
-------
bool
") IsChild;
		Standard_Boolean IsChild(const XCAFDoc_AssemblyItemId & theOther);

		/****************** IsDirectChild ******************/
		%feature("compactdefaultargs") IsDirectChild;
		%feature("autodoc", "Checks if this item is a direct child of the given item. \param [in] theother - potentially parent item. eturn true if the item is a direct child of theother item, otherwise - false.

Parameters
----------
theOther: XCAFDoc_AssemblyItemId

Returns
-------
bool
") IsDirectChild;
		Standard_Boolean IsDirectChild(const XCAFDoc_AssemblyItemId & theOther);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Checks for item ids equality. \param [in] theother - the item id to check equality with. eturn true if this id is equal to theother, otherwise - false.

Parameters
----------
theOther: XCAFDoc_AssemblyItemId

Returns
-------
bool
") IsEqual;
		Standard_Boolean IsEqual(const XCAFDoc_AssemblyItemId & theOther);

		/****************** IsNull ******************/
		%feature("compactdefaultargs") IsNull;
		%feature("autodoc", "Returns true if the full path is empty, otherwise - false.

Returns
-------
bool
") IsNull;
		Standard_Boolean IsNull();

		/****************** Nullify ******************/
		%feature("compactdefaultargs") Nullify;
		%feature("autodoc", "Clears the full path.

Returns
-------
None
") Nullify;
		void Nullify();

		/****************** ToString ******************/
		%feature("compactdefaultargs") ToString;
		%feature("autodoc", "Returns the full pass as a formatted string.

Returns
-------
TCollection_AsciiString
") ToString;
		TCollection_AsciiString ToString();

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
		/****************** XCAFDoc_AssemblyItemRef ******************/
		%feature("compactdefaultargs") XCAFDoc_AssemblyItemRef;
		%feature("autodoc", "Creates an empty reference attribute.

Returns
-------
None
") XCAFDoc_AssemblyItemRef;
		 XCAFDoc_AssemblyItemRef();

		/****************** ClearExtraRef ******************/
		%feature("compactdefaultargs") ClearExtraRef;
		%feature("autodoc", "Reverts the reference to empty state.

Returns
-------
None
") ClearExtraRef;
		void ClearExtraRef();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Finds a reference attribute on the given label and returns it, if it is found.

Parameters
----------
theLabel: TDF_Label

Returns
-------
opencascade::handle<XCAFDoc_AssemblyItemRef>
") Get;
		static opencascade::handle<XCAFDoc_AssemblyItemRef> Get(const TDF_Label & theLabel);

		/****************** GetGUID ******************/
		%feature("compactdefaultargs") GetGUID;
		%feature("autodoc", "Returns the assembly item's attribute that the reference points to. if the reference doesn't point to an attribute, returns an empty guid.

Returns
-------
Standard_GUID
") GetGUID;
		Standard_GUID GetGUID();

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** GetItem ******************/
		%feature("compactdefaultargs") GetItem;
		%feature("autodoc", "Returns the assembly item id that the reference points to.

Returns
-------
XCAFDoc_AssemblyItemId
") GetItem;
		const XCAFDoc_AssemblyItemId & GetItem();

		/****************** GetSubshapeIndex ******************/
		%feature("compactdefaultargs") GetSubshapeIndex;
		%feature("autodoc", "Returns the assembly item's subshape that the reference points to. if the reference doesn't point to a subshape, returns 0.

Returns
-------
int
") GetSubshapeIndex;
		Standard_Integer GetSubshapeIndex();

		/****************** HasExtraRef ******************/
		%feature("compactdefaultargs") HasExtraRef;
		%feature("autodoc", "Checks if the reference points on an item's shapeindex or attribute.

Returns
-------
bool
") HasExtraRef;
		Standard_Boolean HasExtraRef();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** IsGUID ******************/
		%feature("compactdefaultargs") IsGUID;
		%feature("autodoc", "Checks is the reference points to an item's attribute.

Returns
-------
bool
") IsGUID;
		Standard_Boolean IsGUID();

		/****************** IsOrphan ******************/
		%feature("compactdefaultargs") IsOrphan;
		%feature("autodoc", "Checks if the reference points to a really existing item in xde document.

Returns
-------
bool
") IsOrphan;
		Standard_Boolean IsOrphan();

		/****************** IsSubshapeIndex ******************/
		%feature("compactdefaultargs") IsSubshapeIndex;
		%feature("autodoc", "Checks is the reference points to an item's subshape.

Returns
-------
bool
") IsSubshapeIndex;
		Standard_Boolean IsSubshapeIndex();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
theAttrInto: TDF_Attribute
theRT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & theAttrInto, const opencascade::handle<TDF_RelocationTable> & theRT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
theAttrFrom: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & theAttrFrom);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Create (if not exist) a reference to an assembly item. \param [in] thelabel - label to add the attribute. \param [in] theitemid - assembly item id. eturn a handle to the attribute instance.

Parameters
----------
theLabel: TDF_Label
theItemId: XCAFDoc_AssemblyItemId

Returns
-------
opencascade::handle<XCAFDoc_AssemblyItemRef>
") Set;
		static opencascade::handle<XCAFDoc_AssemblyItemRef> Set(const TDF_Label & theLabel, const XCAFDoc_AssemblyItemId & theItemId);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Create (if not exist) a reference to an assembly item's label attribute. \param [in] thelabel - label to add the attribute. \param [in] theitemid - assembly item id. \param [in] theguid - assembly item's label attribute id. eturn a handle to the attribute instance.

Parameters
----------
theLabel: TDF_Label
theItemId: XCAFDoc_AssemblyItemId
theGUID: Standard_GUID

Returns
-------
opencascade::handle<XCAFDoc_AssemblyItemRef>
") Set;
		static opencascade::handle<XCAFDoc_AssemblyItemRef> Set(const TDF_Label & theLabel, const XCAFDoc_AssemblyItemId & theItemId, const Standard_GUID & theGUID);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Create (if not exist) a reference to an assembly item's subshape. \param [in] thelabel - label to add the attribute. \param [in] theitemid - assembly item id. \param [in] theshapeindex - assembly item's subshape index. eturn a handle to the attribute instance.

Parameters
----------
theLabel: TDF_Label
theItemId: XCAFDoc_AssemblyItemId
theShapeIndex: int

Returns
-------
opencascade::handle<XCAFDoc_AssemblyItemRef>
") Set;
		static opencascade::handle<XCAFDoc_AssemblyItemRef> Set(const TDF_Label & theLabel, const XCAFDoc_AssemblyItemId & theItemId, const Standard_Integer theShapeIndex);

		/****************** SetGUID ******************/
		%feature("compactdefaultargs") SetGUID;
		%feature("autodoc", "Sets the assembly item's label attribute that the reference points to. the base assembly item will not change.

Parameters
----------
theAttrGUID: Standard_GUID

Returns
-------
None
") SetGUID;
		void SetGUID(const Standard_GUID & theAttrGUID);

		/****************** SetItem ******************/
		%feature("compactdefaultargs") SetItem;
		%feature("autodoc", "Sets the assembly item id that the reference points to. extra reference data (if any) will be cleared.

Parameters
----------
theItemId: XCAFDoc_AssemblyItemId

Returns
-------
None
") SetItem;
		void SetItem(const XCAFDoc_AssemblyItemId & theItemId);

		/****************** SetItem ******************/
		%feature("compactdefaultargs") SetItem;
		%feature("autodoc", "Sets the assembly item id from a list of label entries that the reference points to. extra reference data (if any) will be cleared.

Parameters
----------
thePath: TColStd_ListOfAsciiString

Returns
-------
None
") SetItem;
		void SetItem(const TColStd_ListOfAsciiString & thePath);

		/****************** SetItem ******************/
		%feature("compactdefaultargs") SetItem;
		%feature("autodoc", "Sets the assembly item id from a formatted path that the reference points to. extra reference data (if any) will be cleared.

Parameters
----------
theString: TCollection_AsciiString

Returns
-------
None
") SetItem;
		void SetItem(const TCollection_AsciiString & theString);

		/****************** SetSubshapeIndex ******************/
		%feature("compactdefaultargs") SetSubshapeIndex;
		%feature("autodoc", "Sets the assembly item's subshape that the reference points to. the base assembly item will not change.

Parameters
----------
theShapeIndex: int

Returns
-------
None
") SetSubshapeIndex;
		void SetSubshapeIndex(Standard_Integer theShapeIndex);

};


%make_alias(XCAFDoc_AssemblyItemRef)

%extend XCAFDoc_AssemblyItemRef {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class XCAFDoc_Centroid *
*************************/
class XCAFDoc_Centroid : public TDF_Attribute {
	public:
		/****************** XCAFDoc_Centroid ******************/
		%feature("compactdefaultargs") XCAFDoc_Centroid;
		%feature("autodoc", "Class methods =============.

Returns
-------
None
") XCAFDoc_Centroid;
		 XCAFDoc_Centroid();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") Get;
		gp_Pnt Get();

		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Returns point as argument returns false if no such attribute at the <label>.

Parameters
----------
label: TDF_Label
pnt: gp_Pnt

Returns
-------
bool
") Get;
		static Standard_Boolean Get(const TDF_Label & label, gp_Pnt & pnt);

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
Into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
With: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Find, or create, a location attribute and set it's value the location attribute is returned. location methods ===============.

Parameters
----------
label: TDF_Label
pnt: gp_Pnt

Returns
-------
opencascade::handle<XCAFDoc_Centroid>
") Set;
		static opencascade::handle<XCAFDoc_Centroid> Set(const TDF_Label & label, const gp_Pnt & pnt);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
pnt: gp_Pnt

Returns
-------
None
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
class XCAFDoc_ClippingPlaneTool : public TDF_Attribute {
	public:
		/****************** XCAFDoc_ClippingPlaneTool ******************/
		%feature("compactdefaultargs") XCAFDoc_ClippingPlaneTool;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") XCAFDoc_ClippingPlaneTool;
		 XCAFDoc_ClippingPlaneTool();

		/****************** AddClippingPlane ******************/
		%feature("compactdefaultargs") AddClippingPlane;
		%feature("autodoc", "Adds a clipping plane definition to a clippingplane table and returns its label (returns existing label if the same clipping plane is already defined).

Parameters
----------
thePlane: gp_Pln
theName: TCollection_ExtendedString
theCapping: bool

Returns
-------
TDF_Label
") AddClippingPlane;
		TDF_Label AddClippingPlane(const gp_Pln thePlane, const TCollection_ExtendedString theName, const Standard_Boolean theCapping);

		/****************** AddClippingPlane ******************/
		%feature("compactdefaultargs") AddClippingPlane;
		%feature("autodoc", "Adds a clipping plane definition to a clippingplane table and returns its label (returns existing label if the same clipping plane is already defined).

Parameters
----------
thePlane: gp_Pln
theName: TCollection_HAsciiString
theCapping: bool

Returns
-------
TDF_Label
") AddClippingPlane;
		TDF_Label AddClippingPlane(const gp_Pln thePlane, const opencascade::handle<TCollection_HAsciiString> & theName, const Standard_Boolean theCapping);

		/****************** AddClippingPlane ******************/
		%feature("compactdefaultargs") AddClippingPlane;
		%feature("autodoc", "Adds a clipping plane definition to a clippingplane table and returns its label (returns existing label if the same clipping plane is already defined).

Parameters
----------
thePlane: gp_Pln
theName: TCollection_ExtendedString

Returns
-------
TDF_Label
") AddClippingPlane;
		TDF_Label AddClippingPlane(const gp_Pln thePlane, const TCollection_ExtendedString theName);

		/****************** AddClippingPlane ******************/
		%feature("compactdefaultargs") AddClippingPlane;
		%feature("autodoc", "Adds a clipping plane definition to a clippingplane table and returns its label (returns existing label if the same clipping plane is already defined).

Parameters
----------
thePlane: gp_Pln
theName: TCollection_HAsciiString

Returns
-------
TDF_Label
") AddClippingPlane;
		TDF_Label AddClippingPlane(const gp_Pln thePlane, const opencascade::handle<TCollection_HAsciiString> & theName);

		/****************** BaseLabel ******************/
		%feature("compactdefaultargs") BaseLabel;
		%feature("autodoc", "Returns the label under which clippingplanes are stored.

Returns
-------
TDF_Label
") BaseLabel;
		TDF_Label BaseLabel();

		/****************** GetCapping ******************/
		%feature("compactdefaultargs") GetCapping;
		%feature("autodoc", "Get capping value for given clipping plane label return capping value.

Parameters
----------
theClippingPlaneL: TDF_Label

Returns
-------
bool
") GetCapping;
		Standard_Boolean GetCapping(const TDF_Label & theClippingPlaneL);

		/****************** GetCapping ******************/
		%feature("compactdefaultargs") GetCapping;
		%feature("autodoc", "Get capping value for given clipping plane label return true if label is valid abd capping is exist.

Parameters
----------
theClippingPlaneL: TDF_Label

Returns
-------
theCapping: bool
") GetCapping;
		Standard_Boolean GetCapping(const TDF_Label & theClippingPlaneL, Standard_Boolean &OutValue);

		/****************** GetClippingPlane ******************/
		%feature("compactdefaultargs") GetClippingPlane;
		%feature("autodoc", "Returns clippingplane defined by label lab returns false if the label is not in clippingplane table or does not define a clippingplane.

Parameters
----------
theLabel: TDF_Label
thePlane: gp_Pln
theName: TCollection_ExtendedString

Returns
-------
theCapping: bool
") GetClippingPlane;
		Standard_Boolean GetClippingPlane(const TDF_Label & theLabel, gp_Pln & thePlane, TCollection_ExtendedString & theName, Standard_Boolean &OutValue);

		/****************** GetClippingPlane ******************/
		%feature("compactdefaultargs") GetClippingPlane;
		%feature("autodoc", "Returns clippingplane defined by label lab returns false if the label is not in clippingplane table or does not define a clippingplane.

Parameters
----------
theLabel: TDF_Label
thePlane: gp_Pln
theName: TCollection_HAsciiString

Returns
-------
theCapping: bool
") GetClippingPlane;
		Standard_Boolean GetClippingPlane(const TDF_Label & theLabel, gp_Pln & thePlane, opencascade::handle<TCollection_HAsciiString> & theName, Standard_Boolean &OutValue);

		/****************** GetClippingPlanes ******************/
		%feature("compactdefaultargs") GetClippingPlanes;
		%feature("autodoc", "Returns a sequence of clipping planes currently stored in the clippingplane table.

Parameters
----------
Labels: TDF_LabelSequence

Returns
-------
None
") GetClippingPlanes;
		void GetClippingPlanes(TDF_LabelSequence & Labels);

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** IsClippingPlane ******************/
		%feature("compactdefaultargs") IsClippingPlane;
		%feature("autodoc", "Returns true if label belongs to a clippingplane table and is a clippingplane definition.

Parameters
----------
theLabel: TDF_Label

Returns
-------
bool
") IsClippingPlane;
		Standard_Boolean IsClippingPlane(const TDF_Label & theLabel);

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** RemoveClippingPlane ******************/
		%feature("compactdefaultargs") RemoveClippingPlane;
		%feature("autodoc", "Removes clipping plane from the clippingplane table return false and do nothing if clipping plane is referenced in at least one view.

Parameters
----------
theLabel: TDF_Label

Returns
-------
bool
") RemoveClippingPlane;
		Standard_Boolean RemoveClippingPlane(const TDF_Label & theLabel);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
with: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & with);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Creates (if not exist) clippingplanetool.

Parameters
----------
theLabel: TDF_Label

Returns
-------
opencascade::handle<XCAFDoc_ClippingPlaneTool>
") Set;
		static opencascade::handle<XCAFDoc_ClippingPlaneTool> Set(const TDF_Label & theLabel);

		/****************** SetCapping ******************/
		%feature("compactdefaultargs") SetCapping;
		%feature("autodoc", "Set new value of capping for given clipping plane label.

Parameters
----------
theClippingPlaneL: TDF_Label
theCapping: bool

Returns
-------
None
") SetCapping;
		void SetCapping(const TDF_Label & theClippingPlaneL, const Standard_Boolean theCapping);

		/****************** UpdateClippingPlane ******************/
		%feature("compactdefaultargs") UpdateClippingPlane;
		%feature("autodoc", "Sets new value of plane and name to the given clipping plane label or do nothing, if the given label is not a clipping plane label.

Parameters
----------
theLabelL: TDF_Label
thePlane: gp_Pln
theName: TCollection_ExtendedString

Returns
-------
None
") UpdateClippingPlane;
		void UpdateClippingPlane(const TDF_Label & theLabelL, const gp_Pln thePlane, const TCollection_ExtendedString theName);

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
		/****************** XCAFDoc_Color ******************/
		%feature("compactdefaultargs") XCAFDoc_Color;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") XCAFDoc_Color;
		 XCAFDoc_Color();

		/****************** GetAlpha ******************/
		%feature("compactdefaultargs") GetAlpha;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_ShortReal
") GetAlpha;
		Standard_ShortReal GetAlpha();

		/****************** GetColor ******************/
		%feature("compactdefaultargs") GetColor;
		%feature("autodoc", "No available documentation.

Returns
-------
Quantity_Color
") GetColor;
		const Quantity_Color & GetColor();

		/****************** GetColorRGBA ******************/
		%feature("compactdefaultargs") GetColorRGBA;
		%feature("autodoc", "No available documentation.

Returns
-------
Quantity_ColorRGBA
") GetColorRGBA;
		const Quantity_ColorRGBA & GetColorRGBA();

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** GetNOC ******************/
		%feature("compactdefaultargs") GetNOC;
		%feature("autodoc", "No available documentation.

Returns
-------
Quantity_NameOfColor
") GetNOC;
		Quantity_NameOfColor GetNOC();

		/****************** GetRGB ******************/
		%feature("compactdefaultargs") GetRGB;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
R: float
G: float
B: float
") GetRGB;
		void GetRGB(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
Into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
With: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
label: TDF_Label
C: Quantity_Color

Returns
-------
opencascade::handle<XCAFDoc_Color>
") Set;
		static opencascade::handle<XCAFDoc_Color> Set(const TDF_Label & label, const Quantity_Color & C);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
label: TDF_Label
C: Quantity_ColorRGBA

Returns
-------
opencascade::handle<XCAFDoc_Color>
") Set;
		static opencascade::handle<XCAFDoc_Color> Set(const TDF_Label & label, const Quantity_ColorRGBA & C);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
label: TDF_Label
C: Quantity_NameOfColor

Returns
-------
opencascade::handle<XCAFDoc_Color>
") Set;
		static opencascade::handle<XCAFDoc_Color> Set(const TDF_Label & label, const Quantity_NameOfColor C);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Find, or create, a color attribute and set it's value the color attribute is returned.

Parameters
----------
label: TDF_Label
R: float
G: float
B: float
alpha: float,optional
	default value is 1.0

Returns
-------
opencascade::handle<XCAFDoc_Color>
") Set;
		static opencascade::handle<XCAFDoc_Color> Set(const TDF_Label & label, const Standard_Real R, const Standard_Real G, const Standard_Real B, const Standard_Real alpha = 1.0);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Quantity_Color

Returns
-------
None
") Set;
		void Set(const Quantity_Color & C);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Quantity_ColorRGBA

Returns
-------
None
") Set;
		void Set(const Quantity_ColorRGBA & C);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Quantity_NameOfColor

Returns
-------
None
") Set;
		void Set(const Quantity_NameOfColor C);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
R: float
G: float
B: float
alpha: float,optional
	default value is 1.0

Returns
-------
None
") Set;
		void Set(const Standard_Real R, const Standard_Real G, const Standard_Real B, const Standard_Real alpha = 1.0);

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
class XCAFDoc_ColorTool : public TDF_Attribute {
	public:
		/****************** XCAFDoc_ColorTool ******************/
		%feature("compactdefaultargs") XCAFDoc_ColorTool;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") XCAFDoc_ColorTool;
		 XCAFDoc_ColorTool();

		/****************** AddColor ******************/
		%feature("compactdefaultargs") AddColor;
		%feature("autodoc", "Adds a color definition to a colortable and returns its label (returns existing label if the same color is already defined).

Parameters
----------
col: Quantity_Color

Returns
-------
TDF_Label
") AddColor;
		TDF_Label AddColor(const Quantity_Color & col);

		/****************** AddColor ******************/
		%feature("compactdefaultargs") AddColor;
		%feature("autodoc", "Adds a color definition to a colortable and returns its label (returns existing label if the same color is already defined).

Parameters
----------
col: Quantity_ColorRGBA

Returns
-------
TDF_Label
") AddColor;
		TDF_Label AddColor(const Quantity_ColorRGBA & col);

		/****************** BaseLabel ******************/
		%feature("compactdefaultargs") BaseLabel;
		%feature("autodoc", "Returns the label under which colors are stored.

Returns
-------
TDF_Label
") BaseLabel;
		TDF_Label BaseLabel();

		/****************** FindColor ******************/
		%feature("compactdefaultargs") FindColor;
		%feature("autodoc", "Finds a color definition in a colortable and returns its label if found returns false if color is not found in colortable.

Parameters
----------
col: Quantity_Color
lab: TDF_Label

Returns
-------
bool
") FindColor;
		Standard_Boolean FindColor(const Quantity_Color & col, TDF_Label & lab);

		/****************** FindColor ******************/
		%feature("compactdefaultargs") FindColor;
		%feature("autodoc", "Finds a color definition in a colortable and returns its label if found returns false if color is not found in colortable.

Parameters
----------
col: Quantity_ColorRGBA
lab: TDF_Label

Returns
-------
bool
") FindColor;
		Standard_Boolean FindColor(const Quantity_ColorRGBA & col, TDF_Label & lab);

		/****************** FindColor ******************/
		%feature("compactdefaultargs") FindColor;
		%feature("autodoc", "Finds a color definition in a colortable and returns its label if found (or null label else).

Parameters
----------
col: Quantity_Color

Returns
-------
TDF_Label
") FindColor;
		TDF_Label FindColor(const Quantity_Color & col);

		/****************** FindColor ******************/
		%feature("compactdefaultargs") FindColor;
		%feature("autodoc", "Finds a color definition in a colortable and returns its label if found (or null label else).

Parameters
----------
col: Quantity_ColorRGBA

Returns
-------
TDF_Label
") FindColor;
		TDF_Label FindColor(const Quantity_ColorRGBA & col);

		/****************** GetColor ******************/
		%feature("compactdefaultargs") GetColor;
		%feature("autodoc", "Returns color defined by label lab returns false if the label is not in colortable or does not define a color.

Parameters
----------
lab: TDF_Label
col: Quantity_Color

Returns
-------
bool
") GetColor;
		Standard_Boolean GetColor(const TDF_Label & lab, Quantity_Color & col);

		/****************** GetColor ******************/
		%feature("compactdefaultargs") GetColor;
		%feature("autodoc", "Returns color defined by label lab returns false if the label is not in colortable or does not define a color.

Parameters
----------
lab: TDF_Label
col: Quantity_ColorRGBA

Returns
-------
bool
") GetColor;
		Standard_Boolean GetColor(const TDF_Label & lab, Quantity_ColorRGBA & col);

		/****************** GetColor ******************/
		%feature("compactdefaultargs") GetColor;
		%feature("autodoc", "Returns label with color assigned to <l> as <type> returns false if no such color is assigned.

Parameters
----------
L: TDF_Label
type: XCAFDoc_ColorType
colorL: TDF_Label

Returns
-------
bool
") GetColor;
		static Standard_Boolean GetColor(const TDF_Label & L, const XCAFDoc_ColorType type, TDF_Label & colorL);

		/****************** GetColor ******************/
		%feature("compactdefaultargs") GetColor;
		%feature("autodoc", "Returns color assigned to <l> as <type> returns false if no such color is assigned.

Parameters
----------
L: TDF_Label
type: XCAFDoc_ColorType
color: Quantity_Color

Returns
-------
bool
") GetColor;
		Standard_Boolean GetColor(const TDF_Label & L, const XCAFDoc_ColorType type, Quantity_Color & color);

		/****************** GetColor ******************/
		%feature("compactdefaultargs") GetColor;
		%feature("autodoc", "Returns color assigned to <l> as <type> returns false if no such color is assigned.

Parameters
----------
L: TDF_Label
type: XCAFDoc_ColorType
color: Quantity_ColorRGBA

Returns
-------
bool
") GetColor;
		Standard_Boolean GetColor(const TDF_Label & L, const XCAFDoc_ColorType type, Quantity_ColorRGBA & color);

		/****************** GetColor ******************/
		%feature("compactdefaultargs") GetColor;
		%feature("autodoc", "Returns label with color assigned to <l> as <type> returns false if no such color is assigned.

Parameters
----------
S: TopoDS_Shape
type: XCAFDoc_ColorType
colorL: TDF_Label

Returns
-------
bool
") GetColor;
		Standard_Boolean GetColor(const TopoDS_Shape & S, const XCAFDoc_ColorType type, TDF_Label & colorL);

		/****************** GetColor ******************/
		%feature("compactdefaultargs") GetColor;
		%feature("autodoc", "Returns color assigned to <l> as <type> returns false if no such color is assigned.

Parameters
----------
S: TopoDS_Shape
type: XCAFDoc_ColorType
color: Quantity_Color

Returns
-------
bool
") GetColor;
		Standard_Boolean GetColor(const TopoDS_Shape & S, const XCAFDoc_ColorType type, Quantity_Color & color);

		/****************** GetColor ******************/
		%feature("compactdefaultargs") GetColor;
		%feature("autodoc", "Returns color assigned to <l> as <type> returns false if no such color is assigned.

Parameters
----------
S: TopoDS_Shape
type: XCAFDoc_ColorType
color: Quantity_ColorRGBA

Returns
-------
bool
") GetColor;
		Standard_Boolean GetColor(const TopoDS_Shape & S, const XCAFDoc_ColorType type, Quantity_ColorRGBA & color);

		/****************** GetColors ******************/
		%feature("compactdefaultargs") GetColors;
		%feature("autodoc", "Returns a sequence of colors currently stored in the colortable.

Parameters
----------
Labels: TDF_LabelSequence

Returns
-------
None
") GetColors;
		void GetColors(TDF_LabelSequence & Labels);

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** GetInstanceColor ******************/
		%feature("compactdefaultargs") GetInstanceColor;
		%feature("autodoc", "Gets the color of component that styled with shuo structure returns false if no sush component or color type.

Parameters
----------
theShape: TopoDS_Shape
type: XCAFDoc_ColorType
color: Quantity_Color

Returns
-------
bool
") GetInstanceColor;
		Standard_Boolean GetInstanceColor(const TopoDS_Shape & theShape, const XCAFDoc_ColorType type, Quantity_Color & color);

		/****************** GetInstanceColor ******************/
		%feature("compactdefaultargs") GetInstanceColor;
		%feature("autodoc", "Gets the color of component that styled with shuo structure returns false if no sush component or color type.

Parameters
----------
theShape: TopoDS_Shape
type: XCAFDoc_ColorType
color: Quantity_ColorRGBA

Returns
-------
bool
") GetInstanceColor;
		Standard_Boolean GetInstanceColor(const TopoDS_Shape & theShape, const XCAFDoc_ColorType type, Quantity_ColorRGBA & color);

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** IsColor ******************/
		%feature("compactdefaultargs") IsColor;
		%feature("autodoc", "Returns true if label belongs to a colortable and is a color definition.

Parameters
----------
lab: TDF_Label

Returns
-------
bool
") IsColor;
		Standard_Boolean IsColor(const TDF_Label & lab);

		/****************** IsColorByLayer ******************/
		%feature("compactdefaultargs") IsColorByLayer;
		%feature("autodoc", "Return true if object color defined by its layer, false if not.

Parameters
----------
L: TDF_Label

Returns
-------
bool
") IsColorByLayer;
		Standard_Boolean IsColorByLayer(const TDF_Label & L);

		/****************** IsInstanceVisible ******************/
		%feature("compactdefaultargs") IsInstanceVisible;
		%feature("autodoc", "Gets the visibility status of component that styled with shuo structure returns false if no sush component.

Parameters
----------
theShape: TopoDS_Shape

Returns
-------
bool
") IsInstanceVisible;
		Standard_Boolean IsInstanceVisible(const TopoDS_Shape & theShape);

		/****************** IsSet ******************/
		%feature("compactdefaultargs") IsSet;
		%feature("autodoc", "Returns true if label <l> has a color assignment of the type <type>.

Parameters
----------
L: TDF_Label
type: XCAFDoc_ColorType

Returns
-------
bool
") IsSet;
		Standard_Boolean IsSet(const TDF_Label & L, const XCAFDoc_ColorType type);

		/****************** IsSet ******************/
		%feature("compactdefaultargs") IsSet;
		%feature("autodoc", "Returns true if label <l> has a color assignment of the type <type>.

Parameters
----------
S: TopoDS_Shape
type: XCAFDoc_ColorType

Returns
-------
bool
") IsSet;
		Standard_Boolean IsSet(const TopoDS_Shape & S, const XCAFDoc_ColorType type);

		/****************** IsVisible ******************/
		%feature("compactdefaultargs") IsVisible;
		%feature("autodoc", "Return true if object on this label is visible, false if invisible.

Parameters
----------
L: TDF_Label

Returns
-------
bool
") IsVisible;
		Standard_Boolean IsVisible(const TDF_Label & L);

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** RemoveColor ******************/
		%feature("compactdefaultargs") RemoveColor;
		%feature("autodoc", "Removes color from the colortable.

Parameters
----------
lab: TDF_Label

Returns
-------
None
") RemoveColor;
		void RemoveColor(const TDF_Label & lab);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
with: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & with);

		/****************** ReverseChainsOfTreeNodes ******************/
		%feature("compactdefaultargs") ReverseChainsOfTreeNodes;
		%feature("autodoc", "Reverses order in chains of treenodes (from last to first) under each color label since we became to use function ::prepend() instead of ::append() in method setcolor() for acceleration.

Returns
-------
bool
") ReverseChainsOfTreeNodes;
		Standard_Boolean ReverseChainsOfTreeNodes();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Creates (if not exist) colortool.

Parameters
----------
L: TDF_Label

Returns
-------
opencascade::handle<XCAFDoc_ColorTool>
") Set;
		static opencascade::handle<XCAFDoc_ColorTool> Set(const TDF_Label & L);

		/****************** SetColor ******************/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "Sets a link with guid defined by <type> (see xcafdoc::colorrefguid()) from label <l> to color defined by <colorl>. color of shape is defined following way in dependance with type of color. if type of color is xcafdoc_colorgen - then this color defines default color for surfaces and curves. if for shape color with types xcafdoc_colorsurf or xcafdoc_colorcurv is specified then such color overrides generic color.

Parameters
----------
L: TDF_Label
colorL: TDF_Label
type: XCAFDoc_ColorType

Returns
-------
None
") SetColor;
		void SetColor(const TDF_Label & L, const TDF_Label & colorL, const XCAFDoc_ColorType type);

		/****************** SetColor ******************/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "Sets a link with guid defined by <type> (see xcafdoc::colorrefguid()) from label <l> to color <color> in the colortable adds a color as necessary.

Parameters
----------
L: TDF_Label
Color: Quantity_Color
type: XCAFDoc_ColorType

Returns
-------
None
") SetColor;
		void SetColor(const TDF_Label & L, const Quantity_Color & Color, const XCAFDoc_ColorType type);

		/****************** SetColor ******************/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "Sets a link with guid defined by <type> (see xcafdoc::colorrefguid()) from label <l> to color <color> in the colortable adds a color as necessary.

Parameters
----------
L: TDF_Label
Color: Quantity_ColorRGBA
type: XCAFDoc_ColorType

Returns
-------
None
") SetColor;
		void SetColor(const TDF_Label & L, const Quantity_ColorRGBA & Color, const XCAFDoc_ColorType type);

		/****************** SetColor ******************/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "Sets a link with guid defined by <type> (see xcafdoc::colorrefguid()) from label <l> to color defined by <colorl> returns false if cannot find a label for shape s.

Parameters
----------
S: TopoDS_Shape
colorL: TDF_Label
type: XCAFDoc_ColorType

Returns
-------
bool
") SetColor;
		Standard_Boolean SetColor(const TopoDS_Shape & S, const TDF_Label & colorL, const XCAFDoc_ColorType type);

		/****************** SetColor ******************/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "Sets a link with guid defined by <type> (see xcafdoc::colorrefguid()) from label <l> to color <color> in the colortable adds a color as necessary returns false if cannot find a label for shape s.

Parameters
----------
S: TopoDS_Shape
Color: Quantity_Color
type: XCAFDoc_ColorType

Returns
-------
bool
") SetColor;
		Standard_Boolean SetColor(const TopoDS_Shape & S, const Quantity_Color & Color, const XCAFDoc_ColorType type);

		/****************** SetColor ******************/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "Sets a link with guid defined by <type> (see xcafdoc::colorrefguid()) from label <l> to color <color> in the colortable adds a color as necessary returns false if cannot find a label for shape s.

Parameters
----------
S: TopoDS_Shape
Color: Quantity_ColorRGBA
type: XCAFDoc_ColorType

Returns
-------
bool
") SetColor;
		Standard_Boolean SetColor(const TopoDS_Shape & S, const Quantity_ColorRGBA & Color, const XCAFDoc_ColorType type);

		/****************** SetColorByLayer ******************/
		%feature("compactdefaultargs") SetColorByLayer;
		%feature("autodoc", "Set the color defined by layer flag on label. do nothing if there no any object. set uattribute with corresponding guid.

Parameters
----------
shapeLabel: TDF_Label
isColorByLayer: bool,optional
	default value is Standard_False

Returns
-------
None
") SetColorByLayer;
		void SetColorByLayer(const TDF_Label & shapeLabel, const Standard_Boolean isColorByLayer = Standard_False);

		/****************** SetInstanceColor ******************/
		%feature("compactdefaultargs") SetInstanceColor;
		%feature("autodoc", "Sets the color of component that styled with shuo structure returns false if no sush component found note: create shuo structeure if it is necessary and if <iscreateshuo>.

Parameters
----------
theShape: TopoDS_Shape
type: XCAFDoc_ColorType
color: Quantity_Color
isCreateSHUO: bool,optional
	default value is Standard_True

Returns
-------
bool
") SetInstanceColor;
		Standard_Boolean SetInstanceColor(const TopoDS_Shape & theShape, const XCAFDoc_ColorType type, const Quantity_Color & color, const Standard_Boolean isCreateSHUO = Standard_True);

		/****************** SetInstanceColor ******************/
		%feature("compactdefaultargs") SetInstanceColor;
		%feature("autodoc", "Sets the color of component that styled with shuo structure returns false if no sush component found note: create shuo structeure if it is necessary and if <iscreateshuo>.

Parameters
----------
theShape: TopoDS_Shape
type: XCAFDoc_ColorType
color: Quantity_ColorRGBA
isCreateSHUO: bool,optional
	default value is Standard_True

Returns
-------
bool
") SetInstanceColor;
		Standard_Boolean SetInstanceColor(const TopoDS_Shape & theShape, const XCAFDoc_ColorType type, const Quantity_ColorRGBA & color, const Standard_Boolean isCreateSHUO = Standard_True);

		/****************** SetVisibility ******************/
		%feature("compactdefaultargs") SetVisibility;
		%feature("autodoc", "Set the visibility of object on label. do nothing if there no any object. set uattribute with corresponding guid.

Parameters
----------
shapeLabel: TDF_Label
isvisible: bool,optional
	default value is Standard_True

Returns
-------
None
") SetVisibility;
		void SetVisibility(const TDF_Label & shapeLabel, const Standard_Boolean isvisible = Standard_True);

		/****************** ShapeTool ******************/
		%feature("compactdefaultargs") ShapeTool;
		%feature("autodoc", "Returns internal xcafdoc_shapetool tool.

Returns
-------
opencascade::handle<XCAFDoc_ShapeTool>
") ShapeTool;
		const opencascade::handle<XCAFDoc_ShapeTool> & ShapeTool();

		/****************** UnSetColor ******************/
		%feature("compactdefaultargs") UnSetColor;
		%feature("autodoc", "Removes a link with guid defined by <type> (see xcafdoc::colorrefguid()) from label <l> to color.

Parameters
----------
L: TDF_Label
type: XCAFDoc_ColorType

Returns
-------
None
") UnSetColor;
		void UnSetColor(const TDF_Label & L, const XCAFDoc_ColorType type);

		/****************** UnSetColor ******************/
		%feature("compactdefaultargs") UnSetColor;
		%feature("autodoc", "Removes a link with guid defined by <type> (see xcafdoc::colorrefguid()) from label <l> to color returns true if such link existed.

Parameters
----------
S: TopoDS_Shape
type: XCAFDoc_ColorType

Returns
-------
bool
") UnSetColor;
		Standard_Boolean UnSetColor(const TopoDS_Shape & S, const XCAFDoc_ColorType type);

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
		/****************** XCAFDoc_Datum ******************/
		%feature("compactdefaultargs") XCAFDoc_Datum;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") XCAFDoc_Datum;
		 XCAFDoc_Datum();

		/****************** GetDescription ******************/
		%feature("compactdefaultargs") GetDescription;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") GetDescription;
		opencascade::handle<TCollection_HAsciiString> GetDescription();

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** GetIdentification ******************/
		%feature("compactdefaultargs") GetIdentification;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") GetIdentification;
		opencascade::handle<TCollection_HAsciiString> GetIdentification();

		/****************** GetName ******************/
		%feature("compactdefaultargs") GetName;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") GetName;
		opencascade::handle<TCollection_HAsciiString> GetName();

		/****************** GetObject ******************/
		%feature("compactdefaultargs") GetObject;
		%feature("autodoc", "Returns dimension object data taken from the paren's label and its sub-labels.

Returns
-------
opencascade::handle<XCAFDimTolObjects_DatumObject>
") GetObject;
		opencascade::handle<XCAFDimTolObjects_DatumObject> GetObject();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
Into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
With: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
label: TDF_Label
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
anIdentification: TCollection_HAsciiString

Returns
-------
opencascade::handle<XCAFDoc_Datum>
") Set;
		static opencascade::handle<XCAFDoc_Datum> Set(const TDF_Label & label, const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<TCollection_HAsciiString> & anIdentification);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
theLabel: TDF_Label

Returns
-------
opencascade::handle<XCAFDoc_Datum>
") Set;
		static opencascade::handle<XCAFDoc_Datum> Set(const TDF_Label & theLabel);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
anIdentification: TCollection_HAsciiString

Returns
-------
None
") Set;
		void Set(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<TCollection_HAsciiString> & anIdentification);

		/****************** SetObject ******************/
		%feature("compactdefaultargs") SetObject;
		%feature("autodoc", "Updates parent's label and its sub-labels with data taken from thedatumobject. old data associated with the label will be lost.

Parameters
----------
theDatumObject: XCAFDimTolObjects_DatumObject

Returns
-------
None
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
		/****************** XCAFDoc_DimTol ******************/
		%feature("compactdefaultargs") XCAFDoc_DimTol;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") XCAFDoc_DimTol;
		 XCAFDoc_DimTol();

		/****************** GetDescription ******************/
		%feature("compactdefaultargs") GetDescription;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") GetDescription;
		opencascade::handle<TCollection_HAsciiString> GetDescription();

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** GetKind ******************/
		%feature("compactdefaultargs") GetKind;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") GetKind;
		Standard_Integer GetKind();

		/****************** GetName ******************/
		%feature("compactdefaultargs") GetName;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") GetName;
		opencascade::handle<TCollection_HAsciiString> GetName();

		/****************** GetVal ******************/
		%feature("compactdefaultargs") GetVal;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") GetVal;
		opencascade::handle<TColStd_HArray1OfReal> GetVal();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
Into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
With: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
label: TDF_Label
kind: int
aVal: TColStd_HArray1OfReal
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString

Returns
-------
opencascade::handle<XCAFDoc_DimTol>
") Set;
		static opencascade::handle<XCAFDoc_DimTol> Set(const TDF_Label & label, const Standard_Integer kind, const opencascade::handle<TColStd_HArray1OfReal> & aVal, const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
kind: int
aVal: TColStd_HArray1OfReal
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString

Returns
-------
None
") Set;
		void Set(const Standard_Integer kind, const opencascade::handle<TColStd_HArray1OfReal> & aVal, const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription);

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
/**************************
* class XCAFDoc_Dimension *
**************************/
class XCAFDoc_Dimension : public TDF_Attribute {
	public:
		/****************** XCAFDoc_Dimension ******************/
		%feature("compactdefaultargs") XCAFDoc_Dimension;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") XCAFDoc_Dimension;
		 XCAFDoc_Dimension();

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** GetObject ******************/
		%feature("compactdefaultargs") GetObject;
		%feature("autodoc", "Returns dimension object data taken from the paren's label and its sub-labels.

Returns
-------
opencascade::handle<XCAFDimTolObjects_DimensionObject>
") GetObject;
		opencascade::handle<XCAFDimTolObjects_DimensionObject> GetObject();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
Into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
With: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
theLabel: TDF_Label

Returns
-------
opencascade::handle<XCAFDoc_Dimension>
") Set;
		static opencascade::handle<XCAFDoc_Dimension> Set(const TDF_Label & theLabel);

		/****************** SetObject ******************/
		%feature("compactdefaultargs") SetObject;
		%feature("autodoc", "Updates parent's label and its sub-labels with data taken from thedimensionobject. old data associated with the label will be lost.

Parameters
----------
theDimensionObject: XCAFDimTolObjects_DimensionObject

Returns
-------
None
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
class XCAFDoc_DocumentTool : public TDF_Attribute {
	public:
		/****************** XCAFDoc_DocumentTool ******************/
		%feature("compactdefaultargs") XCAFDoc_DocumentTool;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") XCAFDoc_DocumentTool;
		 XCAFDoc_DocumentTool();

		/****************** ClippingPlaneTool ******************/
		%feature("compactdefaultargs") ClippingPlaneTool;
		%feature("autodoc", "Creates (if it does not exist) clippingplanetool attribute on clippingplaneslabel().

Parameters
----------
acces: TDF_Label

Returns
-------
opencascade::handle<XCAFDoc_ClippingPlaneTool>
") ClippingPlaneTool;
		static opencascade::handle<XCAFDoc_ClippingPlaneTool> ClippingPlaneTool(const TDF_Label & acces);

		/****************** ClippingPlanesLabel ******************/
		%feature("compactdefaultargs") ClippingPlanesLabel;
		%feature("autodoc", "Returns sub-label of doclabel() with tag 8.

Parameters
----------
acces: TDF_Label

Returns
-------
TDF_Label
") ClippingPlanesLabel;
		static TDF_Label ClippingPlanesLabel(const TDF_Label & acces);

		/****************** ColorTool ******************/
		%feature("compactdefaultargs") ColorTool;
		%feature("autodoc", "Creates (if it does not exist) colortool attribute on colorslabel().

Parameters
----------
acces: TDF_Label

Returns
-------
opencascade::handle<XCAFDoc_ColorTool>
") ColorTool;
		static opencascade::handle<XCAFDoc_ColorTool> ColorTool(const TDF_Label & acces);

		/****************** ColorsLabel ******************/
		%feature("compactdefaultargs") ColorsLabel;
		%feature("autodoc", "Returns sub-label of doclabel() with tag 2.

Parameters
----------
acces: TDF_Label

Returns
-------
TDF_Label
") ColorsLabel;
		static TDF_Label ColorsLabel(const TDF_Label & acces);

		/****************** DGTsLabel ******************/
		%feature("compactdefaultargs") DGTsLabel;
		%feature("autodoc", "Returns sub-label of doclabel() with tag 4.

Parameters
----------
acces: TDF_Label

Returns
-------
TDF_Label
") DGTsLabel;
		static TDF_Label DGTsLabel(const TDF_Label & acces);

		/****************** DimTolTool ******************/
		%feature("compactdefaultargs") DimTolTool;
		%feature("autodoc", "Creates (if it does not exist) dimtoltool attribute on dgtslabel().

Parameters
----------
acces: TDF_Label

Returns
-------
opencascade::handle<XCAFDoc_DimTolTool>
") DimTolTool;
		static opencascade::handle<XCAFDoc_DimTolTool> DimTolTool(const TDF_Label & acces);

		/****************** DocLabel ******************/
		%feature("compactdefaultargs") DocLabel;
		%feature("autodoc", "Returns label where the documenttool attribute is or 0.1 if documenttool is not yet set.

Parameters
----------
acces: TDF_Label

Returns
-------
TDF_Label
") DocLabel;
		static TDF_Label DocLabel(const TDF_Label & acces);

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "To be called when reading this attribute from file.

Returns
-------
None
") Init;
		void Init();

		/****************** IsXCAFDocument ******************/
		%feature("compactdefaultargs") IsXCAFDocument;
		%feature("autodoc", "No available documentation.

Parameters
----------
Doc: TDocStd_Document

Returns
-------
bool
") IsXCAFDocument;
		static Standard_Boolean IsXCAFDocument(const opencascade::handle<TDocStd_Document> & Doc);

		/****************** LayerTool ******************/
		%feature("compactdefaultargs") LayerTool;
		%feature("autodoc", "Creates (if it does not exist) layertool attribute on layerslabel().

Parameters
----------
acces: TDF_Label

Returns
-------
opencascade::handle<XCAFDoc_LayerTool>
") LayerTool;
		static opencascade::handle<XCAFDoc_LayerTool> LayerTool(const TDF_Label & acces);

		/****************** LayersLabel ******************/
		%feature("compactdefaultargs") LayersLabel;
		%feature("autodoc", "Returns sub-label of doclabel() with tag 3.

Parameters
----------
acces: TDF_Label

Returns
-------
TDF_Label
") LayersLabel;
		static TDF_Label LayersLabel(const TDF_Label & acces);

		/****************** MaterialTool ******************/
		%feature("compactdefaultargs") MaterialTool;
		%feature("autodoc", "Creates (if it does not exist) dimtoltool attribute on dgtslabel().

Parameters
----------
acces: TDF_Label

Returns
-------
opencascade::handle<XCAFDoc_MaterialTool>
") MaterialTool;
		static opencascade::handle<XCAFDoc_MaterialTool> MaterialTool(const TDF_Label & acces);

		/****************** MaterialsLabel ******************/
		%feature("compactdefaultargs") MaterialsLabel;
		%feature("autodoc", "Returns sub-label of doclabel() with tag 5.

Parameters
----------
acces: TDF_Label

Returns
-------
TDF_Label
") MaterialsLabel;
		static TDF_Label MaterialsLabel(const TDF_Label & acces);

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** NotesLabel ******************/
		%feature("compactdefaultargs") NotesLabel;
		%feature("autodoc", "Returns sub-label of doclabel() with tag 9.

Parameters
----------
acces: TDF_Label

Returns
-------
TDF_Label
") NotesLabel;
		static TDF_Label NotesLabel(const TDF_Label & acces);

		/****************** NotesTool ******************/
		%feature("compactdefaultargs") NotesTool;
		%feature("autodoc", "Creates (if it does not exist) notestool attribute on noteslabel().

Parameters
----------
acces: TDF_Label

Returns
-------
opencascade::handle<XCAFDoc_NotesTool>
") NotesTool;
		static opencascade::handle<XCAFDoc_NotesTool> NotesTool(const TDF_Label & acces);

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
with: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & with);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Create (if not exist) documenttool attribute on 0.1 label if <isacces> is true, else on <l> label. this label will be returned by doclabel(); if the attribute is already set it won't be reset on <l> even if <isacces> is false. colortool and shapetool attributes are also set by this method.

Parameters
----------
L: TDF_Label
IsAcces: bool,optional
	default value is Standard_True

Returns
-------
opencascade::handle<XCAFDoc_DocumentTool>
") Set;
		static opencascade::handle<XCAFDoc_DocumentTool> Set(const TDF_Label & L, const Standard_Boolean IsAcces = Standard_True);

		/****************** ShapeTool ******************/
		%feature("compactdefaultargs") ShapeTool;
		%feature("autodoc", "Creates (if it does not exist) shapetool attribute on shapeslabel().

Parameters
----------
acces: TDF_Label

Returns
-------
opencascade::handle<XCAFDoc_ShapeTool>
") ShapeTool;
		static opencascade::handle<XCAFDoc_ShapeTool> ShapeTool(const TDF_Label & acces);

		/****************** ShapesLabel ******************/
		%feature("compactdefaultargs") ShapesLabel;
		%feature("autodoc", "Returns sub-label of doclabel() with tag 1.

Parameters
----------
acces: TDF_Label

Returns
-------
TDF_Label
") ShapesLabel;
		static TDF_Label ShapesLabel(const TDF_Label & acces);

		/****************** ViewTool ******************/
		%feature("compactdefaultargs") ViewTool;
		%feature("autodoc", "Creates (if it does not exist) viewtool attribute on viewslabel().

Parameters
----------
acces: TDF_Label

Returns
-------
opencascade::handle<XCAFDoc_ViewTool>
") ViewTool;
		static opencascade::handle<XCAFDoc_ViewTool> ViewTool(const TDF_Label & acces);

		/****************** ViewsLabel ******************/
		%feature("compactdefaultargs") ViewsLabel;
		%feature("autodoc", "Returns sub-label of doclabel() with tag 7.

Parameters
----------
acces: TDF_Label

Returns
-------
TDF_Label
") ViewsLabel;
		static TDF_Label ViewsLabel(const TDF_Label & acces);

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
		/****************** Expand ******************/
		%feature("compactdefaultargs") Expand;
		%feature("autodoc", "Convert shape (compound/compsolid/shell/wire) to assembly. only compounds expanded recursively.

Parameters
----------
Doc: TDF_Label
Shape: TDF_Label
recursively: bool,optional
	default value is Standard_True

Returns
-------
bool
") Expand;
		static Standard_Boolean Expand(const TDF_Label & Doc, const TDF_Label & Shape, const Standard_Boolean recursively = Standard_True);

		/****************** Expand ******************/
		%feature("compactdefaultargs") Expand;
		%feature("autodoc", "Convert all compounds in doc to assembly.

Parameters
----------
Doc: TDF_Label
recursively: bool,optional
	default value is Standard_True

Returns
-------
bool
") Expand;
		static Standard_Boolean Expand(const TDF_Label & Doc, const Standard_Boolean recursively = Standard_True);

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
		/****************** XCAFDoc_GraphNode ******************/
		%feature("compactdefaultargs") XCAFDoc_GraphNode;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") XCAFDoc_GraphNode;
		 XCAFDoc_GraphNode();

		/****************** BeforeForget ******************/
		%feature("compactdefaultargs") BeforeForget;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BeforeForget;
		virtual void BeforeForget();

		/****************** ChildIndex ******************/
		%feature("compactdefaultargs") ChildIndex;
		%feature("autodoc", "Return index of <ch>, or zero if there is no such graphnode.

Parameters
----------
Ch: XCAFDoc_GraphNode

Returns
-------
int
") ChildIndex;
		Standard_Integer ChildIndex(const opencascade::handle<XCAFDoc_GraphNode> & Ch);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** FatherIndex ******************/
		%feature("compactdefaultargs") FatherIndex;
		%feature("autodoc", "Return index of <f>, or zero if there is no such graphnode.

Parameters
----------
F: XCAFDoc_GraphNode

Returns
-------
int
") FatherIndex;
		Standard_Integer FatherIndex(const opencascade::handle<XCAFDoc_GraphNode> & F);

		/****************** Find ******************/
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "Class methods working on the node =================================== shortcut to search a graph node attribute with default graphid. returns true if found.

Parameters
----------
L: TDF_Label
G: XCAFDoc_GraphNode

Returns
-------
bool
") Find;
		static Standard_Boolean Find(const TDF_Label & L, opencascade::handle<XCAFDoc_GraphNode> & G);

		/****************** GetChild ******************/
		%feature("compactdefaultargs") GetChild;
		%feature("autodoc", "Return graphnode by index from graphnodesequence.

Parameters
----------
Chindex: int

Returns
-------
opencascade::handle<XCAFDoc_GraphNode>
") GetChild;
		opencascade::handle<XCAFDoc_GraphNode> GetChild(const Standard_Integer Chindex);

		/****************** GetDefaultGraphID ******************/
		%feature("compactdefaultargs") GetDefaultGraphID;
		%feature("autodoc", "Returns a default graph id. this id is used by the <set> method without explicit tree id. instance methods: ================.

Returns
-------
Standard_GUID
") GetDefaultGraphID;
		static const Standard_GUID & GetDefaultGraphID();

		/****************** GetFather ******************/
		%feature("compactdefaultargs") GetFather;
		%feature("autodoc", "Return graphnode by index from graphnodesequence.

Parameters
----------
Findex: int

Returns
-------
opencascade::handle<XCAFDoc_GraphNode>
") GetFather;
		opencascade::handle<XCAFDoc_GraphNode> GetFather(const Standard_Integer Findex);

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Returns the graph id (default or explicit one depending onthe set method used).

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** IsChild ******************/
		%feature("compactdefaultargs") IsChild;
		%feature("autodoc", "Returns true if <self> is child of <f>.

Parameters
----------
F: XCAFDoc_GraphNode

Returns
-------
bool
") IsChild;
		Standard_Boolean IsChild(const opencascade::handle<XCAFDoc_GraphNode> & F);

		/****************** IsFather ******************/
		%feature("compactdefaultargs") IsFather;
		%feature("autodoc", "Returns true if <self> is father of <ch>.

Parameters
----------
Ch: XCAFDoc_GraphNode

Returns
-------
bool
") IsFather;
		Standard_Boolean IsFather(const opencascade::handle<XCAFDoc_GraphNode> & Ch);

		/****************** NbChildren ******************/
		%feature("compactdefaultargs") NbChildren;
		%feature("autodoc", "Return number of childrens graphnodes. implementation of attribute methods: ===================================.

Returns
-------
int
") NbChildren;
		Standard_Integer NbChildren();

		/****************** NbFathers ******************/
		%feature("compactdefaultargs") NbFathers;
		%feature("autodoc", "Return number of fathers graphnodes.

Returns
-------
int
") NbFathers;
		Standard_Integer NbFathers();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		virtual void Paste(const opencascade::handle<TDF_Attribute> & into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** References ******************/
		%feature("compactdefaultargs") References;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDataSet: TDF_DataSet

Returns
-------
None
") References;
		virtual void References(const opencascade::handle<TDF_DataSet> & aDataSet);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
with: TDF_Attribute

Returns
-------
None
") Restore;
		virtual void Restore(const opencascade::handle<TDF_Attribute> & with);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Finds or creates a graphnode attribute on the label <l> with the default graph id, returned by the method <getdefaultgraphid>. returns the created/found graphnode attribute.

Parameters
----------
L: TDF_Label

Returns
-------
opencascade::handle<XCAFDoc_GraphNode>
") Set;
		static opencascade::handle<XCAFDoc_GraphNode> Set(const TDF_Label & L);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Finds or creates a graphnode attribute on the label <l>, with an explicit tree id. <explicitgraphid> is the id returned by <tdf_attribute::id> method. returns the found/created graphnode attribute.

Parameters
----------
L: TDF_Label
ExplicitGraphID: Standard_GUID

Returns
-------
opencascade::handle<XCAFDoc_GraphNode>
") Set;
		static opencascade::handle<XCAFDoc_GraphNode> Set(const TDF_Label & L, const Standard_GUID & ExplicitGraphID);

		/****************** SetChild ******************/
		%feature("compactdefaultargs") SetChild;
		%feature("autodoc", "Set graphnode <ch> as child of me and returns index of <ch> in sequence that containing children graphnodes. return index of <ch> from graphnodesequnece.

Parameters
----------
Ch: XCAFDoc_GraphNode

Returns
-------
int
") SetChild;
		Standard_Integer SetChild(const opencascade::handle<XCAFDoc_GraphNode> & Ch);

		/****************** SetFather ******************/
		%feature("compactdefaultargs") SetFather;
		%feature("autodoc", "Set graphnode <f> as father of me and returns index of <f> in sequence that containing fathers graphnodes. return index of <f> from graphnodesequnece.

Parameters
----------
F: XCAFDoc_GraphNode

Returns
-------
int
") SetFather;
		Standard_Integer SetFather(const opencascade::handle<XCAFDoc_GraphNode> & F);

		/****************** SetGraphID ******************/
		%feature("compactdefaultargs") SetGraphID;
		%feature("autodoc", "No available documentation.

Parameters
----------
explicitID: Standard_GUID

Returns
-------
None
") SetGraphID;
		void SetGraphID(const Standard_GUID & explicitID);

		/****************** UnSetChild ******************/
		%feature("compactdefaultargs") UnSetChild;
		%feature("autodoc", "Remove <ch> from graphnodesequence. and remove link between father and child.

Parameters
----------
Ch: XCAFDoc_GraphNode

Returns
-------
None
") UnSetChild;
		void UnSetChild(const opencascade::handle<XCAFDoc_GraphNode> & Ch);

		/****************** UnSetChild ******************/
		%feature("compactdefaultargs") UnSetChild;
		%feature("autodoc", "Remove child graphnode by index from children graphnodesequence. and remove link between father and child.

Parameters
----------
Chindex: int

Returns
-------
None
") UnSetChild;
		void UnSetChild(const Standard_Integer Chindex);

		/****************** UnSetFather ******************/
		%feature("compactdefaultargs") UnSetFather;
		%feature("autodoc", "Remove <f> from fathers graphnodesequence. and remove link between father and child.

Parameters
----------
F: XCAFDoc_GraphNode

Returns
-------
None
") UnSetFather;
		void UnSetFather(const opencascade::handle<XCAFDoc_GraphNode> & F);

		/****************** UnSetFather ******************/
		%feature("compactdefaultargs") UnSetFather;
		%feature("autodoc", "Remove father graphnode by index from fathers graphnodesequence. and remove link between father and child.

Parameters
----------
Findex: int

Returns
-------
None
") UnSetFather;
		void UnSetFather(const Standard_Integer Findex);

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
class XCAFDoc_LayerTool : public TDF_Attribute {
	public:
		/****************** XCAFDoc_LayerTool ******************/
		%feature("compactdefaultargs") XCAFDoc_LayerTool;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") XCAFDoc_LayerTool;
		 XCAFDoc_LayerTool();

		/****************** AddLayer ******************/
		%feature("compactdefaultargs") AddLayer;
		%feature("autodoc", "Adds a layer definition to a layertable and returns its label (returns existing label if the same layer is already defined).

Parameters
----------
aLayer: TCollection_ExtendedString

Returns
-------
TDF_Label
") AddLayer;
		TDF_Label AddLayer(const TCollection_ExtendedString & aLayer);

		/****************** BaseLabel ******************/
		%feature("compactdefaultargs") BaseLabel;
		%feature("autodoc", "Returns the label under which layers are stored.

Returns
-------
TDF_Label
") BaseLabel;
		TDF_Label BaseLabel();

		/****************** FindLayer ******************/
		%feature("compactdefaultargs") FindLayer;
		%feature("autodoc", "Finds a layer definition in a layertable and returns its label if found returns false if layer is not found in layertable.

Parameters
----------
aLayer: TCollection_ExtendedString
lab: TDF_Label

Returns
-------
bool
") FindLayer;
		Standard_Boolean FindLayer(const TCollection_ExtendedString & aLayer, TDF_Label & lab);

		/****************** FindLayer ******************/
		%feature("compactdefaultargs") FindLayer;
		%feature("autodoc", "Finds a layer definition in a layertable and returns its label if found (or null label else).

Parameters
----------
aLayer: TCollection_ExtendedString

Returns
-------
TDF_Label
") FindLayer;
		TDF_Label FindLayer(const TCollection_ExtendedString & aLayer);

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** GetLayer ******************/
		%feature("compactdefaultargs") GetLayer;
		%feature("autodoc", "Returns layer defined by label lab returns false if the label is not in layertable or does not define a layer.

Parameters
----------
lab: TDF_Label
aLayer: TCollection_ExtendedString

Returns
-------
bool
") GetLayer;
		Standard_Boolean GetLayer(const TDF_Label & lab, TCollection_ExtendedString & aLayer);

		/****************** GetLayerLabels ******************/
		%feature("compactdefaultargs") GetLayerLabels;
		%feature("autodoc", "Returns a sequence of layers currently stored in the layertable.

Parameters
----------
Labels: TDF_LabelSequence

Returns
-------
None
") GetLayerLabels;
		void GetLayerLabels(TDF_LabelSequence & Labels);

		/****************** GetLayers ******************/
		%feature("compactdefaultargs") GetLayers;
		%feature("autodoc", "Return sequence of strings <alayers> that assosiated with label <l>.

Parameters
----------
L: TDF_Label
aLayerS: TColStd_HSequenceOfExtendedString

Returns
-------
bool
") GetLayers;
		Standard_Boolean GetLayers(const TDF_Label & L, opencascade::handle<TColStd_HSequenceOfExtendedString> & aLayerS);

		/****************** GetLayers ******************/
		%feature("compactdefaultargs") GetLayers;
		%feature("autodoc", "Return sequence of labels <alayersl> that assosiated with label <l>.

Parameters
----------
L: TDF_Label
aLayerLS: TDF_LabelSequence

Returns
-------
bool
") GetLayers;
		Standard_Boolean GetLayers(const TDF_Label & L, TDF_LabelSequence & aLayerLS);

		/****************** GetLayers ******************/
		%feature("compactdefaultargs") GetLayers;
		%feature("autodoc", "Return sequence of strings that assosiated with label <l>.

Parameters
----------
L: TDF_Label

Returns
-------
opencascade::handle<TColStd_HSequenceOfExtendedString>
") GetLayers;
		opencascade::handle<TColStd_HSequenceOfExtendedString> GetLayers(const TDF_Label & L);

		/****************** GetLayers ******************/
		%feature("compactdefaultargs") GetLayers;
		%feature("autodoc", "Return sequence of strings <alayers> that assosiated with shape <sh>.

Parameters
----------
Sh: TopoDS_Shape
aLayerS: TColStd_HSequenceOfExtendedString

Returns
-------
bool
") GetLayers;
		Standard_Boolean GetLayers(const TopoDS_Shape & Sh, opencascade::handle<TColStd_HSequenceOfExtendedString> & aLayerS);

		/****************** GetLayers ******************/
		%feature("compactdefaultargs") GetLayers;
		%feature("autodoc", "Return sequence of labels <alayerls> that assosiated with shape <sh>.

Parameters
----------
Sh: TopoDS_Shape
aLayerLS: TDF_LabelSequence

Returns
-------
bool
") GetLayers;
		Standard_Boolean GetLayers(const TopoDS_Shape & Sh, TDF_LabelSequence & aLayerLS);

		/****************** GetLayers ******************/
		%feature("compactdefaultargs") GetLayers;
		%feature("autodoc", "Return sequence of strings that assosiated with shape <sh>.

Parameters
----------
Sh: TopoDS_Shape

Returns
-------
opencascade::handle<TColStd_HSequenceOfExtendedString>
") GetLayers;
		opencascade::handle<TColStd_HSequenceOfExtendedString> GetLayers(const TopoDS_Shape & Sh);

		/****************** GetShapesOfLayer ******************/
		%feature("compactdefaultargs") GetShapesOfLayer;
		%feature("autodoc", "Return sequanese of shape labels that assigned with layers to <shlabels>.

Parameters
----------
layerL: TDF_Label
ShLabels: TDF_LabelSequence

Returns
-------
None
") GetShapesOfLayer;
		void GetShapesOfLayer(const TDF_Label & layerL, TDF_LabelSequence & ShLabels);

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** IsLayer ******************/
		%feature("compactdefaultargs") IsLayer;
		%feature("autodoc", "Returns true if label belongs to a layertable and is a layer definition.

Parameters
----------
lab: TDF_Label

Returns
-------
bool
") IsLayer;
		Standard_Boolean IsLayer(const TDF_Label & lab);

		/****************** IsSet ******************/
		%feature("compactdefaultargs") IsSet;
		%feature("autodoc", "Returns true if label <l> has a layer assosiated with the <alayer>.

Parameters
----------
L: TDF_Label
aLayer: TCollection_ExtendedString

Returns
-------
bool
") IsSet;
		Standard_Boolean IsSet(const TDF_Label & L, const TCollection_ExtendedString & aLayer);

		/****************** IsSet ******************/
		%feature("compactdefaultargs") IsSet;
		%feature("autodoc", "Returns true if label <l> has a layer assosiated with the <alayerl> label.

Parameters
----------
L: TDF_Label
aLayerL: TDF_Label

Returns
-------
bool
") IsSet;
		Standard_Boolean IsSet(const TDF_Label & L, const TDF_Label & aLayerL);

		/****************** IsSet ******************/
		%feature("compactdefaultargs") IsSet;
		%feature("autodoc", "Returns true if shape <sh> has a layer assosiated with the <alayer>.

Parameters
----------
Sh: TopoDS_Shape
aLayer: TCollection_ExtendedString

Returns
-------
bool
") IsSet;
		Standard_Boolean IsSet(const TopoDS_Shape & Sh, const TCollection_ExtendedString & aLayer);

		/****************** IsSet ******************/
		%feature("compactdefaultargs") IsSet;
		%feature("autodoc", "Returns true if shape <sh> has a layer assosiated with the <alayerl>.

Parameters
----------
Sh: TopoDS_Shape
aLayerL: TDF_Label

Returns
-------
bool
") IsSet;
		Standard_Boolean IsSet(const TopoDS_Shape & Sh, const TDF_Label & aLayerL);

		/****************** IsVisible ******************/
		%feature("compactdefaultargs") IsVisible;
		%feature("autodoc", "Return true if layer is visible, false if invisible.

Parameters
----------
layerL: TDF_Label

Returns
-------
bool
") IsVisible;
		Standard_Boolean IsVisible(const TDF_Label & layerL);

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** RemoveLayer ******************/
		%feature("compactdefaultargs") RemoveLayer;
		%feature("autodoc", "Removes layer from the layertable.

Parameters
----------
lab: TDF_Label

Returns
-------
None
") RemoveLayer;
		void RemoveLayer(const TDF_Label & lab);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
with: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & with);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Creates (if not exist) layertool.

Parameters
----------
L: TDF_Label

Returns
-------
opencascade::handle<XCAFDoc_LayerTool>
") Set;
		static opencascade::handle<XCAFDoc_LayerTool> Set(const TDF_Label & L);

		/****************** SetLayer ******************/
		%feature("compactdefaultargs") SetLayer;
		%feature("autodoc", "Sets a link from label <l> to layer defined by <layerl> optional parametr <shapeinonelayer> show could shape be in number of layers or only in one.

Parameters
----------
L: TDF_Label
LayerL: TDF_Label
shapeInOneLayer: bool,optional
	default value is Standard_False

Returns
-------
None
") SetLayer;
		void SetLayer(const TDF_Label & L, const TDF_Label & LayerL, const Standard_Boolean shapeInOneLayer = Standard_False);

		/****************** SetLayer ******************/
		%feature("compactdefaultargs") SetLayer;
		%feature("autodoc", "Sets a link from label <l> to layer <alayer> in the layertable adds a layer as necessary optional parametr <shapeinonelayer> show could shape be in number of layers or only in one.

Parameters
----------
L: TDF_Label
aLayer: TCollection_ExtendedString
shapeInOneLayer: bool,optional
	default value is Standard_False

Returns
-------
None
") SetLayer;
		void SetLayer(const TDF_Label & L, const TCollection_ExtendedString & aLayer, const Standard_Boolean shapeInOneLayer = Standard_False);

		/****************** SetLayer ******************/
		%feature("compactdefaultargs") SetLayer;
		%feature("autodoc", "Sets a link from label that containig shape <sh> with layer that situated at label <layerl>. optional parametr <shapeinonelayer> show could shape be in number of layers or only in one. return false if no such shape <sh> or label <layerl>.

Parameters
----------
Sh: TopoDS_Shape
LayerL: TDF_Label
shapeInOneLayer: bool,optional
	default value is Standard_False

Returns
-------
bool
") SetLayer;
		Standard_Boolean SetLayer(const TopoDS_Shape & Sh, const TDF_Label & LayerL, const Standard_Boolean shapeInOneLayer = Standard_False);

		/****************** SetLayer ******************/
		%feature("compactdefaultargs") SetLayer;
		%feature("autodoc", "Sets a link from label that containig shape <sh> with layer <alayer>. add <alayer> to layertable if nessesery. optional parametr <shapeinonelayer> show could shape be in number of layers or only in one. return false if no such shape <sh>.

Parameters
----------
Sh: TopoDS_Shape
aLayer: TCollection_ExtendedString
shapeInOneLayer: bool,optional
	default value is Standard_False

Returns
-------
bool
") SetLayer;
		Standard_Boolean SetLayer(const TopoDS_Shape & Sh, const TCollection_ExtendedString & aLayer, const Standard_Boolean shapeInOneLayer = Standard_False);

		/****************** SetVisibility ******************/
		%feature("compactdefaultargs") SetVisibility;
		%feature("autodoc", "Set the visibility of layer. if layer is invisible when on it's layer will set uattribute with corresponding guid.

Parameters
----------
layerL: TDF_Label
isvisible: bool,optional
	default value is Standard_True

Returns
-------
None
") SetVisibility;
		void SetVisibility(const TDF_Label & layerL, const Standard_Boolean isvisible = Standard_True);

		/****************** ShapeTool ******************/
		%feature("compactdefaultargs") ShapeTool;
		%feature("autodoc", "Returns internal xcafdoc_shapetool tool.

Returns
-------
opencascade::handle<XCAFDoc_ShapeTool>
") ShapeTool;
		const opencascade::handle<XCAFDoc_ShapeTool> & ShapeTool();

		/****************** UnSetLayers ******************/
		%feature("compactdefaultargs") UnSetLayers;
		%feature("autodoc", "Removes a link from label <l> to all layers.

Parameters
----------
L: TDF_Label

Returns
-------
None
") UnSetLayers;
		void UnSetLayers(const TDF_Label & L);

		/****************** UnSetLayers ******************/
		%feature("compactdefaultargs") UnSetLayers;
		%feature("autodoc", "Remove link between shape <sh> and all layers at layertable. return false if no such shape <sh> in xcaf document.

Parameters
----------
Sh: TopoDS_Shape

Returns
-------
bool
") UnSetLayers;
		Standard_Boolean UnSetLayers(const TopoDS_Shape & Sh);

		/****************** UnSetOneLayer ******************/
		%feature("compactdefaultargs") UnSetOneLayer;
		%feature("autodoc", "Remove link from label <l> and layer <alayer>. returns false if no such layer.

Parameters
----------
L: TDF_Label
aLayer: TCollection_ExtendedString

Returns
-------
bool
") UnSetOneLayer;
		Standard_Boolean UnSetOneLayer(const TDF_Label & L, const TCollection_ExtendedString & aLayer);

		/****************** UnSetOneLayer ******************/
		%feature("compactdefaultargs") UnSetOneLayer;
		%feature("autodoc", "Remove link from label <l> and layer <alayerl>. returns false if <alayerl> is not a layer label.

Parameters
----------
L: TDF_Label
aLayerL: TDF_Label

Returns
-------
bool
") UnSetOneLayer;
		Standard_Boolean UnSetOneLayer(const TDF_Label & L, const TDF_Label & aLayerL);

		/****************** UnSetOneLayer ******************/
		%feature("compactdefaultargs") UnSetOneLayer;
		%feature("autodoc", "Remove link between shape <sh> and layer <alayer>. returns false if no such layer <alayer> or shape <sh>.

Parameters
----------
Sh: TopoDS_Shape
aLayer: TCollection_ExtendedString

Returns
-------
bool
") UnSetOneLayer;
		Standard_Boolean UnSetOneLayer(const TopoDS_Shape & Sh, const TCollection_ExtendedString & aLayer);

		/****************** UnSetOneLayer ******************/
		%feature("compactdefaultargs") UnSetOneLayer;
		%feature("autodoc", "Remove link between shape <sh> and layer <alayerl>. returns false if no such layer <alayerl> or shape <sh>.

Parameters
----------
Sh: TopoDS_Shape
aLayerL: TDF_Label

Returns
-------
bool
") UnSetOneLayer;
		Standard_Boolean UnSetOneLayer(const TopoDS_Shape & Sh, const TDF_Label & aLayerL);

};


%make_alias(XCAFDoc_LayerTool)

%extend XCAFDoc_LayerTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class XCAFDoc_Location *
*************************/
class XCAFDoc_Location : public TDF_Attribute {
	public:
		/****************** XCAFDoc_Location ******************/
		%feature("compactdefaultargs") XCAFDoc_Location;
		%feature("autodoc", "Class methods =============.

Returns
-------
None
") XCAFDoc_Location;
		 XCAFDoc_Location();

		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Returns true if there is a reference on the same label.

Returns
-------
TopLoc_Location
") Get;
		const TopLoc_Location & Get();

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
Into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
With: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Find, or create, a location attribute and set it's value the location attribute is returned. location methods ===============.

Parameters
----------
label: TDF_Label
Loc: TopLoc_Location

Returns
-------
opencascade::handle<XCAFDoc_Location>
") Set;
		static opencascade::handle<XCAFDoc_Location> Set(const TDF_Label & label, const TopLoc_Location & Loc);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
Loc: TopLoc_Location

Returns
-------
None
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
		/****************** XCAFDoc_Material ******************/
		%feature("compactdefaultargs") XCAFDoc_Material;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") XCAFDoc_Material;
		 XCAFDoc_Material();

		/****************** GetDensName ******************/
		%feature("compactdefaultargs") GetDensName;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") GetDensName;
		opencascade::handle<TCollection_HAsciiString> GetDensName();

		/****************** GetDensValType ******************/
		%feature("compactdefaultargs") GetDensValType;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") GetDensValType;
		opencascade::handle<TCollection_HAsciiString> GetDensValType();

		/****************** GetDensity ******************/
		%feature("compactdefaultargs") GetDensity;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") GetDensity;
		Standard_Real GetDensity();

		/****************** GetDescription ******************/
		%feature("compactdefaultargs") GetDescription;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") GetDescription;
		opencascade::handle<TCollection_HAsciiString> GetDescription();

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** GetName ******************/
		%feature("compactdefaultargs") GetName;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") GetName;
		opencascade::handle<TCollection_HAsciiString> GetName();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
Into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
With: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
label: TDF_Label
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
aDensity: float
aDensName: TCollection_HAsciiString
aDensValType: TCollection_HAsciiString

Returns
-------
opencascade::handle<XCAFDoc_Material>
") Set;
		static opencascade::handle<XCAFDoc_Material> Set(const TDF_Label & label, const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription, const Standard_Real aDensity, const opencascade::handle<TCollection_HAsciiString> & aDensName, const opencascade::handle<TCollection_HAsciiString> & aDensValType);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
aDensity: float
aDensName: TCollection_HAsciiString
aDensValType: TCollection_HAsciiString

Returns
-------
None
") Set;
		void Set(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription, const Standard_Real aDensity, const opencascade::handle<TCollection_HAsciiString> & aDensName, const opencascade::handle<TCollection_HAsciiString> & aDensValType);

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
class XCAFDoc_MaterialTool : public TDF_Attribute {
	public:
		/****************** XCAFDoc_MaterialTool ******************/
		%feature("compactdefaultargs") XCAFDoc_MaterialTool;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") XCAFDoc_MaterialTool;
		 XCAFDoc_MaterialTool();

		/****************** AddMaterial ******************/
		%feature("compactdefaultargs") AddMaterial;
		%feature("autodoc", "Adds a material definition to a table and returns its label.

Parameters
----------
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
aDensity: float
aDensName: TCollection_HAsciiString
aDensValType: TCollection_HAsciiString

Returns
-------
TDF_Label
") AddMaterial;
		TDF_Label AddMaterial(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription, const Standard_Real aDensity, const opencascade::handle<TCollection_HAsciiString> & aDensName, const opencascade::handle<TCollection_HAsciiString> & aDensValType);

		/****************** BaseLabel ******************/
		%feature("compactdefaultargs") BaseLabel;
		%feature("autodoc", "Returns the label under which colors are stored.

Returns
-------
TDF_Label
") BaseLabel;
		TDF_Label BaseLabel();

		/****************** GetDensityForShape ******************/
		%feature("compactdefaultargs") GetDensityForShape;
		%feature("autodoc", "Find referred material and return density from it if no material --> return 0.

Parameters
----------
ShapeL: TDF_Label

Returns
-------
float
") GetDensityForShape;
		static Standard_Real GetDensityForShape(const TDF_Label & ShapeL);

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** GetMaterial ******************/
		%feature("compactdefaultargs") GetMaterial;
		%feature("autodoc", "Returns material assigned to <matl> returns false if no such material is assigned.

Parameters
----------
MatL: TDF_Label
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
aDensName: TCollection_HAsciiString
aDensValType: TCollection_HAsciiString

Returns
-------
aDensity: float
") GetMaterial;
		Standard_Boolean GetMaterial(const TDF_Label & MatL, opencascade::handle<TCollection_HAsciiString> & aName, opencascade::handle<TCollection_HAsciiString> & aDescription, Standard_Real &OutValue, opencascade::handle<TCollection_HAsciiString> & aDensName, opencascade::handle<TCollection_HAsciiString> & aDensValType);

		/****************** GetMaterialLabels ******************/
		%feature("compactdefaultargs") GetMaterialLabels;
		%feature("autodoc", "Returns a sequence of materials currently stored in the material table.

Parameters
----------
Labels: TDF_LabelSequence

Returns
-------
None
") GetMaterialLabels;
		void GetMaterialLabels(TDF_LabelSequence & Labels);

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** IsMaterial ******************/
		%feature("compactdefaultargs") IsMaterial;
		%feature("autodoc", "Returns true if label belongs to a material table and is a material definition.

Parameters
----------
lab: TDF_Label

Returns
-------
bool
") IsMaterial;
		Standard_Boolean IsMaterial(const TDF_Label & lab);

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
with: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & with);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Creates (if not exist) materialtool.

Parameters
----------
L: TDF_Label

Returns
-------
opencascade::handle<XCAFDoc_MaterialTool>
") Set;
		static opencascade::handle<XCAFDoc_MaterialTool> Set(const TDF_Label & L);

		/****************** SetMaterial ******************/
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "Sets a link with guid.

Parameters
----------
L: TDF_Label
MatL: TDF_Label

Returns
-------
None
") SetMaterial;
		void SetMaterial(const TDF_Label & L, const TDF_Label & MatL);

		/****************** SetMaterial ******************/
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "Sets a link with guid adds a material as necessary.

Parameters
----------
L: TDF_Label
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
aDensity: float
aDensName: TCollection_HAsciiString
aDensValType: TCollection_HAsciiString

Returns
-------
None
") SetMaterial;
		void SetMaterial(const TDF_Label & L, const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription, const Standard_Real aDensity, const opencascade::handle<TCollection_HAsciiString> & aDensName, const opencascade::handle<TCollection_HAsciiString> & aDensValType);

		/****************** ShapeTool ******************/
		%feature("compactdefaultargs") ShapeTool;
		%feature("autodoc", "Returns internal xcafdoc_shapetool tool.

Returns
-------
opencascade::handle<XCAFDoc_ShapeTool>
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

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Finds a reference attribute on the given label and returns it, if it is found.

Parameters
----------
theLabel: TDF_Label

Returns
-------
opencascade::handle<XCAFDoc_Note>
") Get;
		static opencascade::handle<XCAFDoc_Note> Get(const TDF_Label & theLabel);

		/****************** GetObject ******************/
		%feature("compactdefaultargs") GetObject;
		%feature("autodoc", "Returns auxiliary data object.

Returns
-------
opencascade::handle<XCAFNoteObjects_NoteObject>
") GetObject;
		opencascade::handle<XCAFNoteObjects_NoteObject> GetObject();

		/****************** IsMine ******************/
		%feature("compactdefaultargs") IsMine;
		%feature("autodoc", "Checks if the given label represents a note.

Parameters
----------
theLabel: TDF_Label

Returns
-------
bool
") IsMine;
		static Standard_Boolean IsMine(const TDF_Label & theLabel);

		/****************** IsOrphan ******************/
		%feature("compactdefaultargs") IsOrphan;
		%feature("autodoc", "Checks if the note isn't linked to annotated items.

Returns
-------
bool
") IsOrphan;
		Standard_Boolean IsOrphan();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
theAttrInto: TDF_Attribute
theRT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & theAttrInto, const opencascade::handle<TDF_RelocationTable> & theRT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
theAttrFrom: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & theAttrFrom);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the user name and the timestamp of the note. \param [in] theusername - the user associated with the note. \param [in] thetimestamp - timestamp of the note. eturn a handle to the attribute instance.

Parameters
----------
theUserName: TCollection_ExtendedString
theTimeStamp: TCollection_ExtendedString

Returns
-------
None
") Set;
		void Set(const TCollection_ExtendedString & theUserName, const TCollection_ExtendedString & theTimeStamp);

		/****************** SetObject ******************/
		%feature("compactdefaultargs") SetObject;
		%feature("autodoc", "Updates auxiliary data.

Parameters
----------
theObject: XCAFNoteObjects_NoteObject

Returns
-------
None
") SetObject;
		void SetObject(const opencascade::handle<XCAFNoteObjects_NoteObject> & theObject);

		/****************** TimeStamp ******************/
		%feature("compactdefaultargs") TimeStamp;
		%feature("autodoc", "Returns the timestamp of the note.

Returns
-------
TCollection_ExtendedString
") TimeStamp;
		const TCollection_ExtendedString & TimeStamp();

		/****************** UserName ******************/
		%feature("compactdefaultargs") UserName;
		%feature("autodoc", "Returns the user name, who created the note.

Returns
-------
TCollection_ExtendedString
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
class XCAFDoc_NotesTool : public TDF_Attribute {
	public:
		/****************** XCAFDoc_NotesTool ******************/
		%feature("compactdefaultargs") XCAFDoc_NotesTool;
		%feature("autodoc", "Creates an empty notes tool.

Returns
-------
None
") XCAFDoc_NotesTool;
		 XCAFDoc_NotesTool();

		/****************** AddNote ******************/
		%feature("compactdefaultargs") AddNote;
		%feature("autodoc", "Adds the given note to the assembly item. \param [in] thenotelabel - note label. \param [in] theitemid - assembly item id. eturn a handle to the assembly reference attribute.

Parameters
----------
theNoteLabel: TDF_Label
theItemId: XCAFDoc_AssemblyItemId

Returns
-------
opencascade::handle<XCAFDoc_AssemblyItemRef>
") AddNote;
		opencascade::handle<XCAFDoc_AssemblyItemRef> AddNote(const TDF_Label & theNoteLabel, const XCAFDoc_AssemblyItemId & theItemId);

		/****************** AddNote ******************/
		%feature("compactdefaultargs") AddNote;
		%feature("autodoc", "Adds the given note to the labeled item. \param [in] thenotelabel - note label. \param [in] theitemlabel - item label. eturn a handle to the assembly reference attribute.

Parameters
----------
theNoteLabel: TDF_Label
theItemLabel: TDF_Label

Returns
-------
opencascade::handle<XCAFDoc_AssemblyItemRef>
") AddNote;
		opencascade::handle<XCAFDoc_AssemblyItemRef> AddNote(const TDF_Label & theNoteLabel, const TDF_Label & theItemLabel);

		/****************** AddNoteToAttr ******************/
		%feature("compactdefaultargs") AddNoteToAttr;
		%feature("autodoc", "Adds the given note to the assembly item's attribute. \param [in] thenotelabel - note label. \param [in] theitemid - assembly item id. \param [in] theguid - assembly item's attribute guid. eturn a handle to the assembly reference attribute.

Parameters
----------
theNoteLabel: TDF_Label
theItemId: XCAFDoc_AssemblyItemId
theGUID: Standard_GUID

Returns
-------
opencascade::handle<XCAFDoc_AssemblyItemRef>
") AddNoteToAttr;
		opencascade::handle<XCAFDoc_AssemblyItemRef> AddNoteToAttr(const TDF_Label & theNoteLabel, const XCAFDoc_AssemblyItemId & theItemId, const Standard_GUID & theGUID);

		/****************** AddNoteToAttr ******************/
		%feature("compactdefaultargs") AddNoteToAttr;
		%feature("autodoc", "Adds the given note to the labeled item's attribute. \param [in] thenotelabel - note label. \param [in] theitemlabel - item label. \param [in] theguid - assembly item's attribute guid. eturn a handle to the assembly reference attribute.

Parameters
----------
theNoteLabel: TDF_Label
theItemLabel: TDF_Label
theGUID: Standard_GUID

Returns
-------
opencascade::handle<XCAFDoc_AssemblyItemRef>
") AddNoteToAttr;
		opencascade::handle<XCAFDoc_AssemblyItemRef> AddNoteToAttr(const TDF_Label & theNoteLabel, const TDF_Label & theItemLabel, const Standard_GUID & theGUID);

		/****************** AddNoteToSubshape ******************/
		%feature("compactdefaultargs") AddNoteToSubshape;
		%feature("autodoc", "Adds the given note to the assembly item's subshape. \param [in] thenotelabel - note label. \param [in] theitemid - assembly item id. \param [in] thesubshapeindex - assembly item's subshape index. eturn a handle to the assembly reference attribute.

Parameters
----------
theNoteLabel: TDF_Label
theItemId: XCAFDoc_AssemblyItemId
theSubshapeIndex: int

Returns
-------
opencascade::handle<XCAFDoc_AssemblyItemRef>
") AddNoteToSubshape;
		opencascade::handle<XCAFDoc_AssemblyItemRef> AddNoteToSubshape(const TDF_Label & theNoteLabel, const XCAFDoc_AssemblyItemId & theItemId, Standard_Integer theSubshapeIndex);

		/****************** AddNoteToSubshape ******************/
		%feature("compactdefaultargs") AddNoteToSubshape;
		%feature("autodoc", "Adds the given note to the labeled item's subshape. \param [in] thenotelabel - note label. \param [in] theitemlabel - item label. \param [in] thesubshapeindex - assembly item's subshape index. eturn a handle to the assembly reference attribute.

Parameters
----------
theNoteLabel: TDF_Label
theItemLabel: TDF_Label
theSubshapeIndex: int

Returns
-------
opencascade::handle<XCAFDoc_AssemblyItemRef>
") AddNoteToSubshape;
		opencascade::handle<XCAFDoc_AssemblyItemRef> AddNoteToSubshape(const TDF_Label & theNoteLabel, const TDF_Label & theItemLabel, Standard_Integer theSubshapeIndex);

		/****************** CreateBalloon ******************/
		%feature("compactdefaultargs") CreateBalloon;
		%feature("autodoc", "Create a new 'balloon' note. creates a new label under the notes hive and attaches ef xcafdoc_noteballoon attribute (derived ftom ef xcafdoc_note). \param [in] theusername - the user associated with the note. \param [in] thetimestamp - timestamp of the note. \param [in] thecomment - textual comment. eturn a handle to the base note attribute.

Parameters
----------
theUserName: TCollection_ExtendedString
theTimeStamp: TCollection_ExtendedString
theComment: TCollection_ExtendedString

Returns
-------
opencascade::handle<XCAFDoc_Note>
") CreateBalloon;
		opencascade::handle<XCAFDoc_Note> CreateBalloon(const TCollection_ExtendedString & theUserName, const TCollection_ExtendedString & theTimeStamp, const TCollection_ExtendedString & theComment);

		/****************** CreateBinData ******************/
		%feature("compactdefaultargs") CreateBinData;
		%feature("autodoc", "Create a new note with data loaded from a binary file. creates a new label under the notes hive and attaches ef xcafdoc_notecomment attribute (derived ftom ef xcafdoc_note). \param [in] theusername - the user associated with the note. \param [in] thetimestamp - timestamp of the note. \param [in] thetitle - file title. \param [in] themimetype - mime type of the file. \param [in] thefile - input binary file. eturn a handle to the base note attribute.

Parameters
----------
theUserName: TCollection_ExtendedString
theTimeStamp: TCollection_ExtendedString
theTitle: TCollection_ExtendedString
theMIMEtype: TCollection_AsciiString
theFile: OSD_File

Returns
-------
opencascade::handle<XCAFDoc_Note>
") CreateBinData;
		opencascade::handle<XCAFDoc_Note> CreateBinData(const TCollection_ExtendedString & theUserName, const TCollection_ExtendedString & theTimeStamp, const TCollection_ExtendedString & theTitle, const TCollection_AsciiString & theMIMEtype, OSD_File & theFile);

		/****************** CreateBinData ******************/
		%feature("compactdefaultargs") CreateBinData;
		%feature("autodoc", "Create a new note with data loaded from a byte data array. creates a new label under the notes hive and attaches ef xcafdoc_notecomment attribute (derived ftom ef xcafdoc_note). \param [in] theusername - the user associated with the note. \param [in] thetimestamp - timestamp of the note. \param [in] thetitle - data title. \param [in] themimetype - mime type of the file. \param [in] thedata - byte data array. eturn a handle to the base note attribute.

Parameters
----------
theUserName: TCollection_ExtendedString
theTimeStamp: TCollection_ExtendedString
theTitle: TCollection_ExtendedString
theMIMEtype: TCollection_AsciiString
theData: TColStd_HArray1OfByte

Returns
-------
opencascade::handle<XCAFDoc_Note>
") CreateBinData;
		opencascade::handle<XCAFDoc_Note> CreateBinData(const TCollection_ExtendedString & theUserName, const TCollection_ExtendedString & theTimeStamp, const TCollection_ExtendedString & theTitle, const TCollection_AsciiString & theMIMEtype, const opencascade::handle<TColStd_HArray1OfByte> & theData);

		/****************** CreateComment ******************/
		%feature("compactdefaultargs") CreateComment;
		%feature("autodoc", "Create a new comment note. creates a new label under the notes hive and attaches ef xcafdoc_notecomment attribute (derived ftom ef xcafdoc_note). \param [in] theusername - the user associated with the note. \param [in] thetimestamp - timestamp of the note. \param [in] thecomment - textual comment. eturn a handle to the base note attribute.

Parameters
----------
theUserName: TCollection_ExtendedString
theTimeStamp: TCollection_ExtendedString
theComment: TCollection_ExtendedString

Returns
-------
opencascade::handle<XCAFDoc_Note>
") CreateComment;
		opencascade::handle<XCAFDoc_Note> CreateComment(const TCollection_ExtendedString & theUserName, const TCollection_ExtendedString & theTimeStamp, const TCollection_ExtendedString & theComment);

		/****************** DeleteAllNotes ******************/
		%feature("compactdefaultargs") DeleteAllNotes;
		%feature("autodoc", "Deletes all notes. clears all annotations. eturn number of deleted notes.

Returns
-------
int
") DeleteAllNotes;
		Standard_Integer DeleteAllNotes();

		/****************** DeleteNote ******************/
		%feature("compactdefaultargs") DeleteNote;
		%feature("autodoc", "Deletes the given note. removes all links with items annotated by the note. \param [in] thenotelabel - note label. eturn true if the note is deleted, otherwise - false.

Parameters
----------
theNoteLabel: TDF_Label

Returns
-------
bool
") DeleteNote;
		Standard_Boolean DeleteNote(const TDF_Label & theNoteLabel);

		/****************** DeleteNotes ******************/
		%feature("compactdefaultargs") DeleteNotes;
		%feature("autodoc", "Deletes the given notes. removes all links with items annotated by the notes. \param [in] thenotelabels - note label sequence. eturn number of deleted notes.

Parameters
----------
theNoteLabels: TDF_LabelSequence

Returns
-------
int
") DeleteNotes;
		Standard_Integer DeleteNotes(TDF_LabelSequence & theNoteLabels);

		/****************** DeleteOrphanNotes ******************/
		%feature("compactdefaultargs") DeleteOrphanNotes;
		%feature("autodoc", "Deletes all notes that aren't linked to annotated items. eturn number of deleted notes.

Returns
-------
int
") DeleteOrphanNotes;
		Standard_Integer DeleteOrphanNotes();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** FindAnnotatedItem ******************/
		%feature("compactdefaultargs") FindAnnotatedItem;
		%feature("autodoc", "Finds a label of the given assembly item id in the annotated items hive. \param [in] theitemid - assembly item id. eturn annotated item label if it is found, otherwise - null label.

Parameters
----------
theItemId: XCAFDoc_AssemblyItemId

Returns
-------
TDF_Label
") FindAnnotatedItem;
		TDF_Label FindAnnotatedItem(const XCAFDoc_AssemblyItemId & theItemId);

		/****************** FindAnnotatedItem ******************/
		%feature("compactdefaultargs") FindAnnotatedItem;
		%feature("autodoc", "Finds a label of the given labeled item in the annotated items hive. \param [in] theitemlabel - item label. eturn annotated item label if it is found, otherwise - null label.

Parameters
----------
theItemLabel: TDF_Label

Returns
-------
TDF_Label
") FindAnnotatedItem;
		TDF_Label FindAnnotatedItem(const TDF_Label & theItemLabel);

		/****************** FindAnnotatedItemAttr ******************/
		%feature("compactdefaultargs") FindAnnotatedItemAttr;
		%feature("autodoc", "Finds a label of the given assembly item's attribute in the annotated items hive. \param [in] theitemid - assembly item id. \param [in] theguid - assembly item's attribute guid. eturn annotated item label if it is found, otherwise - null label.

Parameters
----------
theItemId: XCAFDoc_AssemblyItemId
theGUID: Standard_GUID

Returns
-------
TDF_Label
") FindAnnotatedItemAttr;
		TDF_Label FindAnnotatedItemAttr(const XCAFDoc_AssemblyItemId & theItemId, const Standard_GUID & theGUID);

		/****************** FindAnnotatedItemAttr ******************/
		%feature("compactdefaultargs") FindAnnotatedItemAttr;
		%feature("autodoc", "Finds a label of the given labeled item's attribute in the annotated items hive. \param [in] theitemlabel - item label. \param [in] theguid - item's attribute guid. eturn annotated item label if it is found, otherwise - null label.

Parameters
----------
theItemLabel: TDF_Label
theGUID: Standard_GUID

Returns
-------
TDF_Label
") FindAnnotatedItemAttr;
		TDF_Label FindAnnotatedItemAttr(const TDF_Label & theItemLabel, const Standard_GUID & theGUID);

		/****************** FindAnnotatedItemSubshape ******************/
		%feature("compactdefaultargs") FindAnnotatedItemSubshape;
		%feature("autodoc", "Finds a label of the given assembly item's subshape in the annotated items hive. \param [in] theitemid - assembly item id. \param [in] thesubshapeindex - assembly item's subshape index. eturn annotated item label if it is found, otherwise - null label.

Parameters
----------
theItemId: XCAFDoc_AssemblyItemId
theSubshapeIndex: int

Returns
-------
TDF_Label
") FindAnnotatedItemSubshape;
		TDF_Label FindAnnotatedItemSubshape(const XCAFDoc_AssemblyItemId & theItemId, Standard_Integer theSubshapeIndex);

		/****************** FindAnnotatedItemSubshape ******************/
		%feature("compactdefaultargs") FindAnnotatedItemSubshape;
		%feature("autodoc", "Finds a label of the given labeled item's subshape in the annotated items hive. \param [in] theitemlabel - item label. \param [in] thesubshapeindex - labeled item's subshape index. eturn annotated item label if it is found, otherwise - null label.

Parameters
----------
theItemLabel: TDF_Label
theSubshapeIndex: int

Returns
-------
TDF_Label
") FindAnnotatedItemSubshape;
		TDF_Label FindAnnotatedItemSubshape(const TDF_Label & theItemLabel, Standard_Integer theSubshapeIndex);

		/****************** GetAnnotatedItems ******************/
		%feature("compactdefaultargs") GetAnnotatedItems;
		%feature("autodoc", "Returns all labels from the annotated items hive. the label sequence isn't cleared beforehand. \param [out] thenotelabels - sequence of labels.

Parameters
----------
theLabels: TDF_LabelSequence

Returns
-------
None
") GetAnnotatedItems;
		void GetAnnotatedItems(TDF_LabelSequence & theLabels);

		/****************** GetAnnotatedItemsLabel ******************/
		%feature("compactdefaultargs") GetAnnotatedItemsLabel;
		%feature("autodoc", "Returns the label of the annotated items hive.

Returns
-------
TDF_Label
") GetAnnotatedItemsLabel;
		TDF_Label GetAnnotatedItemsLabel();

		/****************** GetAttrNotes ******************/
		%feature("compactdefaultargs") GetAttrNotes;
		%feature("autodoc", "Gets all note labels of the assembly item's attribute. notes linked to the item itself or to item's subshapes aren't taken into account. the label sequence isn't cleared beforehand. \param [in] theitemid - assembly item id. \param [in] theguid - assembly item's attribute guid. \param [out] thenotelabels - sequence of labels. eturn number of added labels.

Parameters
----------
theItemId: XCAFDoc_AssemblyItemId
theGUID: Standard_GUID
theNoteLabels: TDF_LabelSequence

Returns
-------
int
") GetAttrNotes;
		Standard_Integer GetAttrNotes(const XCAFDoc_AssemblyItemId & theItemId, const Standard_GUID & theGUID, TDF_LabelSequence & theNoteLabels);

		/****************** GetAttrNotes ******************/
		%feature("compactdefaultargs") GetAttrNotes;
		%feature("autodoc", "Gets all note labels of the labeled item's attribute. notes linked to the item itself or to item's subshapes aren't taken into account. the label sequence isn't cleared beforehand. \param [in] theitemlabel - item label. \param [in] theguid - item's attribute guid. \param [out] thenotelabels - sequence of labels. eturn number of added labels.

Parameters
----------
theItemLabel: TDF_Label
theGUID: Standard_GUID
theNoteLabels: TDF_LabelSequence

Returns
-------
int
") GetAttrNotes;
		Standard_Integer GetAttrNotes(const TDF_Label & theItemLabel, const Standard_GUID & theGUID, TDF_LabelSequence & theNoteLabels);

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Returns default attribute guid.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** GetNotes ******************/
		%feature("compactdefaultargs") GetNotes;
		%feature("autodoc", "Returns all labels from the notes hive. the label sequence isn't cleared beforehand. \param [out] thenotelabels - sequence of labels.

Parameters
----------
theNoteLabels: TDF_LabelSequence

Returns
-------
None
") GetNotes;
		void GetNotes(TDF_LabelSequence & theNoteLabels);

		/****************** GetNotes ******************/
		%feature("compactdefaultargs") GetNotes;
		%feature("autodoc", "Gets all note labels of the assembly item. notes linked to item's subshapes or attributes aren't taken into account. the label sequence isn't cleared beforehand. \param [in] theitemid - assembly item id. \param [out] thenotelabels - sequence of labels. eturn number of added labels.

Parameters
----------
theItemId: XCAFDoc_AssemblyItemId
theNoteLabels: TDF_LabelSequence

Returns
-------
int
") GetNotes;
		Standard_Integer GetNotes(const XCAFDoc_AssemblyItemId & theItemId, TDF_LabelSequence & theNoteLabels);

		/****************** GetNotes ******************/
		%feature("compactdefaultargs") GetNotes;
		%feature("autodoc", "Gets all note labels of the labeled item. notes linked to item's attributes aren't taken into account. the label sequence isn't cleared beforehand. \param [in] theitemlabel - item label. \param [out] thenotelabels - sequence of labels. eturn number of added labels.

Parameters
----------
theItemLabel: TDF_Label
theNoteLabels: TDF_LabelSequence

Returns
-------
int
") GetNotes;
		Standard_Integer GetNotes(const TDF_Label & theItemLabel, TDF_LabelSequence & theNoteLabels);

		/****************** GetNotesLabel ******************/
		%feature("compactdefaultargs") GetNotesLabel;
		%feature("autodoc", "Returns the label of the notes hive.

Returns
-------
TDF_Label
") GetNotesLabel;
		TDF_Label GetNotesLabel();

		/****************** GetOrphanNotes ******************/
		%feature("compactdefaultargs") GetOrphanNotes;
		%feature("autodoc", "Returns note labels that aren't linked to annotated items. the label sequence isn't cleared beforehand. \param [out] thenotelabels - sequence of labels.

Parameters
----------
theNoteLabels: TDF_LabelSequence

Returns
-------
None
") GetOrphanNotes;
		void GetOrphanNotes(TDF_LabelSequence & theNoteLabels);

		/****************** GetSubshapeNotes ******************/
		%feature("compactdefaultargs") GetSubshapeNotes;
		%feature("autodoc", "Gets all note labels of the annotated item. notes linked to the item itself or to item's attributes taken into account. the label sequence isn't cleared beforehand. \param [in] theitemid - assembly item id. \param [in] thesubshapeindex - assembly item's subshape index. \param [out] thenotelabels - sequence of labels. eturn number of added labels.

Parameters
----------
theItemId: XCAFDoc_AssemblyItemId
theSubshapeIndex: int
theNoteLabels: TDF_LabelSequence

Returns
-------
int
") GetSubshapeNotes;
		Standard_Integer GetSubshapeNotes(const XCAFDoc_AssemblyItemId & theItemId, Standard_Integer theSubshapeIndex, TDF_LabelSequence & theNoteLabels);

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** IsAnnotatedItem ******************/
		%feature("compactdefaultargs") IsAnnotatedItem;
		%feature("autodoc", "Checks if the given assembly item is annotated. \param [in] theitemid - assembly item id. eturn true if the item is annotated, otherwise - false.

Parameters
----------
theItemId: XCAFDoc_AssemblyItemId

Returns
-------
bool
") IsAnnotatedItem;
		Standard_Boolean IsAnnotatedItem(const XCAFDoc_AssemblyItemId & theItemId);

		/****************** IsAnnotatedItem ******************/
		%feature("compactdefaultargs") IsAnnotatedItem;
		%feature("autodoc", "Checks if the given labeled item is annotated. \param [in] theitemlabel - item label. eturn true if the item is annotated, otherwise - false.

Parameters
----------
theItemLabel: TDF_Label

Returns
-------
bool
") IsAnnotatedItem;
		Standard_Boolean IsAnnotatedItem(const TDF_Label & theItemLabel);

		/****************** NbAnnotatedItems ******************/
		%feature("compactdefaultargs") NbAnnotatedItems;
		%feature("autodoc", "Returns the number of labels in the annotated items hive.

Returns
-------
int
") NbAnnotatedItems;
		Standard_Integer NbAnnotatedItems();

		/****************** NbNotes ******************/
		%feature("compactdefaultargs") NbNotes;
		%feature("autodoc", "Returns the number of labels in the notes hive.

Returns
-------
int
") NbNotes;
		Standard_Integer NbNotes();

		/****************** NbOrphanNotes ******************/
		%feature("compactdefaultargs") NbOrphanNotes;
		%feature("autodoc", "Returns number of notes that aren't linked to annotated items.

Returns
-------
int
") NbOrphanNotes;
		Standard_Integer NbOrphanNotes();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
theAttrInto: TDF_Attribute
theRT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & theAttrInto, const opencascade::handle<TDF_RelocationTable> & theRT);

		/****************** RemoveAllAttrNotes ******************/
		%feature("compactdefaultargs") RemoveAllAttrNotes;
		%feature("autodoc", "Removes all notes from the assembly item's attribute. \param [in] theitemid - assembly item id. \param [in] theguid - assembly item's attribute guid. \param [in] thedeliforphan - deletes removed notes from the notes  hive if there are no more annotated items  linked with the notes. eturn true if the notes are removed, otherwise - false.

Parameters
----------
theItemId: XCAFDoc_AssemblyItemId
theGUID: Standard_GUID
theDelIfOrphan: bool,optional
	default value is Standard_False

Returns
-------
bool
") RemoveAllAttrNotes;
		Standard_Boolean RemoveAllAttrNotes(const XCAFDoc_AssemblyItemId & theItemId, const Standard_GUID & theGUID, Standard_Boolean theDelIfOrphan = Standard_False);

		/****************** RemoveAllAttrNotes ******************/
		%feature("compactdefaultargs") RemoveAllAttrNotes;
		%feature("autodoc", "Removes all notes from the labeled item's attribute. \param [in] theitemlabel - item label. \param [in] theguid - labeled item's attribute guid. \param [in] thedeliforphan - deletes removed notes from the notes  hive if there are no more annotated items  linked with the notes. eturn true if the notes are removed, otherwise - false.

Parameters
----------
theItemLabel: TDF_Label
theGUID: Standard_GUID
theDelIfOrphan: bool,optional
	default value is Standard_False

Returns
-------
bool
") RemoveAllAttrNotes;
		Standard_Boolean RemoveAllAttrNotes(const TDF_Label & theItemLabel, const Standard_GUID & theGUID, Standard_Boolean theDelIfOrphan = Standard_False);

		/****************** RemoveAllNotes ******************/
		%feature("compactdefaultargs") RemoveAllNotes;
		%feature("autodoc", "Removes all notes from the assembly item. \param [in] theitemid - assembly item id. \param [in] thedeliforphan - deletes removed notes from the notes  hive if there are no more annotated items  linked with the notes. eturn true if the notes are removed, otherwise - false.

Parameters
----------
theItemId: XCAFDoc_AssemblyItemId
theDelIfOrphan: bool,optional
	default value is Standard_False

Returns
-------
bool
") RemoveAllNotes;
		Standard_Boolean RemoveAllNotes(const XCAFDoc_AssemblyItemId & theItemId, Standard_Boolean theDelIfOrphan = Standard_False);

		/****************** RemoveAllNotes ******************/
		%feature("compactdefaultargs") RemoveAllNotes;
		%feature("autodoc", "Removes all notes from the labeled item. \param [in] theitemlabel - item label. \param [in] thedeliforphan - deletes removed notes from the notes  hive if there are no more annotated items  linked with the notes. eturn true if the notes are removed, otherwise - false.

Parameters
----------
theItemLabel: TDF_Label
theDelIfOrphan: bool,optional
	default value is Standard_False

Returns
-------
bool
") RemoveAllNotes;
		Standard_Boolean RemoveAllNotes(const TDF_Label & theItemLabel, Standard_Boolean theDelIfOrphan = Standard_False);

		/****************** RemoveAllSubshapeNotes ******************/
		%feature("compactdefaultargs") RemoveAllSubshapeNotes;
		%feature("autodoc", "Removes all notes from the assembly item's subshape. \param [in] theitemid - assembly item id. \param [in] thesubshapeindex - assembly item's subshape index. \param [in] thedeliforphan - deletes removed notes from the notes  hive if there are no more annotated items  linked with the notes. eturn true if the notes are removed, otherwise - false.

Parameters
----------
theItemId: XCAFDoc_AssemblyItemId
theSubshapeIndex: int
theDelIfOrphan: bool,optional
	default value is Standard_False

Returns
-------
bool
") RemoveAllSubshapeNotes;
		Standard_Boolean RemoveAllSubshapeNotes(const XCAFDoc_AssemblyItemId & theItemId, Standard_Integer theSubshapeIndex, Standard_Boolean theDelIfOrphan = Standard_False);

		/****************** RemoveAttrNote ******************/
		%feature("compactdefaultargs") RemoveAttrNote;
		%feature("autodoc", "Removes a note from the assembly item's attribute. \param [in] thenotelabel - note label. \param [in] theitemid - assembly item id. \param [in] theguid - assembly item's attribute guid. \param [in] thedeliforphan - deletes the note from the notes hive  if there are no more assembly item's  attribute linked with the note. eturn true if the note is removed, otherwise - false.

Parameters
----------
theNoteLabel: TDF_Label
theItemId: XCAFDoc_AssemblyItemId
theGUID: Standard_GUID
theDelIfOrphan: bool,optional
	default value is Standard_False

Returns
-------
bool
") RemoveAttrNote;
		Standard_Boolean RemoveAttrNote(const TDF_Label & theNoteLabel, const XCAFDoc_AssemblyItemId & theItemId, const Standard_GUID & theGUID, Standard_Boolean theDelIfOrphan = Standard_False);

		/****************** RemoveAttrNote ******************/
		%feature("compactdefaultargs") RemoveAttrNote;
		%feature("autodoc", "Removes a note from the labeled item's attribute. \param [in] thenotelabel - note label. \param [in] theitemlabel - item label. \param [in] theguid - labeled item's attribute guid. \param [in] thedeliforphan - deletes the note from the notes hive  if there are no more assembly item's  attribute linked with the note. eturn true if the note is removed, otherwise - false.

Parameters
----------
theNoteLabel: TDF_Label
theItemLabel: TDF_Label
theGUID: Standard_GUID
theDelIfOrphan: bool,optional
	default value is Standard_False

Returns
-------
bool
") RemoveAttrNote;
		Standard_Boolean RemoveAttrNote(const TDF_Label & theNoteLabel, const TDF_Label & theItemLabel, const Standard_GUID & theGUID, Standard_Boolean theDelIfOrphan = Standard_False);

		/****************** RemoveNote ******************/
		%feature("compactdefaultargs") RemoveNote;
		%feature("autodoc", "Removes the given note from the assembly item. \param [in] thenotelabel - note label. \param [in] theitemid - assembly item id. \param [in] thedeliforphan - deletes the note from the notes hive  if there are no more assembly items  linked with the note. eturn true if the note is removed, otherwise - false.

Parameters
----------
theNoteLabel: TDF_Label
theItemId: XCAFDoc_AssemblyItemId
theDelIfOrphan: bool,optional
	default value is Standard_False

Returns
-------
bool
") RemoveNote;
		Standard_Boolean RemoveNote(const TDF_Label & theNoteLabel, const XCAFDoc_AssemblyItemId & theItemId, Standard_Boolean theDelIfOrphan = Standard_False);

		/****************** RemoveNote ******************/
		%feature("compactdefaultargs") RemoveNote;
		%feature("autodoc", "Removes the given note from the labeled item. \param [in] thenotelabel - note label. \param [in] theitemlabel - item label. \param [in] thedeliforphan - deletes the note from the notes hive  if there are no more labeled items  linked with the note. eturn true if the note is removed, otherwise - false.

Parameters
----------
theNoteLabel: TDF_Label
theItemLabel: TDF_Label
theDelIfOrphan: bool,optional
	default value is Standard_False

Returns
-------
bool
") RemoveNote;
		Standard_Boolean RemoveNote(const TDF_Label & theNoteLabel, const TDF_Label & theItemLabel, Standard_Boolean theDelIfOrphan = Standard_False);

		/****************** RemoveSubshapeNote ******************/
		%feature("compactdefaultargs") RemoveSubshapeNote;
		%feature("autodoc", "Removes the given note from the assembly item's subshape. \param [in] thenotelabel - note label. \param [in] theitemid - assembly item id. \param [in] thesubshapeindex - assembly item's subshape index. \param [in] thedeliforphan - deletes the note from the notes hive  if there are no more assembly item's  subshape linked with the note. eturn true if the note is removed, otherwise - false.

Parameters
----------
theNoteLabel: TDF_Label
theItemId: XCAFDoc_AssemblyItemId
theSubshapeIndex: int
theDelIfOrphan: bool,optional
	default value is Standard_False

Returns
-------
bool
") RemoveSubshapeNote;
		Standard_Boolean RemoveSubshapeNote(const TDF_Label & theNoteLabel, const XCAFDoc_AssemblyItemId & theItemId, Standard_Integer theSubshapeIndex, Standard_Boolean theDelIfOrphan = Standard_False);

		/****************** RemoveSubshapeNote ******************/
		%feature("compactdefaultargs") RemoveSubshapeNote;
		%feature("autodoc", "Removes the given note from the labeled item's subshape. \param [in] thenotelabel - note label. \param [in] theitemlabel - item label. \param [in] thesubshapeindex - labeled item's subshape index. \param [in] thedeliforphan - deletes the note from the notes hive  if there are no more assembly item's  subshape linked with the note. eturn true if the note is removed, otherwise - false.

Parameters
----------
theNoteLabel: TDF_Label
theItemLabel: TDF_Label
theSubshapeIndex: int
theDelIfOrphan: bool,optional
	default value is Standard_False

Returns
-------
bool
") RemoveSubshapeNote;
		Standard_Boolean RemoveSubshapeNote(const TDF_Label & theNoteLabel, const TDF_Label & theItemLabel, Standard_Integer theSubshapeIndex, Standard_Boolean theDelIfOrphan = Standard_False);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
theAttrFrom: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & theAttrFrom);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Create (if not exist) a notes tool from xcafdoc on thelabel.

Parameters
----------
theLabel: TDF_Label

Returns
-------
opencascade::handle<XCAFDoc_NotesTool>
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
		/****************** XCAFDoc_ShapeMapTool ******************/
		%feature("compactdefaultargs") XCAFDoc_ShapeMapTool;
		%feature("autodoc", "Creates an empty tool.

Returns
-------
None
") XCAFDoc_ShapeMapTool;
		 XCAFDoc_ShapeMapTool();

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** GetMap ******************/
		%feature("compactdefaultargs") GetMap;
		%feature("autodoc", "No available documentation.

Returns
-------
TopTools_IndexedMapOfShape
") GetMap;
		const TopTools_IndexedMapOfShape & GetMap();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** IsSubShape ******************/
		%feature("compactdefaultargs") IsSubShape;
		%feature("autodoc", "Checks whether shape <sub> is subshape of shape stored on label shapel.

Parameters
----------
sub: TopoDS_Shape

Returns
-------
bool
") IsSubShape;
		Standard_Boolean IsSubShape(const TopoDS_Shape & sub);

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
with: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & with);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Create (if not exist) shapetool from xcafdoc on <l>.

Parameters
----------
L: TDF_Label

Returns
-------
opencascade::handle<XCAFDoc_ShapeMapTool>
") Set;
		static opencascade::handle<XCAFDoc_ShapeMapTool> Set(const TDF_Label & L);

		/****************** SetShape ******************/
		%feature("compactdefaultargs") SetShape;
		%feature("autodoc", "Sets representation (topods_shape) for top-level shape.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
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
class XCAFDoc_ShapeTool : public TDF_Attribute {
	public:
		/****************** XCAFDoc_ShapeTool ******************/
		%feature("compactdefaultargs") XCAFDoc_ShapeTool;
		%feature("autodoc", "Creates an empty tool creates a tool to work with a document <doc> attaches to label xcafdoc::labelshapes().

Returns
-------
None
") XCAFDoc_ShapeTool;
		 XCAFDoc_ShapeTool();

		/****************** AddComponent ******************/
		%feature("compactdefaultargs") AddComponent;
		%feature("autodoc", "Adds a component given by its label and location to the assembly note: assembly must be isassembly() or issimpleshape().

Parameters
----------
assembly: TDF_Label
comp: TDF_Label
Loc: TopLoc_Location

Returns
-------
TDF_Label
") AddComponent;
		TDF_Label AddComponent(const TDF_Label & assembly, const TDF_Label & comp, const TopLoc_Location & Loc);

		/****************** AddComponent ******************/
		%feature("compactdefaultargs") AddComponent;
		%feature("autodoc", "Adds a shape (located) as a component to the assembly if necessary, creates an additional top-level shape for component and return the label of component. if expand is true and component is compound, it will be created as assembly also note: assembly must be isassembly() or issimpleshape().

Parameters
----------
assembly: TDF_Label
comp: TopoDS_Shape
expand: bool,optional
	default value is Standard_False

Returns
-------
TDF_Label
") AddComponent;
		TDF_Label AddComponent(const TDF_Label & assembly, const TopoDS_Shape & comp, const Standard_Boolean expand = Standard_False);

		/****************** AddShape ******************/
		%feature("compactdefaultargs") AddShape;
		%feature("autodoc", "Adds a new top-level (creates and returns a new label) if makeassembly is true, treats topabs_compound shapes as assemblies (creates assembly structure). note: <makeprepare> replace components without location in assmebly by located components to avoid some problems. if autonaming() is true then automatically attaches names.

Parameters
----------
S: TopoDS_Shape
makeAssembly: bool,optional
	default value is Standard_True
makePrepare: bool,optional
	default value is Standard_True

Returns
-------
TDF_Label
") AddShape;
		TDF_Label AddShape(const TopoDS_Shape & S, const Standard_Boolean makeAssembly = Standard_True, const Standard_Boolean makePrepare = Standard_True);

		/****************** AddSubShape ******************/
		%feature("compactdefaultargs") AddSubShape;
		%feature("autodoc", "Adds a label for subshape <sub> of shape stored on label shapel returns null label if it is not subshape.

Parameters
----------
shapeL: TDF_Label
sub: TopoDS_Shape

Returns
-------
TDF_Label
") AddSubShape;
		TDF_Label AddSubShape(const TDF_Label & shapeL, const TopoDS_Shape & sub);

		/****************** AddSubShape ******************/
		%feature("compactdefaultargs") AddSubShape;
		%feature("autodoc", "Adds (of finds already existed) a label for subshape <sub> of shape stored on label shapel. label addedsubshapel returns added (found) label or empty in case of wrong subshape. returns true, if new shape was added, false in case of already existed subshape/wrong subshape.

Parameters
----------
shapeL: TDF_Label
sub: TopoDS_Shape
addedSubShapeL: TDF_Label

Returns
-------
bool
") AddSubShape;
		Standard_Boolean AddSubShape(const TDF_Label & shapeL, const TopoDS_Shape & sub, TDF_Label & addedSubShapeL);

		/****************** AutoNaming ******************/
		%feature("compactdefaultargs") AutoNaming;
		%feature("autodoc", "Returns current auto-naming mode. see setautonaming() for description.

Returns
-------
bool
") AutoNaming;
		static Standard_Boolean AutoNaming();

		/****************** BaseLabel ******************/
		%feature("compactdefaultargs") BaseLabel;
		%feature("autodoc", "Returns the label under which shapes are stored.

Returns
-------
TDF_Label
") BaseLabel;
		TDF_Label BaseLabel();

		/****************** ComputeShapes ******************/
		%feature("compactdefaultargs") ComputeShapes;
		%feature("autodoc", "Recursive.

Parameters
----------
L: TDF_Label

Returns
-------
None
") ComputeShapes;
		void ComputeShapes(const TDF_Label & L);

		/****************** ComputeSimpleShapes ******************/
		%feature("compactdefaultargs") ComputeSimpleShapes;
		%feature("autodoc", "Compute a sequence of simple shapes.

Returns
-------
None
") ComputeSimpleShapes;
		void ComputeSimpleShapes();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** Expand ******************/
		%feature("compactdefaultargs") Expand;
		%feature("autodoc", "Convert shape (compound/compsolid/shell/wire) to assembly.

Parameters
----------
Shape: TDF_Label

Returns
-------
bool
") Expand;
		Standard_Boolean Expand(const TDF_Label & Shape);

		/****************** FindComponent ******************/
		%feature("compactdefaultargs") FindComponent;
		%feature("autodoc", "Serach the path of labels in the document, that corresponds the component from any assembly try to search the sequence of labels with location that produce this shape as component of any assembly note: clear sequence of labels before filling.

Parameters
----------
theShape: TopoDS_Shape
Labels: TDF_LabelSequence

Returns
-------
bool
") FindComponent;
		Standard_Boolean FindComponent(const TopoDS_Shape & theShape, TDF_LabelSequence & Labels);

		/****************** FindMainShape ******************/
		%feature("compactdefaultargs") FindMainShape;
		%feature("autodoc", "Performs a search among top-level shapes to find the shape containing <sub> as subshape checks only simple shapes, and returns the first found label (which should be the only one for valid model).

Parameters
----------
sub: TopoDS_Shape

Returns
-------
TDF_Label
") FindMainShape;
		TDF_Label FindMainShape(const TopoDS_Shape & sub);

		/****************** FindMainShapeUsingMap ******************/
		%feature("compactdefaultargs") FindMainShapeUsingMap;
		%feature("autodoc", "No available documentation.

Parameters
----------
sub: TopoDS_Shape

Returns
-------
TDF_Label
") FindMainShapeUsingMap;
		TDF_Label FindMainShapeUsingMap(const TopoDS_Shape & sub);

		/****************** FindSHUO ******************/
		%feature("compactdefaultargs") FindSHUO;
		%feature("autodoc", "Searchs the shuo by labels of components from upper_usage componet to next_usage returns null attribute if no shuo found.

Parameters
----------
Labels: TDF_LabelSequence
theSHUOAttr: XCAFDoc_GraphNode

Returns
-------
bool
") FindSHUO;
		static Standard_Boolean FindSHUO(const TDF_LabelSequence & Labels, opencascade::handle<XCAFDoc_GraphNode> & theSHUOAttr);

		/****************** FindShape ******************/
		%feature("compactdefaultargs") FindShape;
		%feature("autodoc", "Returns the label corresponding to shape s (searches among top-level shapes, not including subcomponents of assemblies and subshapes) if findinstance is false (default), seach for the input shape without location if findinstance is true, searches for the input shape as is. return true if <s> is found.

Parameters
----------
S: TopoDS_Shape
L: TDF_Label
findInstance: bool,optional
	default value is Standard_False

Returns
-------
bool
") FindShape;
		Standard_Boolean FindShape(const TopoDS_Shape & S, TDF_Label & L, const Standard_Boolean findInstance = Standard_False);

		/****************** FindShape ******************/
		%feature("compactdefaultargs") FindShape;
		%feature("autodoc", "Does the same as previous method returns null label if not found.

Parameters
----------
S: TopoDS_Shape
findInstance: bool,optional
	default value is Standard_False

Returns
-------
TDF_Label
") FindShape;
		TDF_Label FindShape(const TopoDS_Shape & S, const Standard_Boolean findInstance = Standard_False);

		/****************** FindSubShape ******************/
		%feature("compactdefaultargs") FindSubShape;
		%feature("autodoc", "Finds a label for subshape <sub> of shape stored on label shapel returns null label if it is not found.

Parameters
----------
shapeL: TDF_Label
sub: TopoDS_Shape
L: TDF_Label

Returns
-------
bool
") FindSubShape;
		Standard_Boolean FindSubShape(const TDF_Label & shapeL, const TopoDS_Shape & sub, TDF_Label & L);

		/****************** GetAllComponentSHUO ******************/
		%feature("compactdefaultargs") GetAllComponentSHUO;
		%feature("autodoc", "Returns founded shuo graphnodes of indicated component returns false in other case.

Parameters
----------
CompLabel: TDF_Label
SHUOAttrs: TDF_AttributeSequence

Returns
-------
bool
") GetAllComponentSHUO;
		static Standard_Boolean GetAllComponentSHUO(const TDF_Label & CompLabel, TDF_AttributeSequence & SHUOAttrs);

		/****************** GetAllSHUOInstances ******************/
		%feature("compactdefaultargs") GetAllSHUOInstances;
		%feature("autodoc", "Seaching for component shapes that styled by shuo returns empty sequence of shape if no any shape is found.

Parameters
----------
theSHUO: XCAFDoc_GraphNode
theSHUOShapeSeq: TopTools_SequenceOfShape

Returns
-------
bool
") GetAllSHUOInstances;
		Standard_Boolean GetAllSHUOInstances(const opencascade::handle<XCAFDoc_GraphNode> & theSHUO, TopTools_SequenceOfShape & theSHUOShapeSeq);

		/****************** GetComponents ******************/
		%feature("compactdefaultargs") GetComponents;
		%feature("autodoc", "Returns list of components of assembly returns false if label is not assembly.

Parameters
----------
L: TDF_Label
Labels: TDF_LabelSequence
getsubchilds: bool,optional
	default value is Standard_False

Returns
-------
bool
") GetComponents;
		static Standard_Boolean GetComponents(const TDF_Label & L, TDF_LabelSequence & Labels, const Standard_Boolean getsubchilds = Standard_False);

		/****************** GetExternRefs ******************/
		%feature("compactdefaultargs") GetExternRefs;
		%feature("autodoc", "Gets the names of references on the no-step files.

Parameters
----------
L: TDF_Label
SHAS: TColStd_SequenceOfHAsciiString

Returns
-------
None
") GetExternRefs;
		static void GetExternRefs(const TDF_Label & L, TColStd_SequenceOfHAsciiString & SHAS);

		/****************** GetFreeShapes ******************/
		%feature("compactdefaultargs") GetFreeShapes;
		%feature("autodoc", "Returns a sequence of all top-level shapes which are free (i.e. not referred by any other).

Parameters
----------
FreeLabels: TDF_LabelSequence

Returns
-------
None
") GetFreeShapes;
		void GetFreeShapes(TDF_LabelSequence & FreeLabels);

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** GetLocation ******************/
		%feature("compactdefaultargs") GetLocation;
		%feature("autodoc", "Returns location of instance.

Parameters
----------
L: TDF_Label

Returns
-------
TopLoc_Location
") GetLocation;
		static TopLoc_Location GetLocation(const TDF_Label & L);

		/****************** GetNamedProperties ******************/
		%feature("compactdefaultargs") GetNamedProperties;
		%feature("autodoc", "Method to get nameddata attribute assigned to the given shape label. @param thelabel [in] the shape label @param thetocreate [in] create and assign attribute if it doesn't exist returns handle to the nameddata attribute or null if there is none.

Parameters
----------
theLabel: TDF_Label
theToCreate: bool,optional
	default value is Standard_False

Returns
-------
opencascade::handle<TDataStd_NamedData>
") GetNamedProperties;
		opencascade::handle<TDataStd_NamedData> GetNamedProperties(const TDF_Label & theLabel, const Standard_Boolean theToCreate = Standard_False);

		/****************** GetNamedProperties ******************/
		%feature("compactdefaultargs") GetNamedProperties;
		%feature("autodoc", "Method to get nameddata attribute assigned to a label of the given shape. @param theshape [in] input shape @param thetocreate [in] create and assign attribute if it doesn't exist returns handle to the nameddata attribute or null if there is none.

Parameters
----------
theShape: TopoDS_Shape
theToCreate: bool,optional
	default value is Standard_False

Returns
-------
opencascade::handle<TDataStd_NamedData>
") GetNamedProperties;
		opencascade::handle<TDataStd_NamedData> GetNamedProperties(const TopoDS_Shape & theShape, const Standard_Boolean theToCreate = Standard_False);

		/****************** GetReferredShape ******************/
		%feature("compactdefaultargs") GetReferredShape;
		%feature("autodoc", "Returns label which corresponds to a shape referred by l returns false if label is not reference.

Parameters
----------
L: TDF_Label
Label: TDF_Label

Returns
-------
bool
") GetReferredShape;
		static Standard_Boolean GetReferredShape(const TDF_Label & L, TDF_Label & Label);

		/****************** GetSHUO ******************/
		%feature("compactdefaultargs") GetSHUO;
		%feature("autodoc", "Returns founded shuo graphnode attribute <ashuoattr> returns false in other case.

Parameters
----------
SHUOLabel: TDF_Label
aSHUOAttr: XCAFDoc_GraphNode

Returns
-------
bool
") GetSHUO;
		static Standard_Boolean GetSHUO(const TDF_Label & SHUOLabel, opencascade::handle<XCAFDoc_GraphNode> & aSHUOAttr);

		/****************** GetSHUOInstance ******************/
		%feature("compactdefaultargs") GetSHUOInstance;
		%feature("autodoc", "Search for the component shape that styled by shuo returns null shape if no any shape is found.

Parameters
----------
theSHUO: XCAFDoc_GraphNode

Returns
-------
TopoDS_Shape
") GetSHUOInstance;
		TopoDS_Shape GetSHUOInstance(const opencascade::handle<XCAFDoc_GraphNode> & theSHUO);

		/****************** GetSHUONextUsage ******************/
		%feature("compactdefaultargs") GetSHUONextUsage;
		%feature("autodoc", "Returns the sequence of labels of shuo attributes, which is next_usage for this upper_usage shuo attribute (that indicated by label) note: returns next_usages only on one level (not recurse) note: do not clear the sequence before filling.

Parameters
----------
UpperUsageL: TDF_Label
Labels: TDF_LabelSequence

Returns
-------
bool
") GetSHUONextUsage;
		static Standard_Boolean GetSHUONextUsage(const TDF_Label & UpperUsageL, TDF_LabelSequence & Labels);

		/****************** GetSHUOUpperUsage ******************/
		%feature("compactdefaultargs") GetSHUOUpperUsage;
		%feature("autodoc", "Returns the sequence of labels of shuo attributes, which is upper_usage for this next_usage shuo attribute (that indicated by label) note: returns upper_usages only on one level (not recurse) note: do not clear the sequence before filling.

Parameters
----------
NextUsageL: TDF_Label
Labels: TDF_LabelSequence

Returns
-------
bool
") GetSHUOUpperUsage;
		static Standard_Boolean GetSHUOUpperUsage(const TDF_Label & NextUsageL, TDF_LabelSequence & Labels);

		/****************** GetShape ******************/
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "To get topods_shape from shape's label for component, returns new shape with correct location returns false if label does not contain shape.

Parameters
----------
L: TDF_Label
S: TopoDS_Shape

Returns
-------
bool
") GetShape;
		static Standard_Boolean GetShape(const TDF_Label & L, TopoDS_Shape & S);

		/****************** GetShape ******************/
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "To get topods_shape from shape's label for component, returns new shape with correct location returns null shape if label does not contain shape.

Parameters
----------
L: TDF_Label

Returns
-------
TopoDS_Shape
") GetShape;
		static TopoDS_Shape GetShape(const TDF_Label & L);

		/****************** GetShapes ******************/
		%feature("compactdefaultargs") GetShapes;
		%feature("autodoc", "Returns a sequence of all top-level shapes.

Parameters
----------
Labels: TDF_LabelSequence

Returns
-------
None
") GetShapes;
		void GetShapes(TDF_LabelSequence & Labels);

		/****************** GetSubShapes ******************/
		%feature("compactdefaultargs") GetSubShapes;
		%feature("autodoc", "Returns list of labels identifying subshapes of the given shape returns false if no subshapes are placed on that label.

Parameters
----------
L: TDF_Label
Labels: TDF_LabelSequence

Returns
-------
bool
") GetSubShapes;
		static Standard_Boolean GetSubShapes(const TDF_Label & L, TDF_LabelSequence & Labels);

		/****************** GetUsers ******************/
		%feature("compactdefaultargs") GetUsers;
		%feature("autodoc", "Returns list of labels which refer shape l as component returns number of users (0 if shape is free).

Parameters
----------
L: TDF_Label
Labels: TDF_LabelSequence
getsubchilds: bool,optional
	default value is Standard_False

Returns
-------
int
") GetUsers;
		static Standard_Integer GetUsers(const TDF_Label & L, TDF_LabelSequence & Labels, const Standard_Boolean getsubchilds = Standard_False);

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Set hascomponents into false.

Returns
-------
None
") Init;
		void Init();

		/****************** IsAssembly ******************/
		%feature("compactdefaultargs") IsAssembly;
		%feature("autodoc", "Returns true if the label is a label of assembly, i.e. contains sublabels which are assembly components this is relevant only if isshape() is true.

Parameters
----------
L: TDF_Label

Returns
-------
bool
") IsAssembly;
		static Standard_Boolean IsAssembly(const TDF_Label & L);

		/****************** IsComponent ******************/
		%feature("compactdefaultargs") IsComponent;
		%feature("autodoc", "Return true if <l> is reference serving as component of assembly.

Parameters
----------
L: TDF_Label

Returns
-------
bool
") IsComponent;
		static Standard_Boolean IsComponent(const TDF_Label & L);

		/****************** IsCompound ******************/
		%feature("compactdefaultargs") IsCompound;
		%feature("autodoc", "Returns true if the label is a label of compound, i.e. contains some sublabels this is relevant only if isshape() is true.

Parameters
----------
L: TDF_Label

Returns
-------
bool
") IsCompound;
		static Standard_Boolean IsCompound(const TDF_Label & L);

		/****************** IsExternRef ******************/
		%feature("compactdefaultargs") IsExternRef;
		%feature("autodoc", "Returns true if the label is a label of external references, i.e. there are some reference on the no-step files, which are described in document only their names.

Parameters
----------
L: TDF_Label

Returns
-------
bool
") IsExternRef;
		static Standard_Boolean IsExternRef(const TDF_Label & L);

		/****************** IsFree ******************/
		%feature("compactdefaultargs") IsFree;
		%feature("autodoc", "Returns true if the label is not used by any assembly, i.e. contains sublabels which are assembly components this is relevant only if isshape() is true (there is no father treenode on this <l>).

Parameters
----------
L: TDF_Label

Returns
-------
bool
") IsFree;
		static Standard_Boolean IsFree(const TDF_Label & L);

		/****************** IsReference ******************/
		%feature("compactdefaultargs") IsReference;
		%feature("autodoc", "Return true if <l> is a located instance of other shape i.e. reference.

Parameters
----------
L: TDF_Label

Returns
-------
bool
") IsReference;
		static Standard_Boolean IsReference(const TDF_Label & L);

		/****************** IsShape ******************/
		%feature("compactdefaultargs") IsShape;
		%feature("autodoc", "Returns true if the label represents a shape (simple shape, assembly or reference).

Parameters
----------
L: TDF_Label

Returns
-------
bool
") IsShape;
		static Standard_Boolean IsShape(const TDF_Label & L);

		/****************** IsSimpleShape ******************/
		%feature("compactdefaultargs") IsSimpleShape;
		%feature("autodoc", "Returns true if the label is a label of simple shape.

Parameters
----------
L: TDF_Label

Returns
-------
bool
") IsSimpleShape;
		static Standard_Boolean IsSimpleShape(const TDF_Label & L);

		/****************** IsSubShape ******************/
		%feature("compactdefaultargs") IsSubShape;
		%feature("autodoc", "Return true if <l> is subshape of the top-level shape.

Parameters
----------
L: TDF_Label

Returns
-------
bool
") IsSubShape;
		static Standard_Boolean IsSubShape(const TDF_Label & L);

		/****************** IsSubShape ******************/
		%feature("compactdefaultargs") IsSubShape;
		%feature("autodoc", "Checks whether shape <sub> is subshape of shape stored on label shapel.

Parameters
----------
shapeL: TDF_Label
sub: TopoDS_Shape

Returns
-------
bool
") IsSubShape;
		Standard_Boolean IsSubShape(const TDF_Label & shapeL, const TopoDS_Shape & sub);

		/****************** IsTopLevel ******************/
		%feature("compactdefaultargs") IsTopLevel;
		%feature("autodoc", "Returns true if the label is a label of top-level shape, as opposed to component of assembly or subshape.

Parameters
----------
L: TDF_Label

Returns
-------
bool
") IsTopLevel;
		Standard_Boolean IsTopLevel(const TDF_Label & L);

		/****************** NbComponents ******************/
		%feature("compactdefaultargs") NbComponents;
		%feature("autodoc", "Returns number of assembles components.

Parameters
----------
L: TDF_Label
getsubchilds: bool,optional
	default value is Standard_False

Returns
-------
int
") NbComponents;
		static Standard_Integer NbComponents(const TDF_Label & L, const Standard_Boolean getsubchilds = Standard_False);

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** NewShape ******************/
		%feature("compactdefaultargs") NewShape;
		%feature("autodoc", "Creates new (empty) top-level shape. initially it holds empty topods_compound.

Returns
-------
TDF_Label
") NewShape;
		TDF_Label NewShape();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** RemoveComponent ******************/
		%feature("compactdefaultargs") RemoveComponent;
		%feature("autodoc", "Removes a component from its assembly.

Parameters
----------
comp: TDF_Label

Returns
-------
None
") RemoveComponent;
		void RemoveComponent(const TDF_Label & comp);

		/****************** RemoveSHUO ******************/
		%feature("compactdefaultargs") RemoveSHUO;
		%feature("autodoc", "Remove shuo from component sublabel, remove all dependencies on other shuo. returns false if cannot remove shuo dependencies. note: remove any styles that associated with this shuo.

Parameters
----------
SHUOLabel: TDF_Label

Returns
-------
bool
") RemoveSHUO;
		Standard_Boolean RemoveSHUO(const TDF_Label & SHUOLabel);

		/****************** RemoveShape ******************/
		%feature("compactdefaultargs") RemoveShape;
		%feature("autodoc", "Removes shape (whole label and all its sublabels) if removecompletely is true, removes complete shape if removecompletely is false, removes instance(location) only returns false (and does nothing) if shape is not free or is not top-level shape.

Parameters
----------
L: TDF_Label
removeCompletely: bool,optional
	default value is Standard_True

Returns
-------
bool
") RemoveShape;
		Standard_Boolean RemoveShape(const TDF_Label & L, const Standard_Boolean removeCompletely = Standard_True);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
with: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & with);

		/****************** Search ******************/
		%feature("compactdefaultargs") Search;
		%feature("autodoc", "General tool to find a (sub) shape in the document * if findinstance is true, and s has a non-null location, first tries to find the shape among the top-level shapes with this location * if not found, and findcomponent is true, tries to find the shape among the components of assemblies * if not found, tries to find the shape without location among top-level shapes * if not found and findsubshape is true, tries to find a shape as a subshape of top-level simple shapes returns false if nothing is found.

Parameters
----------
S: TopoDS_Shape
L: TDF_Label
findInstance: bool,optional
	default value is Standard_True
findComponent: bool,optional
	default value is Standard_True
findSubshape: bool,optional
	default value is Standard_True

Returns
-------
bool
") Search;
		Standard_Boolean Search(const TopoDS_Shape & S, TDF_Label & L, const Standard_Boolean findInstance = Standard_True, const Standard_Boolean findComponent = Standard_True, const Standard_Boolean findSubshape = Standard_True);

		/****************** SearchUsingMap ******************/
		%feature("compactdefaultargs") SearchUsingMap;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
L: TDF_Label
findWithoutLoc: bool
findSubshape: bool

Returns
-------
bool
") SearchUsingMap;
		Standard_Boolean SearchUsingMap(const TopoDS_Shape & S, TDF_Label & L, const Standard_Boolean findWithoutLoc, const Standard_Boolean findSubshape);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Create (if not exist) shapetool from xcafdoc on <l>.

Parameters
----------
L: TDF_Label

Returns
-------
opencascade::handle<XCAFDoc_ShapeTool>
") Set;
		static opencascade::handle<XCAFDoc_ShapeTool> Set(const TDF_Label & L);

		/****************** SetAutoNaming ******************/
		%feature("compactdefaultargs") SetAutoNaming;
		%feature("autodoc", "Sets auto-naming mode to <v>. if true then for added shapes, links, assemblies and shuo's, the tdatastd_name attribute is automatically added. for shapes it contains a shape type (e.g. 'solid', 'shell', etc); for links it has a form '=>[0:1:1:2]' (where a tag is a label containing a shape without a location); for assemblies it is 'assembly', and 'shuo' for shuo's. this setting is global; it cannot be made a member function as it is used by static methods as well. by default, auto-naming is enabled. see also autonaming().

Parameters
----------
V: bool

Returns
-------
None
") SetAutoNaming;
		static void SetAutoNaming(const Standard_Boolean V);

		/****************** SetExternRefs ******************/
		%feature("compactdefaultargs") SetExternRefs;
		%feature("autodoc", "Sets the names of references on the no-step files.

Parameters
----------
SHAS: TColStd_SequenceOfHAsciiString

Returns
-------
TDF_Label
") SetExternRefs;
		TDF_Label SetExternRefs(const TColStd_SequenceOfHAsciiString & SHAS);

		/****************** SetExternRefs ******************/
		%feature("compactdefaultargs") SetExternRefs;
		%feature("autodoc", "Sets the names of references on the no-step files.

Parameters
----------
L: TDF_Label
SHAS: TColStd_SequenceOfHAsciiString

Returns
-------
None
") SetExternRefs;
		void SetExternRefs(const TDF_Label & L, const TColStd_SequenceOfHAsciiString & SHAS);

		/****************** SetInstanceSHUO ******************/
		%feature("compactdefaultargs") SetInstanceSHUO;
		%feature("autodoc", "Search for the component shape by labelks path and set shuo structure for founded label structure returns null attribute if no component in any assembly found.

Parameters
----------
theShape: TopoDS_Shape

Returns
-------
opencascade::handle<XCAFDoc_GraphNode>
") SetInstanceSHUO;
		opencascade::handle<XCAFDoc_GraphNode> SetInstanceSHUO(const TopoDS_Shape & theShape);

		/****************** SetSHUO ******************/
		%feature("compactdefaultargs") SetSHUO;
		%feature("autodoc", "Sets the shuo structure between upper_usage and next_usage create multy-level (if number of labels > 2) shuo from first to last initialise out <mainshuoattr> by main upper_usage shuo attribute. returns false if some of labels in not component label.

Parameters
----------
Labels: TDF_LabelSequence
MainSHUOAttr: XCAFDoc_GraphNode

Returns
-------
bool
") SetSHUO;
		Standard_Boolean SetSHUO(const TDF_LabelSequence & Labels, opencascade::handle<XCAFDoc_GraphNode> & MainSHUOAttr);

		/****************** SetShape ******************/
		%feature("compactdefaultargs") SetShape;
		%feature("autodoc", "Sets representation (topods_shape) for top-level shape.

Parameters
----------
L: TDF_Label
S: TopoDS_Shape

Returns
-------
None
") SetShape;
		void SetShape(const TDF_Label & L, const TopoDS_Shape & S);

		/****************** UpdateAssemblies ******************/
		%feature("compactdefaultargs") UpdateAssemblies;
		%feature("autodoc", "Top-down update for all assembly compounds stored in the document.

Returns
-------
None
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
class XCAFDoc_View : public TDF_Attribute {
	public:
		/****************** XCAFDoc_View ******************/
		%feature("compactdefaultargs") XCAFDoc_View;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") XCAFDoc_View;
		 XCAFDoc_View();

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** GetObject ******************/
		%feature("compactdefaultargs") GetObject;
		%feature("autodoc", "Returns view object data taken from the paren's label and its sub-labels.

Returns
-------
opencascade::handle<XCAFView_Object>
") GetObject;
		opencascade::handle<XCAFView_Object> GetObject();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
Into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
With: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
theLabel: TDF_Label

Returns
-------
opencascade::handle<XCAFDoc_View>
") Set;
		static opencascade::handle<XCAFDoc_View> Set(const TDF_Label & theLabel);

		/****************** SetObject ******************/
		%feature("compactdefaultargs") SetObject;
		%feature("autodoc", "Updates parent's label and its sub-labels with data taken from theviewobject. old data associated with the label will be lost.

Parameters
----------
theViewObject: XCAFView_Object

Returns
-------
None
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
class XCAFDoc_ViewTool : public TDF_Attribute {
	public:
		/****************** XCAFDoc_ViewTool ******************/
		%feature("compactdefaultargs") XCAFDoc_ViewTool;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") XCAFDoc_ViewTool;
		 XCAFDoc_ViewTool();

		/****************** AddView ******************/
		%feature("compactdefaultargs") AddView;
		%feature("autodoc", "Adds a view definition to a view table and returns its label.

Returns
-------
TDF_Label
") AddView;
		TDF_Label AddView();

		/****************** BaseLabel ******************/
		%feature("compactdefaultargs") BaseLabel;
		%feature("autodoc", "Returns the label under which views are stored.

Returns
-------
TDF_Label
") BaseLabel;
		TDF_Label BaseLabel();

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** GetRefAnnotationLabel ******************/
		%feature("compactdefaultargs") GetRefAnnotationLabel;
		%feature("autodoc", "Returns annotation labels defined for label theviewl returns false if the theviewl is not in view table.

Parameters
----------
theViewL: TDF_Label
theAnnotationLabels: TDF_LabelSequence

Returns
-------
bool
") GetRefAnnotationLabel;
		Standard_Boolean GetRefAnnotationLabel(const TDF_Label & theViewL, TDF_LabelSequence & theAnnotationLabels);

		/****************** GetRefClippingPlaneLabel ******************/
		%feature("compactdefaultargs") GetRefClippingPlaneLabel;
		%feature("autodoc", "Returns clippingplane labels defined for label theviewl returns false if the theviewl is not in view table.

Parameters
----------
theViewL: TDF_Label
theClippingPlaneLabels: TDF_LabelSequence

Returns
-------
bool
") GetRefClippingPlaneLabel;
		Standard_Boolean GetRefClippingPlaneLabel(const TDF_Label & theViewL, TDF_LabelSequence & theClippingPlaneLabels);

		/****************** GetRefGDTLabel ******************/
		%feature("compactdefaultargs") GetRefGDTLabel;
		%feature("autodoc", "Returns gdt labels defined for label theviewl returns false if the theviewl is not in view table.

Parameters
----------
theViewL: TDF_Label
theGDTLabels: TDF_LabelSequence

Returns
-------
bool
") GetRefGDTLabel;
		Standard_Boolean GetRefGDTLabel(const TDF_Label & theViewL, TDF_LabelSequence & theGDTLabels);

		/****************** GetRefNoteLabel ******************/
		%feature("compactdefaultargs") GetRefNoteLabel;
		%feature("autodoc", "Returns notes labels defined for label theviewl returns false if the theviewl is not in view table.

Parameters
----------
theViewL: TDF_Label
theNoteLabels: TDF_LabelSequence

Returns
-------
bool
") GetRefNoteLabel;
		Standard_Boolean GetRefNoteLabel(const TDF_Label & theViewL, TDF_LabelSequence & theNoteLabels);

		/****************** GetRefShapeLabel ******************/
		%feature("compactdefaultargs") GetRefShapeLabel;
		%feature("autodoc", "Returns shape labels defined for label theviewl returns false if the theviewl is not in view table.

Parameters
----------
theViewL: TDF_Label
theShapeLabels: TDF_LabelSequence

Returns
-------
bool
") GetRefShapeLabel;
		Standard_Boolean GetRefShapeLabel(const TDF_Label & theViewL, TDF_LabelSequence & theShapeLabels);

		/****************** GetViewLabels ******************/
		%feature("compactdefaultargs") GetViewLabels;
		%feature("autodoc", "Returns a sequence of view labels currently stored in the view table.

Parameters
----------
theLabels: TDF_LabelSequence

Returns
-------
None
") GetViewLabels;
		void GetViewLabels(TDF_LabelSequence & theLabels);

		/****************** GetViewLabelsForAnnotation ******************/
		%feature("compactdefaultargs") GetViewLabelsForAnnotation;
		%feature("autodoc", "Returns all view labels defined for label annotationl.

Parameters
----------
theAnnotationL: TDF_Label
theViews: TDF_LabelSequence

Returns
-------
bool
") GetViewLabelsForAnnotation;
		Standard_Boolean GetViewLabelsForAnnotation(const TDF_Label & theAnnotationL, TDF_LabelSequence & theViews);

		/****************** GetViewLabelsForClippingPlane ******************/
		%feature("compactdefaultargs") GetViewLabelsForClippingPlane;
		%feature("autodoc", "Returns all view labels defined for label clippingplanel.

Parameters
----------
theClippingPlaneL: TDF_Label
theViews: TDF_LabelSequence

Returns
-------
bool
") GetViewLabelsForClippingPlane;
		Standard_Boolean GetViewLabelsForClippingPlane(const TDF_Label & theClippingPlaneL, TDF_LabelSequence & theViews);

		/****************** GetViewLabelsForGDT ******************/
		%feature("compactdefaultargs") GetViewLabelsForGDT;
		%feature("autodoc", "Returns all view labels defined for label gdtl.

Parameters
----------
theGDTL: TDF_Label
theViews: TDF_LabelSequence

Returns
-------
bool
") GetViewLabelsForGDT;
		Standard_Boolean GetViewLabelsForGDT(const TDF_Label & theGDTL, TDF_LabelSequence & theViews);

		/****************** GetViewLabelsForNote ******************/
		%feature("compactdefaultargs") GetViewLabelsForNote;
		%feature("autodoc", "Returns all view labels defined for label notel.

Parameters
----------
theNoteL: TDF_Label
theViews: TDF_LabelSequence

Returns
-------
bool
") GetViewLabelsForNote;
		Standard_Boolean GetViewLabelsForNote(const TDF_Label & theNoteL, TDF_LabelSequence & theViews);

		/****************** GetViewLabelsForShape ******************/
		%feature("compactdefaultargs") GetViewLabelsForShape;
		%feature("autodoc", "Returns all view labels defined for label shapel.

Parameters
----------
theShapeL: TDF_Label
theViews: TDF_LabelSequence

Returns
-------
bool
") GetViewLabelsForShape;
		Standard_Boolean GetViewLabelsForShape(const TDF_Label & theShapeL, TDF_LabelSequence & theViews);

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** IsLocked ******************/
		%feature("compactdefaultargs") IsLocked;
		%feature("autodoc", "Returns true if the given view is marked as locked.

Parameters
----------
theViewL: TDF_Label

Returns
-------
bool
") IsLocked;
		Standard_Boolean IsLocked(const TDF_Label & theViewL);

		/****************** IsView ******************/
		%feature("compactdefaultargs") IsView;
		%feature("autodoc", "Returns true if label belongs to a view table and is a view definition.

Parameters
----------
theLabel: TDF_Label

Returns
-------
bool
") IsView;
		Standard_Boolean IsView(const TDF_Label & theLabel);

		/****************** Lock ******************/
		%feature("compactdefaultargs") Lock;
		%feature("autodoc", "Mark the given view as locked.

Parameters
----------
theViewL: TDF_Label

Returns
-------
None
") Lock;
		void Lock(const TDF_Label & theViewL);

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** RemoveView ******************/
		%feature("compactdefaultargs") RemoveView;
		%feature("autodoc", "Remove view.

Parameters
----------
theViewL: TDF_Label

Returns
-------
None
") RemoveView;
		void RemoveView(const TDF_Label & theViewL);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
with: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & with);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Creates (if not exist) viewtool.

Parameters
----------
L: TDF_Label

Returns
-------
opencascade::handle<XCAFDoc_ViewTool>
") Set;
		static opencascade::handle<XCAFDoc_ViewTool> Set(const TDF_Label & L);

		/****************** SetClippingPlanes ******************/
		%feature("compactdefaultargs") SetClippingPlanes;
		%feature("autodoc", "Set clipping planes to given view.

Parameters
----------
theClippingPlaneLabels: TDF_LabelSequence
theViewL: TDF_Label

Returns
-------
None
") SetClippingPlanes;
		void SetClippingPlanes(const TDF_LabelSequence & theClippingPlaneLabels, const TDF_Label & theViewL);

		/****************** SetView ******************/
		%feature("compactdefaultargs") SetView;
		%feature("autodoc", "Sets a link with guid.

Parameters
----------
theShapes: TDF_LabelSequence
theGDTs: TDF_LabelSequence
theClippingPlanes: TDF_LabelSequence
theNotes: TDF_LabelSequence
theAnnotations: TDF_LabelSequence
theViewL: TDF_Label

Returns
-------
None
") SetView;
		void SetView(const TDF_LabelSequence & theShapes, const TDF_LabelSequence & theGDTs, const TDF_LabelSequence & theClippingPlanes, const TDF_LabelSequence & theNotes, const TDF_LabelSequence & theAnnotations, const TDF_Label & theViewL);

		/****************** SetView ******************/
		%feature("compactdefaultargs") SetView;
		%feature("autodoc", "Sets a link with guid.

Parameters
----------
theShapes: TDF_LabelSequence
theGDTs: TDF_LabelSequence
theClippingPlanes: TDF_LabelSequence
theViewL: TDF_Label

Returns
-------
None
") SetView;
		void SetView(const TDF_LabelSequence & theShapes, const TDF_LabelSequence & theGDTs, const TDF_LabelSequence & theClippingPlanes, const TDF_Label & theViewL);

		/****************** SetView ******************/
		%feature("compactdefaultargs") SetView;
		%feature("autodoc", "Sets a link with guid.

Parameters
----------
theShapes: TDF_LabelSequence
theGDTs: TDF_LabelSequence
theViewL: TDF_Label

Returns
-------
None
") SetView;
		void SetView(const TDF_LabelSequence & theShapes, const TDF_LabelSequence & theGDTs, const TDF_Label & theViewL);

		/****************** Unlock ******************/
		%feature("compactdefaultargs") Unlock;
		%feature("autodoc", "Unlock the given view.

Parameters
----------
theViewL: TDF_Label

Returns
-------
None
") Unlock;
		void Unlock(const TDF_Label & theViewL);

};


%make_alias(XCAFDoc_ViewTool)

%extend XCAFDoc_ViewTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class XCAFDoc_Volume *
***********************/
class XCAFDoc_Volume : public TDF_Attribute {
	public:
		/****************** XCAFDoc_Volume ******************/
		%feature("compactdefaultargs") XCAFDoc_Volume;
		%feature("autodoc", "Class methods =============.

Returns
-------
None
") XCAFDoc_Volume;
		 XCAFDoc_Volume();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Get;
		Standard_Real Get();

		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Returns volume as argument returns false if no such attribute at the <label>.

Parameters
----------
label: TDF_Label

Returns
-------
vol: float
") Get;
		static Standard_Boolean Get(const TDF_Label & label, Standard_Real &OutValue);

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
Into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
With: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets a value of volume.

Parameters
----------
vol: float

Returns
-------
None
") Set;
		void Set(const Standard_Real vol);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Find, or create, an volume attribute and set its value.

Parameters
----------
label: TDF_Label
vol: float

Returns
-------
opencascade::handle<XCAFDoc_Volume>
") Set;
		static opencascade::handle<XCAFDoc_Volume> Set(const TDF_Label & label, const Standard_Real vol);

};


%make_alias(XCAFDoc_Volume)

%extend XCAFDoc_Volume {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class XCAFDoc_NoteBinData *
****************************/
class XCAFDoc_NoteBinData : public XCAFDoc_Note {
	public:
		/****************** XCAFDoc_NoteBinData ******************/
		%feature("compactdefaultargs") XCAFDoc_NoteBinData;
		%feature("autodoc", "Creates an empty binary data note.

Returns
-------
None
") XCAFDoc_NoteBinData;
		 XCAFDoc_NoteBinData();

		/****************** Data ******************/
		%feature("compactdefaultargs") Data;
		%feature("autodoc", "Returns byte data array.

Returns
-------
opencascade::handle<TColStd_HArray1OfByte>
") Data;
		const opencascade::handle<TColStd_HArray1OfByte> & Data();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Finds a binary data attribute on the given label and returns it, if it is found.

Parameters
----------
theLabel: TDF_Label

Returns
-------
opencascade::handle<XCAFDoc_NoteBinData>
") Get;
		static opencascade::handle<XCAFDoc_NoteBinData> Get(const TDF_Label & theLabel);

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Returns default attribute guid.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** MIMEtype ******************/
		%feature("compactdefaultargs") MIMEtype;
		%feature("autodoc", "Returns data mime type.

Returns
-------
TCollection_AsciiString
") MIMEtype;
		const TCollection_AsciiString & MIMEtype();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
theAttrInto: TDF_Attribute
theRT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & theAttrInto, const opencascade::handle<TDF_RelocationTable> & theRT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
theAttrFrom: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & theAttrFrom);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Create (if not exist) a binary note with data loaded from a binary file. \param [in] thelabel - label to add the attribute. \param [in] theusername - the name of the user, who created the note. \param [in] thetimestamp - creation timestamp of the note. \param [in] thetitle - file title. \param [in] themimetype - mime type of the file. \param [in] thefile - input binary file. eturn a handle to the attribute instance.

Parameters
----------
theLabel: TDF_Label
theUserName: TCollection_ExtendedString
theTimeStamp: TCollection_ExtendedString
theTitle: TCollection_ExtendedString
theMIMEtype: TCollection_AsciiString
theFile: OSD_File

Returns
-------
opencascade::handle<XCAFDoc_NoteBinData>
") Set;
		static opencascade::handle<XCAFDoc_NoteBinData> Set(const TDF_Label & theLabel, const TCollection_ExtendedString & theUserName, const TCollection_ExtendedString & theTimeStamp, const TCollection_ExtendedString & theTitle, const TCollection_AsciiString & theMIMEtype, OSD_File & theFile);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Create (if not exist) a binary note byte data array. \param [in] thelabel - label to add the attribute. \param [in] theusername - the name of the user, who created the note. \param [in] thetimestamp - creation timestamp of the note. \param [in] thetitle - data title. \param [in] themimetype - mime type of data. \param [in] thedata - byte data array. eturn a handle to the attribute instance.

Parameters
----------
theLabel: TDF_Label
theUserName: TCollection_ExtendedString
theTimeStamp: TCollection_ExtendedString
theTitle: TCollection_ExtendedString
theMIMEtype: TCollection_AsciiString
theData: TColStd_HArray1OfByte

Returns
-------
opencascade::handle<XCAFDoc_NoteBinData>
") Set;
		static opencascade::handle<XCAFDoc_NoteBinData> Set(const TDF_Label & theLabel, const TCollection_ExtendedString & theUserName, const TCollection_ExtendedString & theTimeStamp, const TCollection_ExtendedString & theTitle, const TCollection_AsciiString & theMIMEtype, const opencascade::handle<TColStd_HArray1OfByte> & theData);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets title, mime type and data from a binary file. \param [in] thetitle - file title. \param [in] themimetype - mime type of the file. \param [in] thefile - input binary file.

Parameters
----------
theTitle: TCollection_ExtendedString
theMIMEtype: TCollection_AsciiString
theFile: OSD_File

Returns
-------
bool
") Set;
		Standard_Boolean Set(const TCollection_ExtendedString & theTitle, const TCollection_AsciiString & theMIMEtype, OSD_File & theFile);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets title, mime type and data from a byte array. \param [in] thetitle - data title. \param [in] themimetype - mime type of data. \param [in] thedata - byte data array.

Parameters
----------
theTitle: TCollection_ExtendedString
theMIMEtype: TCollection_AsciiString
theData: TColStd_HArray1OfByte

Returns
-------
None
") Set;
		void Set(const TCollection_ExtendedString & theTitle, const TCollection_AsciiString & theMIMEtype, const opencascade::handle<TColStd_HArray1OfByte> & theData);

		/****************** Size ******************/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "Size of data in bytes.

Returns
-------
int
") Size;
		Standard_Integer Size();

		/****************** Title ******************/
		%feature("compactdefaultargs") Title;
		%feature("autodoc", "Returns the note title.

Returns
-------
TCollection_ExtendedString
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
		/****************** XCAFDoc_NoteComment ******************/
		%feature("compactdefaultargs") XCAFDoc_NoteComment;
		%feature("autodoc", "Creates an empty comment note.

Returns
-------
None
") XCAFDoc_NoteComment;
		 XCAFDoc_NoteComment();

		/****************** Comment ******************/
		%feature("compactdefaultargs") Comment;
		%feature("autodoc", "Returns the comment text.

Returns
-------
TCollection_ExtendedString
") Comment;
		const TCollection_ExtendedString & Comment();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Finds a reference attribute on the given label and returns it, if it is found.

Parameters
----------
theLabel: TDF_Label

Returns
-------
opencascade::handle<XCAFDoc_NoteComment>
") Get;
		static opencascade::handle<XCAFDoc_NoteComment> Get(const TDF_Label & theLabel);

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Returns default attribute guid.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
theAttrInto: TDF_Attribute
theRT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & theAttrInto, const opencascade::handle<TDF_RelocationTable> & theRT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
theAttrFrom: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & theAttrFrom);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Create (if not exist) a comment note on the given label. \param [in] thelabel - note label. \param [in] theusername - the name of the user, who created the note. \param [in] thetimestamp - creation timestamp of the note. \param [in] thecomment - comment text.

Parameters
----------
theLabel: TDF_Label
theUserName: TCollection_ExtendedString
theTimeStamp: TCollection_ExtendedString
theComment: TCollection_ExtendedString

Returns
-------
opencascade::handle<XCAFDoc_NoteComment>
") Set;
		static opencascade::handle<XCAFDoc_NoteComment> Set(const TDF_Label & theLabel, const TCollection_ExtendedString & theUserName, const TCollection_ExtendedString & theTimeStamp, const TCollection_ExtendedString & theComment);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the comment text.

Parameters
----------
theComment: TCollection_ExtendedString

Returns
-------
None
") Set;
		void Set(const TCollection_ExtendedString & theComment);

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
		/****************** XCAFDoc_NoteBalloon ******************/
		%feature("compactdefaultargs") XCAFDoc_NoteBalloon;
		%feature("autodoc", "Creates an empty comment note.

Returns
-------
None
") XCAFDoc_NoteBalloon;
		 XCAFDoc_NoteBalloon();

		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Finds a reference attribute on the given label and returns it, if it is found.

Parameters
----------
theLabel: TDF_Label

Returns
-------
opencascade::handle<XCAFDoc_NoteBalloon>
") Get;
		static opencascade::handle<XCAFDoc_NoteBalloon> Get(const TDF_Label & theLabel);

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Returns default attribute guid.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Create (if not exist) a comment note on the given label. \param [in] thelabel - note label. \param [in] theusername - the name of the user, who created the note. \param [in] thetimestamp - creation timestamp of the note. \param [in] thecomment - comment text.

Parameters
----------
theLabel: TDF_Label
theUserName: TCollection_ExtendedString
theTimeStamp: TCollection_ExtendedString
theComment: TCollection_ExtendedString

Returns
-------
opencascade::handle<XCAFDoc_NoteBalloon>
") Set;
		static opencascade::handle<XCAFDoc_NoteBalloon> Set(const TDF_Label & theLabel, const TCollection_ExtendedString & theUserName, const TCollection_ExtendedString & theTimeStamp, const TCollection_ExtendedString & theComment);

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
class XCAFDoc_DimTolTool:
	pass

@classnotwrapped
class XCAFDoc_GeomTolerance:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
