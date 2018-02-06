import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.RWStl is deprecated since pythonocc-0.18.2. Use OCC.Core.RWStl", DeprecationWarning)

from OCC.Core.RWStl import *
