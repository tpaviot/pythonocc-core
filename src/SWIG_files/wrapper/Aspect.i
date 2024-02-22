/*
Copyright 2008-2023 Thomas Paviot (tpaviot@gmail.com)

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
https://www.opencascade.com/doc/occt-7.7.0/refman/html/package_aspect.html"
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


%{
#include<Aspect_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Quantity_module.hxx>
#include<gp_module.hxx>
#include<Graphic3d_module.hxx>
#include<TCollection_module.hxx>
#include<Image_module.hxx>
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
%import Graphic3d.i
%import TCollection.i
%import Image.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum  {
	Aspect_XRTrackedDeviceRole_NB = Aspect_XRTrackedDeviceRole_Other + 1,
};

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

enum Aspect_XRTrackedDeviceRole {
	Aspect_XRTrackedDeviceRole_Head = 0,
	Aspect_XRTrackedDeviceRole_LeftHand = 1,
	Aspect_XRTrackedDeviceRole_RightHand = 2,
	Aspect_XRTrackedDeviceRole_Other = 3,
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
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(Aspect_TouchMap) NCollection_IndexedDataMap<Standard_Size,Aspect_Touch>;
%template(Aspect_TrackedDevicePoseArray) NCollection_Array1<Aspect_TrackedDevicePose>;

%extend NCollection_Array1<Aspect_TrackedDevicePose> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(Aspect_XRActionMap) NCollection_IndexedDataMap<TCollection_AsciiString,opencascade::handle<Aspect_XRAction>,TCollection_AsciiString>;
%template(Aspect_XRActionSetMap) NCollection_IndexedDataMap<TCollection_AsciiString,opencascade::handle<Aspect_XRActionSet>,TCollection_AsciiString>;
/* end templates declaration */

