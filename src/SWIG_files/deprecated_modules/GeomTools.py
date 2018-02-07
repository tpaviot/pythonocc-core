import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.GeomTools is deprecated since pythonocc-0.18.2. Use OCC.Core.GeomTools", DeprecationWarning)

from OCC.Core.GeomTools import *
