import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.BRepBuilderAPI is deprecated since pythonocc-0.18.2. Use OCC.Core.BRepBuilderAPI", DeprecationWarning)

from OCC.Core.BRepBuilderAPI import *
