import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.VrmlData is deprecated since pythonocc-0.18.2. Use OCC.Core.VrmlData", DeprecationWarning)

from OCC.Core.VrmlData import *
