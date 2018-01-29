# This file is part of pythonOCC.
##
# pythonOCC is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
##
# pythonOCC is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
##
# You should have received a copy of the GNU Lesser General Public License
# along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.

from __future__ import print_function

from random import random

from OCC.Core.AIS import AIS_ColoredShape
from OCC.Core.BRepPrimAPI import BRepPrimAPI_MakeBox
from OCC.Display.OCCViewer import rgb_color
from OCC.Display.SimpleGui import init_display
from OCC.Extend.TopologyUtils import TopologyExplorer

display, start_display, add_menu, add_function_to_menu = init_display()

my_box = BRepPrimAPI_MakeBox(10., 20., 30.).Shape()

ais = AIS_ColoredShape(my_box)

for fc in TopologyExplorer(my_box).faces():
    # set a custom color per-face
    ais.SetCustomColor(fc, rgb_color(random(), random(), random()))

display.Context.Display(ais.GetHandle())
display.FitAll()

start_display()
