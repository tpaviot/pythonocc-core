import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.Bnd is deprecated since pythonocc-0.18.2. Use OCC.Core.Bnd", DeprecationWarning)

from OCC.Core.Bnd import *
