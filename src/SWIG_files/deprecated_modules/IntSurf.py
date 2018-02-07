import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.IntSurf is deprecated since pythonocc-0.18.2. Use OCC.Core.IntSurf", DeprecationWarning)

from OCC.Core.IntSurf import *
