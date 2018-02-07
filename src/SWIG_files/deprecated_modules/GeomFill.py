import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.GeomFill is deprecated since pythonocc-0.18.2. Use OCC.Core.GeomFill", DeprecationWarning)

from OCC.Core.GeomFill import *
