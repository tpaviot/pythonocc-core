import logging
import sys
import warnings

global QtCore, QtGui, QtWidgets, QtOpenGL

logging.basicConfig(stream=sys.stdout, level=logging.DEBUG)
log = logging.getLogger(__name__)

global HAVE_PYQT5, HAVE_PYQT4, HAVE_PYSIDE, HAVE_WX, HAVE_BACKEND, \
    BACKEND_MODULE, QtCore, QtGui, QtWidgets, QtOpenGL

# backend module
HAVE_PYQT5, HAVE_PYQT4, HAVE_PYSIDE, HAVE_WX = False, False, False, False

# is any backend imported?
HAVE_BACKEND = False
BACKEND_MODULE = "No backend loaded"


def get_backend(backend_str=None):
    """ loads a gui backend

    A backend is preferable a Qt backend, such as PyQt5, PyQt4 or PySide
    If no Qt backend is found, wx is loaded

    The search order for pythonocc compatible gui modules is:
        PyQt5, PyQt4, PySide, Wx

    Note
    ----
    Wx is imported when no Qt backend is found, but this should be considered a
    legacy option

    Parameters
    ----------
    backend_str : str

        specifies which backend to load

        backend_str is one of ( "qt-pyqt5", "qt-pyqt4", "qt-pyside", "wx" )

        if no value has been set, load the first module in gui module search
        order

    Returns
    -------
    str
        the name of the loaded backend
        one of ( "qt-pyqt5", "qt-pyqt4", "qt-pyside", "wx" )

    Raises
    ------

    ValueError
        * when a backend is already loaded
        * when an invalid backend_str is specified

    ImportError
        when the backend specified in ``backend_str`` could not be imported

    """
    global HAVE_BACKEND, HAVE_PYQT5, HAVE_PYQT4, HAVE_PYSIDE, HAVE_WX, \
        BACKEND_MODULE, QtCore, QtGui, QtWidgets, QtOpenGL

    if HAVE_BACKEND:
        msg = "a backend is already loaded..." \
              "``get_backend`` can only be called once"
        log.critical(msg)
        raise ImportError(msg)

    if backend_str is not None:
        compatible_backends = ("qt-pyqt5", "qt-pyqt4", "qt-pyside", "wx")
        if not backend_str in compatible_backends:
            msg = "incompatible backend_str specified: {0}\n" \
                  "backend is one of : {1}".format(backend_str,
                                                   compatible_backends)
            log.critical(msg)
            raise ValueError(msg)

    if backend_str == "qt-pyqt5" or backend_str is None:
        try:
            from PyQt5 import QtCore, QtGui, QtOpenGL, QtWidgets
            HAVE_BACKEND = True
            HAVE_PYQT5 = True
            BACKEND_MODULE = 'qt-pyqt5'
            log.info("backend loaded: {0}".format(BACKEND_MODULE))
            return BACKEND_MODULE

        except ImportError:
            if backend_str is not None:
                log.exception("{0} could not be loaded".format(backend_str))
                raise
            else:
                pass

    if backend_str == "qt-pyqt4" or \
            (backend_str is None and not HAVE_BACKEND):
        try:
            from PyQt4 import QtCore, QtGui, QtOpenGL
            QtWidgets = QtGui

            HAVE_BACKEND = True
            HAVE_PYQT4 = True
            BACKEND_MODULE = 'qt-pyqt4'
            log.info("backend loaded: {0}".format(BACKEND_MODULE))
            return BACKEND_MODULE

        except ImportError:
            if backend_str is not None:
                log.exception("{0} could not be loaded".format(backend_str))
                raise
            else:
                pass

    if backend_str == "qt-pyside" or \
            (backend_str is None and not HAVE_BACKEND):
        try:
            from PySide import QtCore, QtGui, QtOpenGL
            QtWidgets = QtGui

            HAVE_BACKEND = True
            HAVE_PYSIDE = True
            BACKEND_MODULE = 'qt-pyside'
            log.info("backend loaded: {0}".format(BACKEND_MODULE))
            return BACKEND_MODULE

        except ImportError:
            if backend_str is not None:
                log.exception("{0} could not be loaded".format(backend_str))
                raise
            else:
                pass

    if backend_str == "wx" or \
            (backend_str is None and not HAVE_BACKEND):
        try:
            import wx

            warnings.warn("wx for pythonocc development is in maintanence mode"
                          "use Qt ( PqyQt5, PyQt4 or PySide ) for new projects",
                          DeprecationWarning, level=2)
            HAVE_BACKEND = True
            HAVE_WX = True
            BACKEND_MODULE = 'wx'
            log.info("backend loaded: {0}".format(BACKEND_MODULE))
            return BACKEND_MODULE

        except:
            if backend_str is not None:
                log.exception("{0} could not be loaded".format(backend_str))
                raise
            else:
                pass

    if not HAVE_BACKEND:
        raise ImportError(
                "No compliant GUI library could be imported.\n "
                "Either PyQt5, PyQt4, PySide, or wxPython is required")


def get_qt_modules():
    """

    Returns
    -------
    tuple : ( QtCore, QtGui, QtWidgets, QtOpenGL )
        here QtWidgets shadows QtGui when a PyQt4 or PySide module is loaded
        this is the most coherent way to get PyQt5 compliant code

    Raises
    ------

    ValueError
        when no Qt backend has been yet loaded
        informs the user to call `get_backend` or that no Qt python module
        ( PyQt5, PyQt4 or PySide ) is found

    """

    global HAVE_BACKEND, HAVE_PYQT5, HAVE_PYQT4, HAVE_PYSIDE, HAVE_WX, QtCore, \
        QtGui, QtWidgets, QtOpenGL

    if not HAVE_BACKEND:
        raise ValueError("no backend has been imported yet with "
                         "``get_backend``... ")

    if HAVE_PYQT5 or HAVE_PYQT4 or HAVE_PYSIDE:
        return QtCore, QtGui, QtWidgets, QtOpenGL
    elif HAVE_WX:
        raise ValueError("the Wx backend is already loaded")
    else:
        msg = ("no Qt backend is loaded, hence cannot return any modules\n"
               "either you havent got PyQt5, PyQt4 or PySide installed\n"
               "or you havent yet loaded a backend with the "
               "`OCC.Display.backend.get_backend` function")

        raise ValueError(msg)
