import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.ProjLib is deprecated since pythonocc-0.18.2. Use OCC.Core.ProjLib", DeprecationWarning)

from OCC.Core.ProjLib import *
