import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.XSControl is deprecated since pythonocc-0.18.2. Use OCC.Core.XSControl", DeprecationWarning)

from OCC.Core.XSControl import *
