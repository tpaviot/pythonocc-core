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

/*
This file was automatically generated using the pythonocc_generator, see
https://github.com/tpaviot/pythonocc-generator.

This file is platform independant, but was generated under the following
conditions:

- operating system : debian Linux 4.15.0-66-generic
- occt version targeted : 7.4.0
*/

%define ASPECTDOCSTRING
"No docstring provided."
%enddef
%module (package="OCC.Core", docstring=ASPECTDOCSTRING) Aspect

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


%include Aspect_headers.i

/* public enums */
enum Aspect_VKeyBasic {
	Aspect_VKey_UNKNOWN = 0,
	Aspect_VKey_A = 1,
	Aspect_VKey_B = 2,
	Aspect_VKey_C = 3,
	Aspect_VKey_D = 4,
	Aspect_VKey_E = 5,
	Aspect_VKey_F = 6,
	Aspect_VKey_G = 7,
	Aspect_VKey_H = 8,
	Aspect_VKey_I = 9,
	Aspect_VKey_J = 10,
	Aspect_VKey_K = 11,
	Aspect_VKey_L = 12,
	Aspect_VKey_M = 13,
	Aspect_VKey_N = 14,
	Aspect_VKey_O = 15,
	Aspect_VKey_P = 16,
	Aspect_VKey_Q = 17,
	Aspect_VKey_R = 18,
	Aspect_VKey_S = 19,
	Aspect_VKey_T = 20,
	Aspect_VKey_U = 21,
	Aspect_VKey_V = 22,
	Aspect_VKey_W = 23,
	Aspect_VKey_X = 24,
	Aspect_VKey_Y = 25,
	Aspect_VKey_Z = 26,
	Aspect_VKey_0 = 27,
	Aspect_VKey_1 = 28,
	Aspect_VKey_2 = 29,
	Aspect_VKey_3 = 30,
	Aspect_VKey_4 = 31,
	Aspect_VKey_5 = 32,
	Aspect_VKey_6 = 33,
	Aspect_VKey_7 = 34,
	Aspect_VKey_8 = 35,
	Aspect_VKey_9 = 36,
	Aspect_VKey_F1 = 37,
	Aspect_VKey_F2 = 38,
	Aspect_VKey_F3 = 39,
	Aspect_VKey_F4 = 40,
	Aspect_VKey_F5 = 41,
	Aspect_VKey_F6 = 42,
	Aspect_VKey_F7 = 43,
	Aspect_VKey_F8 = 44,
	Aspect_VKey_F9 = 45,
	Aspect_VKey_F10 = 46,
	Aspect_VKey_F11 = 47,
	Aspect_VKey_F12 = 48,
	Aspect_VKey_Up = 49,
	Aspect_VKey_Down = 50,
	Aspect_VKey_Left = 51,
	Aspect_VKey_Right = 52,
	Aspect_VKey_Plus = 53,
	Aspect_VKey_Minus = 54,
	Aspect_VKey_Equal = 55,
	Aspect_VKey_PageUp = 56,
	Aspect_VKey_PageDown = 57,
	Aspect_VKey_Home = 58,
	Aspect_VKey_End = 59,
	Aspect_VKey_Escape = 60,
	Aspect_VKey_Back = 61,
	Aspect_VKey_Enter = 62,
	Aspect_VKey_Backspace = 63,
	Aspect_VKey_Space = 64,
	Aspect_VKey_Delete = 65,
	Aspect_VKey_Tilde = 66,
	Aspect_VKey_Tab = 67,
	Aspect_VKey_Comma = 68,
	Aspect_VKey_Period = 69,
	Aspect_VKey_Semicolon = 70,
	Aspect_VKey_Slash = 71,
	Aspect_VKey_BracketLeft = 72,
	Aspect_VKey_Backslash = 73,
	Aspect_VKey_BracketRight = 74,
	Aspect_VKey_Apostrophe = 75,
	Aspect_VKey_Numlock = 76,
	Aspect_VKey_Scroll = 77,
	Aspect_VKey_Numpad0 = 78,
	Aspect_VKey_Numpad1 = 79,
	Aspect_VKey_Numpad2 = 80,
	Aspect_VKey_Numpad3 = 81,
	Aspect_VKey_Numpad4 = 82,
	Aspect_VKey_Numpad5 = 83,
	Aspect_VKey_Numpad6 = 84,
	Aspect_VKey_Numpad7 = 85,
	Aspect_VKey_Numpad8 = 86,
	Aspect_VKey_Numpad9 = 87,
	Aspect_VKey_NumpadMultiply = 88,
	Aspect_VKey_NumpadAdd = 89,
	Aspect_VKey_NumpadSubtract = 90,
	Aspect_VKey_NumpadDivide = 91,
	Aspect_VKey_MediaNextTrack = 92,
	Aspect_VKey_MediaPreviousTrack = 93,
	Aspect_VKey_MediaStop = 94,
	Aspect_VKey_MediaPlayPause = 95,
	Aspect_VKey_VolumeMute = 96,
	Aspect_VKey_VolumeDown = 97,
	Aspect_VKey_VolumeUp = 98,
	Aspect_VKey_BrowserBack = 99,
	Aspect_VKey_BrowserForward = 100,
	Aspect_VKey_BrowserRefresh = 101,
	Aspect_VKey_BrowserStop = 102,
	Aspect_VKey_BrowserSearch = 103,
	Aspect_VKey_BrowserFavorites = 104,
	Aspect_VKey_BrowserHome = 105,
	Aspect_VKey_Shift = 106,
	Aspect_VKey_Control = 107,
	Aspect_VKey_Alt = 108,
	Aspect_VKey_Menu = 109,
	Aspect_VKey_Meta = 110,
	Aspect_VKey_NavInteract = 111,
	Aspect_VKey_NavForward = 112,
	Aspect_VKey_NavBackward = 113,
	Aspect_VKey_NavSlideLeft = 114,
	Aspect_VKey_NavSlideRight = 115,
	Aspect_VKey_NavSlideUp = 116,
	Aspect_VKey_NavSlideDown = 117,
	Aspect_VKey_NavRollCCW = 118,
	Aspect_VKey_NavRollCW = 119,
	Aspect_VKey_NavLookLeft = 120,
	Aspect_VKey_NavLookRight = 121,
	Aspect_VKey_NavLookUp = 122,
	Aspect_VKey_NavLookDown = 123,
	Aspect_VKey_NavCrouch = 124,
	Aspect_VKey_NavJump = 125,
	Aspect_VKey_NavThrustForward = 126,
	Aspect_VKey_NavThrustBackward = 127,
	Aspect_VKey_NavThrustStop = 128,
	Aspect_VKey_NavSpeedIncrease = 129,
	Aspect_VKey_NavSpeedDecrease = 130,
};

