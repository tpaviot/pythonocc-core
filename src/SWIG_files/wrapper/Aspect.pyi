from enum import IntEnum
import typing
from typing import Any, overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.Quantity import *
from OCC.Core.gp import *
from OCC.Core.TCollection import *

Aspect_Drawable = NewType("Aspect_Drawable", int)
Aspect_FBConfig = NewType("Aspect_FBConfig", GLXFBConfig)
Aspect_Handle = NewType("Aspect_Handle", int)
Aspect_VKey = NewType("Aspect_VKey", int)
Aspect_VKeyFlags = NewType("Aspect_VKeyFlags", int)
Aspect_VKeyMouse = NewType("Aspect_VKeyMouse", int)

class Aspect_SequenceOfColor:
    def __init__(self) -> None: ...
    def __len__(self) -> int: ...
    def Size(self) -> int: ...
    def Clear(self) -> None: ...
    def First(self) -> Quantity_Color: ...
    def Last(self) -> Quantity_Color: ...
    def Length(self) -> int: ...
    def Append(self, theItem: Quantity_Color) -> Quantity_Color: ...
    def Prepend(self, theItem: Quantity_Color) -> Quantity_Color: ...
    def RemoveFirst(self) -> None: ...
    def Reverse(self) -> None: ...
    def Value(self, theIndex: int) -> Quantity_Color: ...
    def SetValue(self, theIndex: int, theValue: Quantity_Color) -> None: ...

class Aspect_TouchMap:
    def __init__(self, *args: Any, **kwargs: Any) -> None: ...
    def __getattr__(self, name: str) -> Any: ...

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
    Aspect_GFM_NONE = ...
    Aspect_GFM_HOR = ...
    Aspect_GFM_VER = ...
    Aspect_GFM_DIAG1 = ...
    Aspect_GFM_DIAG2 = ...
    Aspect_GFM_CORNER1 = ...
    Aspect_GFM_CORNER2 = ...
    Aspect_GFM_CORNER3 = ...
    Aspect_GFM_CORNER4 = ...

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
    Aspect_IS_EMPTY = ...
    Aspect_IS_SOLID = 0
    Aspect_IS_HATCH = 1
    Aspect_IS_HIDDENLINE = 2
    Aspect_IS_POINT = 3
    Aspect_IS_HOLLOW = ...

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
    Aspect_POM_All = ...
    Aspect_POM_None = 8
    Aspect_POM_Mask = ...

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
    Aspect_TOL_EMPTY = ...
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
    Aspect_TOM_EMPTY = ...
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
    Aspect_TOTP_LEFT_LOWER = ...
    Aspect_TOTP_LEFT_UPPER = ...
    Aspect_TOTP_RIGHT_LOWER = ...
    Aspect_TOTP_RIGHT_UPPER = ...

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
Aspect_VKey_Lower: int
Aspect_VKey_ModifiersLower: int
Aspect_VKey_ModifiersUpper: int
Aspect_VKey_NavigationKeysLower: int
Aspect_VKey_NavigationKeysUpper: int
Aspect_VKey_Upper: int
Aspect_VKey_NB: int
Aspect_VKey_MAX: int

Aspect_VKeyFlags_NONE: int
Aspect_VKeyFlags_SHIFT: int
Aspect_VKeyFlags_CTRL: int
Aspect_VKeyFlags_ALT: int
Aspect_VKeyFlags_MENU: int
Aspect_VKeyFlags_META: int
Aspect_VKeyFlags_ALL: int

Aspect_VKeyMouse_NONE: int
Aspect_VKeyMouse_LeftButton: int
Aspect_VKeyMouse_MiddleButton: int
Aspect_VKeyMouse_RightButton: int
Aspect_VKeyMouse_MainButtons: int


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
Aspect_XRGenericAction_NB: int


class Aspect_XRTrackedDeviceRole(IntEnum):
    Aspect_XRTrackedDeviceRole_Head = 0
    Aspect_XRTrackedDeviceRole_LeftHand = 1
    Aspect_XRTrackedDeviceRole_RightHand = 2
    Aspect_XRTrackedDeviceRole_Other = 3

