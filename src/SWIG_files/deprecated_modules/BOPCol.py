import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.BOPCol is deprecated since pythonocc-0.18.2. Use OCC.Core.BOPCol", DeprecationWarning)

from OCC.Core.BOPCol import *
