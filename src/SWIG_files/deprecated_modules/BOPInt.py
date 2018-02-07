import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.BOPInt is deprecated since pythonocc-0.18.2. Use OCC.Core.BOPInt", DeprecationWarning)

from OCC.Core.BOPInt import *
