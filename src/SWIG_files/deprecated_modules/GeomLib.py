import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.GeomLib is deprecated since pythonocc-0.18.2. Use OCC.Core.GeomLib", DeprecationWarning)

from OCC.Core.GeomLib import *
