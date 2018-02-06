import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.GeomAdaptor is deprecated since pythonocc-0.18.2. Use OCC.Core.GeomAdaptor", DeprecationWarning)

from OCC.Core.GeomAdaptor import *
