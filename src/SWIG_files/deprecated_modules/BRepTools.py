import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.BRepTools is deprecated since pythonocc-0.18.2. Use OCC.Core.BRepTools", DeprecationWarning)

from OCC.Core.BRepTools import *
