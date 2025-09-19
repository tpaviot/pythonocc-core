from typing import Any, Dict, Generator, List, Optional, Tuple

def spinning_cursor() -> Generator[str, None, None]: ...
def color_to_hex(rgb_color: Tuple[float, float, float]) -> str: ...
def export_edgedata_to_json(edge_hash: str, point_set: List[List[float]]) -> str: ...

class HTMLHeader:
    def __init__(
        self, bg_gradient_color1: str = "#ced7de", bg_gradient_color2: str = "#808080"
    ) -> None: ...
    def get_str(self) -> str: ...

class ThreejsRenderer:
    def __init__(self, path: Optional[str] = None) -> None: ...
    def DisplayShape(
        self,
        shape: Any,
        export_edges: bool = False,
        color: Tuple[float, float, float] = ...,
        specular_color: Tuple[float, float, float] = ...,
        shininess: float = 0.9,
        transparency: float = 0.0,
        line_color: Tuple[float, float, float] = ...,
        line_width: float = 1.0,
        mesh_quality: float = 1.0,
    ) -> Tuple[Dict[str, Any], Dict[str, Any]]: ...
    def generate_html_file(self) -> None: ...
    def render(
        self,
        addr: str = "localhost",
        server_port: int = 8080,
        open_webbrowser: bool = False,
    ) -> None: ...
