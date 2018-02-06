import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.BRepCheck is deprecated since pythonocc-0.18.2. Use OCC.Core.BRepCheck", DeprecationWarning)

from OCC.Core.BRepCheck import *
