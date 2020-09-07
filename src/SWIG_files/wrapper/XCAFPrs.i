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
%define XCAFPRSDOCSTRING
"XCAFPrs module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_xcafprs.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


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
#include<TCollection_module.hxx>
#include<TopoDS_module.hxx>
#include<TPrsStd_module.hxx>
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
%import TCollection.i
%import TopoDS.i
%import TPrsStd.i

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

/* python proy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
%wrap_handle(XCAFPrs_AISObject)
%wrap_handle(XCAFPrs_Driver)
/* end handles declaration */

/* templates */
%template(XCAFPrs_DataMapOfStyleShape) NCollection_DataMap<XCAFPrs_Style,TopoDS_Shape,XCAFPrs_Style>;
%template(XCAFPrs_DataMapOfStyleTransient) NCollection_DataMap<XCAFPrs_Style,opencascade::handle<Standard_Transient>,XCAFPrs_Style>;
%template(XCAFPrs_IndexedDataMapOfShapeStyle) NCollection_IndexedDataMap<TopoDS_Shape,XCAFPrs_Style,TopTools_ShapeMapHasher>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap<XCAFPrs_Style, TopoDS_Shape, XCAFPrs_Style>::Iterator XCAFPrs_DataMapIteratorOfDataMapOfStyleShape;
typedef NCollection_DataMap<XCAFPrs_Style, opencascade::handle<Standard_Transient>, XCAFPrs_Style>::Iterator XCAFPrs_DataMapIteratorOfDataMapOfStyleTransient;
typedef NCollection_IndexedDataMap<TopoDS_Shape, XCAFPrs_Style, TopTools_ShapeMapHasher>::Iterator XCAFPrs_DataMapIteratorOfIndexedDataMapOfShapeStyle;
typedef NCollection_DataMap<XCAFPrs_Style, TopoDS_Shape, XCAFPrs_Style> XCAFPrs_DataMapOfStyleShape;
typedef NCollection_DataMap<XCAFPrs_Style, opencascade::handle<Standard_Transient>, XCAFPrs_Style> XCAFPrs_DataMapOfStyleTransient;
typedef Standard_Integer XCAFPrs_DocumentExplorerFlags;
typedef NCollection_IndexedDataMap<TopoDS_Shape, XCAFPrs_Style, TopTools_ShapeMapHasher> XCAFPrs_IndexedDataMapOfShapeStyle;
/* end typedefs declaration */

