import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.HLRAppli is deprecated since pythonocc-0.18.2. Use OCC.Core.HLRAppli", DeprecationWarning)

from OCC.Core.HLRAppli import *
