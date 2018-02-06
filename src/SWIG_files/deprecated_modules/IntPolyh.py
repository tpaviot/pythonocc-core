import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.IntPolyh is deprecated since pythonocc-0.18.2. Use OCC.Core.IntPolyh", DeprecationWarning)

from OCC.Core.IntPolyh import *
