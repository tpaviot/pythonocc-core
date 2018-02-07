import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.Geom2dAdaptor is deprecated since pythonocc-0.18.2. Use OCC.Core.Geom2dAdaptor", DeprecationWarning)

from OCC.Core.Geom2dAdaptor import *
