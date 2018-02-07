import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.IGESControl is deprecated since pythonocc-0.18.2. Use OCC.Core.IGESControl", DeprecationWarning)

from OCC.Core.IGESControl import *
