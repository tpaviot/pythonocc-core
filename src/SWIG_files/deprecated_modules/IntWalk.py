import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.IntWalk is deprecated since pythonocc-0.18.2. Use OCC.Core.IntWalk", DeprecationWarning)

from OCC.Core.IntWalk import *
