import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.Adaptor2d is deprecated since pythonocc-0.18.2. Use OCC.Core.Adaptor2d", DeprecationWarning)

from OCC.Core.Adaptor2d import *
