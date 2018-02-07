import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.GCE2d is deprecated since pythonocc-0.18.2. Use OCC.Core.GCE2d", DeprecationWarning)

from OCC.Core.GCE2d import *
