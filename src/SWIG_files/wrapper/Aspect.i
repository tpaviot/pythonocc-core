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
%define ASPECTDOCSTRING
"Aspect module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_aspect.html"
%enddef
%module (package="OCC.Core", docstring=ASPECTDOCSTRING) Aspect


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
#include<Aspect_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Quantity_module.hxx>
#include<TCollection_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Quantity.i
%import TCollection.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

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

/* python proy classes for enums */
%pythoncode {

class Aspect_VKeyBasic(IntEnum):
	Aspect_VKey_UNKNOWN = 0
	Aspect_VKey_A = 1
	Aspect_VKey_B = 2
	Aspect_VKey_C = 3
	Aspect_VKey_D = 4
	Aspect_VKey_E = 5
	Aspect_VKey_F = 6
	Aspect_VKey_G = 7
	Aspect_VKey_H = 8
	Aspect_VKey_I = 9
	Aspect_VKey_J = 10
	Aspect_VKey_K = 11
	Aspect_VKey_L = 12
	Aspect_VKey_M = 13
	Aspect_VKey_N = 14
	Aspect_VKey_O = 15
	Aspect_VKey_P = 16
	Aspect_VKey_Q = 17
	Aspect_VKey_R = 18
	Aspect_VKey_S = 19
	Aspect_VKey_T = 20
	Aspect_VKey_U = 21
	Aspect_VKey_V = 22
	Aspect_VKey_W = 23
	Aspect_VKey_X = 24
	Aspect_VKey_Y = 25
	Aspect_VKey_Z = 26
	Aspect_VKey_0 = 27
	Aspect_VKey_1 = 28
	Aspect_VKey_2 = 29
	Aspect_VKey_3 = 30
	Aspect_VKey_4 = 31
	Aspect_VKey_5 = 32
	Aspect_VKey_6 = 33
	Aspect_VKey_7 = 34
	Aspect_VKey_8 = 35
	Aspect_VKey_9 = 36
	Aspect_VKey_F1 = 37
	Aspect_VKey_F2 = 38
	Aspect_VKey_F3 = 39
	Aspect_VKey_F4 = 40
	Aspect_VKey_F5 = 41
	Aspect_VKey_F6 = 42
	Aspect_VKey_F7 = 43
	Aspect_VKey_F8 = 44
	Aspect_VKey_F9 = 45
	Aspect_VKey_F10 = 46
	Aspect_VKey_F11 = 47
	Aspect_VKey_F12 = 48
	Aspect_VKey_Up = 49
	Aspect_VKey_Down = 50
	Aspect_VKey_Left = 51
	Aspect_VKey_Right = 52
	Aspect_VKey_Plus = 53
	Aspect_VKey_Minus = 54
	Aspect_VKey_Equal = 55
	Aspect_VKey_PageUp = 56
	Aspect_VKey_PageDown = 57
	Aspect_VKey_Home = 58
	Aspect_VKey_End = 59
	Aspect_VKey_Escape = 60
	Aspect_VKey_Back = 61
	Aspect_VKey_Enter = 62
	Aspect_VKey_Backspace = 63
	Aspect_VKey_Space = 64
	Aspect_VKey_Delete = 65
	Aspect_VKey_Tilde = 66
	Aspect_VKey_Tab = 67
	Aspect_VKey_Comma = 68
	Aspect_VKey_Period = 69
	Aspect_VKey_Semicolon = 70
	Aspect_VKey_Slash = 71
	Aspect_VKey_BracketLeft = 72
	Aspect_VKey_Backslash = 73
	Aspect_VKey_BracketRight = 74
	Aspect_VKey_Apostrophe = 75
	Aspect_VKey_Numlock = 76
	Aspect_VKey_Scroll = 77
	Aspect_VKey_Numpad0 = 78
	Aspect_VKey_Numpad1 = 79
	Aspect_VKey_Numpad2 = 80
	Aspect_VKey_Numpad3 = 81
	Aspect_VKey_Numpad4 = 82
	Aspect_VKey_Numpad5 = 83
	Aspect_VKey_Numpad6 = 84
	Aspect_VKey_Numpad7 = 85
	Aspect_VKey_Numpad8 = 86
	Aspect_VKey_Numpad9 = 87
	Aspect_VKey_NumpadMultiply = 88
	Aspect_VKey_NumpadAdd = 89
	Aspect_VKey_NumpadSubtract = 90
	Aspect_VKey_NumpadDivide = 91
	Aspect_VKey_MediaNextTrack = 92
	Aspect_VKey_MediaPreviousTrack = 93
	Aspect_VKey_MediaStop = 94
	Aspect_VKey_MediaPlayPause = 95
	Aspect_VKey_VolumeMute = 96
	Aspect_VKey_VolumeDown = 97
	Aspect_VKey_VolumeUp = 98
	Aspect_VKey_BrowserBack = 99
	Aspect_VKey_BrowserForward = 100
	Aspect_VKey_BrowserRefresh = 101
	Aspect_VKey_BrowserStop = 102
	Aspect_VKey_BrowserSearch = 103
	Aspect_VKey_BrowserFavorites = 104
	Aspect_VKey_BrowserHome = 105
	Aspect_VKey_Shift = 106
	Aspect_VKey_Control = 107
	Aspect_VKey_Alt = 108
	Aspect_VKey_Menu = 109
	Aspect_VKey_Meta = 110
	Aspect_VKey_NavInteract = 111
	Aspect_VKey_NavForward = 112
	Aspect_VKey_NavBackward = 113
	Aspect_VKey_NavSlideLeft = 114
	Aspect_VKey_NavSlideRight = 115
	Aspect_VKey_NavSlideUp = 116
	Aspect_VKey_NavSlideDown = 117
	Aspect_VKey_NavRollCCW = 118
	Aspect_VKey_NavRollCW = 119
	Aspect_VKey_NavLookLeft = 120
	Aspect_VKey_NavLookRight = 121
	Aspect_VKey_NavLookUp = 122
	Aspect_VKey_NavLookDown = 123
	Aspect_VKey_NavCrouch = 124
	Aspect_VKey_NavJump = 125
	Aspect_VKey_NavThrustForward = 126
	Aspect_VKey_NavThrustBackward = 127
	Aspect_VKey_NavThrustStop = 128
	Aspect_VKey_NavSpeedIncrease = 129
	Aspect_VKey_NavSpeedDecrease = 130
Aspect_VKey_UNKNOWN = Aspect_VKeyBasic.Aspect_VKey_UNKNOWN
Aspect_VKey_A = Aspect_VKeyBasic.Aspect_VKey_A
Aspect_VKey_B = Aspect_VKeyBasic.Aspect_VKey_B
Aspect_VKey_C = Aspect_VKeyBasic.Aspect_VKey_C
Aspect_VKey_D = Aspect_VKeyBasic.Aspect_VKey_D
Aspect_VKey_E = Aspect_VKeyBasic.Aspect_VKey_E
Aspect_VKey_F = Aspect_VKeyBasic.Aspect_VKey_F
Aspect_VKey_G = Aspect_VKeyBasic.Aspect_VKey_G
Aspect_VKey_H = Aspect_VKeyBasic.Aspect_VKey_H
Aspect_VKey_I = Aspect_VKeyBasic.Aspect_VKey_I
Aspect_VKey_J = Aspect_VKeyBasic.Aspect_VKey_J
Aspect_VKey_K = Aspect_VKeyBasic.Aspect_VKey_K
Aspect_VKey_L = Aspect_VKeyBasic.Aspect_VKey_L
Aspect_VKey_M = Aspect_VKeyBasic.Aspect_VKey_M
Aspect_VKey_N = Aspect_VKeyBasic.Aspect_VKey_N
Aspect_VKey_O = Aspect_VKeyBasic.Aspect_VKey_O
Aspect_VKey_P = Aspect_VKeyBasic.Aspect_VKey_P
Aspect_VKey_Q = Aspect_VKeyBasic.Aspect_VKey_Q
Aspect_VKey_R = Aspect_VKeyBasic.Aspect_VKey_R
Aspect_VKey_S = Aspect_VKeyBasic.Aspect_VKey_S
Aspect_VKey_T = Aspect_VKeyBasic.Aspect_VKey_T
Aspect_VKey_U = Aspect_VKeyBasic.Aspect_VKey_U
Aspect_VKey_V = Aspect_VKeyBasic.Aspect_VKey_V
Aspect_VKey_W = Aspect_VKeyBasic.Aspect_VKey_W
Aspect_VKey_X = Aspect_VKeyBasic.Aspect_VKey_X
Aspect_VKey_Y = Aspect_VKeyBasic.Aspect_VKey_Y
Aspect_VKey_Z = Aspect_VKeyBasic.Aspect_VKey_Z
Aspect_VKey_0 = Aspect_VKeyBasic.Aspect_VKey_0
Aspect_VKey_1 = Aspect_VKeyBasic.Aspect_VKey_1
Aspect_VKey_2 = Aspect_VKeyBasic.Aspect_VKey_2
Aspect_VKey_3 = Aspect_VKeyBasic.Aspect_VKey_3
Aspect_VKey_4 = Aspect_VKeyBasic.Aspect_VKey_4
Aspect_VKey_5 = Aspect_VKeyBasic.Aspect_VKey_5
Aspect_VKey_6 = Aspect_VKeyBasic.Aspect_VKey_6
Aspect_VKey_7 = Aspect_VKeyBasic.Aspect_VKey_7
Aspect_VKey_8 = Aspect_VKeyBasic.Aspect_VKey_8
Aspect_VKey_9 = Aspect_VKeyBasic.Aspect_VKey_9
Aspect_VKey_F1 = Aspect_VKeyBasic.Aspect_VKey_F1
Aspect_VKey_F2 = Aspect_VKeyBasic.Aspect_VKey_F2
Aspect_VKey_F3 = Aspect_VKeyBasic.Aspect_VKey_F3
Aspect_VKey_F4 = Aspect_VKeyBasic.Aspect_VKey_F4
Aspect_VKey_F5 = Aspect_VKeyBasic.Aspect_VKey_F5
Aspect_VKey_F6 = Aspect_VKeyBasic.Aspect_VKey_F6
Aspect_VKey_F7 = Aspect_VKeyBasic.Aspect_VKey_F7
Aspect_VKey_F8 = Aspect_VKeyBasic.Aspect_VKey_F8
Aspect_VKey_F9 = Aspect_VKeyBasic.Aspect_VKey_F9
Aspect_VKey_F10 = Aspect_VKeyBasic.Aspect_VKey_F10
Aspect_VKey_F11 = Aspect_VKeyBasic.Aspect_VKey_F11
Aspect_VKey_F12 = Aspect_VKeyBasic.Aspect_VKey_F12
Aspect_VKey_Up = Aspect_VKeyBasic.Aspect_VKey_Up
Aspect_VKey_Down = Aspect_VKeyBasic.Aspect_VKey_Down
Aspect_VKey_Left = Aspect_VKeyBasic.Aspect_VKey_Left
Aspect_VKey_Right = Aspect_VKeyBasic.Aspect_VKey_Right
Aspect_VKey_Plus = Aspect_VKeyBasic.Aspect_VKey_Plus
Aspect_VKey_Minus = Aspect_VKeyBasic.Aspect_VKey_Minus
Aspect_VKey_Equal = Aspect_VKeyBasic.Aspect_VKey_Equal
Aspect_VKey_PageUp = Aspect_VKeyBasic.Aspect_VKey_PageUp
Aspect_VKey_PageDown = Aspect_VKeyBasic.Aspect_VKey_PageDown
Aspect_VKey_Home = Aspect_VKeyBasic.Aspect_VKey_Home
Aspect_VKey_End = Aspect_VKeyBasic.Aspect_VKey_End
Aspect_VKey_Escape = Aspect_VKeyBasic.Aspect_VKey_Escape
Aspect_VKey_Back = Aspect_VKeyBasic.Aspect_VKey_Back
Aspect_VKey_Enter = Aspect_VKeyBasic.Aspect_VKey_Enter
Aspect_VKey_Backspace = Aspect_VKeyBasic.Aspect_VKey_Backspace
Aspect_VKey_Space = Aspect_VKeyBasic.Aspect_VKey_Space
Aspect_VKey_Delete = Aspect_VKeyBasic.Aspect_VKey_Delete
Aspect_VKey_Tilde = Aspect_VKeyBasic.Aspect_VKey_Tilde
Aspect_VKey_Tab = Aspect_VKeyBasic.Aspect_VKey_Tab
Aspect_VKey_Comma = Aspect_VKeyBasic.Aspect_VKey_Comma
Aspect_VKey_Period = Aspect_VKeyBasic.Aspect_VKey_Period
Aspect_VKey_Semicolon = Aspect_VKeyBasic.Aspect_VKey_Semicolon
Aspect_VKey_Slash = Aspect_VKeyBasic.Aspect_VKey_Slash
Aspect_VKey_BracketLeft = Aspect_VKeyBasic.Aspect_VKey_BracketLeft
Aspect_VKey_Backslash = Aspect_VKeyBasic.Aspect_VKey_Backslash
Aspect_VKey_BracketRight = Aspect_VKeyBasic.Aspect_VKey_BracketRight
Aspect_VKey_Apostrophe = Aspect_VKeyBasic.Aspect_VKey_Apostrophe
Aspect_VKey_Numlock = Aspect_VKeyBasic.Aspect_VKey_Numlock
Aspect_VKey_Scroll = Aspect_VKeyBasic.Aspect_VKey_Scroll
Aspect_VKey_Numpad0 = Aspect_VKeyBasic.Aspect_VKey_Numpad0
Aspect_VKey_Numpad1 = Aspect_VKeyBasic.Aspect_VKey_Numpad1
Aspect_VKey_Numpad2 = Aspect_VKeyBasic.Aspect_VKey_Numpad2
Aspect_VKey_Numpad3 = Aspect_VKeyBasic.Aspect_VKey_Numpad3
Aspect_VKey_Numpad4 = Aspect_VKeyBasic.Aspect_VKey_Numpad4
Aspect_VKey_Numpad5 = Aspect_VKeyBasic.Aspect_VKey_Numpad5
Aspect_VKey_Numpad6 = Aspect_VKeyBasic.Aspect_VKey_Numpad6
Aspect_VKey_Numpad7 = Aspect_VKeyBasic.Aspect_VKey_Numpad7
Aspect_VKey_Numpad8 = Aspect_VKeyBasic.Aspect_VKey_Numpad8
Aspect_VKey_Numpad9 = Aspect_VKeyBasic.Aspect_VKey_Numpad9
Aspect_VKey_NumpadMultiply = Aspect_VKeyBasic.Aspect_VKey_NumpadMultiply
Aspect_VKey_NumpadAdd = Aspect_VKeyBasic.Aspect_VKey_NumpadAdd
Aspect_VKey_NumpadSubtract = Aspect_VKeyBasic.Aspect_VKey_NumpadSubtract
Aspect_VKey_NumpadDivide = Aspect_VKeyBasic.Aspect_VKey_NumpadDivide
Aspect_VKey_MediaNextTrack = Aspect_VKeyBasic.Aspect_VKey_MediaNextTrack
Aspect_VKey_MediaPreviousTrack = Aspect_VKeyBasic.Aspect_VKey_MediaPreviousTrack
Aspect_VKey_MediaStop = Aspect_VKeyBasic.Aspect_VKey_MediaStop
Aspect_VKey_MediaPlayPause = Aspect_VKeyBasic.Aspect_VKey_MediaPlayPause
Aspect_VKey_VolumeMute = Aspect_VKeyBasic.Aspect_VKey_VolumeMute
Aspect_VKey_VolumeDown = Aspect_VKeyBasic.Aspect_VKey_VolumeDown
Aspect_VKey_VolumeUp = Aspect_VKeyBasic.Aspect_VKey_VolumeUp
Aspect_VKey_BrowserBack = Aspect_VKeyBasic.Aspect_VKey_BrowserBack
Aspect_VKey_BrowserForward = Aspect_VKeyBasic.Aspect_VKey_BrowserForward
Aspect_VKey_BrowserRefresh = Aspect_VKeyBasic.Aspect_VKey_BrowserRefresh
Aspect_VKey_BrowserStop = Aspect_VKeyBasic.Aspect_VKey_BrowserStop
Aspect_VKey_BrowserSearch = Aspect_VKeyBasic.Aspect_VKey_BrowserSearch
Aspect_VKey_BrowserFavorites = Aspect_VKeyBasic.Aspect_VKey_BrowserFavorites
Aspect_VKey_BrowserHome = Aspect_VKeyBasic.Aspect_VKey_BrowserHome
Aspect_VKey_Shift = Aspect_VKeyBasic.Aspect_VKey_Shift
Aspect_VKey_Control = Aspect_VKeyBasic.Aspect_VKey_Control
Aspect_VKey_Alt = Aspect_VKeyBasic.Aspect_VKey_Alt
Aspect_VKey_Menu = Aspect_VKeyBasic.Aspect_VKey_Menu
Aspect_VKey_Meta = Aspect_VKeyBasic.Aspect_VKey_Meta
Aspect_VKey_NavInteract = Aspect_VKeyBasic.Aspect_VKey_NavInteract
Aspect_VKey_NavForward = Aspect_VKeyBasic.Aspect_VKey_NavForward
Aspect_VKey_NavBackward = Aspect_VKeyBasic.Aspect_VKey_NavBackward
Aspect_VKey_NavSlideLeft = Aspect_VKeyBasic.Aspect_VKey_NavSlideLeft
Aspect_VKey_NavSlideRight = Aspect_VKeyBasic.Aspect_VKey_NavSlideRight
Aspect_VKey_NavSlideUp = Aspect_VKeyBasic.Aspect_VKey_NavSlideUp
Aspect_VKey_NavSlideDown = Aspect_VKeyBasic.Aspect_VKey_NavSlideDown
Aspect_VKey_NavRollCCW = Aspect_VKeyBasic.Aspect_VKey_NavRollCCW
Aspect_VKey_NavRollCW = Aspect_VKeyBasic.Aspect_VKey_NavRollCW
Aspect_VKey_NavLookLeft = Aspect_VKeyBasic.Aspect_VKey_NavLookLeft
Aspect_VKey_NavLookRight = Aspect_VKeyBasic.Aspect_VKey_NavLookRight
Aspect_VKey_NavLookUp = Aspect_VKeyBasic.Aspect_VKey_NavLookUp
Aspect_VKey_NavLookDown = Aspect_VKeyBasic.Aspect_VKey_NavLookDown
Aspect_VKey_NavCrouch = Aspect_VKeyBasic.Aspect_VKey_NavCrouch
Aspect_VKey_NavJump = Aspect_VKeyBasic.Aspect_VKey_NavJump
Aspect_VKey_NavThrustForward = Aspect_VKeyBasic.Aspect_VKey_NavThrustForward
Aspect_VKey_NavThrustBackward = Aspect_VKeyBasic.Aspect_VKey_NavThrustBackward
Aspect_VKey_NavThrustStop = Aspect_VKeyBasic.Aspect_VKey_NavThrustStop
Aspect_VKey_NavSpeedIncrease = Aspect_VKeyBasic.Aspect_VKey_NavSpeedIncrease
Aspect_VKey_NavSpeedDecrease = Aspect_VKeyBasic.Aspect_VKey_NavSpeedDecrease

class Aspect_TypeOfDeflection(IntEnum):
	Aspect_TOD_RELATIVE = 0
	Aspect_TOD_ABSOLUTE = 1
Aspect_TOD_RELATIVE = Aspect_TypeOfDeflection.Aspect_TOD_RELATIVE
Aspect_TOD_ABSOLUTE = Aspect_TypeOfDeflection.Aspect_TOD_ABSOLUTE

class Aspect_TypeOfLine(IntEnum):
	Aspect_TOL_EMPTY = - 1
	Aspect_TOL_SOLID = 0
	Aspect_TOL_DASH = 1
	Aspect_TOL_DOT = 2
	Aspect_TOL_DOTDASH = 3
	Aspect_TOL_USERDEFINED = 4
Aspect_TOL_EMPTY = Aspect_TypeOfLine.Aspect_TOL_EMPTY
Aspect_TOL_SOLID = Aspect_TypeOfLine.Aspect_TOL_SOLID
Aspect_TOL_DASH = Aspect_TypeOfLine.Aspect_TOL_DASH
Aspect_TOL_DOT = Aspect_TypeOfLine.Aspect_TOL_DOT
Aspect_TOL_DOTDASH = Aspect_TypeOfLine.Aspect_TOL_DOTDASH
Aspect_TOL_USERDEFINED = Aspect_TypeOfLine.Aspect_TOL_USERDEFINED

class Aspect_GradientFillMethod(IntEnum):
	Aspect_GFM_NONE = 0
	Aspect_GFM_HOR = 1
	Aspect_GFM_VER = 2
	Aspect_GFM_DIAG1 = 3
	Aspect_GFM_DIAG2 = 4
	Aspect_GFM_CORNER1 = 5
	Aspect_GFM_CORNER2 = 6
	Aspect_GFM_CORNER3 = 7
	Aspect_GFM_CORNER4 = 8
Aspect_GFM_NONE = Aspect_GradientFillMethod.Aspect_GFM_NONE
Aspect_GFM_HOR = Aspect_GradientFillMethod.Aspect_GFM_HOR
Aspect_GFM_VER = Aspect_GradientFillMethod.Aspect_GFM_VER
Aspect_GFM_DIAG1 = Aspect_GradientFillMethod.Aspect_GFM_DIAG1
Aspect_GFM_DIAG2 = Aspect_GradientFillMethod.Aspect_GFM_DIAG2
Aspect_GFM_CORNER1 = Aspect_GradientFillMethod.Aspect_GFM_CORNER1
Aspect_GFM_CORNER2 = Aspect_GradientFillMethod.Aspect_GFM_CORNER2
Aspect_GFM_CORNER3 = Aspect_GradientFillMethod.Aspect_GFM_CORNER3
Aspect_GFM_CORNER4 = Aspect_GradientFillMethod.Aspect_GFM_CORNER4

class Aspect_TypeOfHighlightMethod(IntEnum):
	Aspect_TOHM_COLOR = 0
	Aspect_TOHM_BOUNDBOX = 1
Aspect_TOHM_COLOR = Aspect_TypeOfHighlightMethod.Aspect_TOHM_COLOR
Aspect_TOHM_BOUNDBOX = Aspect_TypeOfHighlightMethod.Aspect_TOHM_BOUNDBOX

class Aspect_TypeOfResize(IntEnum):
	Aspect_TOR_UNKNOWN = 0
	Aspect_TOR_NO_BORDER = 1
	Aspect_TOR_TOP_BORDER = 2
	Aspect_TOR_RIGHT_BORDER = 3
	Aspect_TOR_BOTTOM_BORDER = 4
	Aspect_TOR_LEFT_BORDER = 5
	Aspect_TOR_TOP_AND_RIGHT_BORDER = 6
	Aspect_TOR_RIGHT_AND_BOTTOM_BORDER = 7
	Aspect_TOR_BOTTOM_AND_LEFT_BORDER = 8
	Aspect_TOR_LEFT_AND_TOP_BORDER = 9
Aspect_TOR_UNKNOWN = Aspect_TypeOfResize.Aspect_TOR_UNKNOWN
Aspect_TOR_NO_BORDER = Aspect_TypeOfResize.Aspect_TOR_NO_BORDER
Aspect_TOR_TOP_BORDER = Aspect_TypeOfResize.Aspect_TOR_TOP_BORDER
Aspect_TOR_RIGHT_BORDER = Aspect_TypeOfResize.Aspect_TOR_RIGHT_BORDER
Aspect_TOR_BOTTOM_BORDER = Aspect_TypeOfResize.Aspect_TOR_BOTTOM_BORDER
Aspect_TOR_LEFT_BORDER = Aspect_TypeOfResize.Aspect_TOR_LEFT_BORDER
Aspect_TOR_TOP_AND_RIGHT_BORDER = Aspect_TypeOfResize.Aspect_TOR_TOP_AND_RIGHT_BORDER
Aspect_TOR_RIGHT_AND_BOTTOM_BORDER = Aspect_TypeOfResize.Aspect_TOR_RIGHT_AND_BOTTOM_BORDER
Aspect_TOR_BOTTOM_AND_LEFT_BORDER = Aspect_TypeOfResize.Aspect_TOR_BOTTOM_AND_LEFT_BORDER
Aspect_TOR_LEFT_AND_TOP_BORDER = Aspect_TypeOfResize.Aspect_TOR_LEFT_AND_TOP_BORDER

class Aspect_GridType(IntEnum):
	Aspect_GT_Rectangular = 0
	Aspect_GT_Circular = 1
Aspect_GT_Rectangular = Aspect_GridType.Aspect_GT_Rectangular
Aspect_GT_Circular = Aspect_GridType.Aspect_GT_Circular

class Aspect_TypeOfColorScaleData(IntEnum):
	Aspect_TOCSD_AUTO = 0
	Aspect_TOCSD_USER = 1
Aspect_TOCSD_AUTO = Aspect_TypeOfColorScaleData.Aspect_TOCSD_AUTO
Aspect_TOCSD_USER = Aspect_TypeOfColorScaleData.Aspect_TOCSD_USER

class Aspect_TypeOfStyleText(IntEnum):
	Aspect_TOST_NORMAL = 0
	Aspect_TOST_ANNOTATION = 1
Aspect_TOST_NORMAL = Aspect_TypeOfStyleText.Aspect_TOST_NORMAL
Aspect_TOST_ANNOTATION = Aspect_TypeOfStyleText.Aspect_TOST_ANNOTATION

class Aspect_TypeOfMarker(IntEnum):
	Aspect_TOM_EMPTY = - 1
	Aspect_TOM_POINT = 0
	Aspect_TOM_PLUS = 1
	Aspect_TOM_STAR = 2
	Aspect_TOM_X = 3
	Aspect_TOM_O = 4
	Aspect_TOM_O_POINT = 5
	Aspect_TOM_O_PLUS = 6
	Aspect_TOM_O_STAR = 7
	Aspect_TOM_O_X = 8
	Aspect_TOM_RING1 = 9
	Aspect_TOM_RING2 = 10
	Aspect_TOM_RING3 = 11
	Aspect_TOM_BALL = 12
	Aspect_TOM_USERDEFINED = 13
Aspect_TOM_EMPTY = Aspect_TypeOfMarker.Aspect_TOM_EMPTY
Aspect_TOM_POINT = Aspect_TypeOfMarker.Aspect_TOM_POINT
Aspect_TOM_PLUS = Aspect_TypeOfMarker.Aspect_TOM_PLUS
Aspect_TOM_STAR = Aspect_TypeOfMarker.Aspect_TOM_STAR
Aspect_TOM_X = Aspect_TypeOfMarker.Aspect_TOM_X
Aspect_TOM_O = Aspect_TypeOfMarker.Aspect_TOM_O
Aspect_TOM_O_POINT = Aspect_TypeOfMarker.Aspect_TOM_O_POINT
Aspect_TOM_O_PLUS = Aspect_TypeOfMarker.Aspect_TOM_O_PLUS
Aspect_TOM_O_STAR = Aspect_TypeOfMarker.Aspect_TOM_O_STAR
Aspect_TOM_O_X = Aspect_TypeOfMarker.Aspect_TOM_O_X
Aspect_TOM_RING1 = Aspect_TypeOfMarker.Aspect_TOM_RING1
Aspect_TOM_RING2 = Aspect_TypeOfMarker.Aspect_TOM_RING2
Aspect_TOM_RING3 = Aspect_TypeOfMarker.Aspect_TOM_RING3
Aspect_TOM_BALL = Aspect_TypeOfMarker.Aspect_TOM_BALL
Aspect_TOM_USERDEFINED = Aspect_TypeOfMarker.Aspect_TOM_USERDEFINED

class Aspect_TypeOfColorScaleOrientation(IntEnum):
	Aspect_TOCSO_NONE = 0
	Aspect_TOCSO_LEFT = 1
	Aspect_TOCSO_RIGHT = 2
	Aspect_TOCSO_CENTER = 3
Aspect_TOCSO_NONE = Aspect_TypeOfColorScaleOrientation.Aspect_TOCSO_NONE
Aspect_TOCSO_LEFT = Aspect_TypeOfColorScaleOrientation.Aspect_TOCSO_LEFT
Aspect_TOCSO_RIGHT = Aspect_TypeOfColorScaleOrientation.Aspect_TOCSO_RIGHT
Aspect_TOCSO_CENTER = Aspect_TypeOfColorScaleOrientation.Aspect_TOCSO_CENTER

class Aspect_TypeOfFacingModel(IntEnum):
	Aspect_TOFM_BOTH_SIDE = 0
	Aspect_TOFM_BACK_SIDE = 1
	Aspect_TOFM_FRONT_SIDE = 2
Aspect_TOFM_BOTH_SIDE = Aspect_TypeOfFacingModel.Aspect_TOFM_BOTH_SIDE
Aspect_TOFM_BACK_SIDE = Aspect_TypeOfFacingModel.Aspect_TOFM_BACK_SIDE
Aspect_TOFM_FRONT_SIDE = Aspect_TypeOfFacingModel.Aspect_TOFM_FRONT_SIDE

class Aspect_FillMethod(IntEnum):
	Aspect_FM_NONE = 0
	Aspect_FM_CENTERED = 1
	Aspect_FM_TILED = 2
	Aspect_FM_STRETCH = 3
Aspect_FM_NONE = Aspect_FillMethod.Aspect_FM_NONE
Aspect_FM_CENTERED = Aspect_FillMethod.Aspect_FM_CENTERED
Aspect_FM_TILED = Aspect_FillMethod.Aspect_FM_TILED
Aspect_FM_STRETCH = Aspect_FillMethod.Aspect_FM_STRETCH

class Aspect_HatchStyle(IntEnum):
	Aspect_HS_SOLID = 0
	Aspect_HS_HORIZONTAL = 7
	Aspect_HS_HORIZONTAL_WIDE = 11
	Aspect_HS_VERTICAL = 8
	Aspect_HS_VERTICAL_WIDE = 12
	Aspect_HS_DIAGONAL_45 = 5
	Aspect_HS_DIAGONAL_45_WIDE = 9
	Aspect_HS_DIAGONAL_135 = 6
	Aspect_HS_DIAGONAL_135_WIDE = 10
	Aspect_HS_GRID = 3
	Aspect_HS_GRID_WIDE = 4
	Aspect_HS_GRID_DIAGONAL = 1
	Aspect_HS_GRID_DIAGONAL_WIDE = 2
	Aspect_HS_NB = 13
Aspect_HS_SOLID = Aspect_HatchStyle.Aspect_HS_SOLID
Aspect_HS_HORIZONTAL = Aspect_HatchStyle.Aspect_HS_HORIZONTAL
Aspect_HS_HORIZONTAL_WIDE = Aspect_HatchStyle.Aspect_HS_HORIZONTAL_WIDE
Aspect_HS_VERTICAL = Aspect_HatchStyle.Aspect_HS_VERTICAL
Aspect_HS_VERTICAL_WIDE = Aspect_HatchStyle.Aspect_HS_VERTICAL_WIDE
Aspect_HS_DIAGONAL_45 = Aspect_HatchStyle.Aspect_HS_DIAGONAL_45
Aspect_HS_DIAGONAL_45_WIDE = Aspect_HatchStyle.Aspect_HS_DIAGONAL_45_WIDE
Aspect_HS_DIAGONAL_135 = Aspect_HatchStyle.Aspect_HS_DIAGONAL_135
Aspect_HS_DIAGONAL_135_WIDE = Aspect_HatchStyle.Aspect_HS_DIAGONAL_135_WIDE
Aspect_HS_GRID = Aspect_HatchStyle.Aspect_HS_GRID
Aspect_HS_GRID_WIDE = Aspect_HatchStyle.Aspect_HS_GRID_WIDE
Aspect_HS_GRID_DIAGONAL = Aspect_HatchStyle.Aspect_HS_GRID_DIAGONAL
Aspect_HS_GRID_DIAGONAL_WIDE = Aspect_HatchStyle.Aspect_HS_GRID_DIAGONAL_WIDE
Aspect_HS_NB = Aspect_HatchStyle.Aspect_HS_NB

class Aspect_PolygonOffsetMode(IntEnum):
	Aspect_POM_Off = 0
	Aspect_POM_Fill = 1
	Aspect_POM_Line = 2
	Aspect_POM_Point = 4
	Aspect_POM_All = Aspect_POM_Fill | Aspect_POM_Line | Aspect_POM_Point
	Aspect_POM_None = 8
	Aspect_POM_Mask = Aspect_POM_All | Aspect_POM_None
Aspect_POM_Off = Aspect_PolygonOffsetMode.Aspect_POM_Off
Aspect_POM_Fill = Aspect_PolygonOffsetMode.Aspect_POM_Fill
Aspect_POM_Line = Aspect_PolygonOffsetMode.Aspect_POM_Line
Aspect_POM_Point = Aspect_PolygonOffsetMode.Aspect_POM_Point
Aspect_POM_All = Aspect_PolygonOffsetMode.Aspect_POM_All
Aspect_POM_None = Aspect_PolygonOffsetMode.Aspect_POM_None
Aspect_POM_Mask = Aspect_PolygonOffsetMode.Aspect_POM_Mask

class Aspect_TypeOfColorScalePosition(IntEnum):
	Aspect_TOCSP_NONE = 0
	Aspect_TOCSP_LEFT = 1
	Aspect_TOCSP_RIGHT = 2
	Aspect_TOCSP_CENTER = 3
Aspect_TOCSP_NONE = Aspect_TypeOfColorScalePosition.Aspect_TOCSP_NONE
Aspect_TOCSP_LEFT = Aspect_TypeOfColorScalePosition.Aspect_TOCSP_LEFT
Aspect_TOCSP_RIGHT = Aspect_TypeOfColorScalePosition.Aspect_TOCSP_RIGHT
Aspect_TOCSP_CENTER = Aspect_TypeOfColorScalePosition.Aspect_TOCSP_CENTER

class Aspect_XAtom(IntEnum):
	Aspect_XA_DELETE_WINDOW = 0
Aspect_XA_DELETE_WINDOW = Aspect_XAtom.Aspect_XA_DELETE_WINDOW

class Aspect_TypeOfTriedronPosition(IntEnum):
	Aspect_TOTP_CENTER = 0
	Aspect_TOTP_TOP = 1
	Aspect_TOTP_BOTTOM = 2
	Aspect_TOTP_LEFT = 4
	Aspect_TOTP_RIGHT = 8
	Aspect_TOTP_LEFT_LOWER = Aspect_TOTP_BOTTOM | Aspect_TOTP_LEFT
	Aspect_TOTP_LEFT_UPPER = Aspect_TOTP_TOP | Aspect_TOTP_LEFT
	Aspect_TOTP_RIGHT_LOWER = Aspect_TOTP_BOTTOM | Aspect_TOTP_RIGHT
	Aspect_TOTP_RIGHT_UPPER = Aspect_TOTP_TOP | Aspect_TOTP_RIGHT
Aspect_TOTP_CENTER = Aspect_TypeOfTriedronPosition.Aspect_TOTP_CENTER
Aspect_TOTP_TOP = Aspect_TypeOfTriedronPosition.Aspect_TOTP_TOP
Aspect_TOTP_BOTTOM = Aspect_TypeOfTriedronPosition.Aspect_TOTP_BOTTOM
Aspect_TOTP_LEFT = Aspect_TypeOfTriedronPosition.Aspect_TOTP_LEFT
Aspect_TOTP_RIGHT = Aspect_TypeOfTriedronPosition.Aspect_TOTP_RIGHT
Aspect_TOTP_LEFT_LOWER = Aspect_TypeOfTriedronPosition.Aspect_TOTP_LEFT_LOWER
Aspect_TOTP_LEFT_UPPER = Aspect_TypeOfTriedronPosition.Aspect_TOTP_LEFT_UPPER
Aspect_TOTP_RIGHT_LOWER = Aspect_TypeOfTriedronPosition.Aspect_TOTP_RIGHT_LOWER
Aspect_TOTP_RIGHT_UPPER = Aspect_TypeOfTriedronPosition.Aspect_TOTP_RIGHT_UPPER

class Aspect_GridDrawMode(IntEnum):
	Aspect_GDM_Lines = 0
	Aspect_GDM_Points = 1
	Aspect_GDM_None = 2
Aspect_GDM_Lines = Aspect_GridDrawMode.Aspect_GDM_Lines
Aspect_GDM_Points = Aspect_GridDrawMode.Aspect_GDM_Points
Aspect_GDM_None = Aspect_GridDrawMode.Aspect_GDM_None

class Aspect_WidthOfLine(IntEnum):
	Aspect_WOL_THIN = 0
	Aspect_WOL_MEDIUM = 1
	Aspect_WOL_THICK = 2
	Aspect_WOL_VERYTHICK = 3
	Aspect_WOL_USERDEFINED = 4
Aspect_WOL_THIN = Aspect_WidthOfLine.Aspect_WOL_THIN
Aspect_WOL_MEDIUM = Aspect_WidthOfLine.Aspect_WOL_MEDIUM
Aspect_WOL_THICK = Aspect_WidthOfLine.Aspect_WOL_THICK
Aspect_WOL_VERYTHICK = Aspect_WidthOfLine.Aspect_WOL_VERYTHICK
Aspect_WOL_USERDEFINED = Aspect_WidthOfLine.Aspect_WOL_USERDEFINED

class Aspect_TypeOfDisplayText(IntEnum):
	Aspect_TODT_NORMAL = 0
	Aspect_TODT_SUBTITLE = 1
	Aspect_TODT_DEKALE = 2
	Aspect_TODT_BLEND = 3
	Aspect_TODT_DIMENSION = 4
	Aspect_TODT_SHADOW = 5
Aspect_TODT_NORMAL = Aspect_TypeOfDisplayText.Aspect_TODT_NORMAL
Aspect_TODT_SUBTITLE = Aspect_TypeOfDisplayText.Aspect_TODT_SUBTITLE
Aspect_TODT_DEKALE = Aspect_TypeOfDisplayText.Aspect_TODT_DEKALE
Aspect_TODT_BLEND = Aspect_TypeOfDisplayText.Aspect_TODT_BLEND
Aspect_TODT_DIMENSION = Aspect_TypeOfDisplayText.Aspect_TODT_DIMENSION
Aspect_TODT_SHADOW = Aspect_TypeOfDisplayText.Aspect_TODT_SHADOW

class Aspect_InteriorStyle(IntEnum):
	Aspect_IS_EMPTY = - 1
	Aspect_IS_SOLID = 0
	Aspect_IS_HATCH = 1
	Aspect_IS_HIDDENLINE = 2
	Aspect_IS_POINT = 3
	Aspect_IS_HOLLOW = Aspect_IS_EMPTY
Aspect_IS_EMPTY = Aspect_InteriorStyle.Aspect_IS_EMPTY
Aspect_IS_SOLID = Aspect_InteriorStyle.Aspect_IS_SOLID
Aspect_IS_HATCH = Aspect_InteriorStyle.Aspect_IS_HATCH
Aspect_IS_HIDDENLINE = Aspect_InteriorStyle.Aspect_IS_HIDDENLINE
Aspect_IS_POINT = Aspect_InteriorStyle.Aspect_IS_POINT
Aspect_IS_HOLLOW = Aspect_InteriorStyle.Aspect_IS_HOLLOW
};
/* end python proxy for enums */