/****************
* class XCAFPrs *
****************/
%rename(xcafprs) XCAFPrs;
class XCAFPrs {
	public:
		/****************** CollectStyleSettings ******************/
		/**** md5 signature: 7a262a4756e5937c27328da5edc3fabd ****/
		%feature("compactdefaultargs") CollectStyleSettings;
		%feature("autodoc", "Collect styles defined for shape on label l and its components and subshapes and fills a map of shape - style correspondence the location <loc> is for internal use, it should be null location for external call.

Parameters
----------
L: TDF_Label
loc: TopLoc_Location
settings: XCAFPrs_IndexedDataMapOfShapeStyle
theLayerColor: Quantity_ColorRGBA,optional
	default value is Quantity_ColorRGBA(Quantity_NOC_WHITE)

Returns
-------
None
") CollectStyleSettings;
		static void CollectStyleSettings(const TDF_Label & L, const TopLoc_Location & loc, XCAFPrs_IndexedDataMapOfShapeStyle & settings, const Quantity_ColorRGBA & theLayerColor = Quantity_ColorRGBA(Quantity_NOC_WHITE));

		/****************** GetViewNameMode ******************/
		/**** md5 signature: 00babb1f013f86f66ee15ee01531e437 ****/
		%feature("compactdefaultargs") GetViewNameMode;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") GetViewNameMode;
		static Standard_Boolean GetViewNameMode();

		/****************** SetViewNameMode ******************/
		/**** md5 signature: 42d2caa5815110f47af30e5cb5a0c0d6 ****/
		%feature("compactdefaultargs") SetViewNameMode;
		%feature("autodoc", "Set viewnamemode for indicate display names or not.

Parameters
----------
viewNameMode: bool

Returns
-------
None
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
		/****************** XCAFPrs_AISObject ******************/
		/**** md5 signature: f0e55528fe8ff1d29919bf9ea5fa6e58 ****/
		%feature("compactdefaultargs") XCAFPrs_AISObject;
		%feature("autodoc", "Creates an object to visualise the shape label.

Parameters
----------
theLabel: TDF_Label

Returns
-------
None
") XCAFPrs_AISObject;
		 XCAFPrs_AISObject(const TDF_Label & theLabel);

		/****************** DispatchStyles ******************/
		/**** md5 signature: 94e0ed354143041186c38dc4735f7b0d ****/
		%feature("compactdefaultargs") DispatchStyles;
		%feature("autodoc", "Fetch the shape from associated label and fill the map of sub-shapes styles. by default, this method is called implicitly within first ::compute(). application might call this method explicitly to manipulate styles afterwards. @param thetosyncstyles flag indicating if method ::compute() should call this method again on first compute or re-compute.

Parameters
----------
theToSyncStyles: bool,optional
	default value is Standard_False

Returns
-------
None
") DispatchStyles;
		virtual void DispatchStyles(const Standard_Boolean theToSyncStyles = Standard_False);

		/****************** GetLabel ******************/
		/**** md5 signature: cc78125194d6893ebcb2c586f4ec4787 ****/
		%feature("compactdefaultargs") GetLabel;
		%feature("autodoc", "Returns the label which was visualised by this presentation.

Returns
-------
TDF_Label
") GetLabel;
		const TDF_Label & GetLabel();

		/****************** SetLabel ******************/
		/**** md5 signature: cc470d5ce9738c8709b266c2b6c1b90a ****/
		%feature("compactdefaultargs") SetLabel;
		%feature("autodoc", "Assign the label to this presentation (but does not mark it outdated with settoupdate()).

Parameters
----------
theLabel: TDF_Label

Returns
-------
None
") SetLabel;
		void SetLabel(const TDF_Label & theLabel);

		/****************** SetMaterial ******************/
		/**** md5 signature: 1fdce10ca979b439818a2f4eb876e6cc ****/
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "Sets the material aspect. this method assigns the new default material without overriding xde styles. re-computation of existing presentation is not required after calling this method.

Parameters
----------
theMaterial: Graphic3d_MaterialAspect

Returns
-------
None
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
		/****************** XCAFPrs_DocumentExplorer ******************/
		/**** md5 signature: aa276310e32f5cd8603391addf99321a ****/
		%feature("compactdefaultargs") XCAFPrs_DocumentExplorer;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") XCAFPrs_DocumentExplorer;
		 XCAFPrs_DocumentExplorer();

		/****************** XCAFPrs_DocumentExplorer ******************/
		/**** md5 signature: 5c8b0df27ab7c88c0f701f14704a7726 ****/
		%feature("compactdefaultargs") XCAFPrs_DocumentExplorer;
		%feature("autodoc", "Constructor for exploring the whole document. @param thedocument document to explore @param theflags iteration flags @param thedefstyle default style for nodes with undefined style.

Parameters
----------
theDocument: TDocStd_Document
theFlags: int
theDefStyle: XCAFPrs_Style,optional
	default value is XCAFPrs_Style()

Returns
-------
None
") XCAFPrs_DocumentExplorer;
		 XCAFPrs_DocumentExplorer(const opencascade::handle<TDocStd_Document> & theDocument, int theFlags, const XCAFPrs_Style & theDefStyle = XCAFPrs_Style());

		/****************** XCAFPrs_DocumentExplorer ******************/
		/**** md5 signature: 3a7cecc626d3723ed3253f4ffca51442 ****/
		%feature("compactdefaultargs") XCAFPrs_DocumentExplorer;
		%feature("autodoc", "Constructor for exploring specified list of root shapes in the document. @param thedocument document to explore @param theroots root labels to explore within specified document @param theflags iteration flags @param thedefstyle default style for nodes with undefined style.

Parameters
----------
theDocument: TDocStd_Document
theRoots: TDF_LabelSequence
theFlags: int
theDefStyle: XCAFPrs_Style,optional
	default value is XCAFPrs_Style()

Returns
-------
None
") XCAFPrs_DocumentExplorer;
		 XCAFPrs_DocumentExplorer(const opencascade::handle<TDocStd_Document> & theDocument, const TDF_LabelSequence & theRoots, int theFlags, const XCAFPrs_Style & theDefStyle = XCAFPrs_Style());

		/****************** ChangeCurrent ******************/
		/**** md5 signature: d8575b117c3ddc102a80c8f34d2d5ff3 ****/
		%feature("compactdefaultargs") ChangeCurrent;
		%feature("autodoc", "Return current position.

Returns
-------
XCAFPrs_DocumentNode
") ChangeCurrent;
		XCAFPrs_DocumentNode & ChangeCurrent();

		/****************** Current ******************/
		/**** md5 signature: 222ab8031f0a08f42b668a2b614cea4d ****/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "Return current position.

Returns
-------
XCAFPrs_DocumentNode
") Current;
		const XCAFPrs_DocumentNode & Current();

		/****************** Current ******************/
		/**** md5 signature: efe0137b5d9a49ad6fe44f6c87e91380 ****/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "Return current position within specified assembly depth.

Parameters
----------
theDepth: int

Returns
-------
XCAFPrs_DocumentNode
") Current;
		const XCAFPrs_DocumentNode & Current(Standard_Integer theDepth);

		/****************** CurrentDepth ******************/
		/**** md5 signature: ec69b73ad734be8bbe2b41903c6bfb39 ****/
		%feature("compactdefaultargs") CurrentDepth;
		%feature("autodoc", "Return depth of the current node in hierarchy, starting from 0. zero means root label.

Returns
-------
int
") CurrentDepth;
		Standard_Integer CurrentDepth();

		/****************** DefineChildId ******************/
		/**** md5 signature: 408d6adf19c4d2c6d062f1bce2dab794 ****/
		%feature("compactdefaultargs") DefineChildId;
		%feature("autodoc", "Construct a unique string identifier for the given label. the identifier is a concatenation of label entries (tdf_tool::entry() with tailing '.') of hierarchy from parent to child joined via '/' and looking like this: @code 0:1:1:1./0:1:1:1:9./0:1:1:5:7. @endcode this generation scheme also allows finding originating labels using tdf_tool::label(). the tailing dot simplifies parent equality check. @param thelabel child label to define id @param theparentid parent string identifier defined by this method.

Parameters
----------
theLabel: TDF_Label
theParentId: TCollection_AsciiString

Returns
-------
TCollection_AsciiString
") DefineChildId;
		static TCollection_AsciiString DefineChildId(const TDF_Label & theLabel, const TCollection_AsciiString & theParentId);

		/****************** FindLabelFromPathId ******************/
		/**** md5 signature: 36bd799783495ac64d75996cfdfc41d5 ****/
		%feature("compactdefaultargs") FindLabelFromPathId;
		%feature("autodoc", "Find a shape entity based on a text identifier constructed from ocaf labels defining full path. @sa definechildid().

Parameters
----------
theDocument: TDocStd_Document
theId: TCollection_AsciiString
theParentLocation: TopLoc_Location
theLocation: TopLoc_Location

Returns
-------
TDF_Label
") FindLabelFromPathId;
		static TDF_Label FindLabelFromPathId(const opencascade::handle<TDocStd_Document> & theDocument, const TCollection_AsciiString & theId, TopLoc_Location & theParentLocation, TopLoc_Location & theLocation);

		/****************** FindLabelFromPathId ******************/
		/**** md5 signature: c5c736078028775b674842dc6f73fef0 ****/
		%feature("compactdefaultargs") FindLabelFromPathId;
		%feature("autodoc", "Find a shape entity based on a text identifier constructed from ocaf labels defining full path. @sa definechildid().

Parameters
----------
theDocument: TDocStd_Document
theId: TCollection_AsciiString
theLocation: TopLoc_Location

Returns
-------
TDF_Label
") FindLabelFromPathId;
		static TDF_Label FindLabelFromPathId(const opencascade::handle<TDocStd_Document> & theDocument, const TCollection_AsciiString & theId, TopLoc_Location & theLocation);

		/****************** FindShapeFromPathId ******************/
		/**** md5 signature: fd58ff02219632fc8856de9d76e8dfa9 ****/
		%feature("compactdefaultargs") FindShapeFromPathId;
		%feature("autodoc", "Find a shape entity based on a text identifier constructed from ocaf labels defining full path. @sa definechildid().

Parameters
----------
theDocument: TDocStd_Document
theId: TCollection_AsciiString

Returns
-------
TopoDS_Shape
") FindShapeFromPathId;
		static TopoDS_Shape FindShapeFromPathId(const opencascade::handle<TDocStd_Document> & theDocument, const TCollection_AsciiString & theId);

		/****************** Init ******************/
		/**** md5 signature: eec1c7e6d6c080cb010b849abf99e398 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize the iterator from a single root shape in the document. @param thedocument document to explore @param theroot single root label to explore within specified document @param theflags iteration flags @param thedefstyle default style for nodes with undefined style.

Parameters
----------
theDocument: TDocStd_Document
theRoot: TDF_Label
theFlags: int
theDefStyle: XCAFPrs_Style,optional
	default value is XCAFPrs_Style()

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TDocStd_Document> & theDocument, const TDF_Label & theRoot, int theFlags, const XCAFPrs_Style & theDefStyle = XCAFPrs_Style());

		/****************** Init ******************/
		/**** md5 signature: 98f0800ab577cc74a88fca7a42e9982f ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize the iterator from the list of root shapes in the document. @param thedocument document to explore @param theroots root labels to explore within specified document @param theflags iteration flags @param thedefstyle default style for nodes with undefined style.

Parameters
----------
theDocument: TDocStd_Document
theRoots: TDF_LabelSequence
theFlags: int
theDefStyle: XCAFPrs_Style,optional
	default value is XCAFPrs_Style()

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TDocStd_Document> & theDocument, const TDF_LabelSequence & theRoots, int theFlags, const XCAFPrs_Style & theDefStyle = XCAFPrs_Style());

		/****************** More ******************/
		/**** md5 signature: cff271d3b32940da94bada40648f9096 ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return true if iterator points to the valid node.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		/**** md5 signature: f35c0df5f1d7c877986db18081404532 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Go to the next node.

Returns
-------
None
") Next;
		void Next();

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
		/****************** XCAFPrs_DocumentIdIterator ******************/
		/**** md5 signature: 6eadeae34139dcef0fb7e3b2667aa2e8 ****/
		%feature("compactdefaultargs") XCAFPrs_DocumentIdIterator;
		%feature("autodoc", "Main constructor.

Parameters
----------
thePath: TCollection_AsciiString

Returns
-------
None
") XCAFPrs_DocumentIdIterator;
		 XCAFPrs_DocumentIdIterator(const TCollection_AsciiString & thePath);

		/****************** More ******************/
		/**** md5 signature: 0a7b505ff53e438121f2c208f8ae7ce8 ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return true if iterator points to a value.

Returns
-------
bool
") More;
		bool More();

		/****************** Next ******************/
		/**** md5 signature: f35c0df5f1d7c877986db18081404532 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Find the next value.

Returns
-------
None
") Next;
		void Next();

		/****************** Value ******************/
		/**** md5 signature: 984f9d59b062e7ebff353351a4b04ca9 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return current value.

Returns
-------
TCollection_AsciiString
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
		TCollection_AsciiString Id;
		TDF_Label Label;
		TDF_Label RefLabel;
		XCAFPrs_Style Style;
		TopLoc_Location Location;
		TopLoc_Location LocalTrsf;
		TDF_ChildIterator ChildIter;
		bool IsAssembly;
		/****************** XCAFPrs_DocumentNode ******************/
		/**** md5 signature: 2d49950cf26abc8cee5d537bc0321564 ****/
		%feature("compactdefaultargs") XCAFPrs_DocumentNode;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") XCAFPrs_DocumentNode;
		 XCAFPrs_DocumentNode();

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
		/****************** GetID ******************/
		/**** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ****/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Returns guid of the driver.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** Update ******************/
		/**** md5 signature: ec78618f91177554d26e45cdddd4ea50 ****/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: TDF_Label
ais: AIS_InteractiveObject

Returns
-------
bool
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
		/****************** XCAFPrs_Style ******************/
		/**** md5 signature: 9543f66d0ab16adfbffa6f1ff76c2dd5 ****/
		%feature("compactdefaultargs") XCAFPrs_Style;
		%feature("autodoc", "Empty constructor - colors are unset, visibility is true.

Returns
-------
None
") XCAFPrs_Style;
		 XCAFPrs_Style();


            %feature("autodoc", "1");
            %extend{
                std::string DumpJsonToString(int depth=-1) {
                std::stringstream s;
                self->DumpJson(s, depth);
                return s.str();}
            };
		/****************** GetColorCurv ******************/
		/**** md5 signature: 94dac84988e85c1a6c1fff8156adc1a0 ****/
		%feature("compactdefaultargs") GetColorCurv;
		%feature("autodoc", "Return curve color.

Returns
-------
Quantity_Color
") GetColorCurv;
		const Quantity_Color & GetColorCurv();

		/****************** GetColorSurf ******************/
		/**** md5 signature: a374a5c5f178aeaf928cc98a510eb507 ****/
		%feature("compactdefaultargs") GetColorSurf;
		%feature("autodoc", "Return surface color.

Returns
-------
Quantity_Color
") GetColorSurf;
		const Quantity_Color & GetColorSurf();

		/****************** GetColorSurfRGBA ******************/
		/**** md5 signature: 3160a42dbee284647420257ee6038479 ****/
		%feature("compactdefaultargs") GetColorSurfRGBA;
		%feature("autodoc", "Return surface color.

Returns
-------
Quantity_ColorRGBA
") GetColorSurfRGBA;
		const Quantity_ColorRGBA & GetColorSurfRGBA();

		/****************** HashCode ******************/
		/**** md5 signature: 815866ace2120ed6a0aade78641943c6 ****/
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "Computes a hash code for the given set of styling settings, in the range [1, theupperbound] @param thestyle the set of styling settings which hash code is to be computed @param theupperbound the upper bound of the range a computing hash code must be within returns a computed hash code, in the range [1, theupperbound].

Parameters
----------
theStyle: XCAFPrs_Style
theUpperBound: int

Returns
-------
int
") HashCode;
		static Standard_Integer HashCode(const XCAFPrs_Style & theStyle, const Standard_Integer theUpperBound);

		/****************** IsEqual ******************/
		/**** md5 signature: bc0bb14527a436f5e61f4f2840f337dd ****/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Returns true if styles are the same methods for using style as key in maps.

Parameters
----------
theOther: XCAFPrs_Style

Returns
-------
bool
") IsEqual;
		Standard_Boolean IsEqual(const XCAFPrs_Style & theOther);

		/****************** IsEqual ******************/
		/**** md5 signature: c0449415bf9985342d955191e7ff7a56 ****/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Returns true when the two keys are the same.

Parameters
----------
theS1: XCAFPrs_Style
theS2: XCAFPrs_Style

Returns
-------
bool
") IsEqual;
		static Standard_Boolean IsEqual(const XCAFPrs_Style & theS1, const XCAFPrs_Style & theS2);

		/****************** IsSetColorCurv ******************/
		/**** md5 signature: 64313982bf697dffdbaa22ea5a964e21 ****/
		%feature("compactdefaultargs") IsSetColorCurv;
		%feature("autodoc", "Return true if curve color has been defined.

Returns
-------
bool
") IsSetColorCurv;
		Standard_Boolean IsSetColorCurv();

		/****************** IsSetColorSurf ******************/
		/**** md5 signature: d9778230338d66c28842ee9deaba02eb ****/
		%feature("compactdefaultargs") IsSetColorSurf;
		%feature("autodoc", "Return true if surface color has been defined.

Returns
-------
bool
") IsSetColorSurf;
		Standard_Boolean IsSetColorSurf();

		/****************** IsVisible ******************/
		/**** md5 signature: d2de178c6bd2985a6f06b17107c0b3e4 ****/
		%feature("compactdefaultargs") IsVisible;
		%feature("autodoc", "Manage visibility.

Returns
-------
bool
") IsVisible;
		Standard_Boolean IsVisible();

		/****************** SetColorCurv ******************/
		/**** md5 signature: 2e698f922d193bf6b1a67515dc2ebc31 ****/
		%feature("compactdefaultargs") SetColorCurv;
		%feature("autodoc", "Set curve color.

Parameters
----------
col: Quantity_Color

Returns
-------
None
") SetColorCurv;
		void SetColorCurv(const Quantity_Color & col);

		/****************** SetColorSurf ******************/
		/**** md5 signature: e9eab2473a29158ea5b9c596748c7881 ****/
		%feature("compactdefaultargs") SetColorSurf;
		%feature("autodoc", "Set surface color.

Parameters
----------
theColor: Quantity_Color

Returns
-------
None
") SetColorSurf;
		void SetColorSurf(const Quantity_Color & theColor);

		/****************** SetColorSurf ******************/
		/**** md5 signature: 9a15c6ee293d6149e1a723c4eb5768eb ****/
		%feature("compactdefaultargs") SetColorSurf;
		%feature("autodoc", "Set surface color.

Parameters
----------
theColor: Quantity_ColorRGBA

Returns
-------
None
") SetColorSurf;
		void SetColorSurf(const Quantity_ColorRGBA & theColor);

		/****************** SetVisibility ******************/
		/**** md5 signature: 71f6f1775dc0a92e7f83855c46ebf1b8 ****/
		%feature("compactdefaultargs") SetVisibility;
		%feature("autodoc", "Assign visibility.

Parameters
----------
theVisibility: bool

Returns
-------
None
") SetVisibility;
		void SetVisibility(const Standard_Boolean theVisibility);

		/****************** UnSetColorCurv ******************/
		/**** md5 signature: 9be030dda02ca97eff5127a9e3cee728 ****/
		%feature("compactdefaultargs") UnSetColorCurv;
		%feature("autodoc", "Manage curve color setting.

Returns
-------
None
") UnSetColorCurv;
		void UnSetColorCurv();

		/****************** UnSetColorSurf ******************/
		/**** md5 signature: 0529b14576d6cd5e89114f6c947f96ce ****/
		%feature("compactdefaultargs") UnSetColorSurf;
		%feature("autodoc", "Manage surface color setting.

Returns
-------
None
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

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
