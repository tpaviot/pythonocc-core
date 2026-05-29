/*
Copyright 2008-2026 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_aspect.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


%{
#include<Aspect_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Quantity_module.hxx>
#include<gp_module.hxx>
#include<TCollection_module.hxx>
#include<Image_module.hxx>
#include<Graphic3d_module.hxx>
#include<Bnd_module.hxx>
#include<Media_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Quantity.i
%import gp.i
%import TCollection.i
%import Image.i
%import Graphic3d.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum Aspect_ColorSpace {
	Aspect_ColorSpace_sRGB = 0,
	Aspect_ColorSpace_Linear = 1,
};

enum Aspect_Eye {
	Aspect_Eye_Left = 0,
	Aspect_Eye_Right = 1,
};

enum Aspect_FillMethod {
	Aspect_FM_NONE = 0,
	Aspect_FM_CENTERED = 1,
	Aspect_FM_TILED = 2,
	Aspect_FM_STRETCH = 3,
};

enum Aspect_GradientFillMethod {
	Aspect_GradientFillMethod_None = 0,
	Aspect_GradientFillMethod_Horizontal = 1,
	Aspect_GradientFillMethod_Vertical = 2,
	Aspect_GradientFillMethod_Diagonal1 = 3,
	Aspect_GradientFillMethod_Diagonal2 = 4,
	Aspect_GradientFillMethod_Corner1 = 5,
	Aspect_GradientFillMethod_Corner2 = 6,
	Aspect_GradientFillMethod_Corner3 = 7,
	Aspect_GradientFillMethod_Corner4 = 8,
	Aspect_GradientFillMethod_Elliptical = 9,
	Aspect_GFM_NONE = Aspect_GradientFillMethod_None,
	Aspect_GFM_HOR = Aspect_GradientFillMethod_Horizontal,
	Aspect_GFM_VER = Aspect_GradientFillMethod_Vertical,
	Aspect_GFM_DIAG1 = Aspect_GradientFillMethod_Diagonal1,
	Aspect_GFM_DIAG2 = Aspect_GradientFillMethod_Diagonal2,
	Aspect_GFM_CORNER1 = Aspect_GradientFillMethod_Corner1,
	Aspect_GFM_CORNER2 = Aspect_GradientFillMethod_Corner2,
	Aspect_GFM_CORNER3 = Aspect_GradientFillMethod_Corner3,
	Aspect_GFM_CORNER4 = Aspect_GradientFillMethod_Corner4,
};

enum Aspect_GraphicsLibrary {
	Aspect_GraphicsLibrary_OpenGL = 0,
	Aspect_GraphicsLibrary_OpenGLES = 1,
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

enum Aspect_InteriorStyle {
	Aspect_IS_EMPTY = - 1,
	Aspect_IS_SOLID = 0,
	Aspect_IS_HATCH = 1,
	Aspect_IS_HIDDENLINE = 2,
	Aspect_IS_POINT = 3,
	Aspect_IS_HOLLOW = Aspect_IS_EMPTY,
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
	Aspect_TODT_SHADOW = 5,
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

enum Aspect_TypeOfLine {
	Aspect_TOL_EMPTY = - 1,
	Aspect_TOL_SOLID = 0,
	Aspect_TOL_DASH = 1,
	Aspect_TOL_DOT = 2,
	Aspect_TOL_DOTDASH = 3,
	Aspect_TOL_USERDEFINED = 4,
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
	Aspect_VKey_ViewTop = 106,
	Aspect_VKey_ViewBottom = 107,
	Aspect_VKey_ViewLeft = 108,
	Aspect_VKey_ViewRight = 109,
	Aspect_VKey_ViewFront = 110,
	Aspect_VKey_ViewBack = 111,
	Aspect_VKey_ViewAxoLeftProj = 112,
	Aspect_VKey_ViewAxoRightProj = 113,
	Aspect_VKey_ViewFitAll = 114,
	Aspect_VKey_ViewRoll90CW = 115,
	Aspect_VKey_ViewRoll90CCW = 116,
	Aspect_VKey_ViewSwitchRotate = 117,
	Aspect_VKey_Shift = 118,
	Aspect_VKey_Control = 119,
	Aspect_VKey_Alt = 120,
	Aspect_VKey_Menu = 121,
	Aspect_VKey_Meta = 122,
	Aspect_VKey_NavInteract = 123,
	Aspect_VKey_NavForward = 124,
	Aspect_VKey_NavBackward = 125,
	Aspect_VKey_NavSlideLeft = 126,
	Aspect_VKey_NavSlideRight = 127,
	Aspect_VKey_NavSlideUp = 128,
	Aspect_VKey_NavSlideDown = 129,
	Aspect_VKey_NavRollCCW = 130,
	Aspect_VKey_NavRollCW = 131,
	Aspect_VKey_NavLookLeft = 132,
	Aspect_VKey_NavLookRight = 133,
	Aspect_VKey_NavLookUp = 134,
	Aspect_VKey_NavLookDown = 135,
	Aspect_VKey_NavCrouch = 136,
	Aspect_VKey_NavJump = 137,
	Aspect_VKey_NavThrustForward = 138,
	Aspect_VKey_NavThrustBackward = 139,
	Aspect_VKey_NavThrustStop = 140,
	Aspect_VKey_NavSpeedIncrease = 141,
	Aspect_VKey_NavSpeedDecrease = 142,
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

enum Aspect_XRActionType {
	Aspect_XRActionType_InputDigital = 0,
	Aspect_XRActionType_InputAnalog = 1,
	Aspect_XRActionType_InputPose = 2,
	Aspect_XRActionType_InputSkeletal = 3,
	Aspect_XRActionType_OutputHaptic = 4,
};

enum Aspect_XRGenericAction {
	Aspect_XRGenericAction_IsHeadsetOn = 0,
	Aspect_XRGenericAction_InputAppMenu = 1,
	Aspect_XRGenericAction_InputSysMenu = 2,
	Aspect_XRGenericAction_InputTriggerPull = 3,
	Aspect_XRGenericAction_InputTriggerClick = 4,
	Aspect_XRGenericAction_InputGripClick = 5,
	Aspect_XRGenericAction_InputTrackPadPosition = 6,
	Aspect_XRGenericAction_InputTrackPadTouch = 7,
	Aspect_XRGenericAction_InputTrackPadClick = 8,
	Aspect_XRGenericAction_InputThumbstickPosition = 9,
	Aspect_XRGenericAction_InputThumbstickTouch = 10,
	Aspect_XRGenericAction_InputThumbstickClick = 11,
	Aspect_XRGenericAction_InputPoseBase = 12,
	Aspect_XRGenericAction_InputPoseFront = 13,
	Aspect_XRGenericAction_InputPoseHandGrip = 14,
	Aspect_XRGenericAction_InputPoseFingerTip = 15,
	Aspect_XRGenericAction_OutputHaptic = 16,
};

enum  {
	Aspect_XRGenericAction_NB = Aspect_XRGenericAction_OutputHaptic + 1,
};

enum Aspect_XRTrackedDeviceRole {
	Aspect_XRTrackedDeviceRole_Head = 0,
	Aspect_XRTrackedDeviceRole_LeftHand = 1,
	Aspect_XRTrackedDeviceRole_RightHand = 2,
	Aspect_XRTrackedDeviceRole_Other = 3,
};

enum  {
	Aspect_XRTrackedDeviceRole_NB = Aspect_XRTrackedDeviceRole_Other + 1,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class Aspect_ColorSpace(IntEnum):
	Aspect_ColorSpace_sRGB = 0
	Aspect_ColorSpace_Linear = 1
Aspect_ColorSpace_sRGB = Aspect_ColorSpace.Aspect_ColorSpace_sRGB
Aspect_ColorSpace_Linear = Aspect_ColorSpace.Aspect_ColorSpace_Linear

class Aspect_Eye(IntEnum):
	Aspect_Eye_Left = 0
	Aspect_Eye_Right = 1
Aspect_Eye_Left = Aspect_Eye.Aspect_Eye_Left
Aspect_Eye_Right = Aspect_Eye.Aspect_Eye_Right

class Aspect_FillMethod(IntEnum):
	Aspect_FM_NONE = 0
	Aspect_FM_CENTERED = 1
	Aspect_FM_TILED = 2
	Aspect_FM_STRETCH = 3
Aspect_FM_NONE = Aspect_FillMethod.Aspect_FM_NONE
Aspect_FM_CENTERED = Aspect_FillMethod.Aspect_FM_CENTERED
Aspect_FM_TILED = Aspect_FillMethod.Aspect_FM_TILED
Aspect_FM_STRETCH = Aspect_FillMethod.Aspect_FM_STRETCH

class Aspect_GradientFillMethod(IntEnum):
	Aspect_GradientFillMethod_None = 0
	Aspect_GradientFillMethod_Horizontal = 1
	Aspect_GradientFillMethod_Vertical = 2
	Aspect_GradientFillMethod_Diagonal1 = 3
	Aspect_GradientFillMethod_Diagonal2 = 4
	Aspect_GradientFillMethod_Corner1 = 5
	Aspect_GradientFillMethod_Corner2 = 6
	Aspect_GradientFillMethod_Corner3 = 7
	Aspect_GradientFillMethod_Corner4 = 8
	Aspect_GradientFillMethod_Elliptical = 9
	Aspect_GFM_NONE = Aspect_GradientFillMethod_None
	Aspect_GFM_HOR = Aspect_GradientFillMethod_Horizontal
	Aspect_GFM_VER = Aspect_GradientFillMethod_Vertical
	Aspect_GFM_DIAG1 = Aspect_GradientFillMethod_Diagonal1
	Aspect_GFM_DIAG2 = Aspect_GradientFillMethod_Diagonal2
	Aspect_GFM_CORNER1 = Aspect_GradientFillMethod_Corner1
	Aspect_GFM_CORNER2 = Aspect_GradientFillMethod_Corner2
	Aspect_GFM_CORNER3 = Aspect_GradientFillMethod_Corner3
	Aspect_GFM_CORNER4 = Aspect_GradientFillMethod_Corner4
Aspect_GradientFillMethod_None = Aspect_GradientFillMethod.Aspect_GradientFillMethod_None
Aspect_GradientFillMethod_Horizontal = Aspect_GradientFillMethod.Aspect_GradientFillMethod_Horizontal
Aspect_GradientFillMethod_Vertical = Aspect_GradientFillMethod.Aspect_GradientFillMethod_Vertical
Aspect_GradientFillMethod_Diagonal1 = Aspect_GradientFillMethod.Aspect_GradientFillMethod_Diagonal1
Aspect_GradientFillMethod_Diagonal2 = Aspect_GradientFillMethod.Aspect_GradientFillMethod_Diagonal2
Aspect_GradientFillMethod_Corner1 = Aspect_GradientFillMethod.Aspect_GradientFillMethod_Corner1
Aspect_GradientFillMethod_Corner2 = Aspect_GradientFillMethod.Aspect_GradientFillMethod_Corner2
Aspect_GradientFillMethod_Corner3 = Aspect_GradientFillMethod.Aspect_GradientFillMethod_Corner3
Aspect_GradientFillMethod_Corner4 = Aspect_GradientFillMethod.Aspect_GradientFillMethod_Corner4
Aspect_GradientFillMethod_Elliptical = Aspect_GradientFillMethod.Aspect_GradientFillMethod_Elliptical
Aspect_GFM_NONE = Aspect_GradientFillMethod.Aspect_GFM_NONE
Aspect_GFM_HOR = Aspect_GradientFillMethod.Aspect_GFM_HOR
Aspect_GFM_VER = Aspect_GradientFillMethod.Aspect_GFM_VER
Aspect_GFM_DIAG1 = Aspect_GradientFillMethod.Aspect_GFM_DIAG1
Aspect_GFM_DIAG2 = Aspect_GradientFillMethod.Aspect_GFM_DIAG2
Aspect_GFM_CORNER1 = Aspect_GradientFillMethod.Aspect_GFM_CORNER1
Aspect_GFM_CORNER2 = Aspect_GradientFillMethod.Aspect_GFM_CORNER2
Aspect_GFM_CORNER3 = Aspect_GradientFillMethod.Aspect_GFM_CORNER3
Aspect_GFM_CORNER4 = Aspect_GradientFillMethod.Aspect_GFM_CORNER4

class Aspect_GraphicsLibrary(IntEnum):
	Aspect_GraphicsLibrary_OpenGL = 0
	Aspect_GraphicsLibrary_OpenGLES = 1
Aspect_GraphicsLibrary_OpenGL = Aspect_GraphicsLibrary.Aspect_GraphicsLibrary_OpenGL
Aspect_GraphicsLibrary_OpenGLES = Aspect_GraphicsLibrary.Aspect_GraphicsLibrary_OpenGLES

class Aspect_GridDrawMode(IntEnum):
	Aspect_GDM_Lines = 0
	Aspect_GDM_Points = 1
	Aspect_GDM_None = 2
Aspect_GDM_Lines = Aspect_GridDrawMode.Aspect_GDM_Lines
Aspect_GDM_Points = Aspect_GridDrawMode.Aspect_GDM_Points
Aspect_GDM_None = Aspect_GridDrawMode.Aspect_GDM_None

class Aspect_GridType(IntEnum):
	Aspect_GT_Rectangular = 0
	Aspect_GT_Circular = 1
Aspect_GT_Rectangular = Aspect_GridType.Aspect_GT_Rectangular
Aspect_GT_Circular = Aspect_GridType.Aspect_GT_Circular

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

class Aspect_TypeOfColorScaleData(IntEnum):
	Aspect_TOCSD_AUTO = 0
	Aspect_TOCSD_USER = 1
Aspect_TOCSD_AUTO = Aspect_TypeOfColorScaleData.Aspect_TOCSD_AUTO
Aspect_TOCSD_USER = Aspect_TypeOfColorScaleData.Aspect_TOCSD_USER

class Aspect_TypeOfColorScaleOrientation(IntEnum):
	Aspect_TOCSO_NONE = 0
	Aspect_TOCSO_LEFT = 1
	Aspect_TOCSO_RIGHT = 2
	Aspect_TOCSO_CENTER = 3
Aspect_TOCSO_NONE = Aspect_TypeOfColorScaleOrientation.Aspect_TOCSO_NONE
Aspect_TOCSO_LEFT = Aspect_TypeOfColorScaleOrientation.Aspect_TOCSO_LEFT
Aspect_TOCSO_RIGHT = Aspect_TypeOfColorScaleOrientation.Aspect_TOCSO_RIGHT
Aspect_TOCSO_CENTER = Aspect_TypeOfColorScaleOrientation.Aspect_TOCSO_CENTER

class Aspect_TypeOfColorScalePosition(IntEnum):
	Aspect_TOCSP_NONE = 0
	Aspect_TOCSP_LEFT = 1
	Aspect_TOCSP_RIGHT = 2
	Aspect_TOCSP_CENTER = 3
Aspect_TOCSP_NONE = Aspect_TypeOfColorScalePosition.Aspect_TOCSP_NONE
Aspect_TOCSP_LEFT = Aspect_TypeOfColorScalePosition.Aspect_TOCSP_LEFT
Aspect_TOCSP_RIGHT = Aspect_TypeOfColorScalePosition.Aspect_TOCSP_RIGHT
Aspect_TOCSP_CENTER = Aspect_TypeOfColorScalePosition.Aspect_TOCSP_CENTER

class Aspect_TypeOfDeflection(IntEnum):
	Aspect_TOD_RELATIVE = 0
	Aspect_TOD_ABSOLUTE = 1
Aspect_TOD_RELATIVE = Aspect_TypeOfDeflection.Aspect_TOD_RELATIVE
Aspect_TOD_ABSOLUTE = Aspect_TypeOfDeflection.Aspect_TOD_ABSOLUTE

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

class Aspect_TypeOfFacingModel(IntEnum):
	Aspect_TOFM_BOTH_SIDE = 0
	Aspect_TOFM_BACK_SIDE = 1
	Aspect_TOFM_FRONT_SIDE = 2
Aspect_TOFM_BOTH_SIDE = Aspect_TypeOfFacingModel.Aspect_TOFM_BOTH_SIDE
Aspect_TOFM_BACK_SIDE = Aspect_TypeOfFacingModel.Aspect_TOFM_BACK_SIDE
Aspect_TOFM_FRONT_SIDE = Aspect_TypeOfFacingModel.Aspect_TOFM_FRONT_SIDE

class Aspect_TypeOfHighlightMethod(IntEnum):
	Aspect_TOHM_COLOR = 0
	Aspect_TOHM_BOUNDBOX = 1
Aspect_TOHM_COLOR = Aspect_TypeOfHighlightMethod.Aspect_TOHM_COLOR
Aspect_TOHM_BOUNDBOX = Aspect_TypeOfHighlightMethod.Aspect_TOHM_BOUNDBOX

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

class Aspect_TypeOfStyleText(IntEnum):
	Aspect_TOST_NORMAL = 0
	Aspect_TOST_ANNOTATION = 1
Aspect_TOST_NORMAL = Aspect_TypeOfStyleText.Aspect_TOST_NORMAL
Aspect_TOST_ANNOTATION = Aspect_TypeOfStyleText.Aspect_TOST_ANNOTATION

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
	Aspect_VKey_ViewTop = 106
	Aspect_VKey_ViewBottom = 107
	Aspect_VKey_ViewLeft = 108
	Aspect_VKey_ViewRight = 109
	Aspect_VKey_ViewFront = 110
	Aspect_VKey_ViewBack = 111
	Aspect_VKey_ViewAxoLeftProj = 112
	Aspect_VKey_ViewAxoRightProj = 113
	Aspect_VKey_ViewFitAll = 114
	Aspect_VKey_ViewRoll90CW = 115
	Aspect_VKey_ViewRoll90CCW = 116
	Aspect_VKey_ViewSwitchRotate = 117
	Aspect_VKey_Shift = 118
	Aspect_VKey_Control = 119
	Aspect_VKey_Alt = 120
	Aspect_VKey_Menu = 121
	Aspect_VKey_Meta = 122
	Aspect_VKey_NavInteract = 123
	Aspect_VKey_NavForward = 124
	Aspect_VKey_NavBackward = 125
	Aspect_VKey_NavSlideLeft = 126
	Aspect_VKey_NavSlideRight = 127
	Aspect_VKey_NavSlideUp = 128
	Aspect_VKey_NavSlideDown = 129
	Aspect_VKey_NavRollCCW = 130
	Aspect_VKey_NavRollCW = 131
	Aspect_VKey_NavLookLeft = 132
	Aspect_VKey_NavLookRight = 133
	Aspect_VKey_NavLookUp = 134
	Aspect_VKey_NavLookDown = 135
	Aspect_VKey_NavCrouch = 136
	Aspect_VKey_NavJump = 137
	Aspect_VKey_NavThrustForward = 138
	Aspect_VKey_NavThrustBackward = 139
	Aspect_VKey_NavThrustStop = 140
	Aspect_VKey_NavSpeedIncrease = 141
	Aspect_VKey_NavSpeedDecrease = 142
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
Aspect_VKey_ViewTop = Aspect_VKeyBasic.Aspect_VKey_ViewTop
Aspect_VKey_ViewBottom = Aspect_VKeyBasic.Aspect_VKey_ViewBottom
Aspect_VKey_ViewLeft = Aspect_VKeyBasic.Aspect_VKey_ViewLeft
Aspect_VKey_ViewRight = Aspect_VKeyBasic.Aspect_VKey_ViewRight
Aspect_VKey_ViewFront = Aspect_VKeyBasic.Aspect_VKey_ViewFront
Aspect_VKey_ViewBack = Aspect_VKeyBasic.Aspect_VKey_ViewBack
Aspect_VKey_ViewAxoLeftProj = Aspect_VKeyBasic.Aspect_VKey_ViewAxoLeftProj
Aspect_VKey_ViewAxoRightProj = Aspect_VKeyBasic.Aspect_VKey_ViewAxoRightProj
Aspect_VKey_ViewFitAll = Aspect_VKeyBasic.Aspect_VKey_ViewFitAll
Aspect_VKey_ViewRoll90CW = Aspect_VKeyBasic.Aspect_VKey_ViewRoll90CW
Aspect_VKey_ViewRoll90CCW = Aspect_VKeyBasic.Aspect_VKey_ViewRoll90CCW
Aspect_VKey_ViewSwitchRotate = Aspect_VKeyBasic.Aspect_VKey_ViewSwitchRotate
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

class Aspect_XAtom(IntEnum):
	Aspect_XA_DELETE_WINDOW = 0
Aspect_XA_DELETE_WINDOW = Aspect_XAtom.Aspect_XA_DELETE_WINDOW

class Aspect_XRActionType(IntEnum):
	Aspect_XRActionType_InputDigital = 0
	Aspect_XRActionType_InputAnalog = 1
	Aspect_XRActionType_InputPose = 2
	Aspect_XRActionType_InputSkeletal = 3
	Aspect_XRActionType_OutputHaptic = 4
Aspect_XRActionType_InputDigital = Aspect_XRActionType.Aspect_XRActionType_InputDigital
Aspect_XRActionType_InputAnalog = Aspect_XRActionType.Aspect_XRActionType_InputAnalog
Aspect_XRActionType_InputPose = Aspect_XRActionType.Aspect_XRActionType_InputPose
Aspect_XRActionType_InputSkeletal = Aspect_XRActionType.Aspect_XRActionType_InputSkeletal
Aspect_XRActionType_OutputHaptic = Aspect_XRActionType.Aspect_XRActionType_OutputHaptic

class Aspect_XRGenericAction(IntEnum):
	Aspect_XRGenericAction_IsHeadsetOn = 0
	Aspect_XRGenericAction_InputAppMenu = 1
	Aspect_XRGenericAction_InputSysMenu = 2
	Aspect_XRGenericAction_InputTriggerPull = 3
	Aspect_XRGenericAction_InputTriggerClick = 4
	Aspect_XRGenericAction_InputGripClick = 5
	Aspect_XRGenericAction_InputTrackPadPosition = 6
	Aspect_XRGenericAction_InputTrackPadTouch = 7
	Aspect_XRGenericAction_InputTrackPadClick = 8
	Aspect_XRGenericAction_InputThumbstickPosition = 9
	Aspect_XRGenericAction_InputThumbstickTouch = 10
	Aspect_XRGenericAction_InputThumbstickClick = 11
	Aspect_XRGenericAction_InputPoseBase = 12
	Aspect_XRGenericAction_InputPoseFront = 13
	Aspect_XRGenericAction_InputPoseHandGrip = 14
	Aspect_XRGenericAction_InputPoseFingerTip = 15
	Aspect_XRGenericAction_OutputHaptic = 16
Aspect_XRGenericAction_IsHeadsetOn = Aspect_XRGenericAction.Aspect_XRGenericAction_IsHeadsetOn
Aspect_XRGenericAction_InputAppMenu = Aspect_XRGenericAction.Aspect_XRGenericAction_InputAppMenu
Aspect_XRGenericAction_InputSysMenu = Aspect_XRGenericAction.Aspect_XRGenericAction_InputSysMenu
Aspect_XRGenericAction_InputTriggerPull = Aspect_XRGenericAction.Aspect_XRGenericAction_InputTriggerPull
Aspect_XRGenericAction_InputTriggerClick = Aspect_XRGenericAction.Aspect_XRGenericAction_InputTriggerClick
Aspect_XRGenericAction_InputGripClick = Aspect_XRGenericAction.Aspect_XRGenericAction_InputGripClick
Aspect_XRGenericAction_InputTrackPadPosition = Aspect_XRGenericAction.Aspect_XRGenericAction_InputTrackPadPosition
Aspect_XRGenericAction_InputTrackPadTouch = Aspect_XRGenericAction.Aspect_XRGenericAction_InputTrackPadTouch
Aspect_XRGenericAction_InputTrackPadClick = Aspect_XRGenericAction.Aspect_XRGenericAction_InputTrackPadClick
Aspect_XRGenericAction_InputThumbstickPosition = Aspect_XRGenericAction.Aspect_XRGenericAction_InputThumbstickPosition
Aspect_XRGenericAction_InputThumbstickTouch = Aspect_XRGenericAction.Aspect_XRGenericAction_InputThumbstickTouch
Aspect_XRGenericAction_InputThumbstickClick = Aspect_XRGenericAction.Aspect_XRGenericAction_InputThumbstickClick
Aspect_XRGenericAction_InputPoseBase = Aspect_XRGenericAction.Aspect_XRGenericAction_InputPoseBase
Aspect_XRGenericAction_InputPoseFront = Aspect_XRGenericAction.Aspect_XRGenericAction_InputPoseFront
Aspect_XRGenericAction_InputPoseHandGrip = Aspect_XRGenericAction.Aspect_XRGenericAction_InputPoseHandGrip
Aspect_XRGenericAction_InputPoseFingerTip = Aspect_XRGenericAction.Aspect_XRGenericAction_InputPoseFingerTip
Aspect_XRGenericAction_OutputHaptic = Aspect_XRGenericAction.Aspect_XRGenericAction_OutputHaptic

class Aspect_XRTrackedDeviceRole(IntEnum):
	Aspect_XRTrackedDeviceRole_Head = 0
	Aspect_XRTrackedDeviceRole_LeftHand = 1
	Aspect_XRTrackedDeviceRole_RightHand = 2
	Aspect_XRTrackedDeviceRole_Other = 3
Aspect_XRTrackedDeviceRole_Head = Aspect_XRTrackedDeviceRole.Aspect_XRTrackedDeviceRole_Head
Aspect_XRTrackedDeviceRole_LeftHand = Aspect_XRTrackedDeviceRole.Aspect_XRTrackedDeviceRole_LeftHand
Aspect_XRTrackedDeviceRole_RightHand = Aspect_XRTrackedDeviceRole.Aspect_XRTrackedDeviceRole_RightHand
Aspect_XRTrackedDeviceRole_Other = Aspect_XRTrackedDeviceRole.Aspect_XRTrackedDeviceRole_Other
};
/* end python proxy for enums */

