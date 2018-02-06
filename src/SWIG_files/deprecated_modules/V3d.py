import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.V3d is deprecated since pythonocc-0.18.2. Use OCC.Core.V3d", DeprecationWarning)

from OCC.Core.V3d import *
