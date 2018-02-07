import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.GC is deprecated since pythonocc-0.18.2. Use OCC.Core.GC", DeprecationWarning)

from OCC.Core.GC import *
