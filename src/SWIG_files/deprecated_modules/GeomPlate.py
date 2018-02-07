import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.GeomPlate is deprecated since pythonocc-0.18.2. Use OCC.Core.GeomPlate", DeprecationWarning)

from OCC.Core.GeomPlate import *
