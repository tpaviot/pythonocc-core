import logging
import sys

# backend constants
WX = "wx"
PYSIDE = "qt-pyside"
PYSIDE2 = "qt-pyside2"
PYQT4 = "qt-pyqt4"
PYQT5 = "qt-pyqt5"

# backend module
HAVE_PYQT5, HAVE_PYQT4, HAVE_PYSIDE, HAVE_PYSIDE2, HAVE_WX = False, False, False, False, False

# is any backend imported?
HAVE_BACKEND = False
BACKEND_MODULE = "No backend loaded"

logging.basicConfig(stream=sys.stdout, level=logging.DEBUG)
log = logging.getLogger(__name__)


def load_pyqt5():
    """ returns True is PyQt5 found, else False
    """
    global HAVE_PYQT5, QtCore, QtGui, QtWidgets, QtOpenGL

    # backend already loaded, dont load another one
    if loaded_backend():
        return False

    try:
        from PyQt5 import QtCore, QtGui, QtOpenGL, QtWidgets
        HAVE_PYQT5 = True
    except ImportError:
        HAVE_PYQT5 = False
    return HAVE_PYQT5


def load_pyqt4():
    """ returns True is PyQt4 found, else False
    """
    global HAVE_PYQT4, QtCore, QtGui, QtWidgets, QtOpenGL

    # backend already loaded, dont load another one
    if loaded_backend():
        return False

    try:
        from PyQt4 import QtCore, QtGui, QtOpenGL
        QtWidgets = QtGui
        HAVE_PYQT4 = True
    except ImportError:
        HAVE_PYQT4 = False
    return HAVE_PYQT4


def load_pyside():
    """ returns True is PySide found, else False
    """
    global HAVE_PYSIDE, QtCore, QtGui, QtWidgets, QtOpenGL

    # backend already loaded, dont load another one
    if loaded_backend():
        return False

    try:
        from PySide import QtCore, QtGui, QtOpenGL
        QtWidgets = QtGui
        HAVE_PYSIDE = True
    except ImportError:
        HAVE_PYSIDE = False
    return HAVE_PYSIDE


def load_pyside2():
    """ returns True is PySide2 found, else False
    """
    global HAVE_PYSIDE2, QtCore, QtGui, QtWidgets, QtOpenGL

    # backend already loaded, dont load another one
    if loaded_backend():
        return False

    try:
        from PySide2 import QtCore, QtGui, QtOpenGL, QtWidgets
        HAVE_PYSIDE2 = True
    except ImportError:
        HAVE_PYSIDE2 = False
    return HAVE_PYSIDE2


def load_wx():
    """ returns True is wxPython found, else False
    """

    # backend already loaded, dont load another one
    if loaded_backend():
        return False

    global HAVE_WX
    try:
        import wx
        HAVE_WX = True
    except ImportError:
        HAVE_WX = False
    return HAVE_WX


def loaded_backend():
    return HAVE_BACKEND


def get_loaded_backend():
    return BACKEND_MODULE


def load_any_qt_backend():
    """ loads any qt based backend. First try to load
    PyQt5, then PyQt4 and finally PySide. Raise an exception
    if none of them are available
    """
    pyqt5_loaded = False
    pyqt4_loaded = False
    pyside_loaded = False
    # by default, load PyQt5
    pyqt5_loaded = load_backend(PYQT5)
    if not pyqt5_loaded:
        # load pyqt4
        pyqt4_loaded = load_backend(PYQT4)
        # finally try to load pyside
        if not pyqt4_loaded:
            pyside2_loaded = load_backend(PYSIDE2)
            if not pyside2_loaded:
                pyside_loaded = load_backend(PYSIDE)
    if not (pyqt5_loaded or pyqt4_loaded or pyside2_loaded or pyside_loaded):
        raise AssertionError("None of the PyQt5, PtQt4, PySide2 or PySide backend can be loaded")
    else:
        return True


