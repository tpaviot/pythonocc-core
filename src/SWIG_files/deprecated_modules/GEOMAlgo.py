import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.GEOMAlgo is deprecated since pythonocc-0.18.2. Use OCC.Core.GEOMAlgo", DeprecationWarning)

from OCC.Core.GEOMAlgo import *
