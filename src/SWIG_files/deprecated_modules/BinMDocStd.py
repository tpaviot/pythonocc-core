import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.BinMDocStd is deprecated since pythonocc-0.18.2. Use OCC.Core.BinMDocStd", DeprecationWarning)

from OCC.Core.BinMDocStd import *
