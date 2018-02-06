import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.BinXCAFDrivers is deprecated since pythonocc-0.18.2. Use OCC.Core.BinXCAFDrivers", DeprecationWarning)

from OCC.Core.BinXCAFDrivers import *
