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

import enum
from functools import reduce
import itertools
import math
import uuid
import sys
from typing import Any, Callable, Dict, List, Optional, Tuple, Union

# pythreejs
try:
    from pythreejs import (
        CombinedCamera,
        BufferAttribute,
        BufferGeometry,
        Mesh,
        LineSegmentsGeometry,
        LineMaterial,
        LineSegments2,
        AmbientLight,
        DirectionalLight,
        Scene,
        OrbitControls,
        Renderer,
        Picker,
        Group,
        GridHelper,
        Line,
        ShaderMaterial,
        ShaderLib,
        LineBasicMaterial,
        PointsMaterial,
        Points,
        make_text,
    )
    from IPython.display import display, SVG
    from ipywidgets import HTML, HBox, VBox, Checkbox, Button, Layout, Dropdown, embed
    import numpy as np
except ImportError:
    error_log = """ Error You must install pythreejs/ipywidgets/numpy to run the jupyter notebook renderer.
If you installed pythonocc using conda, just type :
$ conda install -c conda-forge pythreejs"""
    print(error_log)
    sys.exit(0)


from OCC.Core.Bnd import Bnd_Box
from OCC.Core.BRepPrimAPI import BRepPrimAPI_MakeSphere
from OCC.Core.BRepBndLib import brepbndlib
from OCC.Core.gp import gp_Pnt, gp_Dir
from OCC.Core.TopoDS import TopoDS_Compound
from OCC.Core.BRepBuilderAPI import BRepBuilderAPI_MakeVertex
from OCC.Core.BRep import BRep_Builder
from OCC.Core.Tesselator import ShapeTesselator

from OCC.Extend.TopologyUtils import (
    TopologyExplorer,
    is_edge,
    is_wire,
    discretize_edge,
    discretize_wire,
    get_type_as_string,
)
from OCC.Extend.ShapeFactory import (
    get_oriented_boundingbox,
    get_aligned_boundingbox,
    measure_shape_mass_center_of_gravity,
    recognize_face,
)
from OCC.Extend.DataExchange import export_shape_to_svg


#
# Util mathematical functions
#
def _add(vec1: List[float], vec2: List[float]) -> List[float]:
    """Adds two vectors."""
    return [v1 + v2 for v1, v2 in zip(vec1, vec2)]


def _explode(edge_list: List[List[float]]) -> List[List[List[float]]]:
    """Explodes a list of edges into a list of segments."""
    return [[edge_list[i], edge_list[i + 1]] for i in range(len(edge_list) - 1)]


def _flatten(nested_dict: Dict[Any, Any]) -> List[Any]:
    """Flattens a nested dictionary."""
    return [y for x in nested_dict for y in x]


def format_color(r: int, g: int, b: int) -> str:
    """Formats a color from RGB to a hex string."""
    return "#%02x%02x%02x" % (r, g, b)


def _distance(v1: List[float], v2: List[float]) -> float:
    """Computes the distance between two vectors."""
    return np.linalg.norm([x - y for x, y in zip(v1, v2)])


def _bool_or_new(val: Union[bool, Dict[str, Any]]) -> bool:
    """Returns the value of a boolean or a new value."""
    return val if isinstance(val, bool) else val["new"]


def _opt(b1: Tuple[float, ...], b2: Tuple[float, ...]) -> Tuple[float, ...]:
    """Returns the union of two bounding boxes."""
    return (
        min(b1[0], b2[0]),
        max(b1[1], b2[1]),
        min(b1[2], b2[2]),
        max(b1[3], b2[3]),
        min(b1[4], b2[4]),
        max(b1[5], b2[5]),
    )


def _shift(v: List[float], offset: List[float]) -> List[float]:
    """Shifts a vector by an offset."""
    return [x + o for x, o in zip(v, offset)]


# https://stackoverflow.com/questions/4947682/intelligently-calculating-chart-tick-positions
def _nice_number(value: float, round_: bool = False) -> float:
    """
    Returns a "nice" number approximately equal to value.

    Args:
        value (float): The value to make nice.
        round_ (bool, optional): Whether to round the number. Defaults to False.

    Returns:
        float: The nice number.
    """
    exponent = math.floor(math.log(value, 10))
    fraction = value / 10**exponent

    if round_:
        if fraction < 1.5:
            nice_fraction = 1.0
        elif fraction < 3.0:
            nice_fraction = 2.0
        elif fraction < 7.0:
            nice_fraction = 5.0
        else:
            nice_fraction = 10.0
    elif fraction <= 1:
        nice_fraction = 1.0
    elif fraction <= 2:
        nice_fraction = 2.0
    elif fraction <= 5:
        nice_fraction = 5.0
    else:
        nice_fraction = 10.0

    return nice_fraction * 10**exponent


def _nice_bounds(
    axis_start: float, axis_end: float, num_ticks: int = 10
) -> Tuple[float, float, float]:
    """
    Returns "nice" bounds for a given axis.

    Args:
        axis_start (float): The start of the axis.
        axis_end (float): The end of the axis.
        num_ticks (int, optional): The number of ticks. Defaults to 10.

    Returns:
        A tuple containing the nice start, nice end, and nice tick.
    """
    axis_width = axis_end - axis_start
    if axis_width == 0:
        nice_tick = 0
    else:
        nice_range = _nice_number(axis_width)
        nice_tick = _nice_number(nice_range / (num_ticks - 1), round_=True)
        axis_start = math.floor(axis_start / nice_tick) * nice_tick
        axis_end = math.ceil(axis_end / nice_tick) * nice_tick

    return axis_start, axis_end, nice_tick


