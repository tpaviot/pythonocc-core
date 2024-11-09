import sys
from unittest.mock import patch

import pytest
from OCC.Core.BRepPrimAPI import BRepPrimAPI_MakeCylinder
from OCC.Display.backend import load_backend
from OCC.Display.SimpleGui import init_display

pytestmark = pytest.mark.skipif(
    sys.platform == "linux",
    reason="Avoid problems with Qt and Ubuntu machines on Azure",
)


@pytest.fixture
def cylinder_shape():
    return BRepPrimAPI_MakeCylinder(5, 6).Shape()


@pytest.fixture(params=["pyqt5", "pyqt6", "pyside2", "pyside6", "wx", "tk"])
def backend(request):
    backend_str = request.param
    try:
        if backend_str != "tk":
            assert load_backend(backend_str) == backend_str
        return backend_str
    except (AssertionError, ValueError) as e:
        pytest.skip(str(e))


def plot_cylinder(cylinder_shape, backend):
    display, start_display, add_menu, add_function_to_menu = init_display(backend)
    display.DisplayShape(cylinder_shape, update=True)
    del display


def test_global_log_level_change(cylinder_shape, backend):
    with patch("logging.basicConfig") as logcfg:
        plot_cylinder(cylinder_shape, backend)
        assert not logcfg.called


def test_cylinder_plot(cylinder_shape, backend):
    plot_cylinder(cylinder_shape, backend)


def test_cylinder_plot_again(cylinder_shape, backend):
    """
    To catch problems if more than display is intialized
    """
    plot_cylinder(cylinder_shape, backend)
