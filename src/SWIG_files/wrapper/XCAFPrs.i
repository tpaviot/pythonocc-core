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
"No docstring provided."
%enddef
%module (package="OCC.Core", docstring=XCAFPRSDOCSTRING) XCAFPrs

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


%include XCAFPrs_headers.i

/* templates */
%template(XCAFPrs_DataMapOfStyleShape) NCollection_DataMap <XCAFPrs_Style , TopoDS_Shape , XCAFPrs_Style>;
%template(XCAFPrs_DataMapOfStyleTransient) NCollection_DataMap <XCAFPrs_Style , Handle_Standard_Transient , XCAFPrs_Style>;
%template(XCAFPrs_DataMapOfShapeStyle) NCollection_DataMap <TopoDS_Shape , XCAFPrs_Style , TopTools_ShapeMapHasher>;
/* end templates declaration */


/* typedefs */
typedef NCollection_DataMap <XCAFPrs_Style , TopoDS_Shape , XCAFPrs_Style> XCAFPrs_DataMapOfStyleShape;
typedef NCollection_DataMap <XCAFPrs_Style , TopoDS_Shape , XCAFPrs_Style>::Iterator XCAFPrs_DataMapIteratorOfDataMapOfStyleShape;
typedef NCollection_DataMap <XCAFPrs_Style , Handle_Standard_Transient , XCAFPrs_Style> XCAFPrs_DataMapOfStyleTransient;
typedef NCollection_DataMap <XCAFPrs_Style , Handle_Standard_Transient , XCAFPrs_Style>::Iterator XCAFPrs_DataMapIteratorOfDataMapOfStyleTransient;
typedef NCollection_DataMap <TopoDS_Shape , XCAFPrs_Style , TopTools_ShapeMapHasher> XCAFPrs_DataMapOfShapeStyle;
typedef NCollection_DataMap <TopoDS_Shape , XCAFPrs_Style , TopTools_ShapeMapHasher>::Iterator XCAFPrs_DataMapIteratorOfDataMapOfShapeStyle;
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%wrap_handle(XCAFPrs_AISObject)
%wrap_handle(XCAFPrs_Driver)

