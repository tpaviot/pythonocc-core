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
#include<TCollection_module.hxx>
#include<TDocStd_module.hxx>
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
#include<Visual3d_module.hxx>
#include<Prs3d_module.hxx>
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
%import TCollection.i
%import TDocStd.i
%import TopoDS.i
%import TPrsStd.i
/* public enums */
enum  {
	XCAFPrs_DocumentExplorerFlags_None = 0,
	XCAFPrs_DocumentExplorerFlags_OnlyLeafNodes = 1,
	XCAFPrs_DocumentExplorerFlags_NoStyle = 2,
};

/* end public enums declaration */

/* handles */
%wrap_handle(XCAFPrs_AISObject)
%wrap_handle(XCAFPrs_Driver)
/* end handles declaration */

/* templates */
%template(XCAFPrs_DataMapOfStyleShape) NCollection_DataMap <XCAFPrs_Style , TopoDS_Shape , XCAFPrs_Style>;
%template(XCAFPrs_DataMapOfStyleTransient) NCollection_DataMap <XCAFPrs_Style , opencascade::handle <Standard_Transient>, XCAFPrs_Style>;
%template(XCAFPrs_IndexedDataMapOfShapeStyle) NCollection_IndexedDataMap <TopoDS_Shape , XCAFPrs_Style , TopTools_ShapeMapHasher>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap <XCAFPrs_Style , TopoDS_Shape , XCAFPrs_Style> XCAFPrs_DataMapOfStyleShape;
typedef NCollection_DataMap <XCAFPrs_Style , TopoDS_Shape , XCAFPrs_Style>::Iterator XCAFPrs_DataMapIteratorOfDataMapOfStyleShape;
typedef NCollection_DataMap <XCAFPrs_Style , opencascade::handle <Standard_Transient>, XCAFPrs_Style> XCAFPrs_DataMapOfStyleTransient;
typedef NCollection_DataMap <XCAFPrs_Style , opencascade::handle <Standard_Transient>, XCAFPrs_Style>::Iterator XCAFPrs_DataMapIteratorOfDataMapOfStyleTransient;
typedef Standard_Integer XCAFPrs_DocumentExplorerFlags;
typedef NCollection_IndexedDataMap <TopoDS_Shape , XCAFPrs_Style , TopTools_ShapeMapHasher> XCAFPrs_IndexedDataMapOfShapeStyle;
typedef NCollection_IndexedDataMap <TopoDS_Shape , XCAFPrs_Style , TopTools_ShapeMapHasher>::Iterator XCAFPrs_DataMapIteratorOfIndexedDataMapOfShapeStyle;
/* end typedefs declaration */

