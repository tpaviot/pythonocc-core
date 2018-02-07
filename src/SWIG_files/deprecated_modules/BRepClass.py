import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.BRepClass is deprecated since pythonocc-0.18.2. Use OCC.Core.BRepClass", DeprecationWarning)

from OCC.Core.BRepClass import *
