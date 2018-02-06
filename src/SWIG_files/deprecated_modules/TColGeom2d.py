import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.TColGeom2d is deprecated since pythonocc-0.18.2. Use OCC.Core.TColGeom2d", DeprecationWarning)

from OCC.Core.TColGeom2d import *
