import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.STEPCAFControl is deprecated since pythonocc-0.18.2. Use OCC.Core.STEPCAFControl", DeprecationWarning)

from OCC.Core.STEPCAFControl import *
