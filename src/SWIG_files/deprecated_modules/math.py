import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.math is deprecated since pythonocc-0.18.2. Use OCC.Core.math", DeprecationWarning)

from OCC.Core.math import *
