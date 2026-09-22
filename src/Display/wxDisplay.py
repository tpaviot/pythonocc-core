#!/usr/bin/env python

##Copyright 2008-2017 Thomas Paviot (tpaviot@gmail.com)
##
##This file is part of pythonOCC.
##
##pythonOCC is free software: you can redistribute it and/or modify
##it under the terms of the GNU Lesser General Public License as published by
##the Free Software Foundation, either version 3 of the License, or
##(at your option) any later version.
##
##pythonOCC is distributed in the hope that it will be useful,
##but WITHOUT ANY WARRANTY; without even the implied warranty of
##MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##GNU Lesser General Public License for more details.
##
##You should have received a copy of the GNU Lesser General Public License
##along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.


"""The 3D viewer as a wxPython panel."""

import logging
import time
from typing import Any, Callable, Optional

try:
    import wx
except ImportError:
    raise ImportError("Please install wxPython.") from None
from OCC.Display import OCCViewer

log = logging.getLogger(__name__)


class wxBaseViewer(wx.Panel):
    """
    The base wx.Panel for an OCC viewer.
    """

    def __init__(self, parent: Optional[Any] = None) -> None:
        """
        Initializes the wxBaseViewer.

        Args:
            parent (wx.Window, optional): The parent window.
        """
        wx.Panel.__init__(self, parent)
        self.Bind(wx.EVT_SIZE, self.OnSize)
        self.Bind(wx.EVT_IDLE, self.OnIdle)
        self.Bind(wx.EVT_MOVE, self.OnMove)
        self.Bind(wx.EVT_SET_FOCUS, self.OnFocus)
        self.Bind(wx.EVT_KILL_FOCUS, self.OnLostFocus)
        self.Bind(wx.EVT_MAXIMIZE, self.OnMaximize)
        self.Bind(wx.EVT_LEFT_DOWN, self.OnLeftDown)
        self.Bind(wx.EVT_RIGHT_DOWN, self.OnRightDown)
        self.Bind(wx.EVT_MIDDLE_DOWN, self.OnMiddleDown)
        self.Bind(wx.EVT_LEFT_UP, self.OnLeftUp)
        self.Bind(wx.EVT_RIGHT_UP, self.OnRightUp)
        self.Bind(wx.EVT_MIDDLE_UP, self.OnMiddleUp)
        self.Bind(wx.EVT_MOTION, self.OnMotion)
        self.Bind(wx.EVT_KEY_DOWN, self.OnKeyDown)
        self.Bind(wx.EVT_MOUSEWHEEL, self.OnWheelScroll)

        self._display: Optional[OCCViewer.Viewer3d] = None
        self._inited = False

    @property
    def display(self) -> OCCViewer.Viewer3d:
        """The Viewer3d instance, created by InitDriver."""
        if self._display is None:
            raise RuntimeError("the viewer is created by InitDriver")
        return self._display

    def GetWinId(self) -> int:
        """
        Returns the windows Id as an integer.

        On Linux, the window must be displayed before GetHandle is called.
        For that, we wait for a few milliseconds/seconds before calling InitDriver.
        """
        timeout = 10  # 10 seconds
        win_id = self.GetHandle()
        init_time = time.time()
        delta_t = 0.0  # elapsed time, initialized to 0 before the while loop
        # if ever win_id is 0, enter the loop until it gets a value
        while win_id == 0 and delta_t < timeout:
            time.sleep(0.1)
            wx.SafeYield()
            win_id = self.GetHandle()
            delta_t = time.time() - init_time
        # check that win_id is different from 0
        if win_id == 0:
            raise AssertionError("Can't get win Id")
        # otherwise returns the window Id
        return win_id

    def OnSize(self, event: Any) -> None:
        """
        Called when the widget is resized.
        """
        if self._inited:
            self._display.OnResize()

    def OnIdle(self, event: Any) -> None:
        """
        Called when the application is idle.
        """

    def OnMove(self, event: Any) -> None:
        """
        Called when the widget is moved.
        """

    def OnFocus(self, event: Any) -> None:
        """
        Called when the widget gains focus.
        """

    def OnLostFocus(self, event: Any) -> None:
        """
        Called when the widget loses focus.
        """

    def OnMaximize(self, event: Any) -> None:
        """
        Called when the widget is maximized.
        """

    def OnLeftDown(self, event: Any) -> None:
        """
        Called when the left mouse button is pressed.
        """

    def OnRightDown(self, event: Any) -> None:
        """
        Called when the right mouse button is pressed.
        """

    def OnMiddleDown(self, event: Any) -> None:
        """
        Called when the middle mouse button is pressed.
        """

    def OnLeftUp(self, event: Any) -> None:
        """
        Called when the left mouse button is released.
        """

    def OnRightUp(self, event: Any) -> None:
        """
        Called when the right mouse button is released.
        """

    def OnMiddleUp(self, event: Any) -> None:
        """
        Called when the middle mouse button is released.
        """

    def OnMotion(self, event: Any) -> None:
        """
        Called when the mouse is moved.
        """

    def OnKeyDown(self, event: Any) -> None:
        """
        Called when a key is pressed.
        """


