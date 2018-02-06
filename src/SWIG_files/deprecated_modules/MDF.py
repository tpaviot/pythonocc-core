import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.MDF is deprecated since pythonocc-0.18.2. Use OCC.Core.MDF", DeprecationWarning)

from OCC.Core.MDF import *
