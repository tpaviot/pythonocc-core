import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.GeomProjLib is deprecated since pythonocc-0.18.2. Use OCC.Core.GeomProjLib", DeprecationWarning)

from OCC.Core.GeomProjLib import *
