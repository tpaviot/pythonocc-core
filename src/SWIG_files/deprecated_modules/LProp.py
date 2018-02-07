import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.LProp is deprecated since pythonocc-0.18.2. Use OCC.Core.LProp", DeprecationWarning)

from OCC.Core.LProp import *
