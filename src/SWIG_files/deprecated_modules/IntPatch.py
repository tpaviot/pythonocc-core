import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.IntPatch is deprecated since pythonocc-0.18.2. Use OCC.Core.IntPatch", DeprecationWarning)

from OCC.Core.IntPatch import *
