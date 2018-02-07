import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.Precision is deprecated since pythonocc-0.18.2. Use OCC.Core.Precision", DeprecationWarning)

from OCC.Core.Precision import *
