import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.HLRAlgo is deprecated since pythonocc-0.18.2. Use OCC.Core.HLRAlgo", DeprecationWarning)

from OCC.Core.HLRAlgo import *
