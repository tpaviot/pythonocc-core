import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.BRepClass3d is deprecated since pythonocc-0.18.2. Use OCC.Core.BRepClass3d", DeprecationWarning)

from OCC.Core.BRepClass3d import *
