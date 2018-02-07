import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.VrmlConverter is deprecated since pythonocc-0.18.2. Use OCC.Core.VrmlConverter", DeprecationWarning)

from OCC.Core.VrmlConverter import *
