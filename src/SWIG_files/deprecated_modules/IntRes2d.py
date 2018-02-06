import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.IntRes2d is deprecated since pythonocc-0.18.2. Use OCC.Core.IntRes2d", DeprecationWarning)

from OCC.Core.IntRes2d import *
