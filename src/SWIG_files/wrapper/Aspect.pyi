from typing import overload, NewType, Optional, Tuple

from OCC.Core.Aspect import *
from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.Quantity import *
from OCC.Core.TCollection import *

Aspect_Display = NewType('Aspect_Display', None)
Aspect_Drawable = NewType('Aspect_Drawable', int)
Aspect_FBConfig = NewType('Aspect_FBConfig', None)
Aspect_Handle = NewType('Aspect_Handle', int)
Aspect_RenderingContext = NewType('Aspect_RenderingContext', None)
Aspect_VKey = NewType('Aspect_VKey', int)
Aspect_VKeyFlags = NewType('Aspect_VKeyFlags', int)
Aspect_VKeyMouse = NewType('Aspect_VKeyMouse', int)
HANDLE = NewType('HANDLE', None)

class Aspect_VKeyBasic:
	Aspect_VKey_UNKNOWN: int = ...
	Aspect_VKey_A: int = ...
	Aspect_VKey_B: int = ...
	Aspect_VKey_C: int = ...
	Aspect_VKey_D: int = ...
	Aspect_VKey_E: int = ...
	Aspect_VKey_F: int = ...
	Aspect_VKey_G: int = ...
	Aspect_VKey_H: int = ...
	Aspect_VKey_I: int = ...
	Aspect_VKey_J: int = ...
	Aspect_VKey_K: int = ...
	Aspect_VKey_L: int = ...
	Aspect_VKey_M: int = ...
	Aspect_VKey_N: int = ...
	Aspect_VKey_O: int = ...
	Aspect_VKey_P: int = ...
	Aspect_VKey_Q: int = ...
	Aspect_VKey_R: int = ...
	Aspect_VKey_S: int = ...
	Aspect_VKey_T: int = ...
	Aspect_VKey_U: int = ...
	Aspect_VKey_V: int = ...
	Aspect_VKey_W: int = ...
	Aspect_VKey_X: int = ...
	Aspect_VKey_Y: int = ...
	Aspect_VKey_Z: int = ...
	Aspect_VKey_0: int = ...
	Aspect_VKey_1: int = ...
	Aspect_VKey_2: int = ...
	Aspect_VKey_3: int = ...
	Aspect_VKey_4: int = ...
	Aspect_VKey_5: int = ...
	Aspect_VKey_6: int = ...
	Aspect_VKey_7: int = ...
	Aspect_VKey_8: int = ...
	Aspect_VKey_9: int = ...
	Aspect_VKey_F1: int = ...
	Aspect_VKey_F2: int = ...
	Aspect_VKey_F3: int = ...
	Aspect_VKey_F4: int = ...
	Aspect_VKey_F5: int = ...
	Aspect_VKey_F6: int = ...
	Aspect_VKey_F7: int = ...
	Aspect_VKey_F8: int = ...
	Aspect_VKey_F9: int = ...
	Aspect_VKey_F10: int = ...
	Aspect_VKey_F11: int = ...
	Aspect_VKey_F12: int = ...
	Aspect_VKey_Up: int = ...
	Aspect_VKey_Down: int = ...
	Aspect_VKey_Left: int = ...
	Aspect_VKey_Right: int = ...
	Aspect_VKey_Plus: int = ...
	Aspect_VKey_Minus: int = ...
	Aspect_VKey_Equal: int = ...
	Aspect_VKey_PageUp: int = ...
	Aspect_VKey_PageDown: int = ...
	Aspect_VKey_Home: int = ...
	Aspect_VKey_End: int = ...
	Aspect_VKey_Escape: int = ...
	Aspect_VKey_Back: int = ...
	Aspect_VKey_Enter: int = ...
	Aspect_VKey_Backspace: int = ...
	Aspect_VKey_Space: int = ...
	Aspect_VKey_Delete: int = ...
	Aspect_VKey_Tilde: int = ...
	Aspect_VKey_Tab: int = ...
	Aspect_VKey_Comma: int = ...
	Aspect_VKey_Period: int = ...
	Aspect_VKey_Semicolon: int = ...
	Aspect_VKey_Slash: int = ...
	Aspect_VKey_BracketLeft: int = ...
	Aspect_VKey_Backslash: int = ...
	Aspect_VKey_BracketRight: int = ...
	Aspect_VKey_Apostrophe: int = ...
	Aspect_VKey_Numlock: int = ...
	Aspect_VKey_Scroll: int = ...
	Aspect_VKey_Numpad0: int = ...
	Aspect_VKey_Numpad1: int = ...
	Aspect_VKey_Numpad2: int = ...
	Aspect_VKey_Numpad3: int = ...
	Aspect_VKey_Numpad4: int = ...
	Aspect_VKey_Numpad5: int = ...
	Aspect_VKey_Numpad6: int = ...
	Aspect_VKey_Numpad7: int = ...
	Aspect_VKey_Numpad8: int = ...
	Aspect_VKey_Numpad9: int = ...
	Aspect_VKey_NumpadMultiply: int = ...
	Aspect_VKey_NumpadAdd: int = ...
	Aspect_VKey_NumpadSubtract: int = ...
	Aspect_VKey_NumpadDivide: int = ...
	Aspect_VKey_MediaNextTrack: int = ...
	Aspect_VKey_MediaPreviousTrack: int = ...
	Aspect_VKey_MediaStop: int = ...
	Aspect_VKey_MediaPlayPause: int = ...
	Aspect_VKey_VolumeMute: int = ...
	Aspect_VKey_VolumeDown: int = ...
	Aspect_VKey_VolumeUp: int = ...
	Aspect_VKey_BrowserBack: int = ...
	Aspect_VKey_BrowserForward: int = ...
	Aspect_VKey_BrowserRefresh: int = ...
	Aspect_VKey_BrowserStop: int = ...
	Aspect_VKey_BrowserSearch: int = ...
	Aspect_VKey_BrowserFavorites: int = ...
	Aspect_VKey_BrowserHome: int = ...
	Aspect_VKey_Shift: int = ...
	Aspect_VKey_Control: int = ...
	Aspect_VKey_Alt: int = ...
	Aspect_VKey_Menu: int = ...
	Aspect_VKey_Meta: int = ...
	Aspect_VKey_NavInteract: int = ...
	Aspect_VKey_NavForward: int = ...
	Aspect_VKey_NavBackward: int = ...
	Aspect_VKey_NavSlideLeft: int = ...
	Aspect_VKey_NavSlideRight: int = ...
	Aspect_VKey_NavSlideUp: int = ...
	Aspect_VKey_NavSlideDown: int = ...
	Aspect_VKey_NavRollCCW: int = ...
	Aspect_VKey_NavRollCW: int = ...
	Aspect_VKey_NavLookLeft: int = ...
	Aspect_VKey_NavLookRight: int = ...
	Aspect_VKey_NavLookUp: int = ...
	Aspect_VKey_NavLookDown: int = ...
	Aspect_VKey_NavCrouch: int = ...
	Aspect_VKey_NavJump: int = ...
	Aspect_VKey_NavThrustForward: int = ...
	Aspect_VKey_NavThrustBackward: int = ...
	Aspect_VKey_NavThrustStop: int = ...
	Aspect_VKey_NavSpeedIncrease: int = ...
	Aspect_VKey_NavSpeedDecrease: int = ...

