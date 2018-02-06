import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.Interface is deprecated since pythonocc-0.18.2. Use OCC.Core.Interface", DeprecationWarning)

from OCC.Core.Interface import *
