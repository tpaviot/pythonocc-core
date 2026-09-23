##Copyright 2026 Thomas Paviot (tpaviot@gmail.com)
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

"""Tests of the Viewer3d API with the offscreen renderer."""

import pytest

from OCC.Core.BRepPrimAPI import BRepPrimAPI_MakeBox
from OCC.Core.Quantity import Quantity_Color, Quantity_NOC_BLACK
from OCC.Display.OCCViewer import OffscreenRenderer, get_color_from_name
from OCC.Extend.LayerManager import Layer


@pytest.fixture
def renderer():
    # the offscreen renderer still needs a display connection on Linux,
    # not available on headless CI machines
    try:
        return OffscreenRenderer()
    except RuntimeError as e:
        pytest.skip(str(e))


def test_get_color_from_name():
    assert get_color_from_name("black").IsEqual(Quantity_Color(Quantity_NOC_BLACK))
    # any name of the Quantity_NameOfColor enumeration, case insensitive
    magenta = get_color_from_name("Magenta")
    assert (magenta.Red(), magenta.Green(), magenta.Blue()) == (1.0, 0.0, 1.0)
    # names declined in shades: the first shade is used
    assert get_color_from_name("blue").IsEqual(get_color_from_name("BLUE1"))
    # unknown names fall back to white
    white = get_color_from_name("nosuchcolor")
    assert (white.Red(), white.Green(), white.Blue()) == (1.0, 1.0, 1.0)


def test_select_then_get_selected_shape(renderer):
    # the selected shape can be queried from the context after Select(),
    # as core_display_activate_manipulator.py does
    box = BRepPrimAPI_MakeBox(15.0, 15.0, 15.0).Shape()
    renderer.DisplayShape(box, update=True, dump_image=False)
    width, height = renderer.GetSize()
    renderer.MoveTo(width // 2, height // 2)
    renderer.Select(width // 2, height // 2)
    assert len(renderer.GetSelectedShapes()) == 1
    assert not renderer.GetSelectedShape().IsNull()


def test_layer_default_color_is_not_black(renderer):
    # Layer displays its shapes with color=0, meaning "no color": the
    # default material color is kept, not Quantity_NOC_BLACK
    layer = Layer(renderer, BRepPrimAPI_MakeBox(15.0, 15.0, 15.0).Shape())
    layer.show()
    renderer.FitAll()
    width, height = renderer.GetSize()
    renderer.MoveTo(width // 2, height // 2)
    renderer.Select(width // 2, height // 2)
    ais_shape, _ = layer.get_aisshape_from_topodsshape(renderer.GetSelectedShape())
    assert not ais_shape.HasColor()
    # an explicit color is applied
    layer_red = Layer(
        renderer,
        BRepPrimAPI_MakeBox(5.0, 5.0, 5.0).Shape(),
        color=get_color_from_name("red"),
    )
    layer_red.show()
    assert all(ais.HasColor() for _, ais in layer_red.element_to_display.values())
