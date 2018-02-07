import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.HLRBRep is deprecated since pythonocc-0.18.2. Use OCC.Core.HLRBRep", DeprecationWarning)

from OCC.Core.HLRBRep import *