class Aspect_TypeOfDeflection:
	Aspect_TOD_RELATIVE: int = ...
	Aspect_TOD_ABSOLUTE: int = ...

class Aspect_TypeOfLine:
	Aspect_TOL_EMPTY: int = ...
	Aspect_TOL_SOLID: int = ...
	Aspect_TOL_DASH: int = ...
	Aspect_TOL_DOT: int = ...
	Aspect_TOL_DOTDASH: int = ...
	Aspect_TOL_USERDEFINED: int = ...

class Aspect_GradientFillMethod:
	Aspect_GFM_NONE: int = ...
	Aspect_GFM_HOR: int = ...
	Aspect_GFM_VER: int = ...
	Aspect_GFM_DIAG1: int = ...
	Aspect_GFM_DIAG2: int = ...
	Aspect_GFM_CORNER1: int = ...
	Aspect_GFM_CORNER2: int = ...
	Aspect_GFM_CORNER3: int = ...
	Aspect_GFM_CORNER4: int = ...

class Aspect_TypeOfHighlightMethod:
	Aspect_TOHM_COLOR: int = ...
	Aspect_TOHM_BOUNDBOX: int = ...

class Aspect_TypeOfResize:
	Aspect_TOR_UNKNOWN: int = ...
	Aspect_TOR_NO_BORDER: int = ...
	Aspect_TOR_TOP_BORDER: int = ...
	Aspect_TOR_RIGHT_BORDER: int = ...
	Aspect_TOR_BOTTOM_BORDER: int = ...
	Aspect_TOR_LEFT_BORDER: int = ...
	Aspect_TOR_TOP_AND_RIGHT_BORDER: int = ...
	Aspect_TOR_RIGHT_AND_BOTTOM_BORDER: int = ...
	Aspect_TOR_BOTTOM_AND_LEFT_BORDER: int = ...
	Aspect_TOR_LEFT_AND_TOP_BORDER: int = ...