enum  {
	Aspect_VKey_Lower = 0,
	Aspect_VKey_ModifiersLower = Aspect_VKey_Shift,
	Aspect_VKey_ModifiersUpper = Aspect_VKey_Meta,
	Aspect_VKey_NavigationKeysLower = Aspect_VKey_NavInteract,
	Aspect_VKey_NavigationKeysUpper = Aspect_VKey_NavSpeedDecrease,
	Aspect_VKey_Upper = Aspect_VKey_NavSpeedDecrease,
	Aspect_VKey_NB = Aspect_VKey_Upper - Aspect_VKey_Lower + 1,
	Aspect_VKey_MAX = 255,
};

enum Aspect_TypeOfDeflection {
	Aspect_TOD_RELATIVE = 0,
	Aspect_TOD_ABSOLUTE = 1,
};

enum Aspect_TypeOfLine {
	Aspect_TOL_EMPTY = - 1,
	Aspect_TOL_SOLID = 0,
	Aspect_TOL_DASH = 1,
	Aspect_TOL_DOT = 2,
	Aspect_TOL_DOTDASH = 3,
	Aspect_TOL_USERDEFINED = 4,
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

enum Aspect_TypeOfHighlightMethod {
	Aspect_TOHM_COLOR = 0,
	Aspect_TOHM_BOUNDBOX = 1,
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

enum Aspect_GridType {
	Aspect_GT_Rectangular = 0,
	Aspect_GT_Circular = 1,
};

enum Aspect_TypeOfColorScaleData {
	Aspect_TOCSD_AUTO = 0,
	Aspect_TOCSD_USER = 1,
};

enum Aspect_TypeOfStyleText {
	Aspect_TOST_NORMAL = 0,
	Aspect_TOST_ANNOTATION = 1,
};

enum Aspect_TypeOfMarker {
	Aspect_TOM_EMPTY = - 1,
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

enum Aspect_TypeOfColorScaleOrientation {
	Aspect_TOCSO_NONE = 0,
	Aspect_TOCSO_LEFT = 1,
	Aspect_TOCSO_RIGHT = 2,
	Aspect_TOCSO_CENTER = 3,
};

enum Aspect_TypeOfFacingModel {
	Aspect_TOFM_BOTH_SIDE = 0,
	Aspect_TOFM_BACK_SIDE = 1,
	Aspect_TOFM_FRONT_SIDE = 2,
};

enum Aspect_FillMethod {
	Aspect_FM_NONE = 0,
	Aspect_FM_CENTERED = 1,
	Aspect_FM_TILED = 2,
	Aspect_FM_STRETCH = 3,
};

enum Aspect_HatchStyle {
	Aspect_HS_SOLID = 0,
	Aspect_HS_HORIZONTAL = 7,
	Aspect_HS_HORIZONTAL_WIDE = 11,
	Aspect_HS_VERTICAL = 8,
	Aspect_HS_VERTICAL_WIDE = 12,
	Aspect_HS_DIAGONAL_45 = 5,
	Aspect_HS_DIAGONAL_45_WIDE = 9,
	Aspect_HS_DIAGONAL_135 = 6,
	Aspect_HS_DIAGONAL_135_WIDE = 10,
	Aspect_HS_GRID = 3,
	Aspect_HS_GRID_WIDE = 4,
	Aspect_HS_GRID_DIAGONAL = 1,
	Aspect_HS_GRID_DIAGONAL_WIDE = 2,
	Aspect_HS_NB = 13,
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

enum Aspect_TypeOfColorScalePosition {
	Aspect_TOCSP_NONE = 0,
	Aspect_TOCSP_LEFT = 1,
	Aspect_TOCSP_RIGHT = 2,
	Aspect_TOCSP_CENTER = 3,
};

enum  {
	Aspect_VKeyFlags_NONE = 0,
	Aspect_VKeyFlags_SHIFT = 1 << 8,
	Aspect_VKeyFlags_CTRL = 1 << 9,
	Aspect_VKeyFlags_ALT = 1 << 10,
	Aspect_VKeyFlags_MENU = 1 << 11,
	Aspect_VKeyFlags_META = 1 << 12,
	Aspect_VKeyFlags_ALL = Aspect_VKeyFlags_SHIFT | Aspect_VKeyFlags_CTRL | Aspect_VKeyFlags_ALT | Aspect_VKeyFlags_MENU | Aspect_VKeyFlags_META,
};

enum  {
	Aspect_VKeyMouse_NONE = 0,
	Aspect_VKeyMouse_LeftButton = 1 << 13,
	Aspect_VKeyMouse_MiddleButton = 1 << 14,
	Aspect_VKeyMouse_RightButton = 1 << 15,
	Aspect_VKeyMouse_MainButtons = Aspect_VKeyMouse_LeftButton | Aspect_VKeyMouse_MiddleButton | Aspect_VKeyMouse_RightButton,
};

enum Aspect_XAtom {
	Aspect_XA_DELETE_WINDOW = 0,
};

enum Aspect_TypeOfTriedronPosition {
	Aspect_TOTP_CENTER = 0,
	Aspect_TOTP_TOP = 1,
	Aspect_TOTP_BOTTOM = 2,
	Aspect_TOTP_LEFT = 4,
	Aspect_TOTP_RIGHT = 8,
	Aspect_TOTP_LEFT_LOWER = Aspect_TOTP_BOTTOM | Aspect_TOTP_LEFT,
	Aspect_TOTP_LEFT_UPPER = Aspect_TOTP_TOP | Aspect_TOTP_LEFT,
	Aspect_TOTP_RIGHT_LOWER = Aspect_TOTP_BOTTOM | Aspect_TOTP_RIGHT,
	Aspect_TOTP_RIGHT_UPPER = Aspect_TOTP_TOP | Aspect_TOTP_RIGHT,
};

enum Aspect_GridDrawMode {
	Aspect_GDM_Lines = 0,
	Aspect_GDM_Points = 1,
	Aspect_GDM_None = 2,
};

enum Aspect_WidthOfLine {
	Aspect_WOL_THIN = 0,
	Aspect_WOL_MEDIUM = 1,
	Aspect_WOL_THICK = 2,
	Aspect_WOL_VERYTHICK = 3,
	Aspect_WOL_USERDEFINED = 4,
};

enum Aspect_TypeOfDisplayText {
	Aspect_TODT_NORMAL = 0,
	Aspect_TODT_SUBTITLE = 1,
	Aspect_TODT_DEKALE = 2,
	Aspect_TODT_BLEND = 3,
	Aspect_TODT_DIMENSION = 4,
	Aspect_TODT_SHADOW = 5,
};

enum Aspect_InteriorStyle {
	Aspect_IS_EMPTY = - 1,
	Aspect_IS_SOLID = 0,
	Aspect_IS_HATCH = 1,
	Aspect_IS_HIDDENLINE = 2,
	Aspect_IS_POINT = 3,
	Aspect_IS_HOLLOW = Aspect_IS_EMPTY,
};

/* end public enums declaration */

/* handles */
%wrap_handle(Aspect_DisplayConnection)
%wrap_handle(Aspect_Grid)
%wrap_handle(Aspect_Window)
/* end handles declaration */

/* templates */
%template(Aspect_SequenceOfColor) NCollection_Sequence <Quantity_Color>;
%template(Aspect_TouchMap) NCollection_IndexedDataMap <Standard_Size , Aspect_Touch>;
/* end templates declaration */

/* typedefs */
typedef unsigned long Aspect_Drawable;
typedef unsigned int Aspect_VKey;
typedef NCollection_Sequence <Quantity_Color> Aspect_SequenceOfColor;
typedef NCollection_IndexedDataMap <Standard_Size , Aspect_Touch> Aspect_TouchMap;
typedef void * Aspect_RenderingContext;
typedef void * Aspect_Display;
typedef void * HANDLE;
typedef unsigned long Aspect_Handle;
typedef struct __GLXFBConfigRec * GLXFBConfig;
typedef void * Aspect_FBConfig;
typedef unsigned int Aspect_VKeyFlags;
typedef unsigned int Aspect_VKeyMouse;
/* end typedefs declaration */

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
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "	* Returns the colour of the window background <self>.

