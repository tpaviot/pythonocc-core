import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.Geom2dAPI is deprecated since pythonocc-0.18.2. Use OCC.Core.Geom2dAPI", DeprecationWarning)

from OCC.Core.Geom2dAPI import *