class Aspect_GridType:
	Aspect_GT_Rectangular: int = ...
	Aspect_GT_Circular: int = ...

class Aspect_TypeOfColorScaleData:
	Aspect_TOCSD_AUTO: int = ...
	Aspect_TOCSD_USER: int = ...

class Aspect_TypeOfStyleText:
	Aspect_TOST_NORMAL: int = ...
	Aspect_TOST_ANNOTATION: int = ...

class Aspect_TypeOfMarker:
	Aspect_TOM_EMPTY: int = ...
	Aspect_TOM_POINT: int = ...
	Aspect_TOM_PLUS: int = ...
	Aspect_TOM_STAR: int = ...
	Aspect_TOM_X: int = ...
	Aspect_TOM_O: int = ...
	Aspect_TOM_O_POINT: int = ...
	Aspect_TOM_O_PLUS: int = ...
	Aspect_TOM_O_STAR: int = ...
	Aspect_TOM_O_X: int = ...
	Aspect_TOM_RING1: int = ...
	Aspect_TOM_RING2: int = ...
	Aspect_TOM_RING3: int = ...
	Aspect_TOM_BALL: int = ...
	Aspect_TOM_USERDEFINED: int = ...

class Aspect_TypeOfColorScaleOrientation:
	Aspect_TOCSO_NONE: int = ...
	Aspect_TOCSO_LEFT: int = ...
	Aspect_TOCSO_RIGHT: int = ...
	Aspect_TOCSO_CENTER: int = ...

class Aspect_TypeOfFacingModel:
	Aspect_TOFM_BOTH_SIDE: int = ...
	Aspect_TOFM_BACK_SIDE: int = ...
	Aspect_TOFM_FRONT_SIDE: int = ...

class Aspect_FillMethod:
	Aspect_FM_NONE: int = ...
	Aspect_FM_CENTERED: int = ...
	Aspect_FM_TILED: int = ...
	Aspect_FM_STRETCH: int = ...

class Aspect_HatchStyle:
	Aspect_HS_SOLID: int = ...
	Aspect_HS_HORIZONTAL: int = ...
	Aspect_HS_HORIZONTAL_WIDE: int = ...
	Aspect_HS_VERTICAL: int = ...
	Aspect_HS_VERTICAL_WIDE: int = ...
	Aspect_HS_DIAGONAL_45: int = ...
	Aspect_HS_DIAGONAL_45_WIDE: int = ...
	Aspect_HS_DIAGONAL_135: int = ...
	Aspect_HS_DIAGONAL_135_WIDE: int = ...
	Aspect_HS_GRID: int = ...
	Aspect_HS_GRID_WIDE: int = ...
	Aspect_HS_GRID_DIAGONAL: int = ...
	Aspect_HS_GRID_DIAGONAL_WIDE: int = ...
	Aspect_HS_NB: int = ...

class Aspect_PolygonOffsetMode:
	Aspect_POM_Off: int = ...
	Aspect_POM_Fill: int = ...
	Aspect_POM_Line: int = ...
	Aspect_POM_Point: int = ...
	Aspect_POM_All: int = ...
	Aspect_POM_None: int = ...
	Aspect_POM_Mask: int = ...

class Aspect_TypeOfColorScalePosition:
	Aspect_TOCSP_NONE: int = ...
	Aspect_TOCSP_LEFT: int = ...
	Aspect_TOCSP_RIGHT: int = ...
	Aspect_TOCSP_CENTER: int = ...

class Aspect_XAtom:
	Aspect_XA_DELETE_WINDOW: int = ...

class Aspect_TypeOfTriedronPosition:
	Aspect_TOTP_CENTER: int = ...
	Aspect_TOTP_TOP: int = ...
	Aspect_TOTP_BOTTOM: int = ...
	Aspect_TOTP_LEFT: int = ...
	Aspect_TOTP_RIGHT: int = ...
	Aspect_TOTP_LEFT_LOWER: int = ...
	Aspect_TOTP_LEFT_UPPER: int = ...
	Aspect_TOTP_RIGHT_LOWER: int = ...
	Aspect_TOTP_RIGHT_UPPER: int = ...

class Aspect_GridDrawMode:
	Aspect_GDM_Lines: int = ...
	Aspect_GDM_Points: int = ...
	Aspect_GDM_None: int = ...

class Aspect_WidthOfLine:
	Aspect_WOL_THIN: int = ...
	Aspect_WOL_MEDIUM: int = ...
	Aspect_WOL_THICK: int = ...
	Aspect_WOL_VERYTHICK: int = ...
	Aspect_WOL_USERDEFINED: int = ...

