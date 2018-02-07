import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.Hatch is deprecated since pythonocc-0.18.2. Use OCC.Core.Hatch", DeprecationWarning)

from OCC.Core.Hatch import *
