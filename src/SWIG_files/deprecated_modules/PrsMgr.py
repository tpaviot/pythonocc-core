import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.PrsMgr is deprecated since pythonocc-0.18.2. Use OCC.Core.PrsMgr", DeprecationWarning)

from OCC.Core.PrsMgr import *