/* handles */
%wrap_handle(Aspect_DisplayConnection)
%wrap_handle(Aspect_Grid)
%wrap_handle(Aspect_Window)
/* end handles declaration */

/* templates */
%template(Aspect_SequenceOfColor) NCollection_Sequence<Quantity_Color>;

%extend NCollection_Sequence<Quantity_Color> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(Aspect_TouchMap) NCollection_IndexedDataMap<Standard_Size,Aspect_Touch>;
/* end templates declaration */

/* typedefs */
typedef void * Aspect_Display;
typedef unsigned long Aspect_Drawable;
typedef void * Aspect_FBConfig;
typedef unsigned long Aspect_Handle;
typedef void * Aspect_RenderingContext;
typedef NCollection_Sequence<Quantity_Color> Aspect_SequenceOfColor;
typedef NCollection_IndexedDataMap<Standard_Size, Aspect_Touch> Aspect_TouchMap;
typedef unsigned int Aspect_VKey;
typedef unsigned int Aspect_VKeyFlags;
typedef unsigned int Aspect_VKeyMouse;
typedef struct __GLXFBConfigRec * GLXFBConfig;
typedef void * HANDLE;
/* end typedefs declaration */

/**************************
* class Aspect_Background *
**************************/
class Aspect_Background {
	public:
		/****************** Aspect_Background ******************/
		/**** md5 signature: c285d3f164d7d45415123925b55dfa2d ****/
		%feature("compactdefaultargs") Aspect_Background;
		%feature("autodoc", "Creates a window background. default color : noc_matragray.

Returns
-------
None
") Aspect_Background;
		 Aspect_Background();

		/****************** Aspect_Background ******************/
		/**** md5 signature: 5dbd53dd21ee3414ceec63d3dadf45f2 ****/
		%feature("compactdefaultargs") Aspect_Background;
		%feature("autodoc", "Creates a window background with the colour <acolor>.

Parameters
----------
AColor: Quantity_Color

Returns
-------
None
") Aspect_Background;
		 Aspect_Background(const Quantity_Color & AColor);

		/****************** Color ******************/
		/**** md5 signature: b37a2e584a895a08fcf8ead60940b246 ****/
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "Returns the colour of the window background <self>.

Returns
-------
Quantity_Color
") Color;
		Quantity_Color Color();

		/****************** SetColor ******************/
		/**** md5 signature: 5aebf70a123538e7dff670112c56db0d ****/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "Modifies the colour of the window background <self>.

Parameters
----------
AColor: Quantity_Color

Returns
-------
None
") SetColor;
		void SetColor(const Quantity_Color & AColor);

};


%extend Aspect_Background {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class Aspect_DisplayConnection *
*********************************/
class Aspect_DisplayConnection : public Standard_Transient {
	public:
};


%make_alias(Aspect_DisplayConnection)

%extend Aspect_DisplayConnection {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def Aspect_DisplayConnection(self):
		pass

	@methodnotwrapped
	def GetAtom(self):
		pass

	@methodnotwrapped
	def GetDisplay(self):
		pass

	@methodnotwrapped
	def GetDisplayName(self):
		pass

	@methodnotwrapped
	def Init(self):
		pass

	@methodnotwrapped
	def IsOwnDisplay(self):
		pass
	}
};

/*********************
* class Aspect_GenId *
*********************/
class Aspect_GenId {
	public:
		/****************** Aspect_GenId ******************/
		/**** md5 signature: 569c368c12c13ee3f3906663aa53662b ****/
		%feature("compactdefaultargs") Aspect_GenId;
		%feature("autodoc", "Creates an available set of identifiers with the lower bound 0 and the upper bound int_max / 2.

Returns
-------
None
") Aspect_GenId;
		 Aspect_GenId();

		/****************** Aspect_GenId ******************/
		/**** md5 signature: 3f26c1994924a0cb83cef8d1c5e3f8d3 ****/
		%feature("compactdefaultargs") Aspect_GenId;
		%feature("autodoc", "Creates an available set of identifiers with specified range. raises identdefinitionerror if theupper is less than thelow.

Parameters
----------
theLow: int
theUpper: int

Returns
-------
None
") Aspect_GenId;
		 Aspect_GenId(const Standard_Integer theLow, const Standard_Integer theUpper);

		/****************** Available ******************/
		/**** md5 signature: 697caaa4e9190a2cfddfe8f6ce24ea8c ****/
		%feature("compactdefaultargs") Available;
		%feature("autodoc", "Returns the number of available identifiers.

Returns
-------
int
") Available;
		Standard_Integer Available();

		/****************** Free ******************/
		/**** md5 signature: adf04b00a0d9dc585c1f31bcdbc395bf ****/
		%feature("compactdefaultargs") Free;
		%feature("autodoc", "Free all identifiers - make the whole range available again.

Returns
-------
None
") Free;
		void Free();

		/****************** Free ******************/
		/**** md5 signature: 912044af0159c0455ab1de14a2ea922d ****/
		%feature("compactdefaultargs") Free;
		%feature("autodoc", "Free specified identifier. warning - method has no protection against double-freeing!.

Parameters
----------
theId: int

Returns
-------
None
") Free;
		void Free(const Standard_Integer theId);

		/****************** HasFree ******************/
		/**** md5 signature: b1851639e312df8e9d1643954f18fb9e ****/
		%feature("compactdefaultargs") HasFree;
		%feature("autodoc", "Returns true if there are available identifiers in range.

Returns
-------
bool
") HasFree;
		Standard_Boolean HasFree();

		/****************** Lower ******************/
		/**** md5 signature: a2a9f1c3c17fa0f26434aadaabeff45a ****/
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "Returns the lower identifier in range.

Returns
-------
int
") Lower;
		Standard_Integer Lower();

		/****************** Next ******************/
		/**** md5 signature: e7361d634adcab8f63c24d757e1e478e ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Returns the next available identifier. warning: raises identdefinitionerror if all identifiers are busy.

Returns
-------
int
") Next;
		Standard_Integer Next();

		/****************** Next ******************/
		/**** md5 signature: 3fd1eee7f153c7ff797dea1b9f67ad85 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Generates the next available identifier. @param theid [out] generated identifier returns false if all identifiers are busy.

Parameters
----------

Returns
-------
theId: int
") Next;
		Standard_Boolean Next(Standard_Integer &OutValue);

		/****************** Upper ******************/
		/**** md5 signature: 621f04fab59b49711e54299100973c4e ****/
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "Returns the upper identifier in range.

Returns
-------
int
") Upper;
		Standard_Integer Upper();

};


%extend Aspect_GenId {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class Aspect_Grid *
********************/
%nodefaultctor Aspect_Grid;
class Aspect_Grid : public Standard_Transient {
	public:
		/****************** Activate ******************/
		/**** md5 signature: 3c1c2136e4be5cb74d5a6a6df9f2730e ****/
		%feature("compactdefaultargs") Activate;
		%feature("autodoc", "Activates the grid. the hit method will return gridx and gridx computed according to the steps of the grid.

Returns
-------
None
") Activate;
		void Activate();

		/****************** Colors ******************/
		/**** md5 signature: febac332dabf87330fc8ae564a90811c ****/
		%feature("compactdefaultargs") Colors;
		%feature("autodoc", "Returns the colors of the grid.

Parameters
----------
aColor: Quantity_Color
aTenthColor: Quantity_Color

Returns
-------
None
") Colors;
		void Colors(Quantity_Color & aColor, Quantity_Color & aTenthColor);

		/****************** Compute ******************/
		/**** md5 signature: f2dc3bb20b3dea64f42829e338efc410 ****/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Returns the point of the grid the closest to the point x,y.

Parameters
----------
X: float
Y: float

Returns
-------
gridX: float
gridY: float
") Compute;
		virtual void Compute(const Standard_Real X, const Standard_Real Y, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Deactivate ******************/
		/**** md5 signature: d5b1d14a550597a64031c7a7feceee08 ****/
		%feature("compactdefaultargs") Deactivate;
		%feature("autodoc", "Deactivates the grid. the hit method will return gridx and gridx as the enter value x & y.

Returns
-------
None
") Deactivate;
		void Deactivate();

		/****************** Display ******************/
		/**** md5 signature: a5bb9d443eb910f59769ed67aea52525 ****/
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "Display the grid at screen.

Returns
-------
None
") Display;
		virtual void Display();

		/****************** DrawMode ******************/
		/**** md5 signature: 820acf5cdbd9b081ca2fdb9e8fa43978 ****/
		%feature("compactdefaultargs") DrawMode;
		%feature("autodoc", "Returns the grid aspect.

Returns
-------
Aspect_GridDrawMode
") DrawMode;
		Aspect_GridDrawMode DrawMode();

		/****************** Erase ******************/
		/**** md5 signature: c55517fe39ff6c9fe42803167b097498 ****/
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "Erase the grid from screen.

Returns
-------
None
") Erase;
		virtual void Erase();

		/****************** Hit ******************/
		/**** md5 signature: a0d754d9f4e2a7f6a6b3cbe673f29375 ****/
		%feature("compactdefaultargs") Hit;
		%feature("autodoc", "Returns the point of the grid the closest to the point x,y if the grid is active. if the grid is not active returns x,y.

Parameters
----------
X: float
Y: float

Returns
-------
gridX: float
gridY: float
") Hit;
		void Hit(const Standard_Real X, const Standard_Real Y, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Init ******************/
		/**** md5 signature: ae70d610df2081e50f19659c49fb9bd4 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Init;
		virtual void Init();

		/****************** IsActive ******************/
		/**** md5 signature: 1430a89053d4b0413f25b185201efe70 ****/
		%feature("compactdefaultargs") IsActive;
		%feature("autodoc", "Returns true when the grid is active.

Returns
-------
bool
") IsActive;
		Standard_Boolean IsActive();

		/****************** IsDisplayed ******************/
		/**** md5 signature: f0a946c4c132eaa80b7a2b5b8752ab0c ****/
		%feature("compactdefaultargs") IsDisplayed;
		%feature("autodoc", "Returns true when the grid is displayed at screen.

Returns
-------
bool
") IsDisplayed;
		virtual Standard_Boolean IsDisplayed();

		/****************** Rotate ******************/
		/**** md5 signature: ba6155601a6a3ebf5db401b4fcb0cac9 ****/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "Rotate the grid from a relative angle.

Parameters
----------
anAngle: float

Returns
-------
None
") Rotate;
		void Rotate(const Standard_Real anAngle);

		/****************** RotationAngle ******************/
		/**** md5 signature: 6c7adcb07df938548950d9bd86bc732a ****/
		%feature("compactdefaultargs") RotationAngle;
		%feature("autodoc", "Returns the x angle of the grid.

Returns
-------
float
") RotationAngle;
		Standard_Real RotationAngle();

		/****************** SetColors ******************/
		/**** md5 signature: f81cf1490ceea17485c0de0269e7ec9c ****/
		%feature("compactdefaultargs") SetColors;
		%feature("autodoc", "Change the colors of the grid.

Parameters
----------
aColor: Quantity_Color
aTenthColor: Quantity_Color

Returns
-------
None
") SetColors;
		virtual void SetColors(const Quantity_Color & aColor, const Quantity_Color & aTenthColor);

		/****************** SetDrawMode ******************/
		/**** md5 signature: ee6037d77208349cb9a8e316a9952fc6 ****/
		%feature("compactdefaultargs") SetDrawMode;
		%feature("autodoc", "Change the grid aspect.

Parameters
----------
aDrawMode: Aspect_GridDrawMode

Returns
-------
None
") SetDrawMode;
		void SetDrawMode(const Aspect_GridDrawMode aDrawMode);

		/****************** SetRotationAngle ******************/
		/**** md5 signature: f85165df588b8bb105e7c1fc95c0038c ****/
		%feature("compactdefaultargs") SetRotationAngle;
		%feature("autodoc", "Defines the orientation of the grid.

Parameters
----------
anAngle: float

Returns
-------
None
") SetRotationAngle;
		void SetRotationAngle(const Standard_Real anAngle);

		/****************** SetXOrigin ******************/
		/**** md5 signature: 5f29e91eabd84d1fb448e2f1a42216fa ****/
		%feature("compactdefaultargs") SetXOrigin;
		%feature("autodoc", "Defines the x origin of the grid.

Parameters
----------
anOrigin: float

Returns
-------
None
") SetXOrigin;
		void SetXOrigin(const Standard_Real anOrigin);

		/****************** SetYOrigin ******************/
		/**** md5 signature: 8ae28e02e415aeae0cabe4ebeb845aac ****/
		%feature("compactdefaultargs") SetYOrigin;
		%feature("autodoc", "Defines the y origin of the grid.

Parameters
----------
anOrigin: float

Returns
-------
None
") SetYOrigin;
		void SetYOrigin(const Standard_Real anOrigin);

		/****************** Translate ******************/
		/**** md5 signature: 2c4d53c487acc4e66ea6ff494e659356 ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "Translate the grid from a relative distance.

Parameters
----------
aDx: float
aDy: float

Returns
-------
None
") Translate;
		void Translate(const Standard_Real aDx, const Standard_Real aDy);

		/****************** XOrigin ******************/
		/**** md5 signature: 2ca8cc35b96fb011ff973786f0ef31b1 ****/
		%feature("compactdefaultargs") XOrigin;
		%feature("autodoc", "Returns the x origin of the grid.

Returns
-------
float
") XOrigin;
		Standard_Real XOrigin();

		/****************** YOrigin ******************/
		/**** md5 signature: 7f8bdf33836dd27df5ea3c3e718919d0 ****/
		%feature("compactdefaultargs") YOrigin;
		%feature("autodoc", "Returns the x origin of the grid.

Returns
-------
float
") YOrigin;
		Standard_Real YOrigin();

};


%make_alias(Aspect_Grid)

%extend Aspect_Grid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class Aspect_ScrollDelta *
***************************/
class Aspect_ScrollDelta {
	public:
		float Delta;
		Aspect_VKeyFlags Flags;
		/****************** Aspect_ScrollDelta ******************/
		/**** md5 signature: 0d3fcbaf34563dcd0f20bf50c1b22bc1 ****/
		%feature("compactdefaultargs") Aspect_ScrollDelta;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") Aspect_ScrollDelta;
		 Aspect_ScrollDelta();

		/****************** Aspect_ScrollDelta ******************/
		/**** md5 signature: f8460f2fd92f69dbd6ae1c79508cf38b ****/
		%feature("compactdefaultargs") Aspect_ScrollDelta;
		%feature("autodoc", "Constructor.

Parameters
----------
thePnt: NCollection_Vec2<int>
theValue: float
theFlags: Aspect_VKeyFlags,optional
	default value is Aspect_VKeyFlags_NONE

Returns
-------
None
") Aspect_ScrollDelta;
		 Aspect_ScrollDelta(const NCollection_Vec2<int> & thePnt, Standard_Real theValue, Aspect_VKeyFlags theFlags = Aspect_VKeyFlags_NONE);

		/****************** Aspect_ScrollDelta ******************/
		/**** md5 signature: 4c6a15a03d5e8065050d3ebd39119299 ****/
		%feature("compactdefaultargs") Aspect_ScrollDelta;
		%feature("autodoc", "Constructor with undefined point.

Parameters
----------
theValue: float
theFlags: Aspect_VKeyFlags,optional
	default value is Aspect_VKeyFlags_NONE

Returns
-------
None
") Aspect_ScrollDelta;
		 Aspect_ScrollDelta(Standard_Real theValue, Aspect_VKeyFlags theFlags = Aspect_VKeyFlags_NONE);

		/****************** HasPoint ******************/
		/**** md5 signature: 314e70d3c9f0b28261d75c0c6244be38 ****/
		%feature("compactdefaultargs") HasPoint;
		%feature("autodoc", "Return true if action has point defined.

Returns
-------
bool
") HasPoint;
		bool HasPoint();

		/****************** ResetPoint ******************/
		/**** md5 signature: d4f07a32710ac608e876db8058caee64 ****/
		%feature("compactdefaultargs") ResetPoint;
		%feature("autodoc", "Reset at point.

Returns
-------
None
") ResetPoint;
		void ResetPoint();

};


%extend Aspect_ScrollDelta {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class Aspect_Touch *
*********************/
class Aspect_Touch {
	public:
		bool IsPreciseDevice;
		/****************** Aspect_Touch ******************/
		/**** md5 signature: a51d1277d944673675b62a1916b1d065 ****/
		%feature("compactdefaultargs") Aspect_Touch;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") Aspect_Touch;
		 Aspect_Touch();

		/****************** Aspect_Touch ******************/
		/**** md5 signature: f577ccd3298bca230729e387e7c8ee22 ****/
		%feature("compactdefaultargs") Aspect_Touch;
		%feature("autodoc", "Constructor with initialization.

Parameters
----------
thePnt: NCollection_Vec2<float>
theIsPreciseDevice: bool

Returns
-------
None
") Aspect_Touch;
		 Aspect_Touch(const NCollection_Vec2<Standard_Real> & thePnt, Standard_Boolean theIsPreciseDevice);

		/****************** Aspect_Touch ******************/
		/**** md5 signature: d7a9f77f97f217469aa14c1453a5ec71 ****/
		%feature("compactdefaultargs") Aspect_Touch;
		%feature("autodoc", "Constructor with initialization.

Parameters
----------
theX: float
theY: float
theIsPreciseDevice: bool

Returns
-------
None
") Aspect_Touch;
		 Aspect_Touch(Standard_Real theX, Standard_Real theY, Standard_Boolean theIsPreciseDevice);

		/****************** Delta ******************/
		/**** md5 signature: 633ea93d8b8f65b7d72a9eb7e3592640 ****/
		%feature("compactdefaultargs") Delta;
		%feature("autodoc", "Return values delta.

Returns
-------
NCollection_Vec2<float >
") Delta;
		NCollection_Vec2<Standard_Real > Delta();

};


%extend Aspect_Touch {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class Aspect_Window *
**********************/
%nodefaultctor Aspect_Window;
class Aspect_Window : public Standard_Transient {
	public:
		/****************** Background ******************/
		/**** md5 signature: c745ba92fb6d5e6544856c59b201a620 ****/
		%feature("compactdefaultargs") Background;
		%feature("autodoc", "Returns the window background.

Returns
-------
Aspect_Background
") Background;
		Aspect_Background Background();

		/****************** BackgroundFillMethod ******************/
		/**** md5 signature: 3dc602ad8e5026afe96d15088c7b9833 ****/
		%feature("compactdefaultargs") BackgroundFillMethod;
		%feature("autodoc", "Returns the current image background fill mode.

Returns
-------
Aspect_FillMethod
") BackgroundFillMethod;
		Aspect_FillMethod BackgroundFillMethod();

		/****************** DoMapping ******************/
		/**** md5 signature: bccedbb13c087bbcb0fdc2dc4be5fafa ****/
		%feature("compactdefaultargs") DoMapping;
		%feature("autodoc", "Apply the mapping change to the window <self>. and returns true if the window is mapped at screen.

Returns
-------
bool
") DoMapping;
		virtual Standard_Boolean DoMapping();

		/****************** DoResize ******************/
		/**** md5 signature: 3bfba56102be8f1f57df3978a84581c9 ****/
		%feature("compactdefaultargs") DoResize;
		%feature("autodoc", "Apply the resizing to the window <self>.

Returns
-------
Aspect_TypeOfResize
") DoResize;
		virtual Aspect_TypeOfResize DoResize();

		/****************** GradientBackground ******************/
		/**** md5 signature: d48840592ec4f12118e8b8d065c33698 ****/
		%feature("compactdefaultargs") GradientBackground;
		%feature("autodoc", "Returns the window gradient background.

Returns
-------
Aspect_GradientBackground
") GradientBackground;
		Aspect_GradientBackground GradientBackground();

		/****************** InvalidateContent ******************/
		/**** md5 signature: c3842a52e192571bdc8176fffa5e2159 ****/
		%feature("compactdefaultargs") InvalidateContent;
		%feature("autodoc", "Invalidate entire window content. //! implementation is expected to allow calling this method from non-gui thread, e.g. by queuing exposure event into window message queue or in other thread-safe manner. //! optional display argument should be passed when called from non-gui thread on platforms implementing thread-unsafe connections to display. null can be passed instead otherwise.

Parameters
----------
theDisp: Aspect_DisplayConnection

Returns
-------
None
") InvalidateContent;
		virtual void InvalidateContent(const opencascade::handle<Aspect_DisplayConnection> & theDisp);

		/****************** IsMapped ******************/
		/**** md5 signature: 4d5cfb66280177c9e63a17b79e45005f ****/
		%feature("compactdefaultargs") IsMapped;
		%feature("autodoc", "Returns true if the window <self> is opened and false if the window is closed.

Returns
-------
bool
") IsMapped;
		virtual Standard_Boolean IsMapped();

		/****************** IsVirtual ******************/
		/**** md5 signature: 6b108b5483133abeb2e67cd521931989 ****/
		%feature("compactdefaultargs") IsVirtual;
		%feature("autodoc", "Returns true if the window <self> is virtual.

Returns
-------
bool
") IsVirtual;
		Standard_Boolean IsVirtual();

		/****************** Map ******************/
		/**** md5 signature: 0e63cf65e00294792f8d62b1c43bea62 ****/
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "Opens the window <self>.

Returns
-------
None
") Map;
		virtual void Map();

		/****************** NativeFBConfig ******************/
		/**** md5 signature: 4c353bf7a84ef94261f833f6d54eaa5e ****/
		%feature("compactdefaultargs") NativeFBConfig;
		%feature("autodoc", "Returns native window fb config (glxfbconfig on xlib).

Returns
-------
Aspect_FBConfig
") NativeFBConfig;
		virtual Aspect_FBConfig NativeFBConfig();

		/****************** Position ******************/
		/**** md5 signature: 30fa6ef63eb4cfa1d4d0a6a072935a04 ****/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Returns the window position in pixel.

Parameters
----------

Returns
-------
X1: int
Y1: int
X2: int
Y2: int
") Position;
		virtual void Position(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** Ratio ******************/
		/**** md5 signature: d40ca1d2627bbb87a34e5c89b2c7db06 ****/
		%feature("compactdefaultargs") Ratio;
		%feature("autodoc", "Returns the window ratio equal to the physical width/height dimensions.

Returns
-------
float
") Ratio;
		virtual Standard_Real Ratio();

		/****************** SetBackground ******************/
		/**** md5 signature: 1ead7ff97ae08966fe95d016244fe9b6 ****/
		%feature("compactdefaultargs") SetBackground;
		%feature("autodoc", "Modifies the window background.

Parameters
----------
ABack: Aspect_Background

Returns
-------
None
") SetBackground;
		void SetBackground(const Aspect_Background & ABack);

		/****************** SetBackground ******************/
		/**** md5 signature: d24f1efd14ab0c25fed5c82da2583a6f ****/
		%feature("compactdefaultargs") SetBackground;
		%feature("autodoc", "Modifies the window background.

Parameters
----------
color: Quantity_Color

Returns
-------
None
") SetBackground;
		void SetBackground(const Quantity_Color & color);

		/****************** SetBackground ******************/
		/**** md5 signature: e326ee0ef2c818116b46fe0d832b2c39 ****/
		%feature("compactdefaultargs") SetBackground;
		%feature("autodoc", "Modifies the window gradient background.

Parameters
----------
ABackground: Aspect_GradientBackground

Returns
-------
None
") SetBackground;
		void SetBackground(const Aspect_GradientBackground & ABackground);

		/****************** SetBackground ******************/
		/**** md5 signature: 333d66c15042163afcf370e304fa7b6a ****/
		%feature("compactdefaultargs") SetBackground;
		%feature("autodoc", "Modifies the window gradient background.

Parameters
----------
theFirstColor: Quantity_Color
theSecondColor: Quantity_Color
theFillMethod: Aspect_GradientFillMethod

Returns
-------
None
") SetBackground;
		void SetBackground(const Quantity_Color & theFirstColor, const Quantity_Color & theSecondColor, const Aspect_GradientFillMethod theFillMethod);

		/****************** SetTitle ******************/
		/**** md5 signature: e6432d7e27226322b8262b3f3f4d5a28 ****/
		%feature("compactdefaultargs") SetTitle;
		%feature("autodoc", "Sets window title.

Parameters
----------
theTitle: TCollection_AsciiString

Returns
-------
None
") SetTitle;
		virtual void SetTitle(const TCollection_AsciiString & theTitle);

		/****************** SetVirtual ******************/
		/**** md5 signature: f013b7099e5195f3ad8ac5f9c350083a ****/
		%feature("compactdefaultargs") SetVirtual;
		%feature("autodoc", "Setup the virtual state.

Parameters
----------
theVirtual: bool

Returns
-------
None
") SetVirtual;
		void SetVirtual(const Standard_Boolean theVirtual);

		/****************** Size ******************/
		/**** md5 signature: 5ff69e0e67e54ec54de4bd366eb3aa6a ****/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "Returns the window size in pixel.

Parameters
----------

Returns
-------
Width: int
Height: int
") Size;
		virtual void Size(Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** Unmap ******************/
		/**** md5 signature: 2681daf3d4beece6a894fb54cb645818 ****/
		%feature("compactdefaultargs") Unmap;
		%feature("autodoc", "Closes the window <self>.

Returns
-------
None
") Unmap;
		virtual void Unmap();

};


%make_alias(Aspect_Window)

%extend Aspect_Window {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def NativeHandle(self):
		pass

	@methodnotwrapped
	def NativeParentHandle(self):
		pass
	}
};

/****************************
* class Aspect_CircularGrid *
****************************/
/**********************************
* class Aspect_GradientBackground *
**********************************/
class Aspect_GradientBackground : public Aspect_Background {
	public:
		/****************** Aspect_GradientBackground ******************/
		/**** md5 signature: 2a3b12e3984621a36868307403d00696 ****/
		%feature("compactdefaultargs") Aspect_GradientBackground;
		%feature("autodoc", "Creates a window gradient background. default colors : quantity_noc_black. default fill method : aspect_gfm_none.

Returns
-------
None
") Aspect_GradientBackground;
		 Aspect_GradientBackground();

		/****************** Aspect_GradientBackground ******************/
		/**** md5 signature: a6f68c9f1a0e9cb605f0a1cfca9bada3 ****/
		%feature("compactdefaultargs") Aspect_GradientBackground;
		%feature("autodoc", "Creates a window gradient background with colours <acolor1, acolor2>.

Parameters
----------
AColor1: Quantity_Color
AColor2: Quantity_Color
AMethod: Aspect_GradientFillMethod,optional
	default value is Aspect_GFM_HOR

Returns
-------
None
") Aspect_GradientBackground;
		 Aspect_GradientBackground(const Quantity_Color & AColor1, const Quantity_Color & AColor2, const Aspect_GradientFillMethod AMethod = Aspect_GFM_HOR);

		/****************** BgGradientFillMethod ******************/
		/**** md5 signature: 7ed50907542306114d5e90acbea724cc ****/
		%feature("compactdefaultargs") BgGradientFillMethod;
		%feature("autodoc", "Returns the current gradient background fill mode.

Returns
-------
Aspect_GradientFillMethod
") BgGradientFillMethod;
		Aspect_GradientFillMethod BgGradientFillMethod();

		/****************** Colors ******************/
		/**** md5 signature: 1f444dae8ef6192a952d97253320da63 ****/
		%feature("compactdefaultargs") Colors;
		%feature("autodoc", "Returns colours of the window gradient background <self>.

Parameters
----------
AColor1: Quantity_Color
AColor2: Quantity_Color

Returns
-------
None
") Colors;
		void Colors(Quantity_Color & AColor1, Quantity_Color & AColor2);

		/****************** SetColors ******************/
		/**** md5 signature: e9d1a160fb9ca8b15bcaf9ca8e97b5f0 ****/
		%feature("compactdefaultargs") SetColors;
		%feature("autodoc", "Modifies the colours of the window gradient background <self>.

Parameters
----------
AColor1: Quantity_Color
AColor2: Quantity_Color
AMethod: Aspect_GradientFillMethod,optional
	default value is Aspect_GFM_HOR

Returns
-------
None
") SetColors;
		void SetColors(const Quantity_Color & AColor1, const Quantity_Color & AColor2, const Aspect_GradientFillMethod AMethod = Aspect_GFM_HOR);

};


%extend Aspect_GradientBackground {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class Aspect_NeutralWindow *
*****************************/
/*******************************
* class Aspect_RectangularGrid *
*******************************/
/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class Aspect_CircularGrid:
	pass

@classnotwrapped
class Aspect_NeutralWindow:
	pass

@classnotwrapped
class Aspect_RectangularGrid:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
