import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.Poly is deprecated since pythonocc-0.18.2. Use OCC.Core.Poly", DeprecationWarning)

from OCC.Core.Poly import *
