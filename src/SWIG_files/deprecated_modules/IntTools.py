import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.IntTools is deprecated since pythonocc-0.18.2. Use OCC.Core.IntTools", DeprecationWarning)

from OCC.Core.IntTools import *