Aspect_XRTrackedDeviceRole_Head = Aspect_XRTrackedDeviceRole.Aspect_XRTrackedDeviceRole_Head
Aspect_XRTrackedDeviceRole_LeftHand = Aspect_XRTrackedDeviceRole.Aspect_XRTrackedDeviceRole_LeftHand
Aspect_XRTrackedDeviceRole_RightHand = Aspect_XRTrackedDeviceRole.Aspect_XRTrackedDeviceRole_RightHand
Aspect_XRTrackedDeviceRole_Other = Aspect_XRTrackedDeviceRole.Aspect_XRTrackedDeviceRole_Other
Aspect_XRTrackedDeviceRole_NB: int


class Aspect_Background:
    @overload
    def __init__(self) -> None: ...
    @overload
    def __init__(self, AColor: Quantity_Color) -> None: ...
    def Color(self) -> Quantity_Color: ...
    def DumpJson(self, depth: Optional[int]=-1) -> str: ...
    def SetColor(self, AColor: Quantity_Color) -> None: ...

class Aspect_DisplayConnection(Standard_Transient):
    def GetDefaultFBConfig(self) -> Aspect_FBConfig: ...
    def GetDefaultVisualInfo(self) -> Aspect_XVisualInfo: ...
    def GetDisplayAspect(self) -> Aspect_XDisplay: ...

class Aspect_GenId:
    @overload
    def __init__(self) -> None: ...
    @overload
    def __init__(self, theLow: int, theUpper: int) -> None: ...
    def Available(self) -> int: ...
    def DumpJson(self, depth: Optional[int]=-1) -> str: ...
    @overload
    def Free(self) -> None: ...
    @overload
    def Free(self, theId: int) -> None: ...
    def HasFree(self) -> bool: ...
    def Lower(self) -> int: ...
    @overload
    def Next(self) -> int: ...
    @overload
    def Next(self) -> Tuple[bool, int]: ...
    def Upper(self) -> int: ...

class Aspect_Grid(Standard_Transient):
    def Activate(self) -> None: ...
    def Colors(self, aColor: Quantity_Color, aTenthColor: Quantity_Color) -> None: ...
    def Compute(self, X: float, Y: float) -> Tuple[float, float]: ...
    def Deactivate(self) -> None: ...
    def Display(self) -> None: ...
    def DrawMode(self) -> Aspect_GridDrawMode: ...
    def DumpJson(self, depth: Optional[int]=-1) -> str: ...
    def Erase(self) -> None: ...
    def Hit(self, X: float, Y: float) -> Tuple[float, float]: ...
    def Init(self) -> None: ...
    def IsActive(self) -> bool: ...
    def IsDisplayed(self) -> bool: ...
    def Rotate(self, anAngle: float) -> None: ...
    def RotationAngle(self) -> float: ...
    def SetColors(self, aColor: Quantity_Color, aTenthColor: Quantity_Color) -> None: ...
    def SetDrawMode(self, aDrawMode: Aspect_GridDrawMode) -> None: ...
    def SetRotationAngle(self, anAngle: float) -> None: ...
    def SetXOrigin(self, anOrigin: float) -> None: ...
    def SetYOrigin(self, anOrigin: float) -> None: ...
    def Translate(self, aDx: float, aDy: float) -> None: ...
    def XOrigin(self) -> float: ...
    def YOrigin(self) -> float: ...

