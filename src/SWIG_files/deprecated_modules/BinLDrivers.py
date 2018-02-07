import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.BinLDrivers is deprecated since pythonocc-0.18.2. Use OCC.Core.BinLDrivers", DeprecationWarning)

from OCC.Core.BinLDrivers import *
