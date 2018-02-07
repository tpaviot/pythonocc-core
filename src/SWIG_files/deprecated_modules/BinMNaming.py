import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.BinMNaming is deprecated since pythonocc-0.18.2. Use OCC.Core.BinMNaming", DeprecationWarning)

from OCC.Core.BinMNaming import *