#
# Helpers
#
class Helpers:
    """
    A base class for helpers.
    """

    def __init__(self, bb_center: Tuple[float, float, float]) -> None:
        """
        Initializes the Helpers.

        Args:
            bb_center: The center of the bounding box.
        """
        self.bb_center = bb_center
        self.center = (0, 0, 0)

    def _center(self, zero: bool = True) -> Tuple[float, float, float]:
        """
        Returns the center of the bounding box.

        Args:
            zero (bool, optional): Whether to return the origin. Defaults to True.

        Returns:
            The center of the bounding box.
        """
        return self.center if zero else self.bb_center

    def set_position(self, position: Tuple[float, float, float]) -> None:
        """
        Sets the position of the helper.

        Args:
            position: The position to set.
        """
        raise NotImplementedError()

    def set_visibility(self, change: bool) -> None:
        """
        Sets the visibility of the helper.

        Args:
            change: The visibility to set.
        """
        raise NotImplementedError()

    def set_center(self, change: bool) -> None:
        """
        Sets the center of the helper.

        Args:
            change: The center to set.
        """
        self.set_position(self._center(change))


#
# Grid helper
#
class Grid(Helpers):
    """
    A grid helper.
    """

    def __init__(
        self,
        bb_center: Optional[Tuple[float, float, float]] = None,
        maximum: int = 5,
        ticks: int = 10,
        colorCenterLine: str = "#aaa",
        colorGrid: str = "#ddd",
    ) -> None:
        """
        Initializes the Grid.

        Args:
            bb_center (tuple, optional): The center of the bounding box.
            maximum (int, optional): The maximum size of the grid.
            ticks (int, optional): The number of ticks in the grid.
            colorCenterLine (str, optional): The color of the center line.
            colorGrid (str, optional): The color of the grid.
        """
        Helpers.__init__(self, bb_center)
        axis_start, axis_end, nice_tick = _nice_bounds(-maximum, maximum, 2 * ticks)
        self.step = nice_tick
        self.size = axis_end - axis_start
        self.grid = GridHelper(
            self.size,
            int(self.size / self.step),
            colorCenterLine=colorCenterLine,
            colorGrid=colorGrid,
        )
        self.set_center(True)

    def set_position(self, position: Tuple[float, float, float]) -> None:
        """
        Sets the position of the grid.

        Args:
            position: The position to set.
        """
        self.grid.position = position

    def set_visibility(self, change: bool) -> None:
        """
        Sets the visibility of the grid.

        Args:
            change: The visibility to set.
        """
        self.grid.visible = change

    def set_rotation(self, rotation: Tuple[float, float, float, str]) -> None:
        """
        Sets the rotation of the grid.

        Args:
            rotation: The rotation to set.
        """
        self.grid.rotation = rotation


#
# Axes helper
#
class Axes(Helpers):
    """
    An axes helper.

    - X is red
    - Y is green
    - Z is blue
    """

    def __init__(
        self,
        bb_center: Tuple[float, float, float],
        length: int = 1,
        width: int = 3,
        display_labels: bool = False,
    ) -> None:
        """
        Initializes the Axes.

        Args:
            bb_center: The center of the bounding box.
            length (int, optional): The length of the axes. Defaults to 1.
            width (int, optional): The width of the axes. Defaults to 3.
            display_labels (bool, optional): Whether to display labels.
        """
        Helpers.__init__(self, bb_center)

        self.axes: List[Any] = []
        self.axes.extend(
            LineSegments2(
                LineSegmentsGeometry(
                    positions=[[self.center, _shift(self.center, vector)]]
                ),
                LineMaterial(linewidth=width, color=color),
            )
            for vector, color in zip(
                ([length, 0, 0], [0, length, 0], [0, 0, length]),
                ("red", "green", "blue"),
            )
        )
        if display_labels:
            # add x, y and z labels
            x_text = make_text("X", [length, 0, 0])
            y_text = make_text("Y", [0, length, 0])
            z_text = make_text("Z", [0, 0, length])

            self.axes.append(x_text)
            self.axes.append(y_text)
            self.axes.append(z_text)

    def set_position(self, position: Tuple[float, float, float]) -> None:
        """
        Sets the position of the axes.

        Args:
            position: The position to set.
        """
        for i in range(3):
            self.axes[i].position = position

    def set_visibility(self, change: bool) -> None:
        """
        Sets the visibility of the axes.

        Args:
            change: The visibility to set.
        """
        for i in range(3):
            self.axes[i].visible = change


