import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.STEPControl is deprecated since pythonocc-0.18.2. Use OCC.Core.STEPControl", DeprecationWarning)

from OCC.Core.STEPControl import *
