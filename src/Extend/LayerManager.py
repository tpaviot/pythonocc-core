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

from typing import Dict, List, Tuple, Optional

from OCC.Core.AIS import AIS_InteractiveContext, AIS_Shape
from OCC.Core.BRepBuilderAPI import BRepBuilderAPI_Transform
from OCC.Core.gp import gp_Trsf
from OCC.Core.Graphic3d import Graphic3d_NameOfMaterial
from OCC.Core.TopoDS import TopoDS_Shape


class Layer:
    """
    Manages a collection of shapes as a layer in a 3D viewer.

    A layer holds a set of TopoDS_Shape objects and controls their visual
    properties like color, transparency, and material. It provides methods
    to add, remove, and manipulate these shapes.
    """

    def __init__(
        self,
        from_display: AIS_InteractiveContext,
        shape: Optional[TopoDS_Shape] = None,
        color: int = 0,
        transparency: float = 0.0,
        material: Graphic3d_NameOfMaterial = Graphic3d_NameOfMaterial.Graphic3d_NOM_DEFAULT,
    ) -> None:
        """
        Initializes a new Layer.

        :param from_display: The display object from the main application.
        :param shape: A shape to add to the layer upon creation. Defaults to None.
        :param color: The color of the shapes in the layer. Defaults to 0 (black).
        :param transparency: The transparency of the shapes, from 0.0 (opaque) to 1.0 (fully transparent). Defaults to 0.0.
        :param material: The material of the shapes. Defaults to Graphic3d_NOM_DEFAULT.
        """
        self.element_to_display: Dict[int, Tuple[TopoDS_Shape, AIS_Shape]] = {}
        self.count: int = 0
        self.color: int = color
        self.display: AIS_InteractiveContext = from_display
        self.transparency: float = transparency
        self.material: Graphic3d_NameOfMaterial = material
        if shape is not None:
            self.add_shape(shape)

    def add_shape(self, shape: TopoDS_Shape) -> None:
        """
        Adds a shape to the layer.

        :param shape: The TopoDS_Shape to add.
        """
        to_display = self.display.DisplayShape(
            shape, color=self.color, material=self.material
        )[0]
        self.display.Context.SetTransparency(to_display, self.transparency, True)
        self.element_to_display[self.count] = (shape, to_display)
        self.count += 1
        self.display.Context.Erase(to_display, False)

    def replace_shape(self, shape: TopoDS_Shape, index: int) -> None:
        """
        Replaces a shape in the layer at a specific index.

        :param shape: The new TopoDS_Shape.
        :param index: The index of the shape to replace.
        """
        self.display.Context.Erase(self.element_to_display[index][1], False)
        self.element_to_display.pop(index)
        to_display = self.display.DisplayShape(
            shape, color=self.color, material=self.material
        )[0]
        self.display.Context.SetTransparency(to_display, self.transparency, True)
        self.element_to_display[index] = (shape, to_display)
        # self.display.Context.Erase(to_display, False)

    def update_trsf_shape(
        self, shape: TopoDS_Shape, index: int, transformations: gp_Trsf
    ) -> None:
        """
        Applies a transformation to a shape and updates it in the layer.

        :param shape: The TopoDS_Shape to transform.
        :param index: The index of the shape to update.
        :param transformations: The gp_Trsf transformation to apply.
        """
        shape_moved = BRepBuilderAPI_Transform(shape, transformations, True).Shape()
        self.replace_shape(shape_moved, index)

    def merge(self, layer: "Layer", clear: bool = False) -> None:
        """
        Merges another layer into this one.

        :param layer: The Layer to merge from.
        :param clear: If True, the source layer is cleared after merging. Defaults to False.
        """
        for shape in layer.get_shapes():
            self.add_shape(shape)
        if clear is True:
            layer.clear()

    def delete_shape_with_index(self, index: int) -> None:
        """
        Deletes a shape from the layer by its index.

        :param index: The index of the shape to delete.
        """
        self.element_to_display.pop(index)

    def delete_shape(self, shape_to_del: TopoDS_Shape) -> None:
        """
        Deletes a shape from the layer.

        :param shape_to_del: The TopoDS_Shape to delete.
        """
        for index, element in self.element_to_display.items():
            shape, ais_shape = element
            if shape_to_del == shape:
                self.element_to_display.pop(index)

    def clear(self) -> None:
        """
        Removes all shapes from the layer.
        """
        self.element_to_display = {}
        self.count = 0

    def get_shapes(self) -> List[TopoDS_Shape]:
        """
        Gets all the shapes in the layer.

        :return: A list of TopoDS_Shape objects.
        """
        topods_shapes = []
        for index, element in self.element_to_display.items():
            shape, ais_shape = element
            topods_shapes.append(shape)
        return topods_shapes

    def get_aisshape_from_topodsshape(
        self, topshape: TopoDS_Shape
    ) -> Optional[Tuple[AIS_Shape, int]]:
        """
        Gets the displayed AIS_Shape corresponding to a TopoDS_Shape.

        :param topshape: The TopoDS_Shape to find the AIS_Shape for.
        :return: A tuple containing the AIS_Shape and its index, or None if not found.
        """
        for index, element in self.element_to_display.items():
            shape, ais_shape = element
            if shape == topshape:
                return ais_shape, index
        return None

    def hide(self) -> None:
        """
        Hides the layer from the display.
        """
        for index, element in self.element_to_display.items():
            shape, ais_shape = element
            self.display.Context.Erase(ais_shape, False)
            self.display.View.Redraw()

    def show(self) -> None:
        """
        Shows the layer in the display.
        """
        for index, element in self.element_to_display.items():
            shape, ais = element
            self.display.Context.Display(ais, True)
