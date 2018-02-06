import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.Units is deprecated since pythonocc-0.18.2. Use OCC.Core.Units", DeprecationWarning)

from OCC.Core.Units import *
