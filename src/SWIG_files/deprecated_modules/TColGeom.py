import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.TColGeom is deprecated since pythonocc-0.18.2. Use OCC.Core.TColGeom", DeprecationWarning)

from OCC.Core.TColGeom import *
