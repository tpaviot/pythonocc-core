##Copyright 2021 Tanneguy de Villemagne (tanneguydv@gmail.com)
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


class Layer:
    def __init__(self, from_display, shape=None, color=0):
        """
        :param from_display: the display from the main code
        :param shape: TopoDS_Shape
        :param color: Quantity color
        """
        self.clear()
        self.color = color
        self.display = from_display
        if shape is not None:
            self.add(shape)

    def add(self, shape):
        self.to_display = {self.count}
        self.to_display = self.display.DisplayShape(shape, color=self.color)[0]
        self.list_to_display.append(self.to_display)
        self.shapes.append(shape)
        self.count += 1
        self.display.Context.Erase(self.to_display, False)

    def clear(self):
        self.list_to_display = []
        self.count = 0
        self.to_display = {self.count}
        self.shapes = []

    def get_shapes(self):
        """
        :return: TopoDS_Shape
        """
        return self.shapes

    def hide(self):
        for shape in self.list_to_display:
            self.display.Context.Erase(shape, False)

    def merge(self, layer, clear=False):
        """
        :param layer: name of the layer to merge to the main one
        :param clear: bool to clear the layer
        :return: None
        """
        for shape in layer.get_shapes():
            self.add(shape)
        if clear is True:
            layer.clear()

    def show(self):
        for shape in self.list_to_display:
            self.display.Context.Display(shape, True)
