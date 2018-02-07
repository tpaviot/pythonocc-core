import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.Draft is deprecated since pythonocc-0.18.2. Use OCC.Core.Draft", DeprecationWarning)

from OCC.Core.Draft import *
