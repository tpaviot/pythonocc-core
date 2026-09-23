from collections.abc import Sequence
from typing import Callable

from OCC.Display.OCCViewer import Viewer3d

GuiFunctions = tuple[Viewer3d, Callable, Callable, Callable]

def check_callable(_callable: Callable) -> None: ...
def init_display(
    backend_str: str | None = None,
    size: tuple[int, int] = (1024, 768),
    display_triedron: bool = True,
    background_gradient_color1: Sequence[int] | None = (206, 215, 222),
    background_gradient_color2: Sequence[int] | None = (128, 128, 128),
) -> GuiFunctions: ...
