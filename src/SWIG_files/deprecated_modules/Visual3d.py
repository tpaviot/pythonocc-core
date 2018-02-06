import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.Visual3d is deprecated since pythonocc-0.18.2. Use OCC.Core.Visual3d", DeprecationWarning)

from OCC.Core.Visual3d import *
