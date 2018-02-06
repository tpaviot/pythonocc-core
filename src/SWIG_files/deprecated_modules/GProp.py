import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.GProp is deprecated since pythonocc-0.18.2. Use OCC.Core.GProp", DeprecationWarning)

from OCC.Core.GProp import *
