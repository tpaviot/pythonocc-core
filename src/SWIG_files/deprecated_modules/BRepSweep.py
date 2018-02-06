import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.BRepSweep is deprecated since pythonocc-0.18.2. Use OCC.Core.BRepSweep", DeprecationWarning)

from OCC.Core.BRepSweep import *
