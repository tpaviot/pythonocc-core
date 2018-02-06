import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.MAT is deprecated since pythonocc-0.18.2. Use OCC.Core.MAT", DeprecationWarning)

from OCC.Core.MAT import *
