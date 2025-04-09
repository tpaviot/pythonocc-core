import os
from pathlib import Path
import platform

# Version number
PYTHONOCC_VERSION_MAJOR = 7
PYTHONOCC_VERSION_MINOR = 9
PYTHONOCC_VERSION_PATCH = 0

# Empty for official releases, set to -dev, -rc1, etc for development releases
PYTHONOCC_VERSION_DEVEL = ""

VERSION = f"{PYTHONOCC_VERSION_MAJOR}.{PYTHONOCC_VERSION_MINOR}.{PYTHONOCC_VERSION_PATCH}{PYTHONOCC_VERSION_DEVEL}"


def initialize_occt_libraries(occt_essentials_path) -> None:
    """
    Initializes the OCCT libraries by adding all DLL directories to the DLL search path.

    Raises:
        AssertionError: If the OCCT_ESSENTIALS_ROOT environment variable is not set.
    """
    if not os.path.exists(occt_essentials_path):
        raise AssertionError(
            f"OCCT_ESSENTIALS_ROOT({occt_essentials_path}) is not set correctly."
        )

    for root, dirs, files in os.walk(occt_essentials_path):
        if "debug" in root.lower():
            continue
        for file in files:
            if Path(file).suffix.lower() == ".dll":
                os.add_dll_directory(root)
                break


# on windows, see #1347
if platform.system() == "Windows":
    try:
        # OCC_ESSENTIALS_ROOT was defined at build time
        # and is available in config.py
        from .config import OCCT_ESSENTIALS_ROOT

        initialize_occt_libraries(occt_essentials_path=OCCT_ESSENTIALS_ROOT)
    except (
        ImportError
    ):  # anyway, still possible to set up the OCC_ESSENTIALS_ROOT env var
        if "OCCT_ESSENTIALS_ROOT" in os.environ:
            initialize_occt_libraries(
                occt_essentials_path=os.environ["OCCT_ESSENTIALS_ROOT"]
            )