/* handles */
%wrap_handle(Aspect_DisplayConnection)
%wrap_handle(Aspect_Grid)
%wrap_handle(Aspect_VKeySet)
%wrap_handle(Aspect_Window)
%wrap_handle(Aspect_XRAction)
%wrap_handle(Aspect_XRActionSet)
%wrap_handle(Aspect_XRSession)
%wrap_handle(Aspect_OpenVRSession)
/* end handles declaration */

/* templates */
%template(Aspect_SequenceOfColor) NCollection_Sequence<Quantity_Color>;

%extend NCollection_Sequence<Quantity_Color> {
    // occt-800: NCollection_BaseSequence methods are not wrapped through
    // SWIG (its inner SeqNode has private new/delete). Re-export them per
    // instantiation so Python code can call .Size(), .Length(), .IsEmpty()
    // and use len() on every NCollection_Sequence<...>.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%ignore NCollection_IndexedDataMap<size_t,Aspect_Touch>::Items;
%ignore NCollection_IndexedDataMap<size_t,Aspect_Touch>::KeyValues;
%ignore NCollection_IndexedDataMap<size_t,Aspect_Touch>::IndexedItems;
%ignore NCollection_IndexedDataMap<size_t,Aspect_Touch>::Contained;
%template(Aspect_TouchMap) NCollection_IndexedDataMap<size_t,Aspect_Touch>;
/* end templates declaration */

/* typedefs */
typedef unsigned long Aspect_Drawable;
typedef GLXFBConfig Aspect_FBConfig;
typedef unsigned long Aspect_Handle;
typedef NCollection_Sequence<Quantity_Color> Aspect_SequenceOfColor;
typedef NCollection_IndexedDataMap<size_t, Aspect_Touch> Aspect_TouchMap;
typedef unsigned int Aspect_VKey;
typedef unsigned int Aspect_VKeyFlags;
typedef unsigned int Aspect_VKeyMouse;
/* end typedefs declaration */

/**************************
* class Aspect_Background *
**************************/
class Aspect_Background {
	public:
		/****** Aspect_Background::Aspect_Background ******/
		/****** md5 signature: c285d3f164d7d45415123925b55dfa2d ******/
		%feature("compactdefaultargs") Aspect_Background;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a window background. Default color: NOC_MATRAGRAY.
") Aspect_Background;
		 Aspect_Background();

		/****** Aspect_Background::Aspect_Background ******/
		/****** md5 signature: 5dbd53dd21ee3414ceec63d3dadf45f2 ******/
		%feature("compactdefaultargs") Aspect_Background;
		%feature("autodoc", "
Parameters
----------
AColor: Quantity_Color

Return
-------
None

Description
-----------
Creates a window background with the colour <AColor>.
") Aspect_Background;
		 Aspect_Background(const Quantity_Color & AColor);

		/****** Aspect_Background::Color ******/
		/****** md5 signature: b37a2e584a895a08fcf8ead60940b246 ******/
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "Return
-------
Quantity_Color

Description
-----------
Returns the colour of the window background <self>.
") Color;
		Quantity_Color Color();


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
		/****** Aspect_Background::SetColor ******/
		/****** md5 signature: 5aebf70a123538e7dff670112c56db0d ******/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "
Parameters
----------
AColor: Quantity_Color

Return
-------
None

Description
-----------
Modifies the colour of the window background <self>.
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
		/****** Aspect_DisplayConnection::GetDefaultFBConfig ******/
		/****** md5 signature: 622b64beb2b73c32aace98cc90ab7793 ******/
		%feature("compactdefaultargs") GetDefaultFBConfig;
		%feature("autodoc", "Return
-------
Aspect_FBConfig

Description
-----------
Return: native Window FB config (GLXFBConfig on Xlib).
") GetDefaultFBConfig;
		Aspect_FBConfig GetDefaultFBConfig();

		/****** Aspect_DisplayConnection::GetDefaultVisualInfo ******/
		/****** md5 signature: dde27c64c5cbb24e80531c18197370c1 ******/
		%feature("compactdefaultargs") GetDefaultVisualInfo;
		%feature("autodoc", "Return
-------
Aspect_XVisualInfo *

Description
-----------
Return default window visual or NULL when undefined.
") GetDefaultVisualInfo;
		Aspect_XVisualInfo * GetDefaultVisualInfo();

		/****** Aspect_DisplayConnection::GetDisplayAspect ******/
		/****** md5 signature: b7c859e60cde1d6a2d363b0c0841abb9 ******/
		%feature("compactdefaultargs") GetDisplayAspect;
		%feature("autodoc", "Return
-------
Aspect_XDisplay *

Description
-----------
Return: pointer to Display structure that serves as the connection to the X server.
") GetDisplayAspect;
		Aspect_XDisplay * GetDisplayAspect();

};


%make_alias(Aspect_DisplayConnection)

%extend Aspect_DisplayConnection {
	%pythoncode {
	__repr__ = _dumps_object

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

	@methodnotwrapped
	def GetAtomX(self):
		pass

	@methodnotwrapped
	def GetDefaultVisualInfoX(self):
		pass

	@methodnotwrapped
	def SetDefaultVisualInfo(self):
		pass
	}
};

/***************************
* class Aspect_FrustumLRBT *
***************************/
/*********************
* class Aspect_GenId *
*********************/
class Aspect_GenId {
	public:
		/****** Aspect_GenId::Aspect_GenId ******/
		/****** md5 signature: 569c368c12c13ee3f3906663aa53662b ******/
		%feature("compactdefaultargs") Aspect_GenId;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an available set of identifiers with the lower bound 0 and the upper bound INT_MAX / 2.
") Aspect_GenId;
		 Aspect_GenId();

		/****** Aspect_GenId::Aspect_GenId ******/
		/****** md5 signature: 0f6b6e30c77061695820b2c615f60259 ******/
		%feature("compactdefaultargs") Aspect_GenId;
		%feature("autodoc", "
Parameters
----------
theLow: int
theUpper: int

Return
-------
None

Description
-----------
Creates an available set of identifiers with specified range. Raises IdentDefinitionError if theUpper is less than theLow.
") Aspect_GenId;
		 Aspect_GenId(const int theLow, const int theUpper);

		/****** Aspect_GenId::Available ******/
		/****** md5 signature: f24f006c129a3ec8d053b2b9b29ea2ff ******/
		%feature("compactdefaultargs") Available;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of available identifiers.
") Available;
		int Available();


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
		/****** Aspect_GenId::Free ******/
		/****** md5 signature: adf04b00a0d9dc585c1f31bcdbc395bf ******/
		%feature("compactdefaultargs") Free;
		%feature("autodoc", "Return
-------
None

Description
-----------
Free all identifiers - make the whole range available again.
") Free;
		void Free();

		/****** Aspect_GenId::Free ******/
		/****** md5 signature: 287d435e5f6df20f5d05bc500f46a1d8 ******/
		%feature("compactdefaultargs") Free;
		%feature("autodoc", "
Parameters
----------
theId: int

Return
-------
None

Description
-----------
Free specified identifier. Warning - method has no protection against double-freeing!.
") Free;
		void Free(const int theId);

		/****** Aspect_GenId::HasFree ******/
		/****** md5 signature: a368ff3709ed20cf8d4c77575f722f06 ******/
		%feature("compactdefaultargs") HasFree;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if there are available identifiers in range.
") HasFree;
		bool HasFree();

		/****** Aspect_GenId::Lower ******/
		/****** md5 signature: e7b7bea2ce08b27d2e1e90686c8e2356 ******/
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the lower identifier in range.
") Lower;
		int Lower();

		/****** Aspect_GenId::Next ******/
		/****** md5 signature: d28a2ab4527746fd6cfd3f25cf39bb91 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the next available identifier. Warning: Raises IdentDefinitionError if all identifiers are busy.
") Next;
		int Next();

		/****** Aspect_GenId::Next ******/
		/****** md5 signature: e8d5bdc85b64cd2108613f9408f84da2 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "
Parameters
----------

Return
-------
theId: int

Description
-----------
Generates the next available identifier. @param[out] theId generated identifier 
Return: False if all identifiers are busy.
") Next;
		bool Next(Standard_Integer &OutValue);

		/****** Aspect_GenId::Upper ******/
		/****** md5 signature: ddcdb4664c4dc21d38622f88e622db4f ******/
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the upper identifier in range.
") Upper;
		int Upper();

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
		/****** Aspect_Grid::Activate ******/
		/****** md5 signature: 3c1c2136e4be5cb74d5a6a6df9f2730e ******/
		%feature("compactdefaultargs") Activate;
		%feature("autodoc", "Return
-------
None

Description
-----------
activates the grid. The Hit method will return gridx and gridx computed according to the steps of the grid.
") Activate;
		void Activate();

		/****** Aspect_Grid::Colors ******/
		/****** md5 signature: febac332dabf87330fc8ae564a90811c ******/
		%feature("compactdefaultargs") Colors;
		%feature("autodoc", "
Parameters
----------
aColor: Quantity_Color
aTenthColor: Quantity_Color

Return
-------
None

Description
-----------
Returns the colors of the grid.
") Colors;
		void Colors(Quantity_Color & aColor, Quantity_Color & aTenthColor);

		/****** Aspect_Grid::Compute ******/
		/****** md5 signature: 5d56f3386e9eda6cae6d3e7496781e0b ******/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "
Parameters
----------
X: double
Y: double

Return
-------
gridX: double
gridY: double

Description
-----------
returns the point of the grid the closest to the point X,Y.
") Compute;
		virtual void Compute(const double X, const double Y, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Aspect_Grid::Deactivate ******/
		/****** md5 signature: d5b1d14a550597a64031c7a7feceee08 ******/
		%feature("compactdefaultargs") Deactivate;
		%feature("autodoc", "Return
-------
None

Description
-----------
deactivates the grid. The hit method will return gridx and gridx as the enter value X & Y.
") Deactivate;
		void Deactivate();

		/****** Aspect_Grid::Display ******/
		/****** md5 signature: a5bb9d443eb910f59769ed67aea52525 ******/
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "Return
-------
None

Description
-----------
Display the grid at screen.
") Display;
		virtual void Display();

		/****** Aspect_Grid::DrawMode ******/
		/****** md5 signature: 820acf5cdbd9b081ca2fdb9e8fa43978 ******/
		%feature("compactdefaultargs") DrawMode;
		%feature("autodoc", "Return
-------
Aspect_GridDrawMode

Description
-----------
Returns the grid aspect.
") DrawMode;
		Aspect_GridDrawMode DrawMode();


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
		/****** Aspect_Grid::Erase ******/
		/****** md5 signature: c55517fe39ff6c9fe42803167b097498 ******/
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "Return
-------
None

Description
-----------
Erase the grid from screen.
") Erase;
		virtual void Erase();

		/****** Aspect_Grid::Hit ******/
		/****** md5 signature: effe2c425ab0c8a5a45a808da0dd5130 ******/
		%feature("compactdefaultargs") Hit;
		%feature("autodoc", "
Parameters
----------
X: double
Y: double

Return
-------
gridX: double
gridY: double

Description
-----------
returns the point of the grid the closest to the point X,Y if the grid is active. If the grid is not active returns X,Y.
") Hit;
		void Hit(const double X, const double Y, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Aspect_Grid::Init ******/
		/****** md5 signature: ae70d610df2081e50f19659c49fb9bd4 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Init;
		virtual void Init();

		/****** Aspect_Grid::IsActive ******/
		/****** md5 signature: 38d9417d8eeb1eba9378636ce5975fa8 ******/
		%feature("compactdefaultargs") IsActive;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True when the grid is active.
") IsActive;
		bool IsActive();

		/****** Aspect_Grid::IsDisplayed ******/
		/****** md5 signature: 569b9c8fdbde9310858ef4d31815dbac ******/
		%feature("compactdefaultargs") IsDisplayed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True when the grid is displayed at screen.
") IsDisplayed;
		virtual bool IsDisplayed();

		/****** Aspect_Grid::Rotate ******/
		/****** md5 signature: 696fd465f5417428d0214f54e5837d5b ******/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "
Parameters
----------
anAngle: double

Return
-------
None

Description
-----------
Rotate the grid from a relative angle.
") Rotate;
		void Rotate(const double anAngle);

		/****** Aspect_Grid::RotationAngle ******/
		/****** md5 signature: 80fa368144f50917103cb1d533b95fc8 ******/
		%feature("compactdefaultargs") RotationAngle;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the x Angle of the grid.
") RotationAngle;
		double RotationAngle();

		/****** Aspect_Grid::SetColors ******/
		/****** md5 signature: f81cf1490ceea17485c0de0269e7ec9c ******/
		%feature("compactdefaultargs") SetColors;
		%feature("autodoc", "
Parameters
----------
aColor: Quantity_Color
aTenthColor: Quantity_Color

Return
-------
None

Description
-----------
Change the colors of the grid.
") SetColors;
		virtual void SetColors(const Quantity_Color & aColor, const Quantity_Color & aTenthColor);

		/****** Aspect_Grid::SetDrawMode ******/
		/****** md5 signature: ee6037d77208349cb9a8e316a9952fc6 ******/
		%feature("compactdefaultargs") SetDrawMode;
		%feature("autodoc", "
Parameters
----------
aDrawMode: Aspect_GridDrawMode

Return
-------
None

Description
-----------
Change the grid aspect.
") SetDrawMode;
		void SetDrawMode(const Aspect_GridDrawMode aDrawMode);

		/****** Aspect_Grid::SetRotationAngle ******/
		/****** md5 signature: 4f80611c827c95af0a6f252a07266b22 ******/
		%feature("compactdefaultargs") SetRotationAngle;
		%feature("autodoc", "
Parameters
----------
anAngle: double

Return
-------
None

Description
-----------
defines the orientation of the grid.
") SetRotationAngle;
		void SetRotationAngle(const double anAngle);

		/****** Aspect_Grid::SetXOrigin ******/
		/****** md5 signature: e90df18e5d609fbfc506956b9c155f91 ******/
		%feature("compactdefaultargs") SetXOrigin;
		%feature("autodoc", "
Parameters
----------
anOrigin: double

Return
-------
None

Description
-----------
defines the x Origin of the grid.
") SetXOrigin;
		void SetXOrigin(const double anOrigin);

		/****** Aspect_Grid::SetYOrigin ******/
		/****** md5 signature: c73d74f66f5eee63ada38a8bc9e5f0b6 ******/
		%feature("compactdefaultargs") SetYOrigin;
		%feature("autodoc", "
Parameters
----------
anOrigin: double

Return
-------
None

Description
-----------
defines the y Origin of the grid.
") SetYOrigin;
		void SetYOrigin(const double anOrigin);

		/****** Aspect_Grid::Translate ******/
		/****** md5 signature: 49e324164f744b23c493d676ca48d5b7 ******/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
aDx: double
aDy: double

Return
-------
None

Description
-----------
Translate the grid from a relative distance.
") Translate;
		void Translate(const double aDx, const double aDy);

		/****** Aspect_Grid::XOrigin ******/
		/****** md5 signature: 94ec73c0487ff7f26d9f4eaaad610caa ******/
		%feature("compactdefaultargs") XOrigin;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the x Origin of the grid.
") XOrigin;
		double XOrigin();

		/****** Aspect_Grid::YOrigin ******/
		/****** md5 signature: b597a854c6df7d9aecc9fcb187ecf9fc ******/
		%feature("compactdefaultargs") YOrigin;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the x Origin of the grid.
") YOrigin;
		double YOrigin();

};


%make_alias(Aspect_Grid)

%extend Aspect_Grid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class Aspect_GridParams *
**************************/
class Aspect_GridParams {
	public:
		/****** Aspect_GridParams::Aspect_GridParams ******/
		/****** md5 signature: fd48d8138a7c40c7a3304f985f9c7908 ******/
		%feature("compactdefaultargs") Aspect_GridParams;
		%feature("autodoc", "Return
-------
None

Description
-----------
Construct with sensible defaults: grey lines on the plane origin with axis coloring enabled, 1/100 plane-unit spacing, overlay mode, unbounded in extent and radius.
") Aspect_GridParams;
		 Aspect_GridParams();

		/****** Aspect_GridParams::AccentAngularScale ******/
		/****** md5 signature: 50491444376e6f200c160c4cfdfd6d30 ******/
		%feature("compactdefaultargs") AccentAngularScale;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return accent overlay angular scale for circular-grid spokes. Zero disables the angular accent layer.
") AccentAngularScale;
		double AccentAngularScale();

		/****** Aspect_GridParams::AccentColor ******/
		/****** md5 signature: a578ac25c0075154130387981f557625 ******/
		%feature("compactdefaultargs") AccentColor;
		%feature("autodoc", "Return
-------
Quantity_Color

Description
-----------
Return every-tenth-line / accent colour rendered by the shader.
") AccentColor;
		const Quantity_Color & AccentColor();

		/****** Aspect_GridParams::AccentScaleX ******/
		/****** md5 signature: 3a6722a14640d894e54e93737ff30b5a ******/
		%feature("compactdefaultargs") AccentScaleX;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return accent overlay scale along the plane X/radial direction. Zero disables the accent layer on that axis.
") AccentScaleX;
		double AccentScaleX();

		/****** Aspect_GridParams::AccentScaleY ******/
		/****** md5 signature: 2f51a71565854108c8ee93857c758a66 ******/
		%feature("compactdefaultargs") AccentScaleY;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return accent overlay scale along the plane Y direction. Zero disables the accent layer on that axis.
") AccentScaleY;
		double AccentScaleY();

		/****** Aspect_GridParams::AngleEnd ******/
		/****** md5 signature: a3c25a3cb1bfc70bfb950a15be6ceac3 ******/
		%feature("compactdefaultargs") AngleEnd;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return arc end angle (radians). Meaningful only when IsArc() is true.
") AngleEnd;
		double AngleEnd();

		/****** Aspect_GridParams::AngleStart ******/
		/****** md5 signature: bf552f3b94d480f6d2e62ea7c6c4733f ******/
		%feature("compactdefaultargs") AngleStart;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return arc start angle (radians). Meaningful only when IsArc() is true.
") AngleStart;
		double AngleStart();

		/****** Aspect_GridParams::AngularDivisions ******/
		/****** md5 signature: 155b3ac8be21103b641b42a1cd650c46 ******/
		%feature("compactdefaultargs") AngularDivisions;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return the angular subdivision count of the half-circle for circular grids. Zero means rectangular grid (default); any positive value switches the renderer to polar rings (Scale -> radial step) and spokes at pi/N rad.
") AngularDivisions;
		int AngularDivisions();

		/****** Aspect_GridParams::Color ******/
		/****** md5 signature: 7cec116411eb20e52d1fabf3015346da ******/
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "Return
-------
Quantity_Color

Description
-----------
Return grid line color.
") Color;
		const Quantity_Color & Color();

		/****** Aspect_GridParams::DrawMode ******/
		/****** md5 signature: 820acf5cdbd9b081ca2fdb9e8fa43978 ******/
		%feature("compactdefaultargs") DrawMode;
		%feature("autodoc", "Return
-------
Aspect_GridDrawMode

Description
-----------
Return draw mode: lines, points at grid intersections, or none.
") DrawMode;
		Aspect_GridDrawMode DrawMode();

		/****** Aspect_GridParams::EffectiveScaleY ******/
		/****** md5 signature: 834f54e43be70738e1e098ce436c7b28 ******/
		%feature("compactdefaultargs") EffectiveScaleY;
		%feature("autodoc", "Return
-------
double

Description
-----------
Effective Y-direction scale actually consumed by the renderer.
") EffectiveScaleY;
		double EffectiveScaleY();

		/****** Aspect_GridParams::IsArc ******/
		/****** md5 signature: ce9a0f58cf021c5abc6fcacdaf55e271 ******/
		%feature("compactdefaultargs") IsArc;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True when the circular grid is restricted to a sub-arc.
") IsArc;
		bool IsArc();

		/****** Aspect_GridParams::IsBackground ******/
		/****** md5 signature: f24f945cb4e4ca07e26f39c42641c5f0 ******/
		%feature("compactdefaultargs") IsBackground;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if grid is drawn as a view-space background (behind all geometry).
") IsBackground;
		bool IsBackground();

		/****** Aspect_GridParams::IsBounded ******/
		/****** md5 signature: fc08e1307b1552460c5a8f2d81d1a03c ******/
		%feature("compactdefaultargs") IsBounded;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True when the parameters describe a bounded rectangle or disc.
") IsBounded;
		bool IsBounded();

		/****** Aspect_GridParams::IsCircular ******/
		/****** md5 signature: 75a0876e5d27b7e3995ed1c1a2165b9f ******/
		%feature("compactdefaultargs") IsCircular;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True when the parameters describe a circular (polar) grid.
") IsCircular;
		bool IsCircular();

		/****** Aspect_GridParams::IsDrawAxis ******/
		/****** md5 signature: aa86a763d4a16ceea896bcc0c6adb80a ******/
		%feature("compactdefaultargs") IsDrawAxis;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if axis lines on the grid plane are drawn in red/green/blue.
") IsDrawAxis;
		bool IsDrawAxis();

		/****** Aspect_GridParams::IsViewAdaptive ******/
		/****** md5 signature: 972d041ecf62a011be0ea9973e2fc12b ******/
		%feature("compactdefaultargs") IsViewAdaptive;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if grid spacing and visible extents adapt to the camera view.
") IsViewAdaptive;
		bool IsViewAdaptive();

		/****** Aspect_GridParams::LineThickness ******/
		/****** md5 signature: 161d9bfcff2f0671f9613717a0132b88 ******/
		%feature("compactdefaultargs") LineThickness;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return line thickness in plane units (minimum pixel-space line width is derived from fwidth).
") LineThickness;
		double LineThickness();

		/****** Aspect_GridParams::Origin ******/
		/****** md5 signature: 6d77c7df792d3b308e4ef8436a8e2063 ******/
		%feature("compactdefaultargs") Origin;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Return local offset of the grid origin within the plane.
") Origin;
		const gp_Pnt Origin();

		/****** Aspect_GridParams::Radius ******/
		/****** md5 signature: 1f0279eb23f422b6f225b95988440743 ******/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return circular bounded radius; 0.0 means unbounded.
") Radius;
		double Radius();

		/****** Aspect_GridParams::RotationAngle ******/
		/****** md5 signature: 80fa368144f50917103cb1d533b95fc8 ******/
		%feature("compactdefaultargs") RotationAngle;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return in-plane rotation angle (radians) applied to the grid axes around the plane normal.
") RotationAngle;
		double RotationAngle();

		/****** Aspect_GridParams::Scale ******/
		/****** md5 signature: 0692a776bbe69c585f3d8d4b86bd225b ******/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return major-grid scale factor along the plane X direction (cells per plane unit).
") Scale;
		double Scale();

		/****** Aspect_GridParams::ScaleY ******/
		/****** md5 signature: 7bcadf7548cc3212f60a788db91a3cbe ******/
		%feature("compactdefaultargs") ScaleY;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return explicit Y-direction scale. When 0.0, renderer falls back to Scale() (isotropic).
") ScaleY;
		double ScaleY();

		/****** Aspect_GridParams::SetAccentAngularScale ******/
		/****** md5 signature: b950f9b3f3848d1929eeca5b44c9602f ******/
		%feature("compactdefaultargs") SetAccentAngularScale;
		%feature("autodoc", "
Parameters
----------
theScale: double

Return
-------
None

Description
-----------
Set accent overlay angular scale for circular-grid spokes.
") SetAccentAngularScale;
		void SetAccentAngularScale(const double theScale);

		/****** Aspect_GridParams::SetAccentColor ******/
		/****** md5 signature: 02a99a194a57fbf69d60e44e22bf26c3 ******/
		%feature("compactdefaultargs") SetAccentColor;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color

Return
-------
None

Description
-----------
Set every-tenth-line / accent colour rendered by the shader.
") SetAccentColor;
		void SetAccentColor(const Quantity_Color & theColor);

		/****** Aspect_GridParams::SetAccentScaleX ******/
		/****** md5 signature: 644bb6f0e19ec85676d061ba21e65b36 ******/
		%feature("compactdefaultargs") SetAccentScaleX;
		%feature("autodoc", "
Parameters
----------
theScale: double

Return
-------
None

Description
-----------
Set accent overlay scale along the plane X/radial direction.
") SetAccentScaleX;
		void SetAccentScaleX(const double theScale);

		/****** Aspect_GridParams::SetAccentScaleY ******/
		/****** md5 signature: ac7a5f20a6881515d0a8152fda8da0c7 ******/
		%feature("compactdefaultargs") SetAccentScaleY;
		%feature("autodoc", "
Parameters
----------
theScale: double

Return
-------
None

Description
-----------
Set accent overlay scale along the plane Y direction.
") SetAccentScaleY;
		void SetAccentScaleY(const double theScale);

		/****** Aspect_GridParams::SetAngularDivisions ******/
		/****** md5 signature: db6be7ca7ab11ce5a7cad633d71a60ba ******/
		%feature("compactdefaultargs") SetAngularDivisions;
		%feature("autodoc", "
Parameters
----------
theDivisions: int

Return
-------
None

Description
-----------
Set angular subdivision count (0 = rectangular grid, N>0 = circular with N spokes per 180 deg).
") SetAngularDivisions;
		void SetAngularDivisions(const int theDivisions);

		/****** Aspect_GridParams::SetArcRange ******/
		/****** md5 signature: 605f4aaee7a00e8ea6849004b7bbcbd2 ******/
		%feature("compactdefaultargs") SetArcRange;
		%feature("autodoc", "
Parameters
----------
theStart: double
theEnd: double

Return
-------
None

Description
-----------
Restrict the circular grid to an angular wedge [start, end], walking CCW. Equal start and end (e.g. 0.0 and 0.0) returns to full-circle rendering.
") SetArcRange;
		void SetArcRange(const double theStart, const double theEnd);

		/****** Aspect_GridParams::SetColor ******/
		/****** md5 signature: 289e78889c9a8b48d6cf1ce3b205415d ******/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color

Return
-------
None

Description
-----------
Set grid line color.
") SetColor;
		void SetColor(const Quantity_Color & theColor);

		/****** Aspect_GridParams::SetDrawMode ******/
		/****** md5 signature: f8a9fa40921d1904657daf0c0db6632e ******/
		%feature("compactdefaultargs") SetDrawMode;
		%feature("autodoc", "
Parameters
----------
theMode: Aspect_GridDrawMode

Return
-------
None

Description
-----------
Set draw mode. Aspect_GDM_None suppresses rendering entirely; Points draws dots at grid-line intersections, Lines (default) draws the full grid.
") SetDrawMode;
		void SetDrawMode(const Aspect_GridDrawMode theMode);

		/****** Aspect_GridParams::SetIsBackground ******/
		/****** md5 signature: c69459edf628b44fb72f8f03e582a939 ******/
		%feature("compactdefaultargs") SetIsBackground;
		%feature("autodoc", "
Parameters
----------
theIsBackground: bool

Return
-------
None

Description
-----------
Set background-mode rendering on/off.
") SetIsBackground;
		void SetIsBackground(const bool theIsBackground);

		/****** Aspect_GridParams::SetIsDrawAxis ******/
		/****** md5 signature: 932d138de50945e717f2d20d8e02f858 ******/
		%feature("compactdefaultargs") SetIsDrawAxis;
		%feature("autodoc", "
Parameters
----------
theIsDrawAxis: bool

Return
-------
None

Description
-----------
Set axis coloring on/off.
") SetIsDrawAxis;
		void SetIsDrawAxis(const bool theIsDrawAxis);

		/****** Aspect_GridParams::SetIsViewAdaptive ******/
		/****** md5 signature: 0eb0dda2940384b5d884e75c8e7ee293 ******/
		%feature("compactdefaultargs") SetIsViewAdaptive;
		%feature("autodoc", "
Parameters
----------
theIsViewAdaptive: bool

Return
-------
None

Description
-----------
Set view-adaptive grid on/off. When enabled, renderer derives temporary cell spacing and bounds from the current camera. The inverse of ScaleY() (or Scale() when ScaleY() is zero) is used as the target number of cells across the view height.
") SetIsViewAdaptive;
		void SetIsViewAdaptive(const bool theIsViewAdaptive);

		/****** Aspect_GridParams::SetLineThickness ******/
		/****** md5 signature: 8ee2158a06eaf3b547802463c5f9df98 ******/
		%feature("compactdefaultargs") SetLineThickness;
		%feature("autodoc", "
Parameters
----------
theThickness: double

Return
-------
None

Description
-----------
Set line thickness in plane units.
") SetLineThickness;
		void SetLineThickness(const double theThickness);

		/****** Aspect_GridParams::SetOrigin ******/
		/****** md5 signature: dc46429bcbc02c8c4be0a0ef82571e72 ******/
		%feature("compactdefaultargs") SetOrigin;
		%feature("autodoc", "
Parameters
----------
theOrigin: gp_Pnt

Return
-------
None

Description
-----------
Set local offset of the grid origin within the plane.
") SetOrigin;
		void SetOrigin(const gp_Pnt & theOrigin);

		/****** Aspect_GridParams::SetRadius ******/
		/****** md5 signature: 33acdaa90253f5b439514ff8a38f6451 ******/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "
Parameters
----------
theRadius: double

Return
-------
None

Description
-----------
Set circular bounded radius; 0.0 means unbounded.
") SetRadius;
		void SetRadius(const double theRadius);

		/****** Aspect_GridParams::SetRotationAngle ******/
		/****** md5 signature: c1098d805a3925dbd22f208a9a5d95d7 ******/
		%feature("compactdefaultargs") SetRotationAngle;
		%feature("autodoc", "
Parameters
----------
theAngle: double

Return
-------
None

Description
-----------
Set in-plane rotation angle (radians) applied to the grid axes around the plane normal.
") SetRotationAngle;
		void SetRotationAngle(const double theAngle);

		/****** Aspect_GridParams::SetScale ******/
		/****** md5 signature: f03e0b150cf827a9c371719a495ebff6 ******/
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "
Parameters
----------
theScale: double

Return
-------
None

Description
-----------
Set major-grid scale factor along the plane X direction (cells per plane unit). Must be non-negative; zero is a valid 'unused' sentinel.
") SetScale;
		void SetScale(const double theScale);

		/****** Aspect_GridParams::SetScaleY ******/
		/****** md5 signature: aea51cdeadf1deaa14e0c0796c3b9a07 ******/
		%feature("compactdefaultargs") SetScaleY;
		%feature("autodoc", "
Parameters
----------
theScaleY: double

Return
-------
None

Description
-----------
Set explicit Y-direction scale. Pass 0.0 to mirror Scale() (isotropic, default).
") SetScaleY;
		void SetScaleY(const double theScaleY);

		/****** Aspect_GridParams::SetSizeX ******/
		/****** md5 signature: 8052170087d62c478cde6edc8a84e266 ******/
		%feature("compactdefaultargs") SetSizeX;
		%feature("autodoc", "
Parameters
----------
theSize: double

Return
-------
None

Description
-----------
Set rectangular bounded extent along plane X; 0.0 means unbounded.
") SetSizeX;
		void SetSizeX(const double theSize);

		/****** Aspect_GridParams::SetSizeY ******/
		/****** md5 signature: c89b22c5c95bf41e45cc98fe26db0b9a ******/
		%feature("compactdefaultargs") SetSizeY;
		%feature("autodoc", "
Parameters
----------
theSize: double

Return
-------
None

Description
-----------
Set rectangular bounded extent along plane Y; 0.0 means unbounded.
") SetSizeY;
		void SetSizeY(const double theSize);

		/****** Aspect_GridParams::SetZOffset ******/
		/****** md5 signature: a61962d116fd8100e8eaaaff952a9ad7 ******/
		%feature("compactdefaultargs") SetZOffset;
		%feature("autodoc", "
Parameters
----------
theOffset: double

Return
-------
None

Description
-----------
Set signed plane-normal offset applied at render time (display only; snap math stays on the unshifted plane).
") SetZOffset;
		void SetZOffset(const double theOffset);

		/****** Aspect_GridParams::SizeX ******/
		/****** md5 signature: 27feca19632082efd993c4086128bd36 ******/
		%feature("compactdefaultargs") SizeX;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return rectangular bounded extent along plane X; 0.0 means unbounded.
") SizeX;
		double SizeX();

		/****** Aspect_GridParams::SizeY ******/
		/****** md5 signature: 7df7cb9b2b94a46f50006623b67d5411 ******/
		%feature("compactdefaultargs") SizeY;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return rectangular bounded extent along plane Y; 0.0 means unbounded.
") SizeY;
		double SizeY();

		/****** Aspect_GridParams::ZOffset ******/
		/****** md5 signature: dcbf4e9515a24714a61e3b7852c6c1a1 ******/
		%feature("compactdefaultargs") ZOffset;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return signed plane-normal offset applied at render time.
") ZOffset;
		double ZOffset();

};


%extend Aspect_GridParams {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class Aspect_ScrollDelta *
***************************/
class Aspect_ScrollDelta {
	public:
		/****** Aspect_ScrollDelta::Aspect_ScrollDelta ******/
		/****** md5 signature: 0d3fcbaf34563dcd0f20bf50c1b22bc1 ******/
		%feature("compactdefaultargs") Aspect_ScrollDelta;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") Aspect_ScrollDelta;
		 Aspect_ScrollDelta();

		/****** Aspect_ScrollDelta::Aspect_ScrollDelta ******/
		/****** md5 signature: 06d651bae40225ad1c474c77a2a91d00 ******/
		%feature("compactdefaultargs") Aspect_ScrollDelta;
		%feature("autodoc", "
Parameters
----------
thePnt: NCollection_Vec2<int>
theValue: double
theFlags: Aspect_VKeyFlags (optional, default to Aspect_VKeyFlags_NONE)

Return
-------
None

Description
-----------
Constructor.
") Aspect_ScrollDelta;
		 Aspect_ScrollDelta(const NCollection_Vec2<int> & thePnt, double theValue, Aspect_VKeyFlags theFlags = Aspect_VKeyFlags_NONE);

		/****** Aspect_ScrollDelta::Aspect_ScrollDelta ******/
		/****** md5 signature: 1e72cb79c1461578a224cb79ff394912 ******/
		%feature("compactdefaultargs") Aspect_ScrollDelta;
		%feature("autodoc", "
Parameters
----------
theValue: double
theFlags: Aspect_VKeyFlags (optional, default to Aspect_VKeyFlags_NONE)

Return
-------
None

Description
-----------
Constructor with undefined point.
") Aspect_ScrollDelta;
		 Aspect_ScrollDelta(double theValue, Aspect_VKeyFlags theFlags = Aspect_VKeyFlags_NONE);

		/****** Aspect_ScrollDelta::HasPoint ******/
		/****** md5 signature: 314e70d3c9f0b28261d75c0c6244be38 ******/
		%feature("compactdefaultargs") HasPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true if action has point defined.
") HasPoint;
		bool HasPoint();

		/****** Aspect_ScrollDelta::ResetPoint ******/
		/****** md5 signature: d4f07a32710ac608e876db8058caee64 ******/
		%feature("compactdefaultargs") ResetPoint;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reset at point.
") ResetPoint;
		void ResetPoint();

};


%extend Aspect_ScrollDelta {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class Aspect_SkydomeBackground *
*********************************/
class Aspect_SkydomeBackground {
	public:
		/****** Aspect_SkydomeBackground::Aspect_SkydomeBackground ******/
		/****** md5 signature: 3c25f69c902a4ad07c515cd932d3d294 ******/
		%feature("compactdefaultargs") Aspect_SkydomeBackground;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a window skydome background. By default skydome is initialized with sun at its zenith (0.0, 1.0, 0.0), average clody (0.2), zero time parameter, zero fogginess, 512x512 texture size.
") Aspect_SkydomeBackground;
		 Aspect_SkydomeBackground();

		/****** Aspect_SkydomeBackground::Aspect_SkydomeBackground ******/
		/****** md5 signature: b723eec0278f7f94d767ee6fa17f6a80 ******/
		%feature("compactdefaultargs") Aspect_SkydomeBackground;
		%feature("autodoc", "
Parameters
----------
theSunDirection: gp_Dir
theCloudiness: float
theTime: float
theFogginess: float
theSize: int

Return
-------
None

Description
-----------
Creates a window skydome background with given parameters. 
Input parameter: theSunDirection direction to the sun (moon). Sun direction with negative Y component  represents moon with (-X, -Y, -Z) direction. 
Input parameter: theCloudiness cloud intensity, 0.0 means no clouds at all and 1.0 - high clody. 
Input parameter: theTime time parameter of simulation. Might be tweaked to slightly change appearance. 
Input parameter: theFogginess fog intensity, 0.0 means no fog and 1.0 - high fogginess 
Input parameter: theSize size of cubemap side in pixels.
") Aspect_SkydomeBackground;
		 Aspect_SkydomeBackground(const gp_Dir & theSunDirection, float theCloudiness, float theTime, float theFogginess, int theSize);

		/****** Aspect_SkydomeBackground::Cloudiness ******/
		/****** md5 signature: b774dea70506b7657e7a38be932a66c4 ******/
		%feature("compactdefaultargs") Cloudiness;
		%feature("autodoc", "Return
-------
float

Description
-----------
Get cloud intensity. By default this value is 0.2 0.0 means no clouds at all and 1.0 - high clody.
") Cloudiness;
		float Cloudiness();


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
		/****** Aspect_SkydomeBackground::Fogginess ******/
		/****** md5 signature: 9b3308d449a3a446b817473e974c1c7e ******/
		%feature("compactdefaultargs") Fogginess;
		%feature("autodoc", "Return
-------
float

Description
-----------
Get fog intensity. By default this value is 0.0 0.0 means no fog and 1.0 - high fogginess.
") Fogginess;
		float Fogginess();

		/****** Aspect_SkydomeBackground::SetCloudiness ******/
		/****** md5 signature: ae7251603aad7a0159f0c8b2b954ebd8 ******/
		%feature("compactdefaultargs") SetCloudiness;
		%feature("autodoc", "
Parameters
----------
theCloudiness: float

Return
-------
None

Description
-----------
Set cloud intensity. By default this value is 0.2 0.0 means no clouds at all and 1.0 - high clody.
") SetCloudiness;
		void SetCloudiness(float theCloudiness);

		/****** Aspect_SkydomeBackground::SetFogginess ******/
		/****** md5 signature: c70385fc73a46859ec9d207c2fe5aeb8 ******/
		%feature("compactdefaultargs") SetFogginess;
		%feature("autodoc", "
Parameters
----------
theFogginess: float

Return
-------
None

Description
-----------
Set fog intensity. By default this value is 0.0 0.0 means no fog and 1.0 - high fogginess.
") SetFogginess;
		void SetFogginess(float theFogginess);

		/****** Aspect_SkydomeBackground::SetSize ******/
		/****** md5 signature: 8875c8fdae0755e3a28f0b4b7c2a4f1b ******/
		%feature("compactdefaultargs") SetSize;
		%feature("autodoc", "
Parameters
----------
theSize: int

Return
-------
None

Description
-----------
Set size of cubemap. By default this value is 512.
") SetSize;
		void SetSize(int theSize);

		/****** Aspect_SkydomeBackground::SetSunDirection ******/
		/****** md5 signature: d85bbe95c7e3d45dd1408af0a7346203 ******/
		%feature("compactdefaultargs") SetSunDirection;
		%feature("autodoc", "
Parameters
----------
theSunDirection: gp_Dir

Return
-------
None

Description
-----------
Set sun direction. By default this value is (0, 1, 0) Sun direction with negative Y component represents moon with (-X, -Y, -Z) direction.
") SetSunDirection;
		void SetSunDirection(const gp_Dir & theSunDirection);

		/****** Aspect_SkydomeBackground::SetTimeParameter ******/
		/****** md5 signature: ae41e3539f565b23338d58d705600956 ******/
		%feature("compactdefaultargs") SetTimeParameter;
		%feature("autodoc", "
Parameters
----------
theTime: float

Return
-------
None

Description
-----------
Set time of cloud simulation. By default this value is 0.0 This value might be tweaked to slightly change appearance of clouds.
") SetTimeParameter;
		void SetTimeParameter(float theTime);

		/****** Aspect_SkydomeBackground::Size ******/
		/****** md5 signature: 95fd550d1712c017c7cad2fbb2186e09 ******/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "Return
-------
int

Description
-----------
Get size of cubemap. By default this value is 512.
") Size;
		int Size();

		/****** Aspect_SkydomeBackground::SunDirection ******/
		/****** md5 signature: 468ebca31659264b29a8630921783c51 ******/
		%feature("compactdefaultargs") SunDirection;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
Get sun direction. By default this value is (0, 1, 0) Sun direction with negative Y component represents moon with (-X, -Y, -Z) direction.
") SunDirection;
		const gp_Dir SunDirection();

		/****** Aspect_SkydomeBackground::TimeParameter ******/
		/****** md5 signature: 14ac0520d93dc8c85d9e5f3f86ed965f ******/
		%feature("compactdefaultargs") TimeParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Get time of cloud simulation. By default this value is 0.0 This value might be tweaked to slightly change appearance of clouds.
") TimeParameter;
		float TimeParameter();

};


%extend Aspect_SkydomeBackground {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class Aspect_Touch *
*********************/
class Aspect_Touch {
	public:
		/****** Aspect_Touch::Aspect_Touch ******/
		/****** md5 signature: a51d1277d944673675b62a1916b1d065 ******/
		%feature("compactdefaultargs") Aspect_Touch;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") Aspect_Touch;
		 Aspect_Touch();

		/****** Aspect_Touch::Aspect_Touch ******/
		/****** md5 signature: 93d4d7b1c5f7ea3846768849e01de580 ******/
		%feature("compactdefaultargs") Aspect_Touch;
		%feature("autodoc", "
Parameters
----------
thePnt: NCollection_Vec2<double>
theIsPreciseDevice: bool

Return
-------
None

Description
-----------
Constructor with initialization.
") Aspect_Touch;
		 Aspect_Touch(const NCollection_Vec2<double> & thePnt, bool theIsPreciseDevice);

		/****** Aspect_Touch::Aspect_Touch ******/
		/****** md5 signature: dd64672ae32bf26866b63fa6a50db179 ******/
		%feature("compactdefaultargs") Aspect_Touch;
		%feature("autodoc", "
Parameters
----------
theX: double
theY: double
theIsPreciseDevice: bool

Return
-------
None

Description
-----------
Constructor with initialization.
") Aspect_Touch;
		 Aspect_Touch(double theX, double theY, bool theIsPreciseDevice);

		/****** Aspect_Touch::Delta ******/
		/****** md5 signature: 4b593d7c1a5f11bcf863247907d6eea1 ******/
		%feature("compactdefaultargs") Delta;
		%feature("autodoc", "Return
-------
NCollection_Vec2<double >

Description
-----------
Return values delta.
") Delta;
		NCollection_Vec2<double > Delta();

};


%extend Aspect_Touch {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class Aspect_TrackedDevicePose *
*********************************/
class Aspect_TrackedDevicePose {
	public:
		/****** Aspect_TrackedDevicePose::Aspect_TrackedDevicePose ******/
		/****** md5 signature: 02737e00df27ee4bc5574676177782f9 ******/
		%feature("compactdefaultargs") Aspect_TrackedDevicePose;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") Aspect_TrackedDevicePose;
		 Aspect_TrackedDevicePose();

};


%extend Aspect_TrackedDevicePose {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class Aspect_VKeySet *
***********************/
class Aspect_VKeySet : public Standard_Transient {
	public:
		class KeyState {};
		/****** Aspect_VKeySet::Aspect_VKeySet ******/
		/****** md5 signature: 8566e8fc57970db201c78c2232c80056 ******/
		%feature("compactdefaultargs") Aspect_VKeySet;
		%feature("autodoc", "Return
-------
None

Description
-----------
Main constructor.
") Aspect_VKeySet;
		 Aspect_VKeySet();

		/****** Aspect_VKeySet::DownTime ******/
		/****** md5 signature: 3ce4407cc0d1bbc0d6555aa3d5a3e2b0 ******/
		%feature("compactdefaultargs") DownTime;
		%feature("autodoc", "
Parameters
----------
theKey: Aspect_VKey

Return
-------
double

Description
-----------
Return timestamp of press event.
") DownTime;
		double DownTime(Aspect_VKey theKey);

		/****** Aspect_VKeySet::HoldDuration ******/
		/****** md5 signature: d3a6b36f0626be624be57b5a073be7fd ******/
		%feature("compactdefaultargs") HoldDuration;
		%feature("autodoc", "
Parameters
----------
theKey: Aspect_VKey
theTime: double

Return
-------
theDuration: double

Description
-----------
Return duration of the button in pressed state. 
Parameter theKey key to check 
Parameter theTime current time (for computing duration from key down time) 
Parameter theDuration key press duration 
Return: True if key was in pressed state.
") HoldDuration;
		bool HoldDuration(Aspect_VKey theKey, double theTime, Standard_Real &OutValue);

		/****** Aspect_VKeySet::HoldDuration ******/
		/****** md5 signature: c1573ef0fa9ba2fd5946552e14276981 ******/
		%feature("compactdefaultargs") HoldDuration;
		%feature("autodoc", "
Parameters
----------
theKey: Aspect_VKey
theTime: double

Return
-------
theDuration: double
thePressure: double

Description
-----------
Return duration of the button in pressed state. 
Parameter theKey key to check 
Parameter theTime current time (for computing duration from key down time) 
Parameter theDuration key press duration 
Parameter thePressure key pressure 
Return: True if key was in pressed state.
") HoldDuration;
		bool HoldDuration(Aspect_VKey theKey, double theTime, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Aspect_VKeySet::IsFreeKey ******/
		/****** md5 signature: bbd218ecf93898ecf459b9331a00f136 ******/
		%feature("compactdefaultargs") IsFreeKey;
		%feature("autodoc", "
Parameters
----------
theKey: Aspect_VKey

Return
-------
bool

Description
-----------
Return True if key is in Free state.
") IsFreeKey;
		bool IsFreeKey(Aspect_VKey theKey);

		/****** Aspect_VKeySet::IsKeyDown ******/
		/****** md5 signature: 1c60f9b4e5ebb4fb8f0fb2113d64b286 ******/
		%feature("compactdefaultargs") IsKeyDown;
		%feature("autodoc", "
Parameters
----------
theKey: Aspect_VKey

Return
-------
bool

Description
-----------
Return True if key is in Pressed state.
") IsKeyDown;
		bool IsKeyDown(Aspect_VKey theKey);

		/****** Aspect_VKeySet::KeyDown ******/
		/****** md5 signature: 3009abb37f57f319280f9ae379b163aa ******/
		%feature("compactdefaultargs") KeyDown;
		%feature("autodoc", "
Parameters
----------
theKey: Aspect_VKey
theTime: double
thePressure: double (optional, default to 1.0)

Return
-------
None

Description
-----------
Press key. 
Parameter theKey key pressed 
Parameter theTime event timestamp.
") KeyDown;
		void KeyDown(Aspect_VKey theKey, double theTime, double thePressure = 1.0);

		/****** Aspect_VKeySet::KeyFromAxis ******/
		/****** md5 signature: 3db941cede9d9409a6324a91a2be5069 ******/
		%feature("compactdefaultargs") KeyFromAxis;
		%feature("autodoc", "
Parameters
----------
theNegative: Aspect_VKey
thePositive: Aspect_VKey
theTime: double
thePressure: double

Return
-------
None

Description
-----------
Simulate key up/down events from axis value.
") KeyFromAxis;
		void KeyFromAxis(Aspect_VKey theNegative, Aspect_VKey thePositive, double theTime, double thePressure);

		/****** Aspect_VKeySet::KeyUp ******/
		/****** md5 signature: d12e8a77599562d728d7ebfb35b14614 ******/
		%feature("compactdefaultargs") KeyUp;
		%feature("autodoc", "
Parameters
----------
theKey: Aspect_VKey
theTime: double

Return
-------
None

Description
-----------
Release key. 
Parameter theKey key pressed 
Parameter theTime event timestamp.
") KeyUp;
		void KeyUp(Aspect_VKey theKey, double theTime);

		/****** Aspect_VKeySet::Modifiers ******/
		/****** md5 signature: a988577c8f2d9e201ff486761a6a056b ******/
		%feature("compactdefaultargs") Modifiers;
		%feature("autodoc", "Return
-------
Aspect_VKeyFlags

Description
-----------
Return active modifiers.
") Modifiers;
		Aspect_VKeyFlags Modifiers();

		/****** Aspect_VKeySet::Mutex ******/
		/****** md5 signature: 328990aa85ef8a8242d5b80cac9a6096 ******/
		%feature("compactdefaultargs") Mutex;
		%feature("autodoc", "Return
-------
std::shared_mutex

Description
-----------
Return mutex for thread-safe updates. All operations in class implicitly locks this mutex, so this method could be used only for batch processing of keys.
") Mutex;
		std::shared_mutex & Mutex();

		/****** Aspect_VKeySet::Reset ******/
		/****** md5 signature: 7beb446fe26b948f797f8de87e46c23d ******/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reset the key state into unpressed state.
") Reset;
		void Reset();

		/****** Aspect_VKeySet::TimeUp ******/
		/****** md5 signature: 4131ea8db309e72b20edf20cb930f105 ******/
		%feature("compactdefaultargs") TimeUp;
		%feature("autodoc", "
Parameters
----------
theKey: Aspect_VKey

Return
-------
double

Description
-----------
Return timestamp of release event.
") TimeUp;
		double TimeUp(Aspect_VKey theKey);

};


%make_alias(Aspect_VKeySet)

%extend Aspect_VKeySet {
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
		/****** Aspect_Window::Background ******/
		/****** md5 signature: c745ba92fb6d5e6544856c59b201a620 ******/
		%feature("compactdefaultargs") Background;
		%feature("autodoc", "Return
-------
Aspect_Background

Description
-----------
Returns the window background.
") Background;
		Aspect_Background Background();

		/****** Aspect_Window::BackgroundFillMethod ******/
		/****** md5 signature: 3dc602ad8e5026afe96d15088c7b9833 ******/
		%feature("compactdefaultargs") BackgroundFillMethod;
		%feature("autodoc", "Return
-------
Aspect_FillMethod

Description
-----------
Returns the current image background fill mode.
") BackgroundFillMethod;
		Aspect_FillMethod BackgroundFillMethod();

		/****** Aspect_Window::ConvertPointFromBacking ******/
		/****** md5 signature: 35b4d5550c827b009c968153383e3ff7 ******/
		%feature("compactdefaultargs") ConvertPointFromBacking;
		%feature("autodoc", "
Parameters
----------
thePnt: NCollection_Vec2<double>

Return
-------
NCollection_Vec2<double >

Description
-----------
Convert point from backing store units to logical units.
") ConvertPointFromBacking;
		virtual NCollection_Vec2<double > ConvertPointFromBacking(const NCollection_Vec2<double> & thePnt);

		/****** Aspect_Window::ConvertPointToBacking ******/
		/****** md5 signature: 974216d1071d121ac4268ed852180195 ******/
		%feature("compactdefaultargs") ConvertPointToBacking;
		%feature("autodoc", "
Parameters
----------
thePnt: NCollection_Vec2<double>

Return
-------
NCollection_Vec2<double >

Description
-----------
Convert point from logical units into backing store units.
") ConvertPointToBacking;
		virtual NCollection_Vec2<double > ConvertPointToBacking(const NCollection_Vec2<double> & thePnt);

		/****** Aspect_Window::DevicePixelRatio ******/
		/****** md5 signature: 2ba930a3082cc0423a8b704a768cfb15 ******/
		%feature("compactdefaultargs") DevicePixelRatio;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return device pixel ratio (logical to backing store scale factor).
") DevicePixelRatio;
		virtual double DevicePixelRatio();

		/****** Aspect_Window::Dimensions ******/
		/****** md5 signature: 7d0f2e721132b410da37db16b278a33c ******/
		%feature("compactdefaultargs") Dimensions;
		%feature("autodoc", "Return
-------
NCollection_Vec2<int >

Description
-----------
Returns window dimensions.
") Dimensions;
		NCollection_Vec2<int > Dimensions();

		/****** Aspect_Window::DisplayConnection ******/
		/****** md5 signature: 411dcd7f318927d5a5c6c027eda3726a ******/
		%feature("compactdefaultargs") DisplayConnection;
		%feature("autodoc", "Return
-------
opencascade::handle<Aspect_DisplayConnection>

Description
-----------
Returns connection to Display or NULL.
") DisplayConnection;
		const opencascade::handle<Aspect_DisplayConnection> & DisplayConnection();

		/****** Aspect_Window::DoMapping ******/
		/****** md5 signature: 9cb9ffc42272e48ae6bbd60911ff9e00 ******/
		%feature("compactdefaultargs") DoMapping;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Apply the mapping change to the window <self>. and returns True if the window is mapped at screen.
") DoMapping;
		virtual bool DoMapping();

		/****** Aspect_Window::DoResize ******/
		/****** md5 signature: 53e251c7364926b7f0881bdd95b8bb10 ******/
		%feature("compactdefaultargs") DoResize;
		%feature("autodoc", "Return
-------
Aspect_TypeOfResize

Description
-----------
Apply the resizing to the window <self>.
") DoResize;
		virtual Aspect_TypeOfResize DoResize();


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
		/****** Aspect_Window::GradientBackground ******/
		/****** md5 signature: d48840592ec4f12118e8b8d065c33698 ******/
		%feature("compactdefaultargs") GradientBackground;
		%feature("autodoc", "Return
-------
Aspect_GradientBackground

Description
-----------
Returns the window gradient background.
") GradientBackground;
		Aspect_GradientBackground GradientBackground();

		/****** Aspect_Window::InvalidateContent ******/
		/****** md5 signature: c3842a52e192571bdc8176fffa5e2159 ******/
		%feature("compactdefaultargs") InvalidateContent;
		%feature("autodoc", "
Parameters
----------
theDisp: Aspect_DisplayConnection

Return
-------
None

Description
-----------
Invalidate entire window content. //! Implementation is expected to allow calling this method from non-GUI thread, e.g. by queuing exposure event into window message queue or in other thread-safe manner. //! Optional display argument should be passed when called from non-GUI thread on platforms implementing thread-unsafe connections to display. NULL can be passed instead otherwise.
") InvalidateContent;
		virtual void InvalidateContent(const opencascade::handle<Aspect_DisplayConnection> & theDisp);

		/****** Aspect_Window::IsMapped ******/
		/****** md5 signature: 9fc8b3a8382745be8355c4fe366c1d8a ******/
		%feature("compactdefaultargs") IsMapped;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the window <self> is opened and False if the window is closed.
") IsMapped;
		virtual bool IsMapped();

		/****** Aspect_Window::IsVirtual ******/
		/****** md5 signature: 029dbd66952e02744d6d477db493aa2d ******/
		%feature("compactdefaultargs") IsVirtual;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the window <self> is virtual.
") IsVirtual;
		bool IsVirtual();

		/****** Aspect_Window::Map ******/
		/****** md5 signature: 0e63cf65e00294792f8d62b1c43bea62 ******/
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "Return
-------
None

Description
-----------
Opens the window <self>.
") Map;
		virtual void Map();

		/****** Aspect_Window::NativeFBConfig ******/
		/****** md5 signature: 4c353bf7a84ef94261f833f6d54eaa5e ******/
		%feature("compactdefaultargs") NativeFBConfig;
		%feature("autodoc", "Return
-------
Aspect_FBConfig

Description
-----------
Returns native Window FB config (GLXFBConfig on Xlib).
") NativeFBConfig;
		virtual Aspect_FBConfig NativeFBConfig();

		/****** Aspect_Window::Position ******/
		/****** md5 signature: 9abe1059af076de49aa649861fa36a28 ******/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "
Parameters
----------

Return
-------
X1: int
Y1: int
X2: int
Y2: int

Description
-----------
Returns The Window POSITION in PIXEL.
") Position;
		virtual void Position(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** Aspect_Window::Ratio ******/
		/****** md5 signature: 12664fe3900e36ca1aa8757584ce247b ******/
		%feature("compactdefaultargs") Ratio;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns The Window RATIO equal to the physical WIDTH/HEIGHT dimensions.
") Ratio;
		virtual double Ratio();

		/****** Aspect_Window::SetBackground ******/
		/****** md5 signature: 1060a0f428ba58a6057f242d39040d7b ******/
		%feature("compactdefaultargs") SetBackground;
		%feature("autodoc", "
Parameters
----------
theBack: Aspect_Background

Return
-------
None

Description
-----------
Modifies the window background.
") SetBackground;
		void SetBackground(const Aspect_Background & theBack);

		/****** Aspect_Window::SetBackground ******/
		/****** md5 signature: cbe59d034bfe68360b6e7b8aeecdb1e1 ******/
		%feature("compactdefaultargs") SetBackground;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color

Return
-------
None

Description
-----------
Modifies the window background.
") SetBackground;
		void SetBackground(const Quantity_Color & theColor);

		/****** Aspect_Window::SetBackground ******/
		/****** md5 signature: f4e2412715795dcef62591ecfa331106 ******/
		%feature("compactdefaultargs") SetBackground;
		%feature("autodoc", "
Parameters
----------
theBackground: Aspect_GradientBackground

Return
-------
None

Description
-----------
Modifies the window gradient background.
") SetBackground;
		void SetBackground(const Aspect_GradientBackground & theBackground);

		/****** Aspect_Window::SetBackground ******/
		/****** md5 signature: 333d66c15042163afcf370e304fa7b6a ******/
		%feature("compactdefaultargs") SetBackground;
		%feature("autodoc", "
Parameters
----------
theFirstColor: Quantity_Color
theSecondColor: Quantity_Color
theFillMethod: Aspect_GradientFillMethod

Return
-------
None

Description
-----------
Modifies the window gradient background.
") SetBackground;
		void SetBackground(const Quantity_Color & theFirstColor, const Quantity_Color & theSecondColor, const Aspect_GradientFillMethod theFillMethod);

		/****** Aspect_Window::SetTitle ******/
		/****** md5 signature: e6432d7e27226322b8262b3f3f4d5a28 ******/
		%feature("compactdefaultargs") SetTitle;
		%feature("autodoc", "
Parameters
----------
theTitle: str

Return
-------
None

Description
-----------
Sets window title.
") SetTitle;
		virtual void SetTitle(TCollection_AsciiString theTitle);

		/****** Aspect_Window::SetVirtual ******/
		/****** md5 signature: 17b4ef366cf269ab48d10efcbc9d1308 ******/
		%feature("compactdefaultargs") SetVirtual;
		%feature("autodoc", "
Parameters
----------
theVirtual: bool

Return
-------
None

Description
-----------
Setup the virtual state.
") SetVirtual;
		void SetVirtual(const bool theVirtual);

		/****** Aspect_Window::Size ******/
		/****** md5 signature: 99d9145165ba8c2be7c3d3ea7c9e670c ******/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "
Parameters
----------

Return
-------
Width: int
Height: int

Description
-----------
Returns The Window SIZE in PIXEL.
") Size;
		virtual void Size(Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** Aspect_Window::TopLeft ******/
		/****** md5 signature: 2a29fcf3f3a525fc17adc428344de851 ******/
		%feature("compactdefaultargs") TopLeft;
		%feature("autodoc", "Return
-------
NCollection_Vec2<int >

Description
-----------
Returns window top-left corner.
") TopLeft;
		NCollection_Vec2<int > TopLeft();

		/****** Aspect_Window::Unmap ******/
		/****** md5 signature: 2681daf3d4beece6a894fb54cb645818 ******/
		%feature("compactdefaultargs") Unmap;
		%feature("autodoc", "Return
-------
None

Description
-----------
Closes the window <self>.
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

/***********************************
* class Aspect_WindowInputListener *
***********************************/
%nodefaultctor Aspect_WindowInputListener;
class Aspect_WindowInputListener {
	public:
		/****** Aspect_WindowInputListener::AddTouchPoint ******/
		/****** md5 signature: c1f917478c74f877a821e132158f7dcf ******/
		%feature("compactdefaultargs") AddTouchPoint;
		%feature("autodoc", "
Parameters
----------
theId: size_t
thePnt: NCollection_Vec2<double>
theClearBefore: bool (optional, default to false)

Return
-------
None

Description
-----------
Add touch point with the given ID. This method is expected to be called from UI thread. 
Parameter theId touch unique identifier 
Parameter thePnt touch coordinates 
Parameter theClearBefore if True previously registered touches will be removed.
") AddTouchPoint;
		virtual void AddTouchPoint(size_t theId, const NCollection_Vec2<double> & thePnt, bool theClearBefore = false);

		/****** Aspect_WindowInputListener::Change3dMouseIsNoRotate ******/
		/****** md5 signature: b2ff1af628a01e66606ed582c146ef69 ******/
		%feature("compactdefaultargs") Change3dMouseIsNoRotate;
		%feature("autodoc", "Return
-------
NCollection_Vec3<bool>

Description
-----------
Return 3d mouse rotation axes (tilt/roll/spin) ignore flag; (False, False, False) by default.
") Change3dMouseIsNoRotate;
		NCollection_Vec3<bool> & Change3dMouseIsNoRotate();

		/****** Aspect_WindowInputListener::Change3dMouseToReverse ******/
		/****** md5 signature: 74994d53f8199fd2049bc1854acbcdb2 ******/
		%feature("compactdefaultargs") Change3dMouseToReverse;
		%feature("autodoc", "Return
-------
NCollection_Vec3<bool>

Description
-----------
Return 3d mouse rotation axes (tilt/roll/spin) reverse flag; (True, False, False) by default.
") Change3dMouseToReverse;
		NCollection_Vec3<bool> & Change3dMouseToReverse();

		/****** Aspect_WindowInputListener::ChangeKeys ******/
		/****** md5 signature: 5ba331e57bcd00b6539ab5d9145324ac ******/
		%feature("compactdefaultargs") ChangeKeys;
		%feature("autodoc", "Return
-------
Aspect_VKeySet

Description
-----------
Return keyboard state.
") ChangeKeys;
		Aspect_VKeySet & ChangeKeys();

		/****** Aspect_WindowInputListener::EventTime ******/
		/****** md5 signature: 6bdc5b17561b5be0e9e4dbdd76a72ace ******/
		%feature("compactdefaultargs") EventTime;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return event time (e.g. current time).
") EventTime;
		double EventTime();

		/****** Aspect_WindowInputListener::Get3dMouseIsNoRotate ******/
		/****** md5 signature: ae14b65261c4d2a6b12679cc1f5c5ed4 ******/
		%feature("compactdefaultargs") Get3dMouseIsNoRotate;
		%feature("autodoc", "Return
-------
NCollection_Vec3<bool>

Description
-----------
Return 3d mouse rotation axes (tilt/roll/spin) ignore flag; (False, False, False) by default.
") Get3dMouseIsNoRotate;
		const NCollection_Vec3<bool> & Get3dMouseIsNoRotate();

		/****** Aspect_WindowInputListener::Get3dMouseRotationScale ******/
		/****** md5 signature: 6e7927184907412546b0e3bf5c131f00 ******/
		%feature("compactdefaultargs") Get3dMouseRotationScale;
		%feature("autodoc", "Return
-------
float

Description
-----------
Return acceleration ratio for rotation event; 4.0 by default.
") Get3dMouseRotationScale;
		float Get3dMouseRotationScale();

		/****** Aspect_WindowInputListener::Get3dMouseToReverse ******/
		/****** md5 signature: a365f1e9e4397aece1eb44aa7383f6d5 ******/
		%feature("compactdefaultargs") Get3dMouseToReverse;
		%feature("autodoc", "Return
-------
NCollection_Vec3<bool>

Description
-----------
Return 3d mouse rotation axes (tilt/roll/spin) reverse flag; (True, False, False) by default.
") Get3dMouseToReverse;
		const NCollection_Vec3<bool> & Get3dMouseToReverse();

		/****** Aspect_WindowInputListener::Get3dMouseTranslationScale ******/
		/****** md5 signature: f426a4558b5227de61530d9d20b93e7e ******/
		%feature("compactdefaultargs") Get3dMouseTranslationScale;
		%feature("autodoc", "Return
-------
float

Description
-----------
Return acceleration ratio for translation event; 2.0 by default.
") Get3dMouseTranslationScale;
		float Get3dMouseTranslationScale();

		/****** Aspect_WindowInputListener::HasTouchPoints ******/
		/****** md5 signature: f6532233e79841283a6d00ea2e7477d5 ******/
		%feature("compactdefaultargs") HasTouchPoints;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if touches map is not empty.
") HasTouchPoints;
		bool HasTouchPoints();

		/****** Aspect_WindowInputListener::KeyDown ******/
		/****** md5 signature: 5192d78be0f66dc0b2cf998103ed19af ******/
		%feature("compactdefaultargs") KeyDown;
		%feature("autodoc", "
Parameters
----------
theKey: Aspect_VKey
theTime: double
thePressure: double (optional, default to 1.0)

Return
-------
None

Description
-----------
Press key. Default implementation updates internal cache. 
Parameter theKey key pressed 
Parameter theTime event timestamp.
") KeyDown;
		virtual void KeyDown(Aspect_VKey theKey, double theTime, double thePressure = 1.0);

		/****** Aspect_WindowInputListener::KeyFromAxis ******/
		/****** md5 signature: a8592c856484d5ea635556005b4dbf66 ******/
		%feature("compactdefaultargs") KeyFromAxis;
		%feature("autodoc", "
Parameters
----------
theNegative: Aspect_VKey
thePositive: Aspect_VKey
theTime: double
thePressure: double

Return
-------
None

Description
-----------
Simulate key up/down events from axis value. Default implementation updates internal cache.
") KeyFromAxis;
		virtual void KeyFromAxis(Aspect_VKey theNegative, Aspect_VKey thePositive, double theTime, double thePressure);

		/****** Aspect_WindowInputListener::KeyUp ******/
		/****** md5 signature: facf026fe52d5d68e622d779a08b26c3 ******/
		%feature("compactdefaultargs") KeyUp;
		%feature("autodoc", "
Parameters
----------
theKey: Aspect_VKey
theTime: double

Return
-------
None

Description
-----------
Release key. Default implementation updates internal cache. 
Parameter theKey key pressed 
Parameter theTime event timestamp.
") KeyUp;
		virtual void KeyUp(Aspect_VKey theKey, double theTime);

		/****** Aspect_WindowInputListener::Keys ******/
		/****** md5 signature: 71088904ae13bced99cf6e1155c58478 ******/
		%feature("compactdefaultargs") Keys;
		%feature("autodoc", "Return
-------
Aspect_VKeySet

Description
-----------
Return keyboard state.
") Keys;
		const Aspect_VKeySet & Keys();

		/****** Aspect_WindowInputListener::LastMouseFlags ******/
		/****** md5 signature: 891e38e0b645d78e87ef09c802ac2d63 ******/
		%feature("compactdefaultargs") LastMouseFlags;
		%feature("autodoc", "Return
-------
Aspect_VKeyFlags

Description
-----------
Return active key modifiers passed with last mouse event.
") LastMouseFlags;
		Aspect_VKeyFlags LastMouseFlags();

		/****** Aspect_WindowInputListener::LastMousePosition ******/
		/****** md5 signature: 26b43d763605c89dafe56ba3b5e32657 ******/
		%feature("compactdefaultargs") LastMousePosition;
		%feature("autodoc", "Return
-------
NCollection_Vec2<int>

Description
-----------
Return last mouse position.
") LastMousePosition;
		const NCollection_Vec2<int> & LastMousePosition();

		/****** Aspect_WindowInputListener::PressMouseButton ******/
		/****** md5 signature: 22c65007bf630343a5e5b7a28e040e37 ******/
		%feature("compactdefaultargs") PressMouseButton;
		%feature("autodoc", "
Parameters
----------
thePoint: NCollection_Vec2<int>
theButton: Aspect_VKeyMouse
theModifiers: Aspect_VKeyFlags
theIsEmulated: bool

Return
-------
bool

Description
-----------
Handle mouse button press event. This method is expected to be called from UI thread. Default implementation redirects to UpdateMousePosition(). 
Parameter thePoint mouse cursor position 
Parameter theButton pressed button 
Parameter theModifiers key modifiers 
Parameter theIsEmulated if True then mouse event comes NOT from real mouse  but emulated from non-precise input like touch on screen 
Return: True if window content should be redrawn.
") PressMouseButton;
		bool PressMouseButton(const NCollection_Vec2<int> & thePoint, Aspect_VKeyMouse theButton, Aspect_VKeyFlags theModifiers, bool theIsEmulated);

		/****** Aspect_WindowInputListener::PressedMouseButtons ******/
		/****** md5 signature: 28ea733557be0052235dc8a7fe3ed119 ******/
		%feature("compactdefaultargs") PressedMouseButtons;
		%feature("autodoc", "Return
-------
Aspect_VKeyMouse

Description
-----------
Return currently pressed mouse buttons.
") PressedMouseButtons;
		Aspect_VKeyMouse PressedMouseButtons();

		/****** Aspect_WindowInputListener::ProcessClose ******/
		/****** md5 signature: 59654ad0d3a6816d4daa90e13a580cde ******/
		%feature("compactdefaultargs") ProcessClose;
		%feature("autodoc", "Return
-------
None

Description
-----------
Handle window close event.
") ProcessClose;
		virtual void ProcessClose();

		/****** Aspect_WindowInputListener::ProcessConfigure ******/
		/****** md5 signature: ca30e387334b4284a619ea054d2c8c75 ******/
		%feature("compactdefaultargs") ProcessConfigure;
		%feature("autodoc", "
Parameters
----------
theIsResized: bool

Return
-------
None

Description
-----------
Handle window resize event.
") ProcessConfigure;
		virtual void ProcessConfigure(bool theIsResized);

		/****** Aspect_WindowInputListener::ProcessExpose ******/
		/****** md5 signature: f597030918979508d41a1535a55a52da ******/
		%feature("compactdefaultargs") ProcessExpose;
		%feature("autodoc", "Return
-------
None

Description
-----------
Handle expose event (window content has been invalidation and should be redrawn).
") ProcessExpose;
		virtual void ProcessExpose();

		/****** Aspect_WindowInputListener::ProcessFocus ******/
		/****** md5 signature: 62ed591bdb7901b7386a340b9d7b2f9b ******/
		%feature("compactdefaultargs") ProcessFocus;
		%feature("autodoc", "
Parameters
----------
theIsActivated: bool

Return
-------
None

Description
-----------
Handle focus event.
") ProcessFocus;
		virtual void ProcessFocus(bool theIsActivated);

		/****** Aspect_WindowInputListener::ProcessInput ******/
		/****** md5 signature: 25eccaa30cc27b2a88e167899d319730 ******/
		%feature("compactdefaultargs") ProcessInput;
		%feature("autodoc", "Return
-------
None

Description
-----------
Handle window input event immediately (flush input buffer or ignore).
") ProcessInput;
		virtual void ProcessInput();

		/****** Aspect_WindowInputListener::ReleaseMouseButton ******/
		/****** md5 signature: c66fd640e5fd2e9bf22c35389e71a5df ******/
		%feature("compactdefaultargs") ReleaseMouseButton;
		%feature("autodoc", "
Parameters
----------
thePoint: NCollection_Vec2<int>
theButton: Aspect_VKeyMouse
theModifiers: Aspect_VKeyFlags
theIsEmulated: bool

Return
-------
bool

Description
-----------
Handle mouse button release event. This method is expected to be called from UI thread. Default implementation redirects to UpdateMousePosition(). 
Parameter thePoint mouse cursor position 
Parameter theButton released button 
Parameter theModifiers key modifiers 
Parameter theIsEmulated if True then mouse event comes NOT from real mouse  but emulated from non-precise input like touch on screen 
Return: True if window content should be redrawn.
") ReleaseMouseButton;
		bool ReleaseMouseButton(const NCollection_Vec2<int> & thePoint, Aspect_VKeyMouse theButton, Aspect_VKeyFlags theModifiers, bool theIsEmulated);

		/****** Aspect_WindowInputListener::RemoveTouchPoint ******/
		/****** md5 signature: 8cc676157442ab658342b96fbd7adb15 ******/
		%feature("compactdefaultargs") RemoveTouchPoint;
		%feature("autodoc", "
Parameters
----------
theId: size_t
theClearSelectPnts: bool (optional, default to false)

Return
-------
bool

Description
-----------
Remove touch point with the given ID. This method is expected to be called from UI thread. 
Parameter theId touch unique identifier 
Parameter theClearSelectPnts if True will initiate clearing of selection points 
Return: True if point has been removed.
") RemoveTouchPoint;
		virtual bool RemoveTouchPoint(size_t theId, bool theClearSelectPnts = false);

		/****** Aspect_WindowInputListener::Set3dMousePreciseInput ******/
		/****** md5 signature: 0ff4172c7dce21c124fb3941d21634cd ******/
		%feature("compactdefaultargs") Set3dMousePreciseInput;
		%feature("autodoc", "
Parameters
----------
theIsQuadric: bool

Return
-------
None

Description
-----------
Set quadric acceleration flag.
") Set3dMousePreciseInput;
		void Set3dMousePreciseInput(bool theIsQuadric);

		/****** Aspect_WindowInputListener::Set3dMouseRotationScale ******/
		/****** md5 signature: 26cc1d3413bc1ed0806210cb74503bf8 ******/
		%feature("compactdefaultargs") Set3dMouseRotationScale;
		%feature("autodoc", "
Parameters
----------
theScale: float

Return
-------
None

Description
-----------
Set acceleration ratio for rotation event.
") Set3dMouseRotationScale;
		void Set3dMouseRotationScale(float theScale);

		/****** Aspect_WindowInputListener::Set3dMouseTranslationScale ******/
		/****** md5 signature: d66cf6c87510f4cf28118e77235f6dc1 ******/
		%feature("compactdefaultargs") Set3dMouseTranslationScale;
		%feature("autodoc", "
Parameters
----------
theScale: float

Return
-------
None

Description
-----------
Set acceleration ratio for translation event.
") Set3dMouseTranslationScale;
		void Set3dMouseTranslationScale(float theScale);

		/****** Aspect_WindowInputListener::To3dMousePreciseInput ******/
		/****** md5 signature: e7d1cbbce6f739652fb2dcffebfdc574 ******/
		%feature("compactdefaultargs") To3dMousePreciseInput;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return quadric acceleration flag; True by default.
") To3dMousePreciseInput;
		bool To3dMousePreciseInput();

		/****** Aspect_WindowInputListener::TouchPoints ******/
		/****** md5 signature: 9c5538e5b3858f7cf469ea1977bbbe6c ******/
		%feature("compactdefaultargs") TouchPoints;
		%feature("autodoc", "Return
-------
NCollection_IndexedDataMap<size_t, Aspect_Touch>

Description
-----------
Return map of active touches.
") TouchPoints;
		const NCollection_IndexedDataMap<size_t, Aspect_Touch> & TouchPoints();

		/****** Aspect_WindowInputListener::Update3dMouse ******/
		/****** md5 signature: 989c941c2b66167e2e5fa84999e81fe3 ******/
		%feature("compactdefaultargs") Update3dMouse;
		%feature("autodoc", "
Parameters
----------
theEvent: WNT_HIDSpaceMouse

Return
-------
bool

Description
-----------
Process 3d mouse input event (redirects to translation, rotation and keys).
") Update3dMouse;
		virtual bool Update3dMouse(const WNT_HIDSpaceMouse & theEvent);

		/****** Aspect_WindowInputListener::UpdateMouseButtons ******/
		/****** md5 signature: 89a69e4721b310f68893d7dac0dc78c1 ******/
		%feature("compactdefaultargs") UpdateMouseButtons;
		%feature("autodoc", "
Parameters
----------
thePoint: NCollection_Vec2<int>
theButtons: Aspect_VKeyMouse
theModifiers: Aspect_VKeyFlags
theIsEmulated: bool

Return
-------
bool

Description
-----------
Handle mouse button press/release event. This method is expected to be called from UI thread. 
Parameter thePoint mouse cursor position 
Parameter theButtons pressed buttons 
Parameter theModifiers key modifiers 
Parameter theIsEmulated if True then mouse event comes NOT from real mouse  but emulated from non-precise input like touch on screen 
Return: True if window content should be redrawn.
") UpdateMouseButtons;
		virtual bool UpdateMouseButtons(const NCollection_Vec2<int> & thePoint, Aspect_VKeyMouse theButtons, Aspect_VKeyFlags theModifiers, bool theIsEmulated);

		/****** Aspect_WindowInputListener::UpdateMousePosition ******/
		/****** md5 signature: 25dc895d0db4125b34f2dd252e6b655f ******/
		%feature("compactdefaultargs") UpdateMousePosition;
		%feature("autodoc", "
Parameters
----------
thePoint: NCollection_Vec2<int>
theButtons: Aspect_VKeyMouse
theModifiers: Aspect_VKeyFlags
theIsEmulated: bool

Return
-------
bool

Description
-----------
Handle mouse cursor movement event. This method is expected to be called from UI thread. Default implementation does nothing. 
Parameter thePoint mouse cursor position 
Parameter theButtons pressed buttons 
Parameter theModifiers key modifiers 
Parameter theIsEmulated if True then mouse event comes NOT from real mouse  but emulated from non-precise input like touch on screen 
Return: True if window content should be redrawn.
") UpdateMousePosition;
		virtual bool UpdateMousePosition(const NCollection_Vec2<int> & thePoint, Aspect_VKeyMouse theButtons, Aspect_VKeyFlags theModifiers, bool theIsEmulated);

		/****** Aspect_WindowInputListener::UpdateMouseScroll ******/
		/****** md5 signature: 33a1d2af16e7dcdaa2ec2c0ec68a7748 ******/
		%feature("compactdefaultargs") UpdateMouseScroll;
		%feature("autodoc", "
Parameters
----------
theDelta: Aspect_ScrollDelta

Return
-------
bool

Description
-----------
Update mouse scroll event. This method is expected to be called from UI thread. 
Parameter theDelta mouse cursor position and delta 
Return: True if new event has been created or False if existing one has been updated.
") UpdateMouseScroll;
		virtual bool UpdateMouseScroll(const Aspect_ScrollDelta & theDelta);

		/****** Aspect_WindowInputListener::UpdateTouchPoint ******/
		/****** md5 signature: c89ea6bf10c9eba3696badffedbc895c ******/
		%feature("compactdefaultargs") UpdateTouchPoint;
		%feature("autodoc", "
Parameters
----------
theId: size_t
thePnt: NCollection_Vec2<double>

Return
-------
None

Description
-----------
Update touch point with the given ID. If point with specified ID was not registered before, it will be added. This method is expected to be called from UI thread. 
Parameter theId touch unique identifier 
Parameter thePnt touch coordinates.
") UpdateTouchPoint;
		virtual void UpdateTouchPoint(size_t theId, const NCollection_Vec2<double> & thePnt);

		/****** Aspect_WindowInputListener::update3dMouseKeys ******/
		/****** md5 signature: 7068d4e0858b2659de00f111094ecc7f ******/
		%feature("compactdefaultargs") update3dMouseKeys;
		%feature("autodoc", "
Parameters
----------
theEvent: WNT_HIDSpaceMouse

Return
-------
bool

Description
-----------
Process 3d mouse input keys event.
") update3dMouseKeys;
		virtual bool update3dMouseKeys(const WNT_HIDSpaceMouse & theEvent);

		/****** Aspect_WindowInputListener::update3dMouseRotation ******/
		/****** md5 signature: 0e88dd09859b6f02e48c9b73ec73f69b ******/
		%feature("compactdefaultargs") update3dMouseRotation;
		%feature("autodoc", "
Parameters
----------
theEvent: WNT_HIDSpaceMouse

Return
-------
bool

Description
-----------
Process 3d mouse input rotation event.
") update3dMouseRotation;
		virtual bool update3dMouseRotation(const WNT_HIDSpaceMouse & theEvent);

		/****** Aspect_WindowInputListener::update3dMouseTranslation ******/
		/****** md5 signature: c826319c70a567fbe2c3401c0a5c2471 ******/
		%feature("compactdefaultargs") update3dMouseTranslation;
		%feature("autodoc", "
Parameters
----------
theEvent: WNT_HIDSpaceMouse

Return
-------
bool

Description
-----------
Process 3d mouse input translation event.
") update3dMouseTranslation;
		virtual bool update3dMouseTranslation(const WNT_HIDSpaceMouse & theEvent);

};


%extend Aspect_WindowInputListener {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class Aspect_XRAction *
************************/
class Aspect_XRAction : public Standard_Transient {
	public:
		/****** Aspect_XRAction::Aspect_XRAction ******/
		/****** md5 signature: 40a266a780195e2fd6ebc2e8b13a5281 ******/
		%feature("compactdefaultargs") Aspect_XRAction;
		%feature("autodoc", "
Parameters
----------
theId: str
theType: Aspect_XRActionType

Return
-------
None

Description
-----------
Main constructor.
") Aspect_XRAction;
		 Aspect_XRAction(TCollection_AsciiString theId, const Aspect_XRActionType theType);

		/****** Aspect_XRAction::Id ******/
		/****** md5 signature: 932272b78b9184cc2485436a72cc2df4 ******/
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Return action id.
") Id;
		const TCollection_AsciiString & Id();

		/****** Aspect_XRAction::IsValid ******/
		/****** md5 signature: 735088818cf24ebe0ebc7005a507da69 ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if action is defined.
") IsValid;
		bool IsValid();

		/****** Aspect_XRAction::RawHandle ******/
		/****** md5 signature: 9d20e0a6fff437dc17426cf4e026b189 ******/
		%feature("compactdefaultargs") RawHandle;
		%feature("autodoc", "Return
-------
uint64_t

Description
-----------
Return action handle.
") RawHandle;
		uint64_t RawHandle();

		/****** Aspect_XRAction::SetRawHandle ******/
		/****** md5 signature: deb51d9baa50e7628d1bd2ab92c27b11 ******/
		%feature("compactdefaultargs") SetRawHandle;
		%feature("autodoc", "
Parameters
----------
theHande: uint64_t

Return
-------
None

Description
-----------
Set action handle.
") SetRawHandle;
		void SetRawHandle(uint64_t theHande);

		/****** Aspect_XRAction::Type ******/
		/****** md5 signature: 0d72e5323e44404dea40a38f3ba7d11c ******/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Return
-------
Aspect_XRActionType

Description
-----------
Return action type.
") Type;
		Aspect_XRActionType Type();

};


%make_alias(Aspect_XRAction)

%extend Aspect_XRAction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class Aspect_XRActionSet *
***************************/
class Aspect_XRActionSet : public Standard_Transient {
	public:
		/****** Aspect_XRActionSet::Aspect_XRActionSet ******/
		/****** md5 signature: d45a5ec20e38bdb339eb2ee8d975e996 ******/
		%feature("compactdefaultargs") Aspect_XRActionSet;
		%feature("autodoc", "
Parameters
----------
theId: str

Return
-------
None

Description
-----------
Main constructor.
") Aspect_XRActionSet;
		 Aspect_XRActionSet(TCollection_AsciiString theId);

		/****** Aspect_XRActionSet::Actions ******/
		/****** md5 signature: 0cfefadc2d3cf0e21c5c43050f0aade9 ******/
		%feature("compactdefaultargs") Actions;
		%feature("autodoc", "Return
-------
NCollection_IndexedDataMap<TCollection_AsciiString, opencascade::handle<Aspect_XRAction>>

Description
-----------
Return map of actions.
") Actions;
		const NCollection_IndexedDataMap<TCollection_AsciiString, opencascade::handle<Aspect_XRAction>> & Actions();

		/****** Aspect_XRActionSet::AddAction ******/
		/****** md5 signature: 41c9367a03de48c635cea24270f2015a ******/
		%feature("compactdefaultargs") AddAction;
		%feature("autodoc", "
Parameters
----------
theAction: Aspect_XRAction

Return
-------
None

Description
-----------
Add action.
") AddAction;
		void AddAction(const opencascade::handle<Aspect_XRAction> & theAction);

		/****** Aspect_XRActionSet::Id ******/
		/****** md5 signature: 932272b78b9184cc2485436a72cc2df4 ******/
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Return action id.
") Id;
		const TCollection_AsciiString & Id();

		/****** Aspect_XRActionSet::RawHandle ******/
		/****** md5 signature: 9d20e0a6fff437dc17426cf4e026b189 ******/
		%feature("compactdefaultargs") RawHandle;
		%feature("autodoc", "Return
-------
uint64_t

Description
-----------
Return action handle.
") RawHandle;
		uint64_t RawHandle();

		/****** Aspect_XRActionSet::SetRawHandle ******/
		/****** md5 signature: deb51d9baa50e7628d1bd2ab92c27b11 ******/
		%feature("compactdefaultargs") SetRawHandle;
		%feature("autodoc", "
Parameters
----------
theHande: uint64_t

Return
-------
None

Description
-----------
Set action handle.
") SetRawHandle;
		void SetRawHandle(uint64_t theHande);

};


%make_alias(Aspect_XRActionSet)

%extend Aspect_XRActionSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class Aspect_XRAnalogActionData *
**********************************/
class Aspect_XRAnalogActionData {
	public:
		/****** Aspect_XRAnalogActionData::Aspect_XRAnalogActionData ******/
		/****** md5 signature: 2f2cb24f7e51cc622f48142c162305a9 ******/
		%feature("compactdefaultargs") Aspect_XRAnalogActionData;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") Aspect_XRAnalogActionData;
		 Aspect_XRAnalogActionData();

		/****** Aspect_XRAnalogActionData::IsChanged ******/
		/****** md5 signature: 6d97ce9bcd3b0740efa5aa99476487a7 ******/
		%feature("compactdefaultargs") IsChanged;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if delta is non-zero.
") IsChanged;
		bool IsChanged();

};


%extend Aspect_XRAnalogActionData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class Aspect_XRDigitalActionData *
***********************************/
class Aspect_XRDigitalActionData {
	public:
		/****** Aspect_XRDigitalActionData::Aspect_XRDigitalActionData ******/
		/****** md5 signature: 11e9cfb288833ee07981b262b013a14e ******/
		%feature("compactdefaultargs") Aspect_XRDigitalActionData;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") Aspect_XRDigitalActionData;
		 Aspect_XRDigitalActionData();

};


%extend Aspect_XRDigitalActionData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class Aspect_XRHapticActionData *
**********************************/
class Aspect_XRHapticActionData {
	public:
		/****** Aspect_XRHapticActionData::Aspect_XRHapticActionData ******/
		/****** md5 signature: c42f3b26d235df1234aa3b319bd587d7 ******/
		%feature("compactdefaultargs") Aspect_XRHapticActionData;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") Aspect_XRHapticActionData;
		 Aspect_XRHapticActionData();

		/****** Aspect_XRHapticActionData::IsValid ******/
		/****** md5 signature: 735088818cf24ebe0ebc7005a507da69 ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if data is not empty.
") IsValid;
		bool IsValid();

};


%extend Aspect_XRHapticActionData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class Aspect_XRPoseActionData *
********************************/
class Aspect_XRPoseActionData {
	public:
		/****** Aspect_XRPoseActionData::Aspect_XRPoseActionData ******/
		/****** md5 signature: 37cbeeeffeaedd7d742097ec767fe262 ******/
		%feature("compactdefaultargs") Aspect_XRPoseActionData;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") Aspect_XRPoseActionData;
		 Aspect_XRPoseActionData();

};


%extend Aspect_XRPoseActionData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Aspect_XRSession *
*************************/
%nodefaultctor Aspect_XRSession;
class Aspect_XRSession : public Standard_Transient {
	public:
/* public enums */
enum TrackingUniverseOrigin {
	TrackingUniverseOrigin_Seated = 0,
	TrackingUniverseOrigin_Standing = 1,
};

enum InfoString {
	InfoString_Vendor = 0,
	InfoString_Device = 1,
	InfoString_Tracker = 2,
	InfoString_SerialNumber = 3,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class TrackingUniverseOrigin(IntEnum):
	TrackingUniverseOrigin_Seated = 0
	TrackingUniverseOrigin_Standing = 1
TrackingUniverseOrigin_Seated = TrackingUniverseOrigin.TrackingUniverseOrigin_Seated
TrackingUniverseOrigin_Standing = TrackingUniverseOrigin.TrackingUniverseOrigin_Standing

class InfoString(IntEnum):
	InfoString_Vendor = 0
	InfoString_Device = 1
	InfoString_Tracker = 2
	InfoString_SerialNumber = 3
InfoString_Vendor = InfoString.InfoString_Vendor
InfoString_Device = InfoString.InfoString_Device
InfoString_Tracker = InfoString.InfoString_Tracker
InfoString_SerialNumber = InfoString.InfoString_SerialNumber
};
/* end python proxy for enums */

		/****** Aspect_XRSession::AbortHapticVibrationAction ******/
		/****** md5 signature: 2c091ce7d5b95edbd8b37ef2a7d5033f ******/
		%feature("compactdefaultargs") AbortHapticVibrationAction;
		%feature("autodoc", "
Parameters
----------
theAction: Aspect_XRAction

Return
-------
None

Description
-----------
Abort vibration.
") AbortHapticVibrationAction;
		void AbortHapticVibrationAction(const opencascade::handle<Aspect_XRAction> & theAction);

		/****** Aspect_XRSession::Aspect ******/
		/****** md5 signature: d75ed810a92ab0c4841ec48641f2e1c3 ******/
		%feature("compactdefaultargs") Aspect;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return aspect ratio.
") Aspect;
		double Aspect();

		/****** Aspect_XRSession::Close ******/
		/****** md5 signature: 1b03fb860325770bc6fb04462ecfd6fe ******/
		%feature("compactdefaultargs") Close;
		%feature("autodoc", "Return
-------
None

Description
-----------
Release session.
") Close;
		virtual void Close();

		/****** Aspect_XRSession::DisplayFrequency ******/
		/****** md5 signature: 8c3447df4e9db8b7eb3afa077ac4383a ******/
		%feature("compactdefaultargs") DisplayFrequency;
		%feature("autodoc", "Return
-------
float

Description
-----------
Return display frequency or 0 if unknown.
") DisplayFrequency;
		float DisplayFrequency();

		/****** Aspect_XRSession::EyeToHeadTransform ******/
		/****** md5 signature: f29783bde9cca028ac265ae76bdafba8 ******/
		%feature("compactdefaultargs") EyeToHeadTransform;
		%feature("autodoc", "
Parameters
----------
theEye: Aspect_Eye

Return
-------
NCollection_Mat4<double >

Description
-----------
Return transformation from eye to head.
") EyeToHeadTransform;
		virtual NCollection_Mat4<double > EyeToHeadTransform(Aspect_Eye theEye);

		/****** Aspect_XRSession::FieldOfView ******/
		/****** md5 signature: 2ada94ebbe22756d2a3631683f49af4a ******/
		%feature("compactdefaultargs") FieldOfView;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return field of view.
") FieldOfView;
		double FieldOfView();

		/****** Aspect_XRSession::GenericAction ******/
		/****** md5 signature: 7b32709a9882affc64e34a4979e4522d ******/
		%feature("compactdefaultargs") GenericAction;
		%feature("autodoc", "
Parameters
----------
theDevice: Aspect_XRTrackedDeviceRole
theAction: Aspect_XRGenericAction

Return
-------
opencascade::handle<Aspect_XRAction>

Description
-----------
Return generic action for specific hand or NULL if undefined.
") GenericAction;
		const opencascade::handle<Aspect_XRAction> & GenericAction(Aspect_XRTrackedDeviceRole theDevice, Aspect_XRGenericAction theAction);

		/****** Aspect_XRSession::GetAnalogActionData ******/
		/****** md5 signature: 8ba907292e43d1a641030bff3bf5b326 ******/
		%feature("compactdefaultargs") GetAnalogActionData;
		%feature("autodoc", "
Parameters
----------
theAction: Aspect_XRAction

Return
-------
Aspect_XRAnalogActionData

Description
-----------
Fetch data for digital input action (like axis). 
Input parameter: theAction action of Aspect_XRActionType_InputAnalog type.
") GetAnalogActionData;
		virtual Aspect_XRAnalogActionData GetAnalogActionData(const opencascade::handle<Aspect_XRAction> & theAction);

		/****** Aspect_XRSession::GetDigitalActionData ******/
		/****** md5 signature: 481010d4545a367f4cd3dfec52bd745b ******/
		%feature("compactdefaultargs") GetDigitalActionData;
		%feature("autodoc", "
Parameters
----------
theAction: Aspect_XRAction

Return
-------
Aspect_XRDigitalActionData

Description
-----------
Fetch data for digital input action (like button). 
Input parameter: theAction action of Aspect_XRActionType_InputDigital type.
") GetDigitalActionData;
		virtual Aspect_XRDigitalActionData GetDigitalActionData(const opencascade::handle<Aspect_XRAction> & theAction);

		/****** Aspect_XRSession::GetPoseActionDataForNextFrame ******/
		/****** md5 signature: 98eeea2ec9abd109afa8aea11fadf00d ******/
		%feature("compactdefaultargs") GetPoseActionDataForNextFrame;
		%feature("autodoc", "
Parameters
----------
theAction: Aspect_XRAction

Return
-------
Aspect_XRPoseActionData

Description
-----------
Fetch data for pose input action (like fingertip position). The returned values will match the values returned by the last call to WaitPoses(). 
Input parameter: theAction action of Aspect_XRActionType_InputPose type.
") GetPoseActionDataForNextFrame;
		virtual Aspect_XRPoseActionData GetPoseActionDataForNextFrame(const opencascade::handle<Aspect_XRAction> & theAction);

		/****** Aspect_XRSession::GetString ******/
		/****** md5 signature: 995a5d10180a3ba1d11d529669c70c62 ******/
		%feature("compactdefaultargs") GetString;
		%feature("autodoc", "
Parameters
----------
theInfo: InfoString

Return
-------
TCollection_AsciiString

Description
-----------
Query information.
") GetString;
		virtual TCollection_AsciiString GetString(InfoString theInfo);

		/****** Aspect_XRSession::HasProjectionFrustums ******/
		/****** md5 signature: b21c3c98901bb0d2fe751c0f535b874e ******/
		%feature("compactdefaultargs") HasProjectionFrustums;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return False if projection frustums are unsupported and general 4x4 projection matrix should be fetched instead.
") HasProjectionFrustums;
		virtual bool HasProjectionFrustums();

		/****** Aspect_XRSession::HasTrackedPose ******/
		/****** md5 signature: b2e26b7c7aa64e8d03fc0b210ba72f6d ******/
		%feature("compactdefaultargs") HasTrackedPose;
		%feature("autodoc", "
Parameters
----------
theDevice: int

Return
-------
bool

Description
-----------
Return True if device orientation is defined.
") HasTrackedPose;
		bool HasTrackedPose(int theDevice);

		/****** Aspect_XRSession::HeadPose ******/
		/****** md5 signature: d492f7441f83aa8c0f430cdab6e86f73 ******/
		%feature("compactdefaultargs") HeadPose;
		%feature("autodoc", "Return
-------
gp_Trsf

Description
-----------
Return head orientation in right-handed system: +y is up +x is to the right -z is forward Distance unit is meters by default (
See also: UnitFactor()).
") HeadPose;
		const gp_Trsf HeadPose();

		/****** Aspect_XRSession::HeadToEyeTransform ******/
		/****** md5 signature: eefc127028406cfe34b43880dc164bed ******/
		%feature("compactdefaultargs") HeadToEyeTransform;
		%feature("autodoc", "
Parameters
----------
theEye: Aspect_Eye

Return
-------
NCollection_Mat4<double >

Description
-----------
Return transformation from head to eye.
") HeadToEyeTransform;
		NCollection_Mat4<double > HeadToEyeTransform(Aspect_Eye theEye);

		/****** Aspect_XRSession::IOD ******/
		/****** md5 signature: 6c526dc30d8815f08e97a67084902fd1 ******/
		%feature("compactdefaultargs") IOD;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return Intra-ocular Distance (IOD); also known as Interpupillary Distance (IPD). Defined in meters by default (
See also: UnitFactor()).
") IOD;
		double IOD();

		/****** Aspect_XRSession::IsOpen ******/
		/****** md5 signature: cbb165b1058ff52986668925b81dfa08 ******/
		%feature("compactdefaultargs") IsOpen;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if session is opened.
") IsOpen;
		virtual bool IsOpen();

		/****** Aspect_XRSession::LeftHandPose ******/
		/****** md5 signature: ff3b4ff1b6e9278d95fc3d221947728e ******/
		%feature("compactdefaultargs") LeftHandPose;
		%feature("autodoc", "Return
-------
gp_Trsf

Description
-----------
Return left hand orientation.
") LeftHandPose;
		gp_Trsf LeftHandPose();

		/****** Aspect_XRSession::LoadRenderModel ******/
		/****** md5 signature: 868427ab3f474fde3cffc70133057e1c ******/
		%feature("compactdefaultargs") LoadRenderModel;
		%feature("autodoc", "
Parameters
----------
theDevice: int
theTexture: Image_Texture

Return
-------
opencascade::handle<Graphic3d_ArrayOfTriangles>

Description
-----------
Load model for displaying device. 
Input parameter: theDevice device index @param[out] theTexture texture source 
Return: model triangulation or NULL if not found.
") LoadRenderModel;
		opencascade::handle<Graphic3d_ArrayOfTriangles> LoadRenderModel(int theDevice, opencascade::handle<Image_Texture> & theTexture);

		/****** Aspect_XRSession::LoadRenderModel ******/
		/****** md5 signature: 8a242756122fc2d8bd6351dbbfd7f04e ******/
		%feature("compactdefaultargs") LoadRenderModel;
		%feature("autodoc", "
Parameters
----------
theDevice: int
theToApplyUnitFactor: bool
theTexture: Image_Texture

Return
-------
opencascade::handle<Graphic3d_ArrayOfTriangles>

Description
-----------
Load model for displaying device. 
Input parameter: theDevice device index 
Input parameter: theToApplyUnitFactor flag to apply unit scale factor @param[out] theTexture texture source 
Return: model triangulation or NULL if not found.
") LoadRenderModel;
		opencascade::handle<Graphic3d_ArrayOfTriangles> LoadRenderModel(int theDevice, bool theToApplyUnitFactor, opencascade::handle<Image_Texture> & theTexture);

		/****** Aspect_XRSession::NamedTrackedDevice ******/
		/****** md5 signature: 1ab0cfc61a18165ef0eebce369fdf26b ******/
		%feature("compactdefaultargs") NamedTrackedDevice;
		%feature("autodoc", "
Parameters
----------
theDevice: Aspect_XRTrackedDeviceRole

Return
-------
int

Description
-----------
Return index of tracked device of known role, or -1 if undefined.
") NamedTrackedDevice;
		virtual int NamedTrackedDevice(Aspect_XRTrackedDeviceRole theDevice);

		/****** Aspect_XRSession::Open ******/
		/****** md5 signature: d00ec1bf018b5e93ac2a5d97d9dde636 ******/
		%feature("compactdefaultargs") Open;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Initialize session.
") Open;
		virtual bool Open();

		/****** Aspect_XRSession::ProcessEvents ******/
		/****** md5 signature: 240ee1d1e4a0e42cba1c56aac9611f29 ******/
		%feature("compactdefaultargs") ProcessEvents;
		%feature("autodoc", "Return
-------
None

Description
-----------
Receive XR events.
") ProcessEvents;
		virtual void ProcessEvents();

		/****** Aspect_XRSession::ProjectionFrustum ******/
		/****** md5 signature: 9dc4ecde0b8d7e55944cdeade4e5bbf9 ******/
		%feature("compactdefaultargs") ProjectionFrustum;
		%feature("autodoc", "
Parameters
----------
theEye: Aspect_Eye

Return
-------
Aspect_FrustumLRBT<double>

Description
-----------
Return projection frustum. 
See also: HasProjectionFrustums().
") ProjectionFrustum;
		const Aspect_FrustumLRBT<double> & ProjectionFrustum(Aspect_Eye theEye);

		/****** Aspect_XRSession::ProjectionMatrix ******/
		/****** md5 signature: 5da23c248f3062bca81dea5a0b78608f ******/
		%feature("compactdefaultargs") ProjectionMatrix;
		%feature("autodoc", "
Parameters
----------
theEye: Aspect_Eye
theZNear: double
theZFar: double

Return
-------
NCollection_Mat4<double >

Description
-----------
Return projection matrix.
") ProjectionMatrix;
		virtual NCollection_Mat4<double > ProjectionMatrix(Aspect_Eye theEye, double theZNear, double theZFar);

		/****** Aspect_XRSession::RecommendedViewport ******/
		/****** md5 signature: 1072307c44dc5ac0c775b17e1c89ea5c ******/
		%feature("compactdefaultargs") RecommendedViewport;
		%feature("autodoc", "Return
-------
NCollection_Vec2<int >

Description
-----------
Return recommended viewport Width x Height for rendering into VR.
") RecommendedViewport;
		virtual NCollection_Vec2<int > RecommendedViewport();

		/****** Aspect_XRSession::RightHandPose ******/
		/****** md5 signature: b997db6d22c5309fef58aaa7a85929a9 ******/
		%feature("compactdefaultargs") RightHandPose;
		%feature("autodoc", "Return
-------
gp_Trsf

Description
-----------
Return right hand orientation.
") RightHandPose;
		gp_Trsf RightHandPose();

		/****** Aspect_XRSession::SetTrackingOrigin ******/
		/****** md5 signature: c5848a9d52580d64afea846e587f5e68 ******/
		%feature("compactdefaultargs") SetTrackingOrigin;
		%feature("autodoc", "
Parameters
----------
theOrigin: TrackingUniverseOrigin

Return
-------
None

Description
-----------
Set tracking origin.
") SetTrackingOrigin;
		virtual void SetTrackingOrigin(TrackingUniverseOrigin theOrigin);

		/****** Aspect_XRSession::SetUnitFactor ******/
		/****** md5 signature: cbe2902368e6cbeaa1a8ceedf7a28ea6 ******/
		%feature("compactdefaultargs") SetUnitFactor;
		%feature("autodoc", "
Parameters
----------
theFactor: double

Return
-------
None

Description
-----------
Set unit scale factor.
") SetUnitFactor;
		void SetUnitFactor(double theFactor);

		/****** Aspect_XRSession::SubmitEye ******/
		/****** md5 signature: e715d68400865ca08b80b6b4be7a6117 ******/
		%feature("compactdefaultargs") SubmitEye;
		%feature("autodoc", "
Parameters
----------
theTexture: void *
theGraphicsLib: Aspect_GraphicsLibrary
theColorSpace: Aspect_ColorSpace
theEye: Aspect_Eye

Return
-------
bool

Description
-----------
Submit texture eye to XR Composer. 
Input parameter: theTexture texture handle 
Input parameter: theGraphicsLib graphics library in which texture handle is defined 
Input parameter: theColorSpace texture color space;  sRGB means no color conversion by composer;  Linear means to sRGB color conversion by composer 
Input parameter: theEye eye to display 
Return: False on error.
") SubmitEye;
		virtual bool SubmitEye(void * theTexture, Aspect_GraphicsLibrary theGraphicsLib, Aspect_ColorSpace theColorSpace, Aspect_Eye theEye);

		/****** Aspect_XRSession::TrackedPoses ******/
		/****** md5 signature: b7402454210035c9f19d19ea9f722aab ******/
		%feature("compactdefaultargs") TrackedPoses;
		%feature("autodoc", "Return
-------
NCollection_Array1<Aspect_TrackedDevicePose>

Description
-----------
Return number of tracked poses array.
") TrackedPoses;
		const NCollection_Array1<Aspect_TrackedDevicePose> & TrackedPoses();

		/****** Aspect_XRSession::TrackingOrigin ******/
		/****** md5 signature: db35db8c9365604e0d9a180025f9d9da ******/
		%feature("compactdefaultargs") TrackingOrigin;
		%feature("autodoc", "Return
-------
Aspect_XRSession::TrackingUniverseOrigin

Description
-----------
Return tracking origin.
") TrackingOrigin;
		Aspect_XRSession::TrackingUniverseOrigin TrackingOrigin();

		/****** Aspect_XRSession::TriggerHapticVibrationAction ******/
		/****** md5 signature: 039fc9219b24c9a39bd343511f01b47b ******/
		%feature("compactdefaultargs") TriggerHapticVibrationAction;
		%feature("autodoc", "
Parameters
----------
theAction: Aspect_XRAction
theParams: Aspect_XRHapticActionData

Return
-------
None

Description
-----------
Trigger vibration.
") TriggerHapticVibrationAction;
		void TriggerHapticVibrationAction(const opencascade::handle<Aspect_XRAction> & theAction, const Aspect_XRHapticActionData & theParams);

		/****** Aspect_XRSession::UnitFactor ******/
		/****** md5 signature: 357beeb9b9619501c8cf18307139ee87 ******/
		%feature("compactdefaultargs") UnitFactor;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return unit scale factor defined as scale factor for m (meters); 1.0 by default.
") UnitFactor;
		double UnitFactor();

		/****** Aspect_XRSession::WaitPoses ******/
		/****** md5 signature: 2cd6ece8094e306806174f976e95a323 ******/
		%feature("compactdefaultargs") WaitPoses;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Fetch actual poses of tracked devices.
") WaitPoses;
		virtual bool WaitPoses();

};


%make_alias(Aspect_XRSession)

%extend Aspect_XRSession {
	%pythoncode {
	__repr__ = _dumps_object
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
		/****** Aspect_GradientBackground::Aspect_GradientBackground ******/
		/****** md5 signature: 2a3b12e3984621a36868307403d00696 ******/
		%feature("compactdefaultargs") Aspect_GradientBackground;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a window gradient background. Default color is Quantity_NOC_BLACK. Default fill method is Aspect_GradientFillMethod_None.
") Aspect_GradientBackground;
		 Aspect_GradientBackground();

		/****** Aspect_GradientBackground::Aspect_GradientBackground ******/
		/****** md5 signature: 85f06b5f3ce72c2ed98cd0a1aa2d2a99 ******/
		%feature("compactdefaultargs") Aspect_GradientBackground;
		%feature("autodoc", "
Parameters
----------
theColor1: Quantity_Color
theColor2: Quantity_Color
theMethod: Aspect_GradientFillMethod (optional, default to Aspect_GradientFillMethod_Horizontal)

Return
-------
None

Description
-----------
Creates a window gradient background with two colours.
") Aspect_GradientBackground;
		 Aspect_GradientBackground(const Quantity_Color & theColor1, const Quantity_Color & theColor2, const Aspect_GradientFillMethod theMethod = Aspect_GradientFillMethod_Horizontal);

		/****** Aspect_GradientBackground::BgGradientFillMethod ******/
		/****** md5 signature: 7ed50907542306114d5e90acbea724cc ******/
		%feature("compactdefaultargs") BgGradientFillMethod;
		%feature("autodoc", "Return
-------
Aspect_GradientFillMethod

Description
-----------
Returns the current gradient background fill mode.
") BgGradientFillMethod;
		Aspect_GradientFillMethod BgGradientFillMethod();

		/****** Aspect_GradientBackground::Colors ******/
		/****** md5 signature: 2e3f4d55b92b83e682d47f9e5901fc34 ******/
		%feature("compactdefaultargs") Colors;
		%feature("autodoc", "
Parameters
----------
theColor1: Quantity_Color
theColor2: Quantity_Color

Return
-------
None

Description
-----------
Returns colours of the window gradient background.
") Colors;
		void Colors(Quantity_Color & theColor1, Quantity_Color & theColor2);


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
		/****** Aspect_GradientBackground::SetColors ******/
		/****** md5 signature: ca78c9c4d4c2f941b5264058f8f3157f ******/
		%feature("compactdefaultargs") SetColors;
		%feature("autodoc", "
Parameters
----------
theColor1: Quantity_Color
theColor2: Quantity_Color
theMethod: Aspect_GradientFillMethod (optional, default to Aspect_GradientFillMethod_Horizontal)

Return
-------
None

Description
-----------
Modifies the colours of the window gradient background.
") SetColors;
		void SetColors(const Quantity_Color & theColor1, const Quantity_Color & theColor2, const Aspect_GradientFillMethod theMethod = Aspect_GradientFillMethod_Horizontal);

};


%extend Aspect_GradientBackground {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class Aspect_NeutralWindow *
*****************************/
/*****************************
* class Aspect_OpenVRSession *
*****************************/
class Aspect_OpenVRSession : public Aspect_XRSession {
	public:
		/****** Aspect_OpenVRSession::Aspect_OpenVRSession ******/
		/****** md5 signature: 8b3b2149154ace218f7a658179bb9520 ******/
		%feature("compactdefaultargs") Aspect_OpenVRSession;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") Aspect_OpenVRSession;
		 Aspect_OpenVRSession();

		/****** Aspect_OpenVRSession::Close ******/
		/****** md5 signature: 4de735fd8bf0e6124997cc52ee72b757 ******/
		%feature("compactdefaultargs") Close;
		%feature("autodoc", "Return
-------
None

Description
-----------
Release session.
") Close;
		void Close();

		/****** Aspect_OpenVRSession::EyeToHeadTransform ******/
		/****** md5 signature: f9fb2399ac1ba042cbffc8a8e49a2951 ******/
		%feature("compactdefaultargs") EyeToHeadTransform;
		%feature("autodoc", "
Parameters
----------
theEye: Aspect_Eye

Return
-------
NCollection_Mat4<double >

Description
-----------
Return transformation from eye to head. vr::GetEyeToHeadTransform() wrapper.
") EyeToHeadTransform;
		NCollection_Mat4<double > EyeToHeadTransform(Aspect_Eye theEye);

		/****** Aspect_OpenVRSession::GetAnalogActionData ******/
		/****** md5 signature: d224a8129375d6b888c7364d24c646d8 ******/
		%feature("compactdefaultargs") GetAnalogActionData;
		%feature("autodoc", "
Parameters
----------
theAction: Aspect_XRAction

Return
-------
Aspect_XRAnalogActionData

Description
-----------
Fetch data for analog input action (like axis).
") GetAnalogActionData;
		Aspect_XRAnalogActionData GetAnalogActionData(const opencascade::handle<Aspect_XRAction> & theAction);

		/****** Aspect_OpenVRSession::GetDigitalActionData ******/
		/****** md5 signature: 6b2a8e950af3cc10b70481feea861306 ******/
		%feature("compactdefaultargs") GetDigitalActionData;
		%feature("autodoc", "
Parameters
----------
theAction: Aspect_XRAction

Return
-------
Aspect_XRDigitalActionData

Description
-----------
Fetch data for digital input action (like button).
") GetDigitalActionData;
		Aspect_XRDigitalActionData GetDigitalActionData(const opencascade::handle<Aspect_XRAction> & theAction);

		/****** Aspect_OpenVRSession::GetPoseActionDataForNextFrame ******/
		/****** md5 signature: aabc8e1a97c8f56f65fd4781c29cd64a ******/
		%feature("compactdefaultargs") GetPoseActionDataForNextFrame;
		%feature("autodoc", "
Parameters
----------
theAction: Aspect_XRAction

Return
-------
Aspect_XRPoseActionData

Description
-----------
Fetch data for pose input action (like fingertip position).
") GetPoseActionDataForNextFrame;
		Aspect_XRPoseActionData GetPoseActionDataForNextFrame(const opencascade::handle<Aspect_XRAction> & theAction);

		/****** Aspect_OpenVRSession::GetString ******/
		/****** md5 signature: f93105549aa15a56fe14947cceaa6a98 ******/
		%feature("compactdefaultargs") GetString;
		%feature("autodoc", "
Parameters
----------
theInfo: InfoString

Return
-------
TCollection_AsciiString

Description
-----------
Query information.
") GetString;
		TCollection_AsciiString GetString(InfoString theInfo);

		/****** Aspect_OpenVRSession::HasProjectionFrustums ******/
		/****** md5 signature: eb8659d4e2dfa597bb426cdcfceaa3c2 ******/
		%feature("compactdefaultargs") HasProjectionFrustums;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True.
") HasProjectionFrustums;
		bool HasProjectionFrustums();

		/****** Aspect_OpenVRSession::IsHmdPresent ******/
		/****** md5 signature: 4d92006ecb61453020c0338ef46db688 ******/
		%feature("compactdefaultargs") IsHmdPresent;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if an HMD may be presented on the system (e.g. to show VR checkbox in application GUI). This is fast check, and even if it returns True, opening session may fail.
") IsHmdPresent;
		static bool IsHmdPresent();

		/****** Aspect_OpenVRSession::IsOpen ******/
		/****** md5 signature: 373d6e32555c047f85f430e9c00f8f98 ******/
		%feature("compactdefaultargs") IsOpen;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if session is opened.
") IsOpen;
		bool IsOpen();

		/****** Aspect_OpenVRSession::NamedTrackedDevice ******/
		/****** md5 signature: 1d9ab565c3526daefaa4e4fbe555ee24 ******/
		%feature("compactdefaultargs") NamedTrackedDevice;
		%feature("autodoc", "
Parameters
----------
theDevice: Aspect_XRTrackedDeviceRole

Return
-------
int

Description
-----------
Return index of tracked device of known role.
") NamedTrackedDevice;
		int NamedTrackedDevice(Aspect_XRTrackedDeviceRole theDevice);

		/****** Aspect_OpenVRSession::Open ******/
		/****** md5 signature: e30795a7ff463155c67eb132b44de9fd ******/
		%feature("compactdefaultargs") Open;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Initialize session.
") Open;
		bool Open();

		/****** Aspect_OpenVRSession::ProcessEvents ******/
		/****** md5 signature: 275b971d0a7415b80ee02f272e463499 ******/
		%feature("compactdefaultargs") ProcessEvents;
		%feature("autodoc", "Return
-------
None

Description
-----------
Receive XR events.
") ProcessEvents;
		void ProcessEvents();

		/****** Aspect_OpenVRSession::ProjectionMatrix ******/
		/****** md5 signature: 6eb38961f80ec0ee012475382883cbae ******/
		%feature("compactdefaultargs") ProjectionMatrix;
		%feature("autodoc", "
Parameters
----------
theEye: Aspect_Eye
theZNear: double
theZFar: double

Return
-------
NCollection_Mat4<double >

Description
-----------
Return projection matrix.
") ProjectionMatrix;
		NCollection_Mat4<double > ProjectionMatrix(Aspect_Eye theEye, double theZNear, double theZFar);

		/****** Aspect_OpenVRSession::RecommendedViewport ******/
		/****** md5 signature: 162ed79332ebc9b1cbf2b47dced30653 ******/
		%feature("compactdefaultargs") RecommendedViewport;
		%feature("autodoc", "Return
-------
NCollection_Vec2<int >

Description
-----------
Return recommended viewport Width x Height for rendering into VR.
") RecommendedViewport;
		NCollection_Vec2<int > RecommendedViewport();

		/****** Aspect_OpenVRSession::SetTrackingOrigin ******/
		/****** md5 signature: 2dbc70cb4d9b6e5063854ba33e981064 ******/
		%feature("compactdefaultargs") SetTrackingOrigin;
		%feature("autodoc", "
Parameters
----------
theOrigin: TrackingUniverseOrigin

Return
-------
None

Description
-----------
Set tracking origin.
") SetTrackingOrigin;
		void SetTrackingOrigin(TrackingUniverseOrigin theOrigin);

		/****** Aspect_OpenVRSession::SubmitEye ******/
		/****** md5 signature: 9423bb2f875c0e3e033a1c07e722a4ae ******/
		%feature("compactdefaultargs") SubmitEye;
		%feature("autodoc", "
Parameters
----------
theTexture: void *
theGraphicsLib: Aspect_GraphicsLibrary
theColorSpace: Aspect_ColorSpace
theEye: Aspect_Eye

Return
-------
bool

Description
-----------
Submit texture eye to XR Composer. 
Input parameter: theTexture texture handle 
Input parameter: theGraphicsLib graphics library in which texture handle is defined 
Input parameter: theColorSpace texture color space;  sRGB means no color conversion by composer;  Linear means to sRGB color conversion by composer 
Input parameter: theEye eye to display 
Return: False on error.
") SubmitEye;
		bool SubmitEye(void * theTexture, Aspect_GraphicsLibrary theGraphicsLib, Aspect_ColorSpace theColorSpace, Aspect_Eye theEye);

		/****** Aspect_OpenVRSession::WaitPoses ******/
		/****** md5 signature: 257903e39f469d5e5b2bab65708498cb ******/
		%feature("compactdefaultargs") WaitPoses;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Fetch actual poses of tracked devices.
") WaitPoses;
		bool WaitPoses();

};


%make_alias(Aspect_OpenVRSession)

%extend Aspect_OpenVRSession {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

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

@classnotwrapped
class Aspect_FrustumLRBT:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def Aspect_OpenVRSession_IsHmdPresent(*args):
	return Aspect_OpenVRSession.IsHmdPresent(*args)

}
