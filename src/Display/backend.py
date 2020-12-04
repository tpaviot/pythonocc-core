import logging

# backend constants
WX = "wx"
PYSIDE2 = "qt-pyside2"
PYQT5 = "qt-pyqt5"

# backend module
HAVE_PYQT5, HAVE_PYSIDE2, HAVE_WX = False, False, False

# is any backend imported?
HAVE_BACKEND = False
BACKEND_MODULE = "No backend loaded"

log = logging.getLogger(__name__)
log.setLevel(logging.DEBUG)


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
    PyQt5, then PySide2. Raise an exception if none of them are available
    """
    pyqt5_loaded = False
    # by default, load PyQt5
    pyqt5_loaded = load_backend(PYQT5)
    if not pyqt5_loaded:
        pyside2_loaded = load_backend(PYSIDE2)
    if not (pyqt5_loaded or pyside2_loaded):
        raise AssertionError("None of the PyQt5 or PySide2 can be loaded")
    else:
        return True


def load_backend(backend_str=None):
    """ loads a gui backend

    If no Qt backend is found (PyQt5 or PySide), wx is loaded

    The search order for pythonocc compatible gui modules is:
        PyQt5, PySide2, wx

    Note
    ----
    wx is imported when no Qt backend is found.

    Parameters
    ----------
    backend_str : str

        specifies which backend to load

        backend_str is one of ( "qt-pyqt5", "qt-pyside2", "wx" )

        if no value has been set, load the first module in gui module search
        order

    Returns
    -------
    str
        the name of the loaded backend
        one of ( "qt-pyqt5", "qt-pyside2", "wx" )

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
        compatible_backends = (PYQT5, PYSIDE2, WX)
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

    if not HAVE_BACKEND:
        raise ImportError("No compliant GUI library could be imported.\n"
                          "Either PyQt5, PPySide2 or wxPython is required")


def get_qt_modules():
    """

    Returns
    -------
    tuple : ( QtCore, QtGui, QtWidgets, QtOpenGL )
        here QtWidgets shadows QtGui when a PySide module is loaded
        this is the most coherent way to get PyQt5 compliant code

    Raises
    ------

    ValueError
        when no Qt backend has been yet loaded
        informs the user to call `load_backend` or that no Qt python module
        ( PyQt5, PySide ) is found

    """
    if not HAVE_BACKEND:
        raise ValueError("no backend has been imported yet with "
                         "``load_backend``... ")

    if HAVE_PYQT5 or HAVE_PYSIDE2:
        return QtCore, QtGui, QtWidgets, QtOpenGL
    elif HAVE_WX:
        raise ValueError("the Wx backend is already loaded")
    else:
        msg = ("no Qt backend is loaded, hence cannot return any modules\n"
               "either you havent got PyQt5 or PySide2 installed\n"
               "or you havent yet loaded a backend with the "
               "`OCC.Display.backend.load_backend` function")
        raise ValueError(msg)
