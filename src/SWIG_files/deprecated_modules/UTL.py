import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.UTL is deprecated since pythonocc-0.18.2. Use OCC.Core.UTL", DeprecationWarning)

from OCC.Core.UTL import *
