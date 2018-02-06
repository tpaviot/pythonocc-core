import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.TShort is deprecated since pythonocc-0.18.2. Use OCC.Core.TShort", DeprecationWarning)

from OCC.Core.TShort import *
