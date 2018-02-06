import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.BiTgte is deprecated since pythonocc-0.18.2. Use OCC.Core.BiTgte", DeprecationWarning)

from OCC.Core.BiTgte import *
