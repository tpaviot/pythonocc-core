import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.GccInt is deprecated since pythonocc-0.18.2. Use OCC.Core.GccInt", DeprecationWarning)

from OCC.Core.GccInt import *
