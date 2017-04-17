/*
Copyright 2008-2017 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") Aspect

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i


%include Aspect_headers.i


%pythoncode {
def register_handle(handle, base_object):
    """
    Inserts the handle into the base object to
    prevent memory corruption in certain cases
    """
    try:
        if base_object.IsKind("Standard_Transient"):
            base_object.thisHandle = handle
            base_object.thisown = False
    except:
        pass
};

/* typedefs */
typedef void * Aspect_Display;
typedef unsigned long Aspect_Drawable;
typedef CALL_DEF_LAYER Aspect_CLayer2d;
typedef int ( * Aspect_GraphicCallbackProc ) ( Aspect_Drawable theWindowID , void * theUserData , Aspect_GraphicCallbackStruct * theCallData );
typedef void * Aspect_RenderingContext;
typedef unsigned long Aspect_Handle;
typedef void * HANDLE;
/* end typedefs declaration */

/* public enums */
enum Aspect_FillMethod {
	Aspect_FM_NONE = 0,
	Aspect_FM_CENTERED = 1,
	Aspect_FM_TILED = 2,
	Aspect_FM_STRETCH = 3,
};

enum Aspect_GradientFillMethod {
	Aspect_GFM_NONE = 0,
	Aspect_GFM_HOR = 1,
	Aspect_GFM_VER = 2,
	Aspect_GFM_DIAG1 = 3,
	Aspect_GFM_DIAG2 = 4,
	Aspect_GFM_CORNER1 = 5,
	Aspect_GFM_CORNER2 = 6,
	Aspect_GFM_CORNER3 = 7,
	Aspect_GFM_CORNER4 = 8,
};

enum Aspect_GridDrawMode {
	Aspect_GDM_Lines = 0,
	Aspect_GDM_Points = 1,
	Aspect_GDM_None = 2,
};

enum Aspect_GridType {
	Aspect_GT_Rectangular = 0,
	Aspect_GT_Circular = 1,
};

enum Aspect_HatchStyle {
	Aspect_HS_HORIZONTAL = 0,
	Aspect_HS_HORIZONTAL_WIDE = 1,
	Aspect_HS_VERTICAL = 2,
	Aspect_HS_VERTICAL_WIDE = 3,
	Aspect_HS_DIAGONAL_45 = 4,
	Aspect_HS_DIAGONAL_45_WIDE = 5,
	Aspect_HS_DIAGONAL_135 = 6,
	Aspect_HS_DIAGONAL_135_WIDE = 7,
	Aspect_HS_GRID = 8,
	Aspect_HS_GRID_WIDE = 9,
	Aspect_HS_GRID_DIAGONAL = 10,
	Aspect_HS_GRID_DIAGONAL_WIDE = 11,
};

enum Aspect_InteriorStyle {
	Aspect_IS_EMPTY = 0,
	Aspect_IS_HOLLOW = 1,
	Aspect_IS_HATCH = 2,
	Aspect_IS_SOLID = 3,
	Aspect_IS_HIDDENLINE = 4,
	Aspect_IS_POINT = 5,
};

enum Aspect_PolygonOffsetMode {
	Aspect_POM_Off = 0,
	Aspect_POM_Fill = 1,
	Aspect_POM_Line = 2,
	Aspect_POM_Point = 4,
	Aspect_POM_All = Aspect_POM_Fill | Aspect_POM_Line | Aspect_POM_Point,
	Aspect_POM_None = 8,
	Aspect_POM_Mask = Aspect_POM_All | Aspect_POM_None,
};

enum Aspect_PrintAlgo {
	Aspect_PA_STRETCH = 0,
	Aspect_PA_TILE = 1,
};

enum Aspect_TypeOfColorScaleData {
	Aspect_TOCSD_AUTO = 0,
	Aspect_TOCSD_USER = 1,
};

enum Aspect_TypeOfColorScaleOrientation {
	Aspect_TOCSO_NONE = 0,
	Aspect_TOCSO_LEFT = 1,
	Aspect_TOCSO_RIGHT = 2,
	Aspect_TOCSO_CENTER = 3,
};

enum Aspect_TypeOfColorScalePosition {
	Aspect_TOCSP_NONE = 0,
	Aspect_TOCSP_LEFT = 1,
	Aspect_TOCSP_RIGHT = 2,
	Aspect_TOCSP_CENTER = 3,
};

enum Aspect_TypeOfConstraint {
	Aspect_TOC_BOTTOM_LEFT = 0,
	Aspect_TOC_BOTTOM_RIGHT = 1,
	Aspect_TOC_TOP_LEFT = 2,
	Aspect_TOC_TOP_RIGHT = 3,
};

enum Aspect_TypeOfDeflection {
	Aspect_TOD_RELATIVE = 0,
	Aspect_TOD_ABSOLUTE = 1,
};

enum Aspect_TypeOfDisplayText {
	Aspect_TODT_NORMAL = 0,
	Aspect_TODT_SUBTITLE = 1,
	Aspect_TODT_DEKALE = 2,
	Aspect_TODT_BLEND = 3,
	Aspect_TODT_DIMENSION = 4,
};

enum Aspect_TypeOfDrawMode {
	Aspect_TODM_REPLACE = 0,
	Aspect_TODM_ERASE = 1,
	Aspect_TODM_XOR = 2,
	Aspect_TODM_XORLIGHT = 3,
};

enum Aspect_TypeOfEdge {
	Aspect_TOE_VISIBLE = 0,
	Aspect_TOE_INVISIBLE = 1,
};

enum Aspect_TypeOfFacingModel {
	Aspect_TOFM_BOTH_SIDE = 0,
	Aspect_TOFM_BACK_SIDE = 1,
	Aspect_TOFM_FRONT_SIDE = 2,
};

enum Aspect_TypeOfHighlightMethod {
	Aspect_TOHM_COLOR = 0,
	Aspect_TOHM_BOUNDBOX = 1,
};

enum Aspect_TypeOfLayer {
	Aspect_TOL_OVERLAY = 0,
	Aspect_TOL_UNDERLAY = 1,
};

enum Aspect_TypeOfLine {
	Aspect_TOL_SOLID = 0,
	Aspect_TOL_DASH = 1,
	Aspect_TOL_DOT = 2,
	Aspect_TOL_DOTDASH = 3,
	Aspect_TOL_USERDEFINED = 4,
};

enum Aspect_TypeOfMarker {
	Aspect_TOM_POINT = 0,
	Aspect_TOM_PLUS = 1,
	Aspect_TOM_STAR = 2,
	Aspect_TOM_X = 3,
	Aspect_TOM_O = 4,
	Aspect_TOM_O_POINT = 5,
	Aspect_TOM_O_PLUS = 6,
	Aspect_TOM_O_STAR = 7,
	Aspect_TOM_O_X = 8,
	Aspect_TOM_RING1 = 9,
	Aspect_TOM_RING2 = 10,
	Aspect_TOM_RING3 = 11,
	Aspect_TOM_BALL = 12,
	Aspect_TOM_USERDEFINED = 13,
};

enum Aspect_TypeOfPrimitive {
	Aspect_TOP_UNKNOWN = 0,
	Aspect_TOP_POLYLINE = 1,
	Aspect_TOP_POLYGON = 2,
	Aspect_TOP_SEGMENTS = 3,
	Aspect_TOP_ARCS = 4,
	Aspect_TOP_POLYARCS = 5,
	Aspect_TOP_POINTS = 6,
	Aspect_TOP_MARKERS = 7,
};

enum Aspect_TypeOfResize {
	Aspect_TOR_UNKNOWN = 0,
	Aspect_TOR_NO_BORDER = 1,
	Aspect_TOR_TOP_BORDER = 2,
	Aspect_TOR_RIGHT_BORDER = 3,
	Aspect_TOR_BOTTOM_BORDER = 4,
	Aspect_TOR_LEFT_BORDER = 5,
	Aspect_TOR_TOP_AND_RIGHT_BORDER = 6,
	Aspect_TOR_RIGHT_AND_BOTTOM_BORDER = 7,
	Aspect_TOR_BOTTOM_AND_LEFT_BORDER = 8,
	Aspect_TOR_LEFT_AND_TOP_BORDER = 9,
};