def load_backend(backend_str=None):
    """ loads a gui backend

    If no Qt (such as PyQt5, PyQt4 or PySide) backend is found, wx is loaded

    The search order for pythonocc compatible gui modules is:
        PyQt5, PyQt4, PySide2, PySide, Wx

    Note
    ----
    Wx is imported when no Qt backend is found.

    Parameters
    ----------
    backend_str : str

        specifies which backend to load

        backend_str is one of ( "qt-pyqt5", "qt-pyqt4", ""qt-pyside2", qt-pyside", "wx" )

        if no value has been set, load the first module in gui module search
        order

    Returns
    -------
    str
        the name of the loaded backend
        one of ( "qt-pyqt5", "qt-pyqt4", "qt-pyside2", "qt-pyside", "wx" )

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
        msg = "The {0} backend is already loaded..." \
              "``load_backend`` can only be called once per session".format(BACKEND_MODULE)
        log.info(msg)
        return BACKEND_MODULE

    if backend_str is not None:
        compatible_backends = (PYQT5, PYQT4, PYSIDE2, PYSIDE, WX)
        if not backend_str in compatible_backends:
            msg = "incompatible backend_str specified: {0}\n" \
                  "backend is one of : {1}".format(backend_str,
                                                   compatible_backends)
            log.critical(msg)
            raise ValueError(msg)

    if backend_str == PYQT5 or backend_str is None:
        if load_pyqt5():
            HAVE_BACKEND = True
            BACKEND_MODULE = 'qt-pyqt5'
            log.info("backend loaded: {0}".format(BACKEND_MODULE))
            return BACKEND_MODULE
        if backend_str == PYQT5 and not HAVE_BACKEND:
            msg = "{0} backend could not be loaded".format(backend_str)
            log.exception(msg)
            raise ValueError(msg)
        else:
            pass

    if backend_str == PYQT4 or (backend_str is None and not HAVE_BACKEND):
        if load_pyqt4():
            HAVE_BACKEND = True
            BACKEND_MODULE = 'qt-pyqt4'
            log.info("backend loaded: {0}".format(BACKEND_MODULE))
            return BACKEND_MODULE
        elif backend_str == PYQT4 and not HAVE_BACKEND:
            msg = "{0} backend could not be loaded".format(backend_str)
            log.exception(msg)
            raise ValueError(msg)

        else:
            pass

    if backend_str == PYSIDE2 or (backend_str is None and not HAVE_BACKEND):
        if load_pyside2():
            HAVE_BACKEND = True
            BACKEND_MODULE = 'qt-pyside2'
            log.info("backend loaded: {0}".format(BACKEND_MODULE))
            return BACKEND_MODULE
        elif backend_str == PYSIDE2 and not HAVE_BACKEND:
            msg = "{0} could not be loaded".format(backend_str)
            log.exception(msg)
            raise ValueError(msg)
        else:
            pass

    if backend_str == PYSIDE or (backend_str is None and not HAVE_BACKEND):
        if load_pyside():
            HAVE_BACKEND = True
            BACKEND_MODULE = 'qt-pyside'
            log.info("backend loaded: {0}".format(BACKEND_MODULE))
            return BACKEND_MODULE
        elif backend_str == PYSIDE and not HAVE_BACKEND:
            msg = "{0} backend could not be loaded".format(backend_str)
            log.exception(msg)
            raise ValueError(msg)
        else:
            pass

    if backend_str == WX or (backend_str is None and not HAVE_BACKEND):
        if load_wx():
            HAVE_BACKEND = True
            BACKEND_MODULE = 'wx'
            log.info("backend loaded: {0}".format(BACKEND_MODULE))
            return BACKEND_MODULE
        elif backend_str == WX and not HAVE_BACKEND:
            msg = "{0} backend could not be loaded".format(backend_str)
            log.exception(msg)
            raise ValueError(msg)
        else:
            pass

    if not HAVE_BACKEND:
        raise ImportError("No compliant GUI library could be imported.\n"
                          "Either PyQt5, PyQt4, PySide2, PySide, or wxPython "
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
        informs the user to call `load_backend` or that no Qt python module
        ( PyQt5, PyQt4 or PySide ) is found

    """
    if not HAVE_BACKEND:
        raise ValueError("no backend has been imported yet with "
                         "``load_backend``... ")

    if HAVE_PYQT5 or HAVE_PYQT4 or HAVE_PYSIDE2 or HAVE_PYSIDE:
        return QtCore, QtGui, QtWidgets, QtOpenGL
    elif HAVE_WX:
        raise ValueError("the Wx backend is already loaded")
    else:
        msg = ("no Qt backend is loaded, hence cannot return any modules\n"
               "either you havent got PyQt5, PyQt4, PySide2 or PySide installed\n"
               "or you havent yet loaded a backend with the "
               "`OCC.Display.backend.load_backend` function")
        raise ValueError(msg)