#
# Custom Material helper
#
class CustomMaterial(ShaderMaterial):
    """
    A custom material helper.
    """

    def __init__(self, typ: str) -> None:
        """
        Initializes the CustomMaterial.

        Args:
            typ: The type of the material.
        """
        self.types = {
            "diffuse": "c",
            "uvTransform": "m3",
            "normalScale": "v2",
            "fogColor": "c",
            "emissive": "c",
        }

        shader = ShaderLib[typ]

        fragmentShader = """
        uniform float alpha;
        """
        frag_from = "gl_FragColor = vec4( outgoingLight, diffuseColor.a );"
        frag_to = """
            if ( gl_FrontFacing ) {
                gl_FragColor = vec4( outgoingLight, alpha * diffuseColor.a );
            } else {
                gl_FragColor = vec4( diffuseColor.r, diffuseColor.g, diffuseColor.b, alpha * diffuseColor.a );
            }"""
        fragmentShader += shader["fragmentShader"].replace(frag_from, frag_to)

        vertexShader = shader["vertexShader"]
        uniforms = shader["uniforms"]
        uniforms["alpha"] = dict(value=0.7)

        ShaderMaterial.__init__(
            self,
            uniforms=uniforms,
            vertexShader=vertexShader,
            fragmentShader=fragmentShader,
        )
        self.lights = True

    @property
    def color(self) -> str:
        """
        The color of the material.
        """
        return self.uniforms["diffuse"]["value"]

    @color.setter
    def color(self, value: str) -> None:
        self.update("diffuse", value)

    @property
    def alpha(self) -> float:
        """
        The alpha of the material.
        """
        return self.uniforms["alpha"]["value"]

    @alpha.setter
    def alpha(self, value: float) -> None:
        self.update("alpha", value)

    def update(self, key: str, value: Any) -> None:
        """
        Updates a uniform.

        Args:
            key: The key of the uniform to update.
            value: The value to set.
        """
        uniforms = dict(**self.uniforms)
        if self.types.get(key) is None:
            uniforms[key] = {"value": value}
        else:
            uniforms[key] = {"type": self.types.get(key), "value": value}
        self.uniforms = uniforms
        self.needsUpdate = True


#
# Bounding Box
#
class BoundingBox:
    """
    A bounding box helper.
    """

    def __init__(self, objects: List[Any], tol: float = 1e-5) -> None:
        """
        Initializes the BoundingBox.

        Args:
            objects: The objects to compute the bounding box for.
            tol (float, optional): The tolerance. Defaults to 1e-5.
        """
        self.tol = tol

        bbox = reduce(_opt, [self._bbox(obj) for obj in objects])
        self.xmin, self.xmax, self.ymin, self.ymax, self.zmin, self.zmax = bbox
        self.xsize = self.xmax - self.xmin
        self.ysize = self.ymax - self.ymin
        self.zsize = self.zmax - self.zmin
        self.center = (
            self.xmin + self.xsize / 2.0,
            self.ymin + self.ysize / 2.0,
            self.zmin + self.zsize / 2.0,
        )
        self.max = reduce(lambda a, b: max(abs(a), abs(b)), bbox)

    def _max_dist_from_center(self) -> float:
        """
        Returns the maximum distance from the center.
        """
        return max(
            _distance(self.center, v)
            for v in itertools.product(
                (self.xmin, self.xmax),
                (self.ymin, self.ymax),
                (self.zmin, self.zmax),
            )
        )

    def _max_dist_from_origin(self) -> float:
        """
        Returns the maximum distance from the origin.
        """
        return max(
            np.linalg.norm(v)
            for v in itertools.product(
                (self.xmin, self.xmax),
                (self.ymin, self.ymax),
                (self.zmin, self.zmax),
            )
        )

    def _bounding_box(self, obj: Any, tol: float = 1e-5) -> Tuple[float, ...]:
        """
        Computes the bounding box of an object.
        """
        bbox = Bnd_Box()
        bbox.SetGap(self.tol)
        brepbndlib.Add(obj, bbox, True)
        values = bbox.Get()
        return (values[0], values[3], values[1], values[4], values[2], values[5])

    def _bbox(self, objects: List[Any]) -> Tuple[float, ...]:
        """
        Computes the bounding box of a list of objects.
        """
        return reduce(_opt, [self._bounding_box(obj) for obj in objects])

    def __repr__(self) -> str:
        return "[x(%f .. %f), y(%f .. %f), z(%f .. %f)]" % (
            self.xmin,
            self.xmax,
            self.ymin,
            self.ymax,
            self.zmin,
            self.zmax,
        )


class NORMAL(enum.Enum):
    SERVER_SIDE = 1
    CLIENT_SIDE = 2


