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

from __future__ import print_function

import time

try:
    import wx
except ImportError:
    raise ImportError('Please install wxPython.')
from OCC.Display import OCCViewer


class wxBaseViewer(wx.Panel):
    def __init__(self, parent=None):
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

        self._display = None
        self._inited = False

    def GetWinId(self):
        """ Returns the windows Id as an integer.
        issue with GetHandle on Linux for wx versions
        >3 or 4. Window must be displayed before GetHandle is
        called. For that, just wait for a few milliseconds/seconds
        before calling InitDriver
        a solution is given here
        see https://github.com/cztomczak/cefpython/issues/349
        but raises an issue with wxPython 4.x
        finally, it seems that the sleep function does the job
        reported as a pythonocc issue
        https://github.com/tpaviot/pythonocc-core/476
        """
        timeout = 10  # 10 seconds
        win_id = self.GetHandle()
        init_time = time.time()
        delta_t = 0.  # elapsed time, initialized to 0 before the while loop
        # if ever win_id is 0, enter the loop untill it gets a value
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

    def OnSize(self, event):
        if self._inited:
            self._display.OnResize()

    def OnIdle(self, event):
        pass

    def OnMove(self, event):
        pass

    def OnFocus(self, event):
        pass

    def OnLostFocus(self, event):
        pass

    def OnMaximize(self, event):
        pass

    def OnLeftDown(self, event):
        pass

    def OnRightDown(self, event):
        pass

    def OnMiddleDown(self, event):
        pass

    def OnLeftUp(self, event):
        pass

    def OnRightUp(self, event):
        pass

    def OnMiddleUp(self, event):
        pass

    def OnMotion(self, event):
        pass

    def OnKeyDown(self, event):
        pass


class wxViewer3d(wxBaseViewer):
    def __init__(self, *kargs):
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
        self._key_map = {}
        self.dragStartPos = None

    def InitDriver(self):
        self._display = OCCViewer.Viewer3d(self.GetWinId())
        self._display.Create()
        self._display.SetModeShaded()
        self._inited = True

        # dict mapping keys to functions
        self._SetupKeyMap()

    def _SetupKeyMap(self):
        def set_shade_mode():
            self._display.DisableAntiAliasing()
            self._display.SetModeShaded()
        self._key_map = {ord('W'): self._display.SetModeWireFrame,
                         ord('S'): set_shade_mode,
                         ord('A'): self._display.EnableAntiAliasing,
                         ord('B'): self._display.DisableAntiAliasing,
                         ord('H'): self._display.SetModeHLR,
                         ord('G'): self._display.SetSelectionModeVertex
                        }

    def OnKeyDown(self, evt):
        code = evt.GetKeyCode()
        try:
            self._key_map[code]()
        except KeyError:
            print('unrecognized key %i' % evt.GetKeyCode())

    def OnMaximize(self, event):
        if self._inited:
            self._display.Repaint()

    def OnMove(self, event):
        if self._inited:
            self._display.Repaint()

    def OnIdle(self, event):
        if self._drawbox:
            pass
        elif self._inited:
            self._display.Repaint()

    def Test(self):
        if self._inited:
            self._display.Test()

    def OnFocus(self, event):
        if self._inited:
            self._display.Repaint()

    def OnLostFocus(self, event):
        if self._inited:
            self._display.Repaint()

    def OnPaint(self, event):
        if self._inited:
            self._display.Repaint()

    def ZoomAll(self, evt):
        self._display.FitAll()

    def Repaint(self, evt):
        if self._inited:
            self._display.Repaint()

    def OnLeftDown(self, evt):
        self.SetFocus()
        self.dragStartPos = evt.GetPosition()
        self._display.StartRotation(self.dragStartPos.x, self.dragStartPos.y)

    def OnLeftUp(self, evt):
        pt = evt.GetPosition()
        if self._select_area:
            [Xmin, Ymin, dx, dy] = self._drawbox
            self._display.SelectArea(Xmin, Ymin, Xmin+dx, Ymin+dy)
            self._select_area = False
        else:
            self._display.Select(pt.x, pt.y)

    def OnRightUp(self, evt):
        if self._zoom_area:
            [Xmin, Ymin, dx, dy] = self._drawbox
            self._display.ZoomArea(Xmin, Ymin, Xmin+dx, Ymin+dy)
            self._zoom_area = False

    def OnMiddleUp(self, evt):
        pass

    def OnRightDown(self, evt):
        self.dragStartPos = evt.GetPosition()
        self._display.StartRotation(self.dragStartPos.x, self.dragStartPos.y)

    def OnMiddleDown(self, evt):
        self.dragStartPos = evt.GetPosition()
        self._display.StartRotation(self.dragStartPos.x, self.dragStartPos.y)

    def OnWheelScroll(self, evt):
        # Zooming by wheel
        if evt.GetWheelRotation() > 0:
            zoom_factor = 2.
        else:
            zoom_factor = 0.5
        self._display.Repaint()
        self._display.ZoomFactor(zoom_factor)

    def DrawBox(self, event):
        tolerance = 2
        pt = event.GetPosition()
        dx = pt.x - self.dragStartPos.x
        dy = pt.y - self.dragStartPos.y
        if abs(dx) <= tolerance and abs(dy) <= tolerance:
            return
        dc = wx.ClientDC(self)
        dc.BeginDrawing()
        dc.SetPen(wx.Pen(wx.WHITE, 1, wx.DOT))
        dc.SetBrush(wx.TRANSPARENT_BRUSH)
        dc.SetLogicalFunction(wx.XOR)
        if self._drawbox:
            r = wx.Rect(*self._drawbox)
            dc.DrawRectangleRect(r)
        r = wx.Rect(self.dragStartPos.x, self.dragStartPos.y, dx, dy)
        dc.DrawRectangleRect(r)
        dc.EndDrawing()
        self._drawbox = [self.dragStartPos.x, self.dragStartPos.y, dx, dy]

    def OnMotion(self, evt):
        pt = evt.GetPosition()

        # ROTATE
        if evt.LeftIsDown() and not evt.ShiftDown():
            self._display.Rotation(pt.x, pt.y)
            self._drawbox = False
        # DYNAMIC ZOOM
        elif evt.RightIsDown() and not evt.ShiftDown():
            self._display.Repaint()
            self._display.DynamicZoom(abs(self.dragStartPos.x), abs(self.dragStartPos.y), abs(pt.x), abs(pt.y))
            self.dragStartPos.x = pt.x
            self.dragStartPos.y = pt.y
            self._drawbox = False
        # PAN
        elif evt.MiddleIsDown():
            dx = pt.x - self.dragStartPos.x
            dy = pt.y - self.dragStartPos.y
            self.dragStartPos.x = pt.x
            self.dragStartPos.y = pt.y
            self._display.Pan(dx, -dy)
            self._drawbox = False
        # DRAW BOX
        elif evt.RightIsDown() and evt.ShiftDown():  # ZOOM WINDOW
            self._zoom_area = True
            self.DrawBox(evt)
        elif evt.LeftIsDown() and evt.ShiftDown():  # SELECT AREA
            self._select_area = True
            self.DrawBox(evt)
        else:
            self._drawbox = False
            self._display.MoveTo(pt.x, pt.y)


def TestWxDisplay():
    class AppFrame(wx.Frame):
        def __init__(self, parent):
            wx.Frame.__init__(self, parent, -1, "wxDisplay3d sample",
                              style=wx.DEFAULT_FRAME_STYLE, size=(640, 480))
            self.canva = wxViewer3d(self)

        def runTests(self):
            self.canva._display.Test()

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
