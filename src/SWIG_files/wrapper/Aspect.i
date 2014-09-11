/*
Copyright 2008-2014 Thomas Paviot (tpaviot@gmail.com)


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
%include ../common/StandardDefines.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i

%include Aspect_headers.i

/* typedefs */
typedef void * 	 Aspect_Display;
typedef unsigned long Aspect_Drawable;
typedef Handle_Aspect_DisplayConnection Aspect_DisplayConnection_Handle;
typedef CALL_DEF_LAYER Aspect_CLayer2d;
typedef ifstream * Aspect_IFStream;
typedef Aspect_Driver * Aspect_DriverPtr;
typedef int ( * Aspect_GraphicCallbackProc ) ( Aspect_Drawable theWindowID , void * theUserData , Aspect_GraphicCallbackStruct * theCallData );
typedef void * 	 Aspect_RenderingContext;
typedef unsigned long Aspect_Handle;
typedef void * HANDLE;
typedef ofstream * Aspect_FStream;
typedef Aspect_WindowDriver * Aspect_WindowDriverPtr;
/* end typedefs declaration */

/* public enums */
enum Aspect_CardinalPoints {
	Aspect_CP_North = 0,
	Aspect_CP_NorthEast = 1,
	Aspect_CP_East = 2,
	Aspect_CP_SouthEast = 3,
	Aspect_CP_South = 4,
	Aspect_CP_SouthWest = 5,
	Aspect_CP_West = 6,
	Aspect_CP_NorthWest = 7,
	Aspect_CP_Center = 8,
};

enum Aspect_FillMethod {
	Aspect_FM_NONE = 0,
	Aspect_FM_CENTERED = 1,
	Aspect_FM_TILED = 2,
	Aspect_FM_STRETCH = 3,
};

