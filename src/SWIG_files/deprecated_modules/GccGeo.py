import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.GccGeo is deprecated since pythonocc-0.18.2. Use OCC.Core.GccGeo", DeprecationWarning)

from OCC.Core.GccGeo import *