enum Aspect_TypeOfStyleText {
	Aspect_TOST_NORMAL = 0,
	Aspect_TOST_ANNOTATION = 1,
};

enum Aspect_TypeOfTriedronEcho {
	Aspect_TOTE_NONE = 0,
	Aspect_TOTE_ORIGIN = 1,
	Aspect_TOTE_AXIS_X = 2,
	Aspect_TOTE_AXIS_Y = 3,
	Aspect_TOTE_AXIS_Z = 4,
	Aspect_TOTE_TEXT_X = 5,
	Aspect_TOTE_TEXT_Y = 6,
	Aspect_TOTE_TEXT_Z = 7,
	Aspect_TOTE_01 = 8,
	Aspect_TOTE_02 = 9,
	Aspect_TOTE_03 = 10,
	Aspect_TOTE_04 = 11,
	Aspect_TOTE_05 = 12,
	Aspect_TOTE_06 = 13,
	Aspect_TOTE_07 = 14,
	Aspect_TOTE_08 = 15,
	Aspect_TOTE_09 = 16,
	Aspect_TOTE_10 = 17,
};

enum Aspect_TypeOfTriedronPosition {
	Aspect_TOTP_CENTER = 0,
	Aspect_TOTP_LEFT_LOWER = 1,
	Aspect_TOTP_LEFT_UPPER = 2,
	Aspect_TOTP_RIGHT_LOWER = 3,
	Aspect_TOTP_RIGHT_UPPER = 4,
	Aspect_TOTP_01 = 5,
	Aspect_TOTP_02 = 6,
	Aspect_TOTP_03 = 7,
	Aspect_TOTP_04 = 8,
	Aspect_TOTP_05 = 9,
	Aspect_TOTP_06 = 10,
	Aspect_TOTP_07 = 11,
	Aspect_TOTP_08 = 12,
	Aspect_TOTP_09 = 13,
	Aspect_TOTP_10 = 14,
};

enum Aspect_TypeOfUpdate {
	Aspect_TOU_ASAP = 0,
	Aspect_TOU_WAIT = 1,
};

enum Aspect_WidthOfLine {
	Aspect_WOL_THIN = 0,
	Aspect_WOL_MEDIUM = 1,
	Aspect_WOL_THICK = 2,
	Aspect_WOL_VERYTHICK = 3,
	Aspect_WOL_USERDEFINED = 4,
};

enum Aspect_XAtom {
	Aspect_XA_DELETE_WINDOW = 0,
};

/* end public enums declaration */