enum Aspect_FormatOfSheetPaper {
	Aspect_FOSP_A0 = 0,
	Aspect_FOSP_A1 = 1,
	Aspect_FOSP_A2 = 2,
	Aspect_FOSP_A3 = 3,
	Aspect_FOSP_A4 = 4,
	Aspect_FOSP_A5 = 5,
	Aspect_FOSP_K_LONG = 6,
	Aspect_FOSP_K_SHORT = 7,
	Aspect_FOSP_J_LONG = 8,
	Aspect_FOSP_J_SHORT = 9,
	Aspect_FOSP_H_LONG = 10,
	Aspect_FOSP_H_SHORT = 11,
	Aspect_FOSP_G_LONG = 12,
	Aspect_FOSP_G_SHORT = 13,
	Aspect_FOSP_F = 14,
	Aspect_FOSP_E = 15,
	Aspect_FOSP_D = 16,
	Aspect_FOSP_C = 17,
	Aspect_FOSP_B = 18,
	Aspect_FOSP_A = 19,
	Aspect_FOSP_UNKNOWN = 20,
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

enum Aspect_ListingType {
	Aspect_LPID_DIRPLOT = 0,
	Aspect_LPID_DIRPARPLO = 1,
	Aspect_LPID_ALLDIRS = 2,
};

enum Aspect_PlotMode {
	Aspect_PM_DPLOTTER = 0,
	Aspect_PM_FILEONLY = 1,
	Aspect_PM_NPLOTTER = 2,
};

enum Aspect_PlotterOrigin {
	Aspect_PO_CENTER = 0,
	Aspect_PO_BOTTOMLEFT = 1,
	Aspect_PO_TOPLEFT = 2,
	Aspect_PO_TOPRIGHT = 3,
	Aspect_PO_BOTTOMRIGHT = 4,
	Aspect_PO_UNKNOWN = 5,
};

enum Aspect_PrintAlgo {
	Aspect_PA_STRETCH = 0,
	Aspect_PA_TILE = 1,
};

enum Aspect_TypeOfColorMap {
	Aspect_TOC_Generic = 0,
	Aspect_TOC_ColorCube = 1,
	Aspect_TOC_ColorRamp = 2,
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

enum Aspect_TypeOfColorSpace {
	Aspect_TOCS_BlackAndWhite = 0,
	Aspect_TOCS_GreyScale = 1,
	Aspect_TOCS_RGB = 2,
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

enum Aspect_TypeOfFont {
	Aspect_TOF_DEFAULT = 0,
	Aspect_TOF_COURIER = 1,
	Aspect_TOF_HELVETICA = 2,
	Aspect_TOF_TIMES = 3,
	Aspect_TOF_USERDEFINED = 4,
};

enum Aspect_TypeOfHighlightMethod {
	Aspect_TOHM_COLOR = 0,
	Aspect_TOHM_BLINK = 1,
	Aspect_TOHM_BOUNDBOX = 2,
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

enum Aspect_TypeOfRenderingMode {
	Aspect_TORM_IMMEDIAT = 0,
	Aspect_TORM_RETAIN = 1,
	Aspect_TORM_CLEAR_AND_RETAIN = 2,
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

enum Aspect_TypeOfText {
	Aspect_TOT_SOLID = 0,
	Aspect_TOT_OUTLINE = 1,
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

%rename(aspect) Aspect;
%nodefaultctor Aspect;
class Aspect {
	public:
		%feature("autodoc", "Args:
	aFOSP(Aspect_FormatOfSheetPaper)
	aWidth(Quantity_Length)
	aHeight(Quantity_Length)

Returns:
	static char *

Returns the format size according to the default  
     LENGTH unit of the required format <aFOSP>.  
     Returns more the normalized format name.") ValuesOfFOSP;
		static char * ValuesOfFOSP (const Aspect_FormatOfSheetPaper aFOSP,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	aString(TCollection_ExtendedString)

Returns:
	static char *

Translates an ExtendedString to a CString  
         depending of the local format.") ToCString;
		static char * ToCString (const TCollection_ExtendedString & aString);
		%feature("autodoc", "Args:
	aMat(TColStd_Array2OfReal)
	Inv(TColStd_Array2OfReal)

Returns:
	static Standard_Boolean

Inverses <aMat> a 4x4 matrix.") Inverse;
		static Standard_Boolean Inverse (const TColStd_Array2OfReal & aMat,TColStd_Array2OfReal & Inv);
};


%feature("shadow") Aspect::~Aspect %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Aspect {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Aspect_Array1OfEdge;
class Aspect_Array1OfEdge {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Aspect_Array1OfEdge;
		 Aspect_Array1OfEdge (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(Aspect_Edge)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Aspect_Array1OfEdge;
		 Aspect_Array1OfEdge (const Aspect_Edge & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(Aspect_Edge)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Aspect_Edge & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "Args:
	Other(Aspect_Array1OfEdge)

Returns:
	Aspect_Array1OfEdge

No detailed docstring for this function.") Assign;
		const Aspect_Array1OfEdge & Assign (const Aspect_Array1OfEdge & Other);
		%feature("autodoc", "Args:
	Other(Aspect_Array1OfEdge)

Returns:
	Aspect_Array1OfEdge

No detailed docstring for this function.") operator=;
		const Aspect_Array1OfEdge & operator = (const Aspect_Array1OfEdge & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(Aspect_Edge)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Aspect_Edge & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Aspect_Edge

No detailed docstring for this function.") Value;
		const Aspect_Edge & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Aspect_Edge

No detailed docstring for this function.") ChangeValue;
		Aspect_Edge & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") Aspect_Array1OfEdge::~Aspect_Array1OfEdge %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Aspect_Array1OfEdge {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Aspect_AspectFillArea;
class Aspect_AspectFillArea : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	AColor(Quantity_Color)

Returns:
	None

Modifies the colour of the edge of the face") SetEdgeColor;
		void SetEdgeColor (const Quantity_Color & AColor);
		%feature("autodoc", "Args:
	AType(Aspect_TypeOfLine)

Returns:
	None

Modifies the edge line type") SetEdgeLineType;
		void SetEdgeLineType (const Aspect_TypeOfLine AType);
		%feature("autodoc", "Args:
	AWidth(Standard_Real)

Returns:
	None

Modifies the edge thickness  
 
 Category: Methods to modify the class definition  
 
 Warning: Raises AspectFillAreaDefinitionError if the  
//!	    width is a negative value.") SetEdgeWidth;
		void SetEdgeWidth (const Standard_Real AWidth);
		%feature("autodoc", "Args:
	AStyle(Aspect_HatchStyle)

Returns:
	None

Modifies the hatch type used when InteriorStyle  
//!	    is IS_HATCH") SetHatchStyle;
		void SetHatchStyle (const Aspect_HatchStyle AStyle);
		%feature("autodoc", "Args:
	AColor(Quantity_Color)

Returns:
	None

Modifies the colour of the interior of the face") SetInteriorColor;
		void SetInteriorColor (const Quantity_Color & AColor);
		%feature("autodoc", "Args:
	color(Quantity_Color)

Returns:
	None

Modifies the colour of the interior of the back face") SetBackInteriorColor;
		void SetBackInteriorColor (const Quantity_Color & color);
		%feature("autodoc", "Args:
	AStyle(Aspect_InteriorStyle)

Returns:
	None

Modifies the interior type used for rendering  
 
InteriorStyle : IS_EMPTY	no interior  
//!		   IS_HOLLOW	display the boundaries of the surface  
//!		   IS_HATCH	display hatching  
//!		   IS_SOLID	display interior entirely filled") SetInteriorStyle;
		void SetInteriorStyle (const Aspect_InteriorStyle AStyle);
		%feature("autodoc", "Args:
	None
Returns:
	Aspect_HatchStyle

Returns the hatch type used when InteriorStyle  
//!	    is IS_HATCH") HatchStyle;
		Aspect_HatchStyle HatchStyle ();
		%feature("autodoc", "Args:
	AStyle(Aspect_InteriorStyle)
	AIntColor(Quantity_Color)
	AEdgeColor(Quantity_Color)
	AType(Aspect_TypeOfLine)
	AWidth(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Values;
		void Values (Aspect_InteriorStyle & AStyle,Quantity_Color & AIntColor,Quantity_Color & AEdgeColor,Aspect_TypeOfLine & AType,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	AStyle(Aspect_InteriorStyle)
	AIntColor(Quantity_Color)
	BackIntColor(Quantity_Color)
	AEdgeColor(Quantity_Color)
	AType(Aspect_TypeOfLine)
	AWidth(Standard_Real)

Returns:
	None

Returns the current values of the <self> group.") Values;
		void Values (Aspect_InteriorStyle & AStyle,Quantity_Color & AIntColor,Quantity_Color & BackIntColor,Quantity_Color & AEdgeColor,Aspect_TypeOfLine & AType,Standard_Real &OutValue);
};


%feature("shadow") Aspect_AspectFillArea::~Aspect_AspectFillArea %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Aspect_AspectFillArea {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Aspect_AspectFillArea {
	Handle_Aspect_AspectFillArea GetHandle() {
	return *(Handle_Aspect_AspectFillArea*) &$self;
	}
};

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
    Aspect_AspectFillArea* GetObject() {
    return (Aspect_AspectFillArea*)$self->Access();
    }
};
%feature("shadow") Handle_Aspect_AspectFillArea::~Handle_Aspect_AspectFillArea %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Aspect_AspectFillArea {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Aspect_AspectLine;
class Aspect_AspectLine : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	AColor(Quantity_Color)

Returns:
	None

Modifies the colour of <self>.") SetColor;
		void SetColor (const Quantity_Color & AColor);
		%feature("autodoc", "Args:
	AType(Aspect_TypeOfLine)

Returns:
	None

Modifies the type of <self>.") SetType;
		void SetType (const Aspect_TypeOfLine AType);
		%feature("autodoc", "Args:
	AWidth(Standard_Real)

Returns:
	None

Modifies the thickness of <self>.  
 Category: Methods to modify the class definition  
 Warning: Raises AspectLineDefinitionError if the  
//!	    width is a negative value.") SetWidth;
		void SetWidth (const Standard_Real AWidth);
		%feature("autodoc", "Args:
	AColor(Quantity_Color)
	AType(Aspect_TypeOfLine)
	AWidth(Standard_Real)

Returns:
	None

Returns the current values of the group <self>.") Values;
		void Values (Quantity_Color & AColor,Aspect_TypeOfLine & AType,Standard_Real &OutValue);
};


%feature("shadow") Aspect_AspectLine::~Aspect_AspectLine %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Aspect_AspectLine {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Aspect_AspectLine {
	Handle_Aspect_AspectLine GetHandle() {
	return *(Handle_Aspect_AspectLine*) &$self;
	}
};

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
    Aspect_AspectLine* GetObject() {
    return (Aspect_AspectLine*)$self->Access();
    }
};
%feature("shadow") Handle_Aspect_AspectLine::~Handle_Aspect_AspectLine %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Aspect_AspectLine {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Aspect_AspectMarker;
class Aspect_AspectMarker : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	AColor(Quantity_Color)

Returns:
	None

Modifies the colour of <self>.") SetColor;
		void SetColor (const Quantity_Color & AColor);
		%feature("autodoc", "Args:
	AScale(Standard_Real)

Returns:
	None

Modifies the scale factor of <self>.  
//!	    Marker type Aspect_TOM_POINT is not affected  
//!	    by the marker size scale factor. It is always  
//!	    the smallest displayable dot.  
 Warning: Raises AspectMarkerDefinitionError if the  
//!	    scale is a negative value.") SetScale;
		void SetScale (const Standard_Real AScale);
		%feature("autodoc", "Args:
	AType(Aspect_TypeOfMarker)

Returns:
	None

Modifies the type of marker <self>.") SetType;
		void SetType (const Aspect_TypeOfMarker AType);
		%feature("autodoc", "Args:
	AColor(Quantity_Color)
	AType(Aspect_TypeOfMarker)
	AScale(Standard_Real)

Returns:
	None

Returns the current values of the group <self>.") Values;
		void Values (Quantity_Color & AColor,Aspect_TypeOfMarker & AType,Standard_Real &OutValue);
};


%feature("shadow") Aspect_AspectMarker::~Aspect_AspectMarker %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Aspect_AspectMarker {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Aspect_AspectMarker {
	Handle_Aspect_AspectMarker GetHandle() {
	return *(Handle_Aspect_AspectMarker*) &$self;
	}
};

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
    Aspect_AspectMarker* GetObject() {
    return (Aspect_AspectMarker*)$self->Access();
    }
};
%feature("shadow") Handle_Aspect_AspectMarker::~Handle_Aspect_AspectMarker %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Aspect_AspectMarker {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Aspect_Background;
class Aspect_Background {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a window background.  
//!	    Default color : NOC_MATRAGRAY.") Aspect_Background;
		 Aspect_Background ();
		%feature("autodoc", "Args:
	AColor(Quantity_Color)

Returns:
	None

Creates a window background with the colour <AColor>.") Aspect_Background;
		 Aspect_Background (const Quantity_Color & AColor);
		%feature("autodoc", "Args:
	AColor(Quantity_Color)

Returns:
	None

Modifies the colour of the window background <self>.") SetColor;
		void SetColor (const Quantity_Color & AColor);
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_Color

Returns the colour of the window background <self>.") Color;
		Quantity_Color Color ();
};


%feature("shadow") Aspect_Background::~Aspect_Background %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Aspect_Background {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Aspect_ColorMap;
class Aspect_ColorMap : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	Aspect_TypeOfColorMap

No detailed docstring for this function.") Type;
		Aspect_TypeOfColorMap Type ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the Allocated colormap Size") Size;
		Standard_Integer Size ();
		%feature("autodoc", "Args:
	aColormapIndex(Standard_Integer)

Returns:
	Standard_Integer

Returns the ColorMapEntry.Index of the ColorMap  
//!	    at rank <aColormapIndex> .") Index;
		Standard_Integer Index (const Standard_Integer aColormapIndex);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Dump;
		void Dump ();
		%feature("autodoc", "Args:
	AColorMapIndex(Standard_Integer)

Returns:
	Aspect_ColorMapEntry

Return the value of the <Index>th element of  
//!	    the ColorMap") Entry;
		const Aspect_ColorMapEntry & Entry (const Standard_Integer AColorMapIndex);
		%feature("autodoc", "Args:
	AColorMapEntryIndex(Standard_Integer)

Returns:
	virtual Standard_Integer

Returns the index in the ColorMap of the  
//!	    ColorMapEntry.Index() equal to <AnEntryIndex>.") FindColorMapIndex;
		virtual Standard_Integer FindColorMapIndex (const Standard_Integer AColorMapEntryIndex);
		%feature("autodoc", "Args:
	AColorMapEntryIndex(Standard_Integer)

Returns:
	virtual  Aspect_ColorMapEntry

Returns the ColorMapEntry with ColorMapEntry.Index()  
//!	    equal to <AnEntryIndex>.") FindEntry;
		virtual const Aspect_ColorMapEntry & FindEntry (const Standard_Integer AColorMapEntryIndex);
		%feature("autodoc", "Args:
	aColor(Quantity_Color)

Returns:
	virtual Standard_Integer

Returns the index in the ColorMap of the  
//!	    nearest matching ColorMapEntry") NearestColorMapIndex;
		virtual Standard_Integer NearestColorMapIndex (const Quantity_Color & aColor);
		%feature("autodoc", "Args:
	aColor(Quantity_Color)

Returns:
	virtual  Aspect_ColorMapEntry

Returns the nearest ColorMapEntry that match aColor .") NearestEntry;
		virtual const Aspect_ColorMapEntry & NearestEntry (const Quantity_Color & aColor);
		%feature("autodoc", "Args:
	aColor(Quantity_Color)

Returns:
	virtual Standard_Integer

Search an identical color entry in the color map <self>  
and returns the ColorMapEntry Index if exist.  
Or add a new entry and returns the computed ColorMapEntry index used.") AddEntry;
		virtual Standard_Integer AddEntry (const Quantity_Color & aColor);
};


%feature("shadow") Aspect_ColorMap::~Aspect_ColorMap %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Aspect_ColorMap {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Aspect_ColorMap {
	Handle_Aspect_ColorMap GetHandle() {
	return *(Handle_Aspect_ColorMap*) &$self;
	}
};

%nodefaultctor Handle_Aspect_ColorMap;
class Handle_Aspect_ColorMap : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Aspect_ColorMap();
        Handle_Aspect_ColorMap(const Handle_Aspect_ColorMap &aHandle);
        Handle_Aspect_ColorMap(const Aspect_ColorMap *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Aspect_ColorMap DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_ColorMap {
    Aspect_ColorMap* GetObject() {
    return (Aspect_ColorMap*)$self->Access();
    }
};
%feature("shadow") Handle_Aspect_ColorMap::~Handle_Aspect_ColorMap %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Aspect_ColorMap {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Aspect_ColorMapEntry;
class Aspect_ColorMapEntry {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an unallocated colormap entry") Aspect_ColorMapEntry;
		 Aspect_ColorMapEntry ();
		%feature("autodoc", "Args:
	index(Standard_Integer)
	rgb(Quantity_Color)

Returns:
	None

Creates an allocated colormap entry") Aspect_ColorMapEntry;
		 Aspect_ColorMapEntry (const Standard_Integer index,const Quantity_Color & rgb);
		%feature("autodoc", "Args:
	entry(Aspect_ColorMapEntry)

Returns:
	None

Creates an allocated colormap entry.  
 Warning: Raises error if the colormap entry <entry>  
//!	    is unallocated.") Aspect_ColorMapEntry;
		 Aspect_ColorMapEntry (const Aspect_ColorMapEntry & entry);
		%feature("autodoc", "Args:
	index(Standard_Integer)
	rgb(Quantity_Color)

Returns:
	None

Sets colormap entry value and allocates it.") SetValue;
		void SetValue (const Standard_Integer index,const Quantity_Color & rgb);
		%feature("autodoc", "Args:
	entry(Aspect_ColorMapEntry)

Returns:
	None

Sets colormap entry value and allocates it.") SetValue;
		void SetValue (const Aspect_ColorMapEntry & entry);
		%feature("autodoc", "Args:
	entry(Aspect_ColorMapEntry)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const Aspect_ColorMapEntry & entry);
		%feature("autodoc", "Args:
	rgb(Quantity_Color)

Returns:
	None

Sets color <rgb> of colormap entry.") SetColor;
		void SetColor (const Quantity_Color & rgb);
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_Color

No detailed docstring for this function.") Color;
		const Quantity_Color & Color ();
		%feature("autodoc", "Args:
	index(Standard_Integer)

Returns:
	None

Sets index value of a colormap entry.") SetIndex;
		void SetIndex (const Standard_Integer index);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Index;
		Standard_Integer Index ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Unallocates the colormap entry.") Free;
		void Free ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the colormap entry is allocated.  
 Warning: A colormap entry is allocated when the color and  
//!	    the index is defined.") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Dump;
		void Dump ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") _CSFDB_GetAspect_ColorMapEntryallocated;
		Standard_Boolean _CSFDB_GetAspect_ColorMapEntryallocated ();
		%feature("autodoc", "Args:
	p(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") _CSFDB_SetAspect_ColorMapEntryallocated;
		void _CSFDB_SetAspect_ColorMapEntryallocated (const Standard_Boolean p);
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_Color

No detailed docstring for this function.") _CSFDB_GetAspect_ColorMapEntrymycolor;
		const Quantity_Color & _CSFDB_GetAspect_ColorMapEntrymycolor ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") _CSFDB_GetAspect_ColorMapEntrymyindex;
		Standard_Integer _CSFDB_GetAspect_ColorMapEntrymyindex ();
		%feature("autodoc", "Args:
	p(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") _CSFDB_SetAspect_ColorMapEntrymyindex;
		void _CSFDB_SetAspect_ColorMapEntrymyindex (const Standard_Integer p);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") _CSFDB_GetAspect_ColorMapEntrymyColorIsDef;
		Standard_Boolean _CSFDB_GetAspect_ColorMapEntrymyColorIsDef ();
		%feature("autodoc", "Args:
	p(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") _CSFDB_SetAspect_ColorMapEntrymyColorIsDef;
		void _CSFDB_SetAspect_ColorMapEntrymyColorIsDef (const Standard_Boolean p);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") _CSFDB_GetAspect_ColorMapEntrymyIndexIsDef;
		Standard_Boolean _CSFDB_GetAspect_ColorMapEntrymyIndexIsDef ();
		%feature("autodoc", "Args:
	p(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") _CSFDB_SetAspect_ColorMapEntrymyIndexIsDef;
		void _CSFDB_SetAspect_ColorMapEntrymyIndexIsDef (const Standard_Boolean p);
};


%feature("shadow") Aspect_ColorMapEntry::~Aspect_ColorMapEntry %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Aspect_ColorMapEntry {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Aspect_ColorScale;
class Aspect_ColorScale : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	Value(Standard_Real)
	Color(Quantity_Color)

Returns:
	Standard_Boolean

Calculate color according passed value; returns true if value is in range or false, if isn't") FindColor;
		Standard_Boolean FindColor (const Standard_Real Value,Quantity_Color & Color);
		%feature("autodoc", "Args:
	Value(Standard_Real)
	Min(Standard_Real)
	Max(Standard_Real)
	ColorsCount(Standard_Integer)
	Color(Quantity_Color)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") FindColor;
		static Standard_Boolean FindColor (const Standard_Real Value,const Standard_Real Min,const Standard_Real Max,const Standard_Integer ColorsCount,Quantity_Color & Color);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns minimal value of color scale;") GetMin;
		Standard_Real GetMin ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns maximal value of color scale;") GetMax;
		Standard_Real GetMax ();
		%feature("autodoc", "Args:
	aMin(Standard_Real)
	aMax(Standard_Real)

Returns:
	None

Returns minimal and maximal values of color scale;") GetRange;
		void GetRange (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Aspect_TypeOfColorScaleData

Returns the type of labels;  
        Aspect_TOCSD_AUTO - labels as boundary values for intervals  
        Aspect_TOCSD_USER - user specified label is used") GetLabelType;
		Aspect_TypeOfColorScaleData GetLabelType ();
		%feature("autodoc", "Args:
	None
Returns:
	Aspect_TypeOfColorScaleData

Returns the type of colors;  
        Aspect_TOCSD_AUTO - value between Red and Blue  
        Aspect_TOCSD_USER - user specified color from color map") GetColorType;
		Aspect_TypeOfColorScaleData GetColorType ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of color scale intervals;") GetNumberOfIntervals;
		Standard_Integer GetNumberOfIntervals ();
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_ExtendedString

Returns the color scale title string;") GetTitle;
		TCollection_ExtendedString GetTitle ();
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns the format for numbers.  
        The same like format for function printf().  
        Used if GetLabelType() is TOCSD_AUTO;") GetFormat;
		TCollection_AsciiString GetFormat ();
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	TCollection_ExtendedString

Returns the user specified label with index <anIndex>.  
        Returns empty string if label not defined.") GetLabel;
		TCollection_ExtendedString GetLabel (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Quantity_Color

Returns the user specified color from color map with index <anIndex>.  
        Returns default color if index out of range in color map.") GetColor;
		Quantity_Color GetColor (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	aLabels(TColStd_SequenceOfExtendedString)

Returns:
	None

Returns the user specified labels.") GetLabels;
		void GetLabels (TColStd_SequenceOfExtendedString & aLabels);
		%feature("autodoc", "Args:
	aColors(Aspect_SequenceOfColor)

Returns:
	None

Returns the user specified colors.") GetColors;
		void GetColors (Aspect_SequenceOfColor & aColors);
		%feature("autodoc", "Args:
	None
Returns:
	Aspect_TypeOfColorScalePosition

Returns the position of labels concerning color filled rectangles.") GetLabelPosition;
		Aspect_TypeOfColorScalePosition GetLabelPosition ();
		%feature("autodoc", "Args:
	None
Returns:
	Aspect_TypeOfColorScalePosition

Returns the position of color scale title.") GetTitlePosition;
		Aspect_TypeOfColorScalePosition GetTitlePosition ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the labels and colors used in reversed order.") IsReversed;
		Standard_Boolean IsReversed ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the labels placed at border of color filled rectangles.") IsLabelAtBorder;
		Standard_Boolean IsLabelAtBorder ();
		%feature("autodoc", "Args:
	aMin(Standard_Real)

Returns:
	None

Sets the minimal value of color scale.") SetMin;
		void SetMin (const Standard_Real aMin);
		%feature("autodoc", "Args:
	aMax(Standard_Real)

Returns:
	None

Sets the maximal value of color scale.") SetMax;
		void SetMax (const Standard_Real aMax);
		%feature("autodoc", "Args:
	aMin(Standard_Real)
	aMax(Standard_Real)

Returns:
	None

Sets the minimal and maximal value of color scale.") SetRange;
		void SetRange (const Standard_Real aMin,const Standard_Real aMax);
		%feature("autodoc", "Args:
	aType(Aspect_TypeOfColorScaleData)

Returns:
	None

Sets the type of labels.  
        Aspect_TOCSD_AUTO - labels as boundary values for intervals  
        Aspect_TOCSD_USER - user specified label is used") SetLabelType;
		void SetLabelType (const Aspect_TypeOfColorScaleData aType);
		%feature("autodoc", "Args:
	aType(Aspect_TypeOfColorScaleData)

Returns:
	None

Sets the type of colors.  
        Aspect_TOCSD_AUTO - value between Red and Blue  
        Aspect_TOCSD_USER - user specified color from color map") SetColorType;
		void SetColorType (const Aspect_TypeOfColorScaleData aType);
		%feature("autodoc", "Args:
	aNum(Standard_Integer)

Returns:
	None

Sets the number of color scale intervals.") SetNumberOfIntervals;
		void SetNumberOfIntervals (const Standard_Integer aNum);
		%feature("autodoc", "Args:
	aTitle(TCollection_ExtendedString)

Returns:
	None

Sets the color scale title string.") SetTitle;
		void SetTitle (const TCollection_ExtendedString & aTitle);
		%feature("autodoc", "Args:
	aFormat(TCollection_AsciiString)

Returns:
	None

Sets the color scale auto label format specification.") SetFormat;
		void SetFormat (const TCollection_AsciiString & aFormat);
		%feature("autodoc", "Args:
	aLabel(TCollection_ExtendedString)
	anIndex(Standard_Integer)=- 1

Returns:
	None

Sets the color scale label at index. Index started from 1.") SetLabel;
		void SetLabel (const TCollection_ExtendedString & aLabel,const Standard_Integer anIndex = - 1);
		%feature("autodoc", "Args:
	aColor(Quantity_Color)
	anIndex(Standard_Integer)=- 1

Returns:
	None

Sets the color scale color at index. Index started from 1.") SetColor;
		void SetColor (const Quantity_Color & aColor,const Standard_Integer anIndex = - 1);
		%feature("autodoc", "Args:
	aSeq(TColStd_SequenceOfExtendedString)

Returns:
	None

Sets the color scale labels.") SetLabels;
		void SetLabels (const TColStd_SequenceOfExtendedString & aSeq);
		%feature("autodoc", "Args:
	aMap(Handle_Aspect_ColorMap)

Returns:
	None

Sets the color scale colors.") SetColors;
		void SetColors (const Handle_Aspect_ColorMap & aMap);
		%feature("autodoc", "Args:
	aSeq(Aspect_SequenceOfColor)

Returns:
	None

Sets the color scale colors.") SetColors;
		void SetColors (const Aspect_SequenceOfColor & aSeq);
		%feature("autodoc", "Args:
	aPos(Aspect_TypeOfColorScalePosition)

Returns:
	None

Sets the color scale labels position concerning color filled rectangles.") SetLabelPosition;
		void SetLabelPosition (const Aspect_TypeOfColorScalePosition aPos);
		%feature("autodoc", "Args:
	aPos(Aspect_TypeOfColorScalePosition)

Returns:
	None

Sets the color scale title position.") SetTitlePosition;
		void SetTitlePosition (const Aspect_TypeOfColorScalePosition aPos);
		%feature("autodoc", "Args:
	aReverse(Standard_Boolean)

Returns:
	None

Sets true if the labels and colors used in reversed order.") SetReversed;
		void SetReversed (const Standard_Boolean aReverse);
		%feature("autodoc", "Args:
	anOn(Standard_Boolean)

Returns:
	None

Sets true if the labels placed at border of color filled rectangles.") SetLabelAtBorder;
		void SetLabelAtBorder (const Standard_Boolean anOn);
		%feature("autodoc", "Args:
	aWidth(Standard_Real)
	aHeight(Standard_Real)

Returns:
	None

Returns the size of color scale.") GetSize;
		void GetSize (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the width of color scale.") GetWidth;
		Standard_Real GetWidth ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the height of color scale.") GetHeight;
		Standard_Real GetHeight ();
		%feature("autodoc", "Args:
	aWidth(Standard_Real)
	aHeight(Standard_Real)

Returns:
	None

Sets the size of color scale.") SetSize;
		void SetSize (const Standard_Real aWidth,const Standard_Real aHeight);
		%feature("autodoc", "Args:
	aWidth(Standard_Real)

Returns:
	None

Sets the width of color scale.") SetWidth;
		void SetWidth (const Standard_Real aWidth);
		%feature("autodoc", "Args:
	aHeight(Standard_Real)

Returns:
	None

Sets the height of color scale.") SetHeight;
		void SetHeight (const Standard_Real aHeight);
		%feature("autodoc", "Args:
	aX(Standard_Real)
	aY(Standard_Real)

Returns:
	None

Returns the position of color scale.") GetPosition;
		void GetPosition (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the X position of color scale.") GetXPosition;
		Standard_Real GetXPosition ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the height of color scale.") GetYPosition;
		Standard_Real GetYPosition ();
		%feature("autodoc", "Args:
	aX(Standard_Real)
	aY(Standard_Real)

Returns:
	None

Sets the position of color scale.") SetPosition;
		void SetPosition (const Standard_Real aX,const Standard_Real aY);
		%feature("autodoc", "Args:
	aX(Standard_Real)

Returns:
	None

Sets the X position of color scale.") SetXPosition;
		void SetXPosition (const Standard_Real aX);
		%feature("autodoc", "Args:
	aY(Standard_Real)

Returns:
	None

Sets the Y position of color scale.") SetYPosition;
		void SetYPosition (const Standard_Real aY);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") GetTextHeight;
		Standard_Integer GetTextHeight ();
		%feature("autodoc", "Args:
	aHeigh(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetTextHeight;
		void SetTextHeight (const Standard_Integer aHeigh);
		%feature("autodoc", "Args:
	X(Standard_Integer)
	Y(Standard_Integer)
	W(Standard_Integer)
	H(Standard_Integer)
	aColor(Quantity_Color)
	aFilled(Standard_Boolean)=Standard_False

Returns:
	virtual void

No detailed docstring for this function.") PaintRect;
		virtual void PaintRect (const Standard_Integer X,const Standard_Integer Y,const Standard_Integer W,const Standard_Integer H,const Quantity_Color & aColor,const Standard_Boolean aFilled = Standard_False);
		%feature("autodoc", "Args:
	aText(TCollection_ExtendedString)
	X(Standard_Integer)
	Y(Standard_Integer)
	aColor(Quantity_Color)

Returns:
	virtual void

No detailed docstring for this function.") PaintText;
		virtual void PaintText (const TCollection_ExtendedString & aText,const Standard_Integer X,const Standard_Integer Y,const Quantity_Color & aColor);
		%feature("autodoc", "Args:
	aText(TCollection_ExtendedString)

Returns:
	virtual Standard_Integer

No detailed docstring for this function.") TextWidth;
		virtual Standard_Integer TextWidth (const TCollection_ExtendedString & aText);
		%feature("autodoc", "Args:
	aText(TCollection_ExtendedString)

Returns:
	virtual Standard_Integer

No detailed docstring for this function.") TextHeight;
		virtual Standard_Integer TextHeight (const TCollection_ExtendedString & aText);
};


%feature("shadow") Aspect_ColorScale::~Aspect_ColorScale %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Aspect_ColorScale {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Aspect_ColorScale {
	Handle_Aspect_ColorScale GetHandle() {
	return *(Handle_Aspect_ColorScale*) &$self;
	}
};

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
    Aspect_ColorScale* GetObject() {
    return (Aspect_ColorScale*)$self->Access();
    }
};
%feature("shadow") Handle_Aspect_ColorScale::~Handle_Aspect_ColorScale %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Aspect_ColorScale {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Aspect_Driver;
class Aspect_Driver : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	Synchronize(Standard_Boolean)=Standard_False

Returns:
	virtual void

Flush all graphics and Wait after up to date") EndDraw;
		virtual void EndDraw (const Standard_Boolean Synchronize = Standard_False);
		%feature("autodoc", "Args:
	aColorMap(Handle_Aspect_ColorMap)

Returns:
	None

No detailed docstring for this function.") SetColorMap;
		void SetColorMap (const Handle_Aspect_ColorMap & aColorMap);
		%feature("autodoc", "Args:
	aTypeMap(Handle_Aspect_TypeMap)

Returns:
	None

No detailed docstring for this function.") SetTypeMap;
		void SetTypeMap (const Handle_Aspect_TypeMap & aTypeMap);
		%feature("autodoc", "Args:
	aWidthMap(Handle_Aspect_WidthMap)

Returns:
	None

No detailed docstring for this function.") SetWidthMap;
		void SetWidthMap (const Handle_Aspect_WidthMap & aWidthMap);
		%feature("autodoc", "Args:
	aFontMap(Handle_Aspect_FontMap)

Returns:
	None

Sets the current font map to this driver and Enable/Disable  
this driver to use MDTV fonts instead system fonts.") SetFontMap;
		void SetFontMap (const Handle_Aspect_FontMap & aFontMap);
		%feature("autodoc", "Args:
	aMarkMap(Handle_Aspect_MarkMap)

Returns:
	None

No detailed docstring for this function.") SetMarkMap;
		void SetMarkMap (const Handle_Aspect_MarkMap & aMarkMap);
		%feature("autodoc", "Args:
	ColorIndex(Standard_Integer)
	TypeIndex(Standard_Integer)
	WidthIndex(Standard_Integer)

Returns:
	virtual void

No detailed docstring for this function.") SetLineAttrib;
		virtual void SetLineAttrib (const Standard_Integer ColorIndex,const Standard_Integer TypeIndex,const Standard_Integer WidthIndex);
		%feature("autodoc", "Args:
	ColorIndex(Standard_Integer)
	FontIndex(Standard_Integer)

Returns:
	virtual void

No detailed docstring for this function.") SetTextAttrib;
		virtual void SetTextAttrib (const Standard_Integer ColorIndex,const Standard_Integer FontIndex);
		%feature("autodoc", "Args:
	ColorIndex(Standard_Integer)
	FontIndex(Standard_Integer)
	aSlant(Quantity_PlaneAngle)
	aHScale(Quantity_Factor)
	aWScale(Quantity_Factor)
	isUnderlined(Standard_Boolean)=Standard_False

Returns:
	virtual void

No detailed docstring for this function.") SetTextAttrib;
		virtual void SetTextAttrib (const Standard_Integer ColorIndex,const Standard_Integer FontIndex,const Quantity_PlaneAngle aSlant,const Quantity_Factor aHScale,const Quantity_Factor aWScale,const Standard_Boolean isUnderlined = Standard_False);
		%feature("autodoc", "Args:
	ColorIndex(Standard_Integer)
	TileIndex(Standard_Integer)
	DrawEdge(Standard_Boolean)=Standard_False

Returns:
	virtual void

No detailed docstring for this function.") SetPolyAttrib;
		virtual void SetPolyAttrib (const Standard_Integer ColorIndex,const Standard_Integer TileIndex,const Standard_Boolean DrawEdge = Standard_False);
		%feature("autodoc", "Args:
	ColorIndex(Standard_Integer)
	WidthIndex(Standard_Integer)
	FillMarker(Standard_Boolean)=Standard_False

Returns:
	virtual void

No detailed docstring for this function.") SetMarkerAttrib;
		virtual void SetMarkerAttrib (const Standard_Integer ColorIndex,const Standard_Integer WidthIndex,const Standard_Boolean FillMarker = Standard_False);
		%feature("autodoc", "Args:
	anImage(Handle_Standard_Transient)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") IsKnownImage;
		virtual Standard_Boolean IsKnownImage (const Handle_Standard_Transient & anImage);
		%feature("autodoc", "Args:
	anImageFile(char *)
	aWidth(Standard_Integer)
	aHeight(Standard_Integer)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") SizeOfImageFile;
		virtual Standard_Boolean SizeOfImageFile (const char * anImageFile,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	anImageId(Handle_Standard_Transient)

Returns:
	virtual void

No detailed docstring for this function.") ClearImage;
		virtual void ClearImage (const Handle_Standard_Transient & anImageId);
		%feature("autodoc", "Args:
	anImageFile(char *)

Returns:
	virtual void

No detailed docstring for this function.") ClearImageFile;
		virtual void ClearImageFile (const char * anImageFile);
		%feature("autodoc", "Args:
	anImageId(Handle_Standard_Transient)
	aX(Standard_ShortReal)
	aY(Standard_ShortReal)

Returns:
	virtual void

No detailed docstring for this function.") DrawImage;
		virtual void DrawImage (const Handle_Standard_Transient & anImageId,const Standard_ShortReal aX,const Standard_ShortReal aY);
		%feature("autodoc", "Args:
	anImageFile(char *)
	aX(Standard_ShortReal)
	aY(Standard_ShortReal)
	aScale(Quantity_Factor)=1.0

Returns:
	virtual void

No detailed docstring for this function.") DrawImageFile;
		virtual void DrawImageFile (const char * anImageFile,const Standard_ShortReal aX,const Standard_ShortReal aY,const Quantity_Factor aScale = 1.0);
		%feature("autodoc", "Args:
	anImageId(Handle_Standard_Transient)
	aX(Standard_ShortReal)
	aY(Standard_ShortReal)
	aWidth(Standard_Integer)
	aHeight(Standard_Integer)
	anArrayOfPixels(Standard_Address)

Returns:
	virtual void

Fills a complete Image .") FillAndDrawImage;
		virtual void FillAndDrawImage (const Handle_Standard_Transient & anImageId,const Standard_ShortReal aX,const Standard_ShortReal aY,const Standard_Integer aWidth,const Standard_Integer aHeight,const Standard_Address anArrayOfPixels);
		%feature("autodoc", "Args:
	anImageId(Handle_Standard_Transient)
	aX(Standard_ShortReal)
	aY(Standard_ShortReal)
	anIndexOfLine(Standard_Integer)
	aWidth(Standard_Integer)
	aHeight(Standard_Integer)
	anArrayOfPixels(Standard_Address)

Returns:
	virtual void

Fills a line of the Image .  
 Warning: 0 <= anIndexOfLine < aHeight  
//!	    anIndexOfLine = 0 must be the first call") FillAndDrawImage;
		virtual void FillAndDrawImage (const Handle_Standard_Transient & anImageId,const Standard_ShortReal aX,const Standard_ShortReal aY,const Standard_Integer anIndexOfLine,const Standard_Integer aWidth,const Standard_Integer aHeight,const Standard_Address anArrayOfPixels);
		%feature("autodoc", "Args:
	aListX(TShort_Array1OfShortReal)
	aListY(TShort_Array1OfShortReal)

Returns:
	virtual void

Draw a polyline depending of the SetLineAttrib() attributes.") DrawPolyline;
		virtual void DrawPolyline (const TShort_Array1OfShortReal & aListX,const TShort_Array1OfShortReal & aListY);
		%feature("autodoc", "Args:
	aListX(TShort_Array1OfShortReal)
	aListY(TShort_Array1OfShortReal)

Returns:
	virtual void

Draw a polygon depending of the SetPolyAttrib() attributes.") DrawPolygon;
		virtual void DrawPolygon (const TShort_Array1OfShortReal & aListX,const TShort_Array1OfShortReal & aListY);
		%feature("autodoc", "Args:
	X1(Standard_ShortReal)
	Y1(Standard_ShortReal)
	X2(Standard_ShortReal)
	Y2(Standard_ShortReal)

Returns:
	virtual void

Draw a segment depending of the SetLineAttrib() attributes.") DrawSegment;
		virtual void DrawSegment (const Standard_ShortReal X1,const Standard_ShortReal Y1,const Standard_ShortReal X2,const Standard_ShortReal Y2);
		%feature("autodoc", "Args:
	aText(TCollection_ExtendedString)
	Xpos(Standard_ShortReal)
	Ypos(Standard_ShortReal)
	anAngle(Standard_ShortReal)=0.0
	aType(Aspect_TypeOfText)=Aspect_TOT_SOLID

Returns:
	virtual void

Draws a text depending of the SetTextAttrib() attributes.") DrawText;
		virtual void DrawText (const TCollection_ExtendedString & aText,const Standard_ShortReal Xpos,const Standard_ShortReal Ypos,const Standard_ShortReal anAngle = 0.0,const Aspect_TypeOfText aType = Aspect_TOT_SOLID);
		%feature("autodoc", "Args:
	aText(TCollection_ExtendedString)
	Xpos(Standard_ShortReal)
	Ypos(Standard_ShortReal)
	aMarge(Quantity_Ratio)=0.1
	anAngle(Standard_ShortReal)=0.0
	aType(Aspect_TypeOfText)=Aspect_TOT_SOLID

Returns:
	virtual void

Draws an framed text depending of the  
SetTextAttrib() and SetPolyAttrib() attributes.  
 Warning: Coordinates must be defined in DWU space.  
//!	    <aMarge> defines the ratio of the space between the  
//!	    polygon borders and the bounding box of the text and  
//!	    depending of the height of the text.") DrawPolyText;
		virtual void DrawPolyText (const TCollection_ExtendedString & aText,const Standard_ShortReal Xpos,const Standard_ShortReal Ypos,const Quantity_Ratio aMarge = 0.1,const Standard_ShortReal anAngle = 0.0,const Aspect_TypeOfText aType = Aspect_TOT_SOLID);
		%feature("autodoc", "Args:
	X(Standard_ShortReal)
	Y(Standard_ShortReal)

Returns:
	virtual void

Draws a 1 PIXEL point depending of the SetMarkerAttrib()") DrawPoint;
		virtual void DrawPoint (const Standard_ShortReal X,const Standard_ShortReal Y);
		%feature("autodoc", "Args:
	aMarker(Standard_Integer)
	Xpos(Standard_ShortReal)
	Ypos(Standard_ShortReal)
	Width(Standard_ShortReal)
	Height(Standard_ShortReal)
	Angle(Standard_ShortReal)=0.0

Returns:
	virtual void

Draws the prevously defined marker <aMarker>") DrawMarker;
		virtual void DrawMarker (const Standard_Integer aMarker,const Standard_ShortReal Xpos,const Standard_ShortReal Ypos,const Standard_ShortReal Width,const Standard_ShortReal Height,const Standard_ShortReal Angle = 0.0);
		%feature("autodoc", "Args:
	X(Standard_ShortReal)
	Y(Standard_ShortReal)
	anXradius(Standard_ShortReal)
	anYradius(Standard_ShortReal)
	aStartAngle(Standard_ShortReal)=0.0
	anOpenAngle(Standard_ShortReal)=6.283185

Returns:
	virtual Standard_Boolean

Draws an Ellipsoid arc of center <X,Y> and Radius") DrawArc;
		virtual Standard_Boolean DrawArc (const Standard_ShortReal X,const Standard_ShortReal Y,const Standard_ShortReal anXradius,const Standard_ShortReal anYradius,const Standard_ShortReal aStartAngle = 0.0,const Standard_ShortReal anOpenAngle = 6.283185);
		%feature("autodoc", "Args:
	X(Standard_ShortReal)
	Y(Standard_ShortReal)
	anXradius(Standard_ShortReal)
	anYradius(Standard_ShortReal)
	aStartAngle(Standard_ShortReal)=0.0
	anOpenAngle(Standard_ShortReal)=6.283185

Returns:
	virtual Standard_Boolean

Draws an filled Ellipsoid arc of center <X,Y> and Radius") DrawPolyArc;
		virtual Standard_Boolean DrawPolyArc (const Standard_ShortReal X,const Standard_ShortReal Y,const Standard_ShortReal anXradius,const Standard_ShortReal anYradius,const Standard_ShortReal aStartAngle = 0.0,const Standard_ShortReal anOpenAngle = 6.283185);
		%feature("autodoc", "Args:
	aNumber(Standard_Integer)

Returns:
	virtual void

Begin an incremental polyline primitive of <aNumber> of points .  
 Warning: Points must be added by the the DrawPoint() method.") BeginPolyline;
		virtual void BeginPolyline (const Standard_Integer aNumber);
		%feature("autodoc", "Args:
	aNumber(Standard_Integer)

Returns:
	virtual void

Begin an incremental polygon primitive of <aNumber> of points .  
 Warning: Points must be added by the the DrawPoint() method.") BeginPolygon;
		virtual void BeginPolygon (const Standard_Integer aNumber);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Begin a set of segments .  
 Warning: Segments must be added by the DrawSegment() method.") BeginSegments;
		virtual void BeginSegments ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Begin a set of circles or ellips .  
 Warning: Arcs must be added by the DrawArc() methods.") BeginArcs;
		virtual void BeginArcs ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Begin a set of polygon circles or ellips .  
 Warning: Arcs must be added by the DrawPolyArc() methods.") BeginPolyArcs;
		virtual void BeginPolyArcs ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Begin a set of markers .  
 Warning: Markers must be added by the DrawMarker() method.") BeginMarkers;
		virtual void BeginMarkers ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Begin a set of points .  
 Warning: Points must be added by the DrawPoint() method.") BeginPoints;
		virtual void BeginPoints ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Close the last Begining primitive") ClosePrimitive;
		virtual void ClosePrimitive ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Aspect_ColorMap

No detailed docstring for this function.") ColorMap;
		Handle_Aspect_ColorMap ColorMap ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Aspect_TypeMap

No detailed docstring for this function.") TypeMap;
		Handle_Aspect_TypeMap TypeMap ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Aspect_WidthMap

No detailed docstring for this function.") WidthMap;
		Handle_Aspect_WidthMap WidthMap ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Aspect_FontMap

No detailed docstring for this function.") FontMap;
		Handle_Aspect_FontMap FontMap ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Aspect_MarkMap

No detailed docstring for this function.") MarkMap;
		Handle_Aspect_MarkMap MarkMap ();
		%feature("autodoc", "Args:
	Width(Quantity_Length)
	Heigth(Quantity_Length)

Returns:
	virtual void

Returns the Available WorkSpace in DWU coordinates") WorkSpace;
		virtual void WorkSpace (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	PV(Standard_Integer)

Returns:
	virtual Quantity_Length

Returns the DWU value depending of  
         the PIXEL value.") Convert;
		virtual Quantity_Length Convert (const Standard_Integer PV);
		%feature("autodoc", "Args:
	DV(Quantity_Length)

Returns:
	virtual Standard_Integer

Returns the PIXEL value depending of  
         the DWU value.") Convert;
		virtual Standard_Integer Convert (const Quantity_Length DV);
		%feature("autodoc", "Args:
	PX(Standard_Integer)
	PY(Standard_Integer)
	DX(Quantity_Length)
	DY(Quantity_Length)

Returns:
	virtual void

Returns the DWU position depending of  
         the PIXEL position .") Convert;
		virtual void Convert (const Standard_Integer PX,const Standard_Integer PY,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	DX(Quantity_Length)
	DY(Quantity_Length)
	PX(Standard_Integer)
	PY(Standard_Integer)

Returns:
	virtual void

Returns the PIXEL position depending of  
         the DWU position .  Returns TRUE when the driver must use MDTV fonts  
//!	instead system fonts.") Convert;
		virtual void Convert (const Quantity_Length DX,const Quantity_Length DY,Standard_Integer &OutValue,Standard_Integer &OutValue);
};


%feature("shadow") Aspect_Driver::~Aspect_Driver %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Aspect_Driver {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Aspect_Driver {
	Handle_Aspect_Driver GetHandle() {
	return *(Handle_Aspect_Driver*) &$self;
	}
};

%nodefaultctor Handle_Aspect_Driver;
class Handle_Aspect_Driver : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Aspect_Driver();
        Handle_Aspect_Driver(const Handle_Aspect_Driver &aHandle);
        Handle_Aspect_Driver(const Aspect_Driver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Aspect_Driver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_Driver {
    Aspect_Driver* GetObject() {
    return (Aspect_Driver*)$self->Access();
    }
};
%feature("shadow") Handle_Aspect_Driver::~Handle_Aspect_Driver %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Aspect_Driver {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Aspect_Edge;
class Aspect_Edge {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an edge.") Aspect_Edge;
		 Aspect_Edge ();
		%feature("autodoc", "Args:
	AIndex1(Standard_Integer)
	AIndex2(Standard_Integer)
	AType(Aspect_TypeOfEdge)

Returns:
	None

Creates an edge from an index of vertices  
//!	    in a table of vertices.  
//!	    <AType> indicates if this edge is seen or not.  
 Warning: Raises EdgeDefinitionError if AIndex1 == AIndex2.") Aspect_Edge;
		 Aspect_Edge (const Standard_Integer AIndex1,const Standard_Integer AIndex2,const Aspect_TypeOfEdge AType);
		%feature("autodoc", "Args:
	AIndex1(Standard_Integer)
	AIndex2(Standard_Integer)
	AType(Aspect_TypeOfEdge)

Returns:
	None

Updates the values of an edge <self>.  
 Warning: Raises EdgeDefinitionError if AIndex1 == AIndex2.") SetValues;
		void SetValues (const Standard_Integer AIndex1,const Standard_Integer AIndex2,const Aspect_TypeOfEdge AType);
		%feature("autodoc", "Args:
	AIndex1(Standard_Integer)
	AIndex2(Standard_Integer)
	AType(Aspect_TypeOfEdge)

Returns:
	None

Returns the index of the vertices and the  
//!	    type of edge <self>.") Values;
		void Values (Standard_Integer &OutValue,Standard_Integer &OutValue,Aspect_TypeOfEdge & AType);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the index of the begin of the edge <self>.") FirstIndex;
		Standard_Integer FirstIndex ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the index of the end of the edge <self>.") LastIndex;
		Standard_Integer LastIndex ();
		%feature("autodoc", "Args:
	None
Returns:
	Aspect_TypeOfEdge

Returns the type of the edge <self>.") Type;
		Aspect_TypeOfEdge Type ();
};


%feature("shadow") Aspect_Edge::~Aspect_Edge %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Aspect_Edge {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Aspect_FontMap;
class Aspect_FontMap : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Aspect_FontMap;
		 Aspect_FontMap ();
		%feature("autodoc", "Args:
	AnEntry(Aspect_FontMapEntry)

Returns:
	None

Adds an entry in the font map <self>.  
 Warning: Raises BadAccess if FontMap size is exceeded.") AddEntry;
		void AddEntry (const Aspect_FontMapEntry & AnEntry);
		%feature("autodoc", "Args:
	aStyle(Aspect_FontStyle)

Returns:
	Standard_Integer

Search an identical font style entry in the font map <self>  
and returns the FontMapEntry Index if exist.  
Or add a new entry and returns the computed FontMapEntry index used.") AddEntry;
		Standard_Integer AddEntry (const Aspect_FontStyle & aStyle);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the Allocated fontmap Size") Size;
		Standard_Integer Size ();
		%feature("autodoc", "Args:
	aFontmapIndex(Standard_Integer)

Returns:
	Standard_Integer

Returns the FontMapEntry.Index of the FontMap  
         at rank <aFontmapIndex> .") Index;
		Standard_Integer Index (const Standard_Integer aFontmapIndex);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Dump;
		void Dump ();
		%feature("autodoc", "Args:
	AnIndex(Standard_Integer)

Returns:
	Aspect_FontMapEntry

Returns the Font map entry with the index <AnIndex>.  
 Warning: Raises BadAccess if the index less than 1  
//!	    or greater than Size.") Entry;
		Aspect_FontMapEntry Entry (const Standard_Integer AnIndex);
};


%feature("shadow") Aspect_FontMap::~Aspect_FontMap %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Aspect_FontMap {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Aspect_FontMap {
	Handle_Aspect_FontMap GetHandle() {
	return *(Handle_Aspect_FontMap*) &$self;
	}
};

%nodefaultctor Handle_Aspect_FontMap;
class Handle_Aspect_FontMap : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Aspect_FontMap();
        Handle_Aspect_FontMap(const Handle_Aspect_FontMap &aHandle);
        Handle_Aspect_FontMap(const Aspect_FontMap *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Aspect_FontMap DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_FontMap {
    Aspect_FontMap* GetObject() {
    return (Aspect_FontMap*)$self->Access();
    }
};
%feature("shadow") Handle_Aspect_FontMap::~Handle_Aspect_FontMap %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Aspect_FontMap {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Aspect_FontMapEntry;
class Aspect_FontMapEntry {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an unallocated fontmap entry") Aspect_FontMapEntry;
		 Aspect_FontMapEntry ();
		%feature("autodoc", "Args:
	index(Standard_Integer)
	style(Aspect_FontStyle)

Returns:
	None

Creates an allocated fontmap entry") Aspect_FontMapEntry;
		 Aspect_FontMapEntry (const Standard_Integer index,const Aspect_FontStyle & style);
		%feature("autodoc", "Args:
	entry(Aspect_FontMapEntry)

Returns:
	None

Creates an allocated fontmap entry.  
 Warning: Raises error if the fontmap entry <entry> is unallocated.") Aspect_FontMapEntry;
		 Aspect_FontMapEntry (const Aspect_FontMapEntry & entry);
		%feature("autodoc", "Args:
	index(Standard_Integer)
	style(Aspect_FontStyle)

Returns:
	None

Sets fontmap entry value and allocates it.") SetValue;
		void SetValue (const Standard_Integer index,const Aspect_FontStyle & style);
		%feature("autodoc", "Args:
	entry(Aspect_FontMapEntry)

Returns:
	None

Sets fontmap entry value and allocates it.") SetValue;
		void SetValue (const Aspect_FontMapEntry & entry);
		%feature("autodoc", "Args:
	entry(Aspect_FontMapEntry)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const Aspect_FontMapEntry & entry);
		%feature("autodoc", "Args:
	Style(Aspect_FontStyle)

Returns:
	None

Sets the line style of fontmap entry.") SetType;
		void SetType (const Aspect_FontStyle & Style);
		%feature("autodoc", "Args:
	None
Returns:
	Aspect_FontStyle

No detailed docstring for this function.") Type;
		const Aspect_FontStyle & Type ();
		%feature("autodoc", "Args:
	index(Standard_Integer)

Returns:
	None

Sets index value of a fontmap entry.") SetIndex;
		void SetIndex (const Standard_Integer index);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Index;
		Standard_Integer Index ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Unallocates the fontmap entry.") Free;
		void Free ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the fontmap entry is allocated.  
 Warning: A fontmap entry is allocated when the font and  
//!	    the index is defined.") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Dump;
		void Dump ();
};


%feature("shadow") Aspect_FontMapEntry::~Aspect_FontMapEntry %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Aspect_FontMapEntry {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Aspect_FontStyle;
class Aspect_FontStyle {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a font style with the default values of  
//!	    FontStyle type : DEFAULT") Aspect_FontStyle;
		 Aspect_FontStyle ();
		%feature("autodoc", "Args:
	Type(Aspect_TypeOfFont)
	Size(Quantity_Length)
	Slant(Quantity_PlaneAngle)=0.0
	CapsHeight(Standard_Boolean)=Standard_False

Returns:
	None

Creates the font style <Type> depending of  
//!	    Size given in the basic LENGTH unit and Slant in  
//!	    the basic PLANE ANGLE unit.  
//!	    When CapsHeight is TRUE the size defines the  
//!	    ascent height of the font;if FALSE,the size  
//!	    defines the ascent+descent part of the font.") Aspect_FontStyle;
		 Aspect_FontStyle (const Aspect_TypeOfFont Type,const Quantity_Length Size,const Quantity_PlaneAngle Slant = 0.0,const Standard_Boolean CapsHeight = Standard_False);
		%feature("autodoc", "Args:
	Style(char *)
	Size(Quantity_Length)
	Slant(Quantity_PlaneAngle)=0.0
	CapsHeight(Standard_Boolean)=Standard_False

Returns:
	None

Creates a font style from Adobe font style descriptor  
//!	   depending of Size given in MM and Slant in RADIAN.  
//!	    When CapsHeight is TRUE the size defines the  
//!	    ascent height of the font;if FALSE,the size  
//!	    defines the ascent+descent part of the font.  
//!	    Font Style Descriptor must be :  
//!	       Simple form is 'family'      	Ex: 'helvetica'  
//!	       More complex form is 'family-weight' Ex: 'helvetica-bold'  
//!	       Full form is :  
//!		'-foundry-family-weight-slant-swdth-adstyl-pixelsize'  
//!		'-pointsize-resx-resy-spacing-avgWidth-registry-encoding'  
//!		where each field must be replaced by an '*'  
 Warning: create the smalest font size if the foundry height") Aspect_FontStyle;
		 Aspect_FontStyle (const char * Style,const Quantity_Length Size,const Quantity_PlaneAngle Slant = 0.0,const Standard_Boolean CapsHeight = Standard_False);
		%feature("autodoc", "Args:
	Style(char *)

Returns:
	None

Creates a transformable font with the full font name <Style>  
 given in the XLFD descriptor :  
'-foundry-family-weight-slant-swidth-adstyl-pixelsize-pointsize-  
 resx-resy-spacing-avdWidth-registry-encoding'.  
The fields pixelsize ,pointsize,resx,resy are sets to 0  
and all unknown fields sets to '*'.  
 Example: 'adobe-helvetica-bold-*-*-*-0-0-0-0-*-*-iso8859-*'  
 Warning: the height and slant of the font is supposed to be NULL  
and computed dynamically at the drawing text time.") Aspect_FontStyle;
		 Aspect_FontStyle (const char * Style);
		%feature("autodoc", "Args:
	Other(Aspect_FontStyle)

Returns:
	Aspect_FontStyle

Updates the font style <self> from the definition of the  
//!	    font style <Other>.") Assign;
		Aspect_FontStyle & Assign (const Aspect_FontStyle & Other);
		%feature("autodoc", "Args:
	Other(Aspect_FontStyle)

Returns:
	Aspect_FontStyle

No detailed docstring for this function.") operator=;
		Aspect_FontStyle & operator = (const Aspect_FontStyle & Other);
		%feature("autodoc", "Args:
	Type(Aspect_TypeOfFont)
	Size(Quantity_Length)
	Slant(Quantity_PlaneAngle)=0.0
	CapsHeight(Standard_Boolean)=Standard_False

Returns:
	None

Updates the font style <self> from the definition of the  
//!	    font style <Type>.") SetValues;
		void SetValues (const Aspect_TypeOfFont Type,const Quantity_Length Size,const Quantity_PlaneAngle Slant = 0.0,const Standard_Boolean CapsHeight = Standard_False);
		%feature("autodoc", "Args:
	Style(char *)
	Size(Quantity_Length)
	Slant(Quantity_PlaneAngle)=0.0
	CapsHeight(Standard_Boolean)=Standard_False

Returns:
	None

Updates a font style with the new Abode font descriptor  
 Warning: create the smalest font size if the foundry height") SetValues;
		void SetValues (const char * Style,const Quantity_Length Size,const Quantity_PlaneAngle Slant = 0.0,const Standard_Boolean CapsHeight = Standard_False);
		%feature("autodoc", "Args:
	Style(char *)

Returns:
	None

Updates a font style with the new XLFD font descriptor") SetValues;
		void SetValues (const char * Style);
		%feature("autodoc", "Args:
	aName(char *)

Returns:
	None

Sets the family of the font.") SetFamily;
		void SetFamily (const char * aName);
		%feature("autodoc", "Args:
	aName(char *)

Returns:
	None

Sets the weight of the font.") SetWeight;
		void SetWeight (const char * aName);
		%feature("autodoc", "Args:
	aName(char *)

Returns:
	None

Sets the registry of the font.") SetRegistry;
		void SetRegistry (const char * aName);
		%feature("autodoc", "Args:
	aName(char *)

Returns:
	None

Sets the encoding of the font.") SetEncoding;
		void SetEncoding (const char * aName);
		%feature("autodoc", "Args:
	None
Returns:
	Aspect_TypeOfFont

Returns the type of the font style <self>") Style;
		Aspect_TypeOfFont Style ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the string components length of the  
font style descriptor") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	char *

Returns the String component of a font style") Value;
		char * Value ();
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_Length

Returns the Size component of a font style") Size;
		Quantity_Length Size ();
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_PlaneAngle

Returns the Slant component of a font style") Slant;
		Quantity_PlaneAngle Slant ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the CapsHeight component of a font style") CapsHeight;
		Standard_Boolean CapsHeight ();
		%feature("autodoc", "Args:
	None
Returns:
	char *

Returns a shorter font name which identify the  
         main characteristics of the fonts.") AliasName;
		char * AliasName ();
		%feature("autodoc", "Args:
	None
Returns:
	char *

Returns the full normalized font name") FullName;
		char * FullName ();
		%feature("autodoc", "Args:
	None
Returns:
	char *

Returns the foundry of the font.") Foundry;
		char * Foundry ();
		%feature("autodoc", "Args:
	None
Returns:
	char *

Returns the family of the font.") Family;
		char * Family ();
		%feature("autodoc", "Args:
	None
Returns:
	char *

Returns the weight of the font.") Weight;
		char * Weight ();
		%feature("autodoc", "Args:
	None
Returns:
	char *

Returns the char set registry of the font.") Registry;
		char * Registry ();
		%feature("autodoc", "Args:
	None
Returns:
	char *

Returns the char set encoding of the font.") Encoding;
		char * Encoding ();
		%feature("autodoc", "Args:
	None
Returns:
	char *

Returns the slant of the font.") SSlant;
		char * SSlant ();
		%feature("autodoc", "Args:
	None
Returns:
	char *

Returns the width name of the font.") SWidth;
		char * SWidth ();
		%feature("autodoc", "Args:
	None
Returns:
	char *

Returns the style name of the font.") SStyle;
		char * SStyle ();
		%feature("autodoc", "Args:
	None
Returns:
	char *

Returns the pixel size of the font.") SPixelSize;
		char * SPixelSize ();
		%feature("autodoc", "Args:
	None
Returns:
	char *

Returns the point size of the font.") SPointSize;
		char * SPointSize ();
		%feature("autodoc", "Args:
	None
Returns:
	char *

Returns the resolution X of the font.") SResolutionX;
		char * SResolutionX ();
		%feature("autodoc", "Args:
	None
Returns:
	char *

Returns the resolution Y of the font.") SResolutionY;
		char * SResolutionY ();
		%feature("autodoc", "Args:
	None
Returns:
	char *

Returns the spacing of the font.") SSpacing;
		char * SSpacing ();
		%feature("autodoc", "Args:
	None
Returns:
	char *

Returns the average width of the font.") SAverageWidth;
		char * SAverageWidth ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Dumps the font attributes.") Dump;
		void Dump ();
		%feature("autodoc", "Args:
	Other(Aspect_FontStyle)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEqual;
		Standard_Boolean IsEqual (const Aspect_FontStyle & Other);

        %extend{
            bool __eq_wrapper__(const Aspect_FontStyle  other) {
            if (*self==other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __eq__(self,right):
            try:
                return self.__eq_wrapper__(right)
            except:
                return False
        }
        		%feature("autodoc", "Args:
	Other(Aspect_FontStyle)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsNotEqual;
		Standard_Boolean IsNotEqual (const Aspect_FontStyle & Other);

        %extend{
            bool __ne_wrapper__(const Aspect_FontStyle  other) {
            if (*self!=other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __ne__(self,right):
            try:
                return self.__ne_wrapper__(right)
            except:
                return True
        }
        };


%feature("shadow") Aspect_FontStyle::~Aspect_FontStyle %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Aspect_FontStyle {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Aspect_GenId;
class Aspect_GenId {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an available set of identifiers with the lower  
//!	    bound 0 and the upper bound INT_MAX/2.") Aspect_GenId;
		 Aspect_GenId ();
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

Creates an available set of identifiers with the lower  
//!	    bound <Low> and the upper bound <Up>.  
 Warning: Raises IdentDefinitionError if <Up> is less than <Low>.  Copies the content of <Other> into <self>.") Aspect_GenId;
		 Aspect_GenId (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	None
Returns:
	None

Frees all identifiers of <self>.") Free;
		void Free ();
		%feature("autodoc", "Args:
	Id(Standard_Integer)

Returns:
	None

Frees the identifier <Id> of <self>.") Free;
		void Free (const Standard_Integer Id);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of available identifiers of <self>.") Available;
		Standard_Integer Available ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the lower bound of <self>.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns an available identifier of <self>.  
 Warning: Raises IdentDefinitionError if all identifiers are busy.") Next;
		Standard_Integer Next ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the upper bound of <self>.") Upper;
		Standard_Integer Upper ();
};


%feature("shadow") Aspect_GenId::~Aspect_GenId %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Aspect_GenId {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Aspect_GraphicCallbackStruct;
class Aspect_GraphicCallbackStruct {
	public:
};


%feature("shadow") Aspect_GraphicCallbackStruct::~Aspect_GraphicCallbackStruct %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Aspect_GraphicCallbackStruct {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Aspect_Grid;
class Aspect_Grid : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	anOrigin(Quantity_Length)

Returns:
	None

defines the x Origin of the grid.") SetXOrigin;
		void SetXOrigin (const Quantity_Length anOrigin);
		%feature("autodoc", "Args:
	anOrigin(Quantity_Length)

Returns:
	None

defines the y Origin of the grid.") SetYOrigin;
		void SetYOrigin (const Quantity_Length anOrigin);
		%feature("autodoc", "Args:
	anAngle(Quantity_PlaneAngle)

Returns:
	None

defines the orientation of the the grid.") SetRotationAngle;
		void SetRotationAngle (const Quantity_PlaneAngle anAngle);
		%feature("autodoc", "Args:
	anAngle(Quantity_PlaneAngle)

Returns:
	None

Rotate the grid from a relative angle.") Rotate;
		void Rotate (const Quantity_PlaneAngle anAngle);
		%feature("autodoc", "Args:
	aDx(Quantity_Length)
	aDy(Quantity_Length)

Returns:
	None

Translate the grid from a relative distance.") Translate;
		void Translate (const Quantity_Length aDx,const Quantity_Length aDy);
		%feature("autodoc", "Args:
	aColor(Quantity_Color)
	aTenthColor(Quantity_Color)

Returns:
	virtual void

Change the colors of the grid") SetColors;
		virtual void SetColors (const Quantity_Color & aColor,const Quantity_Color & aTenthColor);
		%feature("autodoc", "Args:
	X(Quantity_Length)
	Y(Quantity_Length)
	gridX(Quantity_Length)
	gridY(Quantity_Length)

Returns:
	None

returns the point of the grid the closest to the point X,Y  
         if the grid is active. If the grid is not active returns  
         X,Y.") Hit;
		void Hit (const Quantity_Length X,const Quantity_Length Y,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	X(Quantity_Length)
	Y(Quantity_Length)
	gridX(Quantity_Length)
	gridY(Quantity_Length)

Returns:
	virtual void

returns the point of the grid the closest to the point X,Y") Compute;
		virtual void Compute (const Quantity_Length X,const Quantity_Length Y,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	None

activates the grid. The Hit method will return  
         gridx and gridx computed according to the steps  
         of the grid.") Activate;
		void Activate ();
		%feature("autodoc", "Args:
	None
Returns:
	None

deactivates the grid. The hit method will return  
         gridx and gridx as the enter value X & Y.") Deactivate;
		void Deactivate ();
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_Length

returns the x Origin of the grid.") XOrigin;
		Quantity_Length XOrigin ();
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_Length

returns the x Origin of the grid.") YOrigin;
		Quantity_Length YOrigin ();
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_PlaneAngle

returns the x Angle of the grid.") RotationAngle;
		Quantity_PlaneAngle RotationAngle ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns TRUE when the grid is active.") IsActive;
		Standard_Boolean IsActive ();
		%feature("autodoc", "Args:
	aColor(Quantity_Color)
	aTenthColor(Quantity_Color)

Returns:
	None

Returns the colors of the grid.") Colors;
		void Colors (Quantity_Color & aColor,Quantity_Color & aTenthColor);
		%feature("autodoc", "Args:
	aDrawMode(Aspect_GridDrawMode)

Returns:
	None

Change the grid aspect.") SetDrawMode;
		void SetDrawMode (const Aspect_GridDrawMode aDrawMode);
		%feature("autodoc", "Args:
	None
Returns:
	Aspect_GridDrawMode

Returns the grid aspect.") DrawMode;
		Aspect_GridDrawMode DrawMode ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Display the grid at screen.") Display;
		virtual void Display ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Erase the grid from screen.") Erase;
		virtual void Erase ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Returns TRUE when the grid is displayed at screen.") IsDisplayed;
		virtual Standard_Boolean IsDisplayed ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") Init;
		virtual void Init ();
};


%feature("shadow") Aspect_Grid::~Aspect_Grid %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Aspect_Grid {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Aspect_Grid {
	Handle_Aspect_Grid GetHandle() {
	return *(Handle_Aspect_Grid*) &$self;
	}
};

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
    Aspect_Grid* GetObject() {
    return (Aspect_Grid*)$self->Access();
    }
};
%feature("shadow") Handle_Aspect_Grid::~Handle_Aspect_Grid %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Aspect_Grid {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Aspect_LineStyle;
class Aspect_LineStyle {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a line style with the default value of  
//!	    LineStyle type : SOLID") Aspect_LineStyle;
		 Aspect_LineStyle ();
		%feature("autodoc", "Args:
	Type(Aspect_TypeOfLine)

Returns:
	None

Creates the line style <Type>.") Aspect_LineStyle;
		 Aspect_LineStyle (const Aspect_TypeOfLine Type);
		%feature("autodoc", "Args:
	Style(TColQuantity_Array1OfLength)

Returns:
	None

Creates a line style from METER Float style descriptor .  
//!	    Style Descriptor is :  
//!	    Each Odd float described the Drawn part of the style .  
//!	    Each Even float described the Hidden part of the style .  
//!	    (e.g) [0.010,0.002,0.005,0.004]  
//!		  Draw 10 MM ,Move 2 MM,Draw 5 MM ..") Aspect_LineStyle;
		 Aspect_LineStyle (const TColQuantity_Array1OfLength & Style);
		%feature("autodoc", "Args:
	Other(Aspect_LineStyle)

Returns:
	Aspect_LineStyle

Updates the line style <self> from the definition of the  
//!	    line style <Other>.") Assign;
		Aspect_LineStyle & Assign (const Aspect_LineStyle & Other);
		%feature("autodoc", "Args:
	Other(Aspect_LineStyle)

Returns:
	Aspect_LineStyle

No detailed docstring for this function.") operator=;
		Aspect_LineStyle & operator = (const Aspect_LineStyle & Other);
		%feature("autodoc", "Args:
	Type(Aspect_TypeOfLine)

Returns:
	None

Updates the line style <self> from the definition of the  
//!	    line style <Type>.") SetValues;
		void SetValues (const Aspect_TypeOfLine Type);
		%feature("autodoc", "Args:
	Style(TColQuantity_Array1OfLength)

Returns:
	None

Updates a line style with the new Float descriptor") SetValues;
		void SetValues (const TColQuantity_Array1OfLength & Style);
		%feature("autodoc", "Args:
	None
Returns:
	Aspect_TypeOfLine

Returns the type of the line style <self>") Style;
		Aspect_TypeOfLine Style ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the components length of the line style") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	TColQuantity_Array1OfLength

Returns the components of a line style") Values;
		const TColQuantity_Array1OfLength & Values ();
		%feature("autodoc", "Args:
	Other(Aspect_LineStyle)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEqual;
		Standard_Boolean IsEqual (const Aspect_LineStyle & Other);

        %extend{
            bool __eq_wrapper__(const Aspect_LineStyle  other) {
            if (*self==other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __eq__(self,right):
            try:
                return self.__eq_wrapper__(right)
            except:
                return False
        }
        		%feature("autodoc", "Args:
	Other(Aspect_LineStyle)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsNotEqual;
		Standard_Boolean IsNotEqual (const Aspect_LineStyle & Other);

        %extend{
            bool __ne_wrapper__(const Aspect_LineStyle  other) {
            if (*self!=other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __ne__(self,right):
            try:
                return self.__ne_wrapper__(right)
            except:
                return True
        }
        };


%feature("shadow") Aspect_LineStyle::~Aspect_LineStyle %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Aspect_LineStyle {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Aspect_MarkMap;
class Aspect_MarkMap : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Aspect_MarkMap;
		 Aspect_MarkMap ();
		%feature("autodoc", "Args:
	AnEntry(Aspect_MarkMapEntry)

Returns:
	None

Adds an entry in the mark map <self>.  
 Warning: Raises BadAccess if MarkMap size is exceeded.") AddEntry;
		void AddEntry (const Aspect_MarkMapEntry & AnEntry);
		%feature("autodoc", "Args:
	aStyle(Aspect_MarkerStyle)

Returns:
	Standard_Integer

Search an identical marker style entry in the mark map <self>  
and returns the MarkMapEntry Index if exist.  
Or add a new entry and returns the computed MarkMapEntry index used.") AddEntry;
		Standard_Integer AddEntry (const Aspect_MarkerStyle & aStyle);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the Allocated markmap Size") Size;
		Standard_Integer Size ();
		%feature("autodoc", "Args:
	aMarkmapIndex(Standard_Integer)

Returns:
	Standard_Integer

Returns the MarkMapEntry.Index of the MarkMap  
         at rank <aMarkmapIndex> .") Index;
		Standard_Integer Index (const Standard_Integer aMarkmapIndex);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Dump;
		void Dump ();
		%feature("autodoc", "Args:
	AnIndex(Standard_Integer)

Returns:
	Aspect_MarkMapEntry

Returns the Mark map entry with the index <AnIndex>.  
 Warning: Raises BadAccess if the index less than 1 or  
//!	    greater than Size.") Entry;
		Aspect_MarkMapEntry Entry (const Standard_Integer AnIndex);
};


%feature("shadow") Aspect_MarkMap::~Aspect_MarkMap %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Aspect_MarkMap {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Aspect_MarkMap {
	Handle_Aspect_MarkMap GetHandle() {
	return *(Handle_Aspect_MarkMap*) &$self;
	}
};

%nodefaultctor Handle_Aspect_MarkMap;
class Handle_Aspect_MarkMap : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Aspect_MarkMap();
        Handle_Aspect_MarkMap(const Handle_Aspect_MarkMap &aHandle);
        Handle_Aspect_MarkMap(const Aspect_MarkMap *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Aspect_MarkMap DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_MarkMap {
    Aspect_MarkMap* GetObject() {
    return (Aspect_MarkMap*)$self->Access();
    }
};
%feature("shadow") Handle_Aspect_MarkMap::~Handle_Aspect_MarkMap %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Aspect_MarkMap {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Aspect_MarkMapEntry;
class Aspect_MarkMapEntry {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an unallocated markmap entry") Aspect_MarkMapEntry;
		 Aspect_MarkMapEntry ();
		%feature("autodoc", "Args:
	index(Standard_Integer)
	style(Aspect_MarkerStyle)

Returns:
	None

Creates an allocated markmap entry") Aspect_MarkMapEntry;
		 Aspect_MarkMapEntry (const Standard_Integer index,const Aspect_MarkerStyle & style);
		%feature("autodoc", "Args:
	entry(Aspect_MarkMapEntry)

Returns:
	None

Creates an allocated markmap entry.  
 Warning: Raises error if the markmap entry <entry>  
//!	    is unallocated.") Aspect_MarkMapEntry;
		 Aspect_MarkMapEntry (const Aspect_MarkMapEntry & entry);
		%feature("autodoc", "Args:
	index(Standard_Integer)
	style(Aspect_MarkerStyle)

Returns:
	None

Sets markmap entry value and allocates it.") SetValue;
		void SetValue (const Standard_Integer index,const Aspect_MarkerStyle & style);
		%feature("autodoc", "Args:
	entry(Aspect_MarkMapEntry)

Returns:
	None

Sets markmap entry value and allocates it.") SetValue;
		void SetValue (const Aspect_MarkMapEntry & entry);
		%feature("autodoc", "Args:
	entry(Aspect_MarkMapEntry)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const Aspect_MarkMapEntry & entry);
		%feature("autodoc", "Args:
	Style(Aspect_MarkerStyle)

Returns:
	None

Sets the marker style of markmap entry.") SetStyle;
		void SetStyle (const Aspect_MarkerStyle & Style);
		%feature("autodoc", "Args:
	None
Returns:
	Aspect_MarkerStyle

No detailed docstring for this function.") Style;
		const Aspect_MarkerStyle & Style ();
		%feature("autodoc", "Args:
	index(Standard_Integer)

Returns:
	None

Sets index value of a markmap entry.") SetIndex;
		void SetIndex (const Standard_Integer index);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns index value of a markmap entry.  
 Warning: Raises error if the markmap entry is unallocated .") Index;
		Standard_Integer Index ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Unallocates the markmap entry.") Free;
		void Free ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the markmap entry is allocated.  
 Warning: A markmap entry is allocated when the marker and  
//!	    the index is defined.") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Dump;
		void Dump ();
};


%feature("shadow") Aspect_MarkMapEntry::~Aspect_MarkMapEntry %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Aspect_MarkMapEntry {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Aspect_MarkerStyle;
class Aspect_MarkerStyle {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a marker style with the default value of  
//!	    MarkerStyle type : POINT") Aspect_MarkerStyle;
		 Aspect_MarkerStyle ();
		%feature("autodoc", "Args:
	aType(Aspect_TypeOfMarker)

Returns:
	None

Creates the marker style <aType>.") Aspect_MarkerStyle;
		 Aspect_MarkerStyle (const Aspect_TypeOfMarker aType);
		%feature("autodoc", "Args:
	aXpoint(TColStd_Array1OfReal)
	aYpoint(TColStd_Array1OfReal)

Returns:
	None

Creates a marker style from a implicit draw point") Aspect_MarkerStyle;
		 Aspect_MarkerStyle (const TColStd_Array1OfReal & aXpoint,const TColStd_Array1OfReal & aYpoint);
		%feature("autodoc", "Args:
	aXpoint(TColStd_Array1OfReal)
	aYpoint(TColStd_Array1OfReal)
	aSpoint(TColStd_Array1OfBoolean)

Returns:
	None

Creates a marker style from a move-draw point descriptor .  
Each coordinate <aXpoint(i),aYpoint(i)> must be defined") Aspect_MarkerStyle;
		 Aspect_MarkerStyle (const TColStd_Array1OfReal & aXpoint,const TColStd_Array1OfReal & aYpoint,const TColStd_Array1OfBoolean & aSpoint);
		%feature("autodoc", "Args:
	Other(Aspect_MarkerStyle)

Returns:
	Aspect_MarkerStyle

Updates the marker style <self> from the definition of the  
         marker style <Other>.") Assign;
		Aspect_MarkerStyle & Assign (const Aspect_MarkerStyle & Other);
		%feature("autodoc", "Args:
	Other(Aspect_MarkerStyle)

Returns:
	Aspect_MarkerStyle

No detailed docstring for this function.") operator=;
		Aspect_MarkerStyle & operator = (const Aspect_MarkerStyle & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Aspect_TypeOfMarker

Returns the type of the marker style <self>") Type;
		Aspect_TypeOfMarker Type ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the components length of the marker descriptors") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	aRank(Standard_Integer)
	aX(Standard_Real)
	aY(Standard_Real)

Returns:
	Standard_Boolean

Returns the point and status of a marker style") Values;
		Standard_Boolean Values (const Standard_Integer aRank,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	TShort_Array1OfShortReal

Returns the X vector of a marker style descriptor") XValues;
		const TShort_Array1OfShortReal & XValues ();
		%feature("autodoc", "Args:
	None
Returns:
	TShort_Array1OfShortReal

Returns the Y vector of a marker style descriptor") YValues;
		const TShort_Array1OfShortReal & YValues ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_Array1OfBoolean

Returns the State vector of a marker style descriptor") SValues;
		const TColStd_Array1OfBoolean & SValues ();
		%feature("autodoc", "Args:
	Other(Aspect_MarkerStyle)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEqual;
		Standard_Boolean IsEqual (const Aspect_MarkerStyle & Other);

        %extend{
            bool __eq_wrapper__(const Aspect_MarkerStyle  other) {
            if (*self==other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __eq__(self,right):
            try:
                return self.__eq_wrapper__(right)
            except:
                return False
        }
        		%feature("autodoc", "Args:
	Other(Aspect_MarkerStyle)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsNotEqual;
		Standard_Boolean IsNotEqual (const Aspect_MarkerStyle & Other);

        %extend{
            bool __ne_wrapper__(const Aspect_MarkerStyle  other) {
            if (*self!=other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __ne__(self,right):
            try:
                return self.__ne_wrapper__(right)
            except:
                return True
        }
        };


%feature("shadow") Aspect_MarkerStyle::~Aspect_MarkerStyle %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Aspect_MarkerStyle {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Aspect_Pixel;
class Aspect_Pixel {
	public:

        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
        };


%feature("shadow") Aspect_Pixel::~Aspect_Pixel %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Aspect_Pixel {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Aspect_RGBPixel;
class Aspect_RGBPixel {
	public:
};


%feature("shadow") Aspect_RGBPixel::~Aspect_RGBPixel %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Aspect_RGBPixel {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Aspect_SequenceNodeOfSequenceOfColor;
class Aspect_SequenceNodeOfSequenceOfColor : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Quantity_Color)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Aspect_SequenceNodeOfSequenceOfColor;
		 Aspect_SequenceNodeOfSequenceOfColor (const Quantity_Color & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_Color

No detailed docstring for this function.") Value;
		Quantity_Color & Value ();
};


%feature("shadow") Aspect_SequenceNodeOfSequenceOfColor::~Aspect_SequenceNodeOfSequenceOfColor %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Aspect_SequenceNodeOfSequenceOfColor {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Aspect_SequenceNodeOfSequenceOfColor {
	Handle_Aspect_SequenceNodeOfSequenceOfColor GetHandle() {
	return *(Handle_Aspect_SequenceNodeOfSequenceOfColor*) &$self;
	}
};

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
    Aspect_SequenceNodeOfSequenceOfColor* GetObject() {
    return (Aspect_SequenceNodeOfSequenceOfColor*)$self->Access();
    }
};
%feature("shadow") Handle_Aspect_SequenceNodeOfSequenceOfColor::~Handle_Aspect_SequenceNodeOfSequenceOfColor %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Aspect_SequenceNodeOfSequenceOfColor {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Aspect_SequenceNodeOfSequenceOfColorMapEntry;
class Aspect_SequenceNodeOfSequenceOfColorMapEntry : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Aspect_ColorMapEntry)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Aspect_SequenceNodeOfSequenceOfColorMapEntry;
		 Aspect_SequenceNodeOfSequenceOfColorMapEntry (const Aspect_ColorMapEntry & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Aspect_ColorMapEntry

No detailed docstring for this function.") Value;
		Aspect_ColorMapEntry & Value ();
};


%feature("shadow") Aspect_SequenceNodeOfSequenceOfColorMapEntry::~Aspect_SequenceNodeOfSequenceOfColorMapEntry %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Aspect_SequenceNodeOfSequenceOfColorMapEntry {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Aspect_SequenceNodeOfSequenceOfColorMapEntry {
	Handle_Aspect_SequenceNodeOfSequenceOfColorMapEntry GetHandle() {
	return *(Handle_Aspect_SequenceNodeOfSequenceOfColorMapEntry*) &$self;
	}
};

%nodefaultctor Handle_Aspect_SequenceNodeOfSequenceOfColorMapEntry;
class Handle_Aspect_SequenceNodeOfSequenceOfColorMapEntry : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Aspect_SequenceNodeOfSequenceOfColorMapEntry();
        Handle_Aspect_SequenceNodeOfSequenceOfColorMapEntry(const Handle_Aspect_SequenceNodeOfSequenceOfColorMapEntry &aHandle);
        Handle_Aspect_SequenceNodeOfSequenceOfColorMapEntry(const Aspect_SequenceNodeOfSequenceOfColorMapEntry *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Aspect_SequenceNodeOfSequenceOfColorMapEntry DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_SequenceNodeOfSequenceOfColorMapEntry {
    Aspect_SequenceNodeOfSequenceOfColorMapEntry* GetObject() {
    return (Aspect_SequenceNodeOfSequenceOfColorMapEntry*)$self->Access();
    }
};
%feature("shadow") Handle_Aspect_SequenceNodeOfSequenceOfColorMapEntry::~Handle_Aspect_SequenceNodeOfSequenceOfColorMapEntry %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Aspect_SequenceNodeOfSequenceOfColorMapEntry {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Aspect_SequenceNodeOfSequenceOfFontMapEntry;
class Aspect_SequenceNodeOfSequenceOfFontMapEntry : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Aspect_FontMapEntry)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Aspect_SequenceNodeOfSequenceOfFontMapEntry;
		 Aspect_SequenceNodeOfSequenceOfFontMapEntry (const Aspect_FontMapEntry & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Aspect_FontMapEntry

No detailed docstring for this function.") Value;
		Aspect_FontMapEntry & Value ();
};


%feature("shadow") Aspect_SequenceNodeOfSequenceOfFontMapEntry::~Aspect_SequenceNodeOfSequenceOfFontMapEntry %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Aspect_SequenceNodeOfSequenceOfFontMapEntry {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Aspect_SequenceNodeOfSequenceOfFontMapEntry {
	Handle_Aspect_SequenceNodeOfSequenceOfFontMapEntry GetHandle() {
	return *(Handle_Aspect_SequenceNodeOfSequenceOfFontMapEntry*) &$self;
	}
};

%nodefaultctor Handle_Aspect_SequenceNodeOfSequenceOfFontMapEntry;
class Handle_Aspect_SequenceNodeOfSequenceOfFontMapEntry : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Aspect_SequenceNodeOfSequenceOfFontMapEntry();
        Handle_Aspect_SequenceNodeOfSequenceOfFontMapEntry(const Handle_Aspect_SequenceNodeOfSequenceOfFontMapEntry &aHandle);
        Handle_Aspect_SequenceNodeOfSequenceOfFontMapEntry(const Aspect_SequenceNodeOfSequenceOfFontMapEntry *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Aspect_SequenceNodeOfSequenceOfFontMapEntry DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_SequenceNodeOfSequenceOfFontMapEntry {
    Aspect_SequenceNodeOfSequenceOfFontMapEntry* GetObject() {
    return (Aspect_SequenceNodeOfSequenceOfFontMapEntry*)$self->Access();
    }
};
%feature("shadow") Handle_Aspect_SequenceNodeOfSequenceOfFontMapEntry::~Handle_Aspect_SequenceNodeOfSequenceOfFontMapEntry %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Aspect_SequenceNodeOfSequenceOfFontMapEntry {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Aspect_SequenceNodeOfSequenceOfMarkMapEntry;
class Aspect_SequenceNodeOfSequenceOfMarkMapEntry : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Aspect_MarkMapEntry)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Aspect_SequenceNodeOfSequenceOfMarkMapEntry;
		 Aspect_SequenceNodeOfSequenceOfMarkMapEntry (const Aspect_MarkMapEntry & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Aspect_MarkMapEntry

No detailed docstring for this function.") Value;
		Aspect_MarkMapEntry & Value ();
};


%feature("shadow") Aspect_SequenceNodeOfSequenceOfMarkMapEntry::~Aspect_SequenceNodeOfSequenceOfMarkMapEntry %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Aspect_SequenceNodeOfSequenceOfMarkMapEntry {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Aspect_SequenceNodeOfSequenceOfMarkMapEntry {
	Handle_Aspect_SequenceNodeOfSequenceOfMarkMapEntry GetHandle() {
	return *(Handle_Aspect_SequenceNodeOfSequenceOfMarkMapEntry*) &$self;
	}
};

%nodefaultctor Handle_Aspect_SequenceNodeOfSequenceOfMarkMapEntry;
class Handle_Aspect_SequenceNodeOfSequenceOfMarkMapEntry : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Aspect_SequenceNodeOfSequenceOfMarkMapEntry();
        Handle_Aspect_SequenceNodeOfSequenceOfMarkMapEntry(const Handle_Aspect_SequenceNodeOfSequenceOfMarkMapEntry &aHandle);
        Handle_Aspect_SequenceNodeOfSequenceOfMarkMapEntry(const Aspect_SequenceNodeOfSequenceOfMarkMapEntry *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Aspect_SequenceNodeOfSequenceOfMarkMapEntry DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_SequenceNodeOfSequenceOfMarkMapEntry {
    Aspect_SequenceNodeOfSequenceOfMarkMapEntry* GetObject() {
    return (Aspect_SequenceNodeOfSequenceOfMarkMapEntry*)$self->Access();
    }
};
%feature("shadow") Handle_Aspect_SequenceNodeOfSequenceOfMarkMapEntry::~Handle_Aspect_SequenceNodeOfSequenceOfMarkMapEntry %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Aspect_SequenceNodeOfSequenceOfMarkMapEntry {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Aspect_SequenceNodeOfSequenceOfTypeMapEntry;
class Aspect_SequenceNodeOfSequenceOfTypeMapEntry : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Aspect_TypeMapEntry)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Aspect_SequenceNodeOfSequenceOfTypeMapEntry;
		 Aspect_SequenceNodeOfSequenceOfTypeMapEntry (const Aspect_TypeMapEntry & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Aspect_TypeMapEntry

No detailed docstring for this function.") Value;
		Aspect_TypeMapEntry & Value ();
};


%feature("shadow") Aspect_SequenceNodeOfSequenceOfTypeMapEntry::~Aspect_SequenceNodeOfSequenceOfTypeMapEntry %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Aspect_SequenceNodeOfSequenceOfTypeMapEntry {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Aspect_SequenceNodeOfSequenceOfTypeMapEntry {
	Handle_Aspect_SequenceNodeOfSequenceOfTypeMapEntry GetHandle() {
	return *(Handle_Aspect_SequenceNodeOfSequenceOfTypeMapEntry*) &$self;
	}
};

%nodefaultctor Handle_Aspect_SequenceNodeOfSequenceOfTypeMapEntry;
class Handle_Aspect_SequenceNodeOfSequenceOfTypeMapEntry : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Aspect_SequenceNodeOfSequenceOfTypeMapEntry();
        Handle_Aspect_SequenceNodeOfSequenceOfTypeMapEntry(const Handle_Aspect_SequenceNodeOfSequenceOfTypeMapEntry &aHandle);
        Handle_Aspect_SequenceNodeOfSequenceOfTypeMapEntry(const Aspect_SequenceNodeOfSequenceOfTypeMapEntry *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Aspect_SequenceNodeOfSequenceOfTypeMapEntry DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_SequenceNodeOfSequenceOfTypeMapEntry {
    Aspect_SequenceNodeOfSequenceOfTypeMapEntry* GetObject() {
    return (Aspect_SequenceNodeOfSequenceOfTypeMapEntry*)$self->Access();
    }
};
%feature("shadow") Handle_Aspect_SequenceNodeOfSequenceOfTypeMapEntry::~Handle_Aspect_SequenceNodeOfSequenceOfTypeMapEntry %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Aspect_SequenceNodeOfSequenceOfTypeMapEntry {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Aspect_SequenceNodeOfSequenceOfWidthMapEntry;
class Aspect_SequenceNodeOfSequenceOfWidthMapEntry : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Aspect_WidthMapEntry)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Aspect_SequenceNodeOfSequenceOfWidthMapEntry;
		 Aspect_SequenceNodeOfSequenceOfWidthMapEntry (const Aspect_WidthMapEntry & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Aspect_WidthMapEntry

No detailed docstring for this function.") Value;
		Aspect_WidthMapEntry & Value ();
};


%feature("shadow") Aspect_SequenceNodeOfSequenceOfWidthMapEntry::~Aspect_SequenceNodeOfSequenceOfWidthMapEntry %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Aspect_SequenceNodeOfSequenceOfWidthMapEntry {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Aspect_SequenceNodeOfSequenceOfWidthMapEntry {
	Handle_Aspect_SequenceNodeOfSequenceOfWidthMapEntry GetHandle() {
	return *(Handle_Aspect_SequenceNodeOfSequenceOfWidthMapEntry*) &$self;
	}
};

%nodefaultctor Handle_Aspect_SequenceNodeOfSequenceOfWidthMapEntry;
class Handle_Aspect_SequenceNodeOfSequenceOfWidthMapEntry : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Aspect_SequenceNodeOfSequenceOfWidthMapEntry();
        Handle_Aspect_SequenceNodeOfSequenceOfWidthMapEntry(const Handle_Aspect_SequenceNodeOfSequenceOfWidthMapEntry &aHandle);
        Handle_Aspect_SequenceNodeOfSequenceOfWidthMapEntry(const Aspect_SequenceNodeOfSequenceOfWidthMapEntry *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Aspect_SequenceNodeOfSequenceOfWidthMapEntry DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_SequenceNodeOfSequenceOfWidthMapEntry {
    Aspect_SequenceNodeOfSequenceOfWidthMapEntry* GetObject() {
    return (Aspect_SequenceNodeOfSequenceOfWidthMapEntry*)$self->Access();
    }
};
%feature("shadow") Handle_Aspect_SequenceNodeOfSequenceOfWidthMapEntry::~Handle_Aspect_SequenceNodeOfSequenceOfWidthMapEntry %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Aspect_SequenceNodeOfSequenceOfWidthMapEntry {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Aspect_SequenceOfColor;
class Aspect_SequenceOfColor : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Aspect_SequenceOfColor;
		 Aspect_SequenceOfColor ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Aspect_SequenceOfColor)

Returns:
	Aspect_SequenceOfColor

No detailed docstring for this function.") Assign;
		const Aspect_SequenceOfColor & Assign (const Aspect_SequenceOfColor & Other);
		%feature("autodoc", "Args:
	Other(Aspect_SequenceOfColor)

Returns:
	Aspect_SequenceOfColor

No detailed docstring for this function.") operator=;
		const Aspect_SequenceOfColor & operator = (const Aspect_SequenceOfColor & Other);
		%feature("autodoc", "Args:
	T(Quantity_Color)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Quantity_Color & T);
		%feature("autodoc", "Args:
	S(Aspect_SequenceOfColor)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Aspect_SequenceOfColor & S);
		%feature("autodoc", "Args:
	T(Quantity_Color)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Quantity_Color & T);
		%feature("autodoc", "Args:
	S(Aspect_SequenceOfColor)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Aspect_SequenceOfColor & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Quantity_Color)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Quantity_Color & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Aspect_SequenceOfColor)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Aspect_SequenceOfColor & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Quantity_Color)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Quantity_Color & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Aspect_SequenceOfColor)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Aspect_SequenceOfColor & S);
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_Color

No detailed docstring for this function.") First;
		const Quantity_Color & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_Color

No detailed docstring for this function.") Last;
		const Quantity_Color & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(Aspect_SequenceOfColor)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Aspect_SequenceOfColor & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Quantity_Color

No detailed docstring for this function.") Value;
		const Quantity_Color & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Quantity_Color)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Quantity_Color & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Quantity_Color

No detailed docstring for this function.") ChangeValue;
		Quantity_Color & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") Aspect_SequenceOfColor::~Aspect_SequenceOfColor %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Aspect_SequenceOfColor {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Aspect_SequenceOfColorMapEntry;
class Aspect_SequenceOfColorMapEntry : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Aspect_SequenceOfColorMapEntry;
		 Aspect_SequenceOfColorMapEntry ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Aspect_SequenceOfColorMapEntry)

Returns:
	Aspect_SequenceOfColorMapEntry

No detailed docstring for this function.") Assign;
		const Aspect_SequenceOfColorMapEntry & Assign (const Aspect_SequenceOfColorMapEntry & Other);
		%feature("autodoc", "Args:
	Other(Aspect_SequenceOfColorMapEntry)

Returns:
	Aspect_SequenceOfColorMapEntry

No detailed docstring for this function.") operator=;
		const Aspect_SequenceOfColorMapEntry & operator = (const Aspect_SequenceOfColorMapEntry & Other);
		%feature("autodoc", "Args:
	T(Aspect_ColorMapEntry)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Aspect_ColorMapEntry & T);
		%feature("autodoc", "Args:
	S(Aspect_SequenceOfColorMapEntry)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Aspect_SequenceOfColorMapEntry & S);
		%feature("autodoc", "Args:
	T(Aspect_ColorMapEntry)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Aspect_ColorMapEntry & T);
		%feature("autodoc", "Args:
	S(Aspect_SequenceOfColorMapEntry)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Aspect_SequenceOfColorMapEntry & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Aspect_ColorMapEntry)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Aspect_ColorMapEntry & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Aspect_SequenceOfColorMapEntry)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Aspect_SequenceOfColorMapEntry & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Aspect_ColorMapEntry)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Aspect_ColorMapEntry & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Aspect_SequenceOfColorMapEntry)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Aspect_SequenceOfColorMapEntry & S);
		%feature("autodoc", "Args:
	None
Returns:
	Aspect_ColorMapEntry

No detailed docstring for this function.") First;
		const Aspect_ColorMapEntry & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Aspect_ColorMapEntry

No detailed docstring for this function.") Last;
		const Aspect_ColorMapEntry & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(Aspect_SequenceOfColorMapEntry)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Aspect_SequenceOfColorMapEntry & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Aspect_ColorMapEntry

No detailed docstring for this function.") Value;
		const Aspect_ColorMapEntry & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Aspect_ColorMapEntry)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Aspect_ColorMapEntry & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Aspect_ColorMapEntry

No detailed docstring for this function.") ChangeValue;
		Aspect_ColorMapEntry & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") Aspect_SequenceOfColorMapEntry::~Aspect_SequenceOfColorMapEntry %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Aspect_SequenceOfColorMapEntry {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Aspect_SequenceOfFontMapEntry;
class Aspect_SequenceOfFontMapEntry : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Aspect_SequenceOfFontMapEntry;
		 Aspect_SequenceOfFontMapEntry ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Aspect_SequenceOfFontMapEntry)

Returns:
	Aspect_SequenceOfFontMapEntry

No detailed docstring for this function.") Assign;
		const Aspect_SequenceOfFontMapEntry & Assign (const Aspect_SequenceOfFontMapEntry & Other);
		%feature("autodoc", "Args:
	Other(Aspect_SequenceOfFontMapEntry)

Returns:
	Aspect_SequenceOfFontMapEntry

No detailed docstring for this function.") operator=;
		const Aspect_SequenceOfFontMapEntry & operator = (const Aspect_SequenceOfFontMapEntry & Other);
		%feature("autodoc", "Args:
	T(Aspect_FontMapEntry)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Aspect_FontMapEntry & T);
		%feature("autodoc", "Args:
	S(Aspect_SequenceOfFontMapEntry)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Aspect_SequenceOfFontMapEntry & S);
		%feature("autodoc", "Args:
	T(Aspect_FontMapEntry)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Aspect_FontMapEntry & T);
		%feature("autodoc", "Args:
	S(Aspect_SequenceOfFontMapEntry)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Aspect_SequenceOfFontMapEntry & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Aspect_FontMapEntry)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Aspect_FontMapEntry & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Aspect_SequenceOfFontMapEntry)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Aspect_SequenceOfFontMapEntry & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Aspect_FontMapEntry)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Aspect_FontMapEntry & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Aspect_SequenceOfFontMapEntry)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Aspect_SequenceOfFontMapEntry & S);
		%feature("autodoc", "Args:
	None
Returns:
	Aspect_FontMapEntry

No detailed docstring for this function.") First;
		const Aspect_FontMapEntry & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Aspect_FontMapEntry

No detailed docstring for this function.") Last;
		const Aspect_FontMapEntry & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(Aspect_SequenceOfFontMapEntry)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Aspect_SequenceOfFontMapEntry & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Aspect_FontMapEntry

No detailed docstring for this function.") Value;
		const Aspect_FontMapEntry & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Aspect_FontMapEntry)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Aspect_FontMapEntry & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Aspect_FontMapEntry

No detailed docstring for this function.") ChangeValue;
		Aspect_FontMapEntry & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") Aspect_SequenceOfFontMapEntry::~Aspect_SequenceOfFontMapEntry %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Aspect_SequenceOfFontMapEntry {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Aspect_SequenceOfMarkMapEntry;
class Aspect_SequenceOfMarkMapEntry : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Aspect_SequenceOfMarkMapEntry;
		 Aspect_SequenceOfMarkMapEntry ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Aspect_SequenceOfMarkMapEntry)

Returns:
	Aspect_SequenceOfMarkMapEntry

No detailed docstring for this function.") Assign;
		const Aspect_SequenceOfMarkMapEntry & Assign (const Aspect_SequenceOfMarkMapEntry & Other);
		%feature("autodoc", "Args:
	Other(Aspect_SequenceOfMarkMapEntry)

Returns:
	Aspect_SequenceOfMarkMapEntry

No detailed docstring for this function.") operator=;
		const Aspect_SequenceOfMarkMapEntry & operator = (const Aspect_SequenceOfMarkMapEntry & Other);
		%feature("autodoc", "Args:
	T(Aspect_MarkMapEntry)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Aspect_MarkMapEntry & T);
		%feature("autodoc", "Args:
	S(Aspect_SequenceOfMarkMapEntry)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Aspect_SequenceOfMarkMapEntry & S);
		%feature("autodoc", "Args:
	T(Aspect_MarkMapEntry)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Aspect_MarkMapEntry & T);
		%feature("autodoc", "Args:
	S(Aspect_SequenceOfMarkMapEntry)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Aspect_SequenceOfMarkMapEntry & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Aspect_MarkMapEntry)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Aspect_MarkMapEntry & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Aspect_SequenceOfMarkMapEntry)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Aspect_SequenceOfMarkMapEntry & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Aspect_MarkMapEntry)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Aspect_MarkMapEntry & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Aspect_SequenceOfMarkMapEntry)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Aspect_SequenceOfMarkMapEntry & S);
		%feature("autodoc", "Args:
	None
Returns:
	Aspect_MarkMapEntry

No detailed docstring for this function.") First;
		const Aspect_MarkMapEntry & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Aspect_MarkMapEntry

No detailed docstring for this function.") Last;
		const Aspect_MarkMapEntry & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(Aspect_SequenceOfMarkMapEntry)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Aspect_SequenceOfMarkMapEntry & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Aspect_MarkMapEntry

No detailed docstring for this function.") Value;
		const Aspect_MarkMapEntry & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Aspect_MarkMapEntry)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Aspect_MarkMapEntry & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Aspect_MarkMapEntry

No detailed docstring for this function.") ChangeValue;
		Aspect_MarkMapEntry & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") Aspect_SequenceOfMarkMapEntry::~Aspect_SequenceOfMarkMapEntry %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Aspect_SequenceOfMarkMapEntry {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Aspect_SequenceOfTypeMapEntry;
class Aspect_SequenceOfTypeMapEntry : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Aspect_SequenceOfTypeMapEntry;
		 Aspect_SequenceOfTypeMapEntry ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Aspect_SequenceOfTypeMapEntry)

Returns:
	Aspect_SequenceOfTypeMapEntry

No detailed docstring for this function.") Assign;
		const Aspect_SequenceOfTypeMapEntry & Assign (const Aspect_SequenceOfTypeMapEntry & Other);
		%feature("autodoc", "Args:
	Other(Aspect_SequenceOfTypeMapEntry)

Returns:
	Aspect_SequenceOfTypeMapEntry

No detailed docstring for this function.") operator=;
		const Aspect_SequenceOfTypeMapEntry & operator = (const Aspect_SequenceOfTypeMapEntry & Other);
		%feature("autodoc", "Args:
	T(Aspect_TypeMapEntry)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Aspect_TypeMapEntry & T);
		%feature("autodoc", "Args:
	S(Aspect_SequenceOfTypeMapEntry)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Aspect_SequenceOfTypeMapEntry & S);
		%feature("autodoc", "Args:
	T(Aspect_TypeMapEntry)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Aspect_TypeMapEntry & T);
		%feature("autodoc", "Args:
	S(Aspect_SequenceOfTypeMapEntry)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Aspect_SequenceOfTypeMapEntry & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Aspect_TypeMapEntry)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Aspect_TypeMapEntry & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Aspect_SequenceOfTypeMapEntry)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Aspect_SequenceOfTypeMapEntry & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Aspect_TypeMapEntry)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Aspect_TypeMapEntry & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Aspect_SequenceOfTypeMapEntry)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Aspect_SequenceOfTypeMapEntry & S);
		%feature("autodoc", "Args:
	None
Returns:
	Aspect_TypeMapEntry

No detailed docstring for this function.") First;
		const Aspect_TypeMapEntry & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Aspect_TypeMapEntry

No detailed docstring for this function.") Last;
		const Aspect_TypeMapEntry & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(Aspect_SequenceOfTypeMapEntry)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Aspect_SequenceOfTypeMapEntry & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Aspect_TypeMapEntry

No detailed docstring for this function.") Value;
		const Aspect_TypeMapEntry & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Aspect_TypeMapEntry)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Aspect_TypeMapEntry & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Aspect_TypeMapEntry

No detailed docstring for this function.") ChangeValue;
		Aspect_TypeMapEntry & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") Aspect_SequenceOfTypeMapEntry::~Aspect_SequenceOfTypeMapEntry %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Aspect_SequenceOfTypeMapEntry {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Aspect_SequenceOfWidthMapEntry;
class Aspect_SequenceOfWidthMapEntry : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Aspect_SequenceOfWidthMapEntry;
		 Aspect_SequenceOfWidthMapEntry ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Aspect_SequenceOfWidthMapEntry)

Returns:
	Aspect_SequenceOfWidthMapEntry

No detailed docstring for this function.") Assign;
		const Aspect_SequenceOfWidthMapEntry & Assign (const Aspect_SequenceOfWidthMapEntry & Other);
		%feature("autodoc", "Args:
	Other(Aspect_SequenceOfWidthMapEntry)

Returns:
	Aspect_SequenceOfWidthMapEntry

No detailed docstring for this function.") operator=;
		const Aspect_SequenceOfWidthMapEntry & operator = (const Aspect_SequenceOfWidthMapEntry & Other);
		%feature("autodoc", "Args:
	T(Aspect_WidthMapEntry)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Aspect_WidthMapEntry & T);
		%feature("autodoc", "Args:
	S(Aspect_SequenceOfWidthMapEntry)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Aspect_SequenceOfWidthMapEntry & S);
		%feature("autodoc", "Args:
	T(Aspect_WidthMapEntry)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Aspect_WidthMapEntry & T);
		%feature("autodoc", "Args:
	S(Aspect_SequenceOfWidthMapEntry)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Aspect_SequenceOfWidthMapEntry & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Aspect_WidthMapEntry)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Aspect_WidthMapEntry & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Aspect_SequenceOfWidthMapEntry)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Aspect_SequenceOfWidthMapEntry & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Aspect_WidthMapEntry)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Aspect_WidthMapEntry & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Aspect_SequenceOfWidthMapEntry)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Aspect_SequenceOfWidthMapEntry & S);
		%feature("autodoc", "Args:
	None
Returns:
	Aspect_WidthMapEntry

No detailed docstring for this function.") First;
		const Aspect_WidthMapEntry & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Aspect_WidthMapEntry

No detailed docstring for this function.") Last;
		const Aspect_WidthMapEntry & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(Aspect_SequenceOfWidthMapEntry)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Aspect_SequenceOfWidthMapEntry & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Aspect_WidthMapEntry

No detailed docstring for this function.") Value;
		const Aspect_WidthMapEntry & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Aspect_WidthMapEntry)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Aspect_WidthMapEntry & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Aspect_WidthMapEntry

No detailed docstring for this function.") ChangeValue;
		Aspect_WidthMapEntry & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") Aspect_SequenceOfWidthMapEntry::~Aspect_SequenceOfWidthMapEntry %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Aspect_SequenceOfWidthMapEntry {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Aspect_TypeMap;
class Aspect_TypeMap : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Aspect_TypeMap;
		 Aspect_TypeMap ();
		%feature("autodoc", "Args:
	AnEntry(Aspect_TypeMapEntry)

Returns:
	None

Adds an entry in the type map <self>.  
 Warning: Raises BadAccess if TypeMap size is exceeded.") AddEntry;
		void AddEntry (const Aspect_TypeMapEntry & AnEntry);
		%feature("autodoc", "Args:
	aStyle(Aspect_LineStyle)

Returns:
	Standard_Integer

Search an identical type style entry in the type map <self>  
and returns the TypeMapEntry Index if exist.  
Or add a new entry and returns the computed TypeMapEntry index used.") AddEntry;
		Standard_Integer AddEntry (const Aspect_LineStyle & aStyle);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the Allocated typemap Size") Size;
		Standard_Integer Size ();
		%feature("autodoc", "Args:
	aTypemapIndex(Standard_Integer)

Returns:
	Standard_Integer

Returns the TypeMapEntry.Index of the TypeMap  
         at rank <aTypemapIndex> .") Index;
		Standard_Integer Index (const Standard_Integer aTypemapIndex);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Dump;
		void Dump ();
		%feature("autodoc", "Args:
	AnIndex(Standard_Integer)

Returns:
	Aspect_TypeMapEntry

Returns the Type map entry with the index <AnIndex>.  
 Warning: Raises BadAccess if the index less than 1 or  
//!	    greater than Size.") Entry;
		const Aspect_TypeMapEntry & Entry (const Standard_Integer AnIndex);
};


%feature("shadow") Aspect_TypeMap::~Aspect_TypeMap %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Aspect_TypeMap {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Aspect_TypeMap {
	Handle_Aspect_TypeMap GetHandle() {
	return *(Handle_Aspect_TypeMap*) &$self;
	}
};

%nodefaultctor Handle_Aspect_TypeMap;
class Handle_Aspect_TypeMap : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Aspect_TypeMap();
        Handle_Aspect_TypeMap(const Handle_Aspect_TypeMap &aHandle);
        Handle_Aspect_TypeMap(const Aspect_TypeMap *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Aspect_TypeMap DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_TypeMap {
    Aspect_TypeMap* GetObject() {
    return (Aspect_TypeMap*)$self->Access();
    }
};
%feature("shadow") Handle_Aspect_TypeMap::~Handle_Aspect_TypeMap %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Aspect_TypeMap {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Aspect_TypeMapEntry;
class Aspect_TypeMapEntry {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an unallocated typemap entry") Aspect_TypeMapEntry;
		 Aspect_TypeMapEntry ();
		%feature("autodoc", "Args:
	index(Standard_Integer)
	style(Aspect_LineStyle)

Returns:
	None

Creates an allocated typemap entry") Aspect_TypeMapEntry;
		 Aspect_TypeMapEntry (const Standard_Integer index,const Aspect_LineStyle & style);
		%feature("autodoc", "Args:
	entry(Aspect_TypeMapEntry)

Returns:
	None

Creates an allocated typemap entry.  
 Warning: Raises error if the typemap entry <entry>  
//!	    is unallocated.") Aspect_TypeMapEntry;
		 Aspect_TypeMapEntry (const Aspect_TypeMapEntry & entry);
		%feature("autodoc", "Args:
	index(Standard_Integer)
	style(Aspect_LineStyle)

Returns:
	None

Sets typemap entry value and allocates it.") SetValue;
		void SetValue (const Standard_Integer index,const Aspect_LineStyle & style);
		%feature("autodoc", "Args:
	entry(Aspect_TypeMapEntry)

Returns:
	None

Sets typemap entry value and allocates it.") SetValue;
		void SetValue (const Aspect_TypeMapEntry & entry);
		%feature("autodoc", "Args:
	entry(Aspect_TypeMapEntry)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const Aspect_TypeMapEntry & entry);
		%feature("autodoc", "Args:
	Style(Aspect_LineStyle)

Returns:
	None

Sets the line style of typemap entry.") SetType;
		void SetType (const Aspect_LineStyle & Style);
		%feature("autodoc", "Args:
	None
Returns:
	Aspect_LineStyle

No detailed docstring for this function.") Type;
		const Aspect_LineStyle & Type ();
		%feature("autodoc", "Args:
	index(Standard_Integer)

Returns:
	None

Sets index value of a typemap entry.") SetIndex;
		void SetIndex (const Standard_Integer index);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns index value of a typemap entry.  
 Warning: Raises error if the typemap entry is unallocated .") Index;
		Standard_Integer Index ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Unallocates the typemap entry.") Free;
		void Free ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the typemap entry is allocated.  
 Warning: A typemap entry is allocated when the type and  
//!	    the index is defined.") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Dump;
		void Dump ();
};


%feature("shadow") Aspect_TypeMapEntry::~Aspect_TypeMapEntry %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Aspect_TypeMapEntry {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Aspect_WidthMap;
class Aspect_WidthMap : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a width map.") Aspect_WidthMap;
		 Aspect_WidthMap ();
		%feature("autodoc", "Args:
	AnEntry(Aspect_WidthMapEntry)

Returns:
	None

Adds an entry in the Width map <self>.  
 Warning: Raises BadAccess if WidthMap size is exceeded.") AddEntry;
		void AddEntry (const Aspect_WidthMapEntry & AnEntry);
		%feature("autodoc", "Args:
	aStyle(Aspect_WidthOfLine)

Returns:
	Standard_Integer

Search an identical line width entry in the width map <self>  
and returns the WidthMapEntry Index if exist.  
Or add a new entry and returns the computed WidthMapEntry index used.") AddEntry;
		Standard_Integer AddEntry (const Aspect_WidthOfLine aStyle);
		%feature("autodoc", "Args:
	aStyle(Quantity_Length)

Returns:
	Standard_Integer

Search an identical line width entry in the width map <self>  
and returns the WidthMapEntry Index if exist.  
Or add a new entry and returns the computed WidthMapEntry index used.") AddEntry;
		Standard_Integer AddEntry (const Quantity_Length aStyle);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the Allocated widthmap Size") Size;
		Standard_Integer Size ();
		%feature("autodoc", "Args:
	aWidthmapIndex(Standard_Integer)

Returns:
	Standard_Integer

Returns the WidthMapEntry.Index of the WidthMap  
         at rank <aWidthmapIndex> .") Index;
		Standard_Integer Index (const Standard_Integer aWidthmapIndex);
		%feature("autodoc", "Args:
	AnIndex(Standard_Integer)

Returns:
	Aspect_WidthMapEntry

Returns the Width map entry with the index <AnIndex>.  
 Warning: Raises BadAccess if the index less than 1 or  
//!	    greater than Size.") Entry;
		Aspect_WidthMapEntry Entry (const Standard_Integer AnIndex);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Dump;
		void Dump ();
};


%feature("shadow") Aspect_WidthMap::~Aspect_WidthMap %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Aspect_WidthMap {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Aspect_WidthMap {
	Handle_Aspect_WidthMap GetHandle() {
	return *(Handle_Aspect_WidthMap*) &$self;
	}
};

%nodefaultctor Handle_Aspect_WidthMap;
class Handle_Aspect_WidthMap : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Aspect_WidthMap();
        Handle_Aspect_WidthMap(const Handle_Aspect_WidthMap &aHandle);
        Handle_Aspect_WidthMap(const Aspect_WidthMap *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Aspect_WidthMap DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_WidthMap {
    Aspect_WidthMap* GetObject() {
    return (Aspect_WidthMap*)$self->Access();
    }
};
%feature("shadow") Handle_Aspect_WidthMap::~Handle_Aspect_WidthMap %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Aspect_WidthMap {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Aspect_WidthMapEntry;
class Aspect_WidthMapEntry {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an unallocated widthmap entry") Aspect_WidthMapEntry;
		 Aspect_WidthMapEntry ();
		%feature("autodoc", "Args:
	index(Standard_Integer)
	style(Aspect_WidthOfLine)

Returns:
	None

Creates an allocated widthmap entry from width style") Aspect_WidthMapEntry;
		 Aspect_WidthMapEntry (const Standard_Integer index,const Aspect_WidthOfLine style);
		%feature("autodoc", "Args:
	index(Standard_Integer)
	width(Quantity_Length)

Returns:
	None

Creates an allocated widthmap entry from width value") Aspect_WidthMapEntry;
		 Aspect_WidthMapEntry (const Standard_Integer index,const Quantity_Length width);
		%feature("autodoc", "Args:
	entry(Aspect_WidthMapEntry)

Returns:
	None

Creates an allocated widthmap entry.") Aspect_WidthMapEntry;
		 Aspect_WidthMapEntry (const Aspect_WidthMapEntry & entry);
		%feature("autodoc", "Args:
	index(Standard_Integer)
	style(Aspect_WidthOfLine)

Returns:
	None

Sets widthmap entry value from width style  
//!	    and allocates it.") SetValue;
		void SetValue (const Standard_Integer index,const Aspect_WidthOfLine style);
		%feature("autodoc", "Args:
	index(Standard_Integer)
	width(Quantity_Length)

Returns:
	None

Sets widthmap entry value from width value  
//!	    and allocates it.") SetValue;
		void SetValue (const Standard_Integer index,const Quantity_Length width);
		%feature("autodoc", "Args:
	entry(Aspect_WidthMapEntry)

Returns:
	None

Sets widthmap entry value and allocates it.") SetValue;
		void SetValue (const Aspect_WidthMapEntry & entry);
		%feature("autodoc", "Args:
	entry(Aspect_WidthMapEntry)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const Aspect_WidthMapEntry & entry);
		%feature("autodoc", "Args:
	index(Standard_Integer)

Returns:
	None

Sets index value of a widthmap entry.") SetIndex;
		void SetIndex (const Standard_Integer index);
		%feature("autodoc", "Args:
	Style(Aspect_WidthOfLine)

Returns:
	None

Sets width style of widthmap entry.") SetType;
		void SetType (const Aspect_WidthOfLine Style);
		%feature("autodoc", "Args:
	Width(Quantity_Length)

Returns:
	None

Sets width value of widthmap entry.") SetWidth;
		void SetWidth (const Quantity_Length Width);
		%feature("autodoc", "Args:
	None
Returns:
	Aspect_WidthOfLine

No detailed docstring for this function.") Type;
		Aspect_WidthOfLine Type ();
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_Length

Returns width value of widthmap entry.  
 Warning: Raises error if the widthmap entry is unallocated .") Width;
		Quantity_Length Width ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns index value of a widthmap entry.  
 Warning: Raises error if the widthmap entry is unallocated .") Index;
		Standard_Integer Index ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Unallocates the widthmap entry.") Free;
		void Free ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the widthmap entry is allocated.  
 Warning: A widthmap entry is allocated when the width and  
//!	    the index is defined.") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Dump;
		void Dump ();
};


%feature("shadow") Aspect_WidthMapEntry::~Aspect_WidthMapEntry %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Aspect_WidthMapEntry {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Aspect_Window;
class Aspect_Window : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	ABack(Aspect_Background)

Returns:
	None

Modifies the window background.") SetBackground;
		void SetBackground (const Aspect_Background & ABack);
		%feature("autodoc", "Args:
	theNameOfColor(Quantity_NameOfColor)

Returns:
	None

Modifies the window background from a Named Color.") SetBackground;
		void SetBackground (const Quantity_NameOfColor theNameOfColor);
		%feature("autodoc", "Args:
	color(Quantity_Color)

Returns:
	None

Modifies the window background.") SetBackground;
		void SetBackground (const Quantity_Color & color);
		%feature("autodoc", "Args:
	ABackground(Aspect_GradientBackground)

Returns:
	None

Modifies the window gradient background.") SetBackground;
		void SetBackground (const Aspect_GradientBackground & ABackground);
		%feature("autodoc", "Args:
	theFirstColor(Quantity_Color)
	theSecondColor(Quantity_Color)
	theFillMethod(Aspect_GradientFillMethod)

Returns:
	None

Modifies the window gradient background.") SetBackground;
		void SetBackground (const Quantity_Color & theFirstColor,const Quantity_Color & theSecondColor,const Aspect_GradientFillMethod theFillMethod);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Opens the window <self>.") Map;
		virtual void Map ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Closes the window <self>.") Unmap;
		virtual void Unmap ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Aspect_TypeOfResize

Apply the resizing to the window <self>.") DoResize;
		virtual Aspect_TypeOfResize DoResize ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Apply the mapping change to the window <self>.  
and returns TRUE if the window is mapped at screen.") DoMapping;
		virtual Standard_Boolean DoMapping ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Destroy the Window") Destroy;
		virtual void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	Aspect_Background

Returns the window background.") Background;
		Aspect_Background Background ();
		%feature("autodoc", "Args:
	None
Returns:
	Aspect_FillMethod

Returns the current image background fill mode.") BackgroundFillMethod;
		Aspect_FillMethod BackgroundFillMethod ();
		%feature("autodoc", "Args:
	None
Returns:
	Aspect_GradientBackground

Returns the window gradient background.") GradientBackground;
		Aspect_GradientBackground GradientBackground ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Returns True if the window <self> is opened  
//!	    and False if the window is closed.") IsMapped;
		virtual Standard_Boolean IsMapped ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the window <self> is virtual") IsVirtual;
		Standard_Boolean IsVirtual ();
		%feature("autodoc", "Args:
	theVirtual(Standard_Boolean)

Returns:
	None

Setup the virtual state") SetVirtual;
		void SetVirtual (const Standard_Boolean theVirtual);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Quantity_Ratio

Returns The Window RATIO equal to the physical  
//!	    WIDTH/HEIGHT dimensions") Ratio;
		virtual Quantity_Ratio Ratio ();
		%feature("autodoc", "Args:
	X1(Standard_Integer)
	Y1(Standard_Integer)
	X2(Standard_Integer)
	Y2(Standard_Integer)

Returns:
	virtual void

Returns The Window POSITION in PIXEL") Position;
		virtual void Position (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	Width(Standard_Integer)
	Height(Standard_Integer)

Returns:
	virtual void

Returns The Window SIZE in PIXEL") Size;
		virtual void Size (Standard_Integer &OutValue,Standard_Integer &OutValue);
};


%feature("shadow") Aspect_Window::~Aspect_Window %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Aspect_Window {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Aspect_Window {
	Handle_Aspect_Window GetHandle() {
	return *(Handle_Aspect_Window*) &$self;
	}
};

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
    Aspect_Window* GetObject() {
    return (Aspect_Window*)$self->Access();
    }
};
%feature("shadow") Handle_Aspect_Window::~Handle_Aspect_Window %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Aspect_Window {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Aspect_CircularGrid;
class Aspect_CircularGrid : public Aspect_Grid {
	public:
		%feature("autodoc", "Args:
	aRadiusStep(Quantity_Length)
	aDivisionNumber(Standard_Integer)
	XOrigin(Quantity_Length)=0
	anYOrigin(Quantity_Length)=0
	aRotationAngle(Quantity_PlaneAngle)=0

Returns:
	None

creates a new grid. By default this grid is not  
         active.") Aspect_CircularGrid;
		 Aspect_CircularGrid (const Quantity_Length aRadiusStep,const Standard_Integer aDivisionNumber,const Quantity_Length XOrigin = 0,const Quantity_Length anYOrigin = 0,const Quantity_PlaneAngle aRotationAngle = 0);
		%feature("autodoc", "Args:
	aStep(Quantity_Length)

Returns:
	None

defines the x step of the grid.") SetRadiusStep;
		void SetRadiusStep (const Quantity_Length aStep);
		%feature("autodoc", "Args:
	aNumber(Standard_Integer)

Returns:
	None

defines the step of the grid.") SetDivisionNumber;
		void SetDivisionNumber (const Standard_Integer aNumber);
		%feature("autodoc", "Args:
	XOrigin(Quantity_Length)
	YOrigin(Quantity_Length)
	RadiusStep(Quantity_Length)
	DivisionNumber(Standard_Integer)
	RotationAngle(Quantity_PlaneAngle)

Returns:
	None

No detailed docstring for this function.") SetGridValues;
		void SetGridValues (const Quantity_Length XOrigin,const Quantity_Length YOrigin,const Quantity_Length RadiusStep,const Standard_Integer DivisionNumber,const Quantity_PlaneAngle RotationAngle);
		%feature("autodoc", "Args:
	X(Quantity_Length)
	Y(Quantity_Length)
	gridX(Quantity_Length)
	gridY(Quantity_Length)

Returns:
	None

returns the point of the grid the closest to the point X,Y") Compute;
		void Compute (const Quantity_Length X,const Quantity_Length Y,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_Length

returns the x step of the grid.") RadiusStep;
		Quantity_Length RadiusStep ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

returns the x step of the grid.") DivisionNumber;
		Standard_Integer DivisionNumber ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Init;
		void Init ();
};


%feature("shadow") Aspect_CircularGrid::~Aspect_CircularGrid %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Aspect_CircularGrid {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Aspect_CircularGrid {
	Handle_Aspect_CircularGrid GetHandle() {
	return *(Handle_Aspect_CircularGrid*) &$self;
	}
};

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
    Aspect_CircularGrid* GetObject() {
    return (Aspect_CircularGrid*)$self->Access();
    }
};
%feature("shadow") Handle_Aspect_CircularGrid::~Handle_Aspect_CircularGrid %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Aspect_CircularGrid {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Aspect_ColorCubeColorMap;
class Aspect_ColorCubeColorMap : public Aspect_ColorMap {
	public:
		%feature("autodoc", "Args:
	base_pixel(Standard_Integer)
	redmax(Standard_Integer)
	redmult(Standard_Integer)
	greenmax(Standard_Integer)
	greenmult(Standard_Integer)
	bluemax(Standard_Integer)
	bluemult(Standard_Integer)

Returns:
	None

Create a ColorCube ColorMap.") Aspect_ColorCubeColorMap;
		 Aspect_ColorCubeColorMap (const Standard_Integer base_pixel,const Standard_Integer redmax,const Standard_Integer redmult,const Standard_Integer greenmax,const Standard_Integer greenmult,const Standard_Integer bluemax,const Standard_Integer bluemult);
		%feature("autodoc", "Args:
	base_pixel(Standard_Integer)
	redmax(Standard_Integer)
	redmult(Standard_Integer)
	greenmax(Standard_Integer)
	greenmult(Standard_Integer)
	bluemax(Standard_Integer)
	bluemult(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ColorCubeDefinition;
		void ColorCubeDefinition (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	AColorMapEntryIndex(Standard_Integer)

Returns:
	Standard_Integer

Returns the index in the ColorMap of the  
//!	    ColorMapEntry.Index() equal to <AnEntryIndex>.  
 Warning: Raises BadAccess if the index is not defined in the  
//!	    ColorMap.") FindColorMapIndex;
		Standard_Integer FindColorMapIndex (const Standard_Integer AColorMapEntryIndex);
		%feature("autodoc", "Args:
	AColorMapEntryIndex(Standard_Integer)

Returns:
	Aspect_ColorMapEntry

Returns the ColorMapEntry with ColorMapEntry.Index()  
//!	    equal to <AnEntryIndex>.  
 Warning: Raises BadAccess if the index is not defined in the  
//!	    ColorMap.") FindEntry;
		const Aspect_ColorMapEntry & FindEntry (const Standard_Integer AColorMapEntryIndex);
		%feature("autodoc", "Args:
	aColor(Quantity_Color)

Returns:
	Standard_Integer

Returns the index in the ColorMap of the nearest  
//!	    matching ColorMapEntry") NearestColorMapIndex;
		Standard_Integer NearestColorMapIndex (const Quantity_Color & aColor);
		%feature("autodoc", "Args:
	aColor(Quantity_Color)

Returns:
	Aspect_ColorMapEntry

Returns the nearest ColorMapEntry that match aColor .") NearestEntry;
		const Aspect_ColorMapEntry & NearestEntry (const Quantity_Color & aColor);
		%feature("autodoc", "Args:
	aColor(Quantity_Color)

Returns:
	Standard_Integer

Search an identical color entry in the color map <self>  
or returns the nearest ColorMapEntry Index.") AddEntry;
		Standard_Integer AddEntry (const Quantity_Color & aColor);
};


%feature("shadow") Aspect_ColorCubeColorMap::~Aspect_ColorCubeColorMap %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Aspect_ColorCubeColorMap {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Aspect_ColorCubeColorMap {
	Handle_Aspect_ColorCubeColorMap GetHandle() {
	return *(Handle_Aspect_ColorCubeColorMap*) &$self;
	}
};

%nodefaultctor Handle_Aspect_ColorCubeColorMap;
class Handle_Aspect_ColorCubeColorMap : public Handle_Aspect_ColorMap {

    public:
        // constructors
        Handle_Aspect_ColorCubeColorMap();
        Handle_Aspect_ColorCubeColorMap(const Handle_Aspect_ColorCubeColorMap &aHandle);
        Handle_Aspect_ColorCubeColorMap(const Aspect_ColorCubeColorMap *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Aspect_ColorCubeColorMap DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_ColorCubeColorMap {
    Aspect_ColorCubeColorMap* GetObject() {
    return (Aspect_ColorCubeColorMap*)$self->Access();
    }
};
%feature("shadow") Handle_Aspect_ColorCubeColorMap::~Handle_Aspect_ColorCubeColorMap %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Aspect_ColorCubeColorMap {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Aspect_ColorPixel;
class Aspect_ColorPixel : public Aspect_Pixel {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Aspect_ColorPixel;
		 Aspect_ColorPixel ();
		%feature("autodoc", "Args:
	aColor(Quantity_Color)

Returns:
	None

No detailed docstring for this function.") Aspect_ColorPixel;
		 Aspect_ColorPixel (const Quantity_Color & aColor);
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_Color

No detailed docstring for this function.") Value;
		const Quantity_Color & Value ();
		%feature("autodoc", "Args:
	aColor(Quantity_Color)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Quantity_Color & aColor);

        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
        		%feature("autodoc", "Args:
	Upper(Standard_Integer)

Returns:
	Standard_Integer

Returns a hashed value denoting <self>. This value is in  
        the range 1..<Upper>.") HashCode;
		Standard_Integer HashCode (const Standard_Integer Upper);

        %extend {
            Standard_Integer __hash__() {
            return $self->HashCode(2147483647);
            }
        };
        		%feature("autodoc", "Args:
	Other(Aspect_ColorPixel)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEqual;
		Standard_Boolean IsEqual (const Aspect_ColorPixel & Other);

        %extend{
            bool __eq_wrapper__(const Aspect_ColorPixel  other) {
            if (*self==other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __eq__(self,right):
            try:
                return self.__eq_wrapper__(right)
            except:
                return False
        }
        		%feature("autodoc", "Args:
	Other(Aspect_ColorPixel)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsNotEqual;
		Standard_Boolean IsNotEqual (const Aspect_ColorPixel & Other);

        %extend{
            bool __ne_wrapper__(const Aspect_ColorPixel  other) {
            if (*self!=other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __ne__(self,right):
            try:
                return self.__ne_wrapper__(right)
            except:
                return True
        }
        		%feature("autodoc", "Args:
	None
Returns:
	Quantity_Color

No detailed docstring for this function.") _CSFDB_GetAspect_ColorPixelmyColor;
		const Quantity_Color & _CSFDB_GetAspect_ColorPixelmyColor ();
};


%feature("shadow") Aspect_ColorPixel::~Aspect_ColorPixel %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Aspect_ColorPixel {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Aspect_ColorRampColorMap;
class Aspect_ColorRampColorMap : public Aspect_ColorMap {
	public:
		%feature("autodoc", "Args:
	basepixel(Standard_Integer)
	dimension(Standard_Integer)
	color(Quantity_Color)

Returns:
	None

Create a Color Ramp Colormap starting from Black at  
//!	     basepixel to color at basepixel+dimension-1.") Aspect_ColorRampColorMap;
		 Aspect_ColorRampColorMap (const Standard_Integer basepixel,const Standard_Integer dimension,const Quantity_Color & color);
		%feature("autodoc", "Args:
	basepixel(Standard_Integer)
	dimension(Standard_Integer)
	colorName(Quantity_NameOfColor)

Returns:
	None

Create a Color Ramp Colormap starting from Black at  
//!	     basepixel to color at basepixel+dimension-1.") Aspect_ColorRampColorMap;
		 Aspect_ColorRampColorMap (const Standard_Integer basepixel,const Standard_Integer dimension,const Quantity_NameOfColor colorName);
		%feature("autodoc", "Args:
	basepixel(Standard_Integer)
	dimension(Standard_Integer)
	color(Quantity_Color)

Returns:
	None

Get  Color Ramp Colormap definition .") ColorRampDefinition;
		void ColorRampDefinition (Standard_Integer &OutValue,Standard_Integer &OutValue,Quantity_Color & color);
		%feature("autodoc", "Args:
	ColorMapEntryIndex(Standard_Integer)

Returns:
	Standard_Integer

Returns the index in the ColorMap of the  
//!	    ColorMapEntry.Index() equal to <AnEntryIndex>.  
 Warning: Raises BadAccess if the index is not defined in the  
//!	    ColorMap.") FindColorMapIndex;
		Standard_Integer FindColorMapIndex (const Standard_Integer ColorMapEntryIndex);
		%feature("autodoc", "Args:
	AColorMapEntryIndex(Standard_Integer)

Returns:
	Aspect_ColorMapEntry

Returns the ColorMapEntry with ColorMapEntry.Index()  
//!	    equal to <AnEntryIndex>.  
 Warning: Raises BadAccess if the index is not defined in the  
//!	    ColorMap.") FindEntry;
		const Aspect_ColorMapEntry & FindEntry (const Standard_Integer AColorMapEntryIndex);
		%feature("autodoc", "Args:
	aColor(Quantity_Color)

Returns:
	Standard_Integer

Returns the index in the ColorMap of the  
//!	    nearest matching ColorMapEntry") NearestColorMapIndex;
		Standard_Integer NearestColorMapIndex (const Quantity_Color & aColor);
		%feature("autodoc", "Args:
	aColor(Quantity_Color)

Returns:
	Aspect_ColorMapEntry

Returns the nearest ColorMapEntry that match aColor .") NearestEntry;
		const Aspect_ColorMapEntry & NearestEntry (const Quantity_Color & aColor);
		%feature("autodoc", "Args:
	aColor(Quantity_Color)

Returns:
	Standard_Integer

Search an identical color entry in the color map <self>  
or returns the nearest ColorMapEntry Index.") AddEntry;
		Standard_Integer AddEntry (const Quantity_Color & aColor);
};


%feature("shadow") Aspect_ColorRampColorMap::~Aspect_ColorRampColorMap %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Aspect_ColorRampColorMap {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Aspect_ColorRampColorMap {
	Handle_Aspect_ColorRampColorMap GetHandle() {
	return *(Handle_Aspect_ColorRampColorMap*) &$self;
	}
};

%nodefaultctor Handle_Aspect_ColorRampColorMap;
class Handle_Aspect_ColorRampColorMap : public Handle_Aspect_ColorMap {

    public:
        // constructors
        Handle_Aspect_ColorRampColorMap();
        Handle_Aspect_ColorRampColorMap(const Handle_Aspect_ColorRampColorMap &aHandle);
        Handle_Aspect_ColorRampColorMap(const Aspect_ColorRampColorMap *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Aspect_ColorRampColorMap DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_ColorRampColorMap {
    Aspect_ColorRampColorMap* GetObject() {
    return (Aspect_ColorRampColorMap*)$self->Access();
    }
};
%feature("shadow") Handle_Aspect_ColorRampColorMap::~Handle_Aspect_ColorRampColorMap %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Aspect_ColorRampColorMap {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Aspect_GenericColorMap;
class Aspect_GenericColorMap : public Aspect_ColorMap {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a generic ColorMap .") Aspect_GenericColorMap;
		 Aspect_GenericColorMap ();
		%feature("autodoc", "Args:
	AnEntry(Aspect_ColorMapEntry)

Returns:
	None

Adds an entry in the color map <self>.  
 Warning: Raises BadAccess if the ColorMapEntry index is alreadry  
         defined.") AddEntry;
		void AddEntry (const Aspect_ColorMapEntry & AnEntry);
		%feature("autodoc", "Args:
	aColor(Quantity_Color)

Returns:
	Standard_Integer

Search an identical color entry in the color map <self>  
and returns the ColorMapEntry Index if exist.  
Or add a new entry and returns the computed ColorMapEntry index used.") AddEntry;
		Standard_Integer AddEntry (const Quantity_Color & aColor);
		%feature("autodoc", "Args:
	AColorMapEntryIndex(Standard_Integer)

Returns:
	None

Remove the ColorMapEntry at position index in the ColorMap  
 Warning: Raises BadAccess if the index is not defined in the  
//!	    ColorMap.") RemoveEntry;
		void RemoveEntry (const Standard_Integer AColorMapEntryIndex);
		%feature("autodoc", "Args:
	AColorMapEntryIndex(Standard_Integer)

Returns:
	Standard_Integer

Returns the index in the ColorMap of the  
//!	    ColorMapEntry.Index() equal to <AnEntryIndex>.  
 Warning: Raises BadAccess if the index is not defined in the  
//!	    ColorMap.") FindColorMapIndex;
		Standard_Integer FindColorMapIndex (const Standard_Integer AColorMapEntryIndex);
		%feature("autodoc", "Args:
	AColorMapEntryIndex(Standard_Integer)

Returns:
	Aspect_ColorMapEntry

Returns the ColorMapEntry with ColorMapEntry.Index()  
//!	    equal to <AnEntryIndex>.  
 Warning: Raises BadAccess if the index is not defined in the  
//!	    ColorMap.") FindEntry;
		const Aspect_ColorMapEntry & FindEntry (const Standard_Integer AColorMapEntryIndex);
		%feature("autodoc", "Args:
	aColor(Quantity_Color)

Returns:
	Standard_Integer

Returns the index in the ColorMap of the  
//!	    nearest matching ColorMapEntry") NearestColorMapIndex;
		Standard_Integer NearestColorMapIndex (const Quantity_Color & aColor);
		%feature("autodoc", "Args:
	aColor(Quantity_Color)

Returns:
	Aspect_ColorMapEntry

Returns the nearest ColorMapEntry that match aColor .") NearestEntry;
		const Aspect_ColorMapEntry & NearestEntry (const Quantity_Color & aColor);
};


%feature("shadow") Aspect_GenericColorMap::~Aspect_GenericColorMap %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Aspect_GenericColorMap {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Aspect_GenericColorMap {
	Handle_Aspect_GenericColorMap GetHandle() {
	return *(Handle_Aspect_GenericColorMap*) &$self;
	}
};

%nodefaultctor Handle_Aspect_GenericColorMap;
class Handle_Aspect_GenericColorMap : public Handle_Aspect_ColorMap {

    public:
        // constructors
        Handle_Aspect_GenericColorMap();
        Handle_Aspect_GenericColorMap(const Handle_Aspect_GenericColorMap &aHandle);
        Handle_Aspect_GenericColorMap(const Aspect_GenericColorMap *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Aspect_GenericColorMap DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_GenericColorMap {
    Aspect_GenericColorMap* GetObject() {
    return (Aspect_GenericColorMap*)$self->Access();
    }
};
%feature("shadow") Handle_Aspect_GenericColorMap::~Handle_Aspect_GenericColorMap %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Aspect_GenericColorMap {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Aspect_GradientBackground;
class Aspect_GradientBackground : public Aspect_Background {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a window gradient background.  
Default colors : Quantity_NOC_BLACK.  
Default fill method : Aspect_GFM_NONE") Aspect_GradientBackground;
		 Aspect_GradientBackground ();
		%feature("autodoc", "Args:
	AColor1(Quantity_Color)
	AColor2(Quantity_Color)
	AMethod(Aspect_GradientFillMethod)=Aspect_GFM_HOR

Returns:
	None

Creates a window gradient background with colours <AColor1, AColor2>.") Aspect_GradientBackground;
		 Aspect_GradientBackground (const Quantity_Color & AColor1,const Quantity_Color & AColor2,const Aspect_GradientFillMethod AMethod = Aspect_GFM_HOR);
		%feature("autodoc", "Args:
	AColor1(Quantity_Color)
	AColor2(Quantity_Color)
	AMethod(Aspect_GradientFillMethod)=Aspect_GFM_HOR

Returns:
	None

Modifies the colours of the window gradient background <self>.") SetColors;
		void SetColors (const Quantity_Color & AColor1,const Quantity_Color & AColor2,const Aspect_GradientFillMethod AMethod = Aspect_GFM_HOR);
		%feature("autodoc", "Args:
	AColor1(Quantity_Color)
	AColor2(Quantity_Color)

Returns:
	None

Returns colours of the window gradient background <self>.") Colors;
		void Colors (Quantity_Color & AColor1,Quantity_Color & AColor2);
		%feature("autodoc", "Args:
	None
Returns:
	Aspect_GradientFillMethod

Returns the current gradient background fill mode.") BgGradientFillMethod;
		Aspect_GradientFillMethod BgGradientFillMethod ();
};


%feature("shadow") Aspect_GradientBackground::~Aspect_GradientBackground %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Aspect_GradientBackground {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Aspect_IndexPixel;
class Aspect_IndexPixel : public Aspect_Pixel {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Aspect_IndexPixel;
		 Aspect_IndexPixel ();
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Aspect_IndexPixel;
		 Aspect_IndexPixel (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Value;
		Standard_Integer Value ();
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	Upper(Standard_Integer)

Returns:
	Standard_Integer

Returns a hashed value denoting <self>. This value is in  
        the range 1..<Upper>.") HashCode;
		Standard_Integer HashCode (const Standard_Integer Upper);

        %extend {
            Standard_Integer __hash__() {
            return $self->HashCode(2147483647);
            }
        };
        
        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
        		%feature("autodoc", "Args:
	Other(Aspect_IndexPixel)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEqual;
		Standard_Boolean IsEqual (const Aspect_IndexPixel & Other);

        %extend{
            bool __eq_wrapper__(const Aspect_IndexPixel  other) {
            if (*self==other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __eq__(self,right):
            try:
                return self.__eq_wrapper__(right)
            except:
                return False
        }
        		%feature("autodoc", "Args:
	Other(Aspect_IndexPixel)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsNotEqual;
		Standard_Boolean IsNotEqual (const Aspect_IndexPixel & Other);

        %extend{
            bool __ne_wrapper__(const Aspect_IndexPixel  other) {
            if (*self!=other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __ne__(self,right):
            try:
                return self.__ne_wrapper__(right)
            except:
                return True
        }
        		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") _CSFDB_GetAspect_IndexPixelmyIndex;
		Standard_Integer _CSFDB_GetAspect_IndexPixelmyIndex ();
		%feature("autodoc", "Args:
	p(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") _CSFDB_SetAspect_IndexPixelmyIndex;
		void _CSFDB_SetAspect_IndexPixelmyIndex (const Standard_Integer p);
};


%feature("shadow") Aspect_IndexPixel::~Aspect_IndexPixel %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Aspect_IndexPixel {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Aspect_RectangularGrid;
class Aspect_RectangularGrid : public Aspect_Grid {
	public:
		%feature("autodoc", "Args:
	aXStep(Quantity_Length)
	aYStep(Quantity_Length)
	anXOrigin(Quantity_Length)=0
	anYOrigin(Quantity_Length)=0
	aFirstAngle(Quantity_PlaneAngle)=0
	aSecondAngle(Quantity_PlaneAngle)=0
	aRotationAngle(Quantity_PlaneAngle)=0

Returns:
	None

creates a new grid. By default this grid is not  
         active.  
         The first angle is given relatively to the horizontal.  
         The second angle is given relatively to the vertical.") Aspect_RectangularGrid;
		 Aspect_RectangularGrid (const Quantity_Length aXStep,const Quantity_Length aYStep,const Quantity_Length anXOrigin = 0,const Quantity_Length anYOrigin = 0,const Quantity_PlaneAngle aFirstAngle = 0,const Quantity_PlaneAngle aSecondAngle = 0,const Quantity_PlaneAngle aRotationAngle = 0);
		%feature("autodoc", "Args:
	aStep(Quantity_Length)

Returns:
	None

defines the x step of the grid.") SetXStep;
		void SetXStep (const Quantity_Length aStep);
		%feature("autodoc", "Args:
	aStep(Quantity_Length)

Returns:
	None

defines the y step of the grid.") SetYStep;
		void SetYStep (const Quantity_Length aStep);
		%feature("autodoc", "Args:
	anAngle1(Quantity_PlaneAngle)
	anAngle2(Quantity_PlaneAngle)

Returns:
	None

defines the angle of the second network  
         the fist angle is given relatively to the horizontal.  
         the second angle is given relatively to the vertical.") SetAngle;
		void SetAngle (const Quantity_PlaneAngle anAngle1,const Quantity_PlaneAngle anAngle2);
		%feature("autodoc", "Args:
	XOrigin(Quantity_Length)
	YOrigin(Quantity_Length)
	XStep(Quantity_Length)
	YStep(Quantity_Length)
	RotationAngle(Quantity_PlaneAngle)

Returns:
	None

No detailed docstring for this function.") SetGridValues;
		void SetGridValues (const Quantity_Length XOrigin,const Quantity_Length YOrigin,const Quantity_Length XStep,const Quantity_Length YStep,const Quantity_PlaneAngle RotationAngle);
		%feature("autodoc", "Args:
	X(Quantity_Length)
	Y(Quantity_Length)
	gridX(Quantity_Length)
	gridY(Quantity_Length)

Returns:
	None

returns the point of the grid the closest to the point X,Y") Compute;
		void Compute (const Quantity_Length X,const Quantity_Length Y,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_Length

returns the x step of the grid.") XStep;
		Quantity_Length XStep ();
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_Length

returns the x step of the grid.") YStep;
		Quantity_Length YStep ();
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_PlaneAngle

returns the x Angle of the grid, relatively to the horizontal.") FirstAngle;
		Quantity_PlaneAngle FirstAngle ();
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_PlaneAngle

returns the y Angle of the grid, relatively to the vertical.") SecondAngle;
		Quantity_PlaneAngle SecondAngle ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Init;
		void Init ();
};


%feature("shadow") Aspect_RectangularGrid::~Aspect_RectangularGrid %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Aspect_RectangularGrid {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Aspect_RectangularGrid {
	Handle_Aspect_RectangularGrid GetHandle() {
	return *(Handle_Aspect_RectangularGrid*) &$self;
	}
};

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
    Aspect_RectangularGrid* GetObject() {
    return (Aspect_RectangularGrid*)$self->Access();
    }
};
%feature("shadow") Handle_Aspect_RectangularGrid::~Handle_Aspect_RectangularGrid %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Aspect_RectangularGrid {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Aspect_WindowDriver;
class Aspect_WindowDriver : public Aspect_Driver {
	public:
		%feature("autodoc", "Args:
	DoubleBuffer(Standard_Boolean)=Standard_True
	aRetainBuffer(Standard_Integer)=0

Returns:
	virtual void

Begin graphics and drawn directly to the Window or Pixmap if") BeginDraw;
		virtual void BeginDraw (const Standard_Boolean DoubleBuffer = Standard_True,const Standard_Integer aRetainBuffer = 0);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Aspect_TypeOfResize

No detailed docstring for this function.") ResizeSpace;
		virtual Aspect_TypeOfResize ResizeSpace ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Aspect_Window

No detailed docstring for this function.") Window;
		Handle_Aspect_Window Window ();
		%feature("autodoc", "Args:
	aMode(Aspect_TypeOfDrawMode)

Returns:
	virtual void

Change the current drawing mode of the Driver  
 	    XW_REPLACE : the primitive is drawn with his defined color.  
//!	    XW_ERASE   : the primitive is erased from the window.  
//!	    XW_XOR     : the primitive is xored to the window.  
//!	    XW_XORLIGHT: the primitive is xored depending of the current  
//!			highlight and background colors.") SetDrawMode;
		virtual void SetDrawMode (const Aspect_TypeOfDrawMode aMode);
		%feature("autodoc", "Args:
	aRetainBuffer(Standard_Integer)
	aPivotX(Standard_ShortReal)=0.0
	aPivotY(Standard_ShortReal)=0.0
	aWidthIndex(Standard_Integer)=0
	aColorIndex(Standard_Integer)=0
	aFontIndex(Standard_Integer)=0
	aDrawMode(Aspect_TypeOfDrawMode)=Aspect_TODM_REPLACE

Returns:
	virtual Standard_Boolean

Allocate the retain buffer <aRetainBuffer> ,  
Defines the DWU coordinates of the pivot point for all primitives") OpenBuffer;
		virtual Standard_Boolean OpenBuffer (const Standard_Integer aRetainBuffer,const Standard_ShortReal aPivotX = 0.0,const Standard_ShortReal aPivotY = 0.0,const Standard_Integer aWidthIndex = 0,const Standard_Integer aColorIndex = 0,const Standard_Integer aFontIndex = 0,const Aspect_TypeOfDrawMode aDrawMode = Aspect_TODM_REPLACE);
		%feature("autodoc", "Args:
	aRetainBuffer(Standard_Integer)

Returns:
	virtual void

Clear & Deallocate the retain buffer <aRetainBuffer>.") CloseBuffer;
		virtual void CloseBuffer (const Standard_Integer aRetainBuffer);
		%feature("autodoc", "Args:
	aRetainBuffer(Standard_Integer)

Returns:
	virtual void

Erase & Clear ALL primitives retains in the buffer <aRetainBuffer>.") ClearBuffer;
		virtual void ClearBuffer (const Standard_Integer aRetainBuffer);
		%feature("autodoc", "Args:
	aRetainBuffer(Standard_Integer)

Returns:
	virtual void

Draw ALL primitives retains in the buffer <aRetainBuffer>.  
 Warning: Note that the aspect of a retain buffer drawing is  
mono-colored with the current buffer Attributes and  
Depending of the DoubleBuffer state flag at the BeginDraw() buffer time,  
when DB is TRUE,an XOR method is use for drawing and erasing buffers in the  
same way.In this case,some color side effect can occurs depending of the  
traversal primitive colors and the supported hardware.  
when DB is FALSE and the background drawing has been generated with  
DB at TRUE,no color side effect occurs because the DB is used for restoring  
the drawing context at EraseBuffer() time,this is more powerfull for the  
drawing quality excepted for large buffers (flicking) .") DrawBuffer;
		virtual void DrawBuffer (const Standard_Integer aRetainBuffer);
		%feature("autodoc", "Args:
	aRetainBuffer(Standard_Integer)

Returns:
	virtual void

Erase ALL primitives retains in the buffer <aRetainBuffer>.") EraseBuffer;
		virtual void EraseBuffer (const Standard_Integer aRetainBuffer);
		%feature("autodoc", "Args:
	aRetainBuffer(Standard_Integer)
	aPivotX(Standard_ShortReal)=0.0
	aPivotY(Standard_ShortReal)=0.0

Returns:
	virtual void

Erase , Translate and reDraw ALL primitives retains in the buffer") MoveBuffer;
		virtual void MoveBuffer (const Standard_Integer aRetainBuffer,const Standard_ShortReal aPivotX = 0.0,const Standard_ShortReal aPivotY = 0.0);
		%feature("autodoc", "Args:
	aRetainBuffer(Standard_Integer)
	aScaleX(Quantity_Factor)=1.0
	aScaleY(Quantity_Factor)=1.0

Returns:
	virtual void

Erase , Scale the buffer from the Pivot point and reDraw ALL primitives") ScaleBuffer;
		virtual void ScaleBuffer (const Standard_Integer aRetainBuffer,const Quantity_Factor aScaleX = 1.0,const Quantity_Factor aScaleY = 1.0);
		%feature("autodoc", "Args:
	aRetainBuffer(Standard_Integer)
	anAngle(Quantity_PlaneAngle)=0.0

Returns:
	virtual void

Erase , Rotate the buffer from the Pivot point and reDraw ALL primitives") RotateBuffer;
		virtual void RotateBuffer (const Standard_Integer aRetainBuffer,const Quantity_PlaneAngle anAngle = 0.0);
		%feature("autodoc", "Args:
	aRetainBuffer(Standard_Integer)

Returns:
	virtual Standard_Boolean

Returns TRUE if the retain buffer <aRetainBuffer> is enabled") BufferIsOpen;
		virtual Standard_Boolean BufferIsOpen (const Standard_Integer aRetainBuffer);
		%feature("autodoc", "Args:
	aRetainBuffer(Standard_Integer)

Returns:
	virtual Standard_Boolean

Returns TRUE if the retain buffer has not been opened or empty.  
        Returns FALSE if a lot of primitives have been stored inside  
        because a BeginDraw(..,<aRetainBuffer>) has been done previously.") BufferIsEmpty;
		virtual Standard_Boolean BufferIsEmpty (const Standard_Integer aRetainBuffer);
		%feature("autodoc", "Args:
	aRetainBuffer(Standard_Integer)

Returns:
	virtual Standard_Boolean

Returns TRUE if the retain buffer s actually displayed at screen.") BufferIsDrawn;
		virtual Standard_Boolean BufferIsDrawn (const Standard_Integer aRetainBuffer);
		%feature("autodoc", "Args:
	aRetainBuffer(Standard_Integer)
	anAngle(Quantity_PlaneAngle)

Returns:
	virtual void

Returns the current buffer rotate angle from the X axis.") AngleOfBuffer;
		virtual void AngleOfBuffer (const Standard_Integer aRetainBuffer,Quantity_PlaneAngle & anAngle);
		%feature("autodoc", "Args:
	aRetainBuffer(Standard_Integer)
	aScaleX(Quantity_Factor)
	aScaleY(Quantity_Factor)

Returns:
	virtual void

Returns the current buffer scale factors.") ScaleOfBuffer;
		virtual void ScaleOfBuffer (const Standard_Integer aRetainBuffer,Quantity_Factor & aScaleX,Quantity_Factor & aScaleY);
		%feature("autodoc", "Args:
	aRetainBuffer(Standard_Integer)
	aPivotX(Standard_ShortReal)
	aPivotY(Standard_ShortReal)

Returns:
	virtual void

Returns the current buffer position.") PositionOfBuffer;
		virtual void PositionOfBuffer (const Standard_Integer aRetainBuffer,Standard_ShortReal & aPivotX,Standard_ShortReal & aPivotY);
		%feature("autodoc", "Args:
	aText(TCollection_ExtendedString)
	aWidth(Standard_ShortReal)
	aHeight(Standard_ShortReal)
	aFontIndex(Standard_Integer)=- 1

Returns:
	virtual void

Returns the TEXT size in DWU space depending  
         of the required FontIndex if aFontIndex is >= 0  
         or the current FontIndex if < 0 (default).") TextSize;
		virtual void TextSize (const TCollection_ExtendedString & aText,Standard_ShortReal & aWidth,Standard_ShortReal & aHeight,const Standard_Integer aFontIndex = - 1);
		%feature("autodoc", "Args:
	aText(TCollection_ExtendedString)
	aWidth(Standard_ShortReal)
	aHeight(Standard_ShortReal)
	anXoffset(Standard_ShortReal)
	anYoffset(Standard_ShortReal)
	aFontIndex(Standard_Integer)=- 1

Returns:
	virtual void

Returns the TEXT size and offsets  
//!	    in DWU space depending  
         of the required FontIndex if aFontIndex is >= 0  
         or the current FontIndex if < 0 (default).") TextSize;
		virtual void TextSize (const TCollection_ExtendedString & aText,Standard_ShortReal & aWidth,Standard_ShortReal & aHeight,Standard_ShortReal & anXoffset,Standard_ShortReal & anYoffset,const Standard_Integer aFontIndex = - 1);
		%feature("autodoc", "Args:
	aSlant(Quantity_PlaneAngle)
	aSize(Standard_ShortReal)
	aBheight(Standard_ShortReal)
	aFontIndex(Standard_Integer)=- 1

Returns:
	virtual char *

Returns the font string,slant,size and") FontSize;
		virtual char * FontSize (Quantity_PlaneAngle & aSlant,Standard_ShortReal & aSize,Standard_ShortReal & aBheight,const Standard_Integer aFontIndex = - 1);
		%feature("autodoc", "Args:
	aMinIndex(Standard_Integer)
	aMaxIndex(Standard_Integer)

Returns:
	virtual void

Returns the min and max driver virtual color indexs.") ColorBoundIndexs;
		virtual void ColorBoundIndexs (Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	virtual Standard_Integer

Returns the local colormap hardware index from a virtual driver color  
index or returns -1 if the index is not defined.") LocalColorIndex;
		virtual Standard_Integer LocalColorIndex (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	aMinIndex(Standard_Integer)
	aMaxIndex(Standard_Integer)

Returns:
	virtual void

Returns the min and max driver virtual font indexs.") FontBoundIndexs;
		virtual void FontBoundIndexs (Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	virtual Standard_Integer

Returns the associated fontmap hardware index from a virtual driver font  
index or returns -1 if the index is not defined.") LocalFontIndex;
		virtual Standard_Integer LocalFontIndex (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	aMinIndex(Standard_Integer)
	aMaxIndex(Standard_Integer)

Returns:
	virtual void

Returns the min and max driver virtual type indexs.") TypeBoundIndexs;
		virtual void TypeBoundIndexs (Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	virtual Standard_Integer

Returns the associated typemap hardware index from a virtual driver type  
index or returns -1 if the index is not defined.") LocalTypeIndex;
		virtual Standard_Integer LocalTypeIndex (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	aMinIndex(Standard_Integer)
	aMaxIndex(Standard_Integer)

Returns:
	virtual void

Returns the min and max driver virtual width indexs.") WidthBoundIndexs;
		virtual void WidthBoundIndexs (Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	virtual Standard_Integer

Returns the associated widthmap hardware index from a virtual driver width  
index or returns -1 if the index is not defined.") LocalWidthIndex;
		virtual Standard_Integer LocalWidthIndex (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	aMinIndex(Standard_Integer)
	aMaxIndex(Standard_Integer)

Returns:
	virtual void

Returns the min and max driver virtual marker indexs.") MarkBoundIndexs;
		virtual void MarkBoundIndexs (Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	virtual Standard_Integer

Returns the local markmap hardware index from a virtual driver marker  
index or returns -1 if the index is not defined.") LocalMarkIndex;
		virtual Standard_Integer LocalMarkIndex (const Standard_Integer anIndex);
};


%feature("shadow") Aspect_WindowDriver::~Aspect_WindowDriver %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Aspect_WindowDriver {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Aspect_WindowDriver {
	Handle_Aspect_WindowDriver GetHandle() {
	return *(Handle_Aspect_WindowDriver*) &$self;
	}
};

%nodefaultctor Handle_Aspect_WindowDriver;
class Handle_Aspect_WindowDriver : public Handle_Aspect_Driver {

    public:
        // constructors
        Handle_Aspect_WindowDriver();
        Handle_Aspect_WindowDriver(const Handle_Aspect_WindowDriver &aHandle);
        Handle_Aspect_WindowDriver(const Aspect_WindowDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Aspect_WindowDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_WindowDriver {
    Aspect_WindowDriver* GetObject() {
    return (Aspect_WindowDriver*)$self->Access();
    }
};
%feature("shadow") Handle_Aspect_WindowDriver::~Handle_Aspect_WindowDriver %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Aspect_WindowDriver {
    void _kill_pointed() {
        delete $self;
    }
};

