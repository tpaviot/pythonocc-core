import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.CSLib is deprecated since pythonocc-0.18.2. Use OCC.Core.CSLib", DeprecationWarning)

from OCC.Core.CSLib import *
