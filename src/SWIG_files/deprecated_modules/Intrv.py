import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.Intrv is deprecated since pythonocc-0.18.2. Use OCC.Core.Intrv", DeprecationWarning)

from OCC.Core.Intrv import *
