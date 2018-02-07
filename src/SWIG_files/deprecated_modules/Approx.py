import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.Approx is deprecated since pythonocc-0.18.2. Use OCC.Core.Approx", DeprecationWarning)

from OCC.Core.Approx import *
