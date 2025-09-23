from typing import Any, Dict, Generator, List, Optional, Tuple

def spinning_cursor() -> Generator[str, None, None]: ...
def export_edge_to_indexed_lineset(edge_point_set: List[List[float]]) -> str: ...
def indexed_lineset_to_x3d_string(
    str_linesets: List[str],
    header: bool = True,
    footer: bool = True,
    ils_id: int = 0,
) -> str: ...

class HTMLHeader:
    def __init__(
        self, bg_gradient_color1: str = "#ced7de", bg_gradient_color2: str = "#808080"
    ) -> None: ...
    def get_str(self) -> str: ...

class HTMLBody:
    def __init__(
        self,
        x3d_shapes: List[str],
        axes_plane: bool,
        axes_plane_zoom_factor: float = 1.0,
    ) -> None: ...
    def get_str(self) -> str: ...

class X3DExporter:
    def __init__(
        self,
        shape: Any,
        vertex_shader: Optional[str],
        fragment_shader: Optional[str],
        export_edges: bool,
        color: Tuple[float, float, float],
        specular_color: Tuple[float, float, float],
        shininess: float,
        transparency: float,
        line_color: Tuple[float, float, float],
        line_width: float,
        mesh_quality: float,
    ) -> None: ...
    def compute(self) -> None: ...
    def to_x3dfile_string(self, shape_id: int) -> str: ...
    def write_to_file(self, filename: str, shape_id: int) -> None: ...

class X3DomRenderer:
    def __init__(
        self,
        path: Optional[str] = None,
        display_axes_plane: bool = True,
        axes_plane_zoom_factor: float = 1.0,
    ) -> None: ...
    def DisplayShape(
        self,
        shape: Any,
        vertex_shader: Optional[str] = None,
        fragment_shader: Optional[str] = None,
        export_edges: bool = False,
        color: Tuple[float, float, float] = (0.65, 0.65, 0.7),
        specular_color: Tuple[float, float, float] = (0.2, 0.2, 0.2),
        shininess: float = 0.9,
        transparency: float = 0.0,
        line_color: Tuple[float, float, float] = (0.0, 0.0, 0.0),
        line_width: float = 2.0,
        mesh_quality: float = 1.0,
    ) -> Tuple[Dict[str, Any], Dict[str, Any]]: ...
    def render(
        self,
        addr: str = "localhost",
        server_port: int = 8080,
        open_webbrowser: bool = False,
    ) -> None: ...
    def generate_html_file(
        self, axes_plane: bool, axes_plane_zoom_factor: float
    ) -> None: ...
