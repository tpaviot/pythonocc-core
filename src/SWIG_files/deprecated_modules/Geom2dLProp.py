import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.Geom2dLProp is deprecated since pythonocc-0.18.2. Use OCC.Core.Geom2dLProp", DeprecationWarning)

from OCC.Core.Geom2dLProp import *
