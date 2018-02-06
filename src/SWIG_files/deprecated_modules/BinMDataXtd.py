import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.BinMDataXtd is deprecated since pythonocc-0.18.2. Use OCC.Core.BinMDataXtd", DeprecationWarning)

from OCC.Core.BinMDataXtd import *
