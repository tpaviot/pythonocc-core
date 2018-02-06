import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.CPnts is deprecated since pythonocc-0.18.2. Use OCC.Core.CPnts", DeprecationWarning)

from OCC.Core.CPnts import *
