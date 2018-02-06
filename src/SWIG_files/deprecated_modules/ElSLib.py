import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.ElSLib is deprecated since pythonocc-0.18.2. Use OCC.Core.ElSLib", DeprecationWarning)

from OCC.Core.ElSLib import *
