import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.GCPnts is deprecated since pythonocc-0.18.2. Use OCC.Core.GCPnts", DeprecationWarning)

from OCC.Core.GCPnts import *
