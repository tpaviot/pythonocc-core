import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.TDF is deprecated since pythonocc-0.18.2. Use OCC.Core.TDF", DeprecationWarning)

from OCC.Core.TDF import *