class Aspect_TypeOfDisplayText:
	Aspect_TODT_NORMAL: int = ...
	Aspect_TODT_SUBTITLE: int = ...
	Aspect_TODT_DEKALE: int = ...
	Aspect_TODT_BLEND: int = ...
	Aspect_TODT_DIMENSION: int = ...
	Aspect_TODT_SHADOW: int = ...

class Aspect_InteriorStyle:
	Aspect_IS_EMPTY: int = ...
	Aspect_IS_SOLID: int = ...
	Aspect_IS_HATCH: int = ...
	Aspect_IS_HIDDENLINE: int = ...
	Aspect_IS_POINT: int = ...
	Aspect_IS_HOLLOW: int = ...

class Aspect_Background:
	@overload
	def __init__(self) -> None: ...
	@overload
	def __init__(self, AColor: Quantity_Color) -> None: ...
	def Color(self) -> Quantity_Color: ...
	def SetColor(self, AColor: Quantity_Color) -> None: ...

class Aspect_DisplayConnection(Standard_Transient):
	pass

class Aspect_GenId:
	@overload
	def __init__(self) -> None: ...
	@overload
	def __init__(self, theLow: int, theUpper: int) -> None: ...
	def Available(self) -> int: ...
	def Free(self) -> None: ...
	def Free(self, theId: int) -> None: ...
	def HasFree(self) -> bool: ...
	def Lower(self) -> int: ...
	def Next(self) -> int: ...
	def Next(self) -> Tuple[bool, int]: ...
	def Upper(self) -> int: ...

class Aspect_Grid(Standard_Transient):
	def Activate(self) -> None: ...
	def Colors(self, aColor: Quantity_Color, aTenthColor: Quantity_Color) -> None: ...
	def Compute(self, X: float, Y: float) -> Tuple[float, float]: ...
	def Deactivate(self) -> None: ...
	def Display(self) -> None: ...
	def DrawMode(self) -> Aspect_GridDrawMode: ...
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

class Aspect_ScrollDelta:
	@overload
	def __init__(self) -> None: ...
	@overload
	def __init__(self, theValue: float, theFlags: Optional[Aspect_VKeyFlags]) -> None: ...
	def HasPoint(self) -> False: ...
	def ResetPoint(self) -> None: ...

class Aspect_Touch:
	@overload
	def __init__(self) -> None: ...
	@overload
	def __init__(self, theX: float, theY: float, theIsPreciseDevice: bool) -> None: ...
	def Delta(self) -> False: ...

class Aspect_Window(Standard_Transient):
	def Background(self) -> Aspect_Background: ...
	def BackgroundFillMethod(self) -> Aspect_FillMethod: ...
	def DoMapping(self) -> bool: ...
	def DoResize(self) -> Aspect_TypeOfResize: ...
	def GradientBackground(self) -> Aspect_GradientBackground: ...
	def InvalidateContent(self, theDisp: Aspect_DisplayConnection) -> None: ...
	def IsMapped(self) -> bool: ...
	def IsVirtual(self) -> bool: ...
	def Map(self) -> None: ...
	def NativeFBConfig(self) -> Aspect_FBConfig: ...
	def Position(self) -> Tuple[int, int, int, int]: ...
	def Ratio(self) -> float: ...
	def SetBackground(self, ABack: Aspect_Background) -> None: ...
	def SetBackground(self, color: Quantity_Color) -> None: ...
	def SetBackground(self, ABackground: Aspect_GradientBackground) -> None: ...
	def SetBackground(self, theFirstColor: Quantity_Color, theSecondColor: Quantity_Color, theFillMethod: Aspect_GradientFillMethod) -> None: ...
	def SetTitle(self, theTitle: TCollection_AsciiString) -> None: ...
	def SetVirtual(self, theVirtual: bool) -> None: ...
	def Size(self) -> Tuple[int, int]: ...
	def Unmap(self) -> None: ...

class Aspect_GradientBackground(Aspect_Background):
	@overload
	def __init__(self) -> None: ...
	@overload
	def __init__(self, AColor1: Quantity_Color, AColor2: Quantity_Color, AMethod: Optional[Aspect_GradientFillMethod]) -> None: ...
	def BgGradientFillMethod(self) -> Aspect_GradientFillMethod: ...
	def Colors(self, AColor1: Quantity_Color, AColor2: Quantity_Color) -> None: ...
	def SetColors(self, AColor1: Quantity_Color, AColor2: Quantity_Color, AMethod: Optional[Aspect_GradientFillMethod]) -> None: ...