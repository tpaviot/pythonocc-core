import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.BRepProj is deprecated since pythonocc-0.18.2. Use OCC.Core.BRepProj", DeprecationWarning)

from OCC.Core.BRepProj import *
