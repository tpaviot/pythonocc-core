import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.BinMFunction is deprecated since pythonocc-0.18.2. Use OCC.Core.BinMFunction", DeprecationWarning)

from OCC.Core.BinMFunction import *
