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
%define XCAFPRSDOCSTRING
"XCAFPrs module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_xcafprs.html"
%enddef
%module (package="OCC.Core", docstring=XCAFPRSDOCSTRING) XCAFPrs


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
#include<XCAFPrs_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TDF_module.hxx>
#include<TopLoc_module.hxx>
#include<Quantity_module.hxx>
#include<AIS_module.hxx>
#include<Graphic3d_module.hxx>
#include<TDocStd_module.hxx>
#include<XCAFDoc_module.hxx>
#include<TCollection_module.hxx>
#include<TopoDS_module.hxx>
#include<TPrsStd_module.hxx>
#include<Image_module.hxx>
#include<TopTools_module.hxx>
#include<Message_module.hxx>
#include<TShort_module.hxx>
#include<Poly_module.hxx>
#include<Aspect_module.hxx>
#include<V3d_module.hxx>
#include<Select3D_module.hxx>
#include<Geom_module.hxx>
#include<HLRAlgo_module.hxx>
#include<Bnd_module.hxx>
#include<SelectBasics_module.hxx>
#include<Prs3d_module.hxx>
#include<Media_module.hxx>
#include<TColQuantity_module.hxx>
#include<TDF_module.hxx>
#include<TDataStd_module.hxx>
#include<TNaming_module.hxx>
#include<TDataXtd_module.hxx>
#include<Graphic3d_module.hxx>
#include<SelectMgr_module.hxx>
#include<TopoDS_module.hxx>
#include<PrsMgr_module.hxx>
#include<CDF_module.hxx>
#include<CDM_module.hxx>
#include<PCDM_module.hxx>
#include<StdSelect_module.hxx>
#include<BRep_module.hxx>
#include<Geom2d_module.hxx>
#include<StdPrs_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<Adaptor2d_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<Adaptor3d_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TDF.i
%import TopLoc.i
%import Quantity.i
%import AIS.i
%import Graphic3d.i
%import TDocStd.i
%import XCAFDoc.i
%import TCollection.i
%import TopoDS.i
%import TPrsStd.i
%import Image.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum  {
	XCAFPrs_DocumentExplorerFlags_None = 0,
	XCAFPrs_DocumentExplorerFlags_OnlyLeafNodes = 1,
	XCAFPrs_DocumentExplorerFlags_NoStyle = 2,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
%wrap_handle(XCAFPrs_AISObject)
%wrap_handle(XCAFPrs_Driver)
%wrap_handle(XCAFPrs_Texture)
/* end handles declaration */

/* templates */
%template(XCAFPrs_DataMapOfStyleShape) NCollection_DataMap<XCAFPrs_Style,TopoDS_Shape>;
%template(XCAFPrs_DataMapOfStyleTransient) NCollection_DataMap<XCAFPrs_Style,opencascade::handle<Standard_Transient>>;
%template(XCAFPrs_IndexedDataMapOfShapeStyle) NCollection_IndexedDataMap<TopoDS_Shape,XCAFPrs_Style,TopTools_ShapeMapHasher>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap<XCAFPrs_Style, TopoDS_Shape>::Iterator XCAFPrs_DataMapIteratorOfDataMapOfStyleShape;
typedef NCollection_DataMap<XCAFPrs_Style, opencascade::handle<Standard_Transient>>::Iterator XCAFPrs_DataMapIteratorOfDataMapOfStyleTransient;
typedef NCollection_IndexedDataMap<TopoDS_Shape, XCAFPrs_Style, TopTools_ShapeMapHasher>::Iterator XCAFPrs_DataMapIteratorOfIndexedDataMapOfShapeStyle;
typedef NCollection_DataMap<XCAFPrs_Style, TopoDS_Shape> XCAFPrs_DataMapOfStyleShape;
typedef NCollection_DataMap<XCAFPrs_Style, opencascade::handle<Standard_Transient>> XCAFPrs_DataMapOfStyleTransient;
typedef Standard_Integer XCAFPrs_DocumentExplorerFlags;
typedef NCollection_IndexedDataMap<TopoDS_Shape, XCAFPrs_Style, TopTools_ShapeMapHasher> XCAFPrs_IndexedDataMapOfShapeStyle;
/* end typedefs declaration */

/****************
* class XCAFPrs *
****************/
%rename(xcafprs) XCAFPrs;
class XCAFPrs {
	public:
		/****** XCAFPrs::CollectStyleSettings ******/
		/****** md5 signature: 7a262a4756e5937c27328da5edc3fabd ******/
		%feature("compactdefaultargs") CollectStyleSettings;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label
loc: TopLoc_Location
settings: XCAFPrs_IndexedDataMapOfShapeStyle
theLayerColor: Quantity_ColorRGBA (optional, default to Quantity_ColorRGBA(Quantity_NOC_WHITE))

Return
-------
None

Description
-----------
Collect styles defined for shape on label L and its components and subshapes and fills a map of shape - style correspondence The location <loc> is for internal use, it should be Null location for external call.
") CollectStyleSettings;
		static void CollectStyleSettings(const TDF_Label & L, const TopLoc_Location & loc, XCAFPrs_IndexedDataMapOfShapeStyle & settings, const Quantity_ColorRGBA & theLayerColor = Quantity_ColorRGBA(Quantity_NOC_WHITE));

		/****** XCAFPrs::GetViewNameMode ******/
		/****** md5 signature: 00babb1f013f86f66ee15ee01531e437 ******/
		%feature("compactdefaultargs") GetViewNameMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetViewNameMode;
		static Standard_Boolean GetViewNameMode();

		/****** XCAFPrs::SetViewNameMode ******/
		/****** md5 signature: 42d2caa5815110f47af30e5cb5a0c0d6 ******/
		%feature("compactdefaultargs") SetViewNameMode;
		%feature("autodoc", "
Parameters
----------
viewNameMode: bool

Return
-------
None

Description
-----------
Set ViewNameMode for indicate display names or not.
") SetViewNameMode;
		static void SetViewNameMode(const Standard_Boolean viewNameMode);

};


%extend XCAFPrs {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class XCAFPrs_AISObject *
**************************/
class XCAFPrs_AISObject : public AIS_ColoredShape {
	public:
		/****** XCAFPrs_AISObject::XCAFPrs_AISObject ******/
		/****** md5 signature: f0e55528fe8ff1d29919bf9ea5fa6e58 ******/
		%feature("compactdefaultargs") XCAFPrs_AISObject;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label

Return
-------
None

Description
-----------
Creates an object to visualise the shape label.
") XCAFPrs_AISObject;
		 XCAFPrs_AISObject(const TDF_Label & theLabel);

		/****** XCAFPrs_AISObject::DispatchStyles ******/
		/****** md5 signature: 94e0ed354143041186c38dc4735f7b0d ******/
		%feature("compactdefaultargs") DispatchStyles;
		%feature("autodoc", "
Parameters
----------
theToSyncStyles: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Fetch the Shape from associated Label and fill the map of sub-shapes styles. By default, this method is called implicitly within first ::Compute(). Application might call this method explicitly to manipulate styles afterwards. 
Parameter theToSyncStyles flag indicating if method ::Compute() should call this method again on first compute or re-compute.
") DispatchStyles;
		virtual void DispatchStyles(const Standard_Boolean theToSyncStyles = Standard_False);

		/****** XCAFPrs_AISObject::GetLabel ******/
		/****** md5 signature: cc78125194d6893ebcb2c586f4ec4787 ******/
		%feature("compactdefaultargs") GetLabel;
		%feature("autodoc", "Return
-------
TDF_Label

Description
-----------
Returns the label which was visualised by this presentation.
") GetLabel;
		const TDF_Label & GetLabel();

		/****** XCAFPrs_AISObject::SetLabel ******/
		/****** md5 signature: cc470d5ce9738c8709b266c2b6c1b90a ******/
		%feature("compactdefaultargs") SetLabel;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label

Return
-------
None

Description
-----------
Assign the label to this presentation (but does not mark it outdated with SetToUpdate()).
") SetLabel;
		void SetLabel(const TDF_Label & theLabel);

		/****** XCAFPrs_AISObject::SetMaterial ******/
		/****** md5 signature: 1fdce10ca979b439818a2f4eb876e6cc ******/
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "
Parameters
----------
theMaterial: Graphic3d_MaterialAspect

Return
-------
None

Description
-----------
Sets the material aspect. This method assigns the new default material without overriding XDE styles. Re-computation of existing presentation is not required after calling this method.
") SetMaterial;
		virtual void SetMaterial(const Graphic3d_MaterialAspect & theMaterial);

};


%make_alias(XCAFPrs_AISObject)

%extend XCAFPrs_AISObject {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class XCAFPrs_DocumentExplorer *
*********************************/
class XCAFPrs_DocumentExplorer {
	public:
		/****** XCAFPrs_DocumentExplorer::XCAFPrs_DocumentExplorer ******/
		/****** md5 signature: aa276310e32f5cd8603391addf99321a ******/
		%feature("compactdefaultargs") XCAFPrs_DocumentExplorer;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") XCAFPrs_DocumentExplorer;
		 XCAFPrs_DocumentExplorer();

		/****** XCAFPrs_DocumentExplorer::XCAFPrs_DocumentExplorer ******/
		/****** md5 signature: 5c8b0df27ab7c88c0f701f14704a7726 ******/
		%feature("compactdefaultargs") XCAFPrs_DocumentExplorer;
		%feature("autodoc", "
Parameters
----------
theDocument: TDocStd_Document
theFlags: int
theDefStyle: XCAFPrs_Style (optional, default to XCAFPrs_Style())

Return
-------
None

Description
-----------
Constructor for exploring the whole document. 
Parameter theDocument document to explore 
Parameter theFlags iteration flags 
Parameter theDefStyle default style for nodes with undefined style.
") XCAFPrs_DocumentExplorer;
		 XCAFPrs_DocumentExplorer(const opencascade::handle<TDocStd_Document> & theDocument, int theFlags, const XCAFPrs_Style & theDefStyle = XCAFPrs_Style());

		/****** XCAFPrs_DocumentExplorer::XCAFPrs_DocumentExplorer ******/
		/****** md5 signature: 3a7cecc626d3723ed3253f4ffca51442 ******/
		%feature("compactdefaultargs") XCAFPrs_DocumentExplorer;
		%feature("autodoc", "
Parameters
----------
theDocument: TDocStd_Document
theRoots: TDF_LabelSequence
theFlags: int
theDefStyle: XCAFPrs_Style (optional, default to XCAFPrs_Style())

Return
-------
None

Description
-----------
Constructor for exploring specified list of root shapes in the document. 
Parameter theDocument document to explore 
Parameter theRoots root labels to explore within specified document 
Parameter theFlags iteration flags 
Parameter theDefStyle default style for nodes with undefined style.
") XCAFPrs_DocumentExplorer;
		 XCAFPrs_DocumentExplorer(const opencascade::handle<TDocStd_Document> & theDocument, const TDF_LabelSequence & theRoots, int theFlags, const XCAFPrs_Style & theDefStyle = XCAFPrs_Style());

		/****** XCAFPrs_DocumentExplorer::ChangeCurrent ******/
		/****** md5 signature: d8575b117c3ddc102a80c8f34d2d5ff3 ******/
		%feature("compactdefaultargs") ChangeCurrent;
		%feature("autodoc", "Return
-------
XCAFPrs_DocumentNode

Description
-----------
Return current position.
") ChangeCurrent;
		XCAFPrs_DocumentNode & ChangeCurrent();

		/****** XCAFPrs_DocumentExplorer::ColorTool ******/
		/****** md5 signature: 03b560befa7fe76ec9d38f36c9ee23bd ******/
		%feature("compactdefaultargs") ColorTool;
		%feature("autodoc", "Return
-------
opencascade::handle<XCAFDoc_ColorTool>

Description
-----------
Return color tool.
") ColorTool;
		const opencascade::handle<XCAFDoc_ColorTool> & ColorTool();

		/****** XCAFPrs_DocumentExplorer::Current ******/
		/****** md5 signature: 222ab8031f0a08f42b668a2b614cea4d ******/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "Return
-------
XCAFPrs_DocumentNode

Description
-----------
Return current position.
") Current;
		const XCAFPrs_DocumentNode & Current();

		/****** XCAFPrs_DocumentExplorer::Current ******/
		/****** md5 signature: efe0137b5d9a49ad6fe44f6c87e91380 ******/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "
Parameters
----------
theDepth: int

Return
-------
XCAFPrs_DocumentNode

Description
-----------
Return current position within specified assembly depth.
") Current;
		const XCAFPrs_DocumentNode & Current(Standard_Integer theDepth);

		/****** XCAFPrs_DocumentExplorer::CurrentDepth ******/
		/****** md5 signature: ec69b73ad734be8bbe2b41903c6bfb39 ******/
		%feature("compactdefaultargs") CurrentDepth;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return depth of the current node in hierarchy, starting from 0. Zero means Root label.
") CurrentDepth;
		Standard_Integer CurrentDepth();

		/****** XCAFPrs_DocumentExplorer::DefineChildId ******/
		/****** md5 signature: 408d6adf19c4d2c6d062f1bce2dab794 ******/
		%feature("compactdefaultargs") DefineChildId;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label
theParentId: str

Return
-------
TCollection_AsciiString

Description
-----------
Construct a unique string identifier for the given label. The identifier is a concatenation of label entries (TDF_Tool::Entry() with tailing '.') of hierarchy from parent to child joined via '/' and looking like this: @code 0:1:1:1./0:1:1:1:9./0:1:1:5:7. @endcode This generation scheme also allows finding originating labels using TDF_Tool::Label(). The tailing dot simplifies parent equality check. 
Parameter theLabel child label to define id 
Parameter theParentId parent string identifier defined by this method.
") DefineChildId;
		static TCollection_AsciiString DefineChildId(const TDF_Label & theLabel, TCollection_AsciiString theParentId);

		/****** XCAFPrs_DocumentExplorer::FindLabelFromPathId ******/
		/****** md5 signature: 36bd799783495ac64d75996cfdfc41d5 ******/
		%feature("compactdefaultargs") FindLabelFromPathId;
		%feature("autodoc", "
Parameters
----------
theDocument: TDocStd_Document
theId: str
theParentLocation: TopLoc_Location
theLocation: TopLoc_Location

Return
-------
TDF_Label

Description
-----------
Find a shape entity based on a text identifier constructed from OCAF labels defining full path. 
See also: DefineChildId().
") FindLabelFromPathId;
		static TDF_Label FindLabelFromPathId(const opencascade::handle<TDocStd_Document> & theDocument, TCollection_AsciiString theId, TopLoc_Location & theParentLocation, TopLoc_Location & theLocation);

		/****** XCAFPrs_DocumentExplorer::FindLabelFromPathId ******/
		/****** md5 signature: c5c736078028775b674842dc6f73fef0 ******/
		%feature("compactdefaultargs") FindLabelFromPathId;
		%feature("autodoc", "
Parameters
----------
theDocument: TDocStd_Document
theId: str
theLocation: TopLoc_Location

Return
-------
TDF_Label

Description
-----------
Find a shape entity based on a text identifier constructed from OCAF labels defining full path. 
See also: DefineChildId().
") FindLabelFromPathId;
		static TDF_Label FindLabelFromPathId(const opencascade::handle<TDocStd_Document> & theDocument, TCollection_AsciiString theId, TopLoc_Location & theLocation);

		/****** XCAFPrs_DocumentExplorer::FindShapeFromPathId ******/
		/****** md5 signature: fd58ff02219632fc8856de9d76e8dfa9 ******/
		%feature("compactdefaultargs") FindShapeFromPathId;
		%feature("autodoc", "
Parameters
----------
theDocument: TDocStd_Document
theId: str

Return
-------
TopoDS_Shape

Description
-----------
Find a shape entity based on a text identifier constructed from OCAF labels defining full path. 
See also: DefineChildId().
") FindShapeFromPathId;
		static TopoDS_Shape FindShapeFromPathId(const opencascade::handle<TDocStd_Document> & theDocument, TCollection_AsciiString theId);

		/****** XCAFPrs_DocumentExplorer::Init ******/
		/****** md5 signature: eec1c7e6d6c080cb010b849abf99e398 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theDocument: TDocStd_Document
theRoot: TDF_Label
theFlags: int
theDefStyle: XCAFPrs_Style (optional, default to XCAFPrs_Style())

Return
-------
None

Description
-----------
Initialize the iterator from a single root shape in the document. 
Parameter theDocument document to explore 
Parameter theRoot single root label to explore within specified document 
Parameter theFlags iteration flags 
Parameter theDefStyle default style for nodes with undefined style.
") Init;
		void Init(const opencascade::handle<TDocStd_Document> & theDocument, const TDF_Label & theRoot, int theFlags, const XCAFPrs_Style & theDefStyle = XCAFPrs_Style());

		/****** XCAFPrs_DocumentExplorer::Init ******/
		/****** md5 signature: 98f0800ab577cc74a88fca7a42e9982f ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theDocument: TDocStd_Document
theRoots: TDF_LabelSequence
theFlags: int
theDefStyle: XCAFPrs_Style (optional, default to XCAFPrs_Style())

Return
-------
None

Description
-----------
Initialize the iterator from the list of root shapes in the document. 
Parameter theDocument document to explore 
Parameter theRoots root labels to explore within specified document 
Parameter theFlags iteration flags 
Parameter theDefStyle default style for nodes with undefined style.
") Init;
		void Init(const opencascade::handle<TDocStd_Document> & theDocument, const TDF_LabelSequence & theRoots, int theFlags, const XCAFPrs_Style & theDefStyle = XCAFPrs_Style());

		/****** XCAFPrs_DocumentExplorer::More ******/
		/****** md5 signature: cff271d3b32940da94bada40648f9096 ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if iterator points to the valid node.
") More;
		Standard_Boolean More();

		/****** XCAFPrs_DocumentExplorer::Next ******/
		/****** md5 signature: f35c0df5f1d7c877986db18081404532 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
Go to the next node.
") Next;
		void Next();

		/****** XCAFPrs_DocumentExplorer::VisMaterialTool ******/
		/****** md5 signature: c13692c145aabd5f8daebdbee8d72374 ******/
		%feature("compactdefaultargs") VisMaterialTool;
		%feature("autodoc", "Return
-------
opencascade::handle<XCAFDoc_VisMaterialTool>

Description
-----------
Return material tool.
") VisMaterialTool;
		const opencascade::handle<XCAFDoc_VisMaterialTool> & VisMaterialTool();

};


%extend XCAFPrs_DocumentExplorer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class XCAFPrs_DocumentIdIterator *
***********************************/
class XCAFPrs_DocumentIdIterator {
	public:
		/****** XCAFPrs_DocumentIdIterator::XCAFPrs_DocumentIdIterator ******/
		/****** md5 signature: 6eadeae34139dcef0fb7e3b2667aa2e8 ******/
		%feature("compactdefaultargs") XCAFPrs_DocumentIdIterator;
		%feature("autodoc", "
Parameters
----------
thePath: str

Return
-------
None

Description
-----------
Main constructor.
") XCAFPrs_DocumentIdIterator;
		 XCAFPrs_DocumentIdIterator(TCollection_AsciiString thePath);

		/****** XCAFPrs_DocumentIdIterator::More ******/
		/****** md5 signature: 0a7b505ff53e438121f2c208f8ae7ce8 ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if iterator points to a value.
") More;
		bool More();

		/****** XCAFPrs_DocumentIdIterator::Next ******/
		/****** md5 signature: f35c0df5f1d7c877986db18081404532 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
Find the next value.
") Next;
		void Next();

		/****** XCAFPrs_DocumentIdIterator::Value ******/
		/****** md5 signature: 984f9d59b062e7ebff353351a4b04ca9 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Return current value.
") Value;
		const TCollection_AsciiString & Value();

};


%extend XCAFPrs_DocumentIdIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class XCAFPrs_DocumentNode *
*****************************/
class XCAFPrs_DocumentNode {
	public:
		/****** XCAFPrs_DocumentNode::XCAFPrs_DocumentNode ******/
		/****** md5 signature: 2d49950cf26abc8cee5d537bc0321564 ******/
		%feature("compactdefaultargs") XCAFPrs_DocumentNode;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") XCAFPrs_DocumentNode;
		 XCAFPrs_DocumentNode();


%extend{
    bool __eq_wrapper__(const XCAFPrs_DocumentNode other) {
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


%extend XCAFPrs_DocumentNode {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class XCAFPrs_Driver *
***********************/
class XCAFPrs_Driver : public TPrsStd_Driver {
	public:
		/****** XCAFPrs_Driver::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
returns GUID of the driver.
") GetID;
		static const Standard_GUID & GetID();

		/****** XCAFPrs_Driver::Update ******/
		/****** md5 signature: ec78618f91177554d26e45cdddd4ea50 ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label
ais: AIS_InteractiveObject

Return
-------
bool

Description
-----------
No available documentation.
") Update;
		virtual Standard_Boolean Update(const TDF_Label & L, opencascade::handle<AIS_InteractiveObject> & ais);

};


%make_alias(XCAFPrs_Driver)

%extend XCAFPrs_Driver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class XCAFPrs_Style *
**********************/
class XCAFPrs_Style {
	public:
		/****** XCAFPrs_Style::XCAFPrs_Style ******/
		/****** md5 signature: 9543f66d0ab16adfbffa6f1ff76c2dd5 ******/
		%feature("compactdefaultargs") XCAFPrs_Style;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor - colors are unset, visibility is True.
") XCAFPrs_Style;
		 XCAFPrs_Style();

		/****** XCAFPrs_Style::BaseColorTexture ******/
		/****** md5 signature: 5593aadcb24e7c7c552097db0852e354 ******/
		%feature("compactdefaultargs") BaseColorTexture;
		%feature("autodoc", "Return
-------
opencascade::handle<Image_Texture>

Description
-----------
Return base color texture.
") BaseColorTexture;
		const opencascade::handle<Image_Texture> & BaseColorTexture();


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
		/****** XCAFPrs_Style::GetColorCurv ******/
		/****** md5 signature: 94dac84988e85c1a6c1fff8156adc1a0 ******/
		%feature("compactdefaultargs") GetColorCurv;
		%feature("autodoc", "Return
-------
Quantity_Color

Description
-----------
Return curve color.
") GetColorCurv;
		const Quantity_Color & GetColorCurv();

		/****** XCAFPrs_Style::GetColorSurf ******/
		/****** md5 signature: a374a5c5f178aeaf928cc98a510eb507 ******/
		%feature("compactdefaultargs") GetColorSurf;
		%feature("autodoc", "Return
-------
Quantity_Color

Description
-----------
Return surface color.
") GetColorSurf;
		const Quantity_Color & GetColorSurf();

		/****** XCAFPrs_Style::GetColorSurfRGBA ******/
		/****** md5 signature: 3160a42dbee284647420257ee6038479 ******/
		%feature("compactdefaultargs") GetColorSurfRGBA;
		%feature("autodoc", "Return
-------
Quantity_ColorRGBA

Description
-----------
Return surface color.
") GetColorSurfRGBA;
		const Quantity_ColorRGBA & GetColorSurfRGBA();

		/****** XCAFPrs_Style::IsEmpty ******/
		/****** md5 signature: d529c07ce9e12eea3222188c82b0e80b ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if style is empty - does not override any properties.
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****** XCAFPrs_Style::IsEqual ******/
		/****** md5 signature: bc0bb14527a436f5e61f4f2840f337dd ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
theOther: XCAFPrs_Style

Return
-------
bool

Description
-----------
Returns True if styles are the same Methods for using Style as key in maps.
") IsEqual;
		Standard_Boolean IsEqual(const XCAFPrs_Style & theOther);

		/****** XCAFPrs_Style::IsSetColorCurv ******/
		/****** md5 signature: 64313982bf697dffdbaa22ea5a964e21 ******/
		%feature("compactdefaultargs") IsSetColorCurv;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if curve color has been defined.
") IsSetColorCurv;
		Standard_Boolean IsSetColorCurv();

		/****** XCAFPrs_Style::IsSetColorSurf ******/
		/****** md5 signature: d9778230338d66c28842ee9deaba02eb ******/
		%feature("compactdefaultargs") IsSetColorSurf;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if surface color has been defined.
") IsSetColorSurf;
		Standard_Boolean IsSetColorSurf();

		/****** XCAFPrs_Style::IsVisible ******/
		/****** md5 signature: d2de178c6bd2985a6f06b17107c0b3e4 ******/
		%feature("compactdefaultargs") IsVisible;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Manage visibility.
") IsVisible;
		Standard_Boolean IsVisible();

		/****** XCAFPrs_Style::Material ******/
		/****** md5 signature: 88a9882f137bb7b5c54ec36089272083 ******/
		%feature("compactdefaultargs") Material;
		%feature("autodoc", "Return
-------
opencascade::handle<XCAFDoc_VisMaterial>

Description
-----------
Return material.
") Material;
		const opencascade::handle<XCAFDoc_VisMaterial> & Material();

		/****** XCAFPrs_Style::SetColorCurv ******/
		/****** md5 signature: 2e698f922d193bf6b1a67515dc2ebc31 ******/
		%feature("compactdefaultargs") SetColorCurv;
		%feature("autodoc", "
Parameters
----------
col: Quantity_Color

Return
-------
None

Description
-----------
Set curve color.
") SetColorCurv;
		void SetColorCurv(const Quantity_Color & col);

		/****** XCAFPrs_Style::SetColorSurf ******/
		/****** md5 signature: e9eab2473a29158ea5b9c596748c7881 ******/
		%feature("compactdefaultargs") SetColorSurf;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color

Return
-------
None

Description
-----------
Set surface color.
") SetColorSurf;
		void SetColorSurf(const Quantity_Color & theColor);

		/****** XCAFPrs_Style::SetColorSurf ******/
		/****** md5 signature: 9a15c6ee293d6149e1a723c4eb5768eb ******/
		%feature("compactdefaultargs") SetColorSurf;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_ColorRGBA

Return
-------
None

Description
-----------
Set surface color.
") SetColorSurf;
		void SetColorSurf(const Quantity_ColorRGBA & theColor);

		/****** XCAFPrs_Style::SetMaterial ******/
		/****** md5 signature: 1f981215aea2218b6425fee7eadb5e93 ******/
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "
Parameters
----------
theMaterial: XCAFDoc_VisMaterial

Return
-------
None

Description
-----------
Set material.
") SetMaterial;
		void SetMaterial(const opencascade::handle<XCAFDoc_VisMaterial> & theMaterial);

		/****** XCAFPrs_Style::SetVisibility ******/
		/****** md5 signature: 71f6f1775dc0a92e7f83855c46ebf1b8 ******/
		%feature("compactdefaultargs") SetVisibility;
		%feature("autodoc", "
Parameters
----------
theVisibility: bool

Return
-------
None

Description
-----------
Assign visibility.
") SetVisibility;
		void SetVisibility(const Standard_Boolean theVisibility);

		/****** XCAFPrs_Style::UnSetColorCurv ******/
		/****** md5 signature: 9be030dda02ca97eff5127a9e3cee728 ******/
		%feature("compactdefaultargs") UnSetColorCurv;
		%feature("autodoc", "Return
-------
None

Description
-----------
Manage curve color setting.
") UnSetColorCurv;
		void UnSetColorCurv();

		/****** XCAFPrs_Style::UnSetColorSurf ******/
		/****** md5 signature: 0529b14576d6cd5e89114f6c947f96ce ******/
		%feature("compactdefaultargs") UnSetColorSurf;
		%feature("autodoc", "Return
-------
None

Description
-----------
Manage surface color setting.
") UnSetColorSurf;
		void UnSetColorSurf();


%extend{
    bool __eq_wrapper__(const XCAFPrs_Style other) {
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


%extend XCAFPrs_Style {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class XCAFPrs_Texture *
************************/
class XCAFPrs_Texture : public Graphic3d_Texture2D {
	public:
		/****** XCAFPrs_Texture::XCAFPrs_Texture ******/
		/****** md5 signature: 000bd876aad38ca74535015d5e9463d7 ******/
		%feature("compactdefaultargs") XCAFPrs_Texture;
		%feature("autodoc", "
Parameters
----------
theImageSource: Image_Texture
theUnit: Graphic3d_TextureUnit

Return
-------
None

Description
-----------
Constructor.
") XCAFPrs_Texture;
		 XCAFPrs_Texture(const opencascade::handle<Image_Texture> & theImageSource, const Graphic3d_TextureUnit theUnit);

		/****** XCAFPrs_Texture::GetCompressedImage ******/
		/****** md5 signature: bad0c95151f5a884e9dbc72217977538 ******/
		%feature("compactdefaultargs") GetCompressedImage;
		%feature("autodoc", "
Parameters
----------
theSupported: Image_SupportedFormats

Return
-------
opencascade::handle<Image_CompressedPixMap>

Description
-----------
Image reader.
") GetCompressedImage;
		virtual opencascade::handle<Image_CompressedPixMap> GetCompressedImage(const opencascade::handle<Image_SupportedFormats> & theSupported);

		/****** XCAFPrs_Texture::GetImage ******/
		/****** md5 signature: 98e90e03819b0bd5f7f8f4733cc9ed0c ******/
		%feature("compactdefaultargs") GetImage;
		%feature("autodoc", "
Parameters
----------
theSupported: Image_SupportedFormats

Return
-------
opencascade::handle<Image_PixMap>

Description
-----------
Image reader.
") GetImage;
		virtual opencascade::handle<Image_PixMap> GetImage(const opencascade::handle<Image_SupportedFormats> & theSupported);

		/****** XCAFPrs_Texture::GetImageSource ******/
		/****** md5 signature: c24f99a1f3e5bf7521b240aa232d6d28 ******/
		%feature("compactdefaultargs") GetImageSource;
		%feature("autodoc", "Return
-------
opencascade::handle<Image_Texture>

Description
-----------
Return image source.
") GetImageSource;
		const opencascade::handle<Image_Texture> & GetImageSource();

};


%make_alias(XCAFPrs_Texture)

%extend XCAFPrs_Texture {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class hash<XCAFPrs_DocumentNode> *
***********************************/
/****************************
* class hash<XCAFPrs_Style> *
****************************/
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def xcafprs_CollectStyleSettings(*args):
	return xcafprs.CollectStyleSettings(*args)

@deprecated
def xcafprs_GetViewNameMode(*args):
	return xcafprs.GetViewNameMode(*args)

@deprecated
def xcafprs_SetViewNameMode(*args):
	return xcafprs.SetViewNameMode(*args)

@deprecated
def XCAFPrs_DocumentExplorer_DefineChildId(*args):
	return XCAFPrs_DocumentExplorer.DefineChildId(*args)

@deprecated
def XCAFPrs_DocumentExplorer_FindLabelFromPathId(*args):
	return XCAFPrs_DocumentExplorer.FindLabelFromPathId(*args)

@deprecated
def XCAFPrs_DocumentExplorer_FindLabelFromPathId(*args):
	return XCAFPrs_DocumentExplorer.FindLabelFromPathId(*args)

@deprecated
def XCAFPrs_DocumentExplorer_FindShapeFromPathId(*args):
	return XCAFPrs_DocumentExplorer.FindShapeFromPathId(*args)

@deprecated
def XCAFPrs_Driver_GetID(*args):
	return XCAFPrs_Driver.GetID(*args)

}
