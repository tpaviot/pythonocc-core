import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.BOPDS is deprecated since pythonocc-0.18.2. Use OCC.Core.BOPDS", DeprecationWarning)

from OCC.Core.BOPDS import *
