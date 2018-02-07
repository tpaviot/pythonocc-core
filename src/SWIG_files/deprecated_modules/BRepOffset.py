import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.BRepOffset is deprecated since pythonocc-0.18.2. Use OCC.Core.BRepOffset", DeprecationWarning)

from OCC.Core.BRepOffset import *
