import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.Geom2dInt is deprecated since pythonocc-0.18.2. Use OCC.Core.Geom2dInt", DeprecationWarning)

from OCC.Core.Geom2dInt import *
