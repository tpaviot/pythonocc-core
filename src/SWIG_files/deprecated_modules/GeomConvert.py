import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.GeomConvert is deprecated since pythonocc-0.18.2. Use OCC.Core.GeomConvert", DeprecationWarning)

from OCC.Core.GeomConvert import *
