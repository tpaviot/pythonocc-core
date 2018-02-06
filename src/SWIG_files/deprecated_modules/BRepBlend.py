import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.BRepBlend is deprecated since pythonocc-0.18.2. Use OCC.Core.BRepBlend", DeprecationWarning)

from OCC.Core.BRepBlend import *
