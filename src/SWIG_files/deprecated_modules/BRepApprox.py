import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.BRepApprox is deprecated since pythonocc-0.18.2. Use OCC.Core.BRepApprox", DeprecationWarning)

from OCC.Core.BRepApprox import *
