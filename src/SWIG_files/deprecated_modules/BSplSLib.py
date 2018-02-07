import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.BSplSLib is deprecated since pythonocc-0.18.2. Use OCC.Core.BSplSLib", DeprecationWarning)

from OCC.Core.BSplSLib import *
