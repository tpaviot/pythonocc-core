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

import tkinter as tk

from OCC.Display import OCCViewer


class tkViewer3d(tk.Frame):
    def __init__(self, parent, default=""):
        tk.Frame.__init__(self, parent, width=1024, height=768)
        self.bind("<Map>", self.Map)
        self.bind("<Configure>", self.Resize)
        self.bind("<B1-Motion>", self.Rotate)
        self.bind("<Button-1>", self.LeftDown)
        self.bind("<B2-Motion>", self.Pan)
        self.bind("<Button-2>", self.LeftDown)
        # zoom
        self.bind("<MouseWheel>", self.Zoom)  # windows
        self.bind("<Button-4>", self.Zoom)  # Linux
        self.bind("<Button-5>", self.Zoom)  # Linux

        self._display = None
        self._inited = False

        self.drag_pos_y = self.drag_pos_x = 0

    def LeftDown(self, event):
        self.drag_pos_x = event.x
        self.drag_pos_y = event.y
        self._display.StartRotation(self.drag_pos_x, self.drag_pos_y)

    def Rotate(self, event):
        self._display.Rotation(event.x, event.y)

    def Pan(self, event):
        dx = event.x - self.drag_pos_x
        dy = event.y - self.drag_pos_y
        self.drag_pos_x = event.x
        self.drag_pos_y = event.y
        self._display.Pan(dx, -dy)

    def Zoom(self, event):
        if event.num == 4:  # zoom in
            zoom_factor = 2.0
        elif event.num == 5:  # zoom out
            zoom_factor = 0.5
        self._display.ZoomFactor(zoom_factor)

    def Resize(self, event):
        if self._inited:
            self._display.Repaint()

    def Map(self, event):
        if not self._inited:
            self._display = OCCViewer.Viewer3d()
            self._display.Create(window_handle=self.winfo_id(), parent=self)
            self._display.SetModeShaded()
            self._inited = True
