from typing import Any, Dict, Optional, Tuple

from threejs_renderer import ThreejsRenderer

def format_color(r: int, g: int, b: int) -> str: ...

class RenderWraper(ThreejsRenderer):
    def __init__(
        self,
        path: Optional[str] = None,
        default_shape_color: str = "0xa6a6a6",
        default_edge_color: str = "0x202020",
        default_vertex_color: str = "0x80808",
    ) -> None: ...
    def convert_shape(
        self,
        shape: Any,
        export_edges: bool = False,
        color: Tuple[float, float, float] = (0.65, 0.65, 0.7),
        specular_color: Tuple[float, float, float] = (0.2, 0.2, 0.2),
        shininess: float = 0.9,
        transparency: float = 0.0,
        line_color: Tuple[float, float, float] = (0.0, 0.0, 0.0),
        line_width: float = 1.0,
        point_size: float = 1.0,
        mesh_quality: float = 1.0,
    ) -> Tuple[Dict[str, Any], Dict[str, Any], Dict[str, Any]]: ...

class RenderConfig:
    def __init__(
        self,
        bg_gradient_color1: str = "#ced7de",
        bg_gradient_color2: str = "#808080",
        vertex_shader: Optional[str] = None,
        fragment_shader: Optional[str] = None,
        uniforms: Optional[Dict[str, Any]] = None,
    ) -> None: ...
