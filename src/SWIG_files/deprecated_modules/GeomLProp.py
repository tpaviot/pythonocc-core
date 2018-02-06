import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.GeomLProp is deprecated since pythonocc-0.18.2. Use OCC.Core.GeomLProp", DeprecationWarning)

from OCC.Core.GeomLProp import *
