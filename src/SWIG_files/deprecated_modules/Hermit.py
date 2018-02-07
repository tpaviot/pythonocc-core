import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.Hermit is deprecated since pythonocc-0.18.2. Use OCC.Core.Hermit", DeprecationWarning)

from OCC.Core.Hermit import *
