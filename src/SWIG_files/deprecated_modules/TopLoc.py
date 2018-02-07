import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.TopLoc is deprecated since pythonocc-0.18.2. Use OCC.Core.TopLoc", DeprecationWarning)

from OCC.Core.TopLoc import *