class Aspect_GridParams:
    def __init__(self) -> None: ...
    def AccentAngularScale(self) -> float: ...
    def AccentColor(self) -> Quantity_Color: ...
    def AccentScaleX(self) -> float: ...
    def AccentScaleY(self) -> float: ...
    def AngleEnd(self) -> float: ...
    def AngleStart(self) -> float: ...
    def AngularDivisions(self) -> int: ...
    def Color(self) -> Quantity_Color: ...
    def DrawMode(self) -> Aspect_GridDrawMode: ...
    def EffectiveScaleY(self) -> float: ...
    def IsArc(self) -> bool: ...
    def IsBackground(self) -> bool: ...
    def IsBounded(self) -> bool: ...
    def IsCircular(self) -> bool: ...
    def IsDrawAxis(self) -> bool: ...
    def IsViewAdaptive(self) -> bool: ...
    def LineThickness(self) -> float: ...
    def Origin(self) -> gp_Pnt: ...
    def Radius(self) -> float: ...
    def RotationAngle(self) -> float: ...
    def Scale(self) -> float: ...
    def ScaleY(self) -> float: ...
    def SetAccentAngularScale(self, theScale: float) -> None: ...
    def SetAccentColor(self, theColor: Quantity_Color) -> None: ...
    def SetAccentScaleX(self, theScale: float) -> None: ...
    def SetAccentScaleY(self, theScale: float) -> None: ...
    def SetAngularDivisions(self, theDivisions: int) -> None: ...
    def SetArcRange(self, theStart: float, theEnd: float) -> None: ...
    def SetColor(self, theColor: Quantity_Color) -> None: ...
    def SetDrawMode(self, theMode: Aspect_GridDrawMode) -> None: ...
    def SetIsBackground(self, theIsBackground: bool) -> None: ...
    def SetIsDrawAxis(self, theIsDrawAxis: bool) -> None: ...
    def SetIsViewAdaptive(self, theIsViewAdaptive: bool) -> None: ...
    def SetLineThickness(self, theThickness: float) -> None: ...
    def SetOrigin(self, theOrigin: gp_Pnt) -> None: ...
    def SetRadius(self, theRadius: float) -> None: ...
    def SetRotationAngle(self, theAngle: float) -> None: ...
    def SetScale(self, theScale: float) -> None: ...
    def SetScaleY(self, theScaleY: float) -> None: ...
    def SetSizeX(self, theSize: float) -> None: ...
    def SetSizeY(self, theSize: float) -> None: ...
    def SetZOffset(self, theOffset: float) -> None: ...
    def SizeX(self) -> float: ...
    def SizeY(self) -> float: ...
    def ZOffset(self) -> float: ...

class Aspect_ScrollDelta:
    @overload
    def __init__(self) -> None: ...
    @overload
    def __init__(self, thePnt: Any, theValue: float, theFlags: Optional[Aspect_VKeyFlags] = Aspect_VKeyFlags_NONE) -> None: ...
    @overload
    def __init__(self, theValue: float, theFlags: Optional[Aspect_VKeyFlags] = Aspect_VKeyFlags_NONE) -> None: ...
    def HasPoint(self) -> bool: ...
    def ResetPoint(self) -> None: ...

class Aspect_SkydomeBackground:
    @overload
    def __init__(self) -> None: ...
    @overload
    def __init__(self, theSunDirection: gp_Dir, theCloudiness: float, theTime: float, theFogginess: float, theSize: int) -> None: ...
    def Cloudiness(self) -> float: ...
    def DumpJson(self, depth: Optional[int]=-1) -> str: ...
    def Fogginess(self) -> float: ...
    def SetCloudiness(self, theCloudiness: float) -> None: ...
    def SetFogginess(self, theFogginess: float) -> None: ...
    def SetSize(self, theSize: int) -> None: ...
    def SetSunDirection(self, theSunDirection: gp_Dir) -> None: ...
    def SetTimeParameter(self, theTime: float) -> None: ...
    def Size(self) -> int: ...
    def SunDirection(self) -> gp_Dir: ...
    def TimeParameter(self) -> float: ...

class Aspect_Touch:
    @overload
    def __init__(self) -> None: ...
    @overload
    def __init__(self, thePnt: Any, theIsPreciseDevice: bool) -> None: ...
    @overload
    def __init__(self, theX: float, theY: float, theIsPreciseDevice: bool) -> None: ...
    def Delta(self) -> Any: ...

class Aspect_TrackedDevicePose:
    def __init__(self) -> None: ...

