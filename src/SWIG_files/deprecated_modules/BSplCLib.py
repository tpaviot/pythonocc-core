import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.BSplCLib is deprecated since pythonocc-0.18.2. Use OCC.Core.BSplCLib", DeprecationWarning)

from OCC.Core.BSplCLib import *
