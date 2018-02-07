import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.PDF is deprecated since pythonocc-0.18.2. Use OCC.Core.PDF", DeprecationWarning)

from OCC.Core.PDF import *
