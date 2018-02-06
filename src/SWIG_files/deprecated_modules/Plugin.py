import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.Plugin is deprecated since pythonocc-0.18.2. Use OCC.Core.Plugin", DeprecationWarning)

from OCC.Core.Plugin import *
