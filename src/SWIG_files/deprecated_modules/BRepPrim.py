import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.BRepPrim is deprecated since pythonocc-0.18.2. Use OCC.Core.BRepPrim", DeprecationWarning)

from OCC.Core.BRepPrim import *
