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

from OCC.Core.Graphic3d import Graphic3d_NOM_DEFAULT
from OCC.Core.BRepBuilderAPI import BRepBuilderAPI_Transform


class Layer:
    def __init__(
        self,
        from_display,
        shape=None,
        color=0,
        transparency=0.0,
        material=Graphic3d_NOM_DEFAULT,
    ):
        r"""
         Parameters
        ----------
        from_display: the display from the main code
        shape: TopoDS_Shape
        color: Quantity color
        transparency: from 0.0 to 1.0

        Returns
        -------
        None
        """
        self.clear()
        self.color = color
        self.display = from_display
        self.transparency = transparency
        self.material = material
        if shape is not None:
            self.add_shape(shape)

    def add_shape(self, shape):
        r"""
         Parameters
        ----------
        shape: TopoDS_Shape

        Returns
        -------
        None
        """
        to_display = self.display.DisplayShape(
            shape, color=self.color, material=self.material
        )[0]
        self.display.Context.SetTransparency(to_display, self.transparency, True)
        self.element_to_display[self.count] = (shape, to_display)
        self.count += 1
        self.display.Context.Erase(to_display, False)

    def replace_shape(self, shape, index):
        r"""
         Parameters
        ----------
        shape: TopoDS_Shape
        index: The index of the shape to replace

        Returns
        -------
        None
        """
        self.display.Context.Erase(self.element_to_display[index][1], False)
        self.element_to_display.pop(index)
        to_display = self.display.DisplayShape(
            shape, color=self.color, material=self.material
        )[0]
        self.display.Context.SetTransparency(to_display, self.transparency, True)
        self.element_to_display[index] = (shape, to_display)
        # self.display.Context.Erase(to_display, False)

    def update_trsf_shape(self, shape, index, transformations):
        r"""
         Parameters
        ----------
        shape: TopoDS_Shape
        index: The index of the shape to update and replace
        transformations: gp_Trsf

        Returns
        -------
        None
        """
        shape_moved = BRepBuilderAPI_Transform(shape, transformations, True).Shape()
        self.replace_shape(shape_moved, index)

    def merge(self, layer, clear=False):
        r"""
         Parameters
        ----------
        layer: name of the layer to merge to the main one
        clear: bool to clear the layer

        Returns
        -------
        None
        """
        for shape in layer.get_shapes():
            self.add_shape(shape)
        if clear is True:
            layer.clear()

    def delete_shape_with_index(self, index):
        r"""
         Parameters
        ----------
        index: index of the shape to delete from layer

        Returns
        -------
        None
        """
        self.element_to_display.pop(index)

    def delete_shape(self, shape_to_del):
        r"""
         Parameters
        ----------
        shape: the TopoDS_Shape to delete from layer

        Returns
        -------
        None
        """
        for index, element in self.element_to_display.items():
            shape, ais_shape = element
            if shape_to_del == shape:
                self.element_to_display.pop(index)

    def clear(self):
        r"""
        Clear the layer from its shapes
        """
        self.element_to_display = {}
        self.count = 0

    def get_shapes(self):
        r"""
        Returns
        -------
        List of TopoDS_Shape
        """
        topods_shapes = []
        for index, element in self.element_to_display.items():
            shape, ais_shape = element
            topods_shapes.append(shape)
        return topods_shapes

    def get_aisshape_from_topodsshape(self, topshape):
        r"""
         Parameters
        ----------
        topshape: the TopoDS_Shape linked to the AIS_Shape to retrieve

        Returns
        -------
        AIS_Shape, index of shape
        """
        for index, element in self.element_to_display.items():
            shape, ais_shape = element
            if shape == topshape:
                return ais_shape, index

    def hide(self):
        r"""
        hide the layer from display
        """
        for index, element in self.element_to_display.items():
            shape, ais_shape = element
            self.display.Context.Erase(ais_shape, False)
            self.display.View.Redraw()

    def show(self):
        r"""
        Show the layer to display
        """
        for index, element in self.element_to_display.items():
            shape, ais = element
            self.display.Context.Display(ais, True)
