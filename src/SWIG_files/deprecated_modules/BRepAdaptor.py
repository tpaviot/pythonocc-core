import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.BRepAdaptor is deprecated since pythonocc-0.18.2. Use OCC.Core.BRepAdaptor", DeprecationWarning)

from OCC.Core.BRepAdaptor import *
