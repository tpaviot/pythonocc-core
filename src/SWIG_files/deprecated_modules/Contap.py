import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.Contap is deprecated since pythonocc-0.18.2. Use OCC.Core.Contap", DeprecationWarning)

from OCC.Core.Contap import *
