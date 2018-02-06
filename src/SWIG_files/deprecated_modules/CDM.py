import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.CDM is deprecated since pythonocc-0.18.2. Use OCC.Core.CDM", DeprecationWarning)

from OCC.Core.CDM import *
