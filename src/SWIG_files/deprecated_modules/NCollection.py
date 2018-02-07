import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.NCollection is deprecated since pythonocc-0.18.2. Use OCC.Core.NCollection", DeprecationWarning)

from OCC.Core.NCollection import *
