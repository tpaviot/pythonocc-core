import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.MMgt is deprecated since pythonocc-0.18.2. Use OCC.Core.MMgt", DeprecationWarning)

from OCC.Core.MMgt import *
