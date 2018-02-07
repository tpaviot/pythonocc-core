import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.BRepTopAdaptor is deprecated since pythonocc-0.18.2. Use OCC.Core.BRepTopAdaptor", DeprecationWarning)

from OCC.Core.BRepTopAdaptor import *
