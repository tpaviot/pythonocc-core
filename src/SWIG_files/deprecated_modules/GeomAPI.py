import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.GeomAPI is deprecated since pythonocc-0.18.2. Use OCC.Core.GeomAPI", DeprecationWarning)

from OCC.Core.GeomAPI import *
