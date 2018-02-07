import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.TopAbs is deprecated since pythonocc-0.18.2. Use OCC.Core.TopAbs", DeprecationWarning)

from OCC.Core.TopAbs import *
