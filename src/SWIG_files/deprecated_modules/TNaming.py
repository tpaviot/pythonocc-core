import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.TNaming is deprecated since pythonocc-0.18.2. Use OCC.Core.TNaming", DeprecationWarning)

from OCC.Core.TNaming import *
