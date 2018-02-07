import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.VrmlAPI is deprecated since pythonocc-0.18.2. Use OCC.Core.VrmlAPI", DeprecationWarning)

from OCC.Core.VrmlAPI import *