class wxViewer3d(wxBaseViewer):
    """
    A wx.Panel for an OCC viewer.
    """

    def __init__(self, *kargs: Any) -> None:
        """
        Initializes the wxViewer3d.
        """
        wxBaseViewer.__init__(self, *kargs)

        self._drawbox = False
        self._zoom_area = False
        self._select_area = False
        self._inited = False
        self._leftisdown = False
        self._middleisdown = False
        self._rightisdown = False
        self._selection = None
        self._scrollwheel = False
        self._key_map: dict[int, Callable] = {}
        self.dragStartPos = None

    def InitDriver(self) -> None:
        """
        Initializes the driver.
        """
        self._display = OCCViewer.Viewer3d()
        self._display.Create(window_handle=self.GetWinId(), parent=self)

        self._display.SetModeShaded()
        self._inited = True

        # dict mapping keys to functions
        self._SetupKeyMap()

    def _SetupKeyMap(self) -> None:
        """
        Sets up the key map.
        """

        def set_shade_mode():
            self._display.DisableAntiAliasing()
            self._display.SetModeShaded()

        self._key_map = {
            ord("W"): self._display.SetModeWireFrame,
            ord("S"): set_shade_mode,
            ord("A"): self._display.EnableAntiAliasing,
            ord("B"): self._display.DisableAntiAliasing,
            ord("H"): self._display.SetModeHLR,
            ord("G"): self._display.SetSelectionModeVertex,
            306: lambda: log.debug("Shift pressed"),
        }

    def OnKeyDown(self, event: Any) -> None:
        """
        Called when a key is pressed.
        """
        code = event.GetKeyCode()
        if code in self._key_map:
            self._key_map[code]()
            log.info("Key pressed: %i", code)
        else:
            log.info("Unrecognized key pressed %i", code)

    def OnMaximize(self, event: Any) -> None:
        """
        Called when the widget is maximized.
        """
        if self._inited:
            self._display.Repaint()

    def OnMove(self, event: Any) -> None:
        """
        Called when the widget is moved.
        """
        if self._inited:
            self._display.Repaint()

    def OnIdle(self, event: Any) -> None:
        """
        Called when the application is idle.
        """
        if self._drawbox:
            pass
        elif self._inited:
            self._display.Repaint()

    def Test(self) -> None:
        """
        Runs a test.
        """
        if self._inited:
            self._display.Test()

    def OnFocus(self, event: Any) -> None:
        """
        Called when the widget gains focus.
        """
        if self._inited:
            self._display.Repaint()

    def OnLostFocus(self, event: Any) -> None:
        """
        Called when the widget loses focus.
        """
        if self._inited:
            self._display.Repaint()

    def OnPaint(self, event: Any) -> None:
        """
        Called when the widget is painted.
        """
        if self._inited:
            self._display.Repaint()

    def ZoomAll(self, event: Any) -> None:
        """
        Zooms to fit all objects in the view.
        """
        self._display.FitAll()

    def Repaint(self, event: Any) -> None:
        """
        Repaints the view.
        """
        if self._inited:
            self._display.Repaint()

    def OnLeftDown(self, event: Any) -> None:
        """
        Called when the left mouse button is pressed.
        """
        self.SetFocus()
        self.dragStartPos = event.GetPosition()
        self._display.StartRotation(self.dragStartPos.x, self.dragStartPos.y)

    def OnLeftUp(self, event: Any) -> None:
        """
        Called when the left mouse button is released.
        """
        pt = event.GetPosition()
        if self._select_area:
            [Xmin, Ymin, dx, dy] = self._drawbox
            self._display.SelectArea(Xmin, Ymin, Xmin + dx, Ymin + dy)
            self._select_area = False
        else:
            self._display.Select(pt.x, pt.y)

    def OnRightUp(self, event: Any) -> None:
        """
        Called when the right mouse button is released.
        """
        if self._zoom_area:
            [Xmin, Ymin, dx, dy] = self._drawbox
            self._display.ZoomArea(Xmin, Ymin, Xmin + dx, Ymin + dy)
            self._zoom_area = False

    def OnMiddleUp(self, event: Any) -> None:
        """
        Called when the middle mouse button is released.
        """

    def OnRightDown(self, event: Any) -> None:
        """
        Called when the right mouse button is pressed.
        """
        self.dragStartPos = event.GetPosition()
        self._display.StartRotation(self.dragStartPos.x, self.dragStartPos.y)

    def OnMiddleDown(self, event: Any) -> None:
        """
        Called when the middle mouse button is pressed.
        """
        self.dragStartPos = event.GetPosition()
        self._display.StartRotation(self.dragStartPos.x, self.dragStartPos.y)

    def OnWheelScroll(self, event: Any) -> None:
        """
        Called when the mouse wheel is scrolled.
        """
        # Zooming by wheel
        zoom_factor = 2.0 if event.GetWheelRotation() > 0 else 0.5
        self._display.Repaint()
        self._display.ZoomFactor(zoom_factor)

    def DrawBox(self, event: Any) -> None:
        """
        Draws a selection box.
        """
        tolerance = 2
        pt = event.GetPosition()
        dx = pt.x - self.dragStartPos.x
        dy = pt.y - self.dragStartPos.y
        if abs(dx) <= tolerance and abs(dy) <= tolerance:
            return
        dc = wx.ClientDC(self)
        dc.SetPen(wx.Pen(wx.WHITE, 1, wx.DOT))
        dc.SetBrush(wx.TRANSPARENT_BRUSH)
        dc.SetLogicalFunction(wx.XOR)
        if self._drawbox:
            r = wx.Rect(*self._drawbox)
            dc.DrawRectangle(r)
        r = wx.Rect(self.dragStartPos.x, self.dragStartPos.y, dx, dy)
        dc.DrawRectangle(r)
        self._drawbox = [self.dragStartPos.x, self.dragStartPos.y, dx, dy]

    def OnMotion(self, event: Any) -> None:
        """
        Called when the mouse is moved.
        """
        pt = event.GetPosition()

        # ROTATE
        if event.LeftIsDown() and not event.ShiftDown():
            self._display.Rotation(pt.x, pt.y)
            self._drawbox = False
        # DYNAMIC ZOOM
        elif event.RightIsDown() and not event.ShiftDown():
            self._display.Repaint()
            self._display.DynamicZoom(
                abs(self.dragStartPos.x), abs(self.dragStartPos.y), abs(pt.x), abs(pt.y)
            )
            self.dragStartPos.x = pt.x
            self.dragStartPos.y = pt.y
            self._drawbox = False
        # PAN
        elif event.MiddleIsDown():
            dx = pt.x - self.dragStartPos.x
            dy = pt.y - self.dragStartPos.y
            self.dragStartPos.x = pt.x
            self.dragStartPos.y = pt.y
            self._display.Pan(dx, -dy)
            self._drawbox = False
        # DRAW BOX
        elif event.RightIsDown() and event.ShiftDown():  # ZOOM WINDOW
            self._zoom_area = True
            self.DrawBox(event)
        elif event.LeftIsDown() and event.ShiftDown():  # SELECT AREA
            self._select_area = True
            self.DrawBox(event)
        else:
            self._drawbox = False
            self._display.MoveTo(pt.x, pt.y)


def TestWxDisplay() -> None:
    """
    A test function for the wxViewer3d.
    """

    class AppFrame(wx.Frame):
        def __init__(self, parent: Optional[Any]) -> None:
            wx.Frame.__init__(
                self,
                parent,
                -1,
                "wxDisplay3d sample",
                style=wx.DEFAULT_FRAME_STYLE,
                size=(640, 480),
            )
            self.canva = wxViewer3d(self)

        def runTests(self) -> None:
            self.canva.display.Test()

    app = wx.App(False)
    wx.InitAllImageHandlers()
    frame = AppFrame(None)
    frame.Show(True)
    wx.SafeYield()
    frame.canva.InitDriver()
    frame.runTests()
    app.SetTopWindow(frame)
    app.MainLoop()


if __name__ == "__main__":
    TestWxDisplay()
