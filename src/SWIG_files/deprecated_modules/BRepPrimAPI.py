import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.BRepPrimAPI is deprecated since pythonocc-0.18.2. Use OCC.Core.BRepPrimAPI", DeprecationWarning)

from OCC.Core.BRepPrimAPI import *