	:rtype: Quantity_Color
") Color;
		Quantity_Color Color ();
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* Modifies the colour of the window background <self>.

	:param AColor:
	:type AColor: Quantity_Color &
	:rtype: None
") SetColor;
		void SetColor (const Quantity_Color & AColor);
};


%extend Aspect_Background {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Aspect_DisplayConnection;
class Aspect_DisplayConnection : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Aspect_DisplayConnection;
		%feature("autodoc", "	* Default constructor. Creates connection with display name taken from 'DISPLAY' environment variable

	:rtype: None
") Aspect_DisplayConnection;
		 Aspect_DisplayConnection ();
		%feature("compactdefaultargs") Aspect_DisplayConnection;
		%feature("autodoc", "	* Constructor. Creates connection with display specified in theDisplayName. Display name should be in format 'hostname:number' or 'hostname:number.screen_number', where: hostname - Specifies the name of the host machine on which the display is physically attached. number - Specifies the number of the display server on that host machine. screen_number - Specifies the screen to be used on that server. Optional variable.

	:param theDisplayName:
	:type theDisplayName: TCollection_AsciiString &
	:rtype: None
") Aspect_DisplayConnection;
		 Aspect_DisplayConnection (const TCollection_AsciiString & theDisplayName);
		%feature("compactdefaultargs") Aspect_DisplayConnection;
		%feature("autodoc", "	* Constructor wrapping existing Display instance. WARNING! it is a responsibility of application to keep this pointer valid while Aspect_DisplayConnection is alive and to close Display when it is no more needed.

	:param theDisplay:
	:type theDisplay: Display *
	:rtype: None
") Aspect_DisplayConnection;
		 Aspect_DisplayConnection (Display * theDisplay);
		%feature("compactdefaultargs") GetAtom;
		%feature("autodoc", "	* returns identifier(atom) for custom named property associated with windows that use current connection to X server.

	:param theAtom:
	:type theAtom: Aspect_XAtom
	:rtype: Atom
") GetAtom;
		Atom GetAtom (const Aspect_XAtom theAtom);
		%feature("compactdefaultargs") GetDisplay;
		%feature("autodoc", "	* returns pointer to Display structure that serves as the connection to the X server.

	:rtype: Display *
") GetDisplay;
		Display * GetDisplay ();
		%feature("compactdefaultargs") GetDisplayName;
		%feature("autodoc", "	* returns display name for this connection.

	:rtype: TCollection_AsciiString
") GetDisplayName;
		const TCollection_AsciiString & GetDisplayName ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Open connection with display specified in myDisplayName class field or takes theDisplay parameter when it is not NULL. WARNING! When external Display is specified, it is a responsibility of application to keep this pointer valid while Aspect_DisplayConnection is alive and to close Display when it is no more needed. @param theDisplay external pointer to allocated Display, or NULL if new connection should be created

	:param theDisplay:
	:type theDisplay: Display *
	:rtype: None
") Init;
		void Init (Display * theDisplay);
		%feature("compactdefaultargs") IsOwnDisplay;
		%feature("autodoc", "	* returns True if X Display has been allocated by this class

	:rtype: bool
") IsOwnDisplay;
		Standard_Boolean IsOwnDisplay ();
};


%make_alias(Aspect_DisplayConnection)

%extend Aspect_DisplayConnection {
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
		%feature("compactdefaultargs") Available;
		%feature("autodoc", "	* Returns the number of available identifiers.

	:rtype: int
") Available;
		Standard_Integer Available ();
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
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	* Generates the next available identifier. @param theId [out] generated identifier returns False if all identifiers are busy.

	:param theId:
	:type theId: int &
	:rtype: bool
") Next;
		Standard_Boolean Next (Standard_Integer &OutValue);
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
%nodefaultctor Aspect_Grid;
class Aspect_Grid : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Activate;
		%feature("autodoc", "	* activates the grid. The Hit method will return gridx and gridx computed according to the steps of the grid.

	:rtype: None
") Activate;
		void Activate ();
		%feature("compactdefaultargs") Colors;
		%feature("autodoc", "	* Returns the colors of the grid.

	:param aColor:
	:type aColor: Quantity_Color &
	:param aTenthColor:
	:type aTenthColor: Quantity_Color &
	:rtype: None
") Colors;
		void Colors (Quantity_Color & aColor,Quantity_Color & aTenthColor);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* returns the point of the grid the closest to the point X,Y

	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param gridX:
	:type gridX: float &
	:param gridY:
	:type gridY: float &
	:rtype: void
") Compute;
		virtual void Compute (const Standard_Real X,const Standard_Real Y,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Deactivate;
		%feature("autodoc", "	* deactivates the grid. The hit method will return gridx and gridx as the enter value X & Y.

	:rtype: None
") Deactivate;
		void Deactivate ();
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "	* Display the grid at screen.

	:rtype: void
") Display;
		virtual void Display ();
		%feature("compactdefaultargs") DrawMode;
		%feature("autodoc", "	* Returns the grid aspect.

	:rtype: Aspect_GridDrawMode
") DrawMode;
		Aspect_GridDrawMode DrawMode ();
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "	* Erase the grid from screen.

	:rtype: void
") Erase;
		virtual void Erase ();
		%feature("compactdefaultargs") Hit;
		%feature("autodoc", "	* returns the point of the grid the closest to the point X,Y if the grid is active. If the grid is not active returns X,Y.

	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param gridX:
	:type gridX: float &
	:param gridY:
	:type gridY: float &
	:rtype: None
") Hit;
		void Hit (const Standard_Real X,const Standard_Real Y,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:rtype: void
") Init;
		virtual void Init ();
		%feature("compactdefaultargs") IsActive;
		%feature("autodoc", "	* Returns True when the grid is active.

	:rtype: bool
") IsActive;
		Standard_Boolean IsActive ();
		%feature("compactdefaultargs") IsDisplayed;
		%feature("autodoc", "	* Returns True when the grid is displayed at screen.

	:rtype: bool
") IsDisplayed;
		virtual Standard_Boolean IsDisplayed ();
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "	* Rotate the grid from a relative angle.

	:param anAngle:
	:type anAngle: float
	:rtype: None
") Rotate;
		void Rotate (const Standard_Real anAngle);
		%feature("compactdefaultargs") RotationAngle;
		%feature("autodoc", "	* returns the x Angle of the grid.

	:rtype: float
") RotationAngle;
		Standard_Real RotationAngle ();
		%feature("compactdefaultargs") SetColors;
		%feature("autodoc", "	* Change the colors of the grid

	:param aColor:
	:type aColor: Quantity_Color &
	:param aTenthColor:
	:type aTenthColor: Quantity_Color &
	:rtype: void
") SetColors;
		virtual void SetColors (const Quantity_Color & aColor,const Quantity_Color & aTenthColor);
		%feature("compactdefaultargs") SetDrawMode;
		%feature("autodoc", "	* Change the grid aspect.

	:param aDrawMode:
	:type aDrawMode: Aspect_GridDrawMode
	:rtype: None
") SetDrawMode;
		void SetDrawMode (const Aspect_GridDrawMode aDrawMode);
		%feature("compactdefaultargs") SetRotationAngle;
		%feature("autodoc", "	* defines the orientation of the grid.

	:param anAngle:
	:type anAngle: float
	:rtype: None
") SetRotationAngle;
		void SetRotationAngle (const Standard_Real anAngle);
		%feature("compactdefaultargs") SetXOrigin;
		%feature("autodoc", "	* defines the x Origin of the grid.

	:param anOrigin:
	:type anOrigin: float
	:rtype: None
") SetXOrigin;
		void SetXOrigin (const Standard_Real anOrigin);
		%feature("compactdefaultargs") SetYOrigin;
		%feature("autodoc", "	* defines the y Origin of the grid.

	:param anOrigin:
	:type anOrigin: float
	:rtype: None
") SetYOrigin;
		void SetYOrigin (const Standard_Real anOrigin);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	* Translate the grid from a relative distance.

	:param aDx:
	:type aDx: float
	:param aDy:
	:type aDy: float
	:rtype: None
") Translate;
		void Translate (const Standard_Real aDx,const Standard_Real aDy);
		%feature("compactdefaultargs") XOrigin;
		%feature("autodoc", "	* returns the x Origin of the grid.

	:rtype: float
") XOrigin;
		Standard_Real XOrigin ();
		%feature("compactdefaultargs") YOrigin;
		%feature("autodoc", "	* returns the x Origin of the grid.

	:rtype: float
") YOrigin;
		Standard_Real YOrigin ();
};


%make_alias(Aspect_Grid)

%extend Aspect_Grid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Aspect_ScrollDelta;
class Aspect_ScrollDelta {
	public:
		float Delta;
		Aspect_VKeyFlags Flags;
		%feature("compactdefaultargs") Aspect_ScrollDelta;
		%feature("autodoc", "	* Empty constructor.

	:rtype: None
") Aspect_ScrollDelta;
		 Aspect_ScrollDelta ();
		%feature("compactdefaultargs") Aspect_ScrollDelta;
		%feature("autodoc", "	* Constructor.

	:param thePnt:
	:type thePnt: NCollection_Vec2<int> &
	:param theValue:
	:type theValue: float
	:param theFlags: default value is Aspect_VKeyFlags_NONE
	:type theFlags: Aspect_VKeyFlags
	:rtype: None
") Aspect_ScrollDelta;
		 Aspect_ScrollDelta (const NCollection_Vec2<int> & thePnt,Standard_Real theValue,Aspect_VKeyFlags theFlags = Aspect_VKeyFlags_NONE);
		%feature("compactdefaultargs") Aspect_ScrollDelta;
		%feature("autodoc", "	* Constructor with undefined point.

	:param theValue:
	:type theValue: float
	:param theFlags: default value is Aspect_VKeyFlags_NONE
	:type theFlags: Aspect_VKeyFlags
	:rtype: None
") Aspect_ScrollDelta;
		 Aspect_ScrollDelta (Standard_Real theValue,Aspect_VKeyFlags theFlags = Aspect_VKeyFlags_NONE);
		%feature("compactdefaultargs") HasPoint;
		%feature("autodoc", "	* //!< key flags Return true if action has point defined.

	:rtype: bool
") HasPoint;
		bool HasPoint ();
		%feature("compactdefaultargs") ResetPoint;
		%feature("autodoc", "	* Reset at point.

	:rtype: None
") ResetPoint;
		void ResetPoint ();
};


%extend Aspect_ScrollDelta {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Aspect_Touch;
class Aspect_Touch {
	public:
		bool IsPreciseDevice;
		%feature("compactdefaultargs") Aspect_Touch;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") Aspect_Touch;
		 Aspect_Touch ();
		%feature("compactdefaultargs") Aspect_Touch;
		%feature("autodoc", "	* Constructor with initialization.

	:param thePnt:
	:type thePnt: NCollection_Vec2<float> &
	:param theIsPreciseDevice:
	:type theIsPreciseDevice: bool
	:rtype: None
") Aspect_Touch;
		 Aspect_Touch (const NCollection_Vec2<Standard_Real> & thePnt,Standard_Boolean theIsPreciseDevice);
		%feature("compactdefaultargs") Aspect_Touch;
		%feature("autodoc", "	* Constructor with initialization.

	:param theX:
	:type theX: float
	:param theY:
	:type theY: float
	:param theIsPreciseDevice:
	:type theIsPreciseDevice: bool
	:rtype: None
") Aspect_Touch;
		 Aspect_Touch (Standard_Real theX,Standard_Real theY,Standard_Boolean theIsPreciseDevice);
		%feature("compactdefaultargs") Delta;
		%feature("autodoc", "	* //!< precise device input (e.g. mouse cursor, NOT emulated from touch screen) Return values delta.

	:rtype: NCollection_Vec2<float>
") Delta;
		NCollection_Vec2<Standard_Real> Delta ();
};


%extend Aspect_Touch {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Aspect_Window;
class Aspect_Window : public Standard_Transient {
	public:
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
		%feature("compactdefaultargs") DoMapping;
		%feature("autodoc", "	* Apply the mapping change to the window <self>. and returns True if the window is mapped at screen.

	:rtype: bool
") DoMapping;
		virtual Standard_Boolean DoMapping ();
		%feature("compactdefaultargs") DoResize;
		%feature("autodoc", "	* Apply the resizing to the window <self>.

	:rtype: Aspect_TypeOfResize
") DoResize;
		virtual Aspect_TypeOfResize DoResize ();
		%feature("compactdefaultargs") GradientBackground;
		%feature("autodoc", "	* Returns the window gradient background.

	:rtype: Aspect_GradientBackground
") GradientBackground;
		Aspect_GradientBackground GradientBackground ();
		%feature("compactdefaultargs") InvalidateContent;
		%feature("autodoc", "	* Invalidate entire window content. //! Implementation is expected to allow calling this method from non-GUI thread, e.g. by queuing exposure event into window message queue or in other thread-safe manner. //! Optional display argument should be passed when called from non-GUI thread on platforms implementing thread-unsafe connections to display. NULL can be passed instead otherwise.

	:param theDisp:
	:type theDisp: opencascade::handle<Aspect_DisplayConnection> &
	:rtype: None
") InvalidateContent;
		void InvalidateContent (const opencascade::handle<Aspect_DisplayConnection> & theDisp);
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
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "	* Opens the window <self>.

	:rtype: void
") Map;
		virtual void Map ();
		%feature("compactdefaultargs") NativeFBConfig;
		%feature("autodoc", "	* Returns native Window FB config (GLXFBConfig on Xlib)

	:rtype: Aspect_FBConfig
") NativeFBConfig;
		virtual Aspect_FBConfig NativeFBConfig ();
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
		%feature("compactdefaultargs") Ratio;
		%feature("autodoc", "	* Returns The Window RATIO equal to the physical WIDTH/HEIGHT dimensions

	:rtype: float
") Ratio;
		virtual Standard_Real Ratio ();
		%feature("compactdefaultargs") SetBackground;
		%feature("autodoc", "	* Modifies the window background.

	:param ABack:
	:type ABack: Aspect_Background &
	:rtype: None
") SetBackground;
		void SetBackground (const Aspect_Background & ABack);
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
		%feature("compactdefaultargs") SetTitle;
		%feature("autodoc", "	* Sets window title.

	:param theTitle:
	:type theTitle: TCollection_AsciiString &
	:rtype: None
") SetTitle;
		void SetTitle (const TCollection_AsciiString & theTitle);
		%feature("compactdefaultargs") SetVirtual;
		%feature("autodoc", "	* Setup the virtual state

	:param theVirtual:
	:type theVirtual: bool
	:rtype: None
") SetVirtual;
		void SetVirtual (const Standard_Boolean theVirtual);
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "	* Returns The Window SIZE in PIXEL

	:param Width:
	:type Width: int &
	:param Height:
	:type Height: int &
	:rtype: void
") Size;
		virtual void Size (Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") Unmap;
		%feature("autodoc", "	* Closes the window <self>.

	:rtype: void
") Unmap;
		virtual void Unmap ();
};


%make_alias(Aspect_Window)

%extend Aspect_Window {
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
		%feature("compactdefaultargs") BgGradientFillMethod;
		%feature("autodoc", "	* Returns the current gradient background fill mode.

	:rtype: Aspect_GradientFillMethod
") BgGradientFillMethod;
		Aspect_GradientFillMethod BgGradientFillMethod ();
		%feature("compactdefaultargs") Colors;
		%feature("autodoc", "	* Returns colours of the window gradient background <self>.

	:param AColor1:
	:type AColor1: Quantity_Color &
	:param AColor2:
	:type AColor2: Quantity_Color &
	:rtype: None
") Colors;
		void Colors (Quantity_Color & AColor1,Quantity_Color & AColor2);
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
};


%extend Aspect_GradientBackground {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */
