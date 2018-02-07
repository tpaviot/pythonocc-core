import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.BRepLProp is deprecated since pythonocc-0.18.2. Use OCC.Core.BRepLProp", DeprecationWarning)

from OCC.Core.BRepLProp import *
