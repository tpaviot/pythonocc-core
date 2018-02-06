import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.TCollection is deprecated since pythonocc-0.18.2. Use OCC.Core.TCollection", DeprecationWarning)

from OCC.Core.TCollection import *
