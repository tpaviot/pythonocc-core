import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.BinMDF is deprecated since pythonocc-0.18.2. Use OCC.Core.BinMDF", DeprecationWarning)

from OCC.Core.BinMDF import *
