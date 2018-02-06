import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.BRepFill is deprecated since pythonocc-0.18.2. Use OCC.Core.BRepFill", DeprecationWarning)

from OCC.Core.BRepFill import *
