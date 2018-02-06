import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.HatchGen is deprecated since pythonocc-0.18.2. Use OCC.Core.HatchGen", DeprecationWarning)

from OCC.Core.HatchGen import *