class JupyterRenderer:
    """
    A renderer for Jupyter notebooks.
    """

    def __init__(
        self,
        size: Tuple[int, int] = (640, 480),
        compute_normals_mode: int = NORMAL.SERVER_SIDE,
        default_shape_color: str = format_color(166, 166, 166),  # light grey
        default_edge_color: str = format_color(32, 32, 32),  # dark grey
        default_vertex_color: str = format_color(8, 8, 8),  # darker grey
        pick_color: str = format_color(232, 176, 36),  # orange
        background_color: str = "white",
    ) -> None:
        """
        Initializes the JupyterRenderer.

        Args:
            size (tuple, optional): The size of the renderer.
            compute_normals_mode (NORMAL, optional): The mode for computing normals.
            default_shape_color (str, optional): The default color for shapes.
            default_edge_color (str, optional): The default color for edges.
            default_vertex_color (str, optional): The default color for vertices.
            pick_color (str, optional): The color for picked objects.
            background_color (str, optional): The background color.
        """
        self._default_shape_color = default_shape_color
        self._default_edge_color = default_edge_color
        self._default_vertex_color = default_vertex_color
        self._pick_color = pick_color

        self._background = background_color
        self._background_opacity = 1
        self._size = size
        self._compute_normals_mode = compute_normals_mode

        self._bb: Optional[BoundingBox] = (
            None  # the bounding box, necessary to compute camera position
        )

        # the default camera object
        self._camera_target = [0.0, 0.0, 0.0]  # the point to look at
        self._camera_position = [0, 0.0, 100.0]  # the camera initial position
        self._camera = None
        self._camera_distance_factor = 6
        self._camera_initial_zoom = 2.5

        # a dictionary of all the shapes belonging to the renderer
        # each element is a key 'mesh_id:shape'
        self._shapes: Dict[str, Any] = {}

        # we save the renderer so that is can be accessed
        self._renderer: Optional[Renderer] = None

        # the group of 3d and 2d objects to render
        self._displayed_pickable_objects = Group()

        # the group of other objects (grid, trihedron etc.) that can't be selected
        self._displayed_non_pickable_objects = Group()

        # event manager/selection manager
        self._picker: Optional[Picker] = None

        self._current_shape_selection: Optional[Any] = None
        self._current_mesh_selection: Optional[Mesh] = None
        self._savestate: Optional[Tuple[Any, Any]] = None

        self._selection_color = format_color(232, 176, 36)

        self._select_callbacks: List[Callable] = (
            []
        )  # a list of all functions called after an object is selected

        # UI
        self.layout = Layout(width="auto", height="auto")
        self._toggle_shp_visibility_button = self.create_button(
            "Hide/Show", "Toggle Shape Visibility", True, self.toggle_shape_visibility
        )
        self._shp_properties_button = Dropdown(
            options=[
                "Compute",
                "Inertia",
                "Recognize Face",
                "Aligned BBox",
                "Oriented BBox",
            ],
            value="Compute",
            description="",
            layout=self.layout,
            disabled=True,
        )
        self._shp_properties_button.observe(self.on_compute_change)
        self._remove_shp_button = self.create_button(
            "Remove",
            "Permanently remove the shape from the Scene",
            True,
            self.remove_shape,
        )
        self._controls = [
            self.create_checkbox("axes", "Axes", True, self.toggle_axes_visibility),
            self.create_checkbox("grid", "Grid", True, self.toggle_grid_visibility),
            self.create_button(
                "Reset View", "Restore default view", False, self._reset
            ),
            self._shp_properties_button,
            self._toggle_shp_visibility_button,
            self._remove_shp_button,
        ]
        self.html = HTML("")

    def create_button(
        self, description: str, tooltip: str, disabled: bool, handler: Callable
    ) -> Button:
        """
        Creates a button.

        Args:
            description (str): The description of the button.
            tooltip (str): The tooltip of the button.
            disabled (bool): Whether the button is disabled.
            handler: The handler for the button.

        Returns:
            The created button.
        """
        button = Button(
            disabled=disabled,
            tooltip=tooltip,
            description=description,
            layout=self.layout,
        )
        button.on_click(handler)
        return button

    def create_checkbox(
        self, kind: str, description: str, value: bool, handler: Callable
    ) -> Checkbox:
        """
        Creates a checkbox.

        Args:
            kind (str): The kind of the checkbox.
            description (str): The description of the checkbox.
            value (bool): The value of the checkbox.
            handler: The handler for the checkbox.

        Returns:
            The created checkbox.
        """
        checkbox = Checkbox(value=value, description=description, layout=self.layout)
        checkbox.observe(handler, "value")
        checkbox.add_class(f"view_{kind}")
        return checkbox

    def remove_shape(self, *kargs: Any) -> None:
        """
        Removes the selected shape.
        """
        self.clicked_obj.visible = not self.clicked_obj.visible
        # remove shape from the mapping dict
        cur_id = self.clicked_obj.name
        del self._shapes[cur_id]
        self._remove_shp_button.disabled = True

    def on_compute_change(self, change: Dict[str, Any]) -> None:
        """
        Called when the compute dropdown changes.
        """
        if change["type"] != "change" or change["name"] != "value":
            return
        selection = change["new"]
        output = ""
        if "Inertia" in selection:
            cog, mass, mass_property = measure_shape_mass_center_of_gravity(
                self._current_shape_selection
            )
            # display this point (type gp_Pnt)
            self.DisplayShape([cog])
            output += (
                "<u><b>Center of Gravity</b></u>:<br><b>Xcog=</b>%.3f<br><b>Ycog=</b>%.3f<br><b>Zcog=</b>%.3f<br>"
                % (cog.X(), cog.Y(), cog.Z())
            )
            output += "<u><b>%s=</b></u>:<b>%.3f</b><br>" % (mass_property, mass)
        elif "Oriented" in selection:
            center, dim, oobb_shp = get_oriented_boundingbox(
                self._current_shape_selection
            )
            self.DisplayShape(
                oobb_shp,
                render_edges=True,
                transparency=True,
                opacity=0.2,
                selectable=False,
            )
            output += (
                "<u><b>OOBB center</b></u>:<br><b>X=</b>%.3f<br><b>Y=</b>%.3f<br><b>Z=</b>%.3f<br>"
                % (center.X(), center.Y(), center.Z())
            )
            output += (
                "<u><b>OOBB dimensions</b></u>:<br><b>dX=</b>%.3f<br><b>dY=</b>%.3f<br><b>dZ=</b>%.3f<br>"
                % (dim[0], dim[1], dim[2])
            )
            output += "<u><b>OOBB volume</b></u>:<br><b>V=</b>%.3f<br>" % (
                dim[0] * dim[1] * dim[2]
            )
        elif "Aligned" in selection:
            center, dim, albb_shp = get_aligned_boundingbox(
                self._current_shape_selection
            )
            self.DisplayShape(
                albb_shp,
                render_edges=True,
                transparency=True,
                opacity=0.2,
                selectable=False,
            )
            output += (
                "<u><b>ABB center</b></u>:<br><b>X=</b>%.3f<br><b>Y=</b>%.3f<br><b>Z=</b>%.3f<br>"
                % (center.X(), center.Y(), center.Z())
            )
            output += (
                "<u><b>ABB dimensions</b></u>:<br><b>dX=</b>%.3f<br><b>dY=</b>%.3f<br><b>dZ=</b>%.3f<br>"
                % (dim[0], dim[1], dim[2])
            )
            output += "<u><b>ABB volume</b></u>:<br><b>V=</b>%.3f<br>" % (
                dim[0] * dim[1] * dim[2]
            )
        elif "Recognize" in selection:
            # try featrue recognition
            kind, pnt, vec = recognize_face(self._current_shape_selection)
            output += f"<u><b>Type</b></u>: {kind}<br>"
            if kind == "Plane":
                self.DisplayShape([pnt])
                output += "<u><b>Properties</b></u>:<br>"
                output += (
                    "<u><b>Point</b></u>:<br><b>X=</b>%.3f<br><b>Y=</b>%.3f<br><b>Z=</b>%.3f<br>"
                    % (pnt.X(), pnt.Y(), pnt.Z())
                )
                output += (
                    "<u><b>Normal</b></u>:<br><b>u=</b>%.3f<br><b>v=</b>%.3f<br><b>w=</b>%.3f<br>"
                    % (vec.X(), vec.Y(), vec.Z())
                )
            elif kind == "Cylinder":
                self.DisplayShape([pnt])
                output += "<u><b>Properties</b></u>:<br>"
                output += (
                    "<u><b>Axis point</b></u>:<br><b>X=</b>%.3f<br><b>Y=</b>%.3f<br><b>Z=</b>%.3f<br>"
                    % (pnt.X(), pnt.Y(), pnt.Z())
                )
                output += (
                    "<u><b>Axis direction</b></u>:<br><b>u=</b>%.3f<br><b>v=</b>%.3f<br><b>w=</b>%.3f<br>"
                    % (vec.X(), vec.Y(), vec.Z())
                )
        self.html.value = output

    def toggle_shape_visibility(self, *kargs: Any) -> None:
        """
        Toggles the visibility of the selected shape.
        """
        self.clicked_obj.visible = not self.clicked_obj.visible

    def toggle_axes_visibility(self, change: Dict[str, Any]) -> None:
        """
        Toggles the visibility of the axes.
        """
        self.axes.set_visibility(_bool_or_new(change))

    def toggle_grid_visibility(self, change: Dict[str, Any]) -> None:
        """
        Toggles the visibility of the grid.
        """
        self.horizontal_grid.set_visibility(_bool_or_new(change))
        self.vertical_grid.set_visibility(_bool_or_new(change))

    def click(self, value: Any) -> None:
        """
        Called whenever a shape or edge is clicked.

        Args:
            value: The clicked object.
        """
        obj = value.owner.object
        self.clicked_obj = obj
        if self._current_mesh_selection != obj:
            if self._current_mesh_selection is not None:
                self._current_mesh_selection.material.color = (
                    self._current_selection_material_color
                )
                self._current_mesh_selection.material.transparent = False
                self._current_mesh_selection = None
                self._current_selection_material_color = None
                self._shp_properties_button.value = "Compute"
                self._shp_properties_button.disabled = True
                self._toggle_shp_visibility_button.disabled = True
                self._remove_shp_button.disabled = True
                self._current_shape_selection = None
            if obj is not None:
                self._shp_properties_button.disabled = False
                self._toggle_shp_visibility_button.disabled = False
                self._remove_shp_button.disabled = False
                id_clicked = obj.name  # the mesh id clicked
                self._current_mesh_selection = obj
                self._current_selection_material_color = obj.material.color
                obj.material.color = self._selection_color
                # selected part becomes transparent
                obj.material.transparent = True
                obj.material.opacity = 0.5
                # get the shape from this mesh id
                selected_shape = self._shapes[id_clicked]
                html_value = "<b>Shape type:</b> %s<br>" % get_type_as_string(
                    selected_shape
                )
                html_value += f"<b>Shape id:</b> {id_clicked}<br>"
                self.html.value = html_value
                self._current_shape_selection = selected_shape
            else:
                self.html.value = "<b>Shape type:</b> None<br><b>Shape id:</b> None"
            # then execute calbacks
            for callback in self._select_callbacks:
                callback(self._current_shape_selection)

    def register_select_callback(self, callback: Callable) -> None:
        """
        Adds a callback that will be called each time a shape is selected.

        Args:
            callback: The callback to add.
        """
        if not callable(callback):
            raise AssertionError("You must provide a callable to register the callback")
        else:
            self._select_callbacks.append(callback)

    def unregister_callback(self, callback: Callable) -> None:
        """
        Removes a callback from the callback list.

        Args:
            callback: The callback to remove.
        """
        if callback not in self._select_callbacks:
            raise AssertionError("This callback is not registered")
        else:
            self._select_callbacks.remove(callback)

    def GetSelectedShape(self) -> Any:
        """
        Returns the selected shape.
        """
        return self._current_shape_selection

    def DisplayShapeAsSVG(
        self,
        shp: Any,
        export_hidden_edges: bool = True,
        location: gp_Pnt = gp_Pnt(0, 0, 0),
        direction: gp_Dir = gp_Dir(1, 1, 1),
        color: str = "black",
        line_width: float = 0.5,
    ) -> None:
        """
        Displays a shape as an SVG.

        Args:
            shp: The shape to display.
            export_hidden_edges (bool, optional): Whether to export hidden edges.
            location (gp_Pnt, optional): The location of the camera.
            direction (gp_Dir, optional): The direction of the camera.
            color (str, optional): The color of the shape.
            line_width (float, optional): The width of the lines.
        """
        svg_string = export_shape_to_svg(
            shp,
            export_hidden_edges=export_hidden_edges,
            location=location,
            direction=direction,
            color=color,
            line_width=line_width,
            margin_left=0,
            margin_top=0,
        )
        svg = SVG(data=svg_string)
        display(svg)

    def DisplayShape(
        self,
        shp: Any,
        shape_color: Optional[str] = None,
        render_edges: bool = False,
        edge_color: Optional[str] = None,
        edge_deflection: float = 0.05,
        vertex_color: Optional[str] = None,
        quality: float = 1.0,
        transparency: bool = False,
        opacity: float = 1.0,
        topo_level: str = "default",
        update: bool = False,
        selectable: bool = True,
    ) -> None:
        """
        Displays a shape in the renderer.

        Args:
            shp: The shape to display.
            shape_color (str, optional): The color of the shape.
            render_edges (bool, optional): Whether to render the edges.
            edge_color (str, optional): The color of the edges.
            edge_deflection (float, optional): The deflection of the edges.
            vertex_color (str, optional): The color of the vertices.
            quality (float, optional): The quality of the mesh.
            transparency (bool, optional): Whether the shape is transparent.
            opacity (float, optional): The opacity of the shape.
            topo_level (str, optional): The topological level to display.
            update (bool, optional): Whether to update the renderer.
            selectable (bool, optional): Whether the shape is selectable.
        """
        if edge_color is None:
            edge_color = self._default_edge_color
        if shape_color is None:
            shape_color = self._default_shape_color
        if vertex_color is None:
            vertex_color = self._default_vertex_color

        output: List[Any] = []  # a list of all geometries created from the shape
        # is it list of gp_Pnt ?
        if isinstance(shp, list) and isinstance(shp[0], gp_Pnt):
            result = self.AddVerticesToScene(shp, vertex_color)
            output.append(result)
        # or a 1d element such as edge or wire ?
        elif is_wire(shp) or is_edge(shp):
            result = self.AddCurveToScene(shp, edge_color, edge_deflection)
            output.append(result)
        elif topo_level != "default":
            t = TopologyExplorer(shp)
            map_type_and_methods = {
                "Solid": t.solids,
                "Face": t.faces,
                "Shell": t.shells,
                "Compound": t.compounds,
                "Compsolid": t.comp_solids,
            }
            for subshape in map_type_and_methods[topo_level]():
                result = self.AddShapeToScene(
                    subshape,
                    shape_color,
                    render_edges,
                    edge_color,
                    vertex_color,
                    quality,
                    transparency,
                    opacity,
                )
                output.append(result)
        else:
            result = self.AddShapeToScene(
                shp,
                shape_color,
                render_edges,
                edge_color,
                vertex_color,
                quality,
                transparency,
                opacity,
            )
            output.append(result)

        if selectable:  # Add geometries to pickable or non pickable objects
            for elem in output:
                self._displayed_pickable_objects.add(elem)

        if update:
            self.Display()

    def AddVerticesToScene(
        self, pnt_list: List[gp_Pnt], vertex_color: str, vertex_width: int = 5
    ) -> Points:
        """
        Adds a list of vertices to the scene.

        Args:
            pnt_list (list): A list of gp_Pnt objects.
            vertex_color (str): The color of the vertices.
            vertex_width (int, optional): The width of the vertices. Defaults to 5.

        Returns:
            The created Points object.
        """
        vertices_list: List[List[float]] = []  # will be passed to pythreejs
        BB = BRep_Builder()
        compound = TopoDS_Compound()
        BB.MakeCompound(compound)

        for vertex in pnt_list:
            vertex_to_add = BRepBuilderAPI_MakeVertex(vertex).Shape()
            BB.Add(compound, vertex_to_add)
            vertices_list.append([vertex.X(), vertex.Y(), vertex.Z()])

        # map the Points and the AIS_PointCloud
        # and to the dict of shapes, to have a mapping between meshes and shapes
        point_cloud_id = f"{uuid.uuid4().hex}"
        self._shapes[point_cloud_id] = compound

        np_vertices_list = np.array(vertices_list, dtype=np.float32)
        attributes = {"position": BufferAttribute(np_vertices_list, normalized=False)}
        mat = PointsMaterial(
            color=vertex_color, sizeAttenuation=True, size=vertex_width
        )
        geom = BufferGeometry(attributes=attributes)
        return Points(geometry=geom, material=mat, name=point_cloud_id)

    def AddCurveToScene(self, shp: Any, edge_color: str, deflection: float) -> Line:
        """
        Adds a curve to the scene.

        Args:
            shp: The curve to add.
            edge_color (str): The color of the curve.
            deflection (float): The deflection of the curve.

        Returns:
            The created Line object.
        """
        if is_edge(shp):
            pnts = discretize_edge(shp, deflection)
        elif is_wire(shp):
            pnts = discretize_wire(shp, deflection)
        np_edge_vertices = np.array(pnts, dtype=np.float32)
        np_edge_indices = np.arange(np_edge_vertices.shape[0], dtype=np.uint32)
        edge_geometry = BufferGeometry(
            attributes={
                "position": BufferAttribute(np_edge_vertices),
                "index": BufferAttribute(np_edge_indices),
            }
        )
        edge_material = LineBasicMaterial(color=edge_color, linewidth=1)

        # and to the dict of shapes, to have a mapping between meshes and shapes
        edge_id = f"{uuid.uuid4().hex}"
        self._shapes[edge_id] = shp

        edge_line = Line(geometry=edge_geometry, material=edge_material, name=edge_id)

        return edge_line

    def AddShapeToScene(
        self,
        shp: Any,
        shape_color: Optional[str] = None,  # the default
        render_edges: bool = False,
        edge_color: Optional[str] = None,
        vertex_color: Optional[str] = None,
        quality: float = 1.0,
        transparency: bool = False,
        opacity: float = 1.0,
    ) -> Any:
        """
        Adds a shape to the scene.

        Args:
            shp: The shape to add.
            shape_color (str, optional): The color of the shape.
            render_edges (bool, optional): Whether to render the edges.
            edge_color (str, optional): The color of the edges.
            vertex_color (str, optional): The color of the vertices.
            quality (float, optional): The quality of the mesh.
            transparency (bool, optional): Whether the shape is transparent.
            opacity (float, optional): The opacity of the shape.

        Returns:
            The created Mesh object.
        """
        # first, compute the tessellation
        tess = ShapeTesselator(shp)
        tess.Compute(compute_edges=render_edges, mesh_quality=quality, parallel=True)
        # get vertices and normals
        vertices_position = tess.GetVerticesPositionAsTuple()

        number_of_triangles = tess.ObjGetTriangleCount()
        number_of_vertices = len(vertices_position)

        # number of vertices should be a multiple of 3
        if number_of_vertices % 3 != 0:
            raise AssertionError("Wrong number of vertices")
        if number_of_triangles * 9 != number_of_vertices:
            raise AssertionError("Wrong number of triangles")

        # then we build the vertex and faces collections as numpy ndarrays
        np_vertices = np.array(vertices_position, dtype="float32").reshape(
            number_of_vertices // 3, 3
        )
        # Note: np_faces is just [0, 1, 2, 3, 4, 5, ...], thus arange is used
        np_faces = np.arange(np_vertices.shape[0], dtype="uint32")

        # set geometry properties
        buffer_geometry_properties = {
            "position": BufferAttribute(np_vertices),
            "index": BufferAttribute(np_faces),
        }
        if self._compute_normals_mode == NORMAL.SERVER_SIDE:
            # get the normal list, converts to a numpy ndarray. This should not raise
            # any issue, since normals have been computed by the server, and are available
            # as a list of floats
            np_normals = np.array(tess.GetNormalsAsTuple(), dtype="float32").reshape(
                -1, 3
            )
            # quick check
            if np_normals.shape != np_vertices.shape:
                raise AssertionError("Wrong number of normals/shapes")
            buffer_geometry_properties["normal"] = BufferAttribute(np_normals)

        # build a BufferGeometry instance
        shape_geometry = BufferGeometry(attributes=buffer_geometry_properties)

        # if the client has to render normals, add the related js instructions
        if self._compute_normals_mode == NORMAL.CLIENT_SIDE:
            shape_geometry.exec_three_obj_method("computeVertexNormals")

        # then a default material
        shp_material = self._material(
            shape_color, transparent=transparency, opacity=opacity
        )

        # and to the dict of shapes, to have a mapping between meshes and shapes
        mesh_id = f"{uuid.uuid4().hex}"
        self._shapes[mesh_id] = shp

        # finally create the mesh
        shape_mesh = Mesh(geometry=shape_geometry, material=shp_material, name=mesh_id)

        # edge rendering, if set to True
        if render_edges:
            edges = list(
                map(
                    lambda i_edge: [
                        tess.GetEdgeVertex(i_edge, i_vert)
                        for i_vert in range(tess.ObjEdgeGetVertexCount(i_edge))
                    ],
                    range(tess.ObjGetEdgeCount()),
                )
            )
            edge_list = _flatten(list(map(_explode, edges)))
            lines = LineSegmentsGeometry(positions=edge_list)
            mat = LineMaterial(linewidth=1, color=edge_color)
            edge_lines = LineSegments2(lines, mat)
            self._displayed_non_pickable_objects.add(edge_lines)

        return shape_mesh

    def _scale(self, vec: List[float]) -> List[float]:
        """
        Scales a vector.
        """
        r = self._bb._max_dist_from_center() * self._camera_distance_factor
        n = np.linalg.norm(vec)
        return [v / n * r for v in vec]

    def _material(
        self, color: str, transparent: bool = False, opacity: float = 1.0
    ) -> CustomMaterial:
        """
        Creates a material.
        """
        # material = MeshPhongMaterial()
        material = CustomMaterial("standard")
        material.color = color
        material.clipping = True
        material.side = "DoubleSide"
        material.polygonOffset = True
        material.polygonOffsetFactor = 1
        material.polygonOffsetUnits = 1
        material.transparent = transparent
        material.opacity = opacity
        material.alpha = opacity
        material.update("metalness", 0.3)
        material.update("roughness", 0.8)
        return material

    def EraseAll(self) -> None:
        """
        Erases all shapes from the renderer.
        """
        self._shapes = {}
        self._displayed_pickable_objects = Group()
        self._current_shape_selection = None
        self._current_mesh_selection = None
        self._current_selection_material = None
        self._renderer.scene = Scene(children=[])

    def Display(
        self,
        position: Optional[Tuple[float, float, float]] = None,
        rotation: Optional[Tuple[float, float, float]] = None,
    ) -> None:
        """
        Displays the renderer.

        Args:
            position (tuple, optional): The position of the camera.
            rotation (tuple, optional): The rotation of the camera.
        """
        # Get the overall bounding box
        if self._shapes:
            self._bb = BoundingBox(list(self._shapes.values()))
        else:  # if nothing registered yet, create a fake bb
            self._bb = BoundingBox([BRepPrimAPI_MakeSphere(5.0).Shape()])
        bb_max = self._bb.max
        orbit_radius = 1.5 * self._bb._max_dist_from_center()

        # Set up camera
        camera_target = self._bb.center
        camera_position = _add(
            self._bb.center,
            self._scale([1, 1, 1] if position is None else self._scale(position)),
        )
        camera_zoom = self._camera_initial_zoom

        self._camera = CombinedCamera(
            position=camera_position, width=self._size[0], height=self._size[1]
        )
        self._camera.up = (0.0, 0.0, 1.0)
        self._camera.mode = "orthographic"
        self._camera_target = camera_target
        self._camera.position = camera_position
        if rotation is not None:
            self._camera.rotation = rotation
        # Set up lights in every of the 8 corners of the global bounding box
        positions = list(itertools.product(*[(-orbit_radius, orbit_radius)] * 3))
        key_lights = [
            DirectionalLight(color="white", position=pos, intensity=0.5)
            for pos in positions
        ]
        ambient_light = AmbientLight(intensity=0.1)

        # Set up Helpers
        self.axes = Axes(bb_center=self._bb.center, length=bb_max * 1.1)
        self.horizontal_grid = Grid(
            bb_center=self._bb.center,
            maximum=bb_max,
            colorCenterLine="#aaa",
            colorGrid="#ddd",
        )
        self.vertical_grid = Grid(
            bb_center=self._bb.center,
            maximum=bb_max,
            colorCenterLine="#aaa",
            colorGrid="#ddd",
        )
        # Set up scene
        environment = (
            self.axes.axes
            + key_lights
            + [
                ambient_light,
                self.horizontal_grid.grid,
                self.vertical_grid.grid,
                self._camera,
            ]
        )

        scene_shp = Scene(
            children=[
                self._displayed_pickable_objects,
                self._displayed_non_pickable_objects,
            ]
            + environment
        )

        # Set up Controllers
        self._controller = OrbitControls(controlling=self._camera, target=camera_target)
        # Update controller to instantiate camera position
        self._camera.zoom = camera_zoom
        self._update()

        # setup Picker
        self._picker = Picker(
            controlling=self._displayed_pickable_objects, event="dblclick"
        )
        self._picker.observe(self.click)

        self._renderer = Renderer(
            camera=self._camera,
            background=self._background,
            background_opacity=self._background_opacity,
            scene=scene_shp,
            controls=[self._controller, self._picker],
            width=self._size[0],
            height=self._size[1],
            antialias=True,
        )

        # set rotation and position for each grid
        self.horizontal_grid.set_position((0, 0, 0))
        self.horizontal_grid.set_rotation((math.pi / 2.0, 0, 0, "XYZ"))

        self.vertical_grid.set_position((0, -bb_max, 0))

        self._savestate = (self._camera.rotation, self._controller.target)

        # then display both 3d widgets and webui
        display(HBox([VBox([HBox(self._controls), self._renderer]), self.html]))

    def ExportToHTML(self, filename: str) -> None:
        """
        Exports the renderer to an HTML file.

        Args:
            filename (str): The name of the file to export to.
        """
        embed.embed_minimal_html(filename, views=self._renderer, title="pythonocc")

    def _reset(self, *kargs: Any) -> None:
        """
        Resets the camera.
        """
        self._camera.rotation, self._controller.target = self._savestate
        self._camera.position = _add(self._bb.center, self._scale((1, 1, 1)))
        self._camera.zoom = self._camera_initial_zoom
        self._update()

    def _update(self) -> None:
        """
        Updates the controller.
        """
        self._controller.exec_three_obj_method("update")

    def __repr__(self) -> str:
        self.Display()
        return ""
