import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.CDF is deprecated since pythonocc-0.18.2. Use OCC.Core.CDF", DeprecationWarning)

from OCC.Core.CDF import *