/****************
* class XCAFPrs *
****************/
%rename(xcafprs) XCAFPrs;
class XCAFPrs {
	public:
		/****************** CollectStyleSettings ******************/
		%feature("compactdefaultargs") CollectStyleSettings;
		%feature("autodoc", "* Collect styles defined for shape on label L and its components and subshapes and fills a map of shape - style correspondence The location <loc> is for internal use, it should be Null location for external call
	:param L:
	:type L: TDF_Label
	:param loc:
	:type loc: TopLoc_Location
	:param settings:
	:type settings: XCAFPrs_IndexedDataMapOfShapeStyle
	:param theLayerColor: default value is Quantity_ColorRGBA(Quantity_NOC_WHITE)
	:type theLayerColor: Quantity_ColorRGBA
	:rtype: void") CollectStyleSettings;
		static void CollectStyleSettings (const TDF_Label & L,const TopLoc_Location & loc,XCAFPrs_IndexedDataMapOfShapeStyle & settings,const Quantity_ColorRGBA & theLayerColor = Quantity_ColorRGBA(Quantity_NOC_WHITE));

		/****************** GetViewNameMode ******************/
		%feature("compactdefaultargs") GetViewNameMode;
		%feature("autodoc", ":rtype: bool") GetViewNameMode;
		static Standard_Boolean GetViewNameMode ();

		/****************** SetViewNameMode ******************/
		%feature("compactdefaultargs") SetViewNameMode;
		%feature("autodoc", "* Set ViewNameMode for indicate display names or not.
	:param viewNameMode:
	:type viewNameMode: bool
	:rtype: void") SetViewNameMode;
		static void SetViewNameMode (const Standard_Boolean viewNameMode);

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
		/****************** DispatchStyles ******************/
		%feature("compactdefaultargs") DispatchStyles;
		%feature("autodoc", "* Fetch the Shape from associated Label and fill the map of sub-shapes styles. By default, this method is called implicitly within first ::Compute(). Application might call this method explicitly to manipulate styles afterwards. @param theToSyncStyles flag indicating if method ::Compute() should call this method again on first compute or re-compute
	:param theToSyncStyles: default value is Standard_False
	:type theToSyncStyles: bool
	:rtype: void") DispatchStyles;
		virtual void DispatchStyles (const Standard_Boolean theToSyncStyles = Standard_False);

		/****************** GetLabel ******************/
		%feature("compactdefaultargs") GetLabel;
		%feature("autodoc", "* Returns the label which was visualised by this presentation
	:rtype: TDF_Label") GetLabel;
		const TDF_Label & GetLabel ();

		/****************** SetLabel ******************/
		%feature("compactdefaultargs") SetLabel;
		%feature("autodoc", "* Assign the label to this presentation (but does not mark it outdated with SetToUpdate()).
	:param theLabel:
	:type theLabel: TDF_Label
	:rtype: None") SetLabel;
		void SetLabel (const TDF_Label & theLabel);

		/****************** SetMaterial ******************/
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "* Sets the material aspect. This method assigns the new default material without overriding XDE styles. Re-computation of existing presentation is not required after calling this method.
	:param theMaterial:
	:type theMaterial: Graphic3d_MaterialAspect
	:rtype: void") SetMaterial;
		virtual void SetMaterial (const Graphic3d_MaterialAspect & theMaterial);

		/****************** XCAFPrs_AISObject ******************/
		%feature("compactdefaultargs") XCAFPrs_AISObject;
		%feature("autodoc", "* Creates an object to visualise the shape label.
	:param theLabel:
	:type theLabel: TDF_Label
	:rtype: None") XCAFPrs_AISObject;
		 XCAFPrs_AISObject (const TDF_Label & theLabel);

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
		/****************** ChangeCurrent ******************/
		%feature("compactdefaultargs") ChangeCurrent;
		%feature("autodoc", "* Return current position.
	:rtype: XCAFPrs_DocumentNode") ChangeCurrent;
		XCAFPrs_DocumentNode & ChangeCurrent ();

		/****************** Current ******************/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "* Return current position.
	:rtype: XCAFPrs_DocumentNode") Current;
		const XCAFPrs_DocumentNode & Current ();

		/****************** Current ******************/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "* Return current position within specified assembly depth.
	:param theDepth:
	:type theDepth: int
	:rtype: XCAFPrs_DocumentNode") Current;
		const XCAFPrs_DocumentNode & Current (Standard_Integer theDepth);

		/****************** CurrentDepth ******************/
		%feature("compactdefaultargs") CurrentDepth;
		%feature("autodoc", "* Return depth of the current node in hierarchy, starting from 0. Zero means Root label.
	:rtype: int") CurrentDepth;
		Standard_Integer CurrentDepth ();

		/****************** DefineChildId ******************/
		%feature("compactdefaultargs") DefineChildId;
		%feature("autodoc", "* @name string identification tools Construct a unique string identifier for the given label. The identifier is a concatenation of label entries (TDF_Tool::Entry() with tailing '.') of hierarchy from parent to child joined via '/' and looking like this: @code 0:1:1:1./0:1:1:1:9./0:1:1:5:7. @endcode This generation scheme also allows finding originating labels using TDF_Tool::Label(). The tailing dot simplifies parent equality check. @param theLabel child label to define id @param theParentId parent string identifier defined by this method
	:param theLabel:
	:type theLabel: TDF_Label
	:param theParentId:
	:type theParentId: TCollection_AsciiString
	:rtype: TCollection_AsciiString") DefineChildId;
		static TCollection_AsciiString DefineChildId (const TDF_Label & theLabel,const TCollection_AsciiString & theParentId);

		/****************** FindLabelFromPathId ******************/
		%feature("compactdefaultargs") FindLabelFromPathId;
		%feature("autodoc", "* Find a shape entity based on a text identifier constructed from OCAF labels defining full path. @sa DefineChildId()
	:param theDocument:
	:type theDocument: TDocStd_Document
	:param theId:
	:type theId: TCollection_AsciiString
	:param theParentLocation:
	:type theParentLocation: TopLoc_Location
	:param theLocation:
	:type theLocation: TopLoc_Location
	:rtype: TDF_Label") FindLabelFromPathId;
		static TDF_Label FindLabelFromPathId (const opencascade::handle<TDocStd_Document> & theDocument,const TCollection_AsciiString & theId,TopLoc_Location & theParentLocation,TopLoc_Location & theLocation);

		/****************** FindLabelFromPathId ******************/
		%feature("compactdefaultargs") FindLabelFromPathId;
		%feature("autodoc", "* Find a shape entity based on a text identifier constructed from OCAF labels defining full path. @sa DefineChildId()
	:param theDocument:
	:type theDocument: TDocStd_Document
	:param theId:
	:type theId: TCollection_AsciiString
	:param theLocation:
	:type theLocation: TopLoc_Location
	:rtype: TDF_Label") FindLabelFromPathId;
		static TDF_Label FindLabelFromPathId (const opencascade::handle<TDocStd_Document> & theDocument,const TCollection_AsciiString & theId,TopLoc_Location & theLocation);

		/****************** FindShapeFromPathId ******************/
		%feature("compactdefaultargs") FindShapeFromPathId;
		%feature("autodoc", "* Find a shape entity based on a text identifier constructed from OCAF labels defining full path. @sa DefineChildId()
	:param theDocument:
	:type theDocument: TDocStd_Document
	:param theId:
	:type theId: TCollection_AsciiString
	:rtype: TopoDS_Shape") FindShapeFromPathId;
		static TopoDS_Shape FindShapeFromPathId (const opencascade::handle<TDocStd_Document> & theDocument,const TCollection_AsciiString & theId);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize the iterator from a single root shape in the document. @param theDocument document to explore @param theRoot single root label to explore within specified document @param theFlags iteration flags @param theDefStyle default style for nodes with undefined style
	:param theDocument:
	:type theDocument: TDocStd_Document
	:param theRoot:
	:type theRoot: TDF_Label
	:param theFlags:
	:type theFlags: int
	:param theDefStyle: default value is XCAFPrs_Style()
	:type theDefStyle: XCAFPrs_Style
	:rtype: None") Init;
		void Init (const opencascade::handle<TDocStd_Document> & theDocument,const TDF_Label & theRoot,int theFlags,const XCAFPrs_Style & theDefStyle = XCAFPrs_Style());

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize the iterator from the list of root shapes in the document. @param theDocument document to explore @param theRoots root labels to explore within specified document @param theFlags iteration flags @param theDefStyle default style for nodes with undefined style
	:param theDocument:
	:type theDocument: TDocStd_Document
	:param theRoots:
	:type theRoots: TDF_LabelSequence
	:param theFlags:
	:type theFlags: int
	:param theDefStyle: default value is XCAFPrs_Style()
	:type theDefStyle: XCAFPrs_Style
	:rtype: None") Init;
		void Init (const opencascade::handle<TDocStd_Document> & theDocument,const TDF_LabelSequence & theRoots,int theFlags,const XCAFPrs_Style & theDefStyle = XCAFPrs_Style());

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "* Return True if iterator points to the valid node.
	:rtype: bool") More;
		Standard_Boolean More ();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "* Go to the next node.
	:rtype: None") Next;
		void Next ();

		/****************** XCAFPrs_DocumentExplorer ******************/
		%feature("compactdefaultargs") XCAFPrs_DocumentExplorer;
		%feature("autodoc", "* Empty constructor.
	:rtype: None") XCAFPrs_DocumentExplorer;
		 XCAFPrs_DocumentExplorer ();

		/****************** XCAFPrs_DocumentExplorer ******************/
		%feature("compactdefaultargs") XCAFPrs_DocumentExplorer;
		%feature("autodoc", "* Constructor for exploring the whole document. @param theDocument document to explore @param theFlags iteration flags @param theDefStyle default style for nodes with undefined style
	:param theDocument:
	:type theDocument: TDocStd_Document
	:param theFlags:
	:type theFlags: int
	:param theDefStyle: default value is XCAFPrs_Style()
	:type theDefStyle: XCAFPrs_Style
	:rtype: None") XCAFPrs_DocumentExplorer;
		 XCAFPrs_DocumentExplorer (const opencascade::handle<TDocStd_Document> & theDocument,int theFlags,const XCAFPrs_Style & theDefStyle = XCAFPrs_Style());

		/****************** XCAFPrs_DocumentExplorer ******************/
		%feature("compactdefaultargs") XCAFPrs_DocumentExplorer;
		%feature("autodoc", "* Constructor for exploring specified list of root shapes in the document. @param theDocument document to explore @param theRoots root labels to explore within specified document @param theFlags iteration flags @param theDefStyle default style for nodes with undefined style
	:param theDocument:
	:type theDocument: TDocStd_Document
	:param theRoots:
	:type theRoots: TDF_LabelSequence
	:param theFlags:
	:type theFlags: int
	:param theDefStyle: default value is XCAFPrs_Style()
	:type theDefStyle: XCAFPrs_Style
	:rtype: None") XCAFPrs_DocumentExplorer;
		 XCAFPrs_DocumentExplorer (const opencascade::handle<TDocStd_Document> & theDocument,const TDF_LabelSequence & theRoots,int theFlags,const XCAFPrs_Style & theDefStyle = XCAFPrs_Style());

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
		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "* Return True if iterator points to a value.
	:rtype: bool") More;
		bool More ();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "* Find the next value.
	:rtype: None") Next;
		void Next ();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Return current value.
	:rtype: TCollection_AsciiString") Value;
		const TCollection_AsciiString & Value ();

		/****************** XCAFPrs_DocumentIdIterator ******************/
		%feature("compactdefaultargs") XCAFPrs_DocumentIdIterator;
		%feature("autodoc", "* Main constructor.
	:param thePath:
	:type thePath: TCollection_AsciiString
	:rtype: None") XCAFPrs_DocumentIdIterator;
		 XCAFPrs_DocumentIdIterator (const TCollection_AsciiString & thePath);

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
		%feature("compactdefaultargs") XCAFPrs_DocumentNode;
		%feature("autodoc", "* //!< flag indicating that this label is assembly
	:rtype: None") XCAFPrs_DocumentNode;
		 XCAFPrs_DocumentNode ();

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
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "* returns GUID of the driver
	:rtype: Standard_GUID") GetID;
		static const Standard_GUID & GetID ();

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", ":param L:
	:type L: TDF_Label
	:param ais:
	:type ais: AIS_InteractiveObject
	:rtype: bool") Update;
		virtual Standard_Boolean Update (const TDF_Label & L,opencascade::handle<AIS_InteractiveObject> & ais);

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

        %feature("autodoc", "1");
        %extend{
            std::string DumpJsonToString(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return s.str();}
        };
        		/****************** GetColorCurv ******************/
		%feature("compactdefaultargs") GetColorCurv;
		%feature("autodoc", "* Return curve color.
	:rtype: Quantity_Color") GetColorCurv;
		const Quantity_Color & GetColorCurv ();

		/****************** GetColorSurf ******************/
		%feature("compactdefaultargs") GetColorSurf;
		%feature("autodoc", "* Return surface color.
	:rtype: Quantity_Color") GetColorSurf;
		const Quantity_Color & GetColorSurf ();

		/****************** GetColorSurfRGBA ******************/
		%feature("compactdefaultargs") GetColorSurfRGBA;
		%feature("autodoc", "* Return surface color.
	:rtype: Quantity_ColorRGBA") GetColorSurfRGBA;
		const Quantity_ColorRGBA & GetColorSurfRGBA ();

		/****************** HashCode ******************/
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "* Computes a hash code for the given set of styling settings, in the range [1, theUpperBound] @param theStyle the set of styling settings which hash code is to be computed @param theUpperBound the upper bound of the range a computing hash code must be within returns a computed hash code, in the range [1, theUpperBound]
	:param theStyle:
	:type theStyle: XCAFPrs_Style
	:param theUpperBound:
	:type theUpperBound: int
	:rtype: int") HashCode;
		static Standard_Integer HashCode (const XCAFPrs_Style & theStyle,const Standard_Integer theUpperBound);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "* Returns True if styles are the same Methods for using Style as key in maps
	:param theOther:
	:type theOther: XCAFPrs_Style
	:rtype: bool") IsEqual;
		Standard_Boolean IsEqual (const XCAFPrs_Style & theOther);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "* Returns True when the two keys are the same.
	:param theS1:
	:type theS1: XCAFPrs_Style
	:param theS2:
	:type theS2: XCAFPrs_Style
	:rtype: bool") IsEqual;
		static Standard_Boolean IsEqual (const XCAFPrs_Style & theS1,const XCAFPrs_Style & theS2);

		/****************** IsSetColorCurv ******************/
		%feature("compactdefaultargs") IsSetColorCurv;
		%feature("autodoc", "* Return True if curve color has been defined.
	:rtype: bool") IsSetColorCurv;
		Standard_Boolean IsSetColorCurv ();

		/****************** IsSetColorSurf ******************/
		%feature("compactdefaultargs") IsSetColorSurf;
		%feature("autodoc", "* Return True if surface color has been defined.
	:rtype: bool") IsSetColorSurf;
		Standard_Boolean IsSetColorSurf ();

		/****************** IsVisible ******************/
		%feature("compactdefaultargs") IsVisible;
		%feature("autodoc", "* Manage visibility.
	:rtype: bool") IsVisible;
		Standard_Boolean IsVisible ();

		/****************** SetColorCurv ******************/
		%feature("compactdefaultargs") SetColorCurv;
		%feature("autodoc", "* Set curve color.
	:param col:
	:type col: Quantity_Color
	:rtype: None") SetColorCurv;
		void SetColorCurv (const Quantity_Color & col);

		/****************** SetColorSurf ******************/
		%feature("compactdefaultargs") SetColorSurf;
		%feature("autodoc", "* Set surface color.
	:param theColor:
	:type theColor: Quantity_Color
	:rtype: None") SetColorSurf;
		void SetColorSurf (const Quantity_Color & theColor);

		/****************** SetColorSurf ******************/
		%feature("compactdefaultargs") SetColorSurf;
		%feature("autodoc", "* Set surface color.
	:param theColor:
	:type theColor: Quantity_ColorRGBA
	:rtype: None") SetColorSurf;
		void SetColorSurf (const Quantity_ColorRGBA & theColor);

		/****************** SetVisibility ******************/
		%feature("compactdefaultargs") SetVisibility;
		%feature("autodoc", "* Assign visibility.
	:param theVisibility:
	:type theVisibility: bool
	:rtype: None") SetVisibility;
		void SetVisibility (const Standard_Boolean theVisibility);

		/****************** UnSetColorCurv ******************/
		%feature("compactdefaultargs") UnSetColorCurv;
		%feature("autodoc", "* Manage curve color setting
	:rtype: None") UnSetColorCurv;
		void UnSetColorCurv ();

		/****************** UnSetColorSurf ******************/
		%feature("compactdefaultargs") UnSetColorSurf;
		%feature("autodoc", "* Manage surface color setting
	:rtype: None") UnSetColorSurf;
		void UnSetColorSurf ();

		/****************** XCAFPrs_Style ******************/
		%feature("compactdefaultargs") XCAFPrs_Style;
		%feature("autodoc", "* Empty constructor - colors are unset, visibility is True.
	:rtype: None") XCAFPrs_Style;
		 XCAFPrs_Style ();


        %extend{
            bool __eq_wrapper__(const XCAFPrs_Style  other) {
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
