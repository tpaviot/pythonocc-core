import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.HLRTopoBRep is deprecated since pythonocc-0.18.2. Use OCC.Core.HLRTopoBRep", DeprecationWarning)

from OCC.Core.HLRTopoBRep import *
