import sys
import logging

logging.basicConfig(stream=sys.stdout, level=logging.DEBUG)
log = logging.getLogger(__name__)

HAVE_PYQT5, HAVE_PYQT4, HAVE_PYSIDE = False, False, False

# -------------------------------------------------------------------------------
# Really, the way to do this is how its done in matplotlib:
# https://github.com/matplotlib/matplotlib/blob/master/lib/matplotlib/backends/qt_compat.py
# -------------------------------------------------------------------------------

try:
    from PyQt5 import QtCore, QtGui, QtOpenGL

    HAVE_PYQT5 = True
    log.info("Using PyQt5")
except ImportError:
    pass

if not HAVE_PYQT5:
    try:
        from PyQt4 import QtCore, QtGui, QtOpenGL

        HAVE_PYQT4 = True
        log.info("Using PyQt4")
    except ImportError:
        pass

if not HAVE_PYQT5 and not HAVE_PYQT4:
    try:
        from PySide import QtCore, QtGui, QtOpenGL

        HAVE_PYSIDE = True
        log.info("PyQt4 not found - using PySide")
    except ImportError:
        pass


def get_qt_modules():
    return QtCore, QtGui, QtOpenGL


if not HAVE_PYQT5 and not HAVE_PYQT4 and not HAVE_PYSIDE:
    print "HAVE_PYQT5, HAVE_PYQT4, HAVE_PYSIDE: ", HAVE_PYQT5, HAVE_PYQT4, HAVE_PYSIDE
    raise ImportError("could not load PyQt5, PyQt4 nor PySide, in that particular order...")