%rename(xcafprs) XCAFPrs;
class XCAFPrs {
	public:
		%feature("compactdefaultargs") CollectStyleSettings;
		%feature("autodoc", "	* Collect styles defined for shape on label L and its components and subshapes and fills a map of shape - style correspondence The location <loc> is for internal use, it should be Null location for external call

	:param L:
	:type L: TDF_Label &
	:param loc:
	:type loc: TopLoc_Location &
	:param settings:
	:type settings: XCAFPrs_DataMapOfShapeStyle &
	:rtype: void
") CollectStyleSettings;
		static void CollectStyleSettings (const TDF_Label & L,const TopLoc_Location & loc,XCAFPrs_DataMapOfShapeStyle & settings);
		%feature("compactdefaultargs") GetViewNameMode;
		%feature("autodoc", "	:rtype: bool
") GetViewNameMode;
		static Standard_Boolean GetViewNameMode ();
		%feature("compactdefaultargs") SetViewNameMode;
		%feature("autodoc", "	* Set ViewNameMode for indicate display names or not.

	:param viewNameMode:
	:type viewNameMode: bool
	:rtype: void
") SetViewNameMode;
		static void SetViewNameMode (const Standard_Boolean viewNameMode);
};


%extend XCAFPrs {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XCAFPrs_AISObject;
class XCAFPrs_AISObject : public AIS_ColoredShape {
	public:
		%feature("compactdefaultargs") DispatchStyles;
		%feature("autodoc", "	* Fetch the Shape from associated Label and fill the map of sub-shapes styles. By default, this method is called implicitly within first ::Compute(). Application might call this method explicitly to manipulate styles afterwards. @param theToSyncStyles flag indicating if method ::Compute() should call this method again on first compute or re-compute

	:param theToSyncStyles: default value is Standard_False
	:type theToSyncStyles: bool
	:rtype: void
") DispatchStyles;
		virtual void DispatchStyles (const Standard_Boolean theToSyncStyles = Standard_False);
		%feature("compactdefaultargs") GetLabel;
		%feature("autodoc", "	* Returns the label which was visualised by this presentation

	:rtype: TDF_Label
") GetLabel;
		const TDF_Label & GetLabel ();
		%feature("compactdefaultargs") SetLabel;
		%feature("autodoc", "	* Assign the label to this presentation (but does not mark it outdated with SetToUpdate()).

	:param theLabel:
	:type theLabel: TDF_Label &
	:rtype: None
") SetLabel;
		void SetLabel (const TDF_Label & theLabel);
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "	* Sets the material aspect. This method assigns the new default material without overriding XDE styles. Re-computation of existing presentation is not required after calling this method.

	:param theMaterial:
	:type theMaterial: Graphic3d_MaterialAspect &
	:rtype: void
") SetMaterial;
		virtual void SetMaterial (const Graphic3d_MaterialAspect & theMaterial);
		%feature("compactdefaultargs") XCAFPrs_AISObject;
		%feature("autodoc", "	* Creates an object to visualise the shape label.

	:param theLabel:
	:type theLabel: TDF_Label &
	:rtype: None
") XCAFPrs_AISObject;
		 XCAFPrs_AISObject (const TDF_Label & theLabel);
};


%make_alias(XCAFPrs_AISObject)

%extend XCAFPrs_AISObject {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XCAFPrs_Driver;
class XCAFPrs_Driver : public TPrsStd_Driver {
	public:
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* returns GUID of the driver

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "	:param L:
	:type L: TDF_Label &
	:param ais:
	:type ais: Handle_AIS_InteractiveObject &
	:rtype: bool
") Update;
		virtual Standard_Boolean Update (const TDF_Label & L,Handle_AIS_InteractiveObject & ais);
};


%make_alias(XCAFPrs_Driver)

%extend XCAFPrs_Driver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XCAFPrs_Style;
class XCAFPrs_Style {
	public:
		%feature("compactdefaultargs") GetColorCurv;
		%feature("autodoc", "	* Return curve color.

	:rtype: Quantity_Color
") GetColorCurv;
		const Quantity_Color & GetColorCurv ();
		%feature("compactdefaultargs") GetColorSurf;
		%feature("autodoc", "	* Return surface color.

	:rtype: Quantity_Color
") GetColorSurf;
		const Quantity_Color & GetColorSurf ();
		%feature("compactdefaultargs") GetColorSurfRGBA;
		%feature("autodoc", "	* Return surface color.

	:rtype: Quantity_ColorRGBA
") GetColorSurfRGBA;
		const Quantity_ColorRGBA & GetColorSurfRGBA ();
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "	* Returns a HasCode value.

	:param theStyle:
	:type theStyle: XCAFPrs_Style &
	:param theUpper:
	:type theUpper: int
	:rtype: int
") HashCode;
		static Standard_Integer HashCode (const XCAFPrs_Style & theStyle,const Standard_Integer theUpper);
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	* Returns True if styles are the same Methods for using Style as key in maps

	:param theOther:
	:type theOther: XCAFPrs_Style &
	:rtype: bool
") IsEqual;
		Standard_Boolean IsEqual (const XCAFPrs_Style & theOther);
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	* Returns True when the two keys are the same.

	:param theS1:
	:type theS1: XCAFPrs_Style &
	:param theS2:
	:type theS2: XCAFPrs_Style &
	:rtype: bool
") IsEqual;
		static Standard_Boolean IsEqual (const XCAFPrs_Style & theS1,const XCAFPrs_Style & theS2);
		%feature("compactdefaultargs") IsSetColorCurv;
		%feature("autodoc", "	* Return True if curve color has been defined.

	:rtype: bool
") IsSetColorCurv;
		Standard_Boolean IsSetColorCurv ();
		%feature("compactdefaultargs") IsSetColorSurf;
		%feature("autodoc", "	* Return True if surface color has been defined.

	:rtype: bool
") IsSetColorSurf;
		Standard_Boolean IsSetColorSurf ();
		%feature("compactdefaultargs") IsVisible;
		%feature("autodoc", "	* Manage visibility.

	:rtype: bool
") IsVisible;
		Standard_Boolean IsVisible ();
		%feature("compactdefaultargs") SetColorCurv;
		%feature("autodoc", "	* Set curve color.

	:param col:
	:type col: Quantity_Color &
	:rtype: None
") SetColorCurv;
		void SetColorCurv (const Quantity_Color & col);
		%feature("compactdefaultargs") SetColorSurf;
		%feature("autodoc", "	* Set surface color.

	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: None
") SetColorSurf;
		void SetColorSurf (const Quantity_Color & theColor);
		%feature("compactdefaultargs") SetColorSurf;
		%feature("autodoc", "	* Set surface color.

	:param theColor:
	:type theColor: Quantity_ColorRGBA &
	:rtype: None
") SetColorSurf;
		void SetColorSurf (const Quantity_ColorRGBA & theColor);
		%feature("compactdefaultargs") SetVisibility;
		%feature("autodoc", "	* Assign visibility.

	:param theVisibility:
	:type theVisibility: bool
	:rtype: None
") SetVisibility;
		void SetVisibility (const Standard_Boolean theVisibility);
		%feature("compactdefaultargs") UnSetColorCurv;
		%feature("autodoc", "	* Manage curve color setting

	:rtype: None
") UnSetColorCurv;
		void UnSetColorCurv ();
		%feature("compactdefaultargs") UnSetColorSurf;
		%feature("autodoc", "	* Manage surface color setting

	:rtype: None
") UnSetColorSurf;
		void UnSetColorSurf ();
		%feature("compactdefaultargs") XCAFPrs_Style;
		%feature("autodoc", "	* Empty constructor - colors are unset, visibility is True.

	:rtype: None
") XCAFPrs_Style;
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
/* harray1 class */
/* harray2 class */
/* harray2 class */
