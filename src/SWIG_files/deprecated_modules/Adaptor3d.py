import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.Adaptor3d is deprecated since pythonocc-0.18.2. Use OCC.Core.Adaptor3d", DeprecationWarning)

from OCC.Core.Adaptor3d import *
