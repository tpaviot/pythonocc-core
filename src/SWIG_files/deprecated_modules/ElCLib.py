import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.ElCLib is deprecated since pythonocc-0.18.2. Use OCC.Core.ElCLib", DeprecationWarning)

from OCC.Core.ElCLib import *
