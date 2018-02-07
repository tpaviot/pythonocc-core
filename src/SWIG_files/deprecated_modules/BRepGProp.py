import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.BRepGProp is deprecated since pythonocc-0.18.2. Use OCC.Core.BRepGProp", DeprecationWarning)

from OCC.Core.BRepGProp import *
