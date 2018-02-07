import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.BinMXCAFDoc is deprecated since pythonocc-0.18.2. Use OCC.Core.BinMXCAFDoc", DeprecationWarning)

from OCC.Core.BinMXCAFDoc import *