class Aspect_VKeySet(Standard_Transient):
    def __init__(self) -> None: ...
    def DownTime(self, theKey: Aspect_VKey) -> float: ...
    @overload
    def HoldDuration(self, theKey: Aspect_VKey, theTime: float) -> Tuple[bool, float]: ...
    @overload
    def HoldDuration(self, theKey: Aspect_VKey, theTime: float) -> Tuple[bool, float, float]: ...
    def IsFreeKey(self, theKey: Aspect_VKey) -> bool: ...
    def IsKeyDown(self, theKey: Aspect_VKey) -> bool: ...
    def KeyDown(self, theKey: Aspect_VKey, theTime: float, thePressure: Optional[float] = 1.0) -> None: ...
    def KeyFromAxis(self, theNegative: Aspect_VKey, thePositive: Aspect_VKey, theTime: float, thePressure: float) -> None: ...
    def KeyUp(self, theKey: Aspect_VKey, theTime: float) -> None: ...
    def Modifiers(self) -> Aspect_VKeyFlags: ...
    def Mutex(self) -> Any: ...
    def Reset(self) -> None: ...
    def TimeUp(self, theKey: Aspect_VKey) -> float: ...

class Aspect_Window(Standard_Transient):
    def Background(self) -> Aspect_Background: ...
    def BackgroundFillMethod(self) -> Aspect_FillMethod: ...
    def ConvertPointFromBacking(self, thePnt: Any) -> Any: ...
    def ConvertPointToBacking(self, thePnt: Any) -> Any: ...
    def DevicePixelRatio(self) -> float: ...
    def Dimensions(self) -> Any: ...
    def DisplayConnection(self) -> Aspect_DisplayConnection: ...
    def DoMapping(self) -> bool: ...
    def DoResize(self) -> Aspect_TypeOfResize: ...
    def DumpJson(self, depth: Optional[int]=-1) -> str: ...
    def GradientBackground(self) -> Aspect_GradientBackground: ...
    def InvalidateContent(self, theDisp: Aspect_DisplayConnection) -> None: ...
    def IsMapped(self) -> bool: ...
    def IsVirtual(self) -> bool: ...
    def Map(self) -> None: ...
    def NativeFBConfig(self) -> Aspect_FBConfig: ...
    def Position(self) -> Tuple[int, int, int, int]: ...
    def Ratio(self) -> float: ...
    @overload
    def SetBackground(self, theBack: Aspect_Background) -> None: ...
    @overload
    def SetBackground(self, theColor: Quantity_Color) -> None: ...
    @overload
    def SetBackground(self, theBackground: Aspect_GradientBackground) -> None: ...
    @overload
    def SetBackground(self, theFirstColor: Quantity_Color, theSecondColor: Quantity_Color, theFillMethod: Aspect_GradientFillMethod) -> None: ...
    def SetTitle(self, theTitle: str) -> None: ...
    def SetVirtual(self, theVirtual: bool) -> None: ...
    def Size(self) -> Tuple[int, int]: ...
    def TopLeft(self) -> Any: ...
    def Unmap(self) -> None: ...

