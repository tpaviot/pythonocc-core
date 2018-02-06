import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.Sweep is deprecated since pythonocc-0.18.2. Use OCC.Core.Sweep", DeprecationWarning)

from OCC.Core.Sweep import *
