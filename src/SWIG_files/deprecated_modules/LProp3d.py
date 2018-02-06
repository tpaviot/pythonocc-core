import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.LProp3d is deprecated since pythonocc-0.18.2. Use OCC.Core.LProp3d", DeprecationWarning)

from OCC.Core.LProp3d import *
