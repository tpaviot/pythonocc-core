import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.GeomAbs is deprecated since pythonocc-0.18.2. Use OCC.Core.GeomAbs", DeprecationWarning)

from OCC.Core.GeomAbs import *
