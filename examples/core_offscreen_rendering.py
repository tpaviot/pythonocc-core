##Copyright 2017 Thomas Paviot (tpaviot@gmail.com)
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

from OCC.Display.OCCViewer import Display3d, Viewer3d
from OCC.BRepPrimAPI import BRepPrimAPI_MakeBox

# create the renderer
offscreen_renderer = Viewer3d(None)
offscreen_renderer.Create()
offscreen_renderer.SetSize(1024, 768)
offscreen_renderer.SetModeShaded()

# then the shape
my_box = BRepPrimAPI_MakeBox(10., 20., 30.).Shape()

# send the shape to the renderer
offscreen_renderer.DisplayShape(my_box, update=True)
#start_display()
data = offscreen_renderer.GetImageData(1)

# export the view to image
offscreen_renderer.View.Dump('./capture_jpeg.jpeg')
