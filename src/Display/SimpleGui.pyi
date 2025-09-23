from typing import Callable, List, Optional, Tuple

from OCC.Display.OCCViewer import Viewer3d

def check_callable(_callable: Callable) -> None: ...
def init_display(
    backend_str: Optional[str] = None,
    size: Optional[Tuple[int, int]] = (1024, 768),
    display_triedron: Optional[bool] = True,
    background_gradient_color1: Optional[List[int]] = [206, 215, 222],
    background_gradient_color2: Optional[List[int]] = [128, 128, 128],
) -> Tuple[Viewer3d, Callable, Callable, Callable]: ...
