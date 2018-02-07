import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.Aspect is deprecated since pythonocc-0.18.2. Use OCC.Core.Aspect", DeprecationWarning)

from OCC.Core.Aspect import *
