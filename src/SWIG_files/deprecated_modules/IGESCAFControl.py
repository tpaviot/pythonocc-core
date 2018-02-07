import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.IGESCAFControl is deprecated since pythonocc-0.18.2. Use OCC.Core.IGESCAFControl", DeprecationWarning)

from OCC.Core.IGESCAFControl import *
