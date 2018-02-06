import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.MNaming is deprecated since pythonocc-0.18.2. Use OCC.Core.MNaming", DeprecationWarning)

from OCC.Core.MNaming import *
