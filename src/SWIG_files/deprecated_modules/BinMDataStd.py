import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.BinMDataStd is deprecated since pythonocc-0.18.2. Use OCC.Core.BinMDataStd", DeprecationWarning)

from OCC.Core.BinMDataStd import *
