import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.LDOM is deprecated since pythonocc-0.18.2. Use OCC.Core.LDOM", DeprecationWarning)

from OCC.Core.LDOM import *