/* typedefs */
typedef void * Aspect_Display;
typedef unsigned long Aspect_Drawable;
typedef GLXFBConfig Aspect_FBConfig;
typedef unsigned long Aspect_Handle;
typedef void * Aspect_RenderingContext;
typedef NCollection_Sequence<Quantity_Color> Aspect_SequenceOfColor;
typedef NCollection_IndexedDataMap<Standard_Size, Aspect_Touch> Aspect_TouchMap;
typedef NCollection_Array1<Aspect_TrackedDevicePose> Aspect_TrackedDevicePoseArray;
typedef unsigned int Aspect_VKey;
typedef unsigned int Aspect_VKeyFlags;
typedef unsigned int Aspect_VKeyMouse;
typedef NCollection_IndexedDataMap<TCollection_AsciiString, opencascade::handle<Aspect_XRAction>, TCollection_AsciiString> Aspect_XRActionMap;
typedef NCollection_IndexedDataMap<TCollection_AsciiString, opencascade::handle<Aspect_XRActionSet>, TCollection_AsciiString> Aspect_XRActionSetMap;
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
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a window background. default color: noc_matragray.
") Aspect_Background;
		 Aspect_Background();

		/****************** Aspect_Background ******************/
		/**** md5 signature: 5dbd53dd21ee3414ceec63d3dadf45f2 ****/
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
Creates a window background with the colour <acolor>.
") Aspect_Background;
		 Aspect_Background(const Quantity_Color & AColor);

		/****************** Color ******************/
		/**** md5 signature: b37a2e584a895a08fcf8ead60940b246 ****/
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
		/****************** SetColor ******************/
		/**** md5 signature: 5aebf70a123538e7dff670112c56db0d ****/
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
		/****************** GetDefaultFBConfig ******************/
		/**** md5 signature: 622b64beb2b73c32aace98cc90ab7793 ****/
		%feature("compactdefaultargs") GetDefaultFBConfig;
		%feature("autodoc", "Return
-------
Aspect_FBConfig

Description
-----------
Return native window fb config (glxfbconfig on xlib).
") GetDefaultFBConfig;
		Aspect_FBConfig GetDefaultFBConfig();

		/****************** GetDefaultVisualInfo ******************/
		/**** md5 signature: dde27c64c5cbb24e80531c18197370c1 ****/
		%feature("compactdefaultargs") GetDefaultVisualInfo;
		%feature("autodoc", "Return
-------
Aspect_XVisualInfo *

Description
-----------
Return default window visual or null when undefined.
") GetDefaultVisualInfo;
		Aspect_XVisualInfo * GetDefaultVisualInfo();

		/****************** GetDisplayAspect ******************/
		/**** md5 signature: b7c859e60cde1d6a2d363b0c0841abb9 ****/
		%feature("compactdefaultargs") GetDisplayAspect;
		%feature("autodoc", "Return
-------
Aspect_XDisplay *

Description
-----------
Return pointer to display structure that serves as the connection to the x server.
") GetDisplayAspect;
		Aspect_XDisplay * GetDisplayAspect();

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
		/****************** Aspect_GenId ******************/
		/**** md5 signature: 569c368c12c13ee3f3906663aa53662b ****/
		%feature("compactdefaultargs") Aspect_GenId;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an available set of identifiers with the lower bound 0 and the upper bound int_max / 2.
") Aspect_GenId;
		 Aspect_GenId();

		/****************** Aspect_GenId ******************/
		/**** md5 signature: 3f26c1994924a0cb83cef8d1c5e3f8d3 ****/
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
Creates an available set of identifiers with specified range. raises identdefinitionerror if theupper is less than thelow.
") Aspect_GenId;
		 Aspect_GenId(const Standard_Integer theLow, const Standard_Integer theUpper);

		/****************** Available ******************/
		/**** md5 signature: 697caaa4e9190a2cfddfe8f6ce24ea8c ****/
		%feature("compactdefaultargs") Available;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of available identifiers.
") Available;
		Standard_Integer Available();


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
		/****************** Free ******************/
		/**** md5 signature: adf04b00a0d9dc585c1f31bcdbc395bf ****/
		%feature("compactdefaultargs") Free;
		%feature("autodoc", "Return
-------
None

Description
-----------
Free all identifiers - make the whole range available again.
") Free;
		void Free();

		/****************** Free ******************/
		/**** md5 signature: 912044af0159c0455ab1de14a2ea922d ****/
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
Free specified identifier. warning - method has no protection against double-freeing!.
") Free;
		void Free(const Standard_Integer theId);

		/****************** HasFree ******************/
		/**** md5 signature: b1851639e312df8e9d1643954f18fb9e ****/
		%feature("compactdefaultargs") HasFree;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if there are available identifiers in range.
") HasFree;
		Standard_Boolean HasFree();

		/****************** Lower ******************/
		/**** md5 signature: a2a9f1c3c17fa0f26434aadaabeff45a ****/
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the lower identifier in range.
") Lower;
		Standard_Integer Lower();

		/****************** Next ******************/
		/**** md5 signature: e7361d634adcab8f63c24d757e1e478e ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the next available identifier. warning: raises identdefinitionerror if all identifiers are busy.
") Next;
		Standard_Integer Next();

		/****************** Next ******************/
		/**** md5 signature: 3fd1eee7f153c7ff797dea1b9f67ad85 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "
Parameters
----------

Return
-------
theId: int

Description
-----------
Generates the next available identifier. @param theid [out] generated identifier return false if all identifiers are busy.
") Next;
		Standard_Boolean Next(Standard_Integer &OutValue);

		/****************** Upper ******************/
		/**** md5 signature: 621f04fab59b49711e54299100973c4e ****/
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the upper identifier in range.
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
		%feature("autodoc", "Return
-------
None

Description
-----------
Activates the grid. the hit method will return gridx and gridx computed according to the steps of the grid.
") Activate;
		void Activate();

		/****************** Colors ******************/
		/**** md5 signature: febac332dabf87330fc8ae564a90811c ****/
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

		/****************** Compute ******************/
		/**** md5 signature: f2dc3bb20b3dea64f42829e338efc410 ****/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "
Parameters
----------
X: float
Y: float

Return
-------
gridX: float
gridY: float

Description
-----------
Returns the point of the grid the closest to the point x,y.
") Compute;
		virtual void Compute(const Standard_Real X, const Standard_Real Y, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Deactivate ******************/
		/**** md5 signature: d5b1d14a550597a64031c7a7feceee08 ****/
		%feature("compactdefaultargs") Deactivate;
		%feature("autodoc", "Return
-------
None

Description
-----------
Deactivates the grid. the hit method will return gridx and gridx as the enter value x & y.
") Deactivate;
		void Deactivate();

		/****************** Display ******************/
		/**** md5 signature: a5bb9d443eb910f59769ed67aea52525 ****/
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "Return
-------
None

Description
-----------
Display the grid at screen.
") Display;
		virtual void Display();

		/****************** DrawMode ******************/
		/**** md5 signature: 820acf5cdbd9b081ca2fdb9e8fa43978 ****/
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
		/****************** Erase ******************/
		/**** md5 signature: c55517fe39ff6c9fe42803167b097498 ****/
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "Return
-------
None

Description
-----------
Erase the grid from screen.
") Erase;
		virtual void Erase();

		/****************** Hit ******************/
		/**** md5 signature: a0d754d9f4e2a7f6a6b3cbe673f29375 ****/
		%feature("compactdefaultargs") Hit;
		%feature("autodoc", "
Parameters
----------
X: float
Y: float

Return
-------
gridX: float
gridY: float

Description
-----------
Returns the point of the grid the closest to the point x,y if the grid is active. if the grid is not active returns x,y.
") Hit;
		void Hit(const Standard_Real X, const Standard_Real Y, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Init ******************/
		/**** md5 signature: ae70d610df2081e50f19659c49fb9bd4 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Init;
		virtual void Init();

		/****************** IsActive ******************/
		/**** md5 signature: 1430a89053d4b0413f25b185201efe70 ****/
		%feature("compactdefaultargs") IsActive;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true when the grid is active.
") IsActive;
		Standard_Boolean IsActive();

		/****************** IsDisplayed ******************/
		/**** md5 signature: f0a946c4c132eaa80b7a2b5b8752ab0c ****/
		%feature("compactdefaultargs") IsDisplayed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true when the grid is displayed at screen.
") IsDisplayed;
		virtual Standard_Boolean IsDisplayed();

		/****************** Rotate ******************/
		/**** md5 signature: ba6155601a6a3ebf5db401b4fcb0cac9 ****/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "
Parameters
----------
anAngle: float

Return
-------
None

Description
-----------
Rotate the grid from a relative angle.
") Rotate;
		void Rotate(const Standard_Real anAngle);

		/****************** RotationAngle ******************/
		/**** md5 signature: 6c7adcb07df938548950d9bd86bc732a ****/
		%feature("compactdefaultargs") RotationAngle;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the x angle of the grid.
") RotationAngle;
		Standard_Real RotationAngle();

		/****************** SetColors ******************/
		/**** md5 signature: f81cf1490ceea17485c0de0269e7ec9c ****/
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

		/****************** SetDrawMode ******************/
		/**** md5 signature: ee6037d77208349cb9a8e316a9952fc6 ****/
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

		/****************** SetRotationAngle ******************/
		/**** md5 signature: f85165df588b8bb105e7c1fc95c0038c ****/
		%feature("compactdefaultargs") SetRotationAngle;
		%feature("autodoc", "
Parameters
----------
anAngle: float

Return
-------
None

Description
-----------
Defines the orientation of the grid.
") SetRotationAngle;
		void SetRotationAngle(const Standard_Real anAngle);

		/****************** SetXOrigin ******************/
		/**** md5 signature: 5f29e91eabd84d1fb448e2f1a42216fa ****/
		%feature("compactdefaultargs") SetXOrigin;
		%feature("autodoc", "
Parameters
----------
anOrigin: float

Return
-------
None

Description
-----------
Defines the x origin of the grid.
") SetXOrigin;
		void SetXOrigin(const Standard_Real anOrigin);

		/****************** SetYOrigin ******************/
		/**** md5 signature: 8ae28e02e415aeae0cabe4ebeb845aac ****/
		%feature("compactdefaultargs") SetYOrigin;
		%feature("autodoc", "
Parameters
----------
anOrigin: float

Return
-------
None

Description
-----------
Defines the y origin of the grid.
") SetYOrigin;
		void SetYOrigin(const Standard_Real anOrigin);

		/****************** Translate ******************/
		/**** md5 signature: 2c4d53c487acc4e66ea6ff494e659356 ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
aDx: float
aDy: float

Return
-------
None

Description
-----------
Translate the grid from a relative distance.
") Translate;
		void Translate(const Standard_Real aDx, const Standard_Real aDy);

		/****************** XOrigin ******************/
		/**** md5 signature: 2ca8cc35b96fb011ff973786f0ef31b1 ****/
		%feature("compactdefaultargs") XOrigin;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the x origin of the grid.
") XOrigin;
		Standard_Real XOrigin();

		/****************** YOrigin ******************/
		/**** md5 signature: 7f8bdf33836dd27df5ea3c3e718919d0 ****/
		%feature("compactdefaultargs") YOrigin;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the x origin of the grid.
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
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") Aspect_ScrollDelta;
		 Aspect_ScrollDelta();

		/****************** Aspect_ScrollDelta ******************/
		/**** md5 signature: f8460f2fd92f69dbd6ae1c79508cf38b ****/
		%feature("compactdefaultargs") Aspect_ScrollDelta;
		%feature("autodoc", "
Parameters
----------
thePnt: NCollection_Vec2<int>
theValue: float
theFlags: Aspect_VKeyFlags (optional, default to Aspect_VKeyFlags_NONE)

Return
-------
None

Description
-----------
Constructor.
") Aspect_ScrollDelta;
		 Aspect_ScrollDelta(const NCollection_Vec2<int> & thePnt, Standard_Real theValue, Aspect_VKeyFlags theFlags = Aspect_VKeyFlags_NONE);

		/****************** Aspect_ScrollDelta ******************/
		/**** md5 signature: 4c6a15a03d5e8065050d3ebd39119299 ****/
		%feature("compactdefaultargs") Aspect_ScrollDelta;
		%feature("autodoc", "
Parameters
----------
theValue: float
theFlags: Aspect_VKeyFlags (optional, default to Aspect_VKeyFlags_NONE)

Return
-------
None

Description
-----------
Constructor with undefined point.
") Aspect_ScrollDelta;
		 Aspect_ScrollDelta(Standard_Real theValue, Aspect_VKeyFlags theFlags = Aspect_VKeyFlags_NONE);

		/****************** HasPoint ******************/
		/**** md5 signature: 314e70d3c9f0b28261d75c0c6244be38 ****/
		%feature("compactdefaultargs") HasPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true if action has point defined.
") HasPoint;
		bool HasPoint();

		/****************** ResetPoint ******************/
		/**** md5 signature: d4f07a32710ac608e876db8058caee64 ****/
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
		/****************** Aspect_SkydomeBackground ******************/
		/**** md5 signature: 3c25f69c902a4ad07c515cd932d3d294 ****/
		%feature("compactdefaultargs") Aspect_SkydomeBackground;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a window skydome background. by default skydome is initialized with sun at its zenith (0.0, 1.0, 0.0), average clody (0.2), zero time parameter, zero fogginess, 512x512 texture size.
") Aspect_SkydomeBackground;
		 Aspect_SkydomeBackground();

		/****************** Aspect_SkydomeBackground ******************/
		/**** md5 signature: 3a75c743ed1f3d8ea420373174e19a33 ****/
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
Creates a window skydome background with given parameters. @param[in] thesundirection direction to the sun (moon). sun direction with negative y component  represents moon with (-x, -y, -z) direction. @param[in] thecloudiness cloud intensity, 0.0 means no clouds at all and 1.0 - high clody. @param[in] thetime time parameter of simulation. might be tweaked to slightly change appearance. @param[in] thefogginess fog intensity, 0.0 means no fog and 1.0 - high fogginess @param[in] thesize size of cubemap side in pixels.
") Aspect_SkydomeBackground;
		 Aspect_SkydomeBackground(const gp_Dir & theSunDirection, Standard_ShortReal theCloudiness, Standard_ShortReal theTime, Standard_ShortReal theFogginess, Standard_Integer theSize);

		/****************** Cloudiness ******************/
		/**** md5 signature: dc5cc52623d8691a38ed69cd8a0c18b7 ****/
		%feature("compactdefaultargs") Cloudiness;
		%feature("autodoc", "Return
-------
float

Description
-----------
Get cloud intensity. by default this value is 0.2 0.0 means no clouds at all and 1.0 - high clody.
") Cloudiness;
		Standard_ShortReal Cloudiness();


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
		/****************** Fogginess ******************/
		/**** md5 signature: c50b52b93dcf09580ca9736bc7f6571e ****/
		%feature("compactdefaultargs") Fogginess;
		%feature("autodoc", "Return
-------
float

Description
-----------
Get fog intensity. by default this value is 0.0 0.0 means no fog and 1.0 - high fogginess.
") Fogginess;
		Standard_ShortReal Fogginess();

		/****************** SetCloudiness ******************/
		/**** md5 signature: 920d86159a2674d4c13553ecbeb16824 ****/
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
Set cloud intensity. by default this value is 0.2 0.0 means no clouds at all and 1.0 - high clody.
") SetCloudiness;
		void SetCloudiness(Standard_ShortReal theCloudiness);

		/****************** SetFogginess ******************/
		/**** md5 signature: 96294984cc974e9ab6dd33824cb4a7b8 ****/
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
Set fog intensity. by default this value is 0.0 0.0 means no fog and 1.0 - high fogginess.
") SetFogginess;
		void SetFogginess(Standard_ShortReal theFogginess);

		/****************** SetSize ******************/
		/**** md5 signature: 5a379cce6c2fb68b87bbdd7ae6575397 ****/
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
Set size of cubemap. by default this value is 512.
") SetSize;
		void SetSize(Standard_Integer theSize);

		/****************** SetSunDirection ******************/
		/**** md5 signature: d85bbe95c7e3d45dd1408af0a7346203 ****/
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
Set sun direction. by default this value is (0, 1, 0) sun direction with negative y component represents moon with (-x, -y, -z) direction.
") SetSunDirection;
		void SetSunDirection(const gp_Dir & theSunDirection);

		/****************** SetTimeParameter ******************/
		/**** md5 signature: a44786d752ad3eaf0c2cb124be7e0294 ****/
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
Set time of cloud simulation. by default this value is 0.0 this value might be tweaked to slightly change appearance of clouds.
") SetTimeParameter;
		void SetTimeParameter(Standard_ShortReal theTime);

		/****************** Size ******************/
		/**** md5 signature: fe6e16e0f1e86558dd017c7384c76cd6 ****/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "Return
-------
int

Description
-----------
Get size of cubemap. by default this value is 512.
") Size;
		Standard_Integer Size();

		/****************** SunDirection ******************/
		/**** md5 signature: 468ebca31659264b29a8630921783c51 ****/
		%feature("compactdefaultargs") SunDirection;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
Get sun direction. by default this value is (0, 1, 0) sun direction with negative y component represents moon with (-x, -y, -z) direction.
") SunDirection;
		const gp_Dir SunDirection();

		/****************** TimeParameter ******************/
		/**** md5 signature: cab33c32ebd5264ea67ec9d3936a9232 ****/
		%feature("compactdefaultargs") TimeParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Get time of cloud simulation. by default this value is 0.0 this value might be tweaked to slightly change appearance of clouds.
") TimeParameter;
		Standard_ShortReal TimeParameter();

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
		bool IsPreciseDevice;
		/****************** Aspect_Touch ******************/
		/**** md5 signature: a51d1277d944673675b62a1916b1d065 ****/
		%feature("compactdefaultargs") Aspect_Touch;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") Aspect_Touch;
		 Aspect_Touch();

		/****************** Aspect_Touch ******************/
		/**** md5 signature: f577ccd3298bca230729e387e7c8ee22 ****/
		%feature("compactdefaultargs") Aspect_Touch;
		%feature("autodoc", "
Parameters
----------
thePnt: NCollection_Vec2<float>
theIsPreciseDevice: bool

Return
-------
None

Description
-----------
Constructor with initialization.
") Aspect_Touch;
		 Aspect_Touch(const NCollection_Vec2<Standard_Real> & thePnt, Standard_Boolean theIsPreciseDevice);

		/****************** Aspect_Touch ******************/
		/**** md5 signature: d7a9f77f97f217469aa14c1453a5ec71 ****/
		%feature("compactdefaultargs") Aspect_Touch;
		%feature("autodoc", "
Parameters
----------
theX: float
theY: float
theIsPreciseDevice: bool

Return
-------
None

Description
-----------
Constructor with initialization.
") Aspect_Touch;
		 Aspect_Touch(Standard_Real theX, Standard_Real theY, Standard_Boolean theIsPreciseDevice);

		/****************** Delta ******************/
		/**** md5 signature: 633ea93d8b8f65b7d72a9eb7e3592640 ****/
		%feature("compactdefaultargs") Delta;
		%feature("autodoc", "Return
-------
NCollection_Vec2<float >

Description
-----------
Return values delta.
") Delta;
		NCollection_Vec2<Standard_Real > Delta();

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
		gp_Trsf Orientation;
		gp_Vec Velocity;
		gp_Vec AngularVelocity;
		bool IsValidPose;
		bool IsConnectedDevice;
		/****************** Aspect_TrackedDevicePose ******************/
		/**** md5 signature: 02737e00df27ee4bc5574676177782f9 ****/
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
		/****************** Aspect_VKeySet ******************/
		/**** md5 signature: 8566e8fc57970db201c78c2232c80056 ****/
		%feature("compactdefaultargs") Aspect_VKeySet;
		%feature("autodoc", "Return
-------
None

Description
-----------
Main constructor.
") Aspect_VKeySet;
		 Aspect_VKeySet();

		/****************** DownTime ******************/
		/**** md5 signature: 3ce4407cc0d1bbc0d6555aa3d5a3e2b0 ****/
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

		/****************** HoldDuration ******************/
		/**** md5 signature: d3a6b36f0626be624be57b5a073be7fd ****/
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
Return duration of the button in pressed state. @param thekey key to check @param thetime current time (for computing duration from key down time) @param theduration key press duration return true if key was in pressed state.
") HoldDuration;
		bool HoldDuration(Aspect_VKey theKey, double theTime, Standard_Real &OutValue);

		/****************** HoldDuration ******************/
		/**** md5 signature: c1573ef0fa9ba2fd5946552e14276981 ****/
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
Return duration of the button in pressed state. @param thekey key to check @param thetime current time (for computing duration from key down time) @param theduration key press duration @param thepressure key pressure return true if key was in pressed state.
") HoldDuration;
		bool HoldDuration(Aspect_VKey theKey, double theTime, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** IsFreeKey ******************/
		/**** md5 signature: bbd218ecf93898ecf459b9331a00f136 ****/
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
Return true if key is in free state.
") IsFreeKey;
		bool IsFreeKey(Aspect_VKey theKey);

		/****************** IsKeyDown ******************/
		/**** md5 signature: 1c60f9b4e5ebb4fb8f0fb2113d64b286 ****/
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
Return true if key is in pressed state.
") IsKeyDown;
		bool IsKeyDown(Aspect_VKey theKey);

		/****************** KeyDown ******************/
		/**** md5 signature: 3009abb37f57f319280f9ae379b163aa ****/
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
Press key. @param thekey key pressed @param thetime event timestamp.
") KeyDown;
		void KeyDown(Aspect_VKey theKey, double theTime, double thePressure = 1.0);

		/****************** KeyFromAxis ******************/
		/**** md5 signature: 3db941cede9d9409a6324a91a2be5069 ****/
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

		/****************** KeyUp ******************/
		/**** md5 signature: d12e8a77599562d728d7ebfb35b14614 ****/
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
Release key. @param thekey key pressed @param thetime event timestamp.
") KeyUp;
		void KeyUp(Aspect_VKey theKey, double theTime);

		/****************** Modifiers ******************/
		/**** md5 signature: a988577c8f2d9e201ff486761a6a056b ****/
		%feature("compactdefaultargs") Modifiers;
		%feature("autodoc", "Return
-------
Aspect_VKeyFlags

Description
-----------
Return active modifiers.
") Modifiers;
		Aspect_VKeyFlags Modifiers();

		/****************** Mutex ******************/
		/**** md5 signature: 902e13b2343e132a88f2b4c5433ad6d8 ****/
		%feature("compactdefaultargs") Mutex;
		%feature("autodoc", "Return
-------
Standard_Mutex

Description
-----------
Return mutex for thread-safe updates. all operations in class implicitly locks this mutex, so this method could be used only for batch processing of keys.
") Mutex;
		Standard_Mutex & Mutex();

		/****************** Reset ******************/
		/**** md5 signature: 7beb446fe26b948f797f8de87e46c23d ****/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reset the key state into unpressed state.
") Reset;
		void Reset();

		/****************** TimeUp ******************/
		/**** md5 signature: 4131ea8db309e72b20edf20cb930f105 ****/
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
		/****************** Background ******************/
		/**** md5 signature: c745ba92fb6d5e6544856c59b201a620 ****/
		%feature("compactdefaultargs") Background;
		%feature("autodoc", "Return
-------
Aspect_Background

Description
-----------
Returns the window background.
") Background;
		Aspect_Background Background();

		/****************** BackgroundFillMethod ******************/
		/**** md5 signature: 3dc602ad8e5026afe96d15088c7b9833 ****/
		%feature("compactdefaultargs") BackgroundFillMethod;
		%feature("autodoc", "Return
-------
Aspect_FillMethod

Description
-----------
Returns the current image background fill mode.
") BackgroundFillMethod;
		Aspect_FillMethod BackgroundFillMethod();

		/****************** ConvertPointFromBacking ******************/
		/**** md5 signature: 621f59446c2c34234eba0b43cd724552 ****/
		%feature("compactdefaultargs") ConvertPointFromBacking;
		%feature("autodoc", "
Parameters
----------
thePnt: Graphic3d_Vec2d

Return
-------
Graphic3d_Vec2d

Description
-----------
Convert point from backing store units to logical units.
") ConvertPointFromBacking;
		virtual Graphic3d_Vec2d ConvertPointFromBacking(const Graphic3d_Vec2d & thePnt);

		/****************** ConvertPointToBacking ******************/
		/**** md5 signature: 37a4876c01cca0dee435e17d82ae73d5 ****/
		%feature("compactdefaultargs") ConvertPointToBacking;
		%feature("autodoc", "
Parameters
----------
thePnt: Graphic3d_Vec2d

Return
-------
Graphic3d_Vec2d

Description
-----------
Convert point from logical units into backing store units.
") ConvertPointToBacking;
		virtual Graphic3d_Vec2d ConvertPointToBacking(const Graphic3d_Vec2d & thePnt);

		/****************** DevicePixelRatio ******************/
		/**** md5 signature: 6492ff955dcc6243b26fa4c3bdea7bf0 ****/
		%feature("compactdefaultargs") DevicePixelRatio;
		%feature("autodoc", "Return
-------
float

Description
-----------
Return device pixel ratio (logical to backing store scale factor).
") DevicePixelRatio;
		virtual Standard_Real DevicePixelRatio();

		/****************** Dimensions ******************/
		/**** md5 signature: 7e270212c8ea0579f85528495512097b ****/
		%feature("compactdefaultargs") Dimensions;
		%feature("autodoc", "Return
-------
Graphic3d_Vec2i

Description
-----------
Returns window dimensions.
") Dimensions;
		Graphic3d_Vec2i Dimensions();

		/****************** DisplayConnection ******************/
		/**** md5 signature: 411dcd7f318927d5a5c6c027eda3726a ****/
		%feature("compactdefaultargs") DisplayConnection;
		%feature("autodoc", "Return
-------
opencascade::handle<Aspect_DisplayConnection>

Description
-----------
Returns connection to display or null.
") DisplayConnection;
		const opencascade::handle<Aspect_DisplayConnection> & DisplayConnection();

		/****************** DoMapping ******************/
		/**** md5 signature: bccedbb13c087bbcb0fdc2dc4be5fafa ****/
		%feature("compactdefaultargs") DoMapping;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Apply the mapping change to the window <self>. and returns true if the window is mapped at screen.
") DoMapping;
		virtual Standard_Boolean DoMapping();

		/****************** DoResize ******************/
		/**** md5 signature: 53e251c7364926b7f0881bdd95b8bb10 ****/
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
		/****************** GradientBackground ******************/
		/**** md5 signature: d48840592ec4f12118e8b8d065c33698 ****/
		%feature("compactdefaultargs") GradientBackground;
		%feature("autodoc", "Return
-------
Aspect_GradientBackground

Description
-----------
Returns the window gradient background.
") GradientBackground;
		Aspect_GradientBackground GradientBackground();

		/****************** InvalidateContent ******************/
		/**** md5 signature: c3842a52e192571bdc8176fffa5e2159 ****/
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
Invalidate entire window content. //! implementation is expected to allow calling this method from non-gui thread, e.g. by queuing exposure event into window message queue or in other thread-safe manner. //! optional display argument should be passed when called from non-gui thread on platforms implementing thread-unsafe connections to display. null can be passed instead otherwise.
") InvalidateContent;
		virtual void InvalidateContent(const opencascade::handle<Aspect_DisplayConnection> & theDisp);

		/****************** IsMapped ******************/
		/**** md5 signature: 4d5cfb66280177c9e63a17b79e45005f ****/
		%feature("compactdefaultargs") IsMapped;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the window <self> is opened and false if the window is closed.
") IsMapped;
		virtual Standard_Boolean IsMapped();

		/****************** IsVirtual ******************/
		/**** md5 signature: 6b108b5483133abeb2e67cd521931989 ****/
		%feature("compactdefaultargs") IsVirtual;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the window <self> is virtual.
") IsVirtual;
		Standard_Boolean IsVirtual();

		/****************** Map ******************/
		/**** md5 signature: 0e63cf65e00294792f8d62b1c43bea62 ****/
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "Return
-------
None

Description
-----------
Opens the window <self>.
") Map;
		virtual void Map();

		/****************** NativeFBConfig ******************/
		/**** md5 signature: 4c353bf7a84ef94261f833f6d54eaa5e ****/
		%feature("compactdefaultargs") NativeFBConfig;
		%feature("autodoc", "Return
-------
Aspect_FBConfig

Description
-----------
Returns native window fb config (glxfbconfig on xlib).
") NativeFBConfig;
		virtual Aspect_FBConfig NativeFBConfig();

		/****************** Position ******************/
		/**** md5 signature: 30fa6ef63eb4cfa1d4d0a6a072935a04 ****/
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
Returns the window position in pixel.
") Position;
		virtual void Position(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** Ratio ******************/
		/**** md5 signature: d40ca1d2627bbb87a34e5c89b2c7db06 ****/
		%feature("compactdefaultargs") Ratio;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the window ratio equal to the physical width/height dimensions.
") Ratio;
		virtual Standard_Real Ratio();

		/****************** SetBackground ******************/
		/**** md5 signature: 1060a0f428ba58a6057f242d39040d7b ****/
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

		/****************** SetBackground ******************/
		/**** md5 signature: cbe59d034bfe68360b6e7b8aeecdb1e1 ****/
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

		/****************** SetBackground ******************/
		/**** md5 signature: f4e2412715795dcef62591ecfa331106 ****/
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

		/****************** SetBackground ******************/
		/**** md5 signature: 333d66c15042163afcf370e304fa7b6a ****/
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

		/****************** SetTitle ******************/
		/**** md5 signature: e6432d7e27226322b8262b3f3f4d5a28 ****/
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

		/****************** SetVirtual ******************/
		/**** md5 signature: f013b7099e5195f3ad8ac5f9c350083a ****/
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
		void SetVirtual(const Standard_Boolean theVirtual);

		/****************** Size ******************/
		/**** md5 signature: 5ff69e0e67e54ec54de4bd366eb3aa6a ****/
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
Returns the window size in pixel.
") Size;
		virtual void Size(Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** TopLeft ******************/
		/**** md5 signature: 3da1646606e47f0bfb9b901a144b8b7a ****/
		%feature("compactdefaultargs") TopLeft;
		%feature("autodoc", "Return
-------
Graphic3d_Vec2i

Description
-----------
Returns window top-left corner.
") TopLeft;
		Graphic3d_Vec2i TopLeft();

		/****************** Unmap ******************/
		/**** md5 signature: 2681daf3d4beece6a894fb54cb645818 ****/
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
		/****************** AddTouchPoint ******************/
		/**** md5 signature: 93b82d6d34eb813c208bc4163ef671c4 ****/
		%feature("compactdefaultargs") AddTouchPoint;
		%feature("autodoc", "
Parameters
----------
theId: Standard_Size
thePnt: Graphic3d_Vec2d
theClearBefore: bool (optional, default to false)

Return
-------
None

Description
-----------
Add touch point with the given id. this method is expected to be called from ui thread. @param theid touch unique identifier @param thepnt touch coordinates @param theclearbefore if true previously registered touches will be removed.
") AddTouchPoint;
		virtual void AddTouchPoint(Standard_Size theId, const Graphic3d_Vec2d & thePnt, Standard_Boolean theClearBefore = false);

		/****************** Change3dMouseIsNoRotate ******************/
		/**** md5 signature: b2ff1af628a01e66606ed582c146ef69 ****/
		%feature("compactdefaultargs") Change3dMouseIsNoRotate;
		%feature("autodoc", "Return
-------
NCollection_Vec3<bool>

Description
-----------
Return 3d mouse rotation axes (tilt/roll/spin) ignore flag; (false, false, false) by default.
") Change3dMouseIsNoRotate;
		NCollection_Vec3<bool> & Change3dMouseIsNoRotate();

		/****************** Change3dMouseToReverse ******************/
		/**** md5 signature: 74994d53f8199fd2049bc1854acbcdb2 ****/
		%feature("compactdefaultargs") Change3dMouseToReverse;
		%feature("autodoc", "Return
-------
NCollection_Vec3<bool>

Description
-----------
Return 3d mouse rotation axes (tilt/roll/spin) reverse flag; (true, false, false) by default.
") Change3dMouseToReverse;
		NCollection_Vec3<bool> & Change3dMouseToReverse();

		/****************** ChangeKeys ******************/
		/**** md5 signature: 5ba331e57bcd00b6539ab5d9145324ac ****/
		%feature("compactdefaultargs") ChangeKeys;
		%feature("autodoc", "Return
-------
Aspect_VKeySet

Description
-----------
Return keyboard state.
") ChangeKeys;
		Aspect_VKeySet & ChangeKeys();

		/****************** EventTime ******************/
		/**** md5 signature: 6bdc5b17561b5be0e9e4dbdd76a72ace ****/
		%feature("compactdefaultargs") EventTime;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return event time (e.g. current time).
") EventTime;
		double EventTime();

		/****************** Get3dMouseIsNoRotate ******************/
		/**** md5 signature: ae14b65261c4d2a6b12679cc1f5c5ed4 ****/
		%feature("compactdefaultargs") Get3dMouseIsNoRotate;
		%feature("autodoc", "Return
-------
NCollection_Vec3<bool>

Description
-----------
Return 3d mouse rotation axes (tilt/roll/spin) ignore flag; (false, false, false) by default.
") Get3dMouseIsNoRotate;
		const NCollection_Vec3<bool> & Get3dMouseIsNoRotate();

		/****************** Get3dMouseRotationScale ******************/
		/**** md5 signature: 6e7927184907412546b0e3bf5c131f00 ****/
		%feature("compactdefaultargs") Get3dMouseRotationScale;
		%feature("autodoc", "Return
-------
float

Description
-----------
Return acceleration ratio for rotation event; 4.0 by default.
") Get3dMouseRotationScale;
		float Get3dMouseRotationScale();

		/****************** Get3dMouseToReverse ******************/
		/**** md5 signature: a365f1e9e4397aece1eb44aa7383f6d5 ****/
		%feature("compactdefaultargs") Get3dMouseToReverse;
		%feature("autodoc", "Return
-------
NCollection_Vec3<bool>

Description
-----------
Return 3d mouse rotation axes (tilt/roll/spin) reverse flag; (true, false, false) by default.
") Get3dMouseToReverse;
		const NCollection_Vec3<bool> & Get3dMouseToReverse();

		/****************** Get3dMouseTranslationScale ******************/
		/**** md5 signature: f426a4558b5227de61530d9d20b93e7e ****/
		%feature("compactdefaultargs") Get3dMouseTranslationScale;
		%feature("autodoc", "Return
-------
float

Description
-----------
Return acceleration ratio for translation event; 2.0 by default.
") Get3dMouseTranslationScale;
		float Get3dMouseTranslationScale();

		/****************** HasTouchPoints ******************/
		/**** md5 signature: f6532233e79841283a6d00ea2e7477d5 ****/
		%feature("compactdefaultargs") HasTouchPoints;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true if touches map is not empty.
") HasTouchPoints;
		bool HasTouchPoints();

		/****************** KeyDown ******************/
		/**** md5 signature: 5192d78be0f66dc0b2cf998103ed19af ****/
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
Press key. default implementation updates internal cache. @param thekey key pressed @param thetime event timestamp.
") KeyDown;
		virtual void KeyDown(Aspect_VKey theKey, double theTime, double thePressure = 1.0);

		/****************** KeyFromAxis ******************/
		/**** md5 signature: a8592c856484d5ea635556005b4dbf66 ****/
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
Simulate key up/down events from axis value. default implementation updates internal cache.
") KeyFromAxis;
		virtual void KeyFromAxis(Aspect_VKey theNegative, Aspect_VKey thePositive, double theTime, double thePressure);

		/****************** KeyUp ******************/
		/**** md5 signature: facf026fe52d5d68e622d779a08b26c3 ****/
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
Release key. default implementation updates internal cache. @param thekey key pressed @param thetime event timestamp.
") KeyUp;
		virtual void KeyUp(Aspect_VKey theKey, double theTime);

		/****************** Keys ******************/
		/**** md5 signature: 71088904ae13bced99cf6e1155c58478 ****/
		%feature("compactdefaultargs") Keys;
		%feature("autodoc", "Return
-------
Aspect_VKeySet

Description
-----------
Return keyboard state.
") Keys;
		const Aspect_VKeySet & Keys();

		/****************** LastMouseFlags ******************/
		/**** md5 signature: 891e38e0b645d78e87ef09c802ac2d63 ****/
		%feature("compactdefaultargs") LastMouseFlags;
		%feature("autodoc", "Return
-------
Aspect_VKeyFlags

Description
-----------
Return active key modifiers passed with last mouse event.
") LastMouseFlags;
		Aspect_VKeyFlags LastMouseFlags();

		/****************** LastMousePosition ******************/
		/**** md5 signature: 69040771a57339f922c8a0c6021122bb ****/
		%feature("compactdefaultargs") LastMousePosition;
		%feature("autodoc", "Return
-------
Graphic3d_Vec2i

Description
-----------
Return last mouse position.
") LastMousePosition;
		const Graphic3d_Vec2i & LastMousePosition();

		/****************** PressMouseButton ******************/
		/**** md5 signature: 3011ceaa0add6213ae689425180a9aab ****/
		%feature("compactdefaultargs") PressMouseButton;
		%feature("autodoc", "
Parameters
----------
thePoint: Graphic3d_Vec2i
theButton: Aspect_VKeyMouse
theModifiers: Aspect_VKeyFlags
theIsEmulated: bool

Return
-------
bool

Description
-----------
Handle mouse button press event. this method is expected to be called from ui thread. default implementation redirects to updatemouseposition(). @param thepoint mouse cursor position @param thebutton pressed button @param themodifiers key modifiers @param theisemulated if true then mouse event comes not from real mouse  but emulated from non-precise input like touch on screen return true if window content should be redrawn.
") PressMouseButton;
		bool PressMouseButton(const Graphic3d_Vec2i & thePoint, Aspect_VKeyMouse theButton, Aspect_VKeyFlags theModifiers, bool theIsEmulated);

		/****************** PressedMouseButtons ******************/
		/**** md5 signature: 28ea733557be0052235dc8a7fe3ed119 ****/
		%feature("compactdefaultargs") PressedMouseButtons;
		%feature("autodoc", "Return
-------
Aspect_VKeyMouse

Description
-----------
Return currently pressed mouse buttons.
") PressedMouseButtons;
		Aspect_VKeyMouse PressedMouseButtons();

		/****************** ProcessClose ******************/
		/**** md5 signature: 59654ad0d3a6816d4daa90e13a580cde ****/
		%feature("compactdefaultargs") ProcessClose;
		%feature("autodoc", "Return
-------
None

Description
-----------
Handle window close event.
") ProcessClose;
		virtual void ProcessClose();

		/****************** ProcessConfigure ******************/
		/**** md5 signature: ca30e387334b4284a619ea054d2c8c75 ****/
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

		/****************** ProcessExpose ******************/
		/**** md5 signature: f597030918979508d41a1535a55a52da ****/
		%feature("compactdefaultargs") ProcessExpose;
		%feature("autodoc", "Return
-------
None

Description
-----------
Handle expose event (window content has been invalidation and should be redrawn).
") ProcessExpose;
		virtual void ProcessExpose();

		/****************** ProcessFocus ******************/
		/**** md5 signature: 62ed591bdb7901b7386a340b9d7b2f9b ****/
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

		/****************** ProcessInput ******************/
		/**** md5 signature: 25eccaa30cc27b2a88e167899d319730 ****/
		%feature("compactdefaultargs") ProcessInput;
		%feature("autodoc", "Return
-------
None

Description
-----------
Handle window input event immediately (flush input buffer or ignore).
") ProcessInput;
		virtual void ProcessInput();

		/****************** ReleaseMouseButton ******************/
		/**** md5 signature: a9b43da8768564266828a78fde53802f ****/
		%feature("compactdefaultargs") ReleaseMouseButton;
		%feature("autodoc", "
Parameters
----------
thePoint: Graphic3d_Vec2i
theButton: Aspect_VKeyMouse
theModifiers: Aspect_VKeyFlags
theIsEmulated: bool

Return
-------
bool

Description
-----------
Handle mouse button release event. this method is expected to be called from ui thread. default implementation redirects to updatemouseposition(). @param thepoint mouse cursor position @param thebutton released button @param themodifiers key modifiers @param theisemulated if true then mouse event comes not from real mouse  but emulated from non-precise input like touch on screen return true if window content should be redrawn.
") ReleaseMouseButton;
		bool ReleaseMouseButton(const Graphic3d_Vec2i & thePoint, Aspect_VKeyMouse theButton, Aspect_VKeyFlags theModifiers, bool theIsEmulated);

		/****************** RemoveTouchPoint ******************/
		/**** md5 signature: 45c3401339716ca58b815f7e44a3d196 ****/
		%feature("compactdefaultargs") RemoveTouchPoint;
		%feature("autodoc", "
Parameters
----------
theId: Standard_Size
theClearSelectPnts: bool (optional, default to false)

Return
-------
bool

Description
-----------
Remove touch point with the given id. this method is expected to be called from ui thread. @param theid touch unique identifier @param theclearselectpnts if true will initiate clearing of selection points return true if point has been removed.
") RemoveTouchPoint;
		virtual bool RemoveTouchPoint(Standard_Size theId, Standard_Boolean theClearSelectPnts = false);

		/****************** Set3dMousePreciseInput ******************/
		/**** md5 signature: 0ff4172c7dce21c124fb3941d21634cd ****/
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

		/****************** Set3dMouseRotationScale ******************/
		/**** md5 signature: 26cc1d3413bc1ed0806210cb74503bf8 ****/
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

		/****************** Set3dMouseTranslationScale ******************/
		/**** md5 signature: d66cf6c87510f4cf28118e77235f6dc1 ****/
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

		/****************** To3dMousePreciseInput ******************/
		/**** md5 signature: e7d1cbbce6f739652fb2dcffebfdc574 ****/
		%feature("compactdefaultargs") To3dMousePreciseInput;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return quadric acceleration flag; true by default.
") To3dMousePreciseInput;
		bool To3dMousePreciseInput();

		/****************** TouchPoints ******************/
		/**** md5 signature: aae5a0777c45c41be0cc42d98cb8d6a5 ****/
		%feature("compactdefaultargs") TouchPoints;
		%feature("autodoc", "Return
-------
Aspect_TouchMap

Description
-----------
Return map of active touches.
") TouchPoints;
		const Aspect_TouchMap & TouchPoints();

		/****************** Update3dMouse ******************/
		/**** md5 signature: 989c941c2b66167e2e5fa84999e81fe3 ****/
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

		/****************** UpdateMouseButtons ******************/
		/**** md5 signature: 344a32c08e48df63d66f82e75f14f4ac ****/
		%feature("compactdefaultargs") UpdateMouseButtons;
		%feature("autodoc", "
Parameters
----------
thePoint: Graphic3d_Vec2i
theButtons: Aspect_VKeyMouse
theModifiers: Aspect_VKeyFlags
theIsEmulated: bool

Return
-------
bool

Description
-----------
Handle mouse button press/release event. this method is expected to be called from ui thread. @param thepoint mouse cursor position @param thebuttons pressed buttons @param themodifiers key modifiers @param theisemulated if true then mouse event comes not from real mouse  but emulated from non-precise input like touch on screen return true if window content should be redrawn.
") UpdateMouseButtons;
		virtual bool UpdateMouseButtons(const Graphic3d_Vec2i & thePoint, Aspect_VKeyMouse theButtons, Aspect_VKeyFlags theModifiers, bool theIsEmulated);

		/****************** UpdateMousePosition ******************/
		/**** md5 signature: 217f410d7de77f6f79b905cc2f67eaf4 ****/
		%feature("compactdefaultargs") UpdateMousePosition;
		%feature("autodoc", "
Parameters
----------
thePoint: Graphic3d_Vec2i
theButtons: Aspect_VKeyMouse
theModifiers: Aspect_VKeyFlags
theIsEmulated: bool

Return
-------
bool

Description
-----------
Handle mouse cursor movement event. this method is expected to be called from ui thread. default implementation does nothing. @param thepoint mouse cursor position @param thebuttons pressed buttons @param themodifiers key modifiers @param theisemulated if true then mouse event comes not from real mouse  but emulated from non-precise input like touch on screen return true if window content should be redrawn.
") UpdateMousePosition;
		virtual bool UpdateMousePosition(const Graphic3d_Vec2i & thePoint, Aspect_VKeyMouse theButtons, Aspect_VKeyFlags theModifiers, bool theIsEmulated);

		/****************** UpdateMouseScroll ******************/
		/**** md5 signature: 33a1d2af16e7dcdaa2ec2c0ec68a7748 ****/
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
Update mouse scroll event. this method is expected to be called from ui thread. @param thedelta mouse cursor position and delta return true if new event has been created or false if existing one has been updated.
") UpdateMouseScroll;
		virtual bool UpdateMouseScroll(const Aspect_ScrollDelta & theDelta);

		/****************** UpdateTouchPoint ******************/
		/**** md5 signature: 32b5b3a5782487b44b49157cf52c6e04 ****/
		%feature("compactdefaultargs") UpdateTouchPoint;
		%feature("autodoc", "
Parameters
----------
theId: Standard_Size
thePnt: Graphic3d_Vec2d

Return
-------
None

Description
-----------
Update touch point with the given id. if point with specified id was not registered before, it will be added. this method is expected to be called from ui thread. @param theid touch unique identifier @param thepnt touch coordinates.
") UpdateTouchPoint;
		virtual void UpdateTouchPoint(Standard_Size theId, const Graphic3d_Vec2d & thePnt);

		/****************** update3dMouseKeys ******************/
		/**** md5 signature: 7068d4e0858b2659de00f111094ecc7f ****/
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

		/****************** update3dMouseRotation ******************/
		/**** md5 signature: 0e88dd09859b6f02e48c9b73ec73f69b ****/
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

		/****************** update3dMouseTranslation ******************/
		/**** md5 signature: c826319c70a567fbe2c3401c0a5c2471 ****/
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
		/****************** Aspect_XRAction ******************/
		/**** md5 signature: 40a266a780195e2fd6ebc2e8b13a5281 ****/
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

		/****************** Id ******************/
		/**** md5 signature: 932272b78b9184cc2485436a72cc2df4 ****/
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Return action id.
") Id;
		const TCollection_AsciiString & Id();

		/****************** IsValid ******************/
		/**** md5 signature: 735088818cf24ebe0ebc7005a507da69 ****/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true if action is defined.
") IsValid;
		bool IsValid();

		/****************** RawHandle ******************/
		/**** md5 signature: 9d20e0a6fff437dc17426cf4e026b189 ****/
		%feature("compactdefaultargs") RawHandle;
		%feature("autodoc", "Return
-------
uint64_t

Description
-----------
Return action handle.
") RawHandle;
		uint64_t RawHandle();

		/****************** SetRawHandle ******************/
		/**** md5 signature: deb51d9baa50e7628d1bd2ab92c27b11 ****/
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

		/****************** Type ******************/
		/**** md5 signature: 0d72e5323e44404dea40a38f3ba7d11c ****/
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
		/****************** Aspect_XRActionSet ******************/
		/**** md5 signature: d45a5ec20e38bdb339eb2ee8d975e996 ****/
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

		/****************** Actions ******************/
		/**** md5 signature: 8711ba344778f38c5ecdfeccb1ff6133 ****/
		%feature("compactdefaultargs") Actions;
		%feature("autodoc", "Return
-------
Aspect_XRActionMap

Description
-----------
Return map of actions.
") Actions;
		const Aspect_XRActionMap & Actions();

		/****************** AddAction ******************/
		/**** md5 signature: 41c9367a03de48c635cea24270f2015a ****/
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

		/****************** Id ******************/
		/**** md5 signature: 932272b78b9184cc2485436a72cc2df4 ****/
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Return action id.
") Id;
		const TCollection_AsciiString & Id();

		/****************** RawHandle ******************/
		/**** md5 signature: 9d20e0a6fff437dc17426cf4e026b189 ****/
		%feature("compactdefaultargs") RawHandle;
		%feature("autodoc", "Return
-------
uint64_t

Description
-----------
Return action handle.
") RawHandle;
		uint64_t RawHandle();

		/****************** SetRawHandle ******************/
		/**** md5 signature: deb51d9baa50e7628d1bd2ab92c27b11 ****/
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
		uint64_t ActiveOrigin;
		float UpdateTime;
		NCollection_Vec3<float > VecXYZ;
		NCollection_Vec3<float > DeltaXYZ;
		bool IsActive;
		/****************** Aspect_XRAnalogActionData ******************/
		/**** md5 signature: 2f2cb24f7e51cc622f48142c162305a9 ****/
		%feature("compactdefaultargs") Aspect_XRAnalogActionData;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") Aspect_XRAnalogActionData;
		 Aspect_XRAnalogActionData();

		/****************** IsChanged ******************/
		/**** md5 signature: 6d97ce9bcd3b0740efa5aa99476487a7 ****/
		%feature("compactdefaultargs") IsChanged;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true if delta is non-zero.
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
		uint64_t ActiveOrigin;
		float UpdateTime;
		bool IsActive;
		bool IsPressed;
		bool IsChanged;
		/****************** Aspect_XRDigitalActionData ******************/
		/**** md5 signature: 11e9cfb288833ee07981b262b013a14e ****/
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
		float Delay;
		float Duration;
		float Frequency;
		float Amplitude;
		/****************** Aspect_XRHapticActionData ******************/
		/**** md5 signature: c42f3b26d235df1234aa3b319bd587d7 ****/
		%feature("compactdefaultargs") Aspect_XRHapticActionData;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") Aspect_XRHapticActionData;
		 Aspect_XRHapticActionData();

		/****************** IsValid ******************/
		/**** md5 signature: 735088818cf24ebe0ebc7005a507da69 ****/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true if data is not empty.
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
		Aspect_TrackedDevicePose Pose;
		uint64_t ActiveOrigin;
		bool IsActive;
		/****************** Aspect_XRPoseActionData ******************/
		/**** md5 signature: 37cbeeeffeaedd7d742097ec767fe262 ****/
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
enum InfoString {
	InfoString_Vendor = 0,
	InfoString_Device = 1,
	InfoString_Tracker = 2,
	InfoString_SerialNumber = 3,
};

enum TrackingUniverseOrigin {
	TrackingUniverseOrigin_Seated = 0,
	TrackingUniverseOrigin_Standing = 1,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class InfoString(IntEnum):
	InfoString_Vendor = 0
	InfoString_Device = 1
	InfoString_Tracker = 2
	InfoString_SerialNumber = 3
InfoString_Vendor = InfoString.InfoString_Vendor
InfoString_Device = InfoString.InfoString_Device
InfoString_Tracker = InfoString.InfoString_Tracker
InfoString_SerialNumber = InfoString.InfoString_SerialNumber

class TrackingUniverseOrigin(IntEnum):
	TrackingUniverseOrigin_Seated = 0
	TrackingUniverseOrigin_Standing = 1
TrackingUniverseOrigin_Seated = TrackingUniverseOrigin.TrackingUniverseOrigin_Seated
TrackingUniverseOrigin_Standing = TrackingUniverseOrigin.TrackingUniverseOrigin_Standing
};
/* end python proxy for enums */

		/****************** AbortHapticVibrationAction ******************/
		/**** md5 signature: 2c091ce7d5b95edbd8b37ef2a7d5033f ****/
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

		/****************** Aspect ******************/
		/**** md5 signature: 2e31d5d4e9d98682a1043fbc438ab30a ****/
		%feature("compactdefaultargs") Aspect;
		%feature("autodoc", "Return
-------
float

Description
-----------
Return aspect ratio.
") Aspect;
		Standard_Real Aspect();

		/****************** Close ******************/
		/**** md5 signature: 1b03fb860325770bc6fb04462ecfd6fe ****/
		%feature("compactdefaultargs") Close;
		%feature("autodoc", "Return
-------
None

Description
-----------
Release session.
") Close;
		virtual void Close();

		/****************** DisplayFrequency ******************/
		/**** md5 signature: 7bc433f33163de75c917820a29539856 ****/
		%feature("compactdefaultargs") DisplayFrequency;
		%feature("autodoc", "Return
-------
float

Description
-----------
Return display frequency or 0 if unknown.
") DisplayFrequency;
		Standard_ShortReal DisplayFrequency();

		/****************** EyeToHeadTransform ******************/
		/**** md5 signature: f29783bde9cca028ac265ae76bdafba8 ****/
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

		/****************** FieldOfView ******************/
		/**** md5 signature: db3c9855b4bf6bb7c82f4c6a1b35efb3 ****/
		%feature("compactdefaultargs") FieldOfView;
		%feature("autodoc", "Return
-------
float

Description
-----------
Return field of view.
") FieldOfView;
		Standard_Real FieldOfView();

		/****************** GenericAction ******************/
		/**** md5 signature: 7b32709a9882affc64e34a4979e4522d ****/
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
Return generic action for specific hand or null if undefined.
") GenericAction;
		const opencascade::handle<Aspect_XRAction> & GenericAction(Aspect_XRTrackedDeviceRole theDevice, Aspect_XRGenericAction theAction);

		/****************** GetAnalogActionData ******************/
		/**** md5 signature: 8ba907292e43d1a641030bff3bf5b326 ****/
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
Fetch data for digital input action (like axis). @param theaction [in] action of aspect_xractiontype_inputanalog type.
") GetAnalogActionData;
		virtual Aspect_XRAnalogActionData GetAnalogActionData(const opencascade::handle<Aspect_XRAction> & theAction);

		/****************** GetDigitalActionData ******************/
		/**** md5 signature: 481010d4545a367f4cd3dfec52bd745b ****/
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
Fetch data for digital input action (like button). @param theaction [in] action of aspect_xractiontype_inputdigital type.
") GetDigitalActionData;
		virtual Aspect_XRDigitalActionData GetDigitalActionData(const opencascade::handle<Aspect_XRAction> & theAction);

		/****************** GetPoseActionDataForNextFrame ******************/
		/**** md5 signature: 98eeea2ec9abd109afa8aea11fadf00d ****/
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
Fetch data for pose input action (like fingertip position). the returned values will match the values returned by the last call to waitposes(). @param theaction [in] action of aspect_xractiontype_inputpose type.
") GetPoseActionDataForNextFrame;
		virtual Aspect_XRPoseActionData GetPoseActionDataForNextFrame(const opencascade::handle<Aspect_XRAction> & theAction);

		/****************** GetString ******************/
		/**** md5 signature: 995a5d10180a3ba1d11d529669c70c62 ****/
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

		/****************** HasProjectionFrustums ******************/
		/**** md5 signature: b21c3c98901bb0d2fe751c0f535b874e ****/
		%feature("compactdefaultargs") HasProjectionFrustums;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return false if projection frustums are unsupported and general 4x4 projection matrix should be fetched instead.
") HasProjectionFrustums;
		virtual bool HasProjectionFrustums();

		/****************** HasTrackedPose ******************/
		/**** md5 signature: dcd15c00cc4b480b4c1512a9d69b0c35 ****/
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
Return true if device orientation is defined.
") HasTrackedPose;
		bool HasTrackedPose(Standard_Integer theDevice);

		/****************** HeadPose ******************/
		/**** md5 signature: d492f7441f83aa8c0f430cdab6e86f73 ****/
		%feature("compactdefaultargs") HeadPose;
		%feature("autodoc", "Return
-------
gp_Trsf

Description
-----------
Return head orientation in right-handed system: +y is up +x is to the right -z is forward distance unit is meters by default (@sa unitfactor()).
") HeadPose;
		const gp_Trsf HeadPose();

		/****************** HeadToEyeTransform ******************/
		/**** md5 signature: eefc127028406cfe34b43880dc164bed ****/
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

		/****************** IOD ******************/
		/**** md5 signature: 0cc7208beeec9544d745fd8edb710bd8 ****/
		%feature("compactdefaultargs") IOD;
		%feature("autodoc", "Return
-------
float

Description
-----------
Return intra-ocular distance (iod); also known as interpupillary distance (ipd). defined in meters by default (@sa unitfactor()).
") IOD;
		Standard_Real IOD();

		/****************** IsOpen ******************/
		/**** md5 signature: cbb165b1058ff52986668925b81dfa08 ****/
		%feature("compactdefaultargs") IsOpen;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true if session is opened.
") IsOpen;
		virtual bool IsOpen();

		/****************** LeftHandPose ******************/
		/**** md5 signature: ff3b4ff1b6e9278d95fc3d221947728e ****/
		%feature("compactdefaultargs") LeftHandPose;
		%feature("autodoc", "Return
-------
gp_Trsf

Description
-----------
Return left hand orientation.
") LeftHandPose;
		gp_Trsf LeftHandPose();

		/****************** LoadRenderModel ******************/
		/**** md5 signature: bff61e6a6656e5eb23f9e9b72f8fdb71 ****/
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
Load model for displaying device. @param thedevice [in] device index @param thetexture [out] texture source return model triangulation or null if not found.
") LoadRenderModel;
		opencascade::handle<Graphic3d_ArrayOfTriangles> LoadRenderModel(Standard_Integer theDevice, opencascade::handle<Image_Texture> & theTexture);

		/****************** LoadRenderModel ******************/
		/**** md5 signature: c440d49a8c5ac84455fadd4495c2ab80 ****/
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
Load model for displaying device. @param thedevice [in] device index @param thetoapplyunitfactor [in] flag to apply unit scale factor @param thetexture [out] texture source return model triangulation or null if not found.
") LoadRenderModel;
		opencascade::handle<Graphic3d_ArrayOfTriangles> LoadRenderModel(Standard_Integer theDevice, Standard_Boolean theToApplyUnitFactor, opencascade::handle<Image_Texture> & theTexture);

		/****************** NamedTrackedDevice ******************/
		/**** md5 signature: 6224d7e8e485715e872fc28cc2afe1f0 ****/
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
		virtual Standard_Integer NamedTrackedDevice(Aspect_XRTrackedDeviceRole theDevice);

		/****************** Open ******************/
		/**** md5 signature: d00ec1bf018b5e93ac2a5d97d9dde636 ****/
		%feature("compactdefaultargs") Open;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Initialize session.
") Open;
		virtual bool Open();

		/****************** ProcessEvents ******************/
		/**** md5 signature: 240ee1d1e4a0e42cba1c56aac9611f29 ****/
		%feature("compactdefaultargs") ProcessEvents;
		%feature("autodoc", "Return
-------
None

Description
-----------
Receive xr events.
") ProcessEvents;
		virtual void ProcessEvents();

		/****************** ProjectionFrustum ******************/
		/**** md5 signature: 9dc4ecde0b8d7e55944cdeade4e5bbf9 ****/
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
Return projection frustum. @sa hasprojectionfrustums().
") ProjectionFrustum;
		const Aspect_FrustumLRBT<double> & ProjectionFrustum(Aspect_Eye theEye);

		/****************** ProjectionMatrix ******************/
		/**** md5 signature: 5da23c248f3062bca81dea5a0b78608f ****/
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

		/****************** RecommendedViewport ******************/
		/**** md5 signature: 1072307c44dc5ac0c775b17e1c89ea5c ****/
		%feature("compactdefaultargs") RecommendedViewport;
		%feature("autodoc", "Return
-------
NCollection_Vec2<int >

Description
-----------
Return recommended viewport width x height for rendering into vr.
") RecommendedViewport;
		virtual NCollection_Vec2<int > RecommendedViewport();

		/****************** RightHandPose ******************/
		/**** md5 signature: b997db6d22c5309fef58aaa7a85929a9 ****/
		%feature("compactdefaultargs") RightHandPose;
		%feature("autodoc", "Return
-------
gp_Trsf

Description
-----------
Return right hand orientation.
") RightHandPose;
		gp_Trsf RightHandPose();

		/****************** SetTrackingOrigin ******************/
		/**** md5 signature: c5848a9d52580d64afea846e587f5e68 ****/
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

		/****************** SetUnitFactor ******************/
		/**** md5 signature: 7440cb148f828c471e5d9b5248eb7c9b ****/
		%feature("compactdefaultargs") SetUnitFactor;
		%feature("autodoc", "
Parameters
----------
theFactor: float

Return
-------
None

Description
-----------
Set unit scale factor.
") SetUnitFactor;
		void SetUnitFactor(Standard_Real theFactor);

		/****************** SubmitEye ******************/
		/**** md5 signature: e715d68400865ca08b80b6b4be7a6117 ****/
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
Submit texture eye to xr composer. @param thetexture [in] texture handle @param thegraphicslib [in] graphics library in which texture handle is defined @param thecolorspace [in] texture color space;  srgb means no color conversion by composer;  linear means to srgb color conversion by composer @param theeye [in] eye to display return false on error.
") SubmitEye;
		virtual bool SubmitEye(void * theTexture, Aspect_GraphicsLibrary theGraphicsLib, Aspect_ColorSpace theColorSpace, Aspect_Eye theEye);

		/****************** TrackedPoses ******************/
		/**** md5 signature: 1e6c5e707589403f73daf6e2bdd7bf60 ****/
		%feature("compactdefaultargs") TrackedPoses;
		%feature("autodoc", "Return
-------
Aspect_TrackedDevicePoseArray

Description
-----------
Return number of tracked poses array.
") TrackedPoses;
		const Aspect_TrackedDevicePoseArray & TrackedPoses();

		/****************** TrackingOrigin ******************/
		/**** md5 signature: db35db8c9365604e0d9a180025f9d9da ****/
		%feature("compactdefaultargs") TrackingOrigin;
		%feature("autodoc", "Return
-------
Aspect_XRSession::TrackingUniverseOrigin

Description
-----------
Return tracking origin.
") TrackingOrigin;
		Aspect_XRSession::TrackingUniverseOrigin TrackingOrigin();

		/****************** TriggerHapticVibrationAction ******************/
		/**** md5 signature: 039fc9219b24c9a39bd343511f01b47b ****/
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

		/****************** UnitFactor ******************/
		/**** md5 signature: ef896b413f2d707283340a4407bd979a ****/
		%feature("compactdefaultargs") UnitFactor;
		%feature("autodoc", "Return
-------
float

Description
-----------
Return unit scale factor defined as scale factor for m (meters); 1.0 by default.
") UnitFactor;
		Standard_Real UnitFactor();

		/****************** WaitPoses ******************/
		/**** md5 signature: 2cd6ece8094e306806174f976e95a323 ****/
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
		/****************** Aspect_GradientBackground ******************/
		/**** md5 signature: 2a3b12e3984621a36868307403d00696 ****/
		%feature("compactdefaultargs") Aspect_GradientBackground;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a window gradient background. default color is quantity_noc_black. default fill method is aspect_gradientfillmethod_none.
") Aspect_GradientBackground;
		 Aspect_GradientBackground();

		/****************** Aspect_GradientBackground ******************/
		/**** md5 signature: 85f06b5f3ce72c2ed98cd0a1aa2d2a99 ****/
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

		/****************** BgGradientFillMethod ******************/
		/**** md5 signature: 7ed50907542306114d5e90acbea724cc ****/
		%feature("compactdefaultargs") BgGradientFillMethod;
		%feature("autodoc", "Return
-------
Aspect_GradientFillMethod

Description
-----------
Returns the current gradient background fill mode.
") BgGradientFillMethod;
		Aspect_GradientFillMethod BgGradientFillMethod();

		/****************** Colors ******************/
		/**** md5 signature: 2e3f4d55b92b83e682d47f9e5901fc34 ****/
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
		/****************** SetColors ******************/
		/**** md5 signature: ca78c9c4d4c2f941b5264058f8f3157f ****/
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
		/****************** Aspect_OpenVRSession ******************/
		/**** md5 signature: 8b3b2149154ace218f7a658179bb9520 ****/
		%feature("compactdefaultargs") Aspect_OpenVRSession;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") Aspect_OpenVRSession;
		 Aspect_OpenVRSession();

		/****************** Close ******************/
		/**** md5 signature: af3f9495fd31a183ccb17c90b08cd92c ****/
		%feature("compactdefaultargs") Close;
		%feature("autodoc", "Return
-------
None

Description
-----------
Release session.
") Close;
		virtual void Close();

		/****************** EyeToHeadTransform ******************/
		/**** md5 signature: 4415cbfdc523c9bc0033cf691701a27a ****/
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
Return transformation from eye to head. vr::geteyetoheadtransform() wrapper.
") EyeToHeadTransform;
		virtual NCollection_Mat4<double > EyeToHeadTransform(Aspect_Eye theEye);

		/****************** GetAnalogActionData ******************/
		/**** md5 signature: 7774d891f52d1f379e2c6300ddcfa99c ****/
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
		virtual Aspect_XRAnalogActionData GetAnalogActionData(const opencascade::handle<Aspect_XRAction> & theAction);

		/****************** GetDigitalActionData ******************/
		/**** md5 signature: 62087c046bab5d0c5cfd257afcb1772b ****/
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
		virtual Aspect_XRDigitalActionData GetDigitalActionData(const opencascade::handle<Aspect_XRAction> & theAction);

		/****************** GetPoseActionDataForNextFrame ******************/
		/**** md5 signature: 94b2429e28b3df982111ec7a8efde11d ****/
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
		virtual Aspect_XRPoseActionData GetPoseActionDataForNextFrame(const opencascade::handle<Aspect_XRAction> & theAction);

		/****************** GetString ******************/
		/**** md5 signature: 3a5fdf2eb740dfbb9e9ab8002cc6ed4f ****/
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

		/****************** HasProjectionFrustums ******************/
		/**** md5 signature: b05b67863b5b65463aa7504a39e5d4ea ****/
		%feature("compactdefaultargs") HasProjectionFrustums;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true.
") HasProjectionFrustums;
		virtual bool HasProjectionFrustums();

		/****************** IsHmdPresent ******************/
		/**** md5 signature: 4d92006ecb61453020c0338ef46db688 ****/
		%feature("compactdefaultargs") IsHmdPresent;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true if an hmd may be presented on the system (e.g. to show vr checkbox in application gui). this is fast check, and even if it returns true, opening session may fail.
") IsHmdPresent;
		static bool IsHmdPresent();

		/****************** IsOpen ******************/
		/**** md5 signature: 207917360702df01f95e48cf1c178d3d ****/
		%feature("compactdefaultargs") IsOpen;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true if session is opened.
") IsOpen;
		virtual bool IsOpen();

		/****************** NamedTrackedDevice ******************/
		/**** md5 signature: fd01aebe7b7d48f130828b68b0d31a8b ****/
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
		virtual Standard_Integer NamedTrackedDevice(Aspect_XRTrackedDeviceRole theDevice);

		/****************** Open ******************/
		/**** md5 signature: 46feeb1ae37ec453aafb34d187389cb4 ****/
		%feature("compactdefaultargs") Open;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Initialize session.
") Open;
		virtual bool Open();

		/****************** ProcessEvents ******************/
		/**** md5 signature: 2a27463c633ed52dfa06a85b1bab9a97 ****/
		%feature("compactdefaultargs") ProcessEvents;
		%feature("autodoc", "Return
-------
None

Description
-----------
Receive xr events.
") ProcessEvents;
		virtual void ProcessEvents();

		/****************** ProjectionMatrix ******************/
		/**** md5 signature: 1e7c67acc983090242ecfc7d738f648b ****/
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

		/****************** RecommendedViewport ******************/
		/**** md5 signature: 67fa46d4104407c65ef24f06d7830ce5 ****/
		%feature("compactdefaultargs") RecommendedViewport;
		%feature("autodoc", "Return
-------
NCollection_Vec2<int >

Description
-----------
Return recommended viewport width x height for rendering into vr.
") RecommendedViewport;
		virtual NCollection_Vec2<int > RecommendedViewport();

		/****************** SetTrackingOrigin ******************/
		/**** md5 signature: 76cb2a6b6235da6e0398fa78d9f5cc46 ****/
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

		/****************** SubmitEye ******************/
		/**** md5 signature: 7a622ff719a9418d497f3caffcac0d80 ****/
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
Submit texture eye to xr composer. @param thetexture [in] texture handle @param thegraphicslib [in] graphics library in which texture handle is defined @param thecolorspace [in] texture color space;  srgb means no color conversion by composer;  linear means to srgb color conversion by composer @param theeye [in] eye to display return false on error.
") SubmitEye;
		virtual bool SubmitEye(void * theTexture, Aspect_GraphicsLibrary theGraphicsLib, Aspect_ColorSpace theColorSpace, Aspect_Eye theEye);

		/****************** WaitPoses ******************/
		/**** md5 signature: 5922daa4301bb4074ae95962b4f8d15b ****/
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
