import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.Message is deprecated since pythonocc-0.18.2. Use OCC.Core.Message", DeprecationWarning)

from OCC.Core.Message import *
