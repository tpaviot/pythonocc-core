##Copyright 2023 Thomas Paviot (tpaviot@gmail.com)
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

"""The 3D viewer as a tkinter widget."""

import tkinter as tk
from typing import Optional

from OCC.Display import OCCViewer

# zoom in/out factor of one mouse wheel step
ZOOM_STEP = 1.2


class tkViewer3d(tk.Frame):
    """
    A Tkinter widget for an OCC viewer.

    The viewer is created when the widget is mapped, it is available as the
    display property from then on.
    """

    def __init__(
        self, parent: "tk.Widget", width: int = 1024, height: int = 768
    ) -> None:
        """
        Initializes the tkViewer3d.

        Args:
            parent: The parent widget.
            width (int, optional): The initial width of the widget, in pixels.
            height (int, optional): The initial height of the widget, in pixels.
        """
        tk.Frame.__init__(self, parent, width=width, height=height)
        self.bind("<Map>", self.Map)
        self.bind("<Configure>", self.Resize)
        self.bind("<B1-Motion>", self.Rotate)
        self.bind("<Button-1>", self.LeftDown)
        self.bind("<B2-Motion>", self.Pan)
        self.bind("<Button-2>", self.LeftDown)
        # zoom
        self.bind("<MouseWheel>", self.Zoom)  # windows, macOS
        self.bind("<Button-4>", self.Zoom)  # Linux
        self.bind("<Button-5>", self.Zoom)  # Linux

        self._display: Optional[OCCViewer.Viewer3d] = None
        self._inited = False

        self.drag_pos_y = self.drag_pos_x = 0

    @property
    def display(self) -> OCCViewer.Viewer3d:
        """The Viewer3d instance, created when the widget is first mapped."""
        if self._display is None:
            raise RuntimeError("the viewer is created once the widget is mapped")
        return self._display

    def LeftDown(self, event: "tk.Event") -> None:
        """
        Called when the left mouse button is pressed.
        """
        self.drag_pos_x = event.x
        self.drag_pos_y = event.y
        self.display.StartRotation(self.drag_pos_x, self.drag_pos_y)

    def Rotate(self, event: "tk.Event") -> None:
        """
        Called when the mouse is moved with the left button pressed.
        """
        self.display.Rotation(event.x, event.y)

    def Pan(self, event: "tk.Event") -> None:
        """
        Called when the mouse is moved with the middle button pressed.
        """
        dx = event.x - self.drag_pos_x
        dy = event.y - self.drag_pos_y
        self.drag_pos_x = event.x
        self.drag_pos_y = event.y
        self.display.Pan(dx, -dy)

    def Zoom(self, event: "tk.Event") -> None:
        """
        Called when the mouse wheel is scrolled, zooms in or out.
        """
        # X11 reports the wheel as buttons 4 and 5, Windows and macOS as the
        # sign of delta
        if event.num == 4 or event.delta > 0:
            zoom_factor = ZOOM_STEP
        elif event.num == 5 or event.delta < 0:
            zoom_factor = 1.0 / ZOOM_STEP
        else:
            return
        self.display.ZoomFactor(zoom_factor)

    def Resize(self, event: "tk.Event") -> None:
        """
        Called when the widget is resized.
        """
        if self._inited:
            self.display.OnResize()
            self.display.Repaint()

    def Map(self, event: "tk.Event") -> None:
        """
        Called when the widget is mapped, creates the viewer.
        """
        if not self._inited:
            self._display = OCCViewer.Viewer3d()
            self._display.Create(window_handle=self.winfo_id(), parent=self)
            self._display.SetModeShaded()
            self._inited = True
