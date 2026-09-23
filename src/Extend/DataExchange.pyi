from typing import Any, Literal, overload

from OCC.Core.Bnd import Bnd_Box2d
from OCC.Core.gp import gp_Dir, gp_Pnt
from OCC.Core.Quantity import Quantity_Color
from OCC.Core.TopoDS import TopoDS_Edge, TopoDS_Shape

HAVE_SVGWRITE: bool

def check_svgwrite_installed() -> None: ...
@overload
def read_step_file(
    filename: str, as_compound: Literal[True] = True, verbosity: bool = False
) -> TopoDS_Shape: ...
@overload
def read_step_file(
    filename: str, as_compound: Literal[False], verbosity: bool = False
) -> list[TopoDS_Shape]: ...
@overload
def read_step_file(
    filename: str, as_compound: bool = True, verbosity: bool = False
) -> TopoDS_Shape | list[TopoDS_Shape]: ...
def write_step_file(
    shape: TopoDS_Shape, filename: str, application_protocol: str = "AP203"
) -> None: ...
# the values are [name: str, color: Quantity_Color] lists
def read_step_file_with_names_colors(
    filename: str,
) -> dict[TopoDS_Shape, list[Any]]: ...
def write_stl_file(
    shape: TopoDS_Shape,
    filename: str,
    mode: str = "ascii",
    linear_deflection: float = 0.9,
    angular_deflection: float = 0.5,
) -> None: ...
def read_stl_file(
    filename: str, sew_shape: bool = False, make_solid: bool = False
) -> TopoDS_Shape: ...
def read_iges_file(
    filename: str,
    return_as_shapes: bool = False,
    verbosity: bool = False,
    visible_only: bool = False,
) -> list[TopoDS_Shape]: ...
def write_iges_file(a_shape: TopoDS_Shape, filename: str) -> None: ...
def edge_to_svg_polyline(
    topods_edge: TopoDS_Edge, tol: float = 0.1, unit: str = "mm"
) -> tuple[Any, Bnd_Box2d]: ...
def export_shape_to_svg(
    shape: TopoDS_Shape,
    filename: str | None = None,
    width: int = 800,
    height: int = 600,
    margin_left: int = 10,
    margin_top: int = 30,
    export_hidden_edges: bool = True,
    location: gp_Pnt | None = None,
    direction: gp_Dir | None = None,
    color: str = "black",
    line_width: str = "1px",
    unit: str = "mm",
) -> bool | str: ...
def write_ply_file(a_shape: TopoDS_Shape, ply_filename: str) -> None: ...
def write_obj_file(a_shape: TopoDS_Shape, obj_filename: str) -> None: ...
def read_gltf_file(
    filename: str,
    is_parallel: bool = False,
    is_double_precision: bool = False,
    skip_late_data_loading: bool = False,
    keep_late_data: bool = True,
    verbose: bool = False,
    load_all_scenes: bool = False,
) -> list[TopoDS_Shape]: ...
def write_gltf_file(
    a_shape: TopoDS_Shape, gltf_filename: str, binary: bool = True
) -> None: ...