class Aspect_WindowInputListener:
    def AddTouchPoint(self, theId: int, thePnt: Any, theClearBefore: Optional[bool] = False) -> None: ...
    def Change3dMouseIsNoRotate(self) -> Any: ...
    def Change3dMouseToReverse(self) -> Any: ...
    def ChangeKeys(self) -> Aspect_VKeySet: ...
    def EventTime(self) -> float: ...
    def Get3dMouseIsNoRotate(self) -> Any: ...
    def Get3dMouseRotationScale(self) -> float: ...
    def Get3dMouseToReverse(self) -> Any: ...
    def Get3dMouseTranslationScale(self) -> float: ...
    def HasTouchPoints(self) -> bool: ...
    def KeyDown(self, theKey: Aspect_VKey, theTime: float, thePressure: Optional[float] = 1.0) -> None: ...
    def KeyFromAxis(self, theNegative: Aspect_VKey, thePositive: Aspect_VKey, theTime: float, thePressure: float) -> None: ...
    def KeyUp(self, theKey: Aspect_VKey, theTime: float) -> None: ...
    def Keys(self) -> Aspect_VKeySet: ...
    def LastMouseFlags(self) -> Aspect_VKeyFlags: ...
    def LastMousePosition(self) -> Any: ...
    def PressMouseButton(self, thePoint: Any, theButton: Aspect_VKeyMouse, theModifiers: Aspect_VKeyFlags, theIsEmulated: bool) -> bool: ...
    def PressedMouseButtons(self) -> Aspect_VKeyMouse: ...
    def ProcessClose(self) -> None: ...
    def ProcessConfigure(self, theIsResized: bool) -> None: ...
    def ProcessExpose(self) -> None: ...
    def ProcessFocus(self, theIsActivated: bool) -> None: ...
    def ProcessInput(self) -> None: ...
    def ReleaseMouseButton(self, thePoint: Any, theButton: Aspect_VKeyMouse, theModifiers: Aspect_VKeyFlags, theIsEmulated: bool) -> bool: ...
    def RemoveTouchPoint(self, theId: int, theClearSelectPnts: Optional[bool] = False) -> bool: ...
    def Set3dMousePreciseInput(self, theIsQuadric: bool) -> None: ...
    def Set3dMouseRotationScale(self, theScale: float) -> None: ...
    def Set3dMouseTranslationScale(self, theScale: float) -> None: ...
    def To3dMousePreciseInput(self) -> bool: ...
    def TouchPoints(self) -> Any: ...
    def Update3dMouse(self, theEvent: Any) -> bool: ...
    def UpdateMouseButtons(self, thePoint: Any, theButtons: Aspect_VKeyMouse, theModifiers: Aspect_VKeyFlags, theIsEmulated: bool) -> bool: ...
    def UpdateMousePosition(self, thePoint: Any, theButtons: Aspect_VKeyMouse, theModifiers: Aspect_VKeyFlags, theIsEmulated: bool) -> bool: ...
    def UpdateMouseScroll(self, theDelta: Aspect_ScrollDelta) -> bool: ...
    def UpdateTouchPoint(self, theId: int, thePnt: Any) -> None: ...
    def update3dMouseKeys(self, theEvent: Any) -> bool: ...
    def update3dMouseRotation(self, theEvent: Any) -> bool: ...
    def update3dMouseTranslation(self, theEvent: Any) -> bool: ...

class Aspect_XRAction(Standard_Transient):
    def __init__(self, theId: str, theType: Aspect_XRActionType) -> None: ...
    def Id(self) -> str: ...
    def IsValid(self) -> bool: ...
    def RawHandle(self) -> Any: ...
    def SetRawHandle(self, theHande: Any) -> None: ...
    def Type(self) -> Aspect_XRActionType: ...

class Aspect_XRActionSet(Standard_Transient):
    def __init__(self, theId: str) -> None: ...
    def Actions(self) -> Any: ...
    def AddAction(self, theAction: Aspect_XRAction) -> None: ...
    def Id(self) -> str: ...
    def RawHandle(self) -> Any: ...
    def SetRawHandle(self, theHande: Any) -> None: ...

class Aspect_XRAnalogActionData:
    def __init__(self) -> None: ...
    def IsChanged(self) -> bool: ...

class Aspect_XRDigitalActionData:
    def __init__(self) -> None: ...

class Aspect_XRHapticActionData:
    def __init__(self) -> None: ...
    def IsValid(self) -> bool: ...

class Aspect_XRPoseActionData:
    def __init__(self) -> None: ...

