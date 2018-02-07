import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.BRepOffsetAPI is deprecated since pythonocc-0.18.2. Use OCC.Core.BRepOffsetAPI", DeprecationWarning)

from OCC.Core.BRepOffsetAPI import *