%nodefaultctor Aspect_AspectFillArea;
class Aspect_AspectFillArea : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") SetEdgeColor;
		%feature("autodoc", "	* Modifies the colour of the edge of the face

	:param AColor:
	:type AColor: Quantity_Color &
	:rtype: None
") SetEdgeColor;
		void SetEdgeColor (const Quantity_Color & AColor);
		%feature("compactdefaultargs") SetEdgeLineType;
		%feature("autodoc", "	* Modifies the edge line type

	:param AType:
	:type AType: Aspect_TypeOfLine
	:rtype: None
") SetEdgeLineType;
		void SetEdgeLineType (const Aspect_TypeOfLine AType);
		%feature("compactdefaultargs") SetEdgeWidth;
		%feature("autodoc", "	* Modifies the edge thickness //! Category: Methods to modify the class definition //! Warning: Raises AspectFillAreaDefinitionError if the width is a negative value.

	:param AWidth:
	:type AWidth: float
	:rtype: None
") SetEdgeWidth;
		void SetEdgeWidth (const Standard_Real AWidth);
		%feature("compactdefaultargs") SetHatchStyle;
		%feature("autodoc", "	* Modifies the hatch type used when InteriorStyle is IS_HATCH

	:param AStyle:
	:type AStyle: Aspect_HatchStyle
	:rtype: None
") SetHatchStyle;
		void SetHatchStyle (const Aspect_HatchStyle AStyle);
		%feature("compactdefaultargs") SetInteriorColor;
		%feature("autodoc", "	* Modifies the colour of the interior of the face

	:param AColor:
	:type AColor: Quantity_Color &
	:rtype: None
") SetInteriorColor;
		void SetInteriorColor (const Quantity_Color & AColor);
		%feature("compactdefaultargs") SetBackInteriorColor;
		%feature("autodoc", "	* Modifies the colour of the interior of the back face

	:param color:
	:type color: Quantity_Color &
	:rtype: None
") SetBackInteriorColor;
		void SetBackInteriorColor (const Quantity_Color & color);
		%feature("compactdefaultargs") SetInteriorStyle;
		%feature("autodoc", "	* Modifies the interior type used for rendering //! InteriorStyle : IS_EMPTY	no interior IS_HOLLOW	display the boundaries of the surface IS_HATCH	display hatching IS_SOLID	display interior entirely filled

	:param AStyle:
	:type AStyle: Aspect_InteriorStyle
	:rtype: None
") SetInteriorStyle;
		void SetInteriorStyle (const Aspect_InteriorStyle AStyle);
		%feature("compactdefaultargs") HatchStyle;
		%feature("autodoc", "	* Returns the hatch type used when InteriorStyle is IS_HATCH

	:rtype: Aspect_HatchStyle
") HatchStyle;
		Aspect_HatchStyle HatchStyle ();
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	:param AStyle:
	:type AStyle: Aspect_InteriorStyle &
	:param AIntColor:
	:type AIntColor: Quantity_Color &
	:param AEdgeColor:
	:type AEdgeColor: Quantity_Color &
	:param AType:
	:type AType: Aspect_TypeOfLine &
	:param AWidth:
	:type AWidth: float &
	:rtype: None
") Values;
		void Values (Aspect_InteriorStyle & AStyle,Quantity_Color & AIntColor,Quantity_Color & AEdgeColor,Aspect_TypeOfLine & AType,Standard_Real &OutValue);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* Returns the current values of the <self> group.

	:param AStyle:
	:type AStyle: Aspect_InteriorStyle &
	:param AIntColor:
	:type AIntColor: Quantity_Color &
	:param BackIntColor:
	:type BackIntColor: Quantity_Color &
	:param AEdgeColor:
	:type AEdgeColor: Quantity_Color &
	:param AType:
	:type AType: Aspect_TypeOfLine &
	:param AWidth:
	:type AWidth: float &
	:rtype: None
") Values;
		void Values (Aspect_InteriorStyle & AStyle,Quantity_Color & AIntColor,Quantity_Color & BackIntColor,Quantity_Color & AEdgeColor,Aspect_TypeOfLine & AType,Standard_Real &OutValue);
};


%extend Aspect_AspectFillArea {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Aspect_AspectFillArea(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Aspect_AspectFillArea::Handle_Aspect_AspectFillArea %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Aspect_AspectFillArea;
class Handle_Aspect_AspectFillArea : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Aspect_AspectFillArea();
        Handle_Aspect_AspectFillArea(const Handle_Aspect_AspectFillArea &aHandle);
        Handle_Aspect_AspectFillArea(const Aspect_AspectFillArea *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Aspect_AspectFillArea DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_AspectFillArea {
    Aspect_AspectFillArea* _get_reference() {
    return (Aspect_AspectFillArea*)$self->Access();
    }
};

%extend Handle_Aspect_AspectFillArea {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Aspect_AspectFillArea {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Aspect_AspectLine;
class Aspect_AspectLine : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* Modifies the colour of <self>.

	:param AColor:
	:type AColor: Quantity_Color &
	:rtype: None
") SetColor;
		void SetColor (const Quantity_Color & AColor);
		%feature("compactdefaultargs") SetType;
		%feature("autodoc", "	* Modifies the type of <self>.

	:param AType:
	:type AType: Aspect_TypeOfLine
	:rtype: None
") SetType;
		void SetType (const Aspect_TypeOfLine AType);
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "	* Modifies the thickness of <self>. Category: Methods to modify the class definition Warning: Raises AspectLineDefinitionError if the width is a negative value.

	:param AWidth:
	:type AWidth: float
	:rtype: None
") SetWidth;
		void SetWidth (const Standard_Real AWidth);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* Returns the current values of the group <self>.

	:param AColor:
	:type AColor: Quantity_Color &
	:param AType:
	:type AType: Aspect_TypeOfLine &
	:param AWidth:
	:type AWidth: float &
	:rtype: None
") Values;
		void Values (Quantity_Color & AColor,Aspect_TypeOfLine & AType,Standard_Real &OutValue);
};


%extend Aspect_AspectLine {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Aspect_AspectLine(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Aspect_AspectLine::Handle_Aspect_AspectLine %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Aspect_AspectLine;
class Handle_Aspect_AspectLine : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Aspect_AspectLine();
        Handle_Aspect_AspectLine(const Handle_Aspect_AspectLine &aHandle);
        Handle_Aspect_AspectLine(const Aspect_AspectLine *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Aspect_AspectLine DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_AspectLine {
    Aspect_AspectLine* _get_reference() {
    return (Aspect_AspectLine*)$self->Access();
    }
};

%extend Handle_Aspect_AspectLine {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Aspect_AspectLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Aspect_AspectMarker;
class Aspect_AspectMarker : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* Modifies the colour of <self>.

	:param AColor:
	:type AColor: Quantity_Color &
	:rtype: None
") SetColor;
		void SetColor (const Quantity_Color & AColor);
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "	* Modifies the scale factor of <self>. Marker type Aspect_TOM_POINT is not affected by the marker size scale factor. It is always the smallest displayable dot. Warning: Raises AspectMarkerDefinitionError if the scale is a negative value.

	:param AScale:
	:type AScale: float
	:rtype: None
") SetScale;
		void SetScale (const Standard_Real AScale);
		%feature("compactdefaultargs") SetType;
		%feature("autodoc", "	* Modifies the type of marker <self>.

	:param AType:
	:type AType: Aspect_TypeOfMarker
	:rtype: None
") SetType;
		void SetType (const Aspect_TypeOfMarker AType);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* Returns the current values of the group <self>.

	:param AColor:
	:type AColor: Quantity_Color &
	:param AType:
	:type AType: Aspect_TypeOfMarker &
	:param AScale:
	:type AScale: float &
	:rtype: None
") Values;
		void Values (Quantity_Color & AColor,Aspect_TypeOfMarker & AType,Standard_Real &OutValue);
};


%extend Aspect_AspectMarker {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Aspect_AspectMarker(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Aspect_AspectMarker::Handle_Aspect_AspectMarker %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Aspect_AspectMarker;
class Handle_Aspect_AspectMarker : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Aspect_AspectMarker();
        Handle_Aspect_AspectMarker(const Handle_Aspect_AspectMarker &aHandle);
        Handle_Aspect_AspectMarker(const Aspect_AspectMarker *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Aspect_AspectMarker DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_AspectMarker {
    Aspect_AspectMarker* _get_reference() {
    return (Aspect_AspectMarker*)$self->Access();
    }
};

%extend Handle_Aspect_AspectMarker {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Aspect_AspectMarker {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Aspect_Background;
class Aspect_Background {
	public:
		%feature("compactdefaultargs") Aspect_Background;
		%feature("autodoc", "	* Creates a window background. Default color : NOC_MATRAGRAY.

	:rtype: None
") Aspect_Background;
		 Aspect_Background ();
		%feature("compactdefaultargs") Aspect_Background;
		%feature("autodoc", "	* Creates a window background with the colour <AColor>.

	:param AColor:
	:type AColor: Quantity_Color &
	:rtype: None
") Aspect_Background;
		 Aspect_Background (const Quantity_Color & AColor);
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* Modifies the colour of the window background <self>.

	:param AColor:
	:type AColor: Quantity_Color &
	:rtype: None
") SetColor;
		void SetColor (const Quantity_Color & AColor);
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "	* Returns the colour of the window background <self>.

	:rtype: Quantity_Color
") Color;
		Quantity_Color Color ();
};


%extend Aspect_Background {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Aspect_ColorScale;
class Aspect_ColorScale : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") FindColor;
		%feature("autodoc", "	* Calculate color according passed value; returns true if value is in range or false, if isn't

	:param theValue:
	:type theValue: float
	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: bool
") FindColor;
		Standard_Boolean FindColor (const Standard_Real theValue,Quantity_Color & theColor);
		%feature("compactdefaultargs") FindColor;
		%feature("autodoc", "	:param theValue:
	:type theValue: float
	:param theMin:
	:type theMin: float
	:param theMax:
	:type theMax: float
	:param theColorsCount:
	:type theColorsCount: int
	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: bool
") FindColor;
		static Standard_Boolean FindColor (const Standard_Real theValue,const Standard_Real theMin,const Standard_Real theMax,const Standard_Integer theColorsCount,Quantity_Color & theColor);
		%feature("compactdefaultargs") GetMin;
		%feature("autodoc", "	* Returns minimal value of color scale;

	:rtype: float
") GetMin;
		Standard_Real GetMin ();
		%feature("compactdefaultargs") GetMax;
		%feature("autodoc", "	* Returns maximal value of color scale;

	:rtype: float
") GetMax;
		Standard_Real GetMax ();
		%feature("compactdefaultargs") GetRange;
		%feature("autodoc", "	* Returns minimal and maximal values of color scale;

	:param theMin:
	:type theMin: float &
	:param theMax:
	:type theMax: float &
	:rtype: None
") GetRange;
		void GetRange (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") GetLabelType;
		%feature("autodoc", "	* Returns the type of labels; Aspect_TOCSD_AUTO - labels as boundary values for intervals Aspect_TOCSD_USER - user specified label is used

	:rtype: Aspect_TypeOfColorScaleData
") GetLabelType;
		Aspect_TypeOfColorScaleData GetLabelType ();
		%feature("compactdefaultargs") GetColorType;
		%feature("autodoc", "	* Returns the type of colors; Aspect_TOCSD_AUTO - value between Red and Blue Aspect_TOCSD_USER - user specified color from color map

	:rtype: Aspect_TypeOfColorScaleData
") GetColorType;
		Aspect_TypeOfColorScaleData GetColorType ();
		%feature("compactdefaultargs") GetNumberOfIntervals;
		%feature("autodoc", "	* Returns the number of color scale intervals;

	:rtype: int
") GetNumberOfIntervals;
		Standard_Integer GetNumberOfIntervals ();
		%feature("compactdefaultargs") GetTitle;
		%feature("autodoc", "	* Returns the color scale title string;

	:rtype: TCollection_ExtendedString
") GetTitle;
		TCollection_ExtendedString GetTitle ();
		%feature("compactdefaultargs") GetFormat;
		%feature("autodoc", "	* Returns the format for numbers. The same like format for function printf(). Used if GetLabelType() is TOCSD_AUTO;

	:rtype: TCollection_AsciiString
") GetFormat;
		TCollection_AsciiString GetFormat ();
		%feature("compactdefaultargs") GetLabel;
		%feature("autodoc", "	* Returns the user specified label with index <anIndex>. Returns empty string if label not defined.

	:param theIndex:
	:type theIndex: int
	:rtype: TCollection_ExtendedString
") GetLabel;
		TCollection_ExtendedString GetLabel (const Standard_Integer theIndex);
		%feature("compactdefaultargs") GetColor;
		%feature("autodoc", "	* Returns the user specified color from color map with index <anIndex>. Returns default color if index out of range in color map.

	:param theIndex:
	:type theIndex: int
	:rtype: Quantity_Color
") GetColor;
		Quantity_Color GetColor (const Standard_Integer theIndex);
		%feature("compactdefaultargs") GetLabels;
		%feature("autodoc", "	* Returns the user specified labels.

	:param theLabels:
	:type theLabels: TColStd_SequenceOfExtendedString &
	:rtype: None
") GetLabels;
		void GetLabels (TColStd_SequenceOfExtendedString & theLabels);
		%feature("compactdefaultargs") GetColors;
		%feature("autodoc", "	* Returns the user specified colors.

	:param theColors:
	:type theColors: Aspect_SequenceOfColor &
	:rtype: None
") GetColors;
		void GetColors (Aspect_SequenceOfColor & theColors);
		%feature("compactdefaultargs") GetLabelPosition;
		%feature("autodoc", "	* Returns the position of labels concerning color filled rectangles.

	:rtype: Aspect_TypeOfColorScalePosition
") GetLabelPosition;
		Aspect_TypeOfColorScalePosition GetLabelPosition ();
		%feature("compactdefaultargs") GetTitlePosition;
		%feature("autodoc", "	* Returns the position of color scale title.

	:rtype: Aspect_TypeOfColorScalePosition
") GetTitlePosition;
		Aspect_TypeOfColorScalePosition GetTitlePosition ();
		%feature("compactdefaultargs") IsReversed;
		%feature("autodoc", "	* Returns true if the labels and colors used in reversed order.

	:rtype: bool
") IsReversed;
		Standard_Boolean IsReversed ();
		%feature("compactdefaultargs") IsLabelAtBorder;
		%feature("autodoc", "	* Returns true if the labels placed at border of color filled rectangles.

	:rtype: bool
") IsLabelAtBorder;
		Standard_Boolean IsLabelAtBorder ();
		%feature("compactdefaultargs") SetMin;
		%feature("autodoc", "	* Sets the minimal value of color scale.

	:param theMin:
	:type theMin: float
	:rtype: None
") SetMin;
		void SetMin (const Standard_Real theMin);
		%feature("compactdefaultargs") SetMax;
		%feature("autodoc", "	* Sets the maximal value of color scale.

	:param theMax:
	:type theMax: float
	:rtype: None
") SetMax;
		void SetMax (const Standard_Real theMax);
		%feature("compactdefaultargs") SetRange;
		%feature("autodoc", "	* Sets the minimal and maximal value of color scale.

	:param theMin:
	:type theMin: float
	:param theMax:
	:type theMax: float
	:rtype: None
") SetRange;
		void SetRange (const Standard_Real theMin,const Standard_Real theMax);
		%feature("compactdefaultargs") SetLabelType;
		%feature("autodoc", "	* Sets the type of labels. Aspect_TOCSD_AUTO - labels as boundary values for intervals Aspect_TOCSD_USER - user specified label is used

	:param theType:
	:type theType: Aspect_TypeOfColorScaleData
	:rtype: None
") SetLabelType;
		void SetLabelType (const Aspect_TypeOfColorScaleData theType);
		%feature("compactdefaultargs") SetColorType;
		%feature("autodoc", "	* Sets the type of colors. Aspect_TOCSD_AUTO - value between Red and Blue Aspect_TOCSD_USER - user specified color from color map

	:param theType:
	:type theType: Aspect_TypeOfColorScaleData
	:rtype: None
") SetColorType;
		void SetColorType (const Aspect_TypeOfColorScaleData theType);
		%feature("compactdefaultargs") SetNumberOfIntervals;
		%feature("autodoc", "	* Sets the number of color scale intervals.

	:param theNum:
	:type theNum: int
	:rtype: None
") SetNumberOfIntervals;
		void SetNumberOfIntervals (const Standard_Integer theNum);
		%feature("compactdefaultargs") SetTitle;
		%feature("autodoc", "	* Sets the color scale title string.

	:param theTitle:
	:type theTitle: TCollection_ExtendedString &
	:rtype: None
") SetTitle;
		void SetTitle (const TCollection_ExtendedString & theTitle);
		%feature("compactdefaultargs") SetFormat;
		%feature("autodoc", "	* Sets the color scale auto label format specification.

	:param theFormat:
	:type theFormat: TCollection_AsciiString &
	:rtype: None
") SetFormat;
		void SetFormat (const TCollection_AsciiString & theFormat);
		%feature("compactdefaultargs") SetLabel;
		%feature("autodoc", "	* Sets the color scale label at index. Index started from 1.

	:param theLabel:
	:type theLabel: TCollection_ExtendedString &
	:param anIndex: default value is -1
	:type anIndex: int
	:rtype: None
") SetLabel;
		void SetLabel (const TCollection_ExtendedString & theLabel,const Standard_Integer anIndex = -1);
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* Sets the color scale color at index. Index started from 1.

	:param theColor:
	:type theColor: Quantity_Color &
	:param theIndex: default value is -1
	:type theIndex: int
	:rtype: None
") SetColor;
		void SetColor (const Quantity_Color & theColor,const Standard_Integer theIndex = -1);
		%feature("compactdefaultargs") SetLabels;
		%feature("autodoc", "	* Sets the color scale labels.

	:param theSeq:
	:type theSeq: TColStd_SequenceOfExtendedString &
	:rtype: None
") SetLabels;
		void SetLabels (const TColStd_SequenceOfExtendedString & theSeq);
		%feature("compactdefaultargs") SetColors;
		%feature("autodoc", "	* Sets the color scale colors.

	:param theSeq:
	:type theSeq: Aspect_SequenceOfColor &
	:rtype: None
") SetColors;
		void SetColors (const Aspect_SequenceOfColor & theSeq);
		%feature("compactdefaultargs") SetLabelPosition;
		%feature("autodoc", "	* Sets the color scale labels position concerning color filled rectangles.

	:param thePos:
	:type thePos: Aspect_TypeOfColorScalePosition
	:rtype: None
") SetLabelPosition;
		void SetLabelPosition (const Aspect_TypeOfColorScalePosition thePos);
		%feature("compactdefaultargs") SetTitlePosition;
		%feature("autodoc", "	* Sets the color scale title position.

	:param thePos:
	:type thePos: Aspect_TypeOfColorScalePosition
	:rtype: None
") SetTitlePosition;
		void SetTitlePosition (const Aspect_TypeOfColorScalePosition thePos);
		%feature("compactdefaultargs") SetReversed;
		%feature("autodoc", "	* Sets true if the labels and colors used in reversed order.

	:param theReverse:
	:type theReverse: bool
	:rtype: None
") SetReversed;
		void SetReversed (const Standard_Boolean theReverse);
		%feature("compactdefaultargs") SetLabelAtBorder;
		%feature("autodoc", "	* Sets true if the labels placed at border of color filled rectangles.

	:param theOn:
	:type theOn: bool
	:rtype: None
") SetLabelAtBorder;
		void SetLabelAtBorder (const Standard_Boolean theOn);
		%feature("compactdefaultargs") GetSize;
		%feature("autodoc", "	* Returns the size of color scale.

	:param theWidth:
	:type theWidth: float &
	:param theHeight:
	:type theHeight: float &
	:rtype: None
") GetSize;
		void GetSize (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") GetWidth;
		%feature("autodoc", "	* Returns the width of color scale.

	:rtype: float
") GetWidth;
		Standard_Real GetWidth ();
		%feature("compactdefaultargs") GetHeight;
		%feature("autodoc", "	* Returns the height of color scale.

	:rtype: float
") GetHeight;
		Standard_Real GetHeight ();
		%feature("compactdefaultargs") SetSize;
		%feature("autodoc", "	* Sets the size of color scale.

	:param theWidth:
	:type theWidth: float
	:param theHeight:
	:type theHeight: float
	:rtype: None
") SetSize;
		void SetSize (const Standard_Real theWidth,const Standard_Real theHeight);
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "	* Sets the width of color scale.

	:param theWidth:
	:type theWidth: float
	:rtype: None
") SetWidth;
		void SetWidth (const Standard_Real theWidth);
		%feature("compactdefaultargs") SetHeight;
		%feature("autodoc", "	* Sets the height of color scale.

	:param theHeight:
	:type theHeight: float
	:rtype: None
") SetHeight;
		void SetHeight (const Standard_Real theHeight);
		%feature("compactdefaultargs") GetPosition;
		%feature("autodoc", "	* Returns the position of color scale.

	:param theX:
	:type theX: float &
	:param theY:
	:type theY: float &
	:rtype: None
") GetPosition;
		void GetPosition (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") GetXPosition;
		%feature("autodoc", "	* Returns the X position of color scale.

	:rtype: float
") GetXPosition;
		Standard_Real GetXPosition ();
		%feature("compactdefaultargs") GetYPosition;
		%feature("autodoc", "	* Returns the height of color scale.

	:rtype: float
") GetYPosition;
		Standard_Real GetYPosition ();
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "	* Sets the position of color scale.

	:param theX:
	:type theX: float
	:param theY:
	:type theY: float
	:rtype: None
") SetPosition;
		void SetPosition (const Standard_Real theX,const Standard_Real theY);
		%feature("compactdefaultargs") SetXPosition;
		%feature("autodoc", "	* Sets the X position of color scale.

	:param theX:
	:type theX: float
	:rtype: None
") SetXPosition;
		void SetXPosition (const Standard_Real theX);
		%feature("compactdefaultargs") SetYPosition;
		%feature("autodoc", "	* Sets the Y position of color scale.

	:param theY:
	:type theY: float
	:rtype: None
") SetYPosition;
		void SetYPosition (const Standard_Real theY);
		%feature("compactdefaultargs") GetTextHeight;
		%feature("autodoc", "	* Returns the height of text of color scale.

	:rtype: int
") GetTextHeight;
		Standard_Integer GetTextHeight ();
		%feature("compactdefaultargs") SetTextHeight;
		%feature("autodoc", "	* Sets the height of text of color scale.

	:param theHeight:
	:type theHeight: int
	:rtype: None
") SetTextHeight;
		void SetTextHeight (const Standard_Integer theHeight);
		%feature("compactdefaultargs") PaintRect;
		%feature("autodoc", "	* Draws a rectangle. @param theX [in] the X coordinate of rectangle position. @param theY [in] the Y coordinate of rectangle position. @param theWidth [in] the width of rectangle. @param theHeight [in] the height of rectangle. @param theColor [in] the color of rectangle. @param theFilled [in] defines if rectangle must be filled.

	:param theX:
	:type theX: int
	:param theY:
	:type theY: int
	:param theWidth:
	:type theWidth: int
	:param theHeight:
	:type theHeight: int
	:param theColor:
	:type theColor: Quantity_Color &
	:param theFilled: default value is Standard_False
	:type theFilled: bool
	:rtype: void
") PaintRect;
		virtual void PaintRect (const Standard_Integer theX,const Standard_Integer theY,const Standard_Integer theWidth,const Standard_Integer theHeight,const Quantity_Color & theColor,const Standard_Boolean theFilled = Standard_False);
		%feature("compactdefaultargs") PaintText;
		%feature("autodoc", "	* Draws a text. @param theText [in] the text to draw. @param theX [in] the X coordinate of text position. @param theY [in] the Y coordinate of text position. @param theColor [in] the color of text.

	:param theText:
	:type theText: TCollection_ExtendedString &
	:param theX:
	:type theX: int
	:param theY:
	:type theY: int
	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: void
") PaintText;
		virtual void PaintText (const TCollection_ExtendedString & theText,const Standard_Integer theX,const Standard_Integer theY,const Quantity_Color & theColor);
		%feature("compactdefaultargs") TextWidth;
		%feature("autodoc", "	* Returns the width of text. @param theText [in] the text of which to calculate width.

	:param theText:
	:type theText: TCollection_ExtendedString &
	:rtype: int
") TextWidth;
		virtual Standard_Integer TextWidth (const TCollection_ExtendedString & theText);
		%feature("compactdefaultargs") TextHeight;
		%feature("autodoc", "	* Returns the height of text. @param theText [in] the text of which to calculate height.

	:param theText:
	:type theText: TCollection_ExtendedString &
	:rtype: int
") TextHeight;
		virtual Standard_Integer TextHeight (const TCollection_ExtendedString & theText);
};


%extend Aspect_ColorScale {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Aspect_ColorScale(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Aspect_ColorScale::Handle_Aspect_ColorScale %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Aspect_ColorScale;
class Handle_Aspect_ColorScale : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Aspect_ColorScale();
        Handle_Aspect_ColorScale(const Handle_Aspect_ColorScale &aHandle);
        Handle_Aspect_ColorScale(const Aspect_ColorScale *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Aspect_ColorScale DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_ColorScale {
    Aspect_ColorScale* _get_reference() {
    return (Aspect_ColorScale*)$self->Access();
    }
};

%extend Handle_Aspect_ColorScale {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Aspect_ColorScale {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Aspect_GenId;
class Aspect_GenId {
	public:
		%feature("compactdefaultargs") Aspect_GenId;
		%feature("autodoc", "	* Creates an available set of identifiers with the lower bound 0 and the upper bound INT_MAX / 2.

	:rtype: None
") Aspect_GenId;
		 Aspect_GenId ();
		%feature("compactdefaultargs") Aspect_GenId;
		%feature("autodoc", "	* Creates an available set of identifiers with specified range. Raises IdentDefinitionError if theUpper is less than theLow.

	:param theLow:
	:type theLow: int
	:param theUpper:
	:type theUpper: int
	:rtype: None
") Aspect_GenId;
		 Aspect_GenId (const Standard_Integer theLow,const Standard_Integer theUpper);
		%feature("compactdefaultargs") Free;
		%feature("autodoc", "	* Free all identifiers - make the whole range available again.

	:rtype: None
") Free;
		void Free ();
		%feature("compactdefaultargs") Free;
		%feature("autodoc", "	* Free specified identifier. Warning - method has no protection against double-freeing!

	:param theId:
	:type theId: int
	:rtype: None
") Free;
		void Free (const Standard_Integer theId);
		%feature("compactdefaultargs") HasFree;
		%feature("autodoc", "	* Returns true if there are available identifiers in range.

	:rtype: bool
") HasFree;
		Standard_Boolean HasFree ();
		%feature("compactdefaultargs") Available;
		%feature("autodoc", "	* Returns the number of available identifiers.

	:rtype: int
") Available;
		Standard_Integer Available ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	* Returns the lower identifier in range.

	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	* Returns the next available identifier. Warning: Raises IdentDefinitionError if all identifiers are busy.

	:rtype: int
") Next;
		Standard_Integer Next ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	* Returns the upper identifier in range.

	:rtype: int
") Upper;
		Standard_Integer Upper ();
};


%extend Aspect_GenId {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Aspect_GraphicCallbackStruct;
class Aspect_GraphicCallbackStruct {
	public:
		int reason;
		int wsID;
		int viewID;
		bool IsCoreProfile;
		Handle_Standard_Transient glContext;
};


%extend Aspect_GraphicCallbackStruct {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Aspect_Grid;
class Aspect_Grid : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") SetXOrigin;
		%feature("autodoc", "	* defines the x Origin of the grid.

	:param anOrigin:
	:type anOrigin: Quantity_Length
	:rtype: None
") SetXOrigin;
		void SetXOrigin (const Quantity_Length anOrigin);
		%feature("compactdefaultargs") SetYOrigin;
		%feature("autodoc", "	* defines the y Origin of the grid.

	:param anOrigin:
	:type anOrigin: Quantity_Length
	:rtype: None
") SetYOrigin;
		void SetYOrigin (const Quantity_Length anOrigin);
		%feature("compactdefaultargs") SetRotationAngle;
		%feature("autodoc", "	* defines the orientation of the the grid.

	:param anAngle:
	:type anAngle: Quantity_PlaneAngle
	:rtype: None
") SetRotationAngle;
		void SetRotationAngle (const Quantity_PlaneAngle anAngle);
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "	* Rotate the grid from a relative angle.

	:param anAngle:
	:type anAngle: Quantity_PlaneAngle
	:rtype: None
") Rotate;
		void Rotate (const Quantity_PlaneAngle anAngle);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	* Translate the grid from a relative distance.

	:param aDx:
	:type aDx: Quantity_Length
	:param aDy:
	:type aDy: Quantity_Length
	:rtype: None
") Translate;
		void Translate (const Quantity_Length aDx,const Quantity_Length aDy);
		%feature("compactdefaultargs") SetColors;
		%feature("autodoc", "	* Change the colors of the grid

	:param aColor:
	:type aColor: Quantity_Color &
	:param aTenthColor:
	:type aTenthColor: Quantity_Color &
	:rtype: void
") SetColors;
		virtual void SetColors (const Quantity_Color & aColor,const Quantity_Color & aTenthColor);
		%feature("compactdefaultargs") Hit;
		%feature("autodoc", "	* returns the point of the grid the closest to the point X,Y if the grid is active. If the grid is not active returns X,Y.

	:param X:
	:type X: Quantity_Length
	:param Y:
	:type Y: Quantity_Length
	:param gridX:
	:type gridX: Quantity_Length &
	:param gridY:
	:type gridY: Quantity_Length &
	:rtype: None
") Hit;
		void Hit (const Quantity_Length X,const Quantity_Length Y,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* returns the point of the grid the closest to the point X,Y

	:param X:
	:type X: Quantity_Length
	:param Y:
	:type Y: Quantity_Length
	:param gridX:
	:type gridX: Quantity_Length &
	:param gridY:
	:type gridY: Quantity_Length &
	:rtype: void
") Compute;
		virtual void Compute (const Quantity_Length X,const Quantity_Length Y,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Activate;
		%feature("autodoc", "	* activates the grid. The Hit method will return gridx and gridx computed according to the steps of the grid.

	:rtype: None
") Activate;
		void Activate ();
		%feature("compactdefaultargs") Deactivate;
		%feature("autodoc", "	* deactivates the grid. The hit method will return gridx and gridx as the enter value X & Y.

	:rtype: None
") Deactivate;
		void Deactivate ();
		%feature("compactdefaultargs") XOrigin;
		%feature("autodoc", "	* returns the x Origin of the grid.

	:rtype: Quantity_Length
") XOrigin;
		Quantity_Length XOrigin ();
		%feature("compactdefaultargs") YOrigin;
		%feature("autodoc", "	* returns the x Origin of the grid.

	:rtype: Quantity_Length
") YOrigin;
		Quantity_Length YOrigin ();
		%feature("compactdefaultargs") RotationAngle;
		%feature("autodoc", "	* returns the x Angle of the grid.

	:rtype: Quantity_PlaneAngle
") RotationAngle;
		Quantity_PlaneAngle RotationAngle ();
		%feature("compactdefaultargs") IsActive;
		%feature("autodoc", "	* Returns True when the grid is active.

	:rtype: bool
") IsActive;
		Standard_Boolean IsActive ();
		%feature("compactdefaultargs") Colors;
		%feature("autodoc", "	* Returns the colors of the grid.

	:param aColor:
	:type aColor: Quantity_Color &
	:param aTenthColor:
	:type aTenthColor: Quantity_Color &
	:rtype: None
") Colors;
		void Colors (Quantity_Color & aColor,Quantity_Color & aTenthColor);
		%feature("compactdefaultargs") SetDrawMode;
		%feature("autodoc", "	* Change the grid aspect.

	:param aDrawMode:
	:type aDrawMode: Aspect_GridDrawMode
	:rtype: None
") SetDrawMode;
		void SetDrawMode (const Aspect_GridDrawMode aDrawMode);
		%feature("compactdefaultargs") DrawMode;
		%feature("autodoc", "	* Returns the grid aspect.

	:rtype: Aspect_GridDrawMode
") DrawMode;
		Aspect_GridDrawMode DrawMode ();
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "	* Display the grid at screen.

	:rtype: void
") Display;
		virtual void Display ();
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "	* Erase the grid from screen.

	:rtype: void
") Erase;
		virtual void Erase ();
		%feature("compactdefaultargs") IsDisplayed;
		%feature("autodoc", "	* Returns True when the grid is displayed at screen.

	:rtype: bool
") IsDisplayed;
		virtual Standard_Boolean IsDisplayed ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:rtype: void
") Init;
		virtual void Init ();
};


%extend Aspect_Grid {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Aspect_Grid(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Aspect_Grid::Handle_Aspect_Grid %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Aspect_Grid;
class Handle_Aspect_Grid : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Aspect_Grid();
        Handle_Aspect_Grid(const Handle_Aspect_Grid &aHandle);
        Handle_Aspect_Grid(const Aspect_Grid *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Aspect_Grid DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_Grid {
    Aspect_Grid* _get_reference() {
    return (Aspect_Grid*)$self->Access();
    }
};

%extend Handle_Aspect_Grid {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Aspect_Grid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Aspect_SequenceNodeOfSequenceOfColor;
class Aspect_SequenceNodeOfSequenceOfColor : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") Aspect_SequenceNodeOfSequenceOfColor;
		%feature("autodoc", "	:param I:
	:type I: Quantity_Color &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Aspect_SequenceNodeOfSequenceOfColor;
		 Aspect_SequenceNodeOfSequenceOfColor (const Quantity_Color & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Quantity_Color
") Value;
		Quantity_Color & Value ();
};


%extend Aspect_SequenceNodeOfSequenceOfColor {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Aspect_SequenceNodeOfSequenceOfColor(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Aspect_SequenceNodeOfSequenceOfColor::Handle_Aspect_SequenceNodeOfSequenceOfColor %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Aspect_SequenceNodeOfSequenceOfColor;
class Handle_Aspect_SequenceNodeOfSequenceOfColor : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Aspect_SequenceNodeOfSequenceOfColor();
        Handle_Aspect_SequenceNodeOfSequenceOfColor(const Handle_Aspect_SequenceNodeOfSequenceOfColor &aHandle);
        Handle_Aspect_SequenceNodeOfSequenceOfColor(const Aspect_SequenceNodeOfSequenceOfColor *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Aspect_SequenceNodeOfSequenceOfColor DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_SequenceNodeOfSequenceOfColor {
    Aspect_SequenceNodeOfSequenceOfColor* _get_reference() {
    return (Aspect_SequenceNodeOfSequenceOfColor*)$self->Access();
    }
};

%extend Handle_Aspect_SequenceNodeOfSequenceOfColor {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Aspect_SequenceNodeOfSequenceOfColor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Aspect_SequenceOfColor;
class Aspect_SequenceOfColor : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") Aspect_SequenceOfColor;
		%feature("autodoc", "	:rtype: None
") Aspect_SequenceOfColor;
		 Aspect_SequenceOfColor ();
		%feature("compactdefaultargs") Aspect_SequenceOfColor;
		%feature("autodoc", "	:param Other:
	:type Other: Aspect_SequenceOfColor &
	:rtype: None
") Aspect_SequenceOfColor;
		 Aspect_SequenceOfColor (const Aspect_SequenceOfColor & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Aspect_SequenceOfColor &
	:rtype: Aspect_SequenceOfColor
") Assign;
		const Aspect_SequenceOfColor & Assign (const Aspect_SequenceOfColor & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Aspect_SequenceOfColor &
	:rtype: Aspect_SequenceOfColor
") operator =;
		const Aspect_SequenceOfColor & operator = (const Aspect_SequenceOfColor & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Quantity_Color &
	:rtype: None
") Append;
		void Append (const Quantity_Color & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: Aspect_SequenceOfColor &
	:rtype: None
") Append;
		void Append (Aspect_SequenceOfColor & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Quantity_Color &
	:rtype: None
") Prepend;
		void Prepend (const Quantity_Color & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: Aspect_SequenceOfColor &
	:rtype: None
") Prepend;
		void Prepend (Aspect_SequenceOfColor & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Quantity_Color &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Quantity_Color & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Aspect_SequenceOfColor &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Aspect_SequenceOfColor & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Quantity_Color &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Quantity_Color & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Aspect_SequenceOfColor &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Aspect_SequenceOfColor & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Quantity_Color
") First;
		const Quantity_Color & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Quantity_Color
") Last;
		const Quantity_Color & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: Aspect_SequenceOfColor &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Aspect_SequenceOfColor & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Quantity_Color
") Value;
		const Quantity_Color & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Quantity_Color &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Quantity_Color & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Quantity_Color
") ChangeValue;
		Quantity_Color & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend Aspect_SequenceOfColor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Aspect_Window;
class Aspect_Window : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") SetBackground;
		%feature("autodoc", "	* Modifies the window background.

	:param ABack:
	:type ABack: Aspect_Background &
	:rtype: None
") SetBackground;
		void SetBackground (const Aspect_Background & ABack);
		%feature("compactdefaultargs") SetBackground;
		%feature("autodoc", "	* Modifies the window background from a Named Color.

	:param theNameOfColor:
	:type theNameOfColor: Quantity_NameOfColor
	:rtype: None
") SetBackground;
		void SetBackground (const Quantity_NameOfColor theNameOfColor);
		%feature("compactdefaultargs") SetBackground;
		%feature("autodoc", "	* Modifies the window background.

	:param color:
	:type color: Quantity_Color &
	:rtype: None
") SetBackground;
		void SetBackground (const Quantity_Color & color);
		%feature("compactdefaultargs") SetBackground;
		%feature("autodoc", "	* Modifies the window gradient background.

	:param ABackground:
	:type ABackground: Aspect_GradientBackground &
	:rtype: None
") SetBackground;
		void SetBackground (const Aspect_GradientBackground & ABackground);
		%feature("compactdefaultargs") SetBackground;
		%feature("autodoc", "	* Modifies the window gradient background.

	:param theFirstColor:
	:type theFirstColor: Quantity_Color &
	:param theSecondColor:
	:type theSecondColor: Quantity_Color &
	:param theFillMethod:
	:type theFillMethod: Aspect_GradientFillMethod
	:rtype: None
") SetBackground;
		void SetBackground (const Quantity_Color & theFirstColor,const Quantity_Color & theSecondColor,const Aspect_GradientFillMethod theFillMethod);
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "	* Opens the window <self>.

	:rtype: void
") Map;
		virtual void Map ();
		%feature("compactdefaultargs") Unmap;
		%feature("autodoc", "	* Closes the window <self>.

	:rtype: void
") Unmap;
		virtual void Unmap ();
		%feature("compactdefaultargs") DoResize;
		%feature("autodoc", "	* Apply the resizing to the window <self>.

	:rtype: Aspect_TypeOfResize
") DoResize;
		virtual Aspect_TypeOfResize DoResize ();
		%feature("compactdefaultargs") DoMapping;
		%feature("autodoc", "	* Apply the mapping change to the window <self>. and returns True if the window is mapped at screen.

	:rtype: bool
") DoMapping;
		virtual Standard_Boolean DoMapping ();
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	* Destroy the Window

	:rtype: void
") Destroy;
		virtual void Destroy ();
		%feature("compactdefaultargs") Background;
		%feature("autodoc", "	* Returns the window background.

	:rtype: Aspect_Background
") Background;
		Aspect_Background Background ();
		%feature("compactdefaultargs") BackgroundFillMethod;
		%feature("autodoc", "	* Returns the current image background fill mode.

	:rtype: Aspect_FillMethod
") BackgroundFillMethod;
		Aspect_FillMethod BackgroundFillMethod ();
		%feature("compactdefaultargs") GradientBackground;
		%feature("autodoc", "	* Returns the window gradient background.

	:rtype: Aspect_GradientBackground
") GradientBackground;
		Aspect_GradientBackground GradientBackground ();
		%feature("compactdefaultargs") IsMapped;
		%feature("autodoc", "	* Returns True if the window <self> is opened and False if the window is closed.

	:rtype: bool
") IsMapped;
		virtual Standard_Boolean IsMapped ();
		%feature("compactdefaultargs") IsVirtual;
		%feature("autodoc", "	* Returns True if the window <self> is virtual

	:rtype: bool
") IsVirtual;
		Standard_Boolean IsVirtual ();
		%feature("compactdefaultargs") SetVirtual;
		%feature("autodoc", "	* Setup the virtual state

	:param theVirtual:
	:type theVirtual: bool
	:rtype: None
") SetVirtual;
		void SetVirtual (const Standard_Boolean theVirtual);
		%feature("compactdefaultargs") Ratio;
		%feature("autodoc", "	* Returns The Window RATIO equal to the physical WIDTH/HEIGHT dimensions

	:rtype: Quantity_Ratio
") Ratio;
		virtual Quantity_Ratio Ratio ();
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "	* Returns The Window POSITION in PIXEL

	:param X1:
	:type X1: int &
	:param Y1:
	:type Y1: int &
	:param X2:
	:type X2: int &
	:param Y2:
	:type Y2: int &
	:rtype: void
") Position;
		virtual void Position (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "	* Returns The Window SIZE in PIXEL

	:param Width:
	:type Width: int &
	:param Height:
	:type Height: int &
	:rtype: void
") Size;
		virtual void Size (Standard_Integer &OutValue,Standard_Integer &OutValue);
};


%extend Aspect_Window {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Aspect_Window(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Aspect_Window::Handle_Aspect_Window %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Aspect_Window;
class Handle_Aspect_Window : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Aspect_Window();
        Handle_Aspect_Window(const Handle_Aspect_Window &aHandle);
        Handle_Aspect_Window(const Aspect_Window *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Aspect_Window DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_Window {
    Aspect_Window* _get_reference() {
    return (Aspect_Window*)$self->Access();
    }
};

%extend Handle_Aspect_Window {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Aspect_Window {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Aspect_CircularGrid;
class Aspect_CircularGrid : public Aspect_Grid {
	public:
		%feature("compactdefaultargs") Aspect_CircularGrid;
		%feature("autodoc", "	* creates a new grid. By default this grid is not active.

	:param aRadiusStep:
	:type aRadiusStep: Quantity_Length
	:param aDivisionNumber:
	:type aDivisionNumber: int
	:param XOrigin: default value is 0
	:type XOrigin: Quantity_Length
	:param anYOrigin: default value is 0
	:type anYOrigin: Quantity_Length
	:param aRotationAngle: default value is 0
	:type aRotationAngle: Quantity_PlaneAngle
	:rtype: None
") Aspect_CircularGrid;
		 Aspect_CircularGrid (const Quantity_Length aRadiusStep,const Standard_Integer aDivisionNumber,const Quantity_Length XOrigin = 0,const Quantity_Length anYOrigin = 0,const Quantity_PlaneAngle aRotationAngle = 0);
		%feature("compactdefaultargs") SetRadiusStep;
		%feature("autodoc", "	* defines the x step of the grid.

	:param aStep:
	:type aStep: Quantity_Length
	:rtype: None
") SetRadiusStep;
		void SetRadiusStep (const Quantity_Length aStep);
		%feature("compactdefaultargs") SetDivisionNumber;
		%feature("autodoc", "	* defines the step of the grid.

	:param aNumber:
	:type aNumber: int
	:rtype: None
") SetDivisionNumber;
		void SetDivisionNumber (const Standard_Integer aNumber);
		%feature("compactdefaultargs") SetGridValues;
		%feature("autodoc", "	:param XOrigin:
	:type XOrigin: Quantity_Length
	:param YOrigin:
	:type YOrigin: Quantity_Length
	:param RadiusStep:
	:type RadiusStep: Quantity_Length
	:param DivisionNumber:
	:type DivisionNumber: int
	:param RotationAngle:
	:type RotationAngle: Quantity_PlaneAngle
	:rtype: None
") SetGridValues;
		void SetGridValues (const Quantity_Length XOrigin,const Quantity_Length YOrigin,const Quantity_Length RadiusStep,const Standard_Integer DivisionNumber,const Quantity_PlaneAngle RotationAngle);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* returns the point of the grid the closest to the point X,Y

	:param X:
	:type X: Quantity_Length
	:param Y:
	:type Y: Quantity_Length
	:param gridX:
	:type gridX: Quantity_Length &
	:param gridY:
	:type gridY: Quantity_Length &
	:rtype: None
") Compute;
		void Compute (const Quantity_Length X,const Quantity_Length Y,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") RadiusStep;
		%feature("autodoc", "	* returns the x step of the grid.

	:rtype: Quantity_Length
") RadiusStep;
		Quantity_Length RadiusStep ();
		%feature("compactdefaultargs") DivisionNumber;
		%feature("autodoc", "	* returns the x step of the grid.

	:rtype: int
") DivisionNumber;
		Standard_Integer DivisionNumber ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:rtype: None
") Init;
		void Init ();
};


%extend Aspect_CircularGrid {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Aspect_CircularGrid(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Aspect_CircularGrid::Handle_Aspect_CircularGrid %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Aspect_CircularGrid;
class Handle_Aspect_CircularGrid : public Handle_Aspect_Grid {

    public:
        // constructors
        Handle_Aspect_CircularGrid();
        Handle_Aspect_CircularGrid(const Handle_Aspect_CircularGrid &aHandle);
        Handle_Aspect_CircularGrid(const Aspect_CircularGrid *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Aspect_CircularGrid DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_CircularGrid {
    Aspect_CircularGrid* _get_reference() {
    return (Aspect_CircularGrid*)$self->Access();
    }
};

%extend Handle_Aspect_CircularGrid {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Aspect_CircularGrid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Aspect_GradientBackground;
class Aspect_GradientBackground : public Aspect_Background {
	public:
		%feature("compactdefaultargs") Aspect_GradientBackground;
		%feature("autodoc", "	* Creates a window gradient background. Default colors : Quantity_NOC_BLACK. Default fill method : Aspect_GFM_NONE

	:rtype: None
") Aspect_GradientBackground;
		 Aspect_GradientBackground ();
		%feature("compactdefaultargs") Aspect_GradientBackground;
		%feature("autodoc", "	* Creates a window gradient background with colours <AColor1, AColor2>.

	:param AColor1:
	:type AColor1: Quantity_Color &
	:param AColor2:
	:type AColor2: Quantity_Color &
	:param AMethod: default value is Aspect_GFM_HOR
	:type AMethod: Aspect_GradientFillMethod
	:rtype: None
") Aspect_GradientBackground;
		 Aspect_GradientBackground (const Quantity_Color & AColor1,const Quantity_Color & AColor2,const Aspect_GradientFillMethod AMethod = Aspect_GFM_HOR);
		%feature("compactdefaultargs") SetColors;
		%feature("autodoc", "	* Modifies the colours of the window gradient background <self>.

	:param AColor1:
	:type AColor1: Quantity_Color &
	:param AColor2:
	:type AColor2: Quantity_Color &
	:param AMethod: default value is Aspect_GFM_HOR
	:type AMethod: Aspect_GradientFillMethod
	:rtype: None
") SetColors;
		void SetColors (const Quantity_Color & AColor1,const Quantity_Color & AColor2,const Aspect_GradientFillMethod AMethod = Aspect_GFM_HOR);
		%feature("compactdefaultargs") Colors;
		%feature("autodoc", "	* Returns colours of the window gradient background <self>.

	:param AColor1:
	:type AColor1: Quantity_Color &
	:param AColor2:
	:type AColor2: Quantity_Color &
	:rtype: None
") Colors;
		void Colors (Quantity_Color & AColor1,Quantity_Color & AColor2);
		%feature("compactdefaultargs") BgGradientFillMethod;
		%feature("autodoc", "	* Returns the current gradient background fill mode.

	:rtype: Aspect_GradientFillMethod
") BgGradientFillMethod;
		Aspect_GradientFillMethod BgGradientFillMethod ();
};


%extend Aspect_GradientBackground {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Aspect_RectangularGrid;
class Aspect_RectangularGrid : public Aspect_Grid {
	public:
		%feature("compactdefaultargs") Aspect_RectangularGrid;
		%feature("autodoc", "	* creates a new grid. By default this grid is not active. The first angle is given relatively to the horizontal. The second angle is given relatively to the vertical.

	:param aXStep:
	:type aXStep: Quantity_Length
	:param aYStep:
	:type aYStep: Quantity_Length
	:param anXOrigin: default value is 0
	:type anXOrigin: Quantity_Length
	:param anYOrigin: default value is 0
	:type anYOrigin: Quantity_Length
	:param aFirstAngle: default value is 0
	:type aFirstAngle: Quantity_PlaneAngle
	:param aSecondAngle: default value is 0
	:type aSecondAngle: Quantity_PlaneAngle
	:param aRotationAngle: default value is 0
	:type aRotationAngle: Quantity_PlaneAngle
	:rtype: None
") Aspect_RectangularGrid;
		 Aspect_RectangularGrid (const Quantity_Length aXStep,const Quantity_Length aYStep,const Quantity_Length anXOrigin = 0,const Quantity_Length anYOrigin = 0,const Quantity_PlaneAngle aFirstAngle = 0,const Quantity_PlaneAngle aSecondAngle = 0,const Quantity_PlaneAngle aRotationAngle = 0);
		%feature("compactdefaultargs") SetXStep;
		%feature("autodoc", "	* defines the x step of the grid.

	:param aStep:
	:type aStep: Quantity_Length
	:rtype: None
") SetXStep;
		void SetXStep (const Quantity_Length aStep);
		%feature("compactdefaultargs") SetYStep;
		%feature("autodoc", "	* defines the y step of the grid.

	:param aStep:
	:type aStep: Quantity_Length
	:rtype: None
") SetYStep;
		void SetYStep (const Quantity_Length aStep);
		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", "	* defines the angle of the second network the fist angle is given relatively to the horizontal. the second angle is given relatively to the vertical.

	:param anAngle1:
	:type anAngle1: Quantity_PlaneAngle
	:param anAngle2:
	:type anAngle2: Quantity_PlaneAngle
	:rtype: None
") SetAngle;
		void SetAngle (const Quantity_PlaneAngle anAngle1,const Quantity_PlaneAngle anAngle2);
		%feature("compactdefaultargs") SetGridValues;
		%feature("autodoc", "	:param XOrigin:
	:type XOrigin: Quantity_Length
	:param YOrigin:
	:type YOrigin: Quantity_Length
	:param XStep:
	:type XStep: Quantity_Length
	:param YStep:
	:type YStep: Quantity_Length
	:param RotationAngle:
	:type RotationAngle: Quantity_PlaneAngle
	:rtype: None
") SetGridValues;
		void SetGridValues (const Quantity_Length XOrigin,const Quantity_Length YOrigin,const Quantity_Length XStep,const Quantity_Length YStep,const Quantity_PlaneAngle RotationAngle);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* returns the point of the grid the closest to the point X,Y

	:param X:
	:type X: Quantity_Length
	:param Y:
	:type Y: Quantity_Length
	:param gridX:
	:type gridX: Quantity_Length &
	:param gridY:
	:type gridY: Quantity_Length &
	:rtype: None
") Compute;
		void Compute (const Quantity_Length X,const Quantity_Length Y,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") XStep;
		%feature("autodoc", "	* returns the x step of the grid.

	:rtype: Quantity_Length
") XStep;
		Quantity_Length XStep ();
		%feature("compactdefaultargs") YStep;
		%feature("autodoc", "	* returns the x step of the grid.

	:rtype: Quantity_Length
") YStep;
		Quantity_Length YStep ();
		%feature("compactdefaultargs") FirstAngle;
		%feature("autodoc", "	* returns the x Angle of the grid, relatively to the horizontal.

	:rtype: Quantity_PlaneAngle
") FirstAngle;
		Quantity_PlaneAngle FirstAngle ();
		%feature("compactdefaultargs") SecondAngle;
		%feature("autodoc", "	* returns the y Angle of the grid, relatively to the vertical.

	:rtype: Quantity_PlaneAngle
") SecondAngle;
		Quantity_PlaneAngle SecondAngle ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:rtype: None
") Init;
		void Init ();
};


%extend Aspect_RectangularGrid {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Aspect_RectangularGrid(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Aspect_RectangularGrid::Handle_Aspect_RectangularGrid %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Aspect_RectangularGrid;
class Handle_Aspect_RectangularGrid : public Handle_Aspect_Grid {

    public:
        // constructors
        Handle_Aspect_RectangularGrid();
        Handle_Aspect_RectangularGrid(const Handle_Aspect_RectangularGrid &aHandle);
        Handle_Aspect_RectangularGrid(const Aspect_RectangularGrid *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Aspect_RectangularGrid DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_RectangularGrid {
    Aspect_RectangularGrid* _get_reference() {
    return (Aspect_RectangularGrid*)$self->Access();
    }
};

%extend Handle_Aspect_RectangularGrid {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Aspect_RectangularGrid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
