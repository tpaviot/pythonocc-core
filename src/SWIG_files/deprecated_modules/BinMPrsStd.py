import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.BinMPrsStd is deprecated since pythonocc-0.18.2. Use OCC.Core.BinMPrsStd", DeprecationWarning)

from OCC.Core.BinMPrsStd import *
