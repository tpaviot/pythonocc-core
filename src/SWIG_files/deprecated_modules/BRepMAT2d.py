import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.BRepMAT2d is deprecated since pythonocc-0.18.2. Use OCC.Core.BRepMAT2d", DeprecationWarning)

from OCC.Core.BRepMAT2d import *
