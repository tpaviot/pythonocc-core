import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.BRepFilletAPI is deprecated since pythonocc-0.18.2. Use OCC.Core.BRepFilletAPI", DeprecationWarning)

from OCC.Core.BRepFilletAPI import *
