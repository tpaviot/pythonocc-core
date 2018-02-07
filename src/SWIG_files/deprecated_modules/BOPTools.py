import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.BOPTools is deprecated since pythonocc-0.18.2. Use OCC.Core.BOPTools", DeprecationWarning)

from OCC.Core.BOPTools import *
