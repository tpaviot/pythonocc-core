import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.ApproxInt is deprecated since pythonocc-0.18.2. Use OCC.Core.ApproxInt", DeprecationWarning)

from OCC.Core.ApproxInt import *
