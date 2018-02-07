import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.MAT2d is deprecated since pythonocc-0.18.2. Use OCC.Core.MAT2d", DeprecationWarning)

from OCC.Core.MAT2d import *
