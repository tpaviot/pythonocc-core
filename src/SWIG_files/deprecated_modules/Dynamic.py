import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.Dynamic is deprecated since pythonocc-0.18.2. Use OCC.Core.Dynamic", DeprecationWarning)

from OCC.Core.Dynamic import *