class Aspect_XRSession(Standard_Transient):
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
    def AbortHapticVibrationAction(self, theAction: Aspect_XRAction) -> None: ...
    def Aspect(self) -> float: ...
    def Close(self) -> None: ...
    def DisplayFrequency(self) -> float: ...
    def EyeToHeadTransform(self, theEye: Aspect_Eye) -> Any: ...
    def FieldOfView(self) -> float: ...
    def GenericAction(self, theDevice: Aspect_XRTrackedDeviceRole, theAction: Aspect_XRGenericAction) -> Aspect_XRAction: ...
    def GetAnalogActionData(self, theAction: Aspect_XRAction) -> Aspect_XRAnalogActionData: ...
    def GetDigitalActionData(self, theAction: Aspect_XRAction) -> Aspect_XRDigitalActionData: ...
    def GetPoseActionDataForNextFrame(self, theAction: Aspect_XRAction) -> Aspect_XRPoseActionData: ...
    def GetString(self, theInfo: Any) -> str: ...
    def HasProjectionFrustums(self) -> bool: ...
    def HasTrackedPose(self, theDevice: int) -> bool: ...
    def HeadPose(self) -> gp_Trsf: ...
    def HeadToEyeTransform(self, theEye: Aspect_Eye) -> Any: ...
    def IOD(self) -> float: ...
    def IsOpen(self) -> bool: ...
    def LeftHandPose(self) -> gp_Trsf: ...
    def NamedTrackedDevice(self, theDevice: Aspect_XRTrackedDeviceRole) -> int: ...
    def Open(self) -> bool: ...
    def ProcessEvents(self) -> None: ...
    def ProjectionFrustum(self, theEye: Aspect_Eye) -> Any: ...
    def ProjectionMatrix(self, theEye: Aspect_Eye, theZNear: float, theZFar: float) -> Any: ...
    def RecommendedViewport(self) -> Any: ...
    def RightHandPose(self) -> gp_Trsf: ...
    def SetTrackingOrigin(self, theOrigin: Any) -> None: ...
    def SetUnitFactor(self, theFactor: float) -> None: ...
    def SubmitEye(self, theTexture: None, theGraphicsLib: Aspect_GraphicsLibrary, theColorSpace: Aspect_ColorSpace, theEye: Aspect_Eye) -> bool: ...
    def TrackedPoses(self) -> Any: ...
    def TrackingOrigin(self) -> Aspect_XRSession.TrackingUniverseOrigin: ...
    def TriggerHapticVibrationAction(self, theAction: Aspect_XRAction, theParams: Aspect_XRHapticActionData) -> None: ...
    def UnitFactor(self) -> float: ...
    def WaitPoses(self) -> bool: ...

class Aspect_GradientBackground(Aspect_Background):
    @overload
    def __init__(self) -> None: ...
    @overload
    def __init__(self, theColor1: Quantity_Color, theColor2: Quantity_Color, theMethod: Optional[Aspect_GradientFillMethod] = Aspect_GradientFillMethod_Horizontal) -> None: ...
    def BgGradientFillMethod(self) -> Aspect_GradientFillMethod: ...
    def Colors(self, theColor1: Quantity_Color, theColor2: Quantity_Color) -> None: ...
    def DumpJson(self, depth: Optional[int]=-1) -> str: ...
    def SetColors(self, theColor1: Quantity_Color, theColor2: Quantity_Color, theMethod: Optional[Aspect_GradientFillMethod] = Aspect_GradientFillMethod_Horizontal) -> None: ...

class Aspect_OpenVRSession(Aspect_XRSession):
    def __init__(self) -> None: ...
    def Close(self) -> None: ...
    def EyeToHeadTransform(self, theEye: Aspect_Eye) -> Any: ...
    def GetAnalogActionData(self, theAction: Aspect_XRAction) -> Aspect_XRAnalogActionData: ...
    def GetDigitalActionData(self, theAction: Aspect_XRAction) -> Aspect_XRDigitalActionData: ...
    def GetPoseActionDataForNextFrame(self, theAction: Aspect_XRAction) -> Aspect_XRPoseActionData: ...
    def GetString(self, theInfo: Any) -> str: ...
    def HasProjectionFrustums(self) -> bool: ...
    @staticmethod
    def IsHmdPresent() -> bool: ...
    def IsOpen(self) -> bool: ...
    def NamedTrackedDevice(self, theDevice: Aspect_XRTrackedDeviceRole) -> int: ...
    def Open(self) -> bool: ...
    def ProcessEvents(self) -> None: ...
    def ProjectionMatrix(self, theEye: Aspect_Eye, theZNear: float, theZFar: float) -> Any: ...
    def RecommendedViewport(self) -> Any: ...
    def SetTrackingOrigin(self, theOrigin: Any) -> None: ...
    def SubmitEye(self, theTexture: None, theGraphicsLib: Aspect_GraphicsLibrary, theColorSpace: Aspect_ColorSpace, theEye: Aspect_Eye) -> bool: ...
    def WaitPoses(self) -> bool: ...

#classnotwrapped
class Aspect_CircularGrid: ...

#classnotwrapped
class Aspect_NeutralWindow: ...

#classnotwrapped
class Aspect_RectangularGrid: ...

#classnotwrapped
class Aspect_FrustumLRBT: ...

# harray1 classes
# harray2 classes
# hsequence classes

