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
		%feature("autodoc", "	* Returns the format size according to the default LENGTH unit of the required format <aFOSP>. Returns more the normalized format name.

	:param aFOSP:
	:type aFOSP: Aspect_FormatOfSheetPaper
	:param aWidth:
	:type aWidth: Quantity_Length &
	:param aHeight:
	:type aHeight: Quantity_Length &
	:rtype: char *
") ValuesOfFOSP;
		static char * ValuesOfFOSP (const Aspect_FormatOfSheetPaper aFOSP,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	* Translates an ExtendedString to a CString depending of the local format.

	:param aString:
	:type aString: TCollection_ExtendedString &
	:rtype: char *
") ToCString;
		static char * ToCString (const TCollection_ExtendedString & aString);
		%feature("autodoc", "	* Inverses <aMat> a 4x4 matrix.

	:param aMat:
	:type aMat: TColStd_Array2OfReal &
	:param Inv:
	:type Inv: TColStd_Array2OfReal &
	:rtype: bool
") Inverse;
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
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") Aspect_Array1OfEdge;
		 Aspect_Array1OfEdge (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Item:
	:type Item: Aspect_Edge &
	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") Aspect_Array1OfEdge;
		 Aspect_Array1OfEdge (const Aspect_Edge & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param V:
	:type V: Aspect_Edge &
	:rtype: None
") Init;
		void Init (const Aspect_Edge & V);
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "	:param Other:
	:type Other: Aspect_Array1OfEdge &
	:rtype: Aspect_Array1OfEdge
") Assign;
		const Aspect_Array1OfEdge & Assign (const Aspect_Array1OfEdge & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Aspect_Array1OfEdge &
	:rtype: Aspect_Array1OfEdge
") operator=;
		const Aspect_Array1OfEdge & operator = (const Aspect_Array1OfEdge & Other);
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Value:
	:type Value: Aspect_Edge &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Aspect_Edge & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Aspect_Edge
") Value;
		const Aspect_Edge & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Aspect_Edge
") ChangeValue;
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
		%feature("autodoc", "	* Modifies the colour of the edge of the face

	:param AColor:
	:type AColor: Quantity_Color &
	:rtype: None
") SetEdgeColor;
		void SetEdgeColor (const Quantity_Color & AColor);
		%feature("autodoc", "	* Modifies the edge line type

	:param AType:
	:type AType: Aspect_TypeOfLine
	:rtype: None
") SetEdgeLineType;
		void SetEdgeLineType (const Aspect_TypeOfLine AType);
		%feature("autodoc", "	* Modifies the edge thickness Category: Methods to modify the class definition Warning: Raises AspectFillAreaDefinitionError if the //!	 width is a negative value.

	:param AWidth:
	:type AWidth: float
	:rtype: None
") SetEdgeWidth;
		void SetEdgeWidth (const Standard_Real AWidth);
		%feature("autodoc", "	* Modifies the hatch type used when InteriorStyle //!	 is IS_HATCH

	:param AStyle:
	:type AStyle: Aspect_HatchStyle
	:rtype: None
") SetHatchStyle;
		void SetHatchStyle (const Aspect_HatchStyle AStyle);
		%feature("autodoc", "	* Modifies the colour of the interior of the face

	:param AColor:
	:type AColor: Quantity_Color &
	:rtype: None
") SetInteriorColor;
		void SetInteriorColor (const Quantity_Color & AColor);
		%feature("autodoc", "	* Modifies the colour of the interior of the back face

	:param color:
	:type color: Quantity_Color &
	:rtype: None
") SetBackInteriorColor;
		void SetBackInteriorColor (const Quantity_Color & color);
		%feature("autodoc", "	* Modifies the interior type used for rendering InteriorStyle : IS_EMPTY	no interior //!		 IS_HOLLOW	display the boundaries of the surface //!		 IS_HATCH	display hatching //!		 IS_SOLID	display interior entirely filled

	:param AStyle:
	:type AStyle: Aspect_InteriorStyle
	:rtype: None
") SetInteriorStyle;
		void SetInteriorStyle (const Aspect_InteriorStyle AStyle);
		%feature("autodoc", "	* Returns the hatch type used when InteriorStyle //!	 is IS_HATCH

	:rtype: Aspect_HatchStyle
") HatchStyle;
		Aspect_HatchStyle HatchStyle ();
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
		%feature("autodoc", "	* Modifies the colour of <self>.

	:param AColor:
	:type AColor: Quantity_Color &
	:rtype: None
") SetColor;
		void SetColor (const Quantity_Color & AColor);
		%feature("autodoc", "	* Modifies the type of <self>.

	:param AType:
	:type AType: Aspect_TypeOfLine
	:rtype: None
") SetType;
		void SetType (const Aspect_TypeOfLine AType);
		%feature("autodoc", "	* Modifies the thickness of <self>. Category: Methods to modify the class definition Warning: Raises AspectLineDefinitionError if the //!	 width is a negative value.

	:param AWidth:
	:type AWidth: float
	:rtype: None
") SetWidth;
		void SetWidth (const Standard_Real AWidth);
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
		%feature("autodoc", "	* Modifies the colour of <self>.

	:param AColor:
	:type AColor: Quantity_Color &
	:rtype: None
") SetColor;
		void SetColor (const Quantity_Color & AColor);
		%feature("autodoc", "	* Modifies the scale factor of <self>. //!	 Marker type Aspect_TOM_POINT is not affected //!	 by the marker size scale factor. It is always //!	 the smallest displayable dot. Warning: Raises AspectMarkerDefinitionError if the //!	 scale is a negative value.

	:param AScale:
	:type AScale: float
	:rtype: None
") SetScale;
		void SetScale (const Standard_Real AScale);
		%feature("autodoc", "	* Modifies the type of marker <self>.

	:param AType:
	:type AType: Aspect_TypeOfMarker
	:rtype: None
") SetType;
		void SetType (const Aspect_TypeOfMarker AType);
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
		%feature("autodoc", "	* Creates a window background. //!	 Default color : NOC_MATRAGRAY.

	:rtype: None
") Aspect_Background;
		 Aspect_Background ();
		%feature("autodoc", "	* Creates a window background with the colour <AColor>.

	:param AColor:
	:type AColor: Quantity_Color &
	:rtype: None
") Aspect_Background;
		 Aspect_Background (const Quantity_Color & AColor);
		%feature("autodoc", "	* Modifies the colour of the window background <self>.

	:param AColor:
	:type AColor: Quantity_Color &
	:rtype: None
") SetColor;
		void SetColor (const Quantity_Color & AColor);
		%feature("autodoc", "	* Returns the colour of the window background <self>.

	:rtype: Quantity_Color
") Color;
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
		%feature("autodoc", "	:rtype: Aspect_TypeOfColorMap
") Type;
		Aspect_TypeOfColorMap Type ();
		%feature("autodoc", "	* Returns the Allocated colormap Size

	:rtype: int
") Size;
		Standard_Integer Size ();
		%feature("autodoc", "	* Returns the ColorMapEntry.Index of the ColorMap //!	 at rank <aColormapIndex> .

	:param aColormapIndex:
	:type aColormapIndex: Standard_Integer
	:rtype: int
") Index;
		Standard_Integer Index (const Standard_Integer aColormapIndex);
		%feature("autodoc", "	:rtype: None
") Dump;
		void Dump ();
		%feature("autodoc", "	* Return the value of the <Index>th element of //!	 the ColorMap

	:param AColorMapIndex:
	:type AColorMapIndex: Standard_Integer
	:rtype: Aspect_ColorMapEntry
") Entry;
		const Aspect_ColorMapEntry & Entry (const Standard_Integer AColorMapIndex);
		%feature("autodoc", "	* Returns the index in the ColorMap of the //!	 ColorMapEntry.Index() equal to <AnEntryIndex>.

	:param AColorMapEntryIndex:
	:type AColorMapEntryIndex: Standard_Integer
	:rtype: int
") FindColorMapIndex;
		virtual Standard_Integer FindColorMapIndex (const Standard_Integer AColorMapEntryIndex);
		%feature("autodoc", "	* Returns the ColorMapEntry with ColorMapEntry.Index() //!	 equal to <AnEntryIndex>.

	:param AColorMapEntryIndex:
	:type AColorMapEntryIndex: Standard_Integer
	:rtype: Aspect_ColorMapEntry
") FindEntry;
		virtual const Aspect_ColorMapEntry & FindEntry (const Standard_Integer AColorMapEntryIndex);
		%feature("autodoc", "	* Returns the index in the ColorMap of the //!	 nearest matching ColorMapEntry

	:param aColor:
	:type aColor: Quantity_Color &
	:rtype: int
") NearestColorMapIndex;
		virtual Standard_Integer NearestColorMapIndex (const Quantity_Color & aColor);
		%feature("autodoc", "	* Returns the nearest ColorMapEntry that match aColor .

	:param aColor:
	:type aColor: Quantity_Color &
	:rtype: Aspect_ColorMapEntry
") NearestEntry;
		virtual const Aspect_ColorMapEntry & NearestEntry (const Quantity_Color & aColor);
		%feature("autodoc", "	* Search an identical color entry in the color map <self> and returns the ColorMapEntry Index if exist. Or add a new entry and returns the computed ColorMapEntry index used.

	:param aColor:
	:type aColor: Quantity_Color &
	:rtype: int
") AddEntry;
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
		%feature("autodoc", "	* Creates an unallocated colormap entry

	:rtype: None
") Aspect_ColorMapEntry;
		 Aspect_ColorMapEntry ();
		%feature("autodoc", "	* Creates an allocated colormap entry

	:param index:
	:type index: Standard_Integer
	:param rgb:
	:type rgb: Quantity_Color &
	:rtype: None
") Aspect_ColorMapEntry;
		 Aspect_ColorMapEntry (const Standard_Integer index,const Quantity_Color & rgb);
		%feature("autodoc", "	* Creates an allocated colormap entry. Warning: Raises error if the colormap entry <entry> //!	 is unallocated.

	:param entry:
	:type entry: Aspect_ColorMapEntry &
	:rtype: None
") Aspect_ColorMapEntry;
		 Aspect_ColorMapEntry (const Aspect_ColorMapEntry & entry);
		%feature("autodoc", "	* Sets colormap entry value and allocates it.

	:param index:
	:type index: Standard_Integer
	:param rgb:
	:type rgb: Quantity_Color &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer index,const Quantity_Color & rgb);
		%feature("autodoc", "	* Sets colormap entry value and allocates it.

	:param entry:
	:type entry: Aspect_ColorMapEntry &
	:rtype: None
") SetValue;
		void SetValue (const Aspect_ColorMapEntry & entry);
		%feature("autodoc", "	:param entry:
	:type entry: Aspect_ColorMapEntry &
	:rtype: None
") operator=;
		void operator = (const Aspect_ColorMapEntry & entry);
		%feature("autodoc", "	* Sets color <rgb> of colormap entry.

	:param rgb:
	:type rgb: Quantity_Color &
	:rtype: None
") SetColor;
		void SetColor (const Quantity_Color & rgb);
		%feature("autodoc", "	:rtype: Quantity_Color
") Color;
		const Quantity_Color & Color ();
		%feature("autodoc", "	* Sets index value of a colormap entry.

	:param index:
	:type index: Standard_Integer
	:rtype: None
") SetIndex;
		void SetIndex (const Standard_Integer index);
		%feature("autodoc", "	:rtype: int
") Index;
		Standard_Integer Index ();
		%feature("autodoc", "	* Unallocates the colormap entry.

	:rtype: None
") Free;
		void Free ();
		%feature("autodoc", "	* Returns True if the colormap entry is allocated. Warning: A colormap entry is allocated when the color and //!	 the index is defined.

	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "	:rtype: None
") Dump;
		void Dump ();
		%feature("autodoc", "	:rtype: bool
") _CSFDB_GetAspect_ColorMapEntryallocated;
		Standard_Boolean _CSFDB_GetAspect_ColorMapEntryallocated ();
		%feature("autodoc", "	:param p:
	:type p: bool
	:rtype: None
") _CSFDB_SetAspect_ColorMapEntryallocated;
		void _CSFDB_SetAspect_ColorMapEntryallocated (const Standard_Boolean p);
		%feature("autodoc", "	:rtype: Quantity_Color
") _CSFDB_GetAspect_ColorMapEntrymycolor;
		const Quantity_Color & _CSFDB_GetAspect_ColorMapEntrymycolor ();
		%feature("autodoc", "	:rtype: int
") _CSFDB_GetAspect_ColorMapEntrymyindex;
		Standard_Integer _CSFDB_GetAspect_ColorMapEntrymyindex ();
		%feature("autodoc", "	:param p:
	:type p: Standard_Integer
	:rtype: None
") _CSFDB_SetAspect_ColorMapEntrymyindex;
		void _CSFDB_SetAspect_ColorMapEntrymyindex (const Standard_Integer p);
		%feature("autodoc", "	:rtype: bool
") _CSFDB_GetAspect_ColorMapEntrymyColorIsDef;
		Standard_Boolean _CSFDB_GetAspect_ColorMapEntrymyColorIsDef ();
		%feature("autodoc", "	:param p:
	:type p: bool
	:rtype: None
") _CSFDB_SetAspect_ColorMapEntrymyColorIsDef;
		void _CSFDB_SetAspect_ColorMapEntrymyColorIsDef (const Standard_Boolean p);
		%feature("autodoc", "	:rtype: bool
") _CSFDB_GetAspect_ColorMapEntrymyIndexIsDef;
		Standard_Boolean _CSFDB_GetAspect_ColorMapEntrymyIndexIsDef ();
		%feature("autodoc", "	:param p:
	:type p: bool
	:rtype: None
") _CSFDB_SetAspect_ColorMapEntrymyIndexIsDef;
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
		%feature("autodoc", "	* Calculate color according passed value; returns true if value is in range or false, if isn't

	:param Value:
	:type Value: float
	:param Color:
	:type Color: Quantity_Color &
	:rtype: bool
") FindColor;
		Standard_Boolean FindColor (const Standard_Real Value,Quantity_Color & Color);
		%feature("autodoc", "	:param Value:
	:type Value: float
	:param Min:
	:type Min: float
	:param Max:
	:type Max: float
	:param ColorsCount:
	:type ColorsCount: Standard_Integer
	:param Color:
	:type Color: Quantity_Color &
	:rtype: bool
") FindColor;
		static Standard_Boolean FindColor (const Standard_Real Value,const Standard_Real Min,const Standard_Real Max,const Standard_Integer ColorsCount,Quantity_Color & Color);
		%feature("autodoc", "	* Returns minimal value of color scale;

	:rtype: float
") GetMin;
		Standard_Real GetMin ();
		%feature("autodoc", "	* Returns maximal value of color scale;

	:rtype: float
") GetMax;
		Standard_Real GetMax ();
		%feature("autodoc", "	* Returns minimal and maximal values of color scale;

	:param aMin:
	:type aMin: float &
	:param aMax:
	:type aMax: float &
	:rtype: None
") GetRange;
		void GetRange (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	* Returns the type of labels;  Aspect_TOCSD_AUTO - labels as boundary values for intervals  Aspect_TOCSD_USER - user specified label is used

	:rtype: Aspect_TypeOfColorScaleData
") GetLabelType;
		Aspect_TypeOfColorScaleData GetLabelType ();
		%feature("autodoc", "	* Returns the type of colors;  Aspect_TOCSD_AUTO - value between Red and Blue  Aspect_TOCSD_USER - user specified color from color map

	:rtype: Aspect_TypeOfColorScaleData
") GetColorType;
		Aspect_TypeOfColorScaleData GetColorType ();
		%feature("autodoc", "	* Returns the number of color scale intervals;

	:rtype: int
") GetNumberOfIntervals;
		Standard_Integer GetNumberOfIntervals ();
		%feature("autodoc", "	* Returns the color scale title string;

	:rtype: TCollection_ExtendedString
") GetTitle;
		TCollection_ExtendedString GetTitle ();
		%feature("autodoc", "	* Returns the format for numbers.  The same like format for function printf().  Used if GetLabelType() is TOCSD_AUTO;

	:rtype: TCollection_AsciiString
") GetFormat;
		TCollection_AsciiString GetFormat ();
		%feature("autodoc", "	* Returns the user specified label with index <anIndex>.  Returns empty string if label not defined.

	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: TCollection_ExtendedString
") GetLabel;
		TCollection_ExtendedString GetLabel (const Standard_Integer anIndex);
		%feature("autodoc", "	* Returns the user specified color from color map with index <anIndex>.  Returns default color if index out of range in color map.

	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: Quantity_Color
") GetColor;
		Quantity_Color GetColor (const Standard_Integer anIndex);
		%feature("autodoc", "	* Returns the user specified labels.

	:param aLabels:
	:type aLabels: TColStd_SequenceOfExtendedString &
	:rtype: None
") GetLabels;
		void GetLabels (TColStd_SequenceOfExtendedString & aLabels);
		%feature("autodoc", "	* Returns the user specified colors.

	:param aColors:
	:type aColors: Aspect_SequenceOfColor &
	:rtype: None
") GetColors;
		void GetColors (Aspect_SequenceOfColor & aColors);
		%feature("autodoc", "	* Returns the position of labels concerning color filled rectangles.

	:rtype: Aspect_TypeOfColorScalePosition
") GetLabelPosition;
		Aspect_TypeOfColorScalePosition GetLabelPosition ();
		%feature("autodoc", "	* Returns the position of color scale title.

	:rtype: Aspect_TypeOfColorScalePosition
") GetTitlePosition;
		Aspect_TypeOfColorScalePosition GetTitlePosition ();
		%feature("autodoc", "	* Returns true if the labels and colors used in reversed order.

	:rtype: bool
") IsReversed;
		Standard_Boolean IsReversed ();
		%feature("autodoc", "	* Returns true if the labels placed at border of color filled rectangles.

	:rtype: bool
") IsLabelAtBorder;
		Standard_Boolean IsLabelAtBorder ();
		%feature("autodoc", "	* Sets the minimal value of color scale.

	:param aMin:
	:type aMin: float
	:rtype: None
") SetMin;
		void SetMin (const Standard_Real aMin);
		%feature("autodoc", "	* Sets the maximal value of color scale.

	:param aMax:
	:type aMax: float
	:rtype: None
") SetMax;
		void SetMax (const Standard_Real aMax);
		%feature("autodoc", "	* Sets the minimal and maximal value of color scale.

	:param aMin:
	:type aMin: float
	:param aMax:
	:type aMax: float
	:rtype: None
") SetRange;
		void SetRange (const Standard_Real aMin,const Standard_Real aMax);
		%feature("autodoc", "	* Sets the type of labels.  Aspect_TOCSD_AUTO - labels as boundary values for intervals  Aspect_TOCSD_USER - user specified label is used

	:param aType:
	:type aType: Aspect_TypeOfColorScaleData
	:rtype: None
") SetLabelType;
		void SetLabelType (const Aspect_TypeOfColorScaleData aType);
		%feature("autodoc", "	* Sets the type of colors.  Aspect_TOCSD_AUTO - value between Red and Blue  Aspect_TOCSD_USER - user specified color from color map

	:param aType:
	:type aType: Aspect_TypeOfColorScaleData
	:rtype: None
") SetColorType;
		void SetColorType (const Aspect_TypeOfColorScaleData aType);
		%feature("autodoc", "	* Sets the number of color scale intervals.

	:param aNum:
	:type aNum: Standard_Integer
	:rtype: None
") SetNumberOfIntervals;
		void SetNumberOfIntervals (const Standard_Integer aNum);
		%feature("autodoc", "	* Sets the color scale title string.

	:param aTitle:
	:type aTitle: TCollection_ExtendedString &
	:rtype: None
") SetTitle;
		void SetTitle (const TCollection_ExtendedString & aTitle);
		%feature("autodoc", "	* Sets the color scale auto label format specification.

	:param aFormat:
	:type aFormat: TCollection_AsciiString &
	:rtype: None
") SetFormat;
		void SetFormat (const TCollection_AsciiString & aFormat);
		%feature("autodoc", "	* Sets the color scale label at index. Index started from 1.

	:param aLabel:
	:type aLabel: TCollection_ExtendedString &
	:param anIndex: default value is -1
	:type anIndex: Standard_Integer
	:rtype: None
") SetLabel;
		void SetLabel (const TCollection_ExtendedString & aLabel,const Standard_Integer anIndex = -1);
		%feature("autodoc", "	* Sets the color scale color at index. Index started from 1.

	:param aColor:
	:type aColor: Quantity_Color &
	:param anIndex: default value is -1
	:type anIndex: Standard_Integer
	:rtype: None
") SetColor;
		void SetColor (const Quantity_Color & aColor,const Standard_Integer anIndex = -1);
		%feature("autodoc", "	* Sets the color scale labels.

	:param aSeq:
	:type aSeq: TColStd_SequenceOfExtendedString &
	:rtype: None
") SetLabels;
		void SetLabels (const TColStd_SequenceOfExtendedString & aSeq);
		%feature("autodoc", "	* Sets the color scale colors.

	:param aMap:
	:type aMap: Handle_Aspect_ColorMap &
	:rtype: None
") SetColors;
		void SetColors (const Handle_Aspect_ColorMap & aMap);
		%feature("autodoc", "	* Sets the color scale colors.

	:param aSeq:
	:type aSeq: Aspect_SequenceOfColor &
	:rtype: None
") SetColors;
		void SetColors (const Aspect_SequenceOfColor & aSeq);
		%feature("autodoc", "	* Sets the color scale labels position concerning color filled rectangles.

	:param aPos:
	:type aPos: Aspect_TypeOfColorScalePosition
	:rtype: None
") SetLabelPosition;
		void SetLabelPosition (const Aspect_TypeOfColorScalePosition aPos);
		%feature("autodoc", "	* Sets the color scale title position.

	:param aPos:
	:type aPos: Aspect_TypeOfColorScalePosition
	:rtype: None
") SetTitlePosition;
		void SetTitlePosition (const Aspect_TypeOfColorScalePosition aPos);
		%feature("autodoc", "	* Sets true if the labels and colors used in reversed order.

	:param aReverse:
	:type aReverse: bool
	:rtype: None
") SetReversed;
		void SetReversed (const Standard_Boolean aReverse);
		%feature("autodoc", "	* Sets true if the labels placed at border of color filled rectangles.

	:param anOn:
	:type anOn: bool
	:rtype: None
") SetLabelAtBorder;
		void SetLabelAtBorder (const Standard_Boolean anOn);
		%feature("autodoc", "	* Returns the size of color scale.

	:param aWidth:
	:type aWidth: float &
	:param aHeight:
	:type aHeight: float &
	:rtype: None
") GetSize;
		void GetSize (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	* Returns the width of color scale.

	:rtype: float
") GetWidth;
		Standard_Real GetWidth ();
		%feature("autodoc", "	* Returns the height of color scale.

	:rtype: float
") GetHeight;
		Standard_Real GetHeight ();
		%feature("autodoc", "	* Sets the size of color scale.

	:param aWidth:
	:type aWidth: float
	:param aHeight:
	:type aHeight: float
	:rtype: None
") SetSize;
		void SetSize (const Standard_Real aWidth,const Standard_Real aHeight);
		%feature("autodoc", "	* Sets the width of color scale.

	:param aWidth:
	:type aWidth: float
	:rtype: None
") SetWidth;
		void SetWidth (const Standard_Real aWidth);
		%feature("autodoc", "	* Sets the height of color scale.

	:param aHeight:
	:type aHeight: float
	:rtype: None
") SetHeight;
		void SetHeight (const Standard_Real aHeight);
		%feature("autodoc", "	* Returns the position of color scale.

	:param aX:
	:type aX: float &
	:param aY:
	:type aY: float &
	:rtype: None
") GetPosition;
		void GetPosition (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	* Returns the X position of color scale.

	:rtype: float
") GetXPosition;
		Standard_Real GetXPosition ();
		%feature("autodoc", "	* Returns the height of color scale.

	:rtype: float
") GetYPosition;
		Standard_Real GetYPosition ();
		%feature("autodoc", "	* Sets the position of color scale.

	:param aX:
	:type aX: float
	:param aY:
	:type aY: float
	:rtype: None
") SetPosition;
		void SetPosition (const Standard_Real aX,const Standard_Real aY);
		%feature("autodoc", "	* Sets the X position of color scale.

	:param aX:
	:type aX: float
	:rtype: None
") SetXPosition;
		void SetXPosition (const Standard_Real aX);
		%feature("autodoc", "	* Sets the Y position of color scale.

	:param aY:
	:type aY: float
	:rtype: None
") SetYPosition;
		void SetYPosition (const Standard_Real aY);
		%feature("autodoc", "	:rtype: int
") GetTextHeight;
		Standard_Integer GetTextHeight ();
		%feature("autodoc", "	:param aHeigh:
	:type aHeigh: Standard_Integer
	:rtype: None
") SetTextHeight;
		void SetTextHeight (const Standard_Integer aHeigh);
		%feature("autodoc", "	:param X:
	:type X: Standard_Integer
	:param Y:
	:type Y: Standard_Integer
	:param W:
	:type W: Standard_Integer
	:param H:
	:type H: Standard_Integer
	:param aColor:
	:type aColor: Quantity_Color &
	:param aFilled: default value is Standard_False
	:type aFilled: bool
	:rtype: void
") PaintRect;
		virtual void PaintRect (const Standard_Integer X,const Standard_Integer Y,const Standard_Integer W,const Standard_Integer H,const Quantity_Color & aColor,const Standard_Boolean aFilled = Standard_False);
		%feature("autodoc", "	:param aText:
	:type aText: TCollection_ExtendedString &
	:param X:
	:type X: Standard_Integer
	:param Y:
	:type Y: Standard_Integer
	:param aColor:
	:type aColor: Quantity_Color &
	:rtype: void
") PaintText;
		virtual void PaintText (const TCollection_ExtendedString & aText,const Standard_Integer X,const Standard_Integer Y,const Quantity_Color & aColor);
		%feature("autodoc", "	:param aText:
	:type aText: TCollection_ExtendedString &
	:rtype: int
") TextWidth;
		virtual Standard_Integer TextWidth (const TCollection_ExtendedString & aText);
		%feature("autodoc", "	:param aText:
	:type aText: TCollection_ExtendedString &
	:rtype: int
") TextHeight;
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
		%feature("autodoc", "	* Flush all graphics and Wait after up to date

	:param Synchronize: default value is Standard_False
	:type Synchronize: bool
	:rtype: void
") EndDraw;
		virtual void EndDraw (const Standard_Boolean Synchronize = Standard_False);
		%feature("autodoc", "	:param aColorMap:
	:type aColorMap: Handle_Aspect_ColorMap &
	:rtype: None
") SetColorMap;
		void SetColorMap (const Handle_Aspect_ColorMap & aColorMap);
		%feature("autodoc", "	:param aTypeMap:
	:type aTypeMap: Handle_Aspect_TypeMap &
	:rtype: None
") SetTypeMap;
		void SetTypeMap (const Handle_Aspect_TypeMap & aTypeMap);
		%feature("autodoc", "	:param aWidthMap:
	:type aWidthMap: Handle_Aspect_WidthMap &
	:rtype: None
") SetWidthMap;
		void SetWidthMap (const Handle_Aspect_WidthMap & aWidthMap);
		%feature("autodoc", "	* Sets the current font map to this driver and Enable/Disable this driver to use MDTV fonts instead system fonts.

	:param aFontMap:
	:type aFontMap: Handle_Aspect_FontMap &
	:rtype: None
") SetFontMap;
		void SetFontMap (const Handle_Aspect_FontMap & aFontMap);
		%feature("autodoc", "	:param aMarkMap:
	:type aMarkMap: Handle_Aspect_MarkMap &
	:rtype: None
") SetMarkMap;
		void SetMarkMap (const Handle_Aspect_MarkMap & aMarkMap);
		%feature("autodoc", "	:param ColorIndex:
	:type ColorIndex: Standard_Integer
	:param TypeIndex:
	:type TypeIndex: Standard_Integer
	:param WidthIndex:
	:type WidthIndex: Standard_Integer
	:rtype: void
") SetLineAttrib;
		virtual void SetLineAttrib (const Standard_Integer ColorIndex,const Standard_Integer TypeIndex,const Standard_Integer WidthIndex);
		%feature("autodoc", "	:param ColorIndex:
	:type ColorIndex: Standard_Integer
	:param FontIndex:
	:type FontIndex: Standard_Integer
	:rtype: void
") SetTextAttrib;
		virtual void SetTextAttrib (const Standard_Integer ColorIndex,const Standard_Integer FontIndex);
		%feature("autodoc", "	:param ColorIndex:
	:type ColorIndex: Standard_Integer
	:param FontIndex:
	:type FontIndex: Standard_Integer
	:param aSlant:
	:type aSlant: Quantity_PlaneAngle
	:param aHScale:
	:type aHScale: Quantity_Factor
	:param aWScale:
	:type aWScale: Quantity_Factor
	:param isUnderlined: default value is Standard_False
	:type isUnderlined: bool
	:rtype: void
") SetTextAttrib;
		virtual void SetTextAttrib (const Standard_Integer ColorIndex,const Standard_Integer FontIndex,const Quantity_PlaneAngle aSlant,const Quantity_Factor aHScale,const Quantity_Factor aWScale,const Standard_Boolean isUnderlined = Standard_False);
		%feature("autodoc", "	:param ColorIndex:
	:type ColorIndex: Standard_Integer
	:param TileIndex:
	:type TileIndex: Standard_Integer
	:param DrawEdge: default value is Standard_False
	:type DrawEdge: bool
	:rtype: void
") SetPolyAttrib;
		virtual void SetPolyAttrib (const Standard_Integer ColorIndex,const Standard_Integer TileIndex,const Standard_Boolean DrawEdge = Standard_False);
		%feature("autodoc", "	:param ColorIndex:
	:type ColorIndex: Standard_Integer
	:param WidthIndex:
	:type WidthIndex: Standard_Integer
	:param FillMarker: default value is Standard_False
	:type FillMarker: bool
	:rtype: void
") SetMarkerAttrib;
		virtual void SetMarkerAttrib (const Standard_Integer ColorIndex,const Standard_Integer WidthIndex,const Standard_Boolean FillMarker = Standard_False);
		%feature("autodoc", "	:param anImage:
	:type anImage: Handle_Standard_Transient &
	:rtype: bool
") IsKnownImage;
		virtual Standard_Boolean IsKnownImage (const Handle_Standard_Transient & anImage);
		%feature("autodoc", "	:param anImageFile:
	:type anImageFile: char *
	:param aWidth:
	:type aWidth: Standard_Integer &
	:param aHeight:
	:type aHeight: Standard_Integer &
	:rtype: bool
") SizeOfImageFile;
		virtual Standard_Boolean SizeOfImageFile (const char * anImageFile,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "	:param anImageId:
	:type anImageId: Handle_Standard_Transient &
	:rtype: void
") ClearImage;
		virtual void ClearImage (const Handle_Standard_Transient & anImageId);
		%feature("autodoc", "	:param anImageFile:
	:type anImageFile: char *
	:rtype: void
") ClearImageFile;
		virtual void ClearImageFile (const char * anImageFile);
		%feature("autodoc", "	:param anImageId:
	:type anImageId: Handle_Standard_Transient &
	:param aX:
	:type aX: Standard_ShortReal
	:param aY:
	:type aY: Standard_ShortReal
	:rtype: void
") DrawImage;
		virtual void DrawImage (const Handle_Standard_Transient & anImageId,const Standard_ShortReal aX,const Standard_ShortReal aY);
		%feature("autodoc", "	:param anImageFile:
	:type anImageFile: char *
	:param aX:
	:type aX: Standard_ShortReal
	:param aY:
	:type aY: Standard_ShortReal
	:param aScale: default value is 1.0
	:type aScale: Quantity_Factor
	:rtype: void
") DrawImageFile;
		virtual void DrawImageFile (const char * anImageFile,const Standard_ShortReal aX,const Standard_ShortReal aY,const Quantity_Factor aScale = 1.0);
		%feature("autodoc", "	* Fills a complete Image .

	:param anImageId:
	:type anImageId: Handle_Standard_Transient &
	:param aX:
	:type aX: Standard_ShortReal
	:param aY:
	:type aY: Standard_ShortReal
	:param aWidth:
	:type aWidth: Standard_Integer
	:param aHeight:
	:type aHeight: Standard_Integer
	:param anArrayOfPixels:
	:type anArrayOfPixels: Standard_Address
	:rtype: void
") FillAndDrawImage;
		virtual void FillAndDrawImage (const Handle_Standard_Transient & anImageId,const Standard_ShortReal aX,const Standard_ShortReal aY,const Standard_Integer aWidth,const Standard_Integer aHeight,const Standard_Address anArrayOfPixels);
		%feature("autodoc", "	* Fills a line of the Image . Warning: 0 <= anIndexOfLine < aHeight //!	 anIndexOfLine = 0 must be the first call

	:param anImageId:
	:type anImageId: Handle_Standard_Transient &
	:param aX:
	:type aX: Standard_ShortReal
	:param aY:
	:type aY: Standard_ShortReal
	:param anIndexOfLine:
	:type anIndexOfLine: Standard_Integer
	:param aWidth:
	:type aWidth: Standard_Integer
	:param aHeight:
	:type aHeight: Standard_Integer
	:param anArrayOfPixels:
	:type anArrayOfPixels: Standard_Address
	:rtype: void
") FillAndDrawImage;
		virtual void FillAndDrawImage (const Handle_Standard_Transient & anImageId,const Standard_ShortReal aX,const Standard_ShortReal aY,const Standard_Integer anIndexOfLine,const Standard_Integer aWidth,const Standard_Integer aHeight,const Standard_Address anArrayOfPixels);
		%feature("autodoc", "	* Draw a polyline depending of the SetLineAttrib() attributes.

	:param aListX:
	:type aListX: TShort_Array1OfShortReal &
	:param aListY:
	:type aListY: TShort_Array1OfShortReal &
	:rtype: void
") DrawPolyline;
		virtual void DrawPolyline (const TShort_Array1OfShortReal & aListX,const TShort_Array1OfShortReal & aListY);
		%feature("autodoc", "	* Draw a polygon depending of the SetPolyAttrib() attributes.

	:param aListX:
	:type aListX: TShort_Array1OfShortReal &
	:param aListY:
	:type aListY: TShort_Array1OfShortReal &
	:rtype: void
") DrawPolygon;
		virtual void DrawPolygon (const TShort_Array1OfShortReal & aListX,const TShort_Array1OfShortReal & aListY);
		%feature("autodoc", "	* Draw a segment depending of the SetLineAttrib() attributes.

	:param X1:
	:type X1: Standard_ShortReal
	:param Y1:
	:type Y1: Standard_ShortReal
	:param X2:
	:type X2: Standard_ShortReal
	:param Y2:
	:type Y2: Standard_ShortReal
	:rtype: void
") DrawSegment;
		virtual void DrawSegment (const Standard_ShortReal X1,const Standard_ShortReal Y1,const Standard_ShortReal X2,const Standard_ShortReal Y2);
		%feature("autodoc", "	* Draws a text depending of the SetTextAttrib() attributes.

	:param aText:
	:type aText: TCollection_ExtendedString &
	:param Xpos:
	:type Xpos: Standard_ShortReal
	:param Ypos:
	:type Ypos: Standard_ShortReal
	:param anAngle: default value is 0.0
	:type anAngle: Standard_ShortReal
	:param aType: default value is Aspect_TOT_SOLID
	:type aType: Aspect_TypeOfText
	:rtype: void
") DrawText;
		virtual void DrawText (const TCollection_ExtendedString & aText,const Standard_ShortReal Xpos,const Standard_ShortReal Ypos,const Standard_ShortReal anAngle = 0.0,const Aspect_TypeOfText aType = Aspect_TOT_SOLID);
		%feature("autodoc", "	* Draws an framed text depending of the SetTextAttrib() and SetPolyAttrib() attributes. Warning: Coordinates must be defined in DWU space. //!	 <aMarge> defines the ratio of the space between the //!	 polygon borders and the bounding box of the text and //!	 depending of the height of the text.

	:param aText:
	:type aText: TCollection_ExtendedString &
	:param Xpos:
	:type Xpos: Standard_ShortReal
	:param Ypos:
	:type Ypos: Standard_ShortReal
	:param aMarge: default value is 0.1
	:type aMarge: Quantity_Ratio
	:param anAngle: default value is 0.0
	:type anAngle: Standard_ShortReal
	:param aType: default value is Aspect_TOT_SOLID
	:type aType: Aspect_TypeOfText
	:rtype: void
") DrawPolyText;
		virtual void DrawPolyText (const TCollection_ExtendedString & aText,const Standard_ShortReal Xpos,const Standard_ShortReal Ypos,const Quantity_Ratio aMarge = 0.1,const Standard_ShortReal anAngle = 0.0,const Aspect_TypeOfText aType = Aspect_TOT_SOLID);
		%feature("autodoc", "	* Draws a 1 PIXEL point depending of the SetMarkerAttrib()

	:param X:
	:type X: Standard_ShortReal
	:param Y:
	:type Y: Standard_ShortReal
	:rtype: void
") DrawPoint;
		virtual void DrawPoint (const Standard_ShortReal X,const Standard_ShortReal Y);
		%feature("autodoc", "	* Draws the prevously defined marker <aMarker>

	:param aMarker:
	:type aMarker: Standard_Integer
	:param Xpos:
	:type Xpos: Standard_ShortReal
	:param Ypos:
	:type Ypos: Standard_ShortReal
	:param Width:
	:type Width: Standard_ShortReal
	:param Height:
	:type Height: Standard_ShortReal
	:param Angle: default value is 0.0
	:type Angle: Standard_ShortReal
	:rtype: void
") DrawMarker;
		virtual void DrawMarker (const Standard_Integer aMarker,const Standard_ShortReal Xpos,const Standard_ShortReal Ypos,const Standard_ShortReal Width,const Standard_ShortReal Height,const Standard_ShortReal Angle = 0.0);
		%feature("autodoc", "	* Draws an Ellipsoid arc of center <X,Y> and Radius

	:param X:
	:type X: Standard_ShortReal
	:param Y:
	:type Y: Standard_ShortReal
	:param anXradius:
	:type anXradius: Standard_ShortReal
	:param anYradius:
	:type anYradius: Standard_ShortReal
	:param aStartAngle: default value is 0.0
	:type aStartAngle: Standard_ShortReal
	:param anOpenAngle: default value is 6.283185
	:type anOpenAngle: Standard_ShortReal
	:rtype: bool
") DrawArc;
		virtual Standard_Boolean DrawArc (const Standard_ShortReal X,const Standard_ShortReal Y,const Standard_ShortReal anXradius,const Standard_ShortReal anYradius,const Standard_ShortReal aStartAngle = 0.0,const Standard_ShortReal anOpenAngle = 6.283185);
		%feature("autodoc", "	* Draws an filled Ellipsoid arc of center <X,Y> and Radius

	:param X:
	:type X: Standard_ShortReal
	:param Y:
	:type Y: Standard_ShortReal
	:param anXradius:
	:type anXradius: Standard_ShortReal
	:param anYradius:
	:type anYradius: Standard_ShortReal
	:param aStartAngle: default value is 0.0
	:type aStartAngle: Standard_ShortReal
	:param anOpenAngle: default value is 6.283185
	:type anOpenAngle: Standard_ShortReal
	:rtype: bool
") DrawPolyArc;
		virtual Standard_Boolean DrawPolyArc (const Standard_ShortReal X,const Standard_ShortReal Y,const Standard_ShortReal anXradius,const Standard_ShortReal anYradius,const Standard_ShortReal aStartAngle = 0.0,const Standard_ShortReal anOpenAngle = 6.283185);
		%feature("autodoc", "	* Begin an incremental polyline primitive of <aNumber> of points . Warning: Points must be added by the the DrawPoint() method.

	:param aNumber:
	:type aNumber: Standard_Integer
	:rtype: void
") BeginPolyline;
		virtual void BeginPolyline (const Standard_Integer aNumber);
		%feature("autodoc", "	* Begin an incremental polygon primitive of <aNumber> of points . Warning: Points must be added by the the DrawPoint() method.

	:param aNumber:
	:type aNumber: Standard_Integer
	:rtype: void
") BeginPolygon;
		virtual void BeginPolygon (const Standard_Integer aNumber);
		%feature("autodoc", "	* Begin a set of segments . Warning: Segments must be added by the DrawSegment() method.

	:rtype: void
") BeginSegments;
		virtual void BeginSegments ();
		%feature("autodoc", "	* Begin a set of circles or ellips . Warning: Arcs must be added by the DrawArc() methods.

	:rtype: void
") BeginArcs;
		virtual void BeginArcs ();
		%feature("autodoc", "	* Begin a set of polygon circles or ellips . Warning: Arcs must be added by the DrawPolyArc() methods.

	:rtype: void
") BeginPolyArcs;
		virtual void BeginPolyArcs ();
		%feature("autodoc", "	* Begin a set of markers . Warning: Markers must be added by the DrawMarker() method.

	:rtype: void
") BeginMarkers;
		virtual void BeginMarkers ();
		%feature("autodoc", "	* Begin a set of points . Warning: Points must be added by the DrawPoint() method.

	:rtype: void
") BeginPoints;
		virtual void BeginPoints ();
		%feature("autodoc", "	* Close the last Begining primitive

	:rtype: void
") ClosePrimitive;
		virtual void ClosePrimitive ();
		%feature("autodoc", "	:rtype: Handle_Aspect_ColorMap
") ColorMap;
		Handle_Aspect_ColorMap ColorMap ();
		%feature("autodoc", "	:rtype: Handle_Aspect_TypeMap
") TypeMap;
		Handle_Aspect_TypeMap TypeMap ();
		%feature("autodoc", "	:rtype: Handle_Aspect_WidthMap
") WidthMap;
		Handle_Aspect_WidthMap WidthMap ();
		%feature("autodoc", "	:rtype: Handle_Aspect_FontMap
") FontMap;
		Handle_Aspect_FontMap FontMap ();
		%feature("autodoc", "	:rtype: Handle_Aspect_MarkMap
") MarkMap;
		Handle_Aspect_MarkMap MarkMap ();
		%feature("autodoc", "	* Returns the Available WorkSpace in DWU coordinates

	:param Width:
	:type Width: Quantity_Length &
	:param Heigth:
	:type Heigth: Quantity_Length &
	:rtype: void
") WorkSpace;
		virtual void WorkSpace (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	* Returns the DWU value depending of the PIXEL value.

	:param PV:
	:type PV: Standard_Integer
	:rtype: Quantity_Length
") Convert;
		virtual Quantity_Length Convert (const Standard_Integer PV);
		%feature("autodoc", "	* Returns the PIXEL value depending of the DWU value.

	:param DV:
	:type DV: Quantity_Length
	:rtype: int
") Convert;
		virtual Standard_Integer Convert (const Quantity_Length DV);
		%feature("autodoc", "	* Returns the DWU position depending of the PIXEL position .

	:param PX:
	:type PX: Standard_Integer
	:param PY:
	:type PY: Standard_Integer
	:param DX:
	:type DX: Quantity_Length &
	:param DY:
	:type DY: Quantity_Length &
	:rtype: void
") Convert;
		virtual void Convert (const Standard_Integer PX,const Standard_Integer PY,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	* Returns the PIXEL position depending of the DWU position . Returns True when the driver must use MDTV fonts //!	instead system fonts.

	:param DX:
	:type DX: Quantity_Length
	:param DY:
	:type DY: Quantity_Length
	:param PX:
	:type PX: Standard_Integer &
	:param PY:
	:type PY: Standard_Integer &
	:rtype: void
") Convert;
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
		%feature("autodoc", "	* Creates an edge.

	:rtype: None
") Aspect_Edge;
		 Aspect_Edge ();
		%feature("autodoc", "	* Creates an edge from an index of vertices //!	 in a table of vertices. //!	 <AType> indicates if this edge is seen or not. Warning: Raises EdgeDefinitionError if AIndex1 == AIndex2.

	:param AIndex1:
	:type AIndex1: Standard_Integer
	:param AIndex2:
	:type AIndex2: Standard_Integer
	:param AType:
	:type AType: Aspect_TypeOfEdge
	:rtype: None
") Aspect_Edge;
		 Aspect_Edge (const Standard_Integer AIndex1,const Standard_Integer AIndex2,const Aspect_TypeOfEdge AType);
		%feature("autodoc", "	* Updates the values of an edge <self>. Warning: Raises EdgeDefinitionError if AIndex1 == AIndex2.

	:param AIndex1:
	:type AIndex1: Standard_Integer
	:param AIndex2:
	:type AIndex2: Standard_Integer
	:param AType:
	:type AType: Aspect_TypeOfEdge
	:rtype: None
") SetValues;
		void SetValues (const Standard_Integer AIndex1,const Standard_Integer AIndex2,const Aspect_TypeOfEdge AType);
		%feature("autodoc", "	* Returns the index of the vertices and the //!	 type of edge <self>.

	:param AIndex1:
	:type AIndex1: Standard_Integer &
	:param AIndex2:
	:type AIndex2: Standard_Integer &
	:param AType:
	:type AType: Aspect_TypeOfEdge &
	:rtype: None
") Values;
		void Values (Standard_Integer &OutValue,Standard_Integer &OutValue,Aspect_TypeOfEdge & AType);
		%feature("autodoc", "	* Returns the index of the begin of the edge <self>.

	:rtype: int
") FirstIndex;
		Standard_Integer FirstIndex ();
		%feature("autodoc", "	* Returns the index of the end of the edge <self>.

	:rtype: int
") LastIndex;
		Standard_Integer LastIndex ();
		%feature("autodoc", "	* Returns the type of the edge <self>.

	:rtype: Aspect_TypeOfEdge
") Type;
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
		%feature("autodoc", "	:rtype: None
") Aspect_FontMap;
		 Aspect_FontMap ();
		%feature("autodoc", "	* Adds an entry in the font map <self>. Warning: Raises BadAccess if FontMap size is exceeded.

	:param AnEntry:
	:type AnEntry: Aspect_FontMapEntry &
	:rtype: None
") AddEntry;
		void AddEntry (const Aspect_FontMapEntry & AnEntry);
		%feature("autodoc", "	* Search an identical font style entry in the font map <self> and returns the FontMapEntry Index if exist. Or add a new entry and returns the computed FontMapEntry index used.

	:param aStyle:
	:type aStyle: Aspect_FontStyle &
	:rtype: int
") AddEntry;
		Standard_Integer AddEntry (const Aspect_FontStyle & aStyle);
		%feature("autodoc", "	* Returns the Allocated fontmap Size

	:rtype: int
") Size;
		Standard_Integer Size ();
		%feature("autodoc", "	* Returns the FontMapEntry.Index of the FontMap at rank <aFontmapIndex> .

	:param aFontmapIndex:
	:type aFontmapIndex: Standard_Integer
	:rtype: int
") Index;
		Standard_Integer Index (const Standard_Integer aFontmapIndex);
		%feature("autodoc", "	:rtype: None
") Dump;
		void Dump ();
		%feature("autodoc", "	* Returns the Font map entry with the index <AnIndex>. Warning: Raises BadAccess if the index less than 1 //!	 or greater than Size.

	:param AnIndex:
	:type AnIndex: Standard_Integer
	:rtype: Aspect_FontMapEntry
") Entry;
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
		%feature("autodoc", "	* Creates an unallocated fontmap entry

	:rtype: None
") Aspect_FontMapEntry;
		 Aspect_FontMapEntry ();
		%feature("autodoc", "	* Creates an allocated fontmap entry

	:param index:
	:type index: Standard_Integer
	:param style:
	:type style: Aspect_FontStyle &
	:rtype: None
") Aspect_FontMapEntry;
		 Aspect_FontMapEntry (const Standard_Integer index,const Aspect_FontStyle & style);
		%feature("autodoc", "	* Creates an allocated fontmap entry. Warning: Raises error if the fontmap entry <entry> is unallocated.

	:param entry:
	:type entry: Aspect_FontMapEntry &
	:rtype: None
") Aspect_FontMapEntry;
		 Aspect_FontMapEntry (const Aspect_FontMapEntry & entry);
		%feature("autodoc", "	* Sets fontmap entry value and allocates it.

	:param index:
	:type index: Standard_Integer
	:param style:
	:type style: Aspect_FontStyle &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer index,const Aspect_FontStyle & style);
		%feature("autodoc", "	* Sets fontmap entry value and allocates it.

	:param entry:
	:type entry: Aspect_FontMapEntry &
	:rtype: None
") SetValue;
		void SetValue (const Aspect_FontMapEntry & entry);
		%feature("autodoc", "	:param entry:
	:type entry: Aspect_FontMapEntry &
	:rtype: None
") operator=;
		void operator = (const Aspect_FontMapEntry & entry);
		%feature("autodoc", "	* Sets the line style of fontmap entry.

	:param Style:
	:type Style: Aspect_FontStyle &
	:rtype: None
") SetType;
		void SetType (const Aspect_FontStyle & Style);
		%feature("autodoc", "	:rtype: Aspect_FontStyle
") Type;
		const Aspect_FontStyle & Type ();
		%feature("autodoc", "	* Sets index value of a fontmap entry.

	:param index:
	:type index: Standard_Integer
	:rtype: None
") SetIndex;
		void SetIndex (const Standard_Integer index);
		%feature("autodoc", "	:rtype: int
") Index;
		Standard_Integer Index ();
		%feature("autodoc", "	* Unallocates the fontmap entry.

	:rtype: None
") Free;
		void Free ();
		%feature("autodoc", "	* Returns True if the fontmap entry is allocated. Warning: A fontmap entry is allocated when the font and //!	 the index is defined.

	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "	:rtype: None
") Dump;
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
		%feature("autodoc", "	* Creates a font style with the default values of //!	 FontStyle type : DEFAULT

	:rtype: None
") Aspect_FontStyle;
		 Aspect_FontStyle ();
		%feature("autodoc", "	* Creates the font style <Type> depending of //!	 Size given in the basic LENGTH unit and Slant in //!	 the basic PLANE ANGLE unit. //!	 When CapsHeight is True the size defines the //!	 ascent height of the font;if False,the size //!	 defines the ascent+descent part of the font.

	:param Type:
	:type Type: Aspect_TypeOfFont
	:param Size:
	:type Size: Quantity_Length
	:param Slant: default value is 0.0
	:type Slant: Quantity_PlaneAngle
	:param CapsHeight: default value is Standard_False
	:type CapsHeight: bool
	:rtype: None
") Aspect_FontStyle;
		 Aspect_FontStyle (const Aspect_TypeOfFont Type,const Quantity_Length Size,const Quantity_PlaneAngle Slant = 0.0,const Standard_Boolean CapsHeight = Standard_False);
		%feature("autodoc", "	* Creates a font style from Adobe font style descriptor //!	 depending of Size given in MM and Slant in RADIAN. //!	 When CapsHeight is True the size defines the //!	 ascent height of the font;if False,the size //!	 defines the ascent+descent part of the font. //!	 Font Style Descriptor must be : //!	 Simple form is 'family' 	Ex: 'helvetica' //!	 More complex form is 'family-weight' Ex: 'helvetica-bold' //!	 Full form is : //!		'-foundry-family-weight-slant-swdth-adstyl-pixelsize' //!		'-pointsize-resx-resy-spacing-avgWidth-registry-encoding' //!		where each field must be replaced by an '*' Warning: create the smalest font size if the foundry height

	:param Style:
	:type Style: char *
	:param Size:
	:type Size: Quantity_Length
	:param Slant: default value is 0.0
	:type Slant: Quantity_PlaneAngle
	:param CapsHeight: default value is Standard_False
	:type CapsHeight: bool
	:rtype: None
") Aspect_FontStyle;
		 Aspect_FontStyle (const char * Style,const Quantity_Length Size,const Quantity_PlaneAngle Slant = 0.0,const Standard_Boolean CapsHeight = Standard_False);
		%feature("autodoc", "	* Creates a transformable font with the full font name <Style> given in the XLFD descriptor : '-foundry-family-weight-slant-swidth-adstyl-pixelsize-pointsize- resx-resy-spacing-avdWidth-registry-encoding'. The fields pixelsize ,pointsize,resx,resy are sets to 0 and all unknown fields sets to '*'. Example: 'adobe-helvetica-bold-*-*-*-0-0-0-0-*-*-iso8859-*' Warning: the height and slant of the font is supposed to be NULL and computed dynamically at the drawing text time.

	:param Style:
	:type Style: char *
	:rtype: None
") Aspect_FontStyle;
		 Aspect_FontStyle (const char * Style);
		%feature("autodoc", "	* Updates the font style <self> from the definition of the //!	 font style <Other>.

	:param Other:
	:type Other: Aspect_FontStyle &
	:rtype: Aspect_FontStyle
") Assign;
		Aspect_FontStyle & Assign (const Aspect_FontStyle & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Aspect_FontStyle &
	:rtype: Aspect_FontStyle
") operator=;
		Aspect_FontStyle & operator = (const Aspect_FontStyle & Other);
		%feature("autodoc", "	* Updates the font style <self> from the definition of the //!	 font style <Type>.

	:param Type:
	:type Type: Aspect_TypeOfFont
	:param Size:
	:type Size: Quantity_Length
	:param Slant: default value is 0.0
	:type Slant: Quantity_PlaneAngle
	:param CapsHeight: default value is Standard_False
	:type CapsHeight: bool
	:rtype: None
") SetValues;
		void SetValues (const Aspect_TypeOfFont Type,const Quantity_Length Size,const Quantity_PlaneAngle Slant = 0.0,const Standard_Boolean CapsHeight = Standard_False);
		%feature("autodoc", "	* Updates a font style with the new Abode font descriptor Warning: create the smalest font size if the foundry height

	:param Style:
	:type Style: char *
	:param Size:
	:type Size: Quantity_Length
	:param Slant: default value is 0.0
	:type Slant: Quantity_PlaneAngle
	:param CapsHeight: default value is Standard_False
	:type CapsHeight: bool
	:rtype: None
") SetValues;
		void SetValues (const char * Style,const Quantity_Length Size,const Quantity_PlaneAngle Slant = 0.0,const Standard_Boolean CapsHeight = Standard_False);
		%feature("autodoc", "	* Updates a font style with the new XLFD font descriptor

	:param Style:
	:type Style: char *
	:rtype: None
") SetValues;
		void SetValues (const char * Style);
		%feature("autodoc", "	* Sets the family of the font.

	:param aName:
	:type aName: char *
	:rtype: None
") SetFamily;
		void SetFamily (const char * aName);
		%feature("autodoc", "	* Sets the weight of the font.

	:param aName:
	:type aName: char *
	:rtype: None
") SetWeight;
		void SetWeight (const char * aName);
		%feature("autodoc", "	* Sets the registry of the font.

	:param aName:
	:type aName: char *
	:rtype: None
") SetRegistry;
		void SetRegistry (const char * aName);
		%feature("autodoc", "	* Sets the encoding of the font.

	:param aName:
	:type aName: char *
	:rtype: None
") SetEncoding;
		void SetEncoding (const char * aName);
		%feature("autodoc", "	* Returns the type of the font style <self>

	:rtype: Aspect_TypeOfFont
") Style;
		Aspect_TypeOfFont Style ();
		%feature("autodoc", "	* Returns the string components length of the font style descriptor

	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	* Returns the String component of a font style

	:rtype: char *
") Value;
		char * Value ();
		%feature("autodoc", "	* Returns the Size component of a font style

	:rtype: Quantity_Length
") Size;
		Quantity_Length Size ();
		%feature("autodoc", "	* Returns the Slant component of a font style

	:rtype: Quantity_PlaneAngle
") Slant;
		Quantity_PlaneAngle Slant ();
		%feature("autodoc", "	* Returns the CapsHeight component of a font style

	:rtype: bool
") CapsHeight;
		Standard_Boolean CapsHeight ();
		%feature("autodoc", "	* Returns a shorter font name which identify the main characteristics of the fonts.

	:rtype: char *
") AliasName;
		char * AliasName ();
		%feature("autodoc", "	* Returns the full normalized font name

	:rtype: char *
") FullName;
		char * FullName ();
		%feature("autodoc", "	* Returns the foundry of the font.

	:rtype: char *
") Foundry;
		char * Foundry ();
		%feature("autodoc", "	* Returns the family of the font.

	:rtype: char *
") Family;
		char * Family ();
		%feature("autodoc", "	* Returns the weight of the font.

	:rtype: char *
") Weight;
		char * Weight ();
		%feature("autodoc", "	* Returns the char set registry of the font.

	:rtype: char *
") Registry;
		char * Registry ();
		%feature("autodoc", "	* Returns the char set encoding of the font.

	:rtype: char *
") Encoding;
		char * Encoding ();
		%feature("autodoc", "	* Returns the slant of the font.

	:rtype: char *
") SSlant;
		char * SSlant ();
		%feature("autodoc", "	* Returns the width name of the font.

	:rtype: char *
") SWidth;
		char * SWidth ();
		%feature("autodoc", "	* Returns the style name of the font.

	:rtype: char *
") SStyle;
		char * SStyle ();
		%feature("autodoc", "	* Returns the pixel size of the font.

	:rtype: char *
") SPixelSize;
		char * SPixelSize ();
		%feature("autodoc", "	* Returns the point size of the font.

	:rtype: char *
") SPointSize;
		char * SPointSize ();
		%feature("autodoc", "	* Returns the resolution X of the font.

	:rtype: char *
") SResolutionX;
		char * SResolutionX ();
		%feature("autodoc", "	* Returns the resolution Y of the font.

	:rtype: char *
") SResolutionY;
		char * SResolutionY ();
		%feature("autodoc", "	* Returns the spacing of the font.

	:rtype: char *
") SSpacing;
		char * SSpacing ();
		%feature("autodoc", "	* Returns the average width of the font.

	:rtype: char *
") SAverageWidth;
		char * SAverageWidth ();
		%feature("autodoc", "	* Dumps the font attributes.

	:rtype: None
") Dump;
		void Dump ();
		%feature("autodoc", "	:param Other:
	:type Other: Aspect_FontStyle &
	:rtype: bool
") IsEqual;
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
        		%feature("autodoc", "	:param Other:
	:type Other: Aspect_FontStyle &
	:rtype: bool
") IsNotEqual;
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
		%feature("autodoc", "	* Creates an available set of identifiers with the lower //!	 bound 0 and the upper bound INT_MAX/2.

	:rtype: None
") Aspect_GenId;
		 Aspect_GenId ();
		%feature("autodoc", "	* Creates an available set of identifiers with the lower //!	 bound <Low> and the upper bound <Up>. Warning: Raises IdentDefinitionError if <Up> is less than <Low>. Copies the content of <Other> into <self>.

	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") Aspect_GenId;
		 Aspect_GenId (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	* Frees all identifiers of <self>.

	:rtype: None
") Free;
		void Free ();
		%feature("autodoc", "	* Frees the identifier <Id> of <self>.

	:param Id:
	:type Id: Standard_Integer
	:rtype: None
") Free;
		void Free (const Standard_Integer Id);
		%feature("autodoc", "	* Returns the number of available identifiers of <self>.

	:rtype: int
") Available;
		Standard_Integer Available ();
		%feature("autodoc", "	* Returns the lower bound of <self>.

	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "	* Returns an available identifier of <self>. Warning: Raises IdentDefinitionError if all identifiers are busy.

	:rtype: int
") Next;
		Standard_Integer Next ();
		%feature("autodoc", "	* Returns the upper bound of <self>.

	:rtype: int
") Upper;
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
		%feature("autodoc", "	* defines the x Origin of the grid.

	:param anOrigin:
	:type anOrigin: Quantity_Length
	:rtype: None
") SetXOrigin;
		void SetXOrigin (const Quantity_Length anOrigin);
		%feature("autodoc", "	* defines the y Origin of the grid.

	:param anOrigin:
	:type anOrigin: Quantity_Length
	:rtype: None
") SetYOrigin;
		void SetYOrigin (const Quantity_Length anOrigin);
		%feature("autodoc", "	* defines the orientation of the the grid.

	:param anAngle:
	:type anAngle: Quantity_PlaneAngle
	:rtype: None
") SetRotationAngle;
		void SetRotationAngle (const Quantity_PlaneAngle anAngle);
		%feature("autodoc", "	* Rotate the grid from a relative angle.

	:param anAngle:
	:type anAngle: Quantity_PlaneAngle
	:rtype: None
") Rotate;
		void Rotate (const Quantity_PlaneAngle anAngle);
		%feature("autodoc", "	* Translate the grid from a relative distance.

	:param aDx:
	:type aDx: Quantity_Length
	:param aDy:
	:type aDy: Quantity_Length
	:rtype: None
") Translate;
		void Translate (const Quantity_Length aDx,const Quantity_Length aDy);
		%feature("autodoc", "	* Change the colors of the grid

	:param aColor:
	:type aColor: Quantity_Color &
	:param aTenthColor:
	:type aTenthColor: Quantity_Color &
	:rtype: void
") SetColors;
		virtual void SetColors (const Quantity_Color & aColor,const Quantity_Color & aTenthColor);
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
		%feature("autodoc", "	* activates the grid. The Hit method will return gridx and gridx computed according to the steps of the grid.

	:rtype: None
") Activate;
		void Activate ();
		%feature("autodoc", "	* deactivates the grid. The hit method will return gridx and gridx as the enter value X & Y.

	:rtype: None
") Deactivate;
		void Deactivate ();
		%feature("autodoc", "	* returns the x Origin of the grid.

	:rtype: Quantity_Length
") XOrigin;
		Quantity_Length XOrigin ();
		%feature("autodoc", "	* returns the x Origin of the grid.

	:rtype: Quantity_Length
") YOrigin;
		Quantity_Length YOrigin ();
		%feature("autodoc", "	* returns the x Angle of the grid.

	:rtype: Quantity_PlaneAngle
") RotationAngle;
		Quantity_PlaneAngle RotationAngle ();
		%feature("autodoc", "	* Returns True when the grid is active.

	:rtype: bool
") IsActive;
		Standard_Boolean IsActive ();
		%feature("autodoc", "	* Returns the colors of the grid.

	:param aColor:
	:type aColor: Quantity_Color &
	:param aTenthColor:
	:type aTenthColor: Quantity_Color &
	:rtype: None
") Colors;
		void Colors (Quantity_Color & aColor,Quantity_Color & aTenthColor);
		%feature("autodoc", "	* Change the grid aspect.

	:param aDrawMode:
	:type aDrawMode: Aspect_GridDrawMode
	:rtype: None
") SetDrawMode;
		void SetDrawMode (const Aspect_GridDrawMode aDrawMode);
		%feature("autodoc", "	* Returns the grid aspect.

	:rtype: Aspect_GridDrawMode
") DrawMode;
		Aspect_GridDrawMode DrawMode ();
		%feature("autodoc", "	* Display the grid at screen.

	:rtype: void
") Display;
		virtual void Display ();
		%feature("autodoc", "	* Erase the grid from screen.

	:rtype: void
") Erase;
		virtual void Erase ();
		%feature("autodoc", "	* Returns True when the grid is displayed at screen.

	:rtype: bool
") IsDisplayed;
		virtual Standard_Boolean IsDisplayed ();
		%feature("autodoc", "	:rtype: void
") Init;
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
		%feature("autodoc", "	* Creates a line style with the default value of //!	 LineStyle type : SOLID

	:rtype: None
") Aspect_LineStyle;
		 Aspect_LineStyle ();
		%feature("autodoc", "	* Creates the line style <Type>.

	:param Type:
	:type Type: Aspect_TypeOfLine
	:rtype: None
") Aspect_LineStyle;
		 Aspect_LineStyle (const Aspect_TypeOfLine Type);
		%feature("autodoc", "	* Creates a line style from METER Float style descriptor . //!	 Style Descriptor is : //!	 Each Odd float described the Drawn part of the style . //!	 Each Even float described the Hidden part of the style . //!	 (e.g) [0.010,0.002,0.005,0.004] //!		 Draw 10 MM ,Move 2 MM,Draw 5 MM ..

	:param Style:
	:type Style: TColQuantity_Array1OfLength &
	:rtype: None
") Aspect_LineStyle;
		 Aspect_LineStyle (const TColQuantity_Array1OfLength & Style);
		%feature("autodoc", "	* Updates the line style <self> from the definition of the //!	 line style <Other>.

	:param Other:
	:type Other: Aspect_LineStyle &
	:rtype: Aspect_LineStyle
") Assign;
		Aspect_LineStyle & Assign (const Aspect_LineStyle & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Aspect_LineStyle &
	:rtype: Aspect_LineStyle
") operator=;
		Aspect_LineStyle & operator = (const Aspect_LineStyle & Other);
		%feature("autodoc", "	* Updates the line style <self> from the definition of the //!	 line style <Type>.

	:param Type:
	:type Type: Aspect_TypeOfLine
	:rtype: None
") SetValues;
		void SetValues (const Aspect_TypeOfLine Type);
		%feature("autodoc", "	* Updates a line style with the new Float descriptor

	:param Style:
	:type Style: TColQuantity_Array1OfLength &
	:rtype: None
") SetValues;
		void SetValues (const TColQuantity_Array1OfLength & Style);
		%feature("autodoc", "	* Returns the type of the line style <self>

	:rtype: Aspect_TypeOfLine
") Style;
		Aspect_TypeOfLine Style ();
		%feature("autodoc", "	* Returns the components length of the line style

	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	* Returns the components of a line style

	:rtype: TColQuantity_Array1OfLength
") Values;
		const TColQuantity_Array1OfLength & Values ();
		%feature("autodoc", "	:param Other:
	:type Other: Aspect_LineStyle &
	:rtype: bool
") IsEqual;
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
        		%feature("autodoc", "	:param Other:
	:type Other: Aspect_LineStyle &
	:rtype: bool
") IsNotEqual;
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
		%feature("autodoc", "	:rtype: None
") Aspect_MarkMap;
		 Aspect_MarkMap ();
		%feature("autodoc", "	* Adds an entry in the mark map <self>. Warning: Raises BadAccess if MarkMap size is exceeded.

	:param AnEntry:
	:type AnEntry: Aspect_MarkMapEntry &
	:rtype: None
") AddEntry;
		void AddEntry (const Aspect_MarkMapEntry & AnEntry);
		%feature("autodoc", "	* Search an identical marker style entry in the mark map <self> and returns the MarkMapEntry Index if exist. Or add a new entry and returns the computed MarkMapEntry index used.

	:param aStyle:
	:type aStyle: Aspect_MarkerStyle &
	:rtype: int
") AddEntry;
		Standard_Integer AddEntry (const Aspect_MarkerStyle & aStyle);
		%feature("autodoc", "	* Returns the Allocated markmap Size

	:rtype: int
") Size;
		Standard_Integer Size ();
		%feature("autodoc", "	* Returns the MarkMapEntry.Index of the MarkMap at rank <aMarkmapIndex> .

	:param aMarkmapIndex:
	:type aMarkmapIndex: Standard_Integer
	:rtype: int
") Index;
		Standard_Integer Index (const Standard_Integer aMarkmapIndex);
		%feature("autodoc", "	:rtype: None
") Dump;
		void Dump ();
		%feature("autodoc", "	* Returns the Mark map entry with the index <AnIndex>. Warning: Raises BadAccess if the index less than 1 or //!	 greater than Size.

	:param AnIndex:
	:type AnIndex: Standard_Integer
	:rtype: Aspect_MarkMapEntry
") Entry;
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
		%feature("autodoc", "	* Creates an unallocated markmap entry

	:rtype: None
") Aspect_MarkMapEntry;
		 Aspect_MarkMapEntry ();
		%feature("autodoc", "	* Creates an allocated markmap entry

	:param index:
	:type index: Standard_Integer
	:param style:
	:type style: Aspect_MarkerStyle &
	:rtype: None
") Aspect_MarkMapEntry;
		 Aspect_MarkMapEntry (const Standard_Integer index,const Aspect_MarkerStyle & style);
		%feature("autodoc", "	* Creates an allocated markmap entry. Warning: Raises error if the markmap entry <entry> //!	 is unallocated.

	:param entry:
	:type entry: Aspect_MarkMapEntry &
	:rtype: None
") Aspect_MarkMapEntry;
		 Aspect_MarkMapEntry (const Aspect_MarkMapEntry & entry);
		%feature("autodoc", "	* Sets markmap entry value and allocates it.

	:param index:
	:type index: Standard_Integer
	:param style:
	:type style: Aspect_MarkerStyle &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer index,const Aspect_MarkerStyle & style);
		%feature("autodoc", "	* Sets markmap entry value and allocates it.

	:param entry:
	:type entry: Aspect_MarkMapEntry &
	:rtype: None
") SetValue;
		void SetValue (const Aspect_MarkMapEntry & entry);
		%feature("autodoc", "	:param entry:
	:type entry: Aspect_MarkMapEntry &
	:rtype: None
") operator=;
		void operator = (const Aspect_MarkMapEntry & entry);
		%feature("autodoc", "	* Sets the marker style of markmap entry.

	:param Style:
	:type Style: Aspect_MarkerStyle &
	:rtype: None
") SetStyle;
		void SetStyle (const Aspect_MarkerStyle & Style);
		%feature("autodoc", "	:rtype: Aspect_MarkerStyle
") Style;
		const Aspect_MarkerStyle & Style ();
		%feature("autodoc", "	* Sets index value of a markmap entry.

	:param index:
	:type index: Standard_Integer
	:rtype: None
") SetIndex;
		void SetIndex (const Standard_Integer index);
		%feature("autodoc", "	* Returns index value of a markmap entry. Warning: Raises error if the markmap entry is unallocated .

	:rtype: int
") Index;
		Standard_Integer Index ();
		%feature("autodoc", "	* Unallocates the markmap entry.

	:rtype: None
") Free;
		void Free ();
		%feature("autodoc", "	* Returns True if the markmap entry is allocated. Warning: A markmap entry is allocated when the marker and //!	 the index is defined.

	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "	:rtype: None
") Dump;
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
		%feature("autodoc", "	* Creates a marker style with the default value of //!	 MarkerStyle type : POINT

	:rtype: None
") Aspect_MarkerStyle;
		 Aspect_MarkerStyle ();
		%feature("autodoc", "	* Creates the marker style <aType>.

	:param aType:
	:type aType: Aspect_TypeOfMarker
	:rtype: None
") Aspect_MarkerStyle;
		 Aspect_MarkerStyle (const Aspect_TypeOfMarker aType);
		%feature("autodoc", "	* Creates a marker style from a implicit draw point

	:param aXpoint:
	:type aXpoint: TColStd_Array1OfReal &
	:param aYpoint:
	:type aYpoint: TColStd_Array1OfReal &
	:rtype: None
") Aspect_MarkerStyle;
		 Aspect_MarkerStyle (const TColStd_Array1OfReal & aXpoint,const TColStd_Array1OfReal & aYpoint);
		%feature("autodoc", "	* Creates a marker style from a move-draw point descriptor . Each coordinate <aXpoint(i),aYpoint(i)> must be defined

	:param aXpoint:
	:type aXpoint: TColStd_Array1OfReal &
	:param aYpoint:
	:type aYpoint: TColStd_Array1OfReal &
	:param aSpoint:
	:type aSpoint: TColStd_Array1OfBoolean &
	:rtype: None
") Aspect_MarkerStyle;
		 Aspect_MarkerStyle (const TColStd_Array1OfReal & aXpoint,const TColStd_Array1OfReal & aYpoint,const TColStd_Array1OfBoolean & aSpoint);
		%feature("autodoc", "	* Updates the marker style <self> from the definition of the marker style <Other>.

	:param Other:
	:type Other: Aspect_MarkerStyle &
	:rtype: Aspect_MarkerStyle
") Assign;
		Aspect_MarkerStyle & Assign (const Aspect_MarkerStyle & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Aspect_MarkerStyle &
	:rtype: Aspect_MarkerStyle
") operator=;
		Aspect_MarkerStyle & operator = (const Aspect_MarkerStyle & Other);
		%feature("autodoc", "	* Returns the type of the marker style <self>

	:rtype: Aspect_TypeOfMarker
") Type;
		Aspect_TypeOfMarker Type ();
		%feature("autodoc", "	* Returns the components length of the marker descriptors

	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	* Returns the point and status of a marker style

	:param aRank:
	:type aRank: Standard_Integer
	:param aX:
	:type aX: float &
	:param aY:
	:type aY: float &
	:rtype: bool
") Values;
		Standard_Boolean Values (const Standard_Integer aRank,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	* Returns the X vector of a marker style descriptor

	:rtype: TShort_Array1OfShortReal
") XValues;
		const TShort_Array1OfShortReal & XValues ();
		%feature("autodoc", "	* Returns the Y vector of a marker style descriptor

	:rtype: TShort_Array1OfShortReal
") YValues;
		const TShort_Array1OfShortReal & YValues ();
		%feature("autodoc", "	* Returns the State vector of a marker style descriptor

	:rtype: TColStd_Array1OfBoolean
") SValues;
		const TColStd_Array1OfBoolean & SValues ();
		%feature("autodoc", "	:param Other:
	:type Other: Aspect_MarkerStyle &
	:rtype: bool
") IsEqual;
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
        		%feature("autodoc", "	:param Other:
	:type Other: Aspect_MarkerStyle &
	:rtype: bool
") IsNotEqual;
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
		%feature("autodoc", "	:param I:
	:type I: Quantity_Color &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Aspect_SequenceNodeOfSequenceOfColor;
		 Aspect_SequenceNodeOfSequenceOfColor (const Quantity_Color & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Quantity_Color
") Value;
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
		%feature("autodoc", "	:param I:
	:type I: Aspect_ColorMapEntry &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Aspect_SequenceNodeOfSequenceOfColorMapEntry;
		 Aspect_SequenceNodeOfSequenceOfColorMapEntry (const Aspect_ColorMapEntry & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Aspect_ColorMapEntry
") Value;
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
		%feature("autodoc", "	:param I:
	:type I: Aspect_FontMapEntry &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Aspect_SequenceNodeOfSequenceOfFontMapEntry;
		 Aspect_SequenceNodeOfSequenceOfFontMapEntry (const Aspect_FontMapEntry & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Aspect_FontMapEntry
") Value;
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
		%feature("autodoc", "	:param I:
	:type I: Aspect_MarkMapEntry &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Aspect_SequenceNodeOfSequenceOfMarkMapEntry;
		 Aspect_SequenceNodeOfSequenceOfMarkMapEntry (const Aspect_MarkMapEntry & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Aspect_MarkMapEntry
") Value;
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
		%feature("autodoc", "	:param I:
	:type I: Aspect_TypeMapEntry &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Aspect_SequenceNodeOfSequenceOfTypeMapEntry;
		 Aspect_SequenceNodeOfSequenceOfTypeMapEntry (const Aspect_TypeMapEntry & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Aspect_TypeMapEntry
") Value;
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
		%feature("autodoc", "	:param I:
	:type I: Aspect_WidthMapEntry &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Aspect_SequenceNodeOfSequenceOfWidthMapEntry;
		 Aspect_SequenceNodeOfSequenceOfWidthMapEntry (const Aspect_WidthMapEntry & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Aspect_WidthMapEntry
") Value;
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
		%feature("autodoc", "	:rtype: None
") Aspect_SequenceOfColor;
		 Aspect_SequenceOfColor ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: Aspect_SequenceOfColor &
	:rtype: Aspect_SequenceOfColor
") Assign;
		const Aspect_SequenceOfColor & Assign (const Aspect_SequenceOfColor & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Aspect_SequenceOfColor &
	:rtype: Aspect_SequenceOfColor
") operator=;
		const Aspect_SequenceOfColor & operator = (const Aspect_SequenceOfColor & Other);
		%feature("autodoc", "	:param T:
	:type T: Quantity_Color &
	:rtype: None
") Append;
		void Append (const Quantity_Color & T);
		%feature("autodoc", "	:param S:
	:type S: Aspect_SequenceOfColor &
	:rtype: None
") Append;
		void Append (Aspect_SequenceOfColor & S);
		%feature("autodoc", "	:param T:
	:type T: Quantity_Color &
	:rtype: None
") Prepend;
		void Prepend (const Quantity_Color & T);
		%feature("autodoc", "	:param S:
	:type S: Aspect_SequenceOfColor &
	:rtype: None
") Prepend;
		void Prepend (Aspect_SequenceOfColor & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Quantity_Color &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Quantity_Color & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Aspect_SequenceOfColor &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Aspect_SequenceOfColor & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Quantity_Color &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Quantity_Color & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Aspect_SequenceOfColor &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Aspect_SequenceOfColor & S);
		%feature("autodoc", "	:rtype: Quantity_Color
") First;
		const Quantity_Color & First ();
		%feature("autodoc", "	:rtype: Quantity_Color
") Last;
		const Quantity_Color & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: Aspect_SequenceOfColor &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Aspect_SequenceOfColor & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Quantity_Color
") Value;
		const Quantity_Color & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Quantity_Color &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Quantity_Color & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Quantity_Color
") ChangeValue;
		Quantity_Color & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: None
") Remove;
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
		%feature("autodoc", "	:rtype: None
") Aspect_SequenceOfColorMapEntry;
		 Aspect_SequenceOfColorMapEntry ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: Aspect_SequenceOfColorMapEntry &
	:rtype: Aspect_SequenceOfColorMapEntry
") Assign;
		const Aspect_SequenceOfColorMapEntry & Assign (const Aspect_SequenceOfColorMapEntry & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Aspect_SequenceOfColorMapEntry &
	:rtype: Aspect_SequenceOfColorMapEntry
") operator=;
		const Aspect_SequenceOfColorMapEntry & operator = (const Aspect_SequenceOfColorMapEntry & Other);
		%feature("autodoc", "	:param T:
	:type T: Aspect_ColorMapEntry &
	:rtype: None
") Append;
		void Append (const Aspect_ColorMapEntry & T);
		%feature("autodoc", "	:param S:
	:type S: Aspect_SequenceOfColorMapEntry &
	:rtype: None
") Append;
		void Append (Aspect_SequenceOfColorMapEntry & S);
		%feature("autodoc", "	:param T:
	:type T: Aspect_ColorMapEntry &
	:rtype: None
") Prepend;
		void Prepend (const Aspect_ColorMapEntry & T);
		%feature("autodoc", "	:param S:
	:type S: Aspect_SequenceOfColorMapEntry &
	:rtype: None
") Prepend;
		void Prepend (Aspect_SequenceOfColorMapEntry & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Aspect_ColorMapEntry &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Aspect_ColorMapEntry & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Aspect_SequenceOfColorMapEntry &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Aspect_SequenceOfColorMapEntry & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Aspect_ColorMapEntry &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Aspect_ColorMapEntry & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Aspect_SequenceOfColorMapEntry &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Aspect_SequenceOfColorMapEntry & S);
		%feature("autodoc", "	:rtype: Aspect_ColorMapEntry
") First;
		const Aspect_ColorMapEntry & First ();
		%feature("autodoc", "	:rtype: Aspect_ColorMapEntry
") Last;
		const Aspect_ColorMapEntry & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: Aspect_SequenceOfColorMapEntry &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Aspect_SequenceOfColorMapEntry & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Aspect_ColorMapEntry
") Value;
		const Aspect_ColorMapEntry & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Aspect_ColorMapEntry &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Aspect_ColorMapEntry & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Aspect_ColorMapEntry
") ChangeValue;
		Aspect_ColorMapEntry & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: None
") Remove;
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
		%feature("autodoc", "	:rtype: None
") Aspect_SequenceOfFontMapEntry;
		 Aspect_SequenceOfFontMapEntry ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: Aspect_SequenceOfFontMapEntry &
	:rtype: Aspect_SequenceOfFontMapEntry
") Assign;
		const Aspect_SequenceOfFontMapEntry & Assign (const Aspect_SequenceOfFontMapEntry & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Aspect_SequenceOfFontMapEntry &
	:rtype: Aspect_SequenceOfFontMapEntry
") operator=;
		const Aspect_SequenceOfFontMapEntry & operator = (const Aspect_SequenceOfFontMapEntry & Other);
		%feature("autodoc", "	:param T:
	:type T: Aspect_FontMapEntry &
	:rtype: None
") Append;
		void Append (const Aspect_FontMapEntry & T);
		%feature("autodoc", "	:param S:
	:type S: Aspect_SequenceOfFontMapEntry &
	:rtype: None
") Append;
		void Append (Aspect_SequenceOfFontMapEntry & S);
		%feature("autodoc", "	:param T:
	:type T: Aspect_FontMapEntry &
	:rtype: None
") Prepend;
		void Prepend (const Aspect_FontMapEntry & T);
		%feature("autodoc", "	:param S:
	:type S: Aspect_SequenceOfFontMapEntry &
	:rtype: None
") Prepend;
		void Prepend (Aspect_SequenceOfFontMapEntry & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Aspect_FontMapEntry &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Aspect_FontMapEntry & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Aspect_SequenceOfFontMapEntry &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Aspect_SequenceOfFontMapEntry & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Aspect_FontMapEntry &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Aspect_FontMapEntry & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Aspect_SequenceOfFontMapEntry &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Aspect_SequenceOfFontMapEntry & S);
		%feature("autodoc", "	:rtype: Aspect_FontMapEntry
") First;
		const Aspect_FontMapEntry & First ();
		%feature("autodoc", "	:rtype: Aspect_FontMapEntry
") Last;
		const Aspect_FontMapEntry & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: Aspect_SequenceOfFontMapEntry &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Aspect_SequenceOfFontMapEntry & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Aspect_FontMapEntry
") Value;
		const Aspect_FontMapEntry & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Aspect_FontMapEntry &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Aspect_FontMapEntry & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Aspect_FontMapEntry
") ChangeValue;
		Aspect_FontMapEntry & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: None
") Remove;
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
		%feature("autodoc", "	:rtype: None
") Aspect_SequenceOfMarkMapEntry;
		 Aspect_SequenceOfMarkMapEntry ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: Aspect_SequenceOfMarkMapEntry &
	:rtype: Aspect_SequenceOfMarkMapEntry
") Assign;
		const Aspect_SequenceOfMarkMapEntry & Assign (const Aspect_SequenceOfMarkMapEntry & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Aspect_SequenceOfMarkMapEntry &
	:rtype: Aspect_SequenceOfMarkMapEntry
") operator=;
		const Aspect_SequenceOfMarkMapEntry & operator = (const Aspect_SequenceOfMarkMapEntry & Other);
		%feature("autodoc", "	:param T:
	:type T: Aspect_MarkMapEntry &
	:rtype: None
") Append;
		void Append (const Aspect_MarkMapEntry & T);
		%feature("autodoc", "	:param S:
	:type S: Aspect_SequenceOfMarkMapEntry &
	:rtype: None
") Append;
		void Append (Aspect_SequenceOfMarkMapEntry & S);
		%feature("autodoc", "	:param T:
	:type T: Aspect_MarkMapEntry &
	:rtype: None
") Prepend;
		void Prepend (const Aspect_MarkMapEntry & T);
		%feature("autodoc", "	:param S:
	:type S: Aspect_SequenceOfMarkMapEntry &
	:rtype: None
") Prepend;
		void Prepend (Aspect_SequenceOfMarkMapEntry & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Aspect_MarkMapEntry &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Aspect_MarkMapEntry & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Aspect_SequenceOfMarkMapEntry &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Aspect_SequenceOfMarkMapEntry & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Aspect_MarkMapEntry &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Aspect_MarkMapEntry & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Aspect_SequenceOfMarkMapEntry &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Aspect_SequenceOfMarkMapEntry & S);
		%feature("autodoc", "	:rtype: Aspect_MarkMapEntry
") First;
		const Aspect_MarkMapEntry & First ();
		%feature("autodoc", "	:rtype: Aspect_MarkMapEntry
") Last;
		const Aspect_MarkMapEntry & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: Aspect_SequenceOfMarkMapEntry &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Aspect_SequenceOfMarkMapEntry & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Aspect_MarkMapEntry
") Value;
		const Aspect_MarkMapEntry & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Aspect_MarkMapEntry &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Aspect_MarkMapEntry & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Aspect_MarkMapEntry
") ChangeValue;
		Aspect_MarkMapEntry & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: None
") Remove;
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
		%feature("autodoc", "	:rtype: None
") Aspect_SequenceOfTypeMapEntry;
		 Aspect_SequenceOfTypeMapEntry ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: Aspect_SequenceOfTypeMapEntry &
	:rtype: Aspect_SequenceOfTypeMapEntry
") Assign;
		const Aspect_SequenceOfTypeMapEntry & Assign (const Aspect_SequenceOfTypeMapEntry & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Aspect_SequenceOfTypeMapEntry &
	:rtype: Aspect_SequenceOfTypeMapEntry
") operator=;
		const Aspect_SequenceOfTypeMapEntry & operator = (const Aspect_SequenceOfTypeMapEntry & Other);
		%feature("autodoc", "	:param T:
	:type T: Aspect_TypeMapEntry &
	:rtype: None
") Append;
		void Append (const Aspect_TypeMapEntry & T);
		%feature("autodoc", "	:param S:
	:type S: Aspect_SequenceOfTypeMapEntry &
	:rtype: None
") Append;
		void Append (Aspect_SequenceOfTypeMapEntry & S);
		%feature("autodoc", "	:param T:
	:type T: Aspect_TypeMapEntry &
	:rtype: None
") Prepend;
		void Prepend (const Aspect_TypeMapEntry & T);
		%feature("autodoc", "	:param S:
	:type S: Aspect_SequenceOfTypeMapEntry &
	:rtype: None
") Prepend;
		void Prepend (Aspect_SequenceOfTypeMapEntry & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Aspect_TypeMapEntry &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Aspect_TypeMapEntry & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Aspect_SequenceOfTypeMapEntry &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Aspect_SequenceOfTypeMapEntry & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Aspect_TypeMapEntry &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Aspect_TypeMapEntry & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Aspect_SequenceOfTypeMapEntry &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Aspect_SequenceOfTypeMapEntry & S);
		%feature("autodoc", "	:rtype: Aspect_TypeMapEntry
") First;
		const Aspect_TypeMapEntry & First ();
		%feature("autodoc", "	:rtype: Aspect_TypeMapEntry
") Last;
		const Aspect_TypeMapEntry & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: Aspect_SequenceOfTypeMapEntry &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Aspect_SequenceOfTypeMapEntry & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Aspect_TypeMapEntry
") Value;
		const Aspect_TypeMapEntry & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Aspect_TypeMapEntry &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Aspect_TypeMapEntry & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Aspect_TypeMapEntry
") ChangeValue;
		Aspect_TypeMapEntry & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: None
") Remove;
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
		%feature("autodoc", "	:rtype: None
") Aspect_SequenceOfWidthMapEntry;
		 Aspect_SequenceOfWidthMapEntry ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: Aspect_SequenceOfWidthMapEntry &
	:rtype: Aspect_SequenceOfWidthMapEntry
") Assign;
		const Aspect_SequenceOfWidthMapEntry & Assign (const Aspect_SequenceOfWidthMapEntry & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Aspect_SequenceOfWidthMapEntry &
	:rtype: Aspect_SequenceOfWidthMapEntry
") operator=;
		const Aspect_SequenceOfWidthMapEntry & operator = (const Aspect_SequenceOfWidthMapEntry & Other);
		%feature("autodoc", "	:param T:
	:type T: Aspect_WidthMapEntry &
	:rtype: None
") Append;
		void Append (const Aspect_WidthMapEntry & T);
		%feature("autodoc", "	:param S:
	:type S: Aspect_SequenceOfWidthMapEntry &
	:rtype: None
") Append;
		void Append (Aspect_SequenceOfWidthMapEntry & S);
		%feature("autodoc", "	:param T:
	:type T: Aspect_WidthMapEntry &
	:rtype: None
") Prepend;
		void Prepend (const Aspect_WidthMapEntry & T);
		%feature("autodoc", "	:param S:
	:type S: Aspect_SequenceOfWidthMapEntry &
	:rtype: None
") Prepend;
		void Prepend (Aspect_SequenceOfWidthMapEntry & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Aspect_WidthMapEntry &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Aspect_WidthMapEntry & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Aspect_SequenceOfWidthMapEntry &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Aspect_SequenceOfWidthMapEntry & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Aspect_WidthMapEntry &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Aspect_WidthMapEntry & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Aspect_SequenceOfWidthMapEntry &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Aspect_SequenceOfWidthMapEntry & S);
		%feature("autodoc", "	:rtype: Aspect_WidthMapEntry
") First;
		const Aspect_WidthMapEntry & First ();
		%feature("autodoc", "	:rtype: Aspect_WidthMapEntry
") Last;
		const Aspect_WidthMapEntry & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: Aspect_SequenceOfWidthMapEntry &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Aspect_SequenceOfWidthMapEntry & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Aspect_WidthMapEntry
") Value;
		const Aspect_WidthMapEntry & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Aspect_WidthMapEntry &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Aspect_WidthMapEntry & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Aspect_WidthMapEntry
") ChangeValue;
		Aspect_WidthMapEntry & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: None
") Remove;
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
		%feature("autodoc", "	:rtype: None
") Aspect_TypeMap;
		 Aspect_TypeMap ();
		%feature("autodoc", "	* Adds an entry in the type map <self>. Warning: Raises BadAccess if TypeMap size is exceeded.

	:param AnEntry:
	:type AnEntry: Aspect_TypeMapEntry &
	:rtype: None
") AddEntry;
		void AddEntry (const Aspect_TypeMapEntry & AnEntry);
		%feature("autodoc", "	* Search an identical type style entry in the type map <self> and returns the TypeMapEntry Index if exist. Or add a new entry and returns the computed TypeMapEntry index used.

	:param aStyle:
	:type aStyle: Aspect_LineStyle &
	:rtype: int
") AddEntry;
		Standard_Integer AddEntry (const Aspect_LineStyle & aStyle);
		%feature("autodoc", "	* Returns the Allocated typemap Size

	:rtype: int
") Size;
		Standard_Integer Size ();
		%feature("autodoc", "	* Returns the TypeMapEntry.Index of the TypeMap at rank <aTypemapIndex> .

	:param aTypemapIndex:
	:type aTypemapIndex: Standard_Integer
	:rtype: int
") Index;
		Standard_Integer Index (const Standard_Integer aTypemapIndex);
		%feature("autodoc", "	:rtype: None
") Dump;
		void Dump ();
		%feature("autodoc", "	* Returns the Type map entry with the index <AnIndex>. Warning: Raises BadAccess if the index less than 1 or //!	 greater than Size.

	:param AnIndex:
	:type AnIndex: Standard_Integer
	:rtype: Aspect_TypeMapEntry
") Entry;
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
		%feature("autodoc", "	* Creates an unallocated typemap entry

	:rtype: None
") Aspect_TypeMapEntry;
		 Aspect_TypeMapEntry ();
		%feature("autodoc", "	* Creates an allocated typemap entry

	:param index:
	:type index: Standard_Integer
	:param style:
	:type style: Aspect_LineStyle &
	:rtype: None
") Aspect_TypeMapEntry;
		 Aspect_TypeMapEntry (const Standard_Integer index,const Aspect_LineStyle & style);
		%feature("autodoc", "	* Creates an allocated typemap entry. Warning: Raises error if the typemap entry <entry> //!	 is unallocated.

	:param entry:
	:type entry: Aspect_TypeMapEntry &
	:rtype: None
") Aspect_TypeMapEntry;
		 Aspect_TypeMapEntry (const Aspect_TypeMapEntry & entry);
		%feature("autodoc", "	* Sets typemap entry value and allocates it.

	:param index:
	:type index: Standard_Integer
	:param style:
	:type style: Aspect_LineStyle &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer index,const Aspect_LineStyle & style);
		%feature("autodoc", "	* Sets typemap entry value and allocates it.

	:param entry:
	:type entry: Aspect_TypeMapEntry &
	:rtype: None
") SetValue;
		void SetValue (const Aspect_TypeMapEntry & entry);
		%feature("autodoc", "	:param entry:
	:type entry: Aspect_TypeMapEntry &
	:rtype: None
") operator=;
		void operator = (const Aspect_TypeMapEntry & entry);
		%feature("autodoc", "	* Sets the line style of typemap entry.

	:param Style:
	:type Style: Aspect_LineStyle &
	:rtype: None
") SetType;
		void SetType (const Aspect_LineStyle & Style);
		%feature("autodoc", "	:rtype: Aspect_LineStyle
") Type;
		const Aspect_LineStyle & Type ();
		%feature("autodoc", "	* Sets index value of a typemap entry.

	:param index:
	:type index: Standard_Integer
	:rtype: None
") SetIndex;
		void SetIndex (const Standard_Integer index);
		%feature("autodoc", "	* Returns index value of a typemap entry. Warning: Raises error if the typemap entry is unallocated .

	:rtype: int
") Index;
		Standard_Integer Index ();
		%feature("autodoc", "	* Unallocates the typemap entry.

	:rtype: None
") Free;
		void Free ();
		%feature("autodoc", "	* Returns True if the typemap entry is allocated. Warning: A typemap entry is allocated when the type and //!	 the index is defined.

	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "	:rtype: None
") Dump;
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
		%feature("autodoc", "	* Creates a width map.

	:rtype: None
") Aspect_WidthMap;
		 Aspect_WidthMap ();
		%feature("autodoc", "	* Adds an entry in the Width map <self>. Warning: Raises BadAccess if WidthMap size is exceeded.

	:param AnEntry:
	:type AnEntry: Aspect_WidthMapEntry &
	:rtype: None
") AddEntry;
		void AddEntry (const Aspect_WidthMapEntry & AnEntry);
		%feature("autodoc", "	* Search an identical line width entry in the width map <self> and returns the WidthMapEntry Index if exist. Or add a new entry and returns the computed WidthMapEntry index used.

	:param aStyle:
	:type aStyle: Aspect_WidthOfLine
	:rtype: int
") AddEntry;
		Standard_Integer AddEntry (const Aspect_WidthOfLine aStyle);
		%feature("autodoc", "	* Search an identical line width entry in the width map <self> and returns the WidthMapEntry Index if exist. Or add a new entry and returns the computed WidthMapEntry index used.

	:param aStyle:
	:type aStyle: Quantity_Length
	:rtype: int
") AddEntry;
		Standard_Integer AddEntry (const Quantity_Length aStyle);
		%feature("autodoc", "	* Returns the Allocated widthmap Size

	:rtype: int
") Size;
		Standard_Integer Size ();
		%feature("autodoc", "	* Returns the WidthMapEntry.Index of the WidthMap at rank <aWidthmapIndex> .

	:param aWidthmapIndex:
	:type aWidthmapIndex: Standard_Integer
	:rtype: int
") Index;
		Standard_Integer Index (const Standard_Integer aWidthmapIndex);
		%feature("autodoc", "	* Returns the Width map entry with the index <AnIndex>. Warning: Raises BadAccess if the index less than 1 or //!	 greater than Size.

	:param AnIndex:
	:type AnIndex: Standard_Integer
	:rtype: Aspect_WidthMapEntry
") Entry;
		Aspect_WidthMapEntry Entry (const Standard_Integer AnIndex);
		%feature("autodoc", "	:rtype: None
") Dump;
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
		%feature("autodoc", "	* Creates an unallocated widthmap entry

	:rtype: None
") Aspect_WidthMapEntry;
		 Aspect_WidthMapEntry ();
		%feature("autodoc", "	* Creates an allocated widthmap entry from width style

	:param index:
	:type index: Standard_Integer
	:param style:
	:type style: Aspect_WidthOfLine
	:rtype: None
") Aspect_WidthMapEntry;
		 Aspect_WidthMapEntry (const Standard_Integer index,const Aspect_WidthOfLine style);
		%feature("autodoc", "	* Creates an allocated widthmap entry from width value

	:param index:
	:type index: Standard_Integer
	:param width:
	:type width: Quantity_Length
	:rtype: None
") Aspect_WidthMapEntry;
		 Aspect_WidthMapEntry (const Standard_Integer index,const Quantity_Length width);
		%feature("autodoc", "	* Creates an allocated widthmap entry.

	:param entry:
	:type entry: Aspect_WidthMapEntry &
	:rtype: None
") Aspect_WidthMapEntry;
		 Aspect_WidthMapEntry (const Aspect_WidthMapEntry & entry);
		%feature("autodoc", "	* Sets widthmap entry value from width style //!	 and allocates it.

	:param index:
	:type index: Standard_Integer
	:param style:
	:type style: Aspect_WidthOfLine
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer index,const Aspect_WidthOfLine style);
		%feature("autodoc", "	* Sets widthmap entry value from width value //!	 and allocates it.

	:param index:
	:type index: Standard_Integer
	:param width:
	:type width: Quantity_Length
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer index,const Quantity_Length width);
		%feature("autodoc", "	* Sets widthmap entry value and allocates it.

	:param entry:
	:type entry: Aspect_WidthMapEntry &
	:rtype: None
") SetValue;
		void SetValue (const Aspect_WidthMapEntry & entry);
		%feature("autodoc", "	:param entry:
	:type entry: Aspect_WidthMapEntry &
	:rtype: None
") operator=;
		void operator = (const Aspect_WidthMapEntry & entry);
		%feature("autodoc", "	* Sets index value of a widthmap entry.

	:param index:
	:type index: Standard_Integer
	:rtype: None
") SetIndex;
		void SetIndex (const Standard_Integer index);
		%feature("autodoc", "	* Sets width style of widthmap entry.

	:param Style:
	:type Style: Aspect_WidthOfLine
	:rtype: None
") SetType;
		void SetType (const Aspect_WidthOfLine Style);
		%feature("autodoc", "	* Sets width value of widthmap entry.

	:param Width:
	:type Width: Quantity_Length
	:rtype: None
") SetWidth;
		void SetWidth (const Quantity_Length Width);
		%feature("autodoc", "	:rtype: Aspect_WidthOfLine
") Type;
		Aspect_WidthOfLine Type ();
		%feature("autodoc", "	* Returns width value of widthmap entry. Warning: Raises error if the widthmap entry is unallocated .

	:rtype: Quantity_Length
") Width;
		Quantity_Length Width ();
		%feature("autodoc", "	* Returns index value of a widthmap entry. Warning: Raises error if the widthmap entry is unallocated .

	:rtype: int
") Index;
		Standard_Integer Index ();
		%feature("autodoc", "	* Unallocates the widthmap entry.

	:rtype: None
") Free;
		void Free ();
		%feature("autodoc", "	* Returns True if the widthmap entry is allocated. Warning: A widthmap entry is allocated when the width and //!	 the index is defined.

	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "	:rtype: None
") Dump;
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
		%feature("autodoc", "	* Modifies the window background.

	:param ABack:
	:type ABack: Aspect_Background &
	:rtype: None
") SetBackground;
		void SetBackground (const Aspect_Background & ABack);
		%feature("autodoc", "	* Modifies the window background from a Named Color.

	:param theNameOfColor:
	:type theNameOfColor: Quantity_NameOfColor
	:rtype: None
") SetBackground;
		void SetBackground (const Quantity_NameOfColor theNameOfColor);
		%feature("autodoc", "	* Modifies the window background.

	:param color:
	:type color: Quantity_Color &
	:rtype: None
") SetBackground;
		void SetBackground (const Quantity_Color & color);
		%feature("autodoc", "	* Modifies the window gradient background.

	:param ABackground:
	:type ABackground: Aspect_GradientBackground &
	:rtype: None
") SetBackground;
		void SetBackground (const Aspect_GradientBackground & ABackground);
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
		%feature("autodoc", "	* Opens the window <self>.

	:rtype: void
") Map;
		virtual void Map ();
		%feature("autodoc", "	* Closes the window <self>.

	:rtype: void
") Unmap;
		virtual void Unmap ();
		%feature("autodoc", "	* Apply the resizing to the window <self>.

	:rtype: Aspect_TypeOfResize
") DoResize;
		virtual Aspect_TypeOfResize DoResize ();
		%feature("autodoc", "	* Apply the mapping change to the window <self>. and returns True if the window is mapped at screen.

	:rtype: bool
") DoMapping;
		virtual Standard_Boolean DoMapping ();
		%feature("autodoc", "	* Destroy the Window

	:rtype: void
") Destroy;
		virtual void Destroy ();
		%feature("autodoc", "	* Returns the window background.

	:rtype: Aspect_Background
") Background;
		Aspect_Background Background ();
		%feature("autodoc", "	* Returns the current image background fill mode.

	:rtype: Aspect_FillMethod
") BackgroundFillMethod;
		Aspect_FillMethod BackgroundFillMethod ();
		%feature("autodoc", "	* Returns the window gradient background.

	:rtype: Aspect_GradientBackground
") GradientBackground;
		Aspect_GradientBackground GradientBackground ();
		%feature("autodoc", "	* Returns True if the window <self> is opened //!	 and False if the window is closed.

	:rtype: bool
") IsMapped;
		virtual Standard_Boolean IsMapped ();
		%feature("autodoc", "	* Returns True if the window <self> is virtual

	:rtype: bool
") IsVirtual;
		Standard_Boolean IsVirtual ();
		%feature("autodoc", "	* Setup the virtual state

	:param theVirtual:
	:type theVirtual: bool
	:rtype: None
") SetVirtual;
		void SetVirtual (const Standard_Boolean theVirtual);
		%feature("autodoc", "	* Returns The Window RATIO equal to the physical //!	 WIDTH/HEIGHT dimensions

	:rtype: Quantity_Ratio
") Ratio;
		virtual Quantity_Ratio Ratio ();
		%feature("autodoc", "	* Returns The Window POSITION in PIXEL

	:param X1:
	:type X1: Standard_Integer &
	:param Y1:
	:type Y1: Standard_Integer &
	:param X2:
	:type X2: Standard_Integer &
	:param Y2:
	:type Y2: Standard_Integer &
	:rtype: void
") Position;
		virtual void Position (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "	* Returns The Window SIZE in PIXEL

	:param Width:
	:type Width: Standard_Integer &
	:param Height:
	:type Height: Standard_Integer &
	:rtype: void
") Size;
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
		%feature("autodoc", "	* creates a new grid. By default this grid is not active.

	:param aRadiusStep:
	:type aRadiusStep: Quantity_Length
	:param aDivisionNumber:
	:type aDivisionNumber: Standard_Integer
	:param XOrigin: default value is 0
	:type XOrigin: Quantity_Length
	:param anYOrigin: default value is 0
	:type anYOrigin: Quantity_Length
	:param aRotationAngle: default value is 0
	:type aRotationAngle: Quantity_PlaneAngle
	:rtype: None
") Aspect_CircularGrid;
		 Aspect_CircularGrid (const Quantity_Length aRadiusStep,const Standard_Integer aDivisionNumber,const Quantity_Length XOrigin = 0,const Quantity_Length anYOrigin = 0,const Quantity_PlaneAngle aRotationAngle = 0);
		%feature("autodoc", "	* defines the x step of the grid.

	:param aStep:
	:type aStep: Quantity_Length
	:rtype: None
") SetRadiusStep;
		void SetRadiusStep (const Quantity_Length aStep);
		%feature("autodoc", "	* defines the step of the grid.

	:param aNumber:
	:type aNumber: Standard_Integer
	:rtype: None
") SetDivisionNumber;
		void SetDivisionNumber (const Standard_Integer aNumber);
		%feature("autodoc", "	:param XOrigin:
	:type XOrigin: Quantity_Length
	:param YOrigin:
	:type YOrigin: Quantity_Length
	:param RadiusStep:
	:type RadiusStep: Quantity_Length
	:param DivisionNumber:
	:type DivisionNumber: Standard_Integer
	:param RotationAngle:
	:type RotationAngle: Quantity_PlaneAngle
	:rtype: None
") SetGridValues;
		void SetGridValues (const Quantity_Length XOrigin,const Quantity_Length YOrigin,const Quantity_Length RadiusStep,const Standard_Integer DivisionNumber,const Quantity_PlaneAngle RotationAngle);
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
		%feature("autodoc", "	* returns the x step of the grid.

	:rtype: Quantity_Length
") RadiusStep;
		Quantity_Length RadiusStep ();
		%feature("autodoc", "	* returns the x step of the grid.

	:rtype: int
") DivisionNumber;
		Standard_Integer DivisionNumber ();
		%feature("autodoc", "	:rtype: None
") Init;
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
		%feature("autodoc", "	* Create a ColorCube ColorMap.

	:param base_pixel:
	:type base_pixel: Standard_Integer
	:param redmax:
	:type redmax: Standard_Integer
	:param redmult:
	:type redmult: Standard_Integer
	:param greenmax:
	:type greenmax: Standard_Integer
	:param greenmult:
	:type greenmult: Standard_Integer
	:param bluemax:
	:type bluemax: Standard_Integer
	:param bluemult:
	:type bluemult: Standard_Integer
	:rtype: None
") Aspect_ColorCubeColorMap;
		 Aspect_ColorCubeColorMap (const Standard_Integer base_pixel,const Standard_Integer redmax,const Standard_Integer redmult,const Standard_Integer greenmax,const Standard_Integer greenmult,const Standard_Integer bluemax,const Standard_Integer bluemult);
		%feature("autodoc", "	:param base_pixel:
	:type base_pixel: Standard_Integer &
	:param redmax:
	:type redmax: Standard_Integer &
	:param redmult:
	:type redmult: Standard_Integer &
	:param greenmax:
	:type greenmax: Standard_Integer &
	:param greenmult:
	:type greenmult: Standard_Integer &
	:param bluemax:
	:type bluemax: Standard_Integer &
	:param bluemult:
	:type bluemult: Standard_Integer &
	:rtype: None
") ColorCubeDefinition;
		void ColorCubeDefinition (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "	* Returns the index in the ColorMap of the //!	 ColorMapEntry.Index() equal to <AnEntryIndex>. Warning: Raises BadAccess if the index is not defined in the //!	 ColorMap.

	:param AColorMapEntryIndex:
	:type AColorMapEntryIndex: Standard_Integer
	:rtype: int
") FindColorMapIndex;
		Standard_Integer FindColorMapIndex (const Standard_Integer AColorMapEntryIndex);
		%feature("autodoc", "	* Returns the ColorMapEntry with ColorMapEntry.Index() //!	 equal to <AnEntryIndex>. Warning: Raises BadAccess if the index is not defined in the //!	 ColorMap.

	:param AColorMapEntryIndex:
	:type AColorMapEntryIndex: Standard_Integer
	:rtype: Aspect_ColorMapEntry
") FindEntry;
		const Aspect_ColorMapEntry & FindEntry (const Standard_Integer AColorMapEntryIndex);
		%feature("autodoc", "	* Returns the index in the ColorMap of the nearest //!	 matching ColorMapEntry

	:param aColor:
	:type aColor: Quantity_Color &
	:rtype: int
") NearestColorMapIndex;
		Standard_Integer NearestColorMapIndex (const Quantity_Color & aColor);
		%feature("autodoc", "	* Returns the nearest ColorMapEntry that match aColor .

	:param aColor:
	:type aColor: Quantity_Color &
	:rtype: Aspect_ColorMapEntry
") NearestEntry;
		const Aspect_ColorMapEntry & NearestEntry (const Quantity_Color & aColor);
		%feature("autodoc", "	* Search an identical color entry in the color map <self> or returns the nearest ColorMapEntry Index.

	:param aColor:
	:type aColor: Quantity_Color &
	:rtype: int
") AddEntry;
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
		%feature("autodoc", "	:rtype: None
") Aspect_ColorPixel;
		 Aspect_ColorPixel ();
		%feature("autodoc", "	:param aColor:
	:type aColor: Quantity_Color &
	:rtype: None
") Aspect_ColorPixel;
		 Aspect_ColorPixel (const Quantity_Color & aColor);
		%feature("autodoc", "	:rtype: Quantity_Color
") Value;
		const Quantity_Color & Value ();
		%feature("autodoc", "	:param aColor:
	:type aColor: Quantity_Color &
	:rtype: None
") SetValue;
		void SetValue (const Quantity_Color & aColor);

        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
        		%feature("autodoc", "	* Returns a hashed value denoting <self>. This value is in  the range 1..<Upper>.

	:param Upper:
	:type Upper: Standard_Integer
	:rtype: int
") HashCode;
		Standard_Integer HashCode (const Standard_Integer Upper);

        %extend {
            Standard_Integer __hash__() {
            return $self->HashCode(2147483647);
            }
        };
        		%feature("autodoc", "	:param Other:
	:type Other: Aspect_ColorPixel &
	:rtype: bool
") IsEqual;
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
        		%feature("autodoc", "	:param Other:
	:type Other: Aspect_ColorPixel &
	:rtype: bool
") IsNotEqual;
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
        		%feature("autodoc", "	:rtype: Quantity_Color
") _CSFDB_GetAspect_ColorPixelmyColor;
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
		%feature("autodoc", "	* Create a Color Ramp Colormap starting from Black at //!	 basepixel to color at basepixel+dimension-1.

	:param basepixel:
	:type basepixel: Standard_Integer
	:param dimension:
	:type dimension: Standard_Integer
	:param color:
	:type color: Quantity_Color &
	:rtype: None
") Aspect_ColorRampColorMap;
		 Aspect_ColorRampColorMap (const Standard_Integer basepixel,const Standard_Integer dimension,const Quantity_Color & color);
		%feature("autodoc", "	* Create a Color Ramp Colormap starting from Black at //!	 basepixel to color at basepixel+dimension-1.

	:param basepixel:
	:type basepixel: Standard_Integer
	:param dimension:
	:type dimension: Standard_Integer
	:param colorName:
	:type colorName: Quantity_NameOfColor
	:rtype: None
") Aspect_ColorRampColorMap;
		 Aspect_ColorRampColorMap (const Standard_Integer basepixel,const Standard_Integer dimension,const Quantity_NameOfColor colorName);
		%feature("autodoc", "	* Get Color Ramp Colormap definition .

	:param basepixel:
	:type basepixel: Standard_Integer &
	:param dimension:
	:type dimension: Standard_Integer &
	:param color:
	:type color: Quantity_Color &
	:rtype: None
") ColorRampDefinition;
		void ColorRampDefinition (Standard_Integer &OutValue,Standard_Integer &OutValue,Quantity_Color & color);
		%feature("autodoc", "	* Returns the index in the ColorMap of the //!	 ColorMapEntry.Index() equal to <AnEntryIndex>. Warning: Raises BadAccess if the index is not defined in the //!	 ColorMap.

	:param ColorMapEntryIndex:
	:type ColorMapEntryIndex: Standard_Integer
	:rtype: int
") FindColorMapIndex;
		Standard_Integer FindColorMapIndex (const Standard_Integer ColorMapEntryIndex);
		%feature("autodoc", "	* Returns the ColorMapEntry with ColorMapEntry.Index() //!	 equal to <AnEntryIndex>. Warning: Raises BadAccess if the index is not defined in the //!	 ColorMap.

	:param AColorMapEntryIndex:
	:type AColorMapEntryIndex: Standard_Integer
	:rtype: Aspect_ColorMapEntry
") FindEntry;
		const Aspect_ColorMapEntry & FindEntry (const Standard_Integer AColorMapEntryIndex);
		%feature("autodoc", "	* Returns the index in the ColorMap of the //!	 nearest matching ColorMapEntry

	:param aColor:
	:type aColor: Quantity_Color &
	:rtype: int
") NearestColorMapIndex;
		Standard_Integer NearestColorMapIndex (const Quantity_Color & aColor);
		%feature("autodoc", "	* Returns the nearest ColorMapEntry that match aColor .

	:param aColor:
	:type aColor: Quantity_Color &
	:rtype: Aspect_ColorMapEntry
") NearestEntry;
		const Aspect_ColorMapEntry & NearestEntry (const Quantity_Color & aColor);
		%feature("autodoc", "	* Search an identical color entry in the color map <self> or returns the nearest ColorMapEntry Index.

	:param aColor:
	:type aColor: Quantity_Color &
	:rtype: int
") AddEntry;
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
		%feature("autodoc", "	* Creates a generic ColorMap .

	:rtype: None
") Aspect_GenericColorMap;
		 Aspect_GenericColorMap ();
		%feature("autodoc", "	* Adds an entry in the color map <self>. Warning: Raises BadAccess if the ColorMapEntry index is alreadry defined.

	:param AnEntry:
	:type AnEntry: Aspect_ColorMapEntry &
	:rtype: None
") AddEntry;
		void AddEntry (const Aspect_ColorMapEntry & AnEntry);
		%feature("autodoc", "	* Search an identical color entry in the color map <self> and returns the ColorMapEntry Index if exist. Or add a new entry and returns the computed ColorMapEntry index used.

	:param aColor:
	:type aColor: Quantity_Color &
	:rtype: int
") AddEntry;
		Standard_Integer AddEntry (const Quantity_Color & aColor);
		%feature("autodoc", "	* Remove the ColorMapEntry at position index in the ColorMap Warning: Raises BadAccess if the index is not defined in the //!	 ColorMap.

	:param AColorMapEntryIndex:
	:type AColorMapEntryIndex: Standard_Integer
	:rtype: None
") RemoveEntry;
		void RemoveEntry (const Standard_Integer AColorMapEntryIndex);
		%feature("autodoc", "	* Returns the index in the ColorMap of the //!	 ColorMapEntry.Index() equal to <AnEntryIndex>. Warning: Raises BadAccess if the index is not defined in the //!	 ColorMap.

	:param AColorMapEntryIndex:
	:type AColorMapEntryIndex: Standard_Integer
	:rtype: int
") FindColorMapIndex;
		Standard_Integer FindColorMapIndex (const Standard_Integer AColorMapEntryIndex);
		%feature("autodoc", "	* Returns the ColorMapEntry with ColorMapEntry.Index() //!	 equal to <AnEntryIndex>. Warning: Raises BadAccess if the index is not defined in the //!	 ColorMap.

	:param AColorMapEntryIndex:
	:type AColorMapEntryIndex: Standard_Integer
	:rtype: Aspect_ColorMapEntry
") FindEntry;
		const Aspect_ColorMapEntry & FindEntry (const Standard_Integer AColorMapEntryIndex);
		%feature("autodoc", "	* Returns the index in the ColorMap of the //!	 nearest matching ColorMapEntry

	:param aColor:
	:type aColor: Quantity_Color &
	:rtype: int
") NearestColorMapIndex;
		Standard_Integer NearestColorMapIndex (const Quantity_Color & aColor);
		%feature("autodoc", "	* Returns the nearest ColorMapEntry that match aColor .

	:param aColor:
	:type aColor: Quantity_Color &
	:rtype: Aspect_ColorMapEntry
") NearestEntry;
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
		%feature("autodoc", "	* Creates a window gradient background. Default colors : Quantity_NOC_BLACK. Default fill method : Aspect_GFM_NONE

	:rtype: None
") Aspect_GradientBackground;
		 Aspect_GradientBackground ();
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
		%feature("autodoc", "	* Returns colours of the window gradient background <self>.

	:param AColor1:
	:type AColor1: Quantity_Color &
	:param AColor2:
	:type AColor2: Quantity_Color &
	:rtype: None
") Colors;
		void Colors (Quantity_Color & AColor1,Quantity_Color & AColor2);
		%feature("autodoc", "	* Returns the current gradient background fill mode.

	:rtype: Aspect_GradientFillMethod
") BgGradientFillMethod;
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
		%feature("autodoc", "	:rtype: None
") Aspect_IndexPixel;
		 Aspect_IndexPixel ();
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: None
") Aspect_IndexPixel;
		 Aspect_IndexPixel (const Standard_Integer anIndex);
		%feature("autodoc", "	:rtype: int
") Value;
		Standard_Integer Value ();
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex);
		%feature("autodoc", "	* Returns a hashed value denoting <self>. This value is in  the range 1..<Upper>.

	:param Upper:
	:type Upper: Standard_Integer
	:rtype: int
") HashCode;
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
        		%feature("autodoc", "	:param Other:
	:type Other: Aspect_IndexPixel &
	:rtype: bool
") IsEqual;
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
        		%feature("autodoc", "	:param Other:
	:type Other: Aspect_IndexPixel &
	:rtype: bool
") IsNotEqual;
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
        		%feature("autodoc", "	:rtype: int
") _CSFDB_GetAspect_IndexPixelmyIndex;
		Standard_Integer _CSFDB_GetAspect_IndexPixelmyIndex ();
		%feature("autodoc", "	:param p:
	:type p: Standard_Integer
	:rtype: None
") _CSFDB_SetAspect_IndexPixelmyIndex;
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
		%feature("autodoc", "	* defines the x step of the grid.

	:param aStep:
	:type aStep: Quantity_Length
	:rtype: None
") SetXStep;
		void SetXStep (const Quantity_Length aStep);
		%feature("autodoc", "	* defines the y step of the grid.

	:param aStep:
	:type aStep: Quantity_Length
	:rtype: None
") SetYStep;
		void SetYStep (const Quantity_Length aStep);
		%feature("autodoc", "	* defines the angle of the second network the fist angle is given relatively to the horizontal. the second angle is given relatively to the vertical.

	:param anAngle1:
	:type anAngle1: Quantity_PlaneAngle
	:param anAngle2:
	:type anAngle2: Quantity_PlaneAngle
	:rtype: None
") SetAngle;
		void SetAngle (const Quantity_PlaneAngle anAngle1,const Quantity_PlaneAngle anAngle2);
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
		%feature("autodoc", "	* returns the x step of the grid.

	:rtype: Quantity_Length
") XStep;
		Quantity_Length XStep ();
		%feature("autodoc", "	* returns the x step of the grid.

	:rtype: Quantity_Length
") YStep;
		Quantity_Length YStep ();
		%feature("autodoc", "	* returns the x Angle of the grid, relatively to the horizontal.

	:rtype: Quantity_PlaneAngle
") FirstAngle;
		Quantity_PlaneAngle FirstAngle ();
		%feature("autodoc", "	* returns the y Angle of the grid, relatively to the vertical.

	:rtype: Quantity_PlaneAngle
") SecondAngle;
		Quantity_PlaneAngle SecondAngle ();
		%feature("autodoc", "	:rtype: None
") Init;
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
		%feature("autodoc", "	* Begin graphics and drawn directly to the Window or Pixmap if

	:param DoubleBuffer: default value is Standard_True
	:type DoubleBuffer: bool
	:param aRetainBuffer: default value is 0
	:type aRetainBuffer: Standard_Integer
	:rtype: void
") BeginDraw;
		virtual void BeginDraw (const Standard_Boolean DoubleBuffer = Standard_True,const Standard_Integer aRetainBuffer = 0);
		%feature("autodoc", "	:rtype: Aspect_TypeOfResize
") ResizeSpace;
		virtual Aspect_TypeOfResize ResizeSpace ();
		%feature("autodoc", "	:rtype: Handle_Aspect_Window
") Window;
		Handle_Aspect_Window Window ();
		%feature("autodoc", "	* Change the current drawing mode of the Driver 	 XW_REPLACE : the primitive is drawn with his defined color. //!	 XW_ERASE : the primitive is erased from the window. //!	 XW_XOR : the primitive is xored to the window. //!	 XW_XORLIGHT: the primitive is xored depending of the current //!			highlight and background colors.

	:param aMode:
	:type aMode: Aspect_TypeOfDrawMode
	:rtype: void
") SetDrawMode;
		virtual void SetDrawMode (const Aspect_TypeOfDrawMode aMode);
		%feature("autodoc", "	* Allocate the retain buffer <aRetainBuffer> , Defines the DWU coordinates of the pivot point for all primitives

	:param aRetainBuffer:
	:type aRetainBuffer: Standard_Integer
	:param aPivotX: default value is 0.0
	:type aPivotX: Standard_ShortReal
	:param aPivotY: default value is 0.0
	:type aPivotY: Standard_ShortReal
	:param aWidthIndex: default value is 0
	:type aWidthIndex: Standard_Integer
	:param aColorIndex: default value is 0
	:type aColorIndex: Standard_Integer
	:param aFontIndex: default value is 0
	:type aFontIndex: Standard_Integer
	:param aDrawMode: default value is Aspect_TODM_REPLACE
	:type aDrawMode: Aspect_TypeOfDrawMode
	:rtype: bool
") OpenBuffer;
		virtual Standard_Boolean OpenBuffer (const Standard_Integer aRetainBuffer,const Standard_ShortReal aPivotX = 0.0,const Standard_ShortReal aPivotY = 0.0,const Standard_Integer aWidthIndex = 0,const Standard_Integer aColorIndex = 0,const Standard_Integer aFontIndex = 0,const Aspect_TypeOfDrawMode aDrawMode = Aspect_TODM_REPLACE);
		%feature("autodoc", "	* Clear & Deallocate the retain buffer <aRetainBuffer>.

	:param aRetainBuffer:
	:type aRetainBuffer: Standard_Integer
	:rtype: void
") CloseBuffer;
		virtual void CloseBuffer (const Standard_Integer aRetainBuffer);
		%feature("autodoc", "	* Erase & Clear ALL primitives retains in the buffer <aRetainBuffer>.

	:param aRetainBuffer:
	:type aRetainBuffer: Standard_Integer
	:rtype: void
") ClearBuffer;
		virtual void ClearBuffer (const Standard_Integer aRetainBuffer);
		%feature("autodoc", "	* Draw ALL primitives retains in the buffer <aRetainBuffer>. Warning: Note that the aspect of a retain buffer drawing is mono-colored with the current buffer Attributes and Depending of the DoubleBuffer state flag at the BeginDraw() buffer time, when DB is True,an XOR method is use for drawing and erasing buffers in the same way.In this case,some color side effect can occurs depending of the traversal primitive colors and the supported hardware. when DB is False and the background drawing has been generated with DB at True,no color side effect occurs because the DB is used for restoring the drawing context at EraseBuffer() time,this is more powerfull for the drawing quality excepted for large buffers (flicking) .

	:param aRetainBuffer:
	:type aRetainBuffer: Standard_Integer
	:rtype: void
") DrawBuffer;
		virtual void DrawBuffer (const Standard_Integer aRetainBuffer);
		%feature("autodoc", "	* Erase ALL primitives retains in the buffer <aRetainBuffer>.

	:param aRetainBuffer:
	:type aRetainBuffer: Standard_Integer
	:rtype: void
") EraseBuffer;
		virtual void EraseBuffer (const Standard_Integer aRetainBuffer);
		%feature("autodoc", "	* Erase , Translate and reDraw ALL primitives retains in the buffer

	:param aRetainBuffer:
	:type aRetainBuffer: Standard_Integer
	:param aPivotX: default value is 0.0
	:type aPivotX: Standard_ShortReal
	:param aPivotY: default value is 0.0
	:type aPivotY: Standard_ShortReal
	:rtype: void
") MoveBuffer;
		virtual void MoveBuffer (const Standard_Integer aRetainBuffer,const Standard_ShortReal aPivotX = 0.0,const Standard_ShortReal aPivotY = 0.0);
		%feature("autodoc", "	* Erase , Scale the buffer from the Pivot point and reDraw ALL primitives

	:param aRetainBuffer:
	:type aRetainBuffer: Standard_Integer
	:param aScaleX: default value is 1.0
	:type aScaleX: Quantity_Factor
	:param aScaleY: default value is 1.0
	:type aScaleY: Quantity_Factor
	:rtype: void
") ScaleBuffer;
		virtual void ScaleBuffer (const Standard_Integer aRetainBuffer,const Quantity_Factor aScaleX = 1.0,const Quantity_Factor aScaleY = 1.0);
		%feature("autodoc", "	* Erase , Rotate the buffer from the Pivot point and reDraw ALL primitives

	:param aRetainBuffer:
	:type aRetainBuffer: Standard_Integer
	:param anAngle: default value is 0.0
	:type anAngle: Quantity_PlaneAngle
	:rtype: void
") RotateBuffer;
		virtual void RotateBuffer (const Standard_Integer aRetainBuffer,const Quantity_PlaneAngle anAngle = 0.0);
		%feature("autodoc", "	* Returns True if the retain buffer <aRetainBuffer> is enabled

	:param aRetainBuffer:
	:type aRetainBuffer: Standard_Integer
	:rtype: bool
") BufferIsOpen;
		virtual Standard_Boolean BufferIsOpen (const Standard_Integer aRetainBuffer);
		%feature("autodoc", "	* Returns True if the retain buffer has not been opened or empty.  Returns False if a lot of primitives have been stored inside  because a BeginDraw(..,<aRetainBuffer>) has been done previously.

	:param aRetainBuffer:
	:type aRetainBuffer: Standard_Integer
	:rtype: bool
") BufferIsEmpty;
		virtual Standard_Boolean BufferIsEmpty (const Standard_Integer aRetainBuffer);
		%feature("autodoc", "	* Returns True if the retain buffer s actually displayed at screen.

	:param aRetainBuffer:
	:type aRetainBuffer: Standard_Integer
	:rtype: bool
") BufferIsDrawn;
		virtual Standard_Boolean BufferIsDrawn (const Standard_Integer aRetainBuffer);
		%feature("autodoc", "	* Returns the current buffer rotate angle from the X axis.

	:param aRetainBuffer:
	:type aRetainBuffer: Standard_Integer
	:param anAngle:
	:type anAngle: Quantity_PlaneAngle &
	:rtype: void
") AngleOfBuffer;
		virtual void AngleOfBuffer (const Standard_Integer aRetainBuffer,Quantity_PlaneAngle & anAngle);
		%feature("autodoc", "	* Returns the current buffer scale factors.

	:param aRetainBuffer:
	:type aRetainBuffer: Standard_Integer
	:param aScaleX:
	:type aScaleX: Quantity_Factor &
	:param aScaleY:
	:type aScaleY: Quantity_Factor &
	:rtype: void
") ScaleOfBuffer;
		virtual void ScaleOfBuffer (const Standard_Integer aRetainBuffer,Quantity_Factor & aScaleX,Quantity_Factor & aScaleY);
		%feature("autodoc", "	* Returns the current buffer position.

	:param aRetainBuffer:
	:type aRetainBuffer: Standard_Integer
	:param aPivotX:
	:type aPivotX: Standard_ShortReal &
	:param aPivotY:
	:type aPivotY: Standard_ShortReal &
	:rtype: void
") PositionOfBuffer;
		virtual void PositionOfBuffer (const Standard_Integer aRetainBuffer,Standard_ShortReal & aPivotX,Standard_ShortReal & aPivotY);
		%feature("autodoc", "	* Returns the TEXT size in DWU space depending of the required FontIndex if aFontIndex is >= 0 or the current FontIndex if < 0 (default).

	:param aText:
	:type aText: TCollection_ExtendedString &
	:param aWidth:
	:type aWidth: Standard_ShortReal &
	:param aHeight:
	:type aHeight: Standard_ShortReal &
	:param aFontIndex: default value is -1
	:type aFontIndex: Standard_Integer
	:rtype: void
") TextSize;
		virtual void TextSize (const TCollection_ExtendedString & aText,Standard_ShortReal & aWidth,Standard_ShortReal & aHeight,const Standard_Integer aFontIndex = -1);
		%feature("autodoc", "	* Returns the TEXT size and offsets //!	 in DWU space depending of the required FontIndex if aFontIndex is >= 0 or the current FontIndex if < 0 (default).

	:param aText:
	:type aText: TCollection_ExtendedString &
	:param aWidth:
	:type aWidth: Standard_ShortReal &
	:param aHeight:
	:type aHeight: Standard_ShortReal &
	:param anXoffset:
	:type anXoffset: Standard_ShortReal &
	:param anYoffset:
	:type anYoffset: Standard_ShortReal &
	:param aFontIndex: default value is -1
	:type aFontIndex: Standard_Integer
	:rtype: void
") TextSize;
		virtual void TextSize (const TCollection_ExtendedString & aText,Standard_ShortReal & aWidth,Standard_ShortReal & aHeight,Standard_ShortReal & anXoffset,Standard_ShortReal & anYoffset,const Standard_Integer aFontIndex = -1);
		%feature("autodoc", "	* Returns the font string,slant,size and

	:param aSlant:
	:type aSlant: Quantity_PlaneAngle &
	:param aSize:
	:type aSize: Standard_ShortReal &
	:param aBheight:
	:type aBheight: Standard_ShortReal &
	:param aFontIndex: default value is -1
	:type aFontIndex: Standard_Integer
	:rtype: char *
") FontSize;
		virtual char * FontSize (Quantity_PlaneAngle & aSlant,Standard_ShortReal & aSize,Standard_ShortReal & aBheight,const Standard_Integer aFontIndex = -1);
		%feature("autodoc", "	* Returns the min and max driver virtual color indexs.

	:param aMinIndex:
	:type aMinIndex: Standard_Integer &
	:param aMaxIndex:
	:type aMaxIndex: Standard_Integer &
	:rtype: void
") ColorBoundIndexs;
		virtual void ColorBoundIndexs (Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "	* Returns the local colormap hardware index from a virtual driver color index or returns -1 if the index is not defined.

	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: int
") LocalColorIndex;
		virtual Standard_Integer LocalColorIndex (const Standard_Integer anIndex);
		%feature("autodoc", "	* Returns the min and max driver virtual font indexs.

	:param aMinIndex:
	:type aMinIndex: Standard_Integer &
	:param aMaxIndex:
	:type aMaxIndex: Standard_Integer &
	:rtype: void
") FontBoundIndexs;
		virtual void FontBoundIndexs (Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "	* Returns the associated fontmap hardware index from a virtual driver font index or returns -1 if the index is not defined.

	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: int
") LocalFontIndex;
		virtual Standard_Integer LocalFontIndex (const Standard_Integer anIndex);
		%feature("autodoc", "	* Returns the min and max driver virtual type indexs.

	:param aMinIndex:
	:type aMinIndex: Standard_Integer &
	:param aMaxIndex:
	:type aMaxIndex: Standard_Integer &
	:rtype: void
") TypeBoundIndexs;
		virtual void TypeBoundIndexs (Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "	* Returns the associated typemap hardware index from a virtual driver type index or returns -1 if the index is not defined.

	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: int
") LocalTypeIndex;
		virtual Standard_Integer LocalTypeIndex (const Standard_Integer anIndex);
		%feature("autodoc", "	* Returns the min and max driver virtual width indexs.

	:param aMinIndex:
	:type aMinIndex: Standard_Integer &
	:param aMaxIndex:
	:type aMaxIndex: Standard_Integer &
	:rtype: void
") WidthBoundIndexs;
		virtual void WidthBoundIndexs (Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "	* Returns the associated widthmap hardware index from a virtual driver width index or returns -1 if the index is not defined.

	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: int
") LocalWidthIndex;
		virtual Standard_Integer LocalWidthIndex (const Standard_Integer anIndex);
		%feature("autodoc", "	* Returns the min and max driver virtual marker indexs.

	:param aMinIndex:
	:type aMinIndex: Standard_Integer &
	:param aMaxIndex:
	:type aMaxIndex: Standard_Integer &
	:rtype: void
") MarkBoundIndexs;
		virtual void MarkBoundIndexs (Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "	* Returns the local markmap hardware index from a virtual driver marker index or returns -1 if the index is not defined.

	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: int
") LocalMarkIndex;
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

