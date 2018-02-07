import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.BRep is deprecated since pythonocc-0.18.2. Use OCC.Core.BRep", DeprecationWarning)

from OCC.Core.BRep import *
