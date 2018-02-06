import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.AppBlend is deprecated since pythonocc-0.18.2. Use OCC.Core.AppBlend", DeprecationWarning)

from OCC.Core.AppBlend import *
