import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.BRepLib is deprecated since pythonocc-0.18.2. Use OCC.Core.BRepLib", DeprecationWarning)

from OCC.Core.BRepLib import *
