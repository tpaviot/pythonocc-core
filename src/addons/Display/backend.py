import logging
import sys

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


def have_pyqt5():
    """ returns True is PyQt5 found, else False
    """
    global HAVE_PYQT5, QtCore, QtGui, QtWidgets, QtOpenGL
    try:
        from PyQt5 import QtCore, QtGui, QtOpenGL, QtWidgets
        HAVE_PYQT5 = True
    except ImportError:
        HAVE_PYQT5 = False
    return HAVE_PYQT5


def have_pyqt4():
    """ returns True is PyQt4 found, else False
    """
    global HAVE_PYQT4, QtCore, QtGui, QtWidgets, QtOpenGL
    try:
        from PyQt4 import QtCore, QtGui, QtOpenGL
        QtWidgets = QtGui
        HAVE_PYQT4 = True
    except ImportError:
        HAVE_PYQT4 = False
    return HAVE_PYQT4


def have_pyside():
    """ returns True is PySide found, else False
    """
    global HAVE_PYSIDE, QtCore, QtGui, QtWidgets, QtOpenGL
    try:
        from PySide import QtCore, QtGui, QtOpenGL
        QtWidgets = QtGui
        HAVE_PYSIDE = True
    except ImportError:
        HAVE_PYSIDE = False
    return HAVE_PYSIDE


def have_wx():
    """ returns True is wxPython found, else False
    """
    global HAVE_WX
    try:
        import wx
        HAVE_WX = True
    except ImportError:
        HAVE_WX = False
    return HAVE_WX


def have_backend():
    return HAVE_BACKEND


def get_loaded_backend():
    return BACKEND_MODULE


def get_backend(backend_str=None):
    """ loads a gui backend

    A backend is preferable a Qt backend, such as PyQt5, PyQt4 or PySide
    If no Qt backend is found, wx is loaded

    The search order for pythonocc compatible gui modules is:
        PyQt5, PyQt4, PySide, Wx

    Note
    ----
    Wx is imported when no Qt backend is found.

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
    global HAVE_BACKEND, BACKEND_MODULE

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
        if have_pyqt5():
            HAVE_BACKEND = True
            BACKEND_MODULE = 'qt-pyqt5'
            log.info("backend loaded: {0}".format(BACKEND_MODULE))
            return BACKEND_MODULE
        elif backend_str is not None:
            msg = "{0} could not be loaded".format(backend_str)
            log.exception(msg)
            raise ValueError(msg)
        else:
            pass

    if backend_str == "qt-pyqt4" or (backend_str is None and not HAVE_BACKEND):
        if have_pyqt4():
            HAVE_BACKEND = True
            BACKEND_MODULE = 'qt-pyqt4'
            log.info("backend loaded: {0}".format(BACKEND_MODULE))
            return BACKEND_MODULE
        elif backend_str is not None:
            msg = "{0} could not be loaded".format(backend_str)
            log.exception(msg)
            raise ValueError(msg)

        else:
            pass

    if backend_str == "qt-pyside" or (backend_str is None and not HAVE_BACKEND):
        if have_pyside():
            HAVE_BACKEND = True
            BACKEND_MODULE = 'qt-pyside'
            log.info("backend loaded: {0}".format(BACKEND_MODULE))
            return BACKEND_MODULE
        elif backend_str is not None:
            msg = "{0} could not be loaded".format(backend_str)
            log.exception(msg)
            raise ValueError(msg)
        else:
            pass

    if backend_str == "wx" or (backend_str is None and not HAVE_BACKEND):
        if have_wx():
            HAVE_BACKEND = True
            BACKEND_MODULE = 'wx'
            log.info("backend loaded: {0}".format(BACKEND_MODULE))
            return BACKEND_MODULE
        elif backend_str is not None:
            msg = "{0} could not be loaded".format(backend_str)
            log.exception(msg)
            raise ValueError(msg)
        else:
            pass

    if not HAVE_BACKEND:
        raise ImportError("No compliant GUI library could be imported.\n"
                          "Either PyQt5, PyQt4, PySide, or wxPython"
                          "is required")


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
