import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.BinDrivers is deprecated since pythonocc-0.18.2. Use OCC.Core.BinDrivers", DeprecationWarning)

from OCC.Core.BinDrivers import *
